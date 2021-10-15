Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA442FAE7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:23:37 +0200 (CEST)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRrk-0004nz-M3
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mbRoH-0000wz-0H; Fri, 15 Oct 2021 14:20:01 -0400
Received: from [201.28.113.2] (port=17335 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mbRoC-0004FI-4n; Fri, 15 Oct 2021 14:20:00 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 15 Oct 2021 15:19:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 2072C8014D6;
 Fri, 15 Oct 2021 15:19:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: Filter mtmsr[d] input before setting MSR
Date: Fri, 15 Oct 2021 15:19:40 -0300
Message-Id: <20211015181940.197982-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Oct 2021 18:19:52.0566 (UTC)
 FILETIME=[3F663160:01D7C1F1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 alfredo.junior@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

PowerISA says that mtmsr[d] "does not alter MSR[HV], MSR[S], MSR[ME], or
MSR[LE]", but the current code only filters the GPR-provided value if
L=1. This behavior caused some problems in FreeBSD, and a build option
was added to work around the issue [1], but it seems that the bug was
not reported in launchpad/gitlab. This patch address the issue in qemu,
so the option on FreeBSD should no longer be required.

[1] https://cgit.freebsd.org/src/commit/?id=4efb1ca7d2a44cfb33d7f9e18bd92f8d68dcfee0

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu.h       |  1 +
 target/ppc/translate.c | 73 +++++++++++++++++++++++-------------------
 2 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index baa4e7c34d..e94e82297b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -314,6 +314,7 @@ typedef struct ppc_v3_pate_t {
 #define MSR_AP   23 /* Access privilege state on 602                  hflags */
 #define MSR_VSX  23 /* Vector Scalar Extension (ISA 2.06 and later) x hflags */
 #define MSR_SA   22 /* Supervisor access mode on 602                  hflags */
+#define MSR_S    22 /* Secure state                                          */
 #define MSR_KEY  19 /* key bit on 603e                                       */
 #define MSR_POW  18 /* Power management                                      */
 #define MSR_TGPR 17 /* TGPR usage on 602/603                        x        */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b985e9e55b..a5ebe03e2a 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4940,32 +4940,40 @@ static void gen_mtmsrd(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
+    TCGv t0, t1;
+    target_ulong mask;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
     gen_icount_io_start(ctx);
+
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
-        TCGv t0 = tcg_temp_new();
-        TCGv t1 = tcg_temp_new();
-        tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
-                        (1 << MSR_RI) | (1 << MSR_EE));
-        tcg_gen_andi_tl(t1, cpu_msr,
-                        ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
-        tcg_gen_or_tl(t1, t1, t0);
-
-        gen_helper_store_msr(cpu_env, t1);
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
-
+        mask = (1ULL << MSR_RI) | (1ULL << MSR_EE);
     } else {
+        /* mtmsrd does not alter HV, S, ME, or LE */
+        mask = ~((1ULL << MSR_LE) | (1ULL << MSR_ME) | (1ULL << MSR_S) |
+                 (1ULL << MSR_HV));
         /*
          * XXX: we need to update nip before the store if we enter
          *      power saving mode, we will exit the loop directly from
          *      ppc_store_msr
          */
         gen_update_nip(ctx, ctx->base.pc_next);
-        gen_helper_store_msr(cpu_env, cpu_gpr[rS(ctx->opcode)]);
     }
+
+    tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)], mask);
+    tcg_gen_andi_tl(t1, cpu_msr, ~mask);
+    tcg_gen_or_tl(t0, t0, t1);
+
+    gen_helper_store_msr(cpu_env, t0);
+
     /* Must stop the translation as machine state (may have) changed */
     ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
 #endif /* !defined(CONFIG_USER_ONLY) */
 }
 #endif /* defined(TARGET_PPC64) */
@@ -4975,23 +4983,19 @@ static void gen_mtmsr(DisasContext *ctx)
     CHK_SV;
 
 #if !defined(CONFIG_USER_ONLY)
+    TCGv t0, t1;
+    target_ulong mask = 0xFFFFFFFF;
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
     gen_icount_io_start(ctx);
     if (ctx->opcode & 0x00010000) {
         /* L=1 form only updates EE and RI */
-        TCGv t0 = tcg_temp_new();
-        TCGv t1 = tcg_temp_new();
-        tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)],
-                        (1 << MSR_RI) | (1 << MSR_EE));
-        tcg_gen_andi_tl(t1, cpu_msr,
-                        ~(target_ulong)((1 << MSR_RI) | (1 << MSR_EE)));
-        tcg_gen_or_tl(t1, t1, t0);
-
-        gen_helper_store_msr(cpu_env, t1);
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
-
+        mask &= (1ULL << MSR_RI) | (1ULL << MSR_EE);
     } else {
-        TCGv msr = tcg_temp_new();
+        /* mtmsr does not alter S, ME, or LE */
+        mask &= ~((1ULL << MSR_LE) | (1ULL << MSR_ME) | (1ULL << MSR_S));
 
         /*
          * XXX: we need to update nip before the store if we enter
@@ -4999,16 +5003,19 @@ static void gen_mtmsr(DisasContext *ctx)
          *      ppc_store_msr
          */
         gen_update_nip(ctx, ctx->base.pc_next);
-#if defined(TARGET_PPC64)
-        tcg_gen_deposit_tl(msr, cpu_msr, cpu_gpr[rS(ctx->opcode)], 0, 32);
-#else
-        tcg_gen_mov_tl(msr, cpu_gpr[rS(ctx->opcode)]);
-#endif
-        gen_helper_store_msr(cpu_env, msr);
-        tcg_temp_free(msr);
     }
+
+    tcg_gen_andi_tl(t0, cpu_gpr[rS(ctx->opcode)], mask);
+    tcg_gen_andi_tl(t1, cpu_msr, ~mask);
+    tcg_gen_or_tl(t0, t0, t1);
+
+    gen_helper_store_msr(cpu_env, t0);
+
     /* Must stop the translation as machine state (may have) changed */
     ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
 #endif
 }
 
-- 
2.25.1


