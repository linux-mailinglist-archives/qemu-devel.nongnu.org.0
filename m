Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE0407C51
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 09:59:12 +0200 (CEST)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKON-0001KZ-Dx
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 03:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFc-0003Ux-GS
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35060
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFb-0002kG-48
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:08 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFK-00034U-3l; Sun, 12 Sep 2021 08:49:54 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:49:07 +0100
Message-Id: <20210912074914.22048-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 13/20] nubus-bridge: introduce separate NubusBridge structure
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

This is to allow the Nubus bridge to store its own additional state. Also update
the comment in the file header to reflect that nubus-bridge is not specific to
the Macintosh.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/nubus/nubus-bridge.c             | 4 ++--
 include/hw/nubus/mac-nubus-bridge.h | 2 +-
 include/hw/nubus/nubus.h            | 6 ++++++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index cd8c6a91eb..95662568c5 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -1,5 +1,5 @@
 /*
- * QEMU Macintosh Nubus
+ * QEMU Nubus
  *
  * Copyright (c) 2013-2018 Laurent Vivier <laurent@vivier.eu>
  *
@@ -22,7 +22,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nubus_bridge_info = {
     .name          = TYPE_NUBUS_BRIDGE,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
+    .instance_size = sizeof(NubusBridge),
     .class_init    = nubus_bridge_class_init,
 };
 
diff --git a/include/hw/nubus/mac-nubus-bridge.h b/include/hw/nubus/mac-nubus-bridge.h
index 650fd24eab..7365038966 100644
--- a/include/hw/nubus/mac-nubus-bridge.h
+++ b/include/hw/nubus/mac-nubus-bridge.h
@@ -16,7 +16,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(MacNubusState, MAC_NUBUS_BRIDGE)
 
 struct MacNubusState {
-    SysBusDevice sysbus_dev;
+    NubusBridge parent_obj;
 
     NubusBus *bus;
     MemoryRegion super_slot_alias;
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index ecd6340d85..e4381b3e18 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -10,6 +10,7 @@
 #define HW_NUBUS_NUBUS_H
 
 #include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
 
@@ -30,6 +31,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NubusDevice, NUBUS_DEVICE)
 OBJECT_DECLARE_SIMPLE_TYPE(NubusBus, NUBUS_BUS)
 
 #define TYPE_NUBUS_BRIDGE "nubus-bridge"
+OBJECT_DECLARE_SIMPLE_TYPE(NubusBridge, NUBUS_BRIDGE);
 
 struct NubusBus {
     BusState qbus;
@@ -56,4 +58,8 @@ struct NubusDevice {
     MemoryRegion decl_rom;
 };
 
+struct NubusBridge {
+    SysBusDevice parent_obj;
+};
+
 #endif
-- 
2.20.1


