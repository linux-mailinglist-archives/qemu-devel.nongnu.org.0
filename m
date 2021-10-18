Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE45430D3E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:06:30 +0200 (CEST)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH6j-0002Zr-J5
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2M-0006Ve-7n; Sun, 17 Oct 2021 21:01:58 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2J-0000Us-1m; Sun, 17 Oct 2021 21:01:57 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id f126so7815597vke.3;
 Sun, 17 Oct 2021 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EF+vYu9507vNTQv+mb4YfpI1DTMxFETRqNBOhHFolrI=;
 b=FT3DEoN3Fg6LLF9SpnSmTNNa01upWU2umr2KewvnSa86435rLN4uItg04z/Ge2DFrV
 h8BHBQJHmpLu+pGmSD50cSKEZBQuCOW0wQFGvOO14zdSWHUYUnTtpkKbRmRMa1JUG83Q
 96fmfSFMET5SxfS/rX6Wb1iVPjqOcVGUZfCBJiO5QplAUHUG7N4VqVqn+9oUTyvYxCBI
 0kUeoxbSQZt105xubZuOiElMZlNUYnqQL96Dvu+mGjqLTfQr1NucbbFYxzZ4BZHD6jFj
 hj0BvkC/TAL8Yxe8UIT79HHosBRGzVtGeZtHfeqd/4KJuHSJhJ93p9M2gFoZGeg2vfK5
 tnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EF+vYu9507vNTQv+mb4YfpI1DTMxFETRqNBOhHFolrI=;
 b=VQitrQXej4bL9Sapuv6MRf9x+jqinjye3noIDJHcNxQV7GZEEuK2+fAathrB68p9Qa
 N2d72Tt9agpY/cSGYe7fgcrIBX74MaQzoQ8S4MYim6v/59gVY5MnMW/zI8PLttoe0tXy
 4ZI4T5WiK0aCpsCPJRm67qHueOw4jBsfNU/nKy0LauYq3vNIizovRW1Suw/ZRmfVI4xK
 PqJmorOPh9aSR45teVAQToskTmCErtvSWAx/Tj+pmSfxcYUHQhnQvs/kM/rEDb6TOBLf
 QabyIB/OLosJ6dpyMgTrzOhqTbyGmfZPSIPKlCiM6SfrWkUFwj/UoJdumATWW+7vTIJN
 3S8A==
X-Gm-Message-State: AOAM532iQo3uDcQQD+SHZsymW4OquCwv1UIBVq0sLbYQTr0W+n1iMWui
 +8pcdeXJObj3J6EI0vDVf7Cur9DsRIM=
X-Google-Smtp-Source: ABdhPJyZqmfHsYHfDM9Z8zw9xtRjC7XvTDkyRwC+UoBnDxYx3eVRxUzWuxg8tZB3RpZpfl9p+OM6Xg==
X-Received: by 2002:a05:6122:d06:: with SMTP id
 az6mr2759918vkb.17.1634518913581; 
 Sun, 17 Oct 2021 18:01:53 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/15] target/ppc: adding user read/write functions for PMCs
Date: Sun, 17 Oct 2021 22:01:22 -0300
Message-Id: <20211018010133.315842-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2f.google.com
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

Problem state needs to be able to read and write the PMU counters,
otherwise it won't be aware of any sampling result that the PMU produces
after a Perf run.

This patch does that in a similar fashion as already done in the
previous patches. PMCs 5 and 6 have a special condition, aside from the
constraints that are common with PMCs 1-4, where they are not part of the
PMU if MMCR0_PMCC is 0b11.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c            | 12 +++---
 target/ppc/power8-pmu-regs.c.inc | 70 ++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |  4 ++
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad88e54950..65545ba9ca 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6879,27 +6879,27 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC56_ureg, &spr_write_PMC56_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC56_ureg, &spr_write_PMC56_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index fb95175183..7391851238 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -169,6 +169,56 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 
     tcg_temp_free(masked_gprn);
 }
+
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    if (!spr_groupA_read_allowed(ctx)) {
+        return;
+    }
+
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    /*
+     * If PMCC = 0b11, PMC5 and PMC6 aren't included in the Performance
+     * Monitor, and a read attempt results in a Facility Unavailable
+     * Interrupt.
+     */
+    if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        return;
+    }
+
+    /* The remaining steps are similar to PMCs 1-4 userspace read */
+    spr_read_PMC14_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    if (!spr_groupA_write_allowed(ctx)) {
+        return;
+    }
+
+    spr_write_ureg(ctx, sprn, gprn);
+}
+
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    /*
+     * If PMCC = 0b11, PMC5 and PMC6 aren't included in the Performance
+     * Monitor, and a write attempt results in a Facility Unavailable
+     * Interrupt.
+     */
+    if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        return;
+    }
+
+    /* The remaining steps are similar to PMCs 1-4 userspace write */
+    spr_write_PMC14_ureg(ctx, sprn, gprn);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -189,4 +239,24 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index cb7f40eedf..520f1ef233 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -34,6 +34,8 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
@@ -44,6 +46,8 @@ void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


