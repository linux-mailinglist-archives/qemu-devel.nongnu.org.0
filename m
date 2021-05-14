Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E3380A29
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:07:55 +0200 (CEST)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXXm-0002Vn-4o
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <lawrence@lawrence-XPS-15-9560.loongson.cn>)
 id 1lhSpd-0002IY-NU
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:06:01 -0400
Received: from [114.242.206.180] (port=33226
 helo=lawrence-XPS-15-9560.loongson.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <lawrence@lawrence-XPS-15-9560.loongson.cn>)
 id 1lhSpb-0004P7-R7
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:06:01 -0400
Received: by lawrence-XPS-15-9560.loongson.cn (Postfix, from userid 1000)
 id CEA1D120FFE; Fri, 14 May 2021 15:56:58 +0800 (CST)
From: Xu Zou <sendtozouxu@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386
Date: Fri, 14 May 2021 15:56:40 +0800
Message-Id: <20210514075640.110544-1-sendtozouxu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 114.242.206.180 (failed)
Received-SPF: none client-ip=114.242.206.180;
 envelope-from=lawrence@lawrence-XPS-15-9560.loongson.cn;
 helo=lawrence-XPS-15-9560.loongson.cn
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NML_ADSP_CUSTOM_MED=0.9,
 NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 SPOOFED_FREEMAIL=0.825, SPOOFED_FREEMAIL_NO_RDNS=0.001,
 SPOOF_GMAIL_MID=1.498 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 May 2021 09:01:35 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu, Xu Zou <sendtozouxu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle EXCP10_COPR properly for i386 in cpu loop.

NE flag is set to select native mode for handling floating-point
exceptions. FWAIT instruction can raise EXCP10_COPR exception by using
fpu_raise_exception() function.

The code is based on kernel's function fpu__exception_code() in
arch/x86/kernel/fpu/core.c.

Signed-off-by: Xu Zou <sendtozouxu@gmail.com>
---
 linux-user/i386/cpu_loop.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294..e1f2911554 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -199,6 +199,8 @@ void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
+    int si_code;
+    uint8_t status;
     abi_ulong pc;
     abi_ulong ret;
 
@@ -315,6 +317,28 @@ void cpu_loop(CPUX86State *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP10_COPR:
+            si_code = 0;
+            status = env->fp_status.float_exception_flags;
+            if (status & float_flag_invalid) {
+                si_code = TARGET_FPE_FLTINV;
+            }
+            if (status & float_flag_divbyzero) {
+                si_code = TARGET_FPE_FLTDIV;
+            }
+            if (status & float_flag_overflow) {
+                si_code = TARGET_FPE_FLTOVF;
+            }
+            if ((status & float_flag_underflow) ||
+                (status & float_flag_input_denormal) ||
+                (status & float_flag_output_denormal)) {
+                si_code = TARGET_FPE_FLTUND;
+            }
+            if (status & float_flag_inexact) {
+                si_code = TARGET_FPE_FLTRES;
+            }
+            gen_signal(env, TARGET_SIGFPE, si_code, env->eip);
+            break;
         default:
             pc = env->segs[R_CS].base + env->eip;
             EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
@@ -327,7 +351,7 @@ void cpu_loop(CPUX86State *env)
 
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
-    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
+    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK | CR0_NE_MASK;
     env->hflags |= HF_PE_MASK | HF_CPL_MASK;
     if (env->features[FEAT_1_EDX] & CPUID_SSE) {
         env->cr[4] |= CR4_OSFXSR_MASK;
-- 
2.25.1


