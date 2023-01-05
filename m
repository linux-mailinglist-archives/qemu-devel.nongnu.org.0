Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2128965F15D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMh-0001Nu-8R; Thu, 05 Jan 2023 11:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMJ-0000oH-Hm
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMF-0007Tj-4g
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso1727997wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HjXI1ybyBjJZ/wjqPnfmihak0F0npX5WBOx0bgmkSU8=;
 b=leXeI1/9WEM1c5T5kiTNJp/db6voMAceui3q7C2GThMl7Cg/v2h+PKzRs2tYBKouGD
 Q7pHDFOw2ioI4+1xwdbAKiQMZPWZ/0C8jkkVMmoMZKlnBfX5sD5cHlcQ0qJGpTtsefKu
 C1Rwdh92sJBmmF08xc2YBnxclzSZVsoYMngMO7uxiTPmyNmF0LUWj4/AMivKNsfFZqFe
 VrQxWY9cBFeDmeqn5aewwyP5xCJ2GAOKEN/X3iaZNMy+6MeUQ/WfnD9oF9/Z/l7XLjG7
 9apo8bYgfSmY00WmvEnpfbpHnX8FQxMIVu2XzmErgnCkpQOtmbVITse6vexl8Ssqyzl4
 79+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjXI1ybyBjJZ/wjqPnfmihak0F0npX5WBOx0bgmkSU8=;
 b=u/PV7hnx2sOn6mS85SB4jaRS0T5BMPT8ankg+5GZV6biQK49uLZffEWBzooR/lZJLT
 /Coqa4Q2LOI4xcFKp7qVRF1vIDPtGDrKVvJ9NXAuPSOIVtI5j0GXt2ze5lMxhmsIUrCI
 8e+0vubM87Jkn0rkyDaJ1xZ7rK7k6Kk64hliQ5WbyCIf6XSDRrIauLtRimlN6oblpyPD
 azqC4Yei7JPCeRLLQM+HaiiDrFVle9lhomCZTG6q6Kxz/M3BLt/Ljg3vu7J2B4iol1VQ
 fpVUipjDICatXz9eO/Q8EffBhk/QUs6ndFZqlH3/U5u49dSs103r/jL4FOe/cIDpODgB
 oSBA==
X-Gm-Message-State: AFqh2kotapWTNa+xx8U/12iV5qzj6QXs0Bxi6Vn/ViMhv+F6m66LN2bQ
 T+BswKS+2k7HgiFgs6gcdzZd8fxG4Ta8WeVz
X-Google-Smtp-Source: AMrXdXtTyE3s9BXNdZWAFXmddvWdnHIuYwNQQNvZQAZ0GERdjfbGFshfrq9pacUNKxCMSItdGz+4Sg==
X-Received: by 2002:a05:600c:3482:b0:3d3:4f56:62e1 with SMTP id
 a2-20020a05600c348200b003d34f5662e1mr35638336wmq.27.1672937085846; 
 Thu, 05 Jan 2023 08:44:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/34] i.MX6UL: Add a specific GPT timer instance for the
 i.MX6UL
Date: Thu,  5 Jan 2023 16:44:15 +0000
Message-Id: <20230105164417.3994639-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jean-Christophe Dubois <jcd@tribudubois.net>

The i.MX6UL doesn't support CLK_HIGH ou CLK_HIGH_DIV clock source.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/imx_gpt.h |  1 +
 hw/arm/fsl-imx6ul.c        |  2 +-
 hw/misc/imx6ul_ccm.c       |  6 ------
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++++++++
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index ff5c8a351a0..5a1230da35e 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -78,6 +78,7 @@
 #define TYPE_IMX25_GPT "imx25.gpt"
 #define TYPE_IMX31_GPT "imx31.gpt"
 #define TYPE_IMX6_GPT "imx6.gpt"
+#define TYPE_IMX6UL_GPT "imx6ul.gpt"
 #define TYPE_IMX7_GPT "imx7.gpt"
 
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index f1897123294..d88d6cc1c5f 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -81,7 +81,7 @@ static void fsl_imx6ul_init(Object *obj)
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPTS; i++) {
         snprintf(name, NAME_SIZE, "gpt%d", i);
-        object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX7_GPT);
+        object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX6UL_GPT);
     }
 
     /*
diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index a65d0314556..e01bb68ac72 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -522,12 +522,6 @@ static uint32_t imx6ul_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
     case CLK_32k:
         freq = CKIL_FREQ;
         break;
-    case CLK_HIGH:
-        freq = CKIH_FREQ;
-        break;
-    case CLK_HIGH_DIV:
-        freq = CKIH_FREQ / 8;
-        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
                       TYPE_IMX6UL_CCM, __func__, clock);
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 80b83026399..7222b1b3874 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -115,6 +115,17 @@ static const IMXClk imx6_gpt_clocks[] = {
     CLK_HIGH,      /* 111 reference clock */
 };
 
+static const IMXClk imx6ul_gpt_clocks[] = {
+    CLK_NONE,      /* 000 No clock source */
+    CLK_IPG,       /* 001 ipg_clk, 532MHz*/
+    CLK_IPG_HIGH,  /* 010 ipg_clk_highfreq */
+    CLK_EXT,       /* 011 External clock */
+    CLK_32k,       /* 100 ipg_clk_32k */
+    CLK_NONE,      /* 101 not defined */
+    CLK_NONE,      /* 110 not defined */
+    CLK_NONE,      /* 111 not defined */
+};
+
 static const IMXClk imx7_gpt_clocks[] = {
     CLK_NONE,      /* 000 No clock source */
     CLK_IPG,       /* 001 ipg_clk, 532MHz*/
@@ -539,6 +550,13 @@ static void imx6_gpt_init(Object *obj)
     s->clocks = imx6_gpt_clocks;
 }
 
+static void imx6ul_gpt_init(Object *obj)
+{
+    IMXGPTState *s = IMX_GPT(obj);
+
+    s->clocks = imx6ul_gpt_clocks;
+}
+
 static void imx7_gpt_init(Object *obj)
 {
     IMXGPTState *s = IMX_GPT(obj);
@@ -566,6 +584,12 @@ static const TypeInfo imx6_gpt_info = {
     .instance_init = imx6_gpt_init,
 };
 
+static const TypeInfo imx6ul_gpt_info = {
+    .name = TYPE_IMX6UL_GPT,
+    .parent = TYPE_IMX25_GPT,
+    .instance_init = imx6ul_gpt_init,
+};
+
 static const TypeInfo imx7_gpt_info = {
     .name = TYPE_IMX7_GPT,
     .parent = TYPE_IMX25_GPT,
@@ -577,6 +601,7 @@ static void imx_gpt_register_types(void)
     type_register_static(&imx25_gpt_info);
     type_register_static(&imx31_gpt_info);
     type_register_static(&imx6_gpt_info);
+    type_register_static(&imx6ul_gpt_info);
     type_register_static(&imx7_gpt_info);
 }
 
-- 
2.25.1


