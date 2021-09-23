Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26648415AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:23:56 +0200 (CEST)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTKxP-0007Bh-6I
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKnT-0001Ik-Ve
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:13:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48620
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKnR-0007NF-1W
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:13:39 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTKnG-0003vl-At; Thu, 23 Sep 2021 10:13:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 23 Sep 2021 10:12:51 +0100
Message-Id: <20210923091308.13832-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v5 03/20] nubus-device: expose separate super slot memory
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
index be01269563..4e23df1280 100644
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
+    slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
+
+    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
+    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
+                       NUBUS_SUPER_SLOT_SIZE);
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


