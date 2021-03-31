Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3FA34FDE0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:16:35 +0200 (CEST)
Received: from localhost ([::1]:49240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXtq-0004sz-Ej
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXqr-0002O6-SB; Wed, 31 Mar 2021 06:13:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXqp-0005bJ-73; Wed, 31 Mar 2021 06:13:29 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9MX26Bc3znWZN;
 Wed, 31 Mar 2021 18:10:42 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:15 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 0/4] Add migration support for VFIO PCI devices in
 SMMUv3 nested stage mode
Date: Wed, 31 Mar 2021 18:12:55 +0800
Message-ID: <20210331101259.2153-1-jiangkunkun@huawei.com>
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
Cc: Liu Yi L <yi.l.liu@intel.com>, shameerali.kolothum.thodi@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Since the SMMUv3's nested translation stages[1] has been introduced by Eric, we
need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested stage
mode. At present, it is not yet supported in QEMU. There are two problems in the
existing framework.

First, the current way to get dirty pages is not applicable to nested stage mode.
Because of the "Caching Mode", VTD can map the RAM through the host single stage
(giova->hpa). "vfio_listener_log_sync" gets dirty pages by transferring "giova"
to the kernel for the RAM block section of mapped MMIO region. In nested stage
mode, we setup the stage 2 (gpa->hpa) and the stage 1(giova->gpa) separately. So
it is inapplicable to get dirty pages by the current way in nested stage mode.

Second, it also need to pass stage 1 configurations to the destination host after
the migration. In Eric's patch, it passes the stage 1 configuration to the host on
each STE update for the devices set the PASID PciOps. The configuration will be
applied at physical level. But the data of physical level will not be sent to the
destination host. So we have to pass stage 1 configurations to the destination
host after the migration.

Best Regards,
Kunkun Jiang

[1] [RFC,v8,00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
http://patchwork.ozlabs.org/project/qemu-devel/cover/20210225105233.650545-1-eric.auger@redhat.com/

This Patch set includes patches as below:
Patch 1-2:
- Refactor the vfio_listener_log_sync and added a new function to get dirty pages
in nested stage mode.

Patch 3:
- Added global_log_start/stop interface in vfio_memory_prereg_listener

Patch 4:
- Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
to the destination host after the migration.

History:

v1 -> v2:
- Add global_log_start/stop interface in vfio_memory_prereg_listener
- Add support for repass stage 1 configs with multiple CDs to the host

Kunkun Jiang (4):
  vfio: Introduce helpers to mark dirty pages of a RAM section
  vfio: Add vfio_prereg_listener_log_sync in nested stage
  vfio: Add vfio_prereg_listener_global_log_start/stop in nested stage
  hw/arm/smmuv3: Post-load stage 1 configurations to the host

 hw/arm/smmuv3.c     | 62 +++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |  1 +
 hw/vfio/common.c    | 71 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 126 insertions(+), 8 deletions(-)

-- 
2.23.0


