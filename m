Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA2392145
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:08:06 +0200 (CEST)
Received: from localhost ([::1]:57084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzoz-0003Rq-Hv
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf5-0004JG-PV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzf3-0006ZN-Ou
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:57:51 -0400
Received: from quad ([82.142.6.50]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MwQCb-1lTVVO2hfx-00sK6R; Wed, 26
 May 2021 21:57:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] target/m68k: implement m68k "any instruction" trace mode
Date: Wed, 26 May 2021 21:57:44 +0200
Message-Id: <20210526195744.227346-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526195744.227346-1-laurent@vivier.eu>
References: <20210526195744.227346-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eq05lylNytZybwASHhCEmYHtfWRiCeurrCPzkNlWUuj48QhQ/J8
 NVSpcB1mU0XTKaR33/KaAt+ZN7CCdDtc+9wD/GrV5Hxcq4VmxWfIzvhLXXrHCwVTpy+JryC
 tFoFGwbE8C75NRIdY90pE8P/X88YejXoHG4ZH22WX3nQqX1bzFO96NLuQ0bPL+/qo0+wLKg
 9VJU+mO5D2X4jZvuozIgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3m4Faw4t1jY=:4CQmkEwxK0g7fyBbHsI5I1
 3ydB2z9tGnyF4qCiIPXa45aWtUoARMrNec7Xh3IjEAeKw9AsNtnwkIzPeLhLPNuwSE+pZC2nl
 n8hhCSBKZLJgU91Ws39W+/BKiS0VC+Kk9D0yRPItvM8wiAK2uFd+mzyTpOfc75IvX/wVdBQux
 BnXrUNYpcWTmDrdd8wpWRajOlnqIOxFcKjXWkMSlO4Y95kcm2OxOQoTh8butjUGX1SiA+giRz
 DCGQr7U/KRjRjIFEWmxTIu9izYDbkcNjcH86avd5s4dGpLzoRKWF+YauIuW9dHoF0OD/HPk7p
 TFV97n0tOWx+kIrppqFWtvAsvOWMYkQa0AF19utMNXESmFS+IhGjEBXMfReTIRmXPc73DUYsK
 cxw2ZJk7JW2O+3lSK8pvehlruA2xGFU2dqPVYSn7RUGokbC0GhCrXEXJnwzIriUuT9kWcRJNA
 4PcyzhBH8Sw5wxrFeBFMHVngTytqITxyDryK9M4v2QCnvQZ2Cp3aC1DR3O5kBJzM0vaHzSMe4
 B9kiwrJcK3hn2SNPWqjalA=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The m68k trace mode is controlled by the top 2 bits in the SR register. Implement
the m68k "any instruction" trace mode where bit T1=1 and bit T0=0 in which the CPU
generates an EXCP_TRACE exception (vector 9 or offset 0x24) after executing each
instruction.

This functionality is used by the NetBSD kernel debugger to allow single-stepping
on m68k architectures.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210519142917.16693-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h       |  8 ++++++++
 target/m68k/translate.c | 27 ++++++++++++++++++++-------
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 402c86c8769e..997d588911c6 100644
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
index 10e8aba42e42..f0c5bf9154e0 100644
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
2.31.1


