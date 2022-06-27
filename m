Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0155B976
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 14:18:12 +0200 (CEST)
Received: from localhost ([::1]:49144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ngw-0000Zi-Ls
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 08:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5ncR-0005XO-0p; Mon, 27 Jun 2022 08:13:31 -0400
Received: from [200.168.210.66] (port=26430 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.coutinho@eldorado.org.br>)
 id 1o5ncN-0001dl-Pk; Mon, 27 Jun 2022 08:13:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 27 Jun 2022 08:56:13 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 95A308001D4;
 Mon, 27 Jun 2022 08:56:13 -0300 (-03)
From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Subject: [PATCH RESEND 01/11] target/ppc: receive DisasContext explicitly in
 GEN_PRIV
Date: Mon, 27 Jun 2022 08:54:14 -0300
Message-Id: <20220627115424.348073-2-lucas.coutinho@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
References: <20220627115424.348073-1-lucas.coutinho@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jun 2022 11:56:13.0982 (UTC)
 FILETIME=[E69743E0:01D88A1C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.coutinho@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

GEN_PRIV and related CHK_* macros just assumed that variable named
"ctx" would be in scope when they are used, and that it would be a
pointer to DisasContext. Change these macros to receive the pointer
explicitly.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
---
 target/ppc/translate.c             | 299 +++++++++++++++--------------
 target/ppc/translate/fp-impl.c.inc |   4 +-
 2 files changed, 154 insertions(+), 149 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4fcb311c2d..920bb543cf 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1267,38 +1267,43 @@ typedef struct opcode_t {
     const char *oname;
 } opcode_t;
 
+static void gen_priv_opc(DisasContext *ctx)
+{
+    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+}
+
 /* Helpers for priv. check */
-#define GEN_PRIV                                                \
-    do {                                                        \
-        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC); return; \
+#define GEN_PRIV(CTX)              \
+    do {                           \
+        gen_priv_opc(CTX); return; \
     } while (0)
 
 #if defined(CONFIG_USER_ONLY)
-#define CHK_HV GEN_PRIV
-#define CHK_SV GEN_PRIV
-#define CHK_HVRM GEN_PRIV
+#define CHK_HV(CTX) GEN_PRIV(CTX)
+#define CHK_SV(CTX) GEN_PRIV(CTX)
+#define CHK_HVRM(CTX) GEN_PRIV(CTX)
 #else
-#define CHK_HV                                                          \
-    do {                                                                \
-        if (unlikely(ctx->pr || !ctx->hv)) {                            \
-            GEN_PRIV;                                                   \
-        }                                                               \
+#define CHK_HV(CTX)                         \
+    do {                                    \
+        if (unlikely(ctx->pr || !ctx->hv)) {\
+            GEN_PRIV(CTX);                  \
+        }                                   \
     } while (0)
-#define CHK_SV                   \
+#define CHK_SV(CTX)              \
     do {                         \
         if (unlikely(ctx->pr)) { \
-            GEN_PRIV;            \
+            GEN_PRIV(CTX);       \
         }                        \
     } while (0)
-#define CHK_HVRM                                            \
-    do {                                                    \
-        if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) {     \
-            GEN_PRIV;                                       \
-        }                                                   \
+#define CHK_HVRM(CTX)                                   \
+    do {                                                \
+        if (unlikely(ctx->pr || !ctx->hv || ctx->dr)) { \
+            GEN_PRIV(CTX);                              \
+        }                                               \
     } while (0)
 #endif
 
-#define CHK_NONE
+#define CHK_NONE(CTX)
 
 /*****************************************************************************/
 /* PowerPC instructions table                                                */
@@ -3252,7 +3257,7 @@ GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_UQ))
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
     TCGv EA;                                                                  \
-    chk;                                                                      \
+    chk(ctx);                                                                 \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3270,7 +3275,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
     TCGv EA;                                                                  \
-    CHK_SV;                                                                   \
+    CHK_SV(ctx);                                                              \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3298,7 +3303,7 @@ GEN_LDX_HVRM(lbzcix, ld8u, 0x15, 0x1a, PPC_CILDST)
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
     TCGv EA;                                                                  \
-    chk;                                                                      \
+    chk(ctx);                                                                 \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -3315,7 +3320,7 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
     TCGv EA;                                                                  \
-    CHK_SV;                                                                   \
+    CHK_SV(ctx);                                                              \
     gen_set_access_type(ctx, ACCESS_INT);                                     \
     EA = tcg_temp_new();                                                      \
     gen_addr_reg_index(ctx, EA);                                              \
@@ -4078,11 +4083,11 @@ static void gen_wait(DisasContext *ctx)
 static void gen_doze(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_DOZE);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4094,11 +4099,11 @@ static void gen_doze(DisasContext *ctx)
 static void gen_nap(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_NAP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4110,11 +4115,11 @@ static void gen_nap(DisasContext *ctx)
 static void gen_stop(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_STOP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4126,11 +4131,11 @@ static void gen_stop(DisasContext *ctx)
 static void gen_sleep(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_SLEEP);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4142,11 +4147,11 @@ static void gen_sleep(DisasContext *ctx)
 static void gen_rvwinkle(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv_i32 t;
 
-    CHK_HV;
+    CHK_HV(ctx);
     t = tcg_const_i32(PPC_PM_RVWINKLE);
     gen_helper_pminsn(cpu_env, t);
     tcg_temp_free_i32(t);
@@ -4476,7 +4481,7 @@ static void gen_mcrf(DisasContext *ctx)
 static void gen_rfi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /*
      * This instruction doesn't exist anymore on 64-bit server
@@ -4487,7 +4492,7 @@ static void gen_rfi(DisasContext *ctx)
         return;
     }
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfi(cpu_env);
@@ -4499,10 +4504,10 @@ static void gen_rfi(DisasContext *ctx)
 static void gen_rfid(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfid(cpu_env);
@@ -4514,10 +4519,10 @@ static void gen_rfid(DisasContext *ctx)
 static void gen_rfscv(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_SV;
+    CHK_SV(ctx);
     gen_icount_io_start(ctx);
     gen_update_cfar(ctx, ctx->cia);
     gen_helper_rfscv(cpu_env);
@@ -4529,10 +4534,10 @@ static void gen_rfscv(DisasContext *ctx)
 static void gen_hrfid(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     /* Restore CPU state */
-    CHK_HV;
+    CHK_HV(ctx);
     gen_helper_hrfid(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
 #endif
@@ -4733,7 +4738,7 @@ static void gen_mfcr(DisasContext *ctx)
 /* mfmsr */
 static void gen_mfmsr(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     tcg_gen_mov_tl(cpu_gpr[rD(ctx->opcode)], cpu_msr);
 }
 
@@ -4847,7 +4852,7 @@ static void gen_mtmsrd(DisasContext *ctx)
         return;
     }
 
-    CHK_SV;
+    CHK_SV(ctx);
 
 #if !defined(CONFIG_USER_ONLY)
     TCGv t0, t1;
@@ -4890,7 +4895,7 @@ static void gen_mtmsrd(DisasContext *ctx)
 
 static void gen_mtmsr(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
 
 #if !defined(CONFIG_USER_ONLY)
     TCGv t0, t1;
@@ -5022,7 +5027,7 @@ static void gen_dcbfep(DisasContext *ctx)
 {
     /* XXX: specification says this is treated as a load by the MMU */
     TCGv t0;
-    CHK_SV;
+    CHK_SV(ctx);
     gen_set_access_type(ctx, ACCESS_CACHE);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
@@ -5034,11 +5039,11 @@ static void gen_dcbfep(DisasContext *ctx)
 static void gen_dcbi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv EA, val;
 
-    CHK_SV;
+    CHK_SV(ctx);
     EA = tcg_temp_new();
     gen_set_access_type(ctx, ACCESS_CACHE);
     gen_addr_reg_index(ctx, EA);
@@ -5223,11 +5228,11 @@ static void gen_dcba(DisasContext *ctx)
 static void gen_mfsr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
     tcg_temp_free(t0);
@@ -5238,11 +5243,11 @@ static void gen_mfsr(DisasContext *ctx)
 static void gen_mfsrin(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -5254,11 +5259,11 @@ static void gen_mfsrin(DisasContext *ctx)
 static void gen_mtsr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(t0);
@@ -5269,10 +5274,10 @@ static void gen_mtsr(DisasContext *ctx)
 static void gen_mtsrin(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
-    CHK_SV;
+    CHK_SV(ctx);
 
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
@@ -5288,11 +5293,11 @@ static void gen_mtsrin(DisasContext *ctx)
 static void gen_mfsr_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
     tcg_temp_free(t0);
@@ -5303,11 +5308,11 @@ static void gen_mfsr_64b(DisasContext *ctx)
 static void gen_mfsrin_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_load_sr(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -5319,11 +5324,11 @@ static void gen_mfsrin_64b(DisasContext *ctx)
 static void gen_mtsr_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_const_tl(SR(ctx->opcode));
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(t0);
@@ -5334,11 +5339,11 @@ static void gen_mtsr_64b(DisasContext *ctx)
 static void gen_mtsrin_64b(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_extract_tl(t0, cpu_gpr[rB(ctx->opcode)], 28, 4);
     gen_helper_store_sr(cpu_env, t0, cpu_gpr[rS(ctx->opcode)]);
@@ -5350,9 +5355,9 @@ static void gen_mtsrin_64b(DisasContext *ctx)
 static void gen_slbmte(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_store_slb(cpu_env, cpu_gpr[rB(ctx->opcode)],
                          cpu_gpr[rS(ctx->opcode)]);
@@ -5362,9 +5367,9 @@ static void gen_slbmte(DisasContext *ctx)
 static void gen_slbmfee(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_load_slb_esid(cpu_gpr[rS(ctx->opcode)], cpu_env,
                              cpu_gpr[rB(ctx->opcode)]);
@@ -5374,9 +5379,9 @@ static void gen_slbmfee(DisasContext *ctx)
 static void gen_slbmfev(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_load_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
                              cpu_gpr[rB(ctx->opcode)]);
@@ -5416,9 +5421,9 @@ static void gen_slbfee_(DisasContext *ctx)
 static void gen_tlbia(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
 
     gen_helper_tlbia(cpu_env);
 #endif  /* defined(CONFIG_USER_ONLY) */
@@ -5428,13 +5433,13 @@ static void gen_tlbia(DisasContext *ctx)
 static void gen_tlbsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
 
     if (ctx->gtse) {
-        CHK_SV; /* If gtse is set then tlbsync is supervisor privileged */
+        CHK_SV(ctx); /* If gtse is set then tlbsync is supervisor privileged */
     } else {
-        CHK_HV; /* Else hypervisor privileged */
+        CHK_HV(ctx); /* Else hypervisor privileged */
     }
 
     /* BookS does both ptesync and tlbsync make tlbsync a nop for server */
@@ -5449,12 +5454,12 @@ static void gen_tlbsync(DisasContext *ctx)
 static void gen_slbia(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     uint32_t ih = (ctx->opcode >> 21) & 0x7;
     TCGv_i32 t0 = tcg_const_i32(ih);
 
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbia(cpu_env, t0);
     tcg_temp_free_i32(t0);
@@ -5465,9 +5470,9 @@ static void gen_slbia(DisasContext *ctx)
 static void gen_slbie(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5477,9 +5482,9 @@ static void gen_slbie(DisasContext *ctx)
 static void gen_slbieg(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     gen_helper_slbieg(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
@@ -5489,9 +5494,9 @@ static void gen_slbieg(DisasContext *ctx)
 static void gen_slbsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_check_tlb_flush(ctx, true);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5533,9 +5538,9 @@ static void gen_ecowx(DisasContext *ctx)
 static void gen_tlbld_6xx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_6xx_tlbd(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5544,9 +5549,9 @@ static void gen_tlbld_6xx(DisasContext *ctx)
 static void gen_tlbli_6xx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_6xx_tlbi(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -5564,11 +5569,11 @@ static void gen_mfapidi(DisasContext *ctx)
 static void gen_tlbiva(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_tlbiva(cpu_env, cpu_gpr[rB(ctx->opcode)]);
@@ -5795,11 +5800,11 @@ GEN_MAC_HANDLER(mullhwu, 0x08, 0x0C);
 static void gen_mfdcr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv dcrn;
 
-    CHK_SV;
+    CHK_SV(ctx);
     dcrn = tcg_const_tl(SPR(ctx->opcode));
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env, dcrn);
     tcg_temp_free(dcrn);
@@ -5810,11 +5815,11 @@ static void gen_mfdcr(DisasContext *ctx)
 static void gen_mtdcr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv dcrn;
 
-    CHK_SV;
+    CHK_SV(ctx);
     dcrn = tcg_const_tl(SPR(ctx->opcode));
     gen_helper_store_dcr(cpu_env, dcrn, cpu_gpr[rS(ctx->opcode)]);
     tcg_temp_free(dcrn);
@@ -5826,9 +5831,9 @@ static void gen_mtdcr(DisasContext *ctx)
 static void gen_mfdcrx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_load_dcr(cpu_gpr[rD(ctx->opcode)], cpu_env,
                         cpu_gpr[rA(ctx->opcode)]);
     /* Note: Rc update flag set leads to undefined state of Rc0 */
@@ -5840,9 +5845,9 @@ static void gen_mfdcrx(DisasContext *ctx)
 static void gen_mtdcrx(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_store_dcr(cpu_env, cpu_gpr[rA(ctx->opcode)],
                          cpu_gpr[rS(ctx->opcode)]);
     /* Note: Rc update flag set leads to undefined state of Rc0 */
@@ -5868,7 +5873,7 @@ static void gen_mtdcrux(DisasContext *ctx)
 /* dccci */
 static void gen_dccci(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
@@ -5876,11 +5881,11 @@ static void gen_dccci(DisasContext *ctx)
 static void gen_dcread(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv EA, val;
 
-    CHK_SV;
+    CHK_SV(ctx);
     gen_set_access_type(ctx, ACCESS_CACHE);
     EA = tcg_temp_new();
     gen_addr_reg_index(ctx, EA);
@@ -5905,14 +5910,14 @@ static void gen_icbt_40x(DisasContext *ctx)
 /* iccci */
 static void gen_iccci(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
 /* icread */
 static void gen_icread(DisasContext *ctx)
 {
-    CHK_SV;
+    CHK_SV(ctx);
     /* interpreted as no-op */
 }
 
@@ -5920,9 +5925,9 @@ static void gen_icread(DisasContext *ctx)
 static void gen_rfci_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_40x_rfci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5932,9 +5937,9 @@ static void gen_rfci_40x(DisasContext *ctx)
 static void gen_rfci(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5947,9 +5952,9 @@ static void gen_rfci(DisasContext *ctx)
 static void gen_rfdi(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfdi(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5960,9 +5965,9 @@ static void gen_rfdi(DisasContext *ctx)
 static void gen_rfmci(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     /* Restore CPU state */
     gen_helper_rfmci(cpu_env);
     ctx->base.is_jmp = DISAS_EXIT;
@@ -5975,9 +5980,9 @@ static void gen_rfmci(DisasContext *ctx)
 static void gen_tlbre_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     switch (rB(ctx->opcode)) {
     case 0:
         gen_helper_4xx_tlbre_hi(cpu_gpr[rD(ctx->opcode)], cpu_env,
@@ -5998,11 +6003,11 @@ static void gen_tlbre_40x(DisasContext *ctx)
 static void gen_tlbsx_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_4xx_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -6021,9 +6026,9 @@ static void gen_tlbsx_40x(DisasContext *ctx)
 static void gen_tlbwe_40x(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     switch (rB(ctx->opcode)) {
     case 0:
@@ -6047,9 +6052,9 @@ static void gen_tlbwe_40x(DisasContext *ctx)
 static void gen_tlbre_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
 
     switch (rB(ctx->opcode)) {
     case 0:
@@ -6073,11 +6078,11 @@ static void gen_tlbre_440(DisasContext *ctx)
 static void gen_tlbsx_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_440_tlbsx(cpu_gpr[rD(ctx->opcode)], cpu_env, t0);
@@ -6096,9 +6101,9 @@ static void gen_tlbsx_440(DisasContext *ctx)
 static void gen_tlbwe_440(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     switch (rB(ctx->opcode)) {
     case 0:
     case 1:
@@ -6123,9 +6128,9 @@ static void gen_tlbwe_440(DisasContext *ctx)
 static void gen_tlbre_booke206(DisasContext *ctx)
 {
  #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-   CHK_SV;
+   CHK_SV(ctx);
     gen_helper_booke206_tlbre(cpu_env);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6134,11 +6139,11 @@ static void gen_tlbre_booke206(DisasContext *ctx)
 static void gen_tlbsx_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
         tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
@@ -6156,9 +6161,9 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
 static void gen_tlbwe_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_booke206_tlbwe(cpu_env);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6166,11 +6171,11 @@ static void gen_tlbwe_booke206(DisasContext *ctx)
 static void gen_tlbivax_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
     gen_helper_booke206_tlbivax(cpu_env, t0);
@@ -6181,11 +6186,11 @@ static void gen_tlbivax_booke206(DisasContext *ctx)
 static void gen_tlbilx_booke206(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     gen_addr_reg_index(ctx, t0);
 
@@ -6213,11 +6218,11 @@ static void gen_tlbilx_booke206(DisasContext *ctx)
 static void gen_wrtee(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
     TCGv t0;
 
-    CHK_SV;
+    CHK_SV(ctx);
     t0 = tcg_temp_new();
     tcg_gen_andi_tl(t0, cpu_gpr[rD(ctx->opcode)], (1 << MSR_EE));
     tcg_gen_andi_tl(cpu_msr, cpu_msr, ~(1 << MSR_EE));
@@ -6235,9 +6240,9 @@ static void gen_wrtee(DisasContext *ctx)
 static void gen_wrteei(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     if (ctx->opcode & 0x00008000) {
         tcg_gen_ori_tl(cpu_msr, cpu_msr, (1 << MSR_EE));
         /* Stop translation to have a chance to raise an exception */
@@ -6291,9 +6296,9 @@ static void gen_icbt_440(DisasContext *ctx)
 static void gen_msgclr(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
     if (is_book3s_arch2x(ctx)) {
         gen_helper_book3s_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
     } else {
@@ -6305,9 +6310,9 @@ static void gen_msgclr(DisasContext *ctx)
 static void gen_msgsnd(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
     if (is_book3s_arch2x(ctx)) {
         gen_helper_book3s_msgsnd(cpu_gpr[rB(ctx->opcode)]);
     } else {
@@ -6320,9 +6325,9 @@ static void gen_msgsnd(DisasContext *ctx)
 static void gen_msgclrp(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6330,9 +6335,9 @@ static void gen_msgclrp(DisasContext *ctx)
 static void gen_msgsndp(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_SV;
+    CHK_SV(ctx);
     gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
@@ -6341,9 +6346,9 @@ static void gen_msgsndp(DisasContext *ctx)
 static void gen_msgsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
+    GEN_PRIV(ctx);
 #else
-    CHK_HV;
+    CHK_HV(ctx);
 #endif /* defined(CONFIG_USER_ONLY) */
     /* interpreted as no-op */
 }
@@ -6454,7 +6459,7 @@ static void gen_tcheck(DisasContext *ctx)
 #define GEN_TM_PRIV_NOOP(name)                                 \
 static inline void gen_##name(DisasContext *ctx)               \
 {                                                              \
-    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);            \
+    gen_priv_opc(ctx);                                         \
 }
 
 #else
@@ -6462,7 +6467,7 @@ static inline void gen_##name(DisasContext *ctx)               \
 #define GEN_TM_PRIV_NOOP(name)                                 \
 static inline void gen_##name(DisasContext *ctx)               \
 {                                                              \
-    CHK_SV;                                                    \
+    CHK_SV(ctx);                                               \
     if (unlikely(!ctx->tm_enabled)) {                          \
         gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_TM);   \
         return;                                                \
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index f9b58b844e..85b2630328 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -880,7 +880,7 @@ static void gen_lfdepx(DisasContext *ctx)
 {
     TCGv EA;
     TCGv_i64 t0;
-    CHK_SV;
+    CHK_SV(ctx);
     if (unlikely(!ctx->fpu_enabled)) {
         gen_exception(ctx, POWERPC_EXCP_FPU);
         return;
@@ -1037,7 +1037,7 @@ static void gen_stfdepx(DisasContext *ctx)
 {
     TCGv EA;
     TCGv_i64 t0;
-    CHK_SV;
+    CHK_SV(ctx);
     if (unlikely(!ctx->fpu_enabled)) {
         gen_exception(ctx, POWERPC_EXCP_FPU);
         return;
-- 
2.25.1


