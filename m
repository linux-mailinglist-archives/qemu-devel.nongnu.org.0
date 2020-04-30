Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 196201BEFAB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 07:30:14 +0200 (CEST)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU1m1-0003yW-2b
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 01:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU1lH-0003Ti-OD
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU1lH-00028I-9u
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:29:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:48100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jU1lG-00028B-PT
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:29:26 -0400
IronPort-SDR: hcZrCMAzQxXz8+EcMmr0ME/9uKYeKGoRAh/uVbwLT4EokG63aN2YXWcq8cMqyLQ22s4MTxmY3y
 RL1w79+q+ZIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 22:29:25 -0700
IronPort-SDR: Xv52D3rETX74P8CJw1CHMA0xPGqIKq4I/9uPlXTE/k97zSSoAykr/vkXWGiytgLtjGLJdz7qi9
 xlW0sg2AAo8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="249649344"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 22:29:23 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH v5 1/3] memory: drop guest writes to read-only ram device
 regions
Date: Thu, 30 Apr 2020 01:19:23 -0400
Message-Id: <20200430051923.29159-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430051558.28991-1-yan.y.zhao@intel.com>
References: <20200430051558.28991-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=yan.y.zhao@intel.com; helo=mga18.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 23:42:54
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 134.134.136.126
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

for ram device regions, drop guest writes if the regions is read-only.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xin Zeng <xin.zeng@intel.com>
---
 memory.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/memory.c b/memory.c
index 601b749906..90a748912f 100644
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
+                                           uint64_t data, unsigned size,
+                                           MemTxAttrs attrs)
 {
     MemoryRegion *mr = opaque;
 
     trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
+    if (mr->readonly) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid write to read only ram device region addr 0x%"
+                       HWADDR_PRIx" size %u\n", addr, size);
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


