Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CEA575257
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:00:09 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1G4-0007bt-GZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12K-0005SC-DD; Thu, 14 Jul 2022 11:45:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12I-0000uT-Kx; Thu, 14 Jul 2022 11:45:56 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjm3Pk0z4yTL;
 Fri, 15 Jul 2022 01:45:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjk54Qyz4xRC;
 Fri, 15 Jul 2022 01:45:46 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/19] aspeed: Add fby35-bmc slot GPIO's
Date: Thu, 14 Jul 2022 17:44:56 +0200
Message-Id: <20220714154456.2565189-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Peter Delevoryas <peter@pjd.dev>

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220712023219.41065-4-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 60bc2e4cf9b0..4193a3d23d1d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1358,11 +1358,23 @@ static void fby35_reset(MachineState *state)
 
     qemu_devices_reset();
 
-    /* Board ID */
+    /* Board ID: 7 (Class-1, 4 slots) */
     object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
     object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
+
+    /* Slot presence pins, inverse polarity. (False means present) */
+    object_property_set_bool(OBJECT(gpio), "gpioH4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH5", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH6", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioH7", true, &error_fatal);
+
+    /* Slot 12v power pins, normal polarity. (True means powered-on) */
+    object_property_set_bool(OBJECT(gpio), "gpioB2", true, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
+    object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
 }
 
 static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
-- 
2.35.3


