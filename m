Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FC44006C3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:39:54 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFyb-0008Qv-6N
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqd-0001yT-6q; Fri, 03 Sep 2021 16:31:39 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqb-0001UN-6w; Fri, 03 Sep 2021 16:31:38 -0400
Received: by mail-qv1-xf31.google.com with SMTP id ew6so370387qvb.5;
 Fri, 03 Sep 2021 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ho5QpEh7B87JFmoyeSDdHK6EEOIXNb5CVDy0hgL4E0=;
 b=DnyEtCNFieH6SAqFf8bRj6oWMoKxZNUnjV9jzPwfjxty50ROfWmwuRbuWbC0Ez7GPu
 RKIaLLHC7ox1WMH3SQXqnAKt4QR3MeJRAmTt9t1ilSIbdxoTWboPn1Wv91Njl98cOLJn
 JkObvI+aTYB7YjXIYjPLjn1WFeqdEIpcwWnW60QaSZvcsUCZFQwMbEldkX0T578pG4pV
 8TWL8bfiJn7ejOayPdRIyNbCQ9F9mMVO1kX//v2lzPTEs2ZJngg9ZZnJfyXsieyHvmBb
 Sjgdqb2dz5vPHWoSP59zgbNFEKpXWvA0bVZls3k0XEvMnDZkIeINLxGIs9x+piQlSovK
 2G/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Ho5QpEh7B87JFmoyeSDdHK6EEOIXNb5CVDy0hgL4E0=;
 b=fwIqPiyF3k10JCIS1qGQZtC9qhyjeQb6+rFGD6yd9bwXRyosDC4CbwcCROcXiXu1Y3
 X2cP2Mm6FT6KgozbcC9aLmTSdZ+ug2OWLcwffU3Zz7jUEjscJTLucws99m9Onrf2tr08
 DtETpEJVFjtHPXMvo3+G0HuQCjMgn6XmExi7YY6mmECqbSigBtbyS1E+Ve17m8zkDrRu
 qfHTjMH4Ae8TPyW9k3IWvR+6rIxilY+FI02pvaksds1/Ejh1W7wq45XYXWrJanem7p0E
 FNA0ZMBhj2eU+RZJikk7qYUIWETVDOLazji4LGgZEd/RDfSGMK2FBOFCdAT3Uz/b6GQ/
 pl2Q==
X-Gm-Message-State: AOAM532tiqyIsrDRmWrjP+iYZQmkSpk0tldA8KqIm83u8MfJWymB3fUg
 xpBBcGWr1p7Y6RgnOMI6WCGZymo/doE=
X-Google-Smtp-Source: ABdhPJxPCpnPSa8oQ7LDBhPiHKZwI7XDV3jbzZA6hWCTqJK6T6SEcZ2tkEnBbGCloXfPtBSAJUuVlw==
X-Received: by 2002:a05:6214:1cb:: with SMTP id
 c11mr921532qvt.47.1630701095686; 
 Fri, 03 Sep 2021 13:31:35 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/15] target/ppc: add user write access control for PMU
 SPRs
Date: Fri,  3 Sep 2021 17:31:03 -0300
Message-Id: <20210903203116.80628-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMU needs to enable writing of its uregs to userspace, otherwise
Perf applications will not able to setup the counters correctly. This
patch enables user space writing of all PMU uregs.

MMCR0 is a special case because its userspace writing access is controlled
by MMCR0_PMCC bits. There are 4 configurations available (0b00, 0b01,
0b10 and 0b11) but for our purposes here we're handling only
MMCR0_PMCC = 0b00. In this case, if userspace tries to write MMCR0, a
hypervisor emulation assistance interrupt occurs.

This is being done by adding HFLAGS_PMCCCLEAR to hflags. This flag
indicates if MMCR0_PMCC is cleared (0b00), and a new 'pmcc_clear' flag in
DisasContext allow us to use it in spr_write_MMCR0_ureg().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  1 +
 target/ppc/cpu_init.c    | 18 +++++++-------
 target/ppc/helper_regs.c |  3 +++
 target/ppc/spr_tcg.h     |  3 ++-
 target/ppc/translate.c   | 53 +++++++++++++++++++++++++++++++++++++++-
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f68bb8d8aa..8dfbb62022 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -616,6 +616,7 @@ enum {
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
+    HFLAGS_PMCCCLEAR = 15, /* PMU MMCR0 PMCC equal to 0b00 */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 9efc6c2d87..bb5ea04c61 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR0_ureg, &spr_write_MMCR0_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
@@ -6875,31 +6875,31 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
@@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_MMCR2_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR2_ureg, &spr_write_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 405450d863..4c1d9575ac 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -106,6 +106,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_LPCR] & LPCR_GTSE) {
         hflags |= 1 << HFLAGS_GTSE;
     }
+    if (((env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
+        hflags |= 1 << HFLAGS_PMCCCLEAR;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 30cb6c3fdc..094466a2b2 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -42,6 +42,8 @@ void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
@@ -96,7 +98,6 @@ void spr_read_mas73(DisasContext *ctx, int gprn, int sprn);
 #ifdef TARGET_PPC64
 void spr_read_cfar(DisasContext *ctx, int gprn, int sprn);
 void spr_write_cfar(DisasContext *ctx, int sprn, int gprn);
-void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
 void spr_read_purr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_purr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b2ead144d1..0babde3131 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -175,6 +175,7 @@ struct DisasContext {
     bool spe_enabled;
     bool tm_enabled;
     bool gtse;
+    bool pmcc_clear;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -561,7 +562,56 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
 }
-#endif
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0, t1;
+
+    /*
+     * For group A PMU sprs, if PMCC = 0b00, PowerISA v3.1
+     * dictates that:
+     *
+     * "If an attempt is made to write to an SPR in group A in
+     * problem state, a Hypervisor Emulation Assistance
+     * interrupt will occur."
+     *
+     * MMCR0 is a Group A SPR and can't be written by userspace
+     * if PMCC = 0b00.
+     */
+    if (ctx->pmcc_clear) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    /*
+     * Filter out all bits but FC, PMAO, and PMAE, according
+     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+     * fourth paragraph.
+     */
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
+    gen_load_spr(t1, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
+    /* Keep all other bits intact */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(SPR_POWER_MMCR0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+#else
+void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+
+void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+#endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
 
 /* SPR common to all non-embedded PowerPC */
 /* DECR */
@@ -8576,6 +8626,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
+    ctx->pmcc_clear = (hflags >> HFLAGS_PMCCCLEAR) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


