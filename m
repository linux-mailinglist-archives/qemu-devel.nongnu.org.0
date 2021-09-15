Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F940C370
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:13:39 +0200 (CEST)
Received: from localhost ([::1]:36208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRv8-0005jP-NN
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsb-0002ua-W7
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:02 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39034
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsZ-0002kv-CU
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:11:01 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsR-00059W-3V; Wed, 15 Sep 2021 11:10:55 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:12 +0100
Message-Id: <20210915101026.25174-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 06/20] nubus: implement BusClass get_dev_path()
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/nubus-bus.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index dbd930d5cd..755601ad55 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -87,6 +87,21 @@ static void nubus_init(Object *obj)
     nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);
 }
 
+static char *nubus_get_dev_path(DeviceState *dev)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
+    char *p = qdev_get_dev_path(bus->parent);
+
+    if (p) {
+        char *ret = g_strdup_printf("%s/%s/%02x", p, bus->name, nd->slot);
+        g_free(p);
+        return ret;
+    } else {
+        return g_strdup_printf("%s/%02x", bus->name, nd->slot);
+    }
+}
+
 static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
 {
     NubusDevice *nd = NUBUS_DEVICE(dev);
@@ -129,6 +144,7 @@ static void nubus_class_init(ObjectClass *oc, void *data)
 
     bc->realize = nubus_realize;
     bc->check_address = nubus_check_address;
+    bc->get_dev_path = nubus_get_dev_path;
 }
 
 static const TypeInfo nubus_bus_info = {
-- 
2.20.1


