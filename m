Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FF5E7650
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:57:04 +0200 (CEST)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeUZ-0002t6-Ay
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMT-0005BA-EN; Fri, 23 Sep 2022 04:48:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53011
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMP-0005Pu-RW; Fri, 23 Sep 2022 04:48:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5R0QtNz4xGT;
 Fri, 23 Sep 2022 18:48:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5N3jsHz4xGN;
 Fri, 23 Sep 2022 18:48:24 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/6] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Date: Fri, 23 Sep 2022 10:48:02 +0200
Message-Id: <20220923084803.498337-6-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

Investigating why some BMC models are so slow compared to a plain ARM
virt machines I did some profiling of:

  ./qemu-system-arm -M romulus-bmc -nic user \
    -drive
    file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
    -nographic -serial mon:stdio

And saw that object_class_dynamic_cast_assert was dominating the
profile times. We have a number of cases in this model of the SSI bus.
As the class is static once the object is created we just cache it and
use it instead of the dynamic case macros.

Profiling against:

  ./tests/venv/bin/avocado run \
    tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0

Before: 35.565 s ±  0.087 s
After: 15.713 s ±  0.287 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220811151413.3350684-6-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  3 +++
 hw/ssi/ssi.c         | 18 ++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index f411858ab083..6950f86810d3 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -59,6 +59,9 @@ struct SSIPeripheralClass {
 struct SSIPeripheral {
     DeviceState parent_obj;
 
+    /* cache the class */
+    SSIPeripheralClass *spc;
+
     /* Chip select state */
     bool cs;
 };
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 003931fb509e..d54a109beeb5 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
     bool cs = !!level;
     assert(n == 0);
     if (s->cs != cs) {
-        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
-        if (ssc->set_cs) {
-            ssc->set_cs(s, cs);
+        if (s->spc->set_cs) {
+            s->spc->set_cs(s, cs);
         }
     }
     s->cs = cs;
@@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
 
 static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
 {
-    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
+    SSIPeripheralClass *ssc = dev->spc;
 
     if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
-            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
-            ssc->cs_polarity == SSI_CS_NONE) {
+        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
+        ssc->cs_polarity == SSI_CS_NONE) {
         return ssc->transfer(dev, val);
     }
     return 0;
@@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
             ssc->cs_polarity != SSI_CS_NONE) {
         qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
     }
+    s->spc = ssc;
 
     ssc->realize(s, errp);
 }
@@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
 {
     BusState *b = BUS(bus);
     BusChild *kid;
-    SSIPeripheralClass *ssc;
     uint32_t r = 0;
 
     QTAILQ_FOREACH(kid, &b->children, sibling) {
-        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
-        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
-        r |= ssc->transfer_raw(peripheral, val);
+        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
+        r |= p->spc->transfer_raw(p, val);
     }
 
     return r;
-- 
2.37.3


