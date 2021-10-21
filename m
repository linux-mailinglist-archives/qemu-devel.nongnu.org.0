Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09F435A1D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:53:29 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQ52-0004Dm-7E
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZa-0005ir-56; Thu, 21 Oct 2021 00:20:58 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:50879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZX-0000PO-MY; Thu, 21 Oct 2021 00:20:57 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5gQJz4xdV; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=kXoJ4vJMgqJSP1MDWvF1/CNq3wSngxtLLjpSVyctz5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l5fwtzMd2ERzBuioqcsmk5NueKrp1MmwtdIlTHgHcwovOA+1RMjtRv0j7ifTunYB5
 JI4gut8dsai5PZ8bu8djMAxhwZxJWJOmaWsxo6l3ukDjZGp8i63hbxgM3F+kAvvdvY
 GDOILpC9eKxuAscvio6cqi2MaJvu4xmQLGEGcfXw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 20/25] target/ppc: Filter mtmsr[d] input before setting MSR
Date: Thu, 21 Oct 2021 15:20:22 +1100
Message-Id: <20211021042027.345405-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
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
Message-Id: <20211015181940.197982-1-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h       |  1 +
 target/ppc/translate.c | 73 +++++++++++++++++++++++-------------------
 2 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c6fc0043a9..cc1911bc75 100644
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
index 98f304302e..d0d400cd8c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4934,32 +4934,40 @@ static void gen_mtmsrd(DisasContext *ctx)
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
@@ -4969,23 +4977,19 @@ static void gen_mtmsr(DisasContext *ctx)
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
@@ -4993,16 +4997,19 @@ static void gen_mtmsr(DisasContext *ctx)
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
2.31.1


