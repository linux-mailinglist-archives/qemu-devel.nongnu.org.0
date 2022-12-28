Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA116657460
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 09:57:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pASEi-0003pm-5Q; Wed, 28 Dec 2022 03:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1pASEe-0003ns-EE
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:56:28 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1pASEc-00048h-SK
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672217786; x=1703753786;
 h=from:to:cc:subject:date:message-id;
 bh=QPQiGWEbPrvFwo+COnyvTdMfQeWkiAqIb+nq/cIt72E=;
 b=NedgFbS51MiAGP1zZI2rWixQq9Mi0yRI/DZOaDGSMk78r9p5U6Q1xIVM
 Hkgr2gHEPbmdqJPwD5YNaJxvXdQBUH7XtCwTbd9AnI7wyCnmCnuTLnLwl
 zHJ84HMFCu9ahcR8ncJX5dKHGzIuhFHYVfDFAY2pYWHJLG4Xpw31yf8WE
 k7yUEA73SR0GzvE+6oczN78r90d3wwUzpWpqW1facnEip7kL+fjMGBOh/
 hFUcPR71wUeSChxqgr15fazqXe9jxnVWp7EbDw9nYu4nFuJho2uEk5ONX
 hNxN+NBuWinKcsouLHjLxhHieZbEChCsW1RhX+oB9G4xb3vSNFbcLZ0Cf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="322816410"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="322816410"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 00:56:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10573"; a="655252618"
X-IronPort-AV: E=Sophos;i="5.96,280,1665471600"; d="scan'208";a="655252618"
Received: from chenyi-pc.sh.intel.com ([10.239.159.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2022 00:56:10 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] virtio-mem: Fix the iterator variable in a vmem->rdl_list loop
Date: Wed, 28 Dec 2022 17:03:12 +0800
Message-Id: <20221228090312.17276-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=chenyi.qiang@intel.com; helo=mga03.intel.com
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

It should be the variable rdl2 to revert the already-notified listeners.

Fixes: 2044969f0b ("virtio-mem: Implement RamDiscardManager interface")
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 hw/virtio/virtio-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d96bde1fab..88c9c10318 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -341,7 +341,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
     if (ret) {
         /* Notify all already-notified listeners. */
         QLIST_FOREACH(rdl2, &vmem->rdl_list, next) {
-            MemoryRegionSection tmp = *rdl->section;
+            MemoryRegionSection tmp = *rdl2->section;
 
             if (rdl2 == rdl) {
                 break;
-- 
2.17.1


