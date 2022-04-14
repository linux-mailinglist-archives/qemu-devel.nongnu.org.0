Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E5500B85
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 12:49:16 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nex2J-0004YX-Fp
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0T-0001sE-FP
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yi.l.liu@intel.com>)
 id 1nex0R-0005Ke-Mh
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 06:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649933239; x=1681469239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G8R8kN5Bu9OPLz5yK28BftrdZsFf6rfmLlwn/OnqjUE=;
 b=L2mAz/oabLh7//DYEjbUgARxBSjm0TTnhu+THliP8NeUqNo9Mf8mv5Ln
 HxmJOJfkYOdvQ7PleOxHma7+ucq7cbtuGT6y/fjyJe8BLmYrRj2DP+8+B
 GvJudE8JG4zZV/rDeLHzbmA5RKizfbHgG6SJx8OL+4n3CQ9VKsf+R594S
 h14Qppr7j50+t7B6of0APIXEn/46ef8Y9dVSIZPqrqOJEW6vresxu74zF
 NiovDBHbncMcohvVXubNjAiO41Q99B/vaYSEe06wz+36xlbwkj3gbLnu/
 UhBU6J7W6ar1S4nd6CpNtBg/hQEbts+4gHyJoToNE1WzihNeCmQtMoPRk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="242836473"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="242836473"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="803091185"
Received: from 984fee00a4c6.jf.intel.com ([10.165.58.231])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2022 03:47:12 -0700
From: Yi Liu <yi.l.liu@intel.com>
To: alex.williamson@redhat.com,
	cohuck@redhat.com,
	qemu-devel@nongnu.org
Subject: [RFC 03/18] hw/vfio/pci: fix vfio_pci_hot_reset_result trace point
Date: Thu, 14 Apr 2022 03:46:55 -0700
Message-Id: <20220414104710.28534-4-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yi.l.liu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, thuth@redhat.com,
 yi.l.liu@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 jasowang@redhat.com, farman@linux.ibm.com, peterx@redhat.com,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 chao.p.peng@intel.com, nicolinc@nvidia.com, kevin.tian@intel.com,
 jgg@nvidia.com, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Properly output the errno string.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Yi Liu <yi.l.liu@intel.com>
---
 hw/vfio/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 67a183f17b..e26e65bb1f 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2337,7 +2337,7 @@ static int vfio_pci_hot_reset(VFIOPCIDevice *vdev, bool single)
     g_free(reset);
 
     trace_vfio_pci_hot_reset_result(vdev->vbasedev.name,
-                                    ret ? "%m" : "Success");
+                                    ret ? strerror(errno) : "Success");
 
 out:
     /* Re-enable INTx on affected devices */
-- 
2.27.0


