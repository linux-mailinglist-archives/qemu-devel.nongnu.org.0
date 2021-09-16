Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54140D749
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:18:05 +0200 (CEST)
Received: from localhost ([::1]:43480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoSy-0000Jb-FX
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHn-0002ak-UT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:06:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40376
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHm-0002hi-Fx
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:06:31 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQoHe-000ChM-Gk; Thu, 16 Sep 2021 11:06:26 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 16 Sep 2021 11:05:41 +0100
Message-Id: <20210916100554.10963-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 07/20] nubus: add trace-events for empty slot accesses
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

Increase the max_access_size to 4 bytes for empty Nubus slot and super slot
accesses to allow tracing of the Nubus enumeration process by the guest OS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/nubus-bus.c  | 10 +++++++---
 hw/nubus/trace-events |  7 +++++++
 hw/nubus/trace.h      |  1 +
 meson.build           |  1 +
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 hw/nubus/trace-events
 create mode 100644 hw/nubus/trace.h

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 63e7d66b95..39182db065 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
+#include "trace.h"
 
 
 static NubusBus *nubus_find(void)
@@ -23,12 +24,13 @@ static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned int size)
 {
     /* read only */
+    trace_nubus_slot_write(addr, val, size);
 }
 
-
 static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
                                 unsigned int size)
 {
+    trace_nubus_slot_read(addr, size);
     return 0;
 }
 
@@ -38,7 +40,7 @@ static const MemoryRegionOps nubus_slot_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
@@ -46,11 +48,13 @@ static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
                                    unsigned int size)
 {
     /* read only */
+    trace_nubus_super_slot_write(addr, val, size);
 }
 
 static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
                                       unsigned int size)
 {
+    trace_nubus_super_slot_read(addr, size);
     return 0;
 }
 
@@ -60,7 +64,7 @@ static const MemoryRegionOps nubus_super_slot_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
diff --git a/hw/nubus/trace-events b/hw/nubus/trace-events
new file mode 100644
index 0000000000..e31833d694
--- /dev/null
+++ b/hw/nubus/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# nubus-bus.c
+nubus_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
+nubus_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
+nubus_super_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
+nubus_super_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
diff --git a/hw/nubus/trace.h b/hw/nubus/trace.h
new file mode 100644
index 0000000000..3749420da1
--- /dev/null
+++ b/hw/nubus/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_nubus.h"
diff --git a/meson.build b/meson.build
index 2711cbb789..612ce671b5 100644
--- a/meson.build
+++ b/meson.build
@@ -2135,6 +2135,7 @@ if have_system
     'hw/misc/macio',
     'hw/net',
     'hw/net/can',
+    'hw/nubus',
     'hw/nvme',
     'hw/nvram',
     'hw/pci',
-- 
2.20.1


