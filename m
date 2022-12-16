Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91C64E73D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 07:17:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p640Y-0008HK-H3; Fri, 16 Dec 2022 01:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1p640V-0008H2-CN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 01:15:43 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1p640S-0008FN-M8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 01:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671171340; x=1702707340;
 h=from:to:cc:subject:date:message-id;
 bh=XJwCgyy/gm6t6vuno8KXRgUzPl0SchKxLJLCsCVDFUs=;
 b=Yxk2iwbN9cfmaFdU0J/z/za2eN/FJINT9ccKdVcBOyibYnXCg2qGWZNv
 FvmxLNUgH7q4yFvqqqXj2LdRMYzV2KfROd8en+lZdomUevzQp3uH66r4c
 zd+FUf58Y5Wjsv0ac6cMf8jFcqsnH8LEmjnUA6POF4x5zphhJzehhMbvI
 C2XChqP5KgOv3i494IHjAdpwI1Z0ktFx2Ji7qZvy9A5DheE95bPm7X6Id
 FqTy925N0I9d9o3gY/vMon0U2n8adjm99etXK4/81FxzzoOcIf1Z0bTfs
 Pz0VZxesx/fc3rrAqV0rNdAN725P+BTOL/whoIpbh29AQWETQlDvzedNs Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="317589622"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="317589622"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 22:15:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="682186403"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="682186403"
Received: from chenyi-pc.sh.intel.com ([10.239.159.43])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 22:15:21 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH] virtio-mem: Fix the bitmap index of the section offset
Date: Fri, 16 Dec 2022 14:22:31 +0800
Message-Id: <20221216062231.11181-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=chenyi.qiang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

vmem->bitmap indexes the memory region of the virtio-mem backend at a
granularity of block_size. To calculate the index of target section offset,
the block_size should be divided instead of the bitmap_size.

Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/virtio/virtio-mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index ed170def48..e19ee817fe 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -235,7 +235,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
     uint64_t offset, size;
     int ret = 0;
 
-    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = s->offset_within_region / vmem->block_size;
     first_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
     while (first_bit < vmem->bitmap_size) {
         MemoryRegionSection tmp = *s;
@@ -267,7 +267,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
     uint64_t offset, size;
     int ret = 0;
 
-    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = s->offset_within_region / vmem->block_size;
     first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
     while (first_bit < vmem->bitmap_size) {
         MemoryRegionSection tmp = *s;
-- 
2.17.1


