Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0021A350D64
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:03:47 +0200 (CEST)
Received: from localhost ([::1]:33826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoYd-0005CS-1D
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP4-0001XN-9J
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:54 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP1-0004r5-Hg
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249231; x=1648785231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3hKpsbyQ93Bi8x4JLVZ8j0qbdAwrVPO+dOY7xl3rOo=;
 b=MS/GQiWlq7mWJEpBC/39+sd0uPiv50B8kMlBGYGTMSyPAATSAAk5RC7Y
 Sz5ACbUxR+gOhMkS1WzEjllqWkzwNkoLDNcXRsAuUy0XOmuTnVZ2t1nUl
 EO9CTJ1MvmKZ+sH5aM455gDTzFjL+vgJAnQKdjgvxykTrvWwtF8gDH0VI k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id DBA1717BB; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/21] Hexagon (target/hexagon) use env_archcpu and env_cpu
Date: Wed, 31 Mar 2021 22:53:15 -0500
Message-Id: <1617249213-22667-4-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove hexagon_env_get_cpu and replace with env_archcpu
Replace CPU(hexagon_env_get_cpu(env)) with env_cpu(env)

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 linux-user/hexagon/cpu_loop.c | 2 +-
 target/hexagon/cpu.c          | 4 ++--
 target/hexagon/cpu.h          | 5 -----
 target/hexagon/op_helper.c    | 2 +-
 target/hexagon/translate.c    | 2 +-
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 9a68ca0..bc34f5d 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -25,7 +25,7 @@
 
 void cpu_loop(CPUHexagonState *env)
 {
-    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     int trapnr, signum, sigcode;
     target_ulong sigaddr;
     target_ulong syscallnum;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index c2fe357..f044506 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -71,7 +71,7 @@ const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS] = {
  */
 static target_ulong adjust_stack_ptrs(CPUHexagonState *env, target_ulong addr)
 {
-    HexagonCPU *cpu = hexagon_env_get_cpu(env);
+    HexagonCPU *cpu = env_archcpu(env);
     target_ulong stack_adjust = cpu->lldb_stack_adjust;
     target_ulong stack_start = env->stack_start;
     target_ulong stack_size = 0x10000;
@@ -115,7 +115,7 @@ static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
 
 static void hexagon_dump(CPUHexagonState *env, FILE *f)
 {
-    HexagonCPU *cpu = hexagon_env_get_cpu(env);
+    HexagonCPU *cpu = env_archcpu(env);
 
     if (cpu->lldb_compat) {
         /*
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index e04eac5..2855dd3 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -127,11 +127,6 @@ typedef struct HexagonCPU {
     target_ulong lldb_stack_adjust;
 } HexagonCPU;
 
-static inline HexagonCPU *hexagon_env_get_cpu(CPUHexagonState *env)
-{
-    return container_of(env, HexagonCPU, env);
-}
-
 #include "cpu_bits.h"
 
 #define cpu_signal_handler cpu_hexagon_signal_handler
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 5d35dfc..7ac8554 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -35,7 +35,7 @@ static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
                                                  uint32_t exception,
                                                  uintptr_t pc)
 {
-    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
     qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
     cs->exception_index = exception;
     cpu_loop_exit_restore(cs, pc);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index f975d7a..e235fdb 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -585,7 +585,7 @@ static void hexagon_tr_translate_packet(DisasContextBase *dcbase, CPUState *cpu)
          * The CPU log is used to compare against LLDB single stepping,
          * so end the TLB after every packet.
          */
-        HexagonCPU *hex_cpu = hexagon_env_get_cpu(env);
+        HexagonCPU *hex_cpu = env_archcpu(env);
         if (hex_cpu->lldb_compat && qemu_loglevel_mask(CPU_LOG_TB_CPU)) {
             ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-- 
2.7.4


