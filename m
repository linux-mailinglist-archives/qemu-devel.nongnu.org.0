Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54776430D3D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:06:15 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH6U-0001fZ-Bc
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2I-0006Q3-Vm; Sun, 17 Oct 2021 21:01:55 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2G-0000OS-O0; Sun, 17 Oct 2021 21:01:54 -0400
Received: by mail-ua1-x930.google.com with SMTP id f3so4747022uap.6;
 Sun, 17 Oct 2021 18:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIvWPIZ2Fn+i8wFGE6eCUtLiYegQxGyN5/d03AXIMds=;
 b=HtVqpVV3ZbyECn7iQ2vhFi4/8SmP94KBgUpLpHy+vcnuaoi/W1L2GRxaF2xm/kfm2m
 9c4MFKKXKYaThr80t4dHU4ymUSnCkKr3b8xHOVV/8molvou/U2cEExp27E8PpNTETd65
 DMXF+G/wr1T/oWQdHhYSHzoOpTHTinH8bR0c7kq2sEBkeysxN79zjn73Hp1skPDWh4/v
 h9vbDIYwO5owum/W/vB28Ns9WY89K9n2LzHQOoMS/P5hGs2zTATkkFmhRVNHkFnY+gUt
 krPFafSHKjqlhJySta+oNv/fUXn1QbuYVr81RkXq2yZ8gYT4Y1bKmqqyrnHKBEruj/O0
 ccbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIvWPIZ2Fn+i8wFGE6eCUtLiYegQxGyN5/d03AXIMds=;
 b=YcFL6r7cgpvXQqa/F98XVNUr4t9Z+Us+mlZpFDvo7GwfFajO1qkIHDj2ck318VgJ7u
 IcfDjhuskooZxVThFioRv6hPQ6AYMDyA5E8kF1zag7l38+dF5PO+4RtFoZroph26rUej
 lGMbn7mwEkdeC+Lrbkwj7RJAx9m2RrjJWI8ou6wzVbo90r1SuDYoV8iic3ljDg4LWBMr
 +sIoquyYzQnzmRoROC3/G8vVhTXHfbnRlRemlq2qMmDSr/RV53hergdiaypQ2xY2j78A
 sx6Le4XNieLByktn6qc6bg+RQf5W6xPqNEh25otWsCiNzsWmrdgKhFlLwWZ1RRpRW+sO
 MYmA==
X-Gm-Message-State: AOAM532mBKzHtlW8O9wYzj7pJvpLpYidGBtBUs+jr+FQqB+g5aCx55q+
 jEuHBXK/K0K69cxSnNQUQllUeFNw6N0=
X-Google-Smtp-Source: ABdhPJzmnjueWfriN0oCXQ9F/NKFQiw/PuApJASTfFETLv4C6NeReQy9MHeJEcjyASG4JVvFP/7fKg==
X-Received: by 2002:a67:741:: with SMTP id 62mr25602396vsh.52.1634518911389;
 Sun, 17 Oct 2021 18:01:51 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/15] target/ppc: add user read/write functions for MMCR2
Date: Sun, 17 Oct 2021 22:01:21 -0300
Message-Id: <20211018010133.315842-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
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

Similar to the previous patch, let's add problem state read/write access to
the MMCR2 SPR, which is also a group A PMU SPR that needs to be filtered
to be read/written by userspace.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h                 |  9 +++
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/power8-pmu-regs.c.inc | 98 ++++++++++++++++++++++++++++----
 target/ppc/spr_tcg.h             |  2 +
 4 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7f80c0bb19..33e3a91f6f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -352,6 +352,15 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
+/* MMCR2 userspace r/w mask */
+#define MMCR2_FC1P0  PPC_BIT(1)          /* MMCR2 FCnP0 for PMC1 */
+#define MMCR2_FC2P0  PPC_BIT(10)         /* MMCR2 FCnP0 for PMC2 */
+#define MMCR2_FC3P0  PPC_BIT(19)         /* MMCR2 FCnP0 for PMC3 */
+#define MMCR2_FC4P0  PPC_BIT(28)         /* MMCR2 FCnP0 for PMC4 */
+#define MMCR2_FC5P0  PPC_BIT(37)         /* MMCR2 FCnP0 for PMC5 */
+#define MMCR2_FC6P0  PPC_BIT(46)         /* MMCR2 FCnP0 for PMC6 */
+#define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
+                         MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
 
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 375bdca1e1..ad88e54950 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR2_ureg, &spr_write_MMCR2_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 37c812dd4d..fb95175183 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -55,6 +55,33 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
     return false;
 }
 
+/*
+ * Helper function to avoid code repetition between MMCR0 and
+ * MMCR2 problem state write functions.
+ *
+ * 'ret' must be tcg_temp_freed() by the caller.
+ */
+static TCGv masked_gprn_for_spr_write(int gprn, int sprn,
+                                      uint64_t spr_mask)
+{
+    TCGv ret = tcg_temp_new();
+    TCGv t0 = tcg_temp_new();
+
+    /* 'ret' starts with all mask bits cleared */
+    gen_load_spr(ret, sprn);
+    tcg_gen_andi_tl(ret, ret, ~(spr_mask));
+
+    /* Apply the mask into 'gprn' in a temp var */
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], spr_mask);
+
+    /* Add the masked gprn bits into 'ret' */
+    tcg_gen_or_tl(ret, ret, t0);
+
+    tcg_temp_free(t0);
+
+    return ret;
+}
+
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv t0;
@@ -79,29 +106,68 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv t0, t1;
+    TCGv masked_gprn;
 
     if (!spr_groupA_write_allowed(ctx)) {
         return;
     }
 
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-
     /*
      * Filter out all bits but FC, PMAO, and PMAE, according
      * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
      * fourth paragraph.
      */
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
-    gen_load_spr(t1, SPR_POWER_MMCR0);
-    tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
-    /* Keep all other bits intact */
-    tcg_gen_or_tl(t1, t1, t0);
-    gen_store_spr(SPR_POWER_MMCR0, t1);
+    masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
+                                            MMCR0_UREG_MASK);
+    gen_store_spr(SPR_POWER_MMCR0, masked_gprn);
+
+    tcg_temp_free(masked_gprn);
+}
+
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0;
+
+    if (!spr_groupA_read_allowed(ctx)) {
+        return;
+    }
+
+    t0 = tcg_temp_new();
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
+    tcg_gen_andi_tl(t0, t0, MMCR2_UREG_MASK);
+    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
 
     tcg_temp_free(t0);
-    tcg_temp_free(t1);
+}
+
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv masked_gprn;
+
+    if (!spr_groupA_write_allowed(ctx)) {
+        return;
+    }
+
+    /*
+     * Filter the bits that can be written using MMCR2_UREG_MASK,
+     * similar to what is done in spr_write_MMCR0_ureg().
+     */
+    masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR2,
+                                            MMCR2_UREG_MASK);
+    gen_store_spr(SPR_POWER_MMCR2, masked_gprn);
+
+    tcg_temp_free(masked_gprn);
 }
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
@@ -113,4 +179,14 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index b28b095097..cb7f40eedf 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -33,6 +33,7 @@ void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
@@ -42,6 +43,7 @@ void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


