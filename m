Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BDA534151
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:20:36 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttkR-0005v3-Gp
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSV-00074a-Lr; Wed, 25 May 2022 12:02:07 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSR-00049O-L0; Wed, 25 May 2022 12:02:03 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRR44pYz4xDK;
 Thu, 26 May 2022 02:01:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRP3qNdz4xXj;
 Thu, 26 May 2022 02:01:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>
Subject: [PULL 05/15] aspeed: Introduce a get_irq AspeedSoCClass method
Date: Wed, 25 May 2022 18:01:26 +0200
Message-Id: <20220525160136.556277-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

and make routine aspeed_soc_get_irq() common to all SoCs. This will be
useful to share code.

Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516055620.2380197-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast10x0.c     |  5 +++--
 hw/arm/aspeed_ast2600.c     |  5 +++--
 hw/arm/aspeed_soc.c         | 13 ++++++++++---
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e13af374b923..3789f38603e5 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -94,6 +94,7 @@ struct AspeedSoCClass {
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
+    qemu_irq (*get_irq)(AspeedSoCState *s, int dev);
 };
 
 
@@ -153,4 +154,6 @@ enum {
     ASPEED_DEV_I3C,
 };
 
+qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
+
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 427154928254..9ae9efaac144 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -61,11 +61,11 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
 };
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->armv7m), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_ast1030_init(Object *obj)
@@ -280,6 +280,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->irqmap = aspeed_soc_ast1030_irqmap;
     sc->memmap = aspeed_soc_ast1030_memmap;
     sc->num_cpus = 1;
+    sc->get_irq = aspeed_soc_ast1030_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast1030_type_info = {
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index eedda7badc37..4161a0cc4bbe 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -114,11 +114,11 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast2600_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->a7mpcore), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_ast2600_init(Object *obj)
@@ -572,6 +572,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2600_irqmap;
     sc->memmap       = aspeed_soc_ast2600_memmap;
     sc->num_cpus     = 2;
+    sc->get_irq      = aspeed_soc_ast2600_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2600_type_info = {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 58714cb2a01d..c339b5c74de5 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -121,11 +121,11 @@ static const int aspeed_soc_ast2400_irqmap[] = {
 
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
 
-static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
+static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[ctrl]);
+    return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
 }
 
 static void aspeed_soc_init(Object *obj)
@@ -487,6 +487,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2400_irqmap;
     sc->memmap       = aspeed_soc_ast2400_memmap;
     sc->num_cpus     = 1;
+    sc->get_irq      = aspeed_soc_ast2400_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2400_type_info = {
@@ -512,6 +513,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->irqmap       = aspeed_soc_ast2500_irqmap;
     sc->memmap       = aspeed_soc_ast2500_memmap;
     sc->num_cpus     = 1;
+    sc->get_irq      = aspeed_soc_ast2400_get_irq;
 }
 
 static const TypeInfo aspeed_soc_ast2500_type_info = {
@@ -528,4 +530,9 @@ static void aspeed_soc_register_types(void)
     type_register_static(&aspeed_soc_ast2500_type_info);
 };
 
-type_init(aspeed_soc_register_types)
+type_init(aspeed_soc_register_types);
+
+qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
+{
+    return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
+}
-- 
2.35.3


