Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE440C36B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:13:31 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQRv0-0005OA-SV
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsM-0002cy-Lj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:10:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:39010
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsI-0002Ya-3o
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:10:43 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQRsA-00059W-Pp; Wed, 15 Sep 2021 11:10:38 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 15 Sep 2021 11:10:08 +0100
Message-Id: <20210915101026.25174-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
References: <20210915101026.25174-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/20] nubus-device: expose separate super slot memory
 region
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

According to "Designing Cards and Drivers for the Macintosh Family" each physical
nubus slot can access 2 separate address ranges: a super slot memory region which
is 256MB and a standard slot memory region which is 16MB.

Currently a Nubus device uses the physical slot number to determine whether it is
using a standard slot memory region or a super slot memory region rather than
exposing both memory regions for use as required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
 include/hw/nubus/nubus.h |  1 +
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index be01269563..36203848e5 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     }
 
     nd->slot = nubus->current_slot++;
-    name = g_strdup_printf("nubus-slot-%d", nd->slot);
-
-    if (nd->slot < NUBUS_FIRST_SLOT) {
-        /* Super */
-        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
-
-        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
-                           NUBUS_SUPER_SLOT_SIZE);
-        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
-                                    &nd->slot_mem);
-    } else {
-        /* Normal */
-        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
-
-        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
-        memory_region_add_subregion(&nubus->slot_io, slot_offset,
-                                    &nd->slot_mem);
-    }
 
+    /* Super */
+    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
+
+    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
+    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
+                        NUBUS_SUPER_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
+                                &nd->super_slot_mem);
+    g_free(name);
+
+    /* Normal */
+    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
+
+    name = g_strdup_printf("nubus-slot-%x", nd->slot);
+    memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
+    memory_region_add_subregion(&nubus->slot_io, slot_offset,
+                                &nd->slot_mem);
     g_free(name);
+
     nubus_register_format_block(nd);
 }
 
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index 424309dd73..89b0976aaa 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -43,6 +43,7 @@ struct NubusDevice {
     DeviceState qdev;
 
     int slot;
+    MemoryRegion super_slot_mem;
     MemoryRegion slot_mem;
 
     /* Format Block */
-- 
2.20.1


