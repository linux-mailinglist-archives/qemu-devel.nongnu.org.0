Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096604006AB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:33:25 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFsK-0005N4-37
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqb-0001qU-DE; Fri, 03 Sep 2021 16:31:37 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqY-0001St-W1; Fri, 03 Sep 2021 16:31:37 -0400
Received: by mail-qt1-x833.google.com with SMTP id c19so280488qte.7;
 Fri, 03 Sep 2021 13:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YjMOqr9vdDapf4R6TWQ7u9CHNM/rukjIK/6Z92r4l20=;
 b=ejpsE1/s8tGECQ9PqgxVFgozAjNCq8hH/dsSPEAd2R+bwecfHhhVJ8RUGvVMNpADcn
 45EuLWL3GmjoLom+NNVDG2QMmV0p5+He76mfYrk8YZZSZ7ZHQXPOO8SIPSPfmmgXwphP
 Gp2eWTdCEs3DYG8wMych2isT8wAzxHf00q2SexxvBvr5uMGyar+l2wEH5V/QFMWeBQqp
 T08w2Bb/5+LAMrwsAUseFL1+zyvFNy/1bbyGrZdseD/7xo9oGarJN09K2FRembfEPKS5
 M1Cit/HddGeCrU5oUCSqz38xF3RbVPEI0q2UoXe9q7EPENoEmmSGTz4dW9yBSl2Gofnr
 desA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YjMOqr9vdDapf4R6TWQ7u9CHNM/rukjIK/6Z92r4l20=;
 b=qxU9poOGFZSsEGHJgmobRIOHVMmAMk/whq+Z/vvjL2viQhynpaRkxQZt+mWI614bIJ
 JG6caNaIYYB0gXtz2jzh+6skal1VNjrXP6B1aGca11ymGzBIpWLA2T95Xx9SfRjMCwno
 zj7xQfXWbgiQlBMxWL2xpDtBJEBcLlkuKvqfw9drvcSrUJ4ueP8LAnhYocUKoteNQLNh
 J3xh9gWxyASah6dMUkeYF8THF0cNcbGWObQ71sxFdC8HcvUX611IoPko2OqIwK+VssJO
 4MimvWeer0u4Mhpou71m+wFUjl0PaPW3Lyx/LAorbZhtqsKdkRmrvUS9D2tzPQwD3ofA
 eRNw==
X-Gm-Message-State: AOAM532vbVlGO34oMN4DEFegHfAAE+7chrQWf+TMSxNUV0WCgKqGLAKe
 eKs3Asr38BfP5g66v/ky3lTZHU+7VEU=
X-Google-Smtp-Source: ABdhPJx7ZxF9UwL4TqZba4KRUj815ENYLv6uVBqdO02Drbg8Szisykchh8wT1d92UnS5KXVK7MbuNA==
X-Received: by 2002:a05:622a:1347:: with SMTP id
 w7mr741319qtk.325.1630701093486; 
 Fri, 03 Sep 2021 13:31:33 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/15] target/ppc: add user read functions for MMCR0 and
 MMCR2
Date: Fri,  3 Sep 2021 17:31:02 -0300
Message-Id: <20210903203116.80628-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
emulation and following PowerISA v3.1.

Let's start by handling the user read of UMMCR0 and UMMCR2. According to
PowerISA 3.1 these registers omit some of its bits from userspace.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       | 10 ++++++++++
 target/ppc/cpu_init.c  |  4 ++--
 target/ppc/spr_tcg.h   |  2 ++
 target/ppc/translate.c | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..f68bb8d8aa 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -342,6 +342,16 @@ typedef struct ppc_v3_pate_t {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+/* PMU bits */
+#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
+#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
+#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
+#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
+#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
+#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
+/* MMCR0 userspace r/w mask */
+#define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad7abc6041..9efc6c2d87 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6867,7 +6867,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR0_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
@@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR2_ureg, SPR_NOACCESS,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 0be5f347d5..30cb6c3fdc 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -32,6 +32,8 @@ void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..b2ead144d1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -519,6 +519,43 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
     gen_load_spr(cpu_gpr[gprn], sprn + 0x10);
 }
 
+void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    /*
+     * Filter out all bits but FC, PMAO, and PMAE, according
+     * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+     * fourth paragraph.
+     */
+    gen_load_spr(t0, SPR_POWER_MMCR0);
+    tcg_gen_andi_tl(t0, t0, MMCR0_UREG_MASK);
+    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
+
+    tcg_temp_free(t0);
+}
+
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0 = tcg_temp_new();
+
+    /*
+     * On read, filter out all bits that are not FCnP0 bits.
+     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
+     * problem state programs read/write access to MMCR2,
+     * only the FCnP0 bits can be accessed. All other bits are
+     * not changed when mtspr is executed in problem state, and
+     * all other bits return 0s when mfspr is executed in problem
+     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
+     * Control Register 2, p. 1316, third paragraph.
+     */
+    gen_load_spr(t0, SPR_POWER_MMCR2);
+    tcg_gen_andi_tl(t0, t0, 0x4020100804020000UL);
+    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
+
+    tcg_temp_free(t0);
+}
+
 #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
 void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
-- 
2.31.1


