Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78611689C4F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUI-0002jD-1g; Fri, 03 Feb 2023 09:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUF-0002ap-A0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:23 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUC-0005v2-Bf
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2571888wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2kBLJKaVnGetSSqtxpfAhCXISkwd1yaz8QImmDemGM=;
 b=KpY9LpkQkdmGdSECIUV03ptdpIF11O/6yKWpyzgdtyfnGMbcnM3z5Vxqexi6R4/TgB
 e+e+JhjV8ztHekJdrXiHPRztONz0hemLJEvBGr60OSxZjiIYXELaR+3NRO2AOfmM49tK
 pR6kFvrNO31fokNf4r9Iue3yONWo8OFso/G3agt4FuH7CDLaEZa0GwNiLxd0XP1SubTp
 2oJU8HsL0L5OPvmKc/AM144hHOWjozKQurWbIc6O5c8BSftV9J7VIa5qvAXvrincUfQK
 QIOc/L86kAc0Q8cqxbk7dlgn4EoTRjsvKznly6tebyrditFVyuOtoTP0rNOd03Xlw4xU
 sGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2kBLJKaVnGetSSqtxpfAhCXISkwd1yaz8QImmDemGM=;
 b=3y6DlRizZHIUKiA/A0yzS8bcdi2++5KnNyrnsJKW/YVOEJEepDF8TbRpsQ3UA224kU
 OdwsH8/Arg6GDoQM8x32S5aHpdU7McH+wAQFP7VEgqYSz++n9eBYm7gCARbvgYVP1sE5
 +BF9qvYgCzN+8XAqnlOPWBKRS4yE0tkcwq3LwXBc0QcXQRzw4fRTbN+ciZJfE42hSSzF
 Sd3iahmVSFJloKsoY4lT2fKaGwZx0jAyeNcujxRjx35Vllde+WjsPaLNHVMM7ncENrbL
 KsCnvA/o4UtcgNTMfexKVWZGi+5X2c8XQspZmBfzPJ9odihABUyjNnf501mXKv6zOj0o
 J3kQ==
X-Gm-Message-State: AO0yUKWPv8F9mgea/tf9NfJQ7gOM+tMriMKaXEy6uBMlgVnlyMNKUH1o
 lOiD+9z76YfjzCyNSBzsQ6MminFojjLbrsPS
X-Google-Smtp-Source: AK7set+Zj5dbaEL0QrM7w7RdtmsTV88Fholm3LZ7zCfLgNDfiea5TXfBTso/4TUgbXOYQ9KmhH5B6g==
X-Received: by 2002:a05:600c:1d13:b0:3dc:5abb:2f50 with SMTP id
 l19-20020a05600c1d1300b003dc5abb2f50mr9505073wms.19.1675436179316; 
 Fri, 03 Feb 2023 06:56:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b003dc492e4430sm3022855wmq.28.2023.02.03.06.56.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 08/15] hw/arm/fsl-imx: Alias 'phy-num' QOM property in SoC
 object
Date: Fri,  3 Feb 2023 15:55:29 +0100
Message-Id: <20230203145536.17585-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to use intermediate 'fec-phy-num' properties in the
SoC object. Alias the properties, so when the machines set
the value on the SoC, it is propagated to the network device
object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx25.c          |  3 +--
 hw/arm/fsl-imx6.c           |  3 +--
 hw/arm/fsl-imx6ul.c         |  8 ++++----
 hw/arm/fsl-imx7.c           | 12 ++++++------
 include/hw/arm/fsl-imx25.h  |  1 -
 include/hw/arm/fsl-imx6.h   |  1 -
 include/hw/arm/fsl-imx6ul.h |  2 --
 include/hw/arm/fsl-imx7.h   |  1 -
 8 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..eff58e1f7a 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -55,6 +55,7 @@ static void fsl_imx25_init(Object *obj)
     }
 
     object_initialize_child(obj, "fec", &s->fec, TYPE_IMX_FEC);
+    object_property_add_alias(obj, "fec-phy-num", OBJECT(&s->fec), "phy-num");
 
     object_initialize_child(obj, "rngc", &s->rngc, TYPE_IMX_RNGC);
 
@@ -169,7 +170,6 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                             epit_table[i].irq));
     }
 
-    object_property_set_uint(OBJECT(&s->fec), "phy-num", s->phy_num, &err);
     qdev_set_nic_properties(DEVICE(&s->fec), &nd_table[0]);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fec), errp)) {
@@ -315,7 +315,6 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
 }
 
 static Property fsl_imx25_properties[] = {
-    DEFINE_PROP_UINT32("fec-phy-num", FslIMX25State, phy_num, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..4f870c928c 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -100,6 +100,7 @@ static void fsl_imx6_init(Object *obj)
 
 
     object_initialize_child(obj, "eth", &s->eth, TYPE_IMX_ENET);
+    object_property_add_alias(obj, "fec-phy-num", OBJECT(&s->eth), "phy-num");
 }
 
 static void fsl_imx6_realize(DeviceState *dev, Error **errp)
@@ -377,7 +378,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
-    object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num, &err);
     qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->eth), errp)) {
         return;
@@ -451,7 +451,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 }
 
 static Property fsl_imx6_properties[] = {
-    DEFINE_PROP_UINT32("fec-phy-num", FslIMX6State, phy_num, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5..8b3939e8c5 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -120,8 +120,12 @@ static void fsl_imx6ul_init(Object *obj)
      * Ethernet
      */
     for (i = 0; i < FSL_IMX6UL_NUM_ETHS; i++) {
+        g_autofree gchar *propname = g_strdup_printf("fec%d-phy-num", i + 1);
         snprintf(name, NAME_SIZE, "eth%d", i);
         object_initialize_child(obj, name, &s->eth[i], TYPE_IMX_ENET);
+        qdev_prop_set_uint32(DEVICE(&s->eth[i]), "phy-num", i);
+        object_property_add_alias(obj, propname,
+                                  OBJECT(&s->eth[i]), "phy-num");
     }
 
     /* USB */
@@ -424,8 +428,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
             FSL_IMX6UL_ENET2_TIMER_IRQ,
         };
 
-        object_property_set_uint(OBJECT(&s->eth[i]), "phy-num",
-                                 s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX6UL_ETH_NUM_TX_RINGS, &error_abort);
         qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
@@ -618,8 +620,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 }
 
 static Property fsl_imx6ul_properties[] = {
-    DEFINE_PROP_UINT32("fec1-phy-num", FslIMX6ULState, phy_num[0], 0),
-    DEFINE_PROP_UINT32("fec2-phy-num", FslIMX6ULState, phy_num[1], 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc7480799..df035c9314 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -102,8 +102,12 @@ static void fsl_imx7_init(Object *obj)
      * Ethernet
      */
     for (i = 0; i < FSL_IMX7_NUM_ETHS; i++) {
-            snprintf(name, NAME_SIZE, "eth%d", i);
-            object_initialize_child(obj, name, &s->eth[i], TYPE_IMX_ENET);
+        g_autofree gchar *propname = g_strdup_printf("fec%d-phy-num", i + 1);
+        snprintf(name, NAME_SIZE, "eth%d", i);
+        object_initialize_child(obj, name, &s->eth[i], TYPE_IMX_ENET);
+        qdev_prop_set_uint32(DEVICE(&s->eth[i]), "phy-num", i);
+        object_property_add_alias(obj, propname,
+                                  OBJECT(&s->eth[i]), "phy-num");
     }
 
     /*
@@ -402,8 +406,6 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_ENET2_ADDR,
         };
 
-        object_property_set_uint(OBJECT(&s->eth[i]), "phy-num",
-                                 s->phy_num[i], &error_abort);
         object_property_set_uint(OBJECT(&s->eth[i]), "tx-ring-num",
                                  FSL_IMX7_ETH_NUM_TX_RINGS, &error_abort);
         qdev_set_nic_properties(DEVICE(&s->eth[i]), &nd_table[i]);
@@ -599,8 +601,6 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 }
 
 static Property fsl_imx7_properties[] = {
-    DEFINE_PROP_UINT32("fec1-phy-num", FslIMX7State, phy_num[0], 0),
-    DEFINE_PROP_UINT32("fec2-phy-num", FslIMX7State, phy_num[1], 1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 1b1086e945..e377f8e79a 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -66,7 +66,6 @@ struct FslIMX25State {
     MemoryRegion   rom[2];
     MemoryRegion   iram;
     MemoryRegion   iram_alias;
-    uint32_t       phy_num;
 };
 
 /**
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 83291457cf..f7d1a94640 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -74,7 +74,6 @@ struct FslIMX6State {
     MemoryRegion   caam;
     MemoryRegion   ocram;
     MemoryRegion   ocram_alias;
-    uint32_t       phy_num;
 };
 
 
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 7812e516a5..5217eeb8ff 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -88,8 +88,6 @@ struct FslIMX6ULState {
     MemoryRegion       caam;
     MemoryRegion       ocram;
     MemoryRegion       ocram_alias;
-
-    uint32_t           phy_num[FSL_IMX6UL_NUM_ETHS];
 };
 
 enum FslIMX6ULMemoryMap {
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 4e5e071864..16c68a4937 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -82,7 +82,6 @@ struct FslIMX7State {
     IMX7GPRState       gpr;
     ChipideaState      usb[FSL_IMX7_NUM_USBS];
     DesignwarePCIEHost pcie;
-    uint32_t           phy_num[FSL_IMX7_NUM_ETHS];
 };
 
 enum FslIMX7MemoryMap {
-- 
2.38.1


