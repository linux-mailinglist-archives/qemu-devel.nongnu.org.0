Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586734DD712
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 10:28:10 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV8u0-0008Te-Q8
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 05:28:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nV8oV-0007Kj-Oe; Fri, 18 Mar 2022 05:22:27 -0400
Received: from [2607:f8b0:4864:20::62c] (port=43537
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nV8oT-0002KB-GA; Fri, 18 Mar 2022 05:22:27 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w8so6523144pll.10;
 Fri, 18 Mar 2022 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHGETHaVXNtsPi0lco553fyJznNW89sINeC8HeBuvX0=;
 b=ZopFsOssHX1y2smNJgmXUDD+MOSEwO503991IuASLvr2FHuBApiofNurRiHS1wxnpD
 J2RG/k1qdcpdtvi8t7cdMEns22z79Rj2VrMJBAh66TvyRvB1EAByKlH1B+N4vFNlQu6O
 gwu4sTjeJcJXkQi/8MBuTiTYfeUUkDuR0gJDjzCU3jFwfocTMiFDRO70gnxQcmOFWB6t
 qZP2PeTA+sYDN75cXFhQkVpHbjrkvRurlo+e1EP1sy+kfs/bcXBdOl3R63LFi+8zUK2Y
 U1AyF0GF5rmyVALiiPzUCRBw6VjMY2HHfVo/XQP+xUHmD3lTGujir5MuxzWlEwH9BHbp
 rHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nHGETHaVXNtsPi0lco553fyJznNW89sINeC8HeBuvX0=;
 b=as+OXEB/zoJRu9pyd6jNfA0f1PIpcW34fgkUf/5wPZmal3KdXW4iaHhd1h4TRg0Hqk
 YkLM1qvEuMQxpE6B3lG87cSV1fHBjY6lOf4PaE4syB46K1wPFTB4nA4W2vNhl/5YkAnP
 QQ0W9zJJFfw/ThII4q08jHOaY0vvc9MvQoOoiB0EltahkoqiFOAUHCHfanpVIv5xiN31
 QAw6BL1/0HXAls8KPWl1S6JYU28Ro3mnnOkkG8oH4ph9vdtyNX0J2w3AALPMHg3JOCu9
 YLgz0sJ4TKY7aEqWOKiddEwSAiKwYYdH8cc35+A95NDzds/DNrBW5NF5Hj2lQASe//72
 Zlzg==
X-Gm-Message-State: AOAM531PCtJSfbmZcsyKxzmhjE+i/d8pdxEXrKCsJknJHDabmWY0cNNO
 uhHxvF0uxY9VcADxuji22kI=
X-Google-Smtp-Source: ABdhPJzdXuo2XK555XSRQf21A0+NkSJpCcK+SuMtdcWCw+oUk6EPL1jFvTpI4YmJXN9g6DiPTPJ8Bg==
X-Received: by 2002:a17:90a:730b:b0:1c6:781a:312f with SMTP id
 m11-20020a17090a730b00b001c6781a312fmr9911020pjk.53.1647595342128; 
 Fri, 18 Mar 2022 02:22:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm9438146pfw.188.2022.03.18.02.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 02:22:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed: Add eMMC Boot Controller stub
Date: Fri, 18 Mar 2022 19:52:11 +1030
Message-Id: <20220318092211.723938-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Guest code (u-boot) pokes at this on boot. No functionality is required
for guest code to work correctly, but it helps to document the region
being read from.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cf484eae0e60..b9cd51119608 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -119,6 +119,7 @@ enum {
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
     ASPEED_DEV_SBC,
+    ASPEED_DEV_EMMC_BC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
     ASPEED_DEV_SDHCI,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 25ae916e31ae..11cb6cf86bd2 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -48,6 +48,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_ADC]       = 0x1E6E9000,
     [ASPEED_DEV_DP]        = 0x1E6EB000,
     [ASPEED_DEV_SBC]       = 0x1E6F2000,
+    [ASPEED_DEV_EMMC_BC]   = 0x1E6f5000,
     [ASPEED_DEV_VIDEO]     = 0x1E700000,
     [ASPEED_DEV_SDHCI]     = 0x1E740000,
     [ASPEED_DEV_EMMC]      = 0x1E750000,
@@ -267,6 +268,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
                                 0x1000);
 
+    /* eMMC Boot Controller stub */
+    create_unimplemented_device("aspeed.emmc-boot-controller",
+                                sc->memmap[ASPEED_DEV_EMMC_BC],
+                                0x1000);
+
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
         if (sc->num_cpus > 1) {
-- 
2.35.1


