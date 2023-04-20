Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A916E8EED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAF-0000cz-3y; Thu, 20 Apr 2023 06:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAC-0000bX-NE
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0003tD-F6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f176a16c03so3356575e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985109; x=1684577109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pzbn4cqrDD/rPP1zQmiL6uq/uryn5Rqdl4z0KRkcO9U=;
 b=C0sRrYoJ5EC3NTt7mh+98jfcPWpoFUP+ZDHWuUbUUH2R14MmU+fwqPQVH15DmC3Ka2
 m4hDGGa0gnzs6Xw4/CrkIbvtopQAhGDBC4IAoU4uExrwQmHx0yBD1boAZruJ3R37mVQT
 5Dw0bhGcWu3WUhLEehP715RzrbzPOaYaEDBDnCzD5nzXzNw10Gz3ZtT9+SNSHjtIpC17
 /0rVz+xy15tULVgsDT2S+pYa8TCbjX2lutjHAFJd3ptOpAXolwMwSPJ8S0QnN74MjZUs
 Ir/1ihP+r4hMkR4qeWd2HlXOy/R5/oYTQoGe2IUq8AlT9UyHHQ+IAEoXSfg8euDQtW+A
 uLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985109; x=1684577109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pzbn4cqrDD/rPP1zQmiL6uq/uryn5Rqdl4z0KRkcO9U=;
 b=G5SNjWb76YCqdWVGniEHqs7nTqaSiV5t/0q2J7fXM/JKYSJMKfMhHg1K47yT6c8NPE
 KX6wQeSE+g94So6MLCDR2JBRhNEMDMvoKax5FXB2NINtuHY7ZvQOLPNv8+3FoyX6q37/
 dijwUXqpsfe6xLbamLco75qhAvyOCMWjJnMg+/wu/lwX42o45tzfub7TqNVQLPziGvnk
 4V6P+2Pr+VQeQGHnetc6HBE8se/+t30xWGPrNFxg/yUozQtMrbFUh2HpbxvSoMZoLW9g
 UuSdRQjAyxFKX2v0mugO4lc7mRF8XNLZLlFfGMXm7F6go9giir7rHpaFZSTavJHyWPba
 wWXA==
X-Gm-Message-State: AAQBX9ekF8Da80mWa6Of3zZBOMOsG3jwCqFNtBuMxBwLZE9aCCdMxVcr
 joODjFqWLZPYdmvhbArWyZOwvX8iANR4F3m+RGI=
X-Google-Smtp-Source: AKy350bkgUPTagcnxzsNucc/VWyNXcD0YmbhRvTat6hafDEbHlaCgM2Tk0qAI+X9PP3ZWgrqn3SVyg==
X-Received: by 2002:adf:d4c6:0:b0:2f5:a598:33e5 with SMTP id
 w6-20020adfd4c6000000b002f5a59833e5mr821202wrk.58.1681985108762; 
 Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] fsl-imx6ul: Add fec[12]-phy-connected properties
Date: Thu, 20 Apr 2023 11:04:53 +0100
Message-Id: <20230420100456.944969-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guenter Roeck <linux@roeck-us.net>

Add fec[12]-phy-connected properties and use it to set phy-connected
and phy-consumer properties for imx_fec.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20230315145248.1639364-3-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx6ul.h |  1 +
 hw/arm/fsl-imx6ul.c         | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 1952cb984d6..9ee15ae38d6 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -89,6 +89,7 @@ struct FslIMX6ULState {
     MemoryRegion       ocram_alias;
 
     uint32_t           phy_num[FSL_IMX6UL_NUM_ETHS];
+    bool               phy_connected[FSL_IMX6UL_NUM_ETHS];
 };
 
 enum FslIMX6ULMemoryMap {
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5f..2189dcbb72c 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -407,7 +407,23 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 
     /*
      * Ethernet
+     *
+     * We must use two loops since phy_connected affects the other interface
+     * and we have to set all properties before calling sysbus_realize().
      */
+    for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
+        object_property_set_bool(OBJECT(&s->eth[i]), "phy-connected",
+                                 s->phy_connected[i], &error_abort);
+        /*
+         * If the MDIO bus on this controller is not connected, assume the
+         * other controller provides support for it.
+         */
+        if (!s->phy_connected[i]) {
+            object_property_set_link(OBJECT(&s->eth[1 - i]), "phy-consumer",
+                                     OBJECT(&s->eth[i]), &error_abort);
+        }
+    }
+
     for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
         static const hwaddr FSL_IMX6UL_ENETn_ADDR[FSL_IMX6UL_NUM_ETHS] = {
             FSL_IMX6UL_ENET1_ADDR,
@@ -620,6 +636,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 static Property fsl_imx6ul_properties[] = {
     DEFINE_PROP_UINT32("fec1-phy-num", FslIMX6ULState, phy_num[0], 0),
     DEFINE_PROP_UINT32("fec2-phy-num", FslIMX6ULState, phy_num[1], 1),
+    DEFINE_PROP_BOOL("fec1-phy-connected", FslIMX6ULState, phy_connected[0],
+                     true),
+    DEFINE_PROP_BOOL("fec2-phy-connected", FslIMX6ULState, phy_connected[1],
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


