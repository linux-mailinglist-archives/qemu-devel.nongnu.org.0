Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440821BF288
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 10:20:39 +0200 (CEST)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU4Qw-00061E-AH
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 04:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU4Q6-0005U5-Ed
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 04:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU4Q5-00084r-PU
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 04:19:46 -0400
Received: from mga09.intel.com ([134.134.136.24]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jU4Q5-00084e-5e
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 04:19:45 -0400
IronPort-SDR: zYhjvBPICBSTIGqljfwibIk5BTPI+yRhc4XRDfBg/qcQQpN384VBHuhB7jvKTM5B4o7Whzj3VF
 aKMc7Jowb2Bw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 01:19:43 -0700
IronPort-SDR: bKjx2f66f+JQDqh3/rW47byhRPVNoaCmzmkWoN83/ib6j4zoBJl/bMk6q0isdJXx/F6X3Knb+t
 cvTh/+BwZicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="282783941"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2020 01:19:41 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH v6 1/3] memory: drop guest writes to read-only ram device
 regions
Date: Thu, 30 Apr 2020 04:09:46 -0400
Message-Id: <20200430080946.31286-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430080744.31232-1-yan.y.zhao@intel.com>
References: <20200430080744.31232-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yan.y.zhao@intel.com;
 helo=mga09.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 04:19:43
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 134.134.136.24
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, xin.zeng@intel.com, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

for ram device regions, drop guest writes if the region is read-only.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xin Zeng <xin.zeng@intel.com>
---
 memory.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/memory.c b/memory.c
index 601b749906..a1bba985b9 100644
--- a/memory.c
+++ b/memory.c
@@ -34,6 +34,7 @@
 #include "sysemu/accel.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
+#include "qemu/log.h"
 
 //#define DEBUG_UNASSIGNED
 
@@ -1307,12 +1308,19 @@ static uint64_t memory_region_ram_device_read(void *opaque,
     return data;
 }
 
-static void memory_region_ram_device_write(void *opaque, hwaddr addr,
-                                           uint64_t data, unsigned size)
+static MemTxResult memory_region_ram_device_write(void *opaque, hwaddr addr,
+                                                  uint64_t data, unsigned size,
+                                                  MemTxAttrs attrs)
 {
     MemoryRegion *mr = opaque;
 
     trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
+    if (mr->readonly) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid write to read-only ram device region addr 0x%"
+                      HWADDR_PRIx" size %u\n", addr, size);
+        return MEMTX_ERROR;
+    }
 
     switch (size) {
     case 1:
@@ -1328,11 +1336,12 @@ static void memory_region_ram_device_write(void *opaque, hwaddr addr,
         *(uint64_t *)(mr->ram_block->host + addr) = data;
         break;
     }
+    return MEMTX_OK;
 }
 
 static const MemoryRegionOps ram_device_mem_ops = {
     .read = memory_region_ram_device_read,
-    .write = memory_region_ram_device_write,
+    .write_with_attrs = memory_region_ram_device_write,
     .endianness = DEVICE_HOST_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
2.17.1


