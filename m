Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73661389123
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:36:53 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNJc-0003vK-JE
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCe-0000j4-LP
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37868
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCY-0008Jz-SZ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:40 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCW-0003Tz-Kz; Wed, 19 May 2021 15:29:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 19 May 2021 15:29:17 +0100
Message-Id: <20210519142917.16693-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/4] target/m68k: implement m68k "any instruction" trace mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The m68k trace mode is controlled by the top 2 bits in the SR register. Implement
the m68k "any instruction" trace mode where bit T1=1 and bit T0=0 in which the CPU
generates an EXCP_TRACE exception (vector 9 or offset 0x24) after executing each
instruction.

This functionality is used by the NetBSD kernel debugger to allow single-stepping
on m68k architectures.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.h       |  8 ++++++++
 target/m68k/translate.c | 27 ++++++++++++++++++++-------
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 402c86c876..997d588911 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -230,6 +230,9 @@ typedef enum {
 #define SR_T_SHIFT 14
 #define SR_T  0xc000
 
+#define M68K_SR_TRACE(sr) ((sr & SR_T) >> SR_T_SHIFT)
+#define M68K_SR_TRACE_ANY_INS 0x2
+
 #define M68K_SSP    0
 #define M68K_USP    1
 #define M68K_ISP    2
@@ -590,6 +593,8 @@ typedef M68kCPU ArchCPU;
 #define TB_FLAGS_SFC_S          (1 << TB_FLAGS_SFC_S_BIT)
 #define TB_FLAGS_DFC_S_BIT      15
 #define TB_FLAGS_DFC_S          (1 << TB_FLAGS_DFC_S_BIT)
+#define TB_FLAGS_TRACE          16
+#define TB_FLAGS_TRACE_BIT      (1 << TB_FLAGS_TRACE)
 
 static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
@@ -602,6 +607,9 @@ static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
         *flags |= (env->sfc << (TB_FLAGS_SFC_S_BIT - 2)) & TB_FLAGS_SFC_S;
         *flags |= (env->dfc << (TB_FLAGS_DFC_S_BIT - 2)) & TB_FLAGS_DFC_S;
     }
+    if (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS) {
+        *flags |= TB_FLAGS_TRACE;
+    }
 }
 
 void dump_mmu(CPUM68KState *env);
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 10e8aba42e..f0c5bf9154 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -124,6 +124,7 @@ typedef struct DisasContext {
 #define MAX_TO_RELEASE 8
     int release_count;
     TCGv release[MAX_TO_RELEASE];
+    bool ss_active;
 } DisasContext;
 
 static void init_release_array(DisasContext *s)
@@ -197,12 +198,13 @@ static void do_writebacks(DisasContext *s)
 static bool is_singlestepping(DisasContext *s)
 {
     /*
-     * Return true if we are singlestepping either because of QEMU gdbstub
-     * singlestep. This does not include the command line '-singlestep' mode
-     * which is rather misnamed as it only means "one instruction per TB" and
-     * doesn't affect the code we generate.
+     * Return true if we are singlestepping either because of
+     * architectural singlestep or QEMU gdbstub singlestep. This does
+     * not include the command line '-singlestep' mode which is rather
+     * misnamed as it only means "one instruction per TB" and doesn't
+     * affect the code we generate.
      */
-    return s->base.singlestep_enabled;
+    return s->base.singlestep_enabled || s->ss_active;
 }
 
 /* is_jmp field values */
@@ -323,9 +325,14 @@ static void gen_singlestep_exception(DisasContext *s)
 {
     /*
      * Generate the right kind of exception for singlestep, which is
-     * EXCP_DEBUG for QEMU's gdb singlestepping.
+     * either the architectural singlestep or EXCP_DEBUG for QEMU's
+     * gdb singlestepping.
      */
-    gen_raise_exception(EXCP_DEBUG);
+    if (s->ss_active) {
+        gen_raise_exception(EXCP_TRACE);
+    } else {
+        gen_raise_exception(EXCP_DEBUG);
+    }
 }
 
 static inline void gen_addr_fault(DisasContext *s)
@@ -6194,6 +6201,12 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->done_mac = 0;
     dc->writeback_mask = 0;
     init_release_array(dc);
+
+    dc->ss_active = (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS);
+    /* If architectural single step active, limit to 1 */
+    if (is_singlestepping(dc)) {
+        dc->base.max_insns = 1;
+    }
 }
 
 static void m68k_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.20.1


