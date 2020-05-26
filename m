Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBB1BEFEA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 07:47:17 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU22W-0005FM-4Y
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 01:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU1pa-0001LI-0J
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1jU1pZ-0004VS-Jc
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:33:53 -0400
Received: from mga18.intel.com ([134.134.136.126]:48291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yan.y.zhao@intel.com>)
 id 1jU1pZ-0004Of-14
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:33:53 -0400
IronPort-SDR: 5ME+KCo09MSl54loFRnToDEZFhmYE+SakJurR7Lpcfq0oHgZ+G4qc84MmzlabsIYA6qcjz3gUf
 ufsFiHllodoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 22:33:51 -0700
IronPort-SDR: dGqiuojrI12cRxDWZSNbArBBKW0qp3YGxrNao6KDkgH8m+C14xUOUfvU4RpsGiu7Dt7APNH1PI
 /fa90OfmMdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="249650098"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.16])
 by fmsmga008.fm.intel.com with ESMTP; 29 Apr 2020 22:33:49 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: pbonzini@redhat.com,
	alex.williamson@redhat.com
Subject: [PATCH v5 3/3] hw/vfio: let read-only flag take effect for mmap'd
 regions
Date: Thu, 30 Apr 2020 01:24:04 -0400
Message-Id: <20200430052404.29290-1-yan.y.zhao@intel.com>
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

along side setting host page table to be read-only, the memory regions
are also required to be read-only, so that when guest writes to the
read-only & mmap'd regions, vmexits would happen and region write handlers
are called.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Xin Zeng <xin.zeng@intel.com>
---
 hw/vfio/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2a4fedfeaa..bf510e66c0 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -980,6 +980,10 @@ int vfio_region_mmap(VFIORegion *region)
                                           name, region->mmaps[i].size,
                                           region->mmaps[i].mmap);
         g_free(name);
+
+        if (!(region->flags & VFIO_REGION_INFO_FLAG_WRITE)) {
+            memory_region_set_readonly(&region->mmaps[i].mem, true);
+        }
         memory_region_add_subregion(region->mem, region->mmaps[i].offset,
                                     &region->mmaps[i].mem);
 
-- 
2.17.1


