Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638973F62C0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:35:37 +0200 (CEST)
Received: from localhost ([::1]:35028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZOi-0007hx-Fm
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKA-0007Qr-0p; Tue, 24 Aug 2021 12:30:54 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZK7-0008K4-SD; Tue, 24 Aug 2021 12:30:53 -0400
Received: by mail-qk1-x72e.google.com with SMTP id t190so23822513qke.7;
 Tue, 24 Aug 2021 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LXy/XCHdL2jsCuzUMs/ntEZhhjEjRiWSdYrrOVWX9g=;
 b=C3G9ItNmuEooHWboHUwzPSzN+O3SzrsAiWNA3pdihIm0ej/5pJKx2F7l8/oioaxGG1
 xa5MEatkooL3RyBdme3Ag0kkBNjqvjFiSTn0NVtwjGxOGn75TrJos5mqXutkwPvpz7+i
 UabhADRDRPtqkUdnHZ4xXz5OiqOpDqpjDZprhk0FK5iasGz1AX/d1q+VQH3tyvVcNFig
 As/HkuUocd1nMHGoi2ajbzLGq70M9DI9HZFiElchrP+j0si0W7yZ2kfdiOt9r5vfMO6X
 4lPmYgjuKo4uIetrsNZPmbbyouefwDNCUYTvQ+Qu6hmTSxNc1gINN6o0BKS+dO5zOZXO
 B8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LXy/XCHdL2jsCuzUMs/ntEZhhjEjRiWSdYrrOVWX9g=;
 b=npmGYxDYFtvU1sR4zxxBgQ9VuRhkT7WodKggf1Y4MIFXCUp+kK3AJ4beg62AyBUxNq
 F0um1M4T/lq2EcLPgRdF1MJxZdTbh31zGyEK9Dn7Jr6ykhz/0ec1SBtF/w6tBi3he0ta
 Xn9sZdDWaraad/xnLY+bSUtcHo1pEcV5eZ+ZbIMnvUPxJGOm+8FlBlhW7LAlcgMPTmSW
 FjNL6TkfHqtldtUieW7a7hAvVCbrk/xrNTAThocBIz3bbIfaYWCJy5yJ1L50FCf9jq2F
 x83EallRV/33/BwVxYnc8vfocBwG5Vx1Gr3pLQ8nDewfbUB0wpN1QDfKi7LGV7dpr4dv
 dTDg==
X-Gm-Message-State: AOAM5317A4X+H402kpIgC3wOsEjmIulmq5viS7repQSNhhgMuKbwMJg9
 Rh7KC/490X0c4njPXRBMLurdoaGF8zI=
X-Google-Smtp-Source: ABdhPJyZD57y7Rg5tD5XFIFnOttJs628KoWKjGuVVqDaqFQjD+ZEatlLXZqzfpAtBzwcKGti8hfx0g==
X-Received: by 2002:a05:620a:214f:: with SMTP id
 m15mr26751869qkm.59.1629822650336; 
 Tue, 24 Aug 2021 09:30:50 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/16] target/ppc: add user read functions for MMCR0 and
 MMCR2
Date: Tue, 24 Aug 2021 13:30:18 -0300
Message-Id: <20210824163032.394099-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, richard.henderson@linaro.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

This patch adds handling of UMMCR0 and UMMCR2 user read which,
according to PowerISA 3.1, has some bits ommited to the
userspace.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h       |  5 +++++
 target/ppc/cpu_init.c  |  4 ++--
 target/ppc/spr_tcg.h   |  2 ++
 target/ppc/translate.c | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 627fc8d732..739005ba29 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -343,6 +343,11 @@ typedef struct ppc_v3_pate_t {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 /* PMU bits */
+#define MMCR0_FC    PPC_BIT(32)         /* Freeze Counters  */
+#define MMCR0_PMAO  PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
+#define MMCR0_PMAE  PPC_BIT(37)         /* Perf Monitor Alert Enable */
+#define MMCR0_EBE   PPC_BIT(43)         /* Perf Monitor EBB Enable */
+#define MMCR0_FCECE PPC_BIT(38)         /* FC on Enabled Cond or Event */
 #define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
 
 /* LPCR bits */
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c72c7fabea..5510c3799f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_MMCR0_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
@@ -6976,7 +6976,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_MMCR2_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 027ec4c3f7..64ef2cd089 100644
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
index 3a1eafbba8..ec4160378d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -520,6 +520,43 @@ void spr_read_ureg(DisasContext *ctx, int gprn, int sprn)
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
+    tcg_gen_andi_tl(t0, t0, MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
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


