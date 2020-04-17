Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27601AD2F6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 00:55:09 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPDPY-0007lv-Vc
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 18:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jPDOH-0006oB-1h
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1jPDOG-0000Qh-10
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:33353)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1jPDOF-0000QP-O3
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 18:53:47 -0400
IronPort-SDR: 3Occ47QeppLfdchM5T56YSVhsCbmhMFy/3MUjzDUv2OjuKRhNaGgr5/wLJPqCRK2pCt094Tq9e
 FTLHokHBZu5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 15:53:46 -0700
IronPort-SDR: etrBAZMjLHVZIMhcRT/xwyKUPFOyc9Ol+ZS+Xj5/vrgasCy4rkJC7ek2dTAAzgRBh2BH0utuiq
 TyT6ftfTQVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; d="scan'208";a="246130215"
Received: from dpdk-zhirun.sh.intel.com ([10.67.119.121])
 by fmsmga008.fm.intel.com with ESMTP; 16 Apr 2020 15:53:44 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH v4 1/3] memory: drop guest writes to read-only ram device
 regions
Date: Fri, 17 Apr 2020 07:44:37 +0000
Message-Id: <20200417074437.28526-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 192.55.52.88
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
 memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/memory.c b/memory.c
index 601b749906..9576dd6807 100644
--- a/memory.c
+++ b/memory.c
@@ -34,6 +34,7 @@
 #include "sysemu/accel.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
+#include "qemu/log.h"
 
 //#define DEBUG_UNASSIGNED
 
@@ -1313,6 +1314,12 @@ static void memory_region_ram_device_write(void *opaque, hwaddr addr,
     MemoryRegion *mr = opaque;
 
     trace_memory_region_ram_device_write(get_cpu_index(), mr, addr, data, size);
+    if (mr->readonly) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid write to read only ram device region 0x%"
+                       HWADDR_PRIx" size %u\n", addr, size);
+        return;
+    }
 
     switch (size) {
     case 1:
-- 
2.17.1


