Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721286897E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:39:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNa-000882-K8; Fri, 03 Feb 2023 06:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNY-00086G-Mu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNW-0001F4-9g
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so4355853wrz.12
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2kBLJKaVnGetSSqtxpfAhCXISkwd1yaz8QImmDemGM=;
 b=B2y5MLq9wv1wRmz8W9UvNvElcqD7si5TjOQB9cGZ7fBXKiGD/2zTTlH3/RhSqB0SAk
 wca/XKL2/GbDxAMIPJvnFbXDEecCU42bUERIF7SlL49CtkKDVjf8iX5WHEymcpQLascx
 d9uQkiNNNG2gKj0oDbqBMd0uBHgSrY6attN+RP/ERXAKtuXXbYQscMJX4hKfugMXnYX8
 22Z53Q2QutELp68fXjArxmRt2v9OeHUjfSmE0499VLbrxYl+ot+KElXwVpdHq4rynaSg
 aWoFgkp/gO/Ol0sufgOyiO4WQiX+OLE019F6JdGA9cXyNJIz7P1jKqYY8/MbQcpBlyTz
 rJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f2kBLJKaVnGetSSqtxpfAhCXISkwd1yaz8QImmDemGM=;
 b=mSu8LxxHZcWIGij0rhlLbe77BE8Gp5q2isPdvnbUhCXQw2mTLV9RdX/d8YeNEdQCvd
 4eB9Fnw09SlZ9ugv5eZ31xLCh0bBNHDE8TKNtS3z7wG+m+2RLIj95y5IV4VsLitnI7jB
 1Er/FG4mdJ/8lOeELQz9/cdClZNqfvCJ9wr9x5wcka6OMSzMqFOlqtKNIBgXis8PvBEh
 softmmJ/GzqoV1MrPi10getfDfZlWrxaBwuEqfBIXitW6K3t4XS5HSYuJ+z3k/Q6HVkW
 r78KgViwquCsNaA6nd8HdrgV7U/QHIBxF1MNTbgtJjNauzEXlU6tNW61RM+FdYGzzsw2
 i9Yg==
X-Gm-Message-State: AO0yUKXGRc2r63g6E1vLy9uwry6iufYfxXjxh3Uwd5xdCPyStEM5bZQE
 amJaAqdCsf2YD/8joBnL3QHmjf/V50iAYLWK
X-Google-Smtp-Source: AK7set+lgaHOvBmMfzMT+uObv0DypfZxm0Ybj9BNnQBOc8UsfdN4rHU9/VTmRBI9ciKXAwLUvMQ6aA==
X-Received: by 2002:a05:6000:1f1c:b0:2bf:e8f7:b4fb with SMTP id
 bv28-20020a0560001f1c00b002bfe8f7b4fbmr10040764wrb.70.1675424232524; 
 Fri, 03 Feb 2023 03:37:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4986000000b002bfc24e1c55sm1769986wrq.78.2023.02.03.03.37.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 4/9] hw/arm/fsl-imx: QOM-alias 'phy-num' property in SoC object
Date: Fri,  3 Feb 2023 12:36:45 +0100
Message-Id: <20230203113650.78146-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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


