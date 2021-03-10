Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F0333908
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:43:43 +0100 (CET)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvNW-0008Mh-1l
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJvLs-0006eY-Tr
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:42:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:4382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lJvLp-00062y-VM
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:42:00 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DwRrP0DmMz17Hym;
 Wed, 10 Mar 2021 17:40:05 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 17:41:43 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, "Tarun
 Gupta" <targupta@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] vfio/migration: Support manual clear vfio dirty log
Date: Wed, 10 Mar 2021 17:41:03 +0800
Message-ID: <20210310094106.2191-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangkunkun@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: shameerali.kolothum.thodi@huawei.com, Eric Auger <eric.auger@redhat.com>,
 Peter Xu <peterx@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

In the past, we clear dirty log immediately after sync dirty log to
userspace. This may cause redundant dirty handling if userspace
handles dirty log iteratively:

After vfio clears dirty log, new dirty log starts to generate. These
new dirty log will be reported to userspace even if they are generated
before userspace handles the same dirty page.

Since a new dirty log tracking method for vfio based on iommu hwdbm[1]
has been introduced in the kernel and added a new capability named
VFIO_DIRTY_LOG_MANUAL_CLEAR, we can eliminate some redundant dirty
handling by supporting it.

This series include patches as below:
Patch 1:
- updated the linux-headers/linux/vfio.h from kernel side

Patch 2:
- introduced 'struct VFIODMARange' to describe a range of the given DMA
  mapping and with respect to a VFIO_IOMMU_MAP_DMA operation

Patch 3:
- implemented the operation to manual clear vfio dirty log, which can
  eliminate some redundant dirty handling

Thanks,
Kunkun Jiang

[1] https://lore.kernel.org/linux-iommu/20210310090614.26668-1-zhukeqian1@huawei.com/T/#mb168c9738ecd3d8794e2da14f970545d5820f863

Zenghui Yu (3):
  linux-headers: update against 5.12-rc2 and "vfio log clear" series
  vfio: Maintain DMA mapping range for the container
  vfio/migration: Support VFIO_IOMMU_DIRTY_PAGES_FLAG_CLEAR_BITMAP

 hw/vfio/common.c              | 207 ++++++++++++++++++++++++++++++++--
 include/hw/vfio/vfio-common.h |  10 ++
 linux-headers/linux/vfio.h    |  55 ++++++++-
 3 files changed, 264 insertions(+), 8 deletions(-)

-- 
2.23.0


