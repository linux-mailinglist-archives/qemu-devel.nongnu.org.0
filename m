Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2247D347
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:58:08 +0100 (CET)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0287-00071M-NU
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:58:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wJ-0000Fk-ES; Wed, 22 Dec 2021 08:45:55 -0500
Received: from [2607:f8b0:4864:20::731] (port=35708
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wH-0004oh-Ag; Wed, 22 Dec 2021 08:45:55 -0500
Received: by mail-qk1-x731.google.com with SMTP id 131so2326811qkk.2;
 Wed, 22 Dec 2021 05:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIlSIh9cvmccfUAnu1IQCd9pdZdcECr8vv9G/0dNp00=;
 b=lXm+duUeeuBgiltKZUoK8wu3rnudYCtIBp+RuRfTzLA960FX27xU1JQjihthueROgs
 gQ+CK//wkCXrvKFs6gY8DYbla2gHcghhWHDFHUyQf0AU+BOSRYo5F3DGRhZQEPY9fV0H
 UqvEXtLIuSR7YBgLjoV2IqI90Xf5Z00OxIAMY3wuJi8zdp72tpysEtNy9eNgczd9kk1X
 Uc2SNExXwM8Axinyz7FunxJZs3kWNe3YocsILhJ73H3zKQf3RUz2jIkPFPEwq/+lb4kJ
 cKP0BkzhPvduDtuwaS428w+zzriFTa8IkR8M4NGqn0/IhQ7xzykXn7nTNj4t6rCB+8M0
 CFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIlSIh9cvmccfUAnu1IQCd9pdZdcECr8vv9G/0dNp00=;
 b=gtiiWLOy0uSxLv/+r4pSFvH1oTFiCwLhgdBnf6G6PD4zHsCnIDJyvRlEVpMCJAt2iN
 Sks28imE/DncOL8pQTQJgMJGDvKGxUPA/qNNVOkLahgr/hKRqbxD8Zm4zp9Sv6opezQl
 KieD5cILu75KuUzKocU9mN4cNmTA9voxh6RUxyELbahN3K1xW070YhIRX4OKVAk2M0gk
 7V+sh5bo/kfrUgBqSpYPPKcbaSlDG1S7aGDxqIfo7hSsRaFfQeSHqpABf47OR99EXE3F
 ywStH/G6wactxn69jH4GbQHepRZF/LGUEqJdw9b9kI7ZJgJA9DwB8qfNJcrmLDl3qai2
 zjPg==
X-Gm-Message-State: AOAM532BobWw5Pm0INT9oCkgkQjQqFCjpb7c0v1NvubrSkrUi6naT0Dc
 KVBM7N8RN6/4Sk7ftaDFQaHTJf8UIOc=
X-Google-Smtp-Source: ABdhPJwWVWRBiUoKIhBz7BRbqFKpl/wXbCdYKGuPXVuSTdhF7zkIiYLsMOFoBWeosOS9x+WIx1MDfA==
X-Received: by 2002:a05:620a:4156:: with SMTP id
 k22mr1951060qko.636.1640180752086; 
 Wed, 22 Dec 2021 05:45:52 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:51 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc3()
Date: Wed, 22 Dec 2021 10:45:17 -0300
Message-Id: <20211222134520.587877-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add PMC3 PM_INST_CMPL count with TCG Ops.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index be0e2dc3b5..a84d688503 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -15,6 +15,7 @@
 #define MMCR1_PMC1_INS_CNT        0x02000000
 #define MMCR1_PMC1_INS_CNT2       0xFE000000
 #define MMCR1_PMC2_INS_CNT        0x00020000
+#define MMCR1_PMC3_INS_CNT        0x00000200
 
 /*
  * Increments PMC1 checking if MMCR1_PMC1SEL has one of the following
@@ -92,6 +93,36 @@ static void pmu_inc_pmc2(DisasContext *ctx)
     tcg_temp_free(t1);
 }
 
+/*
+ * Increments PMC3 checking if MMCR1_PMC3SEL = 0x02
+ * (PM_INST_CMPL event).
+ *
+ * This function assumes that MMCR0_FC14 is cleared.
+ */
+static void pmu_inc_pmc3(DisasContext *ctx)
+{
+    TCGv t0, t1;
+    TCGLabel *l_skip_pmc;
+
+    /* PMC3 will be incremented if MMCR1_PMC3SEL is 0x2 */
+    l_skip_pmc = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t0, t0, MMCR1_PMC3_INS_CNT);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, MMCR1_PMC3_INS_CNT, l_skip_pmc);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_PMC3);
+    tcg_gen_addi_tl(t1, t1, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC3, t1);
+
+    gen_set_label(l_skip_pmc);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
 /*
  * Increments PMC5 if MMCR0_FC is cleared.
  */
@@ -159,6 +190,7 @@ static void pmu_count_insns(DisasContext *ctx)
 
     pmu_inc_pmc1(ctx);
     pmu_inc_pmc2(ctx);
+    pmu_inc_pmc3(ctx);
 
     gen_set_label(l_skip_pmc14);
 
-- 
2.33.1


