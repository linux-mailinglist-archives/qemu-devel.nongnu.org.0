Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19E40D74E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:20:45 +0200 (CEST)
Received: from localhost ([::1]:52008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoVU-00066t-OO
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHs-0002fQ-Us
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:06:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40382
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHq-0002ni-IS
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:06:36 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHi-000ChM-EG; Thu, 16 Sep 2021 11:06:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 16 Sep 2021 11:05:42 +0100
Message-Id: <20210916100554.10963-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 08/20] nubus: generate bus error when attempting to access
 empty slots
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

According to "Designing Cards and Drivers for the Macintosh Family" any attempt
to access an unimplemented address location on Nubus generates a bus error. MacOS
uses a custom bus error handler to detect empty Nubus slots, and with the current
implementation assumes that all slots are occupied as the Nubus transactions
never fail.

Switch nubus_slot_ops and nubus_super_slot_ops over to use {read,write}_with_attrs
and hard-code them to return MEMTX_DECODE_ERROR so that unoccupied Nubus slots
will generate the expected bus error.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/nubus-bus.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 39182db065..a617459a4f 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -20,23 +20,23 @@ static NubusBus *nubus_find(void)
     return NUBUS_BUS(object_resolve_path_type("", TYPE_NUBUS_BUS, NULL));
 }
 
-static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
-                             unsigned int size)
+static MemTxResult nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
+                                    unsigned size, MemTxAttrs attrs)
 {
-    /* read only */
     trace_nubus_slot_write(addr, val, size);
+    return MEMTX_DECODE_ERROR;
 }
 
-static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
-                                unsigned int size)
+static MemTxResult nubus_slot_read(void *opaque, hwaddr addr, uint64_t *data,
+                                   unsigned size, MemTxAttrs attrs)
 {
     trace_nubus_slot_read(addr, size);
-    return 0;
+    return MEMTX_DECODE_ERROR;
 }
 
 static const MemoryRegionOps nubus_slot_ops = {
-    .read  = nubus_slot_read,
-    .write = nubus_slot_write,
+    .read_with_attrs  = nubus_slot_read,
+    .write_with_attrs = nubus_slot_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -44,23 +44,25 @@ static const MemoryRegionOps nubus_slot_ops = {
     },
 };
 
-static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
-                                   unsigned int size)
+static MemTxResult nubus_super_slot_write(void *opaque, hwaddr addr,
+                                          uint64_t val, unsigned size,
+                                          MemTxAttrs attrs)
 {
-    /* read only */
     trace_nubus_super_slot_write(addr, val, size);
+    return MEMTX_DECODE_ERROR;
 }
 
-static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
-                                      unsigned int size)
+static MemTxResult nubus_super_slot_read(void *opaque, hwaddr addr,
+                                         uint64_t *data, unsigned size,
+                                         MemTxAttrs attrs)
 {
     trace_nubus_super_slot_read(addr, size);
-    return 0;
+    return MEMTX_DECODE_ERROR;
 }
 
 static const MemoryRegionOps nubus_super_slot_ops = {
-    .read  = nubus_super_slot_read,
-    .write = nubus_super_slot_write,
+    .read_with_attrs = nubus_super_slot_read,
+    .write_with_attrs = nubus_super_slot_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
2.20.1


