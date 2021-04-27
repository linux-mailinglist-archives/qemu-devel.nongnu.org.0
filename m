Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5E36CA4F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:25:39 +0200 (CEST)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRSr-0005oX-NU
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLk-0001Wf-Iv; Tue, 27 Apr 2021 13:18:16 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLi-00023I-8n; Tue, 27 Apr 2021 13:18:16 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9ED0D80139F;
 Tue, 27 Apr 2021 14:16:52 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 04/15] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
Date: Tue, 27 Apr 2021 14:16:38 -0300
Message-Id: <20210427171649.364699-5-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:52.0870 (UTC)
 FILETIME=[1DE31A60:01D73B89]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are other valid settings for is_jmp besides
DISAS_NEXT and DISAS_NORETURN, so eliminating that
dichotomy from ppc_tr_translate_insn is helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/translate.c          | 65 ++++++++++++++++-----------------
 target/ppc/translate_init.c.inc | 42 ++++++++++-----------
 2 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index ebe5afe7ae..46de2dab27 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -263,6 +263,7 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
     tcg_temp_free_i32(t0);
     tcg_temp_free_i32(t1);
     ctx->exception = (excp);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception(DisasContext *ctx, uint32_t excp)
@@ -280,6 +281,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
     ctx->exception = (excp);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
@@ -292,6 +294,7 @@ static void gen_exception_nip(DisasContext *ctx, uint32_t excp,
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
     ctx->exception = (excp);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 /*
@@ -337,6 +340,7 @@ static void gen_debug_exception(DisasContext *ctx)
     t0 = tcg_const_i32(EXCP_DEBUG);
     gen_helper_raise_exception(cpu_env, t0);
     tcg_temp_free_i32(t0);
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 static inline void gen_inval_exception(DisasContext *ctx, uint32_t error)
@@ -357,20 +361,18 @@ static inline void gen_hvpriv_exception(DisasContext *ctx, uint32_t error)
 }
 
 /* Stop translation */
-static inline void gen_stop_exception(DisasContext *ctx)
+static inline void gen_end_tb_exception(DisasContext *ctx, uint32_t excp)
 {
-    gen_update_nip(ctx, ctx->base.pc_next);
-    ctx->exception = POWERPC_EXCP_STOP;
+    /* No need to update nip for SYNC/BRANCH, as execution flow will change */
+    if ((excp != POWERPC_EXCP_SYNC) &&
+        (excp != POWERPC_EXCP_BRANCH))
+    {
+        gen_update_nip(ctx, ctx->base.pc_next);
+    }
+    ctx->exception = excp;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-#ifndef CONFIG_USER_ONLY
-/* No need to update nip here, as execution flow will change */
-static inline void gen_sync_exception(DisasContext *ctx)
-{
-    ctx->exception = POWERPC_EXCP_SYNC;
-}
-#endif
-
 #define GEN_HANDLER(name, opc1, opc2, opc3, inval, type)                      \
 GEN_OPCODE(name, opc1, opc2, opc3, inval, type, PPC_NONE)
 
@@ -1863,7 +1865,7 @@ static void gen_darn(DisasContext *ctx)
             gen_helper_darn64(cpu_gpr[rD(ctx->opcode)]);
         }
         if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-            gen_stop_exception(ctx);
+            gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
         }
     }
 }
@@ -3159,7 +3161,7 @@ static void gen_isync(DisasContext *ctx)
         gen_check_tlb_flush(ctx, false);
     }
     tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
 }
 
 #define MEMOP_GET_SIZE(x)  (1 << ((x) & MO_SIZE))
@@ -3778,7 +3780,8 @@ static void gen_b(DisasContext *ctx)
 {
     target_ulong li, target;
 
-    ctx->exception = POWERPC_EXCP_BRANCH;
+    gen_end_tb_exception(ctx, POWERPC_EXCP_BRANCH);
+
     /* sign extend LI */
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
@@ -3804,7 +3807,8 @@ static void gen_bcond(DisasContext *ctx, int type)
     uint32_t bo = BO(ctx->opcode);
     TCGLabel *l1;
     TCGv target;
-    ctx->exception = POWERPC_EXCP_BRANCH;
+
+    gen_end_tb_exception(ctx, POWERPC_EXCP_BRANCH);
 
     if (type == BCOND_LR || type == BCOND_CTR || type == BCOND_TAR) {
         target = tcg_temp_local_new();
@@ -4011,7 +4015,7 @@ static void gen_rfi(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif
 }
 
@@ -4028,7 +4032,7 @@ static void gen_rfid(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif
 }
 
@@ -4045,7 +4049,7 @@ static void gen_rfscv(DisasContext *ctx)
     }
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif
 }
 #endif
@@ -4058,7 +4062,7 @@ static void gen_hrfid(DisasContext *ctx)
     /* Restore CPU state */
     CHK_HV;
     gen_helper_hrfid(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif
 }
 #endif
@@ -4444,7 +4448,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -4489,7 +4493,7 @@ static void gen_mtmsr(DisasContext *ctx)
         tcg_temp_free(msr);
     }
     /* Must stop the translation as machine state (may have) changed */
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
 #endif
 }
 
@@ -5944,7 +5948,7 @@ static void gen_rfsvc(DisasContext *ctx)
     CHK_SV;
 
     gen_helper_rfsvc(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6324,7 +6328,7 @@ static void gen_rfci_40x(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6336,7 +6340,7 @@ static void gen_rfci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6351,7 +6355,7 @@ static void gen_rfdi(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6364,7 +6368,7 @@ static void gen_rfmci(DisasContext *ctx)
     CHK_SV;
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
-    gen_sync_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_SYNC);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6626,7 +6630,7 @@ static void gen_wrtee(DisasContext *ctx)
      * Stop translation to have a chance to raise an exception if we
      * just set msr_ee to 1
      */
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
@@ -6640,7 +6644,7 @@ static void gen_wrteei(DisasContext *ctx)
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     } else {
         tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
     }
@@ -8037,7 +8041,6 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
     gen_debug_exception(ctx);
-    dcbase->is_jmp = DISAS_NORETURN;
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be properly
@@ -8067,7 +8070,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     ok = decode_legacy(cpu, ctx, insn);
     if (!ok) {
         gen_invalid(ctx);
-        ctx->base.is_jmp = DISAS_NORETURN;
     }
 
 #if defined(DO_PPC_STATISTICS)
@@ -8088,9 +8090,6 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                  "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
                  opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
     }
-
-    ctx->base.is_jmp = ctx->exception == POWERPC_EXCP_NONE ?
-        DISAS_NEXT : DISAS_NORETURN;
 }
 
 static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index c03a7c4f52..48c713be7e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -188,7 +188,7 @@ static void spr_read_decr(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_decr(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -199,7 +199,7 @@ static void spr_write_decr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_decr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 #endif
@@ -214,7 +214,7 @@ static void spr_read_tbl(DisasContext *ctx, int gprn, int sprn)
     gen_helper_load_tbl(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -226,7 +226,7 @@ static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
     gen_helper_load_tbu(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -251,7 +251,7 @@ static void spr_write_tbl(DisasContext *ctx, int sprn, int gprn)
     gen_helper_store_tbl(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -263,7 +263,7 @@ static void spr_write_tbu(DisasContext *ctx, int sprn, int gprn)
     gen_helper_store_tbu(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -288,7 +288,7 @@ static void spr_read_purr(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_purr(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -299,7 +299,7 @@ static void spr_write_purr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_purr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -312,7 +312,7 @@ static void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn)
     gen_helper_load_hdecr(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -324,7 +324,7 @@ static void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn)
     gen_helper_store_hdecr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_end();
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -335,7 +335,7 @@ static void spr_read_vtb(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_vtb(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -346,7 +346,7 @@ static void spr_write_vtb(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_vtb(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -357,7 +357,7 @@ static void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_tbu40(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -534,7 +534,7 @@ static void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn)
 {
     gen_helper_store_hid0_601(cpu_env, cpu_gpr[gprn]);
     /* Must stop the translation as endianness may have changed */
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
 }
 #endif
 
@@ -571,7 +571,7 @@ static void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn)
     }
     gen_helper_load_40x_pit(cpu_gpr[gprn], cpu_env);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -582,7 +582,7 @@ static void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_40x_pit(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -594,9 +594,9 @@ static void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn)
     gen_store_spr(sprn, cpu_gpr[gprn]);
     gen_helper_store_40x_dbcr0(cpu_env, cpu_gpr[gprn]);
     /* We must stop translation as we may have rebooted */
-    gen_stop_exception(ctx);
+    gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -607,7 +607,7 @@ static void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_40x_sler(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -618,7 +618,7 @@ static void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_booke_tcr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 
@@ -629,7 +629,7 @@ static void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn)
     }
     gen_helper_store_booke_tsr(cpu_env, cpu_gpr[gprn]);
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
-        gen_stop_exception(ctx);
+        gen_end_tb_exception(ctx, POWERPC_EXCP_STOP);
     }
 }
 #endif
-- 
2.25.1


