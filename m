Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44D6647FC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:02:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHkx-0004ai-9h; Tue, 10 Jan 2023 11:45:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHka-0004Iz-Pa
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:29 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHkY-0006ap-VD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:45:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso6992367wmb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTv4zhjLtgWy27v5YJ49QUS2Dfxk6kg6iG3duW6+mRk=;
 b=BGhuu+hEBOQPQcQJopXaGJ2bQ1E28gAy+cfnk/bn1+9bsgLL1w4woE/NnZyqtgOPMt
 e8oXSmwo9HLLqImD+9TYmshwNS3BIDgPOkY7JxCj+240OiCZh5mHuVXmfZrw3Gyx+otf
 lVa2/8BxEGy8GPNpwl4ZBcioY7CoDUXlvcto45kQYkwE8rhUZXIT4Po39R8gSVb9s8+W
 ICXrOuIRafvMucYc1+qIGJ8cpx1KgalbzUVI5qGCPaIqP5XGk5DoLPYfEg2suJUtX/b3
 9Af4VMQ7DHgmSHZnF4GGx2LJMQiZiT1Je9aXkG/x0KU/KHOPN1kbaWtSeASdkiF27W6z
 z9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTv4zhjLtgWy27v5YJ49QUS2Dfxk6kg6iG3duW6+mRk=;
 b=ibq7MBahTMg9/HmdlOrip5xLURIe0y9k8wlSb+8Kn5hFxCvqiZEWKjLavccMgHyupm
 NO0hP2UwxXaaRn5dVj5WoFVbZtAYlDt0lDkXzuHGYMcS82Nnqt6sXdL6IfeyasYGGiCa
 ZrRPH0foqP+OFyY4BsmjVRSiQDpDsdRuuNDjTVYu32kwZ8854NDLubm3fjI0X/hKzzhX
 KWqqxi3/5s35WMovpgRRvxoJk3P8uvslrzd25qg/cIjtnWc1aDAHQRxiOyqSNPfircbb
 V/U2ko5AdSjeb5TjmGnYLISlTh52JwezMkXwWB6uS30kJ/FZmPYen9/k0apEkcaIkLMe
 XWIQ==
X-Gm-Message-State: AFqh2kpr5t13ciZvslFzTSGGhu7YStP3XO1WcuJvCYSLlPDEJKztayZl
 XMAAZG4Nwo4/JK6SGAsY3kLCkiyuVDw4Ou5V
X-Google-Smtp-Source: AMrXdXsWprTpfV2IKkFQ19ps3zSVJI0uuaMTl1M3Dt4Pt353mtCuLHNIc2oOqbiMR8N7D4AZKQqXyg==
X-Received: by 2002:a05:600c:3507:b0:3d9:f8a1:710d with SMTP id
 h7-20020a05600c350700b003d9f8a1710dmr2385004wmq.6.1673369121356; 
 Tue, 10 Jan 2023 08:45:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm18621531wmm.23.2023.01.10.08.45.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:45:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 13/18] hw/arm/fsl-imx: Correct GPIO/GPT index in QOM tree
Date: Tue, 10 Jan 2023 17:44:01 +0100
Message-Id: <20230110164406.94366-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

GPT and GPIO are numbered from #1.

Fixes: 757282ada8 ("i.MX: Add i.MX7 SOC.")
Fixes: 31cbf933f0 ("i.MX: Add i.MX6UL SOC")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 4 ++--
 hw/arm/fsl-imx7.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5..568317117c 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -72,7 +72,7 @@ static void fsl_imx6ul_init(Object *obj)
      * GPIOs 1 to 5
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPIOS; i++) {
-        snprintf(name, NAME_SIZE, "gpio%d", i);
+        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
         object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
     }
 
@@ -80,7 +80,7 @@ static void fsl_imx6ul_init(Object *obj)
      * GPT 1, 2
      */
     for (i = 0; i < FSL_IMX6UL_NUM_GPTS; i++) {
-        snprintf(name, NAME_SIZE, "gpt%d", i);
+        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
         object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX6UL_GPT);
     }
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc7480799..6115677d43 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -52,7 +52,7 @@ static void fsl_imx7_init(Object *obj)
      * GPIOs 1 to 7
      */
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
-        snprintf(name, NAME_SIZE, "gpio%d", i);
+        snprintf(name, NAME_SIZE, "gpio%d", i + 1);
         object_initialize_child(obj, name, &s->gpio[i], TYPE_IMX_GPIO);
     }
 
@@ -60,7 +60,7 @@ static void fsl_imx7_init(Object *obj)
      * GPT1, 2, 3, 4
      */
     for (i = 0; i < FSL_IMX7_NUM_GPTS; i++) {
-        snprintf(name, NAME_SIZE, "gpt%d", i);
+        snprintf(name, NAME_SIZE, "gpt%d", i + 1);
         object_initialize_child(obj, name, &s->gpt[i], TYPE_IMX7_GPT);
     }
 
-- 
2.38.1


