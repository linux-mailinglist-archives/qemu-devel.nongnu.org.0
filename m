Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A27407C4A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 09:54:38 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKJy-0002RB-11
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 03:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKF8-0002T1-CF
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34998
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKF7-0002SG-2F
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:49:38 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKF0-00034U-49; Sun, 12 Sep 2021 08:49:34 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:48:57 +0100
Message-Id: <20210912074914.22048-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/20] nubus-device: add device slot parameter
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This prepares for allowing Nubus devices to be placed in a specific slot instead
of always being auto-allocated by the bus itself.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/nubus/nubus-device.c  | 6 ++++++
 include/hw/nubus/nubus.h | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 36203848e5..c1832f73da 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -191,12 +191,18 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     nubus_register_format_block(nd);
 }
 
+static Property nubus_device_properties[] = {
+    DEFINE_PROP_INT32("slot", NubusDevice, slot, -1),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void nubus_device_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = nubus_device_realize;
     dc->bus_type = TYPE_NUBUS_BUS;
+    device_class_set_props(dc, nubus_device_properties);
 }
 
 static const TypeInfo nubus_device_type_info = {
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 89b0976aaa..357f621d15 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -42,7 +42,7 @@ struct NubusBus {
 struct NubusDevice {
     DeviceState qdev;
 
-    int slot;
+    int32_t slot;
     MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
 
-- 
2.20.1


