Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C747D335
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:54:18 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n024P-0000es-9j
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wH-0000A1-Vp; Wed, 22 Dec 2021 08:45:54 -0500
Received: from [2607:f8b0:4864:20::736] (port=38766
 helo=mail-qk1-x736.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wG-0004fd-Eu; Wed, 22 Dec 2021 08:45:53 -0500
Received: by mail-qk1-x736.google.com with SMTP id i187so181362qkf.5;
 Wed, 22 Dec 2021 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xxXRRnHZnvp04MsAHaqa9E8d5O6h7UZTAG+Wt+y/o90=;
 b=AWceXkUtqac0sTHGPPmPI00cThOy64ZV7U5Vka6mZXPcRBj88Fgzlk+X+mmbjTR9qo
 e5yu/7CpmggRxOlYcHGRBt+exP3J+oYHdTgP/7PhSamqOjWUkglv/8b6TmRfAbWUV2gl
 WkwLf7tbpDHfdwRBWUyrQsNoik4pSVAu9XDTL0sCTpJL69LB1Ux5pDLThrKL2jo65Tnd
 jJxHfbE4jpnNcCTCFrm9XVj4rnN4vyVFscqCo1IZhCXVdmNPlIdWE+00eD73DgC6guqz
 qdjhNYxb+xwWoHjToufQrhjcxR/a4cu0JzuhZTlrSkgTeEymepnDasJ7vd1rIffwfpe9
 0KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xxXRRnHZnvp04MsAHaqa9E8d5O6h7UZTAG+Wt+y/o90=;
 b=f57xcPeWCOBTyghL4GSIVWJnICOgZ6sm0z53PdlGM6H+nCLz+c2Kun1lOr7DSPE1K4
 R71af0eO8ch0+yvX1Uck3W9F8POJxyhHgCXBpWBu2ppiwEEcsC6D7lhMWL1RrEArifn/
 SSk1iRPBTHMrCJRdyCXCwr4N/wxBYPfE9a636YAKSPEu7IINqmi+XZnExHOVU9LuDeZE
 0Uy1c1Xu14dv2+RWzSj6/cMJZmK4jFF8Y7UmnYkWpktjTLOcqH9JTsrZyq1lie6kzx8K
 RFM+bxKmCR6NCHtIKbSd/ErxXRLZfzOIvEyIOOAXOwbRu1fXhhMtB+1muP42ZZYfP+LE
 mgVA==
X-Gm-Message-State: AOAM5307xExQRl4lY3Tge7lVFqOkiPMvGCJj04Z6XxkBjGK+4dcjBJCS
 h0g2q0L1CcNiE0b8bvHgMpjh2Nvqtwo=
X-Google-Smtp-Source: ABdhPJwPy2SPxaCNhnrbL3ROhB0hrHJSob/7dE+PM2QU5/5w4qz+RclVL0YLeVc3YTZjJt8CVTiSmw==
X-Received: by 2002:a37:d205:: with SMTP id f5mr1962454qkj.698.1640180750137; 
 Wed, 22 Dec 2021 05:45:50 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc2()
Date: Wed, 22 Dec 2021 10:45:16 -0300
Message-Id: <20211222134520.587877-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222134520.587877-1-danielhb413@gmail.com>
References: <20211222134520.587877-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::736
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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

Add PMC2 PM_INST_CMPL count with TCG Ops.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/power8-pmu-insn-cnt.c.inc | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
index 3661fb0022..be0e2dc3b5 100644
--- a/target/ppc/power8-pmu-insn-cnt.c.inc
+++ b/target/ppc/power8-pmu-insn-cnt.c.inc
@@ -14,6 +14,7 @@
 
 #define MMCR1_PMC1_INS_CNT        0x02000000
 #define MMCR1_PMC1_INS_CNT2       0xFE000000
+#define MMCR1_PMC2_INS_CNT        0x00020000
 
 /*
  * Increments PMC1 checking if MMCR1_PMC1SEL has one of the following
@@ -61,6 +62,36 @@ static void pmu_inc_pmc1(DisasContext *ctx)
     tcg_temp_free(t2);
 }
 
+/*
+ * Increments PMC2 checking if MMCR1_PMC2SEL = 0x02
+ * (PM_INST_CMPL event).
+ *
+ * This function assumes that MMCR0_FC14 is cleared.
+ */
+static void pmu_inc_pmc2(DisasContext *ctx)
+{
+    TCGv t0, t1;
+    TCGLabel *l_skip_pmc;
+
+    /* PMC2 will be incremented if MMCR1_PMC2SEL is 0x2 */
+    l_skip_pmc = gen_new_label();
+
+    t0 = tcg_temp_new();
+    gen_load_spr(t0, SPR_POWER_MMCR1);
+    tcg_gen_andi_tl(t0, t0, MMCR1_PMC2_INS_CNT);
+    tcg_gen_brcondi_tl(TCG_COND_NE, t0, MMCR1_PMC2_INS_CNT, l_skip_pmc);
+
+    t1 = tcg_temp_new();
+    gen_load_spr(t1, SPR_POWER_PMC2);
+    tcg_gen_addi_tl(t1, t1, ctx->base.num_insns);
+    gen_store_spr(SPR_POWER_PMC2, t1);
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
@@ -127,6 +158,7 @@ static void pmu_count_insns(DisasContext *ctx)
     tcg_gen_brcondi_tl(TCG_COND_EQ, t_mmcr1, 0x0, l_skip_pmc14);
 
     pmu_inc_pmc1(ctx);
+    pmu_inc_pmc2(ctx);
 
     gen_set_label(l_skip_pmc14);
 
-- 
2.33.1


