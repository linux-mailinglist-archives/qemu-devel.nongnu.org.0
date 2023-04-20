Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B26E8EEC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAN-0000lm-Gx; Thu, 20 Apr 2023 06:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAE-0000ch-4y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:18 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA8-0003tR-Bd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f189819513so4515115e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985110; x=1684577110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SsIzI92Bnfubvao4eevVsX6zp783WFWOJizGT2tAtrE=;
 b=TYsZtb4nKZA4ZhCXq0JdEfS5P29/b4zYT3Mi5uDVXGlR3YvfsqgQrXBMWvdkBz+9qv
 LD7GSUBEr4d5gliIIjlWycNJfoFtClbYEo4IlgaH5VjjAVFk8k+q4iACvrlYISR2MWCf
 btbAO4Jgt9jVBmdtxczLo8rXu/s/uvCVlZmk+CMCFZCjLR7zFW48KZ6OcVx787oy1ZN7
 hqwpCfMgEKKCFRCztH9A8zigCgWp0K0exxC9Cnf1Ek7tkldyBiL7uy8qw8NJRbzOe1GR
 DzDaIZA4bO5KzFb7vTt6L7ohjlxSwm4xu0DqM2YLb5OUAhiDY/UxXamUyxYwWo5lbGot
 /uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985110; x=1684577110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SsIzI92Bnfubvao4eevVsX6zp783WFWOJizGT2tAtrE=;
 b=iaT7VeB4O8RssILmHTSNbNxbrzQHtVDBE3J+WDjp9x+6SEgfo8uB7OM1grkNRgmC7q
 SHNLPldpgPXnP3uhMbAg3ec81DMudPGG+Zn9S2glAcFiVkjH9T7k29UcGm13B2Lo5E3Q
 N66nrbClZ2tU1jEDphNVNjk1LEwbciV+ECo81cSgvGjzDLKF/O/8nv3srUhT0J6O93zl
 mR6ZetF4yh3GcPFP8gxClPq67F7CqyehW6umdPXbCMKv6obm5PMQOoQnpa5alI67OYSk
 eMGipwjlWM8TkoRW05EyD2OvPHRYnLde9Nnn3sX7rY37S0UcPq37e2539570zdCCsdbH
 qmjA==
X-Gm-Message-State: AAQBX9cueDjqgHEITg+MctvaXFXVXJ/0YVDg7Z3563g955XA7fBJe2ak
 cTpnkaY5t+ZYEXT+L64jnXy05k6cYIP967oucVQ=
X-Google-Smtp-Source: AKy350YUjnHYNV5yr5udnS3IzQhQ364Lyu4MHnHW8kMgxhChcTg1SxCVLxwMkyO3KrxCfoOOd6xMjg==
X-Received: by 2002:adf:ee86:0:b0:2ff:2c39:d06b with SMTP id
 b6-20020adfee86000000b002ff2c39d06bmr1046172wro.46.1681985109678; 
 Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] fsl-imx7: Add fec[12]-phy-connected properties
Date: Thu, 20 Apr 2023 11:04:55 +0100
Message-Id: <20230420100456.944969-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Message-id: 20230315145248.1639364-5-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/fsl-imx7.h |  1 +
 hw/arm/fsl-imx7.c         | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 355bd8ea838..54ea2f0890a 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -82,6 +82,7 @@ struct FslIMX7State {
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
     uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
+    bool               phy_connected[FSL_IMX7_NUM_ETHS];
 };
 
 enum FslIMX7MemoryMap {
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc74807990..9e41d4b6772 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -395,7 +395,23 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
     /*
      * Ethernet
+     *
+     * We must use two loops since phy_connected affects the other interface
+     * and we have to set all properties before calling sysbus_realize().
      */
+    for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
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
     for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
         static const hwaddr FSL_IMX7_ENETn_ADDR[FSL_IMX7_NUM_ETHS] = {
             FSL_IMX7_ENET1_ADDR,
@@ -601,6 +617,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 static Property fsl_imx7_properties[] = {
     DEFINE_PROP_UINT32("fec1-phy-num", FslIMX7State, phy_num[0], 0),
     DEFINE_PROP_UINT32("fec2-phy-num", FslIMX7State, phy_num[1], 1),
+    DEFINE_PROP_BOOL("fec1-phy-connected", FslIMX7State, phy_connected[0],
+                     true),
+    DEFINE_PROP_BOOL("fec2-phy-connected", FslIMX7State, phy_connected[1],
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


