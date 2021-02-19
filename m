Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663C31F6BF
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:48:52 +0100 (CET)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2P5-0004xs-Cm
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2KQ-0000vE-Ra; Fri, 19 Feb 2021 04:44:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2K8-0006XQ-Tp; Fri, 19 Feb 2021 04:44:02 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DhmnC5HLCzjPyN;
 Fri, 19 Feb 2021 17:41:51 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 17:43:13 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] Add migration support for VFIO PCI devices in SMMUv3
 nested stage mode
Date: Fri, 19 Feb 2021 17:42:27 +0800
Message-ID: <20210219094230.231-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
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

This Patch set includes patches as below:
Patch 1-2:
- Refactor the vfio_listener_log_sync and added a new function to get dirty pages
in nested stage mode.

Patch 3:
- Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
to the destination host after the migration.

@Eric, Could you please add this Patch set to your future version of
"vSMMUv3/pSMMUv3 2 stage VFIO integration", if you think this Patch set makes sense? :)

Best Regards
Kunkun Jiang

[1] [RFC,v7,00/26] vSMMUv3/pSMMUv3 2 stage VFIO integration
http://patchwork.ozlabs.org/project/qemu-devel/cover/20201116181349.11908-1-eric.auger@redhat.com/

Kunkun Jiang (3):
  vfio: Introduce helpers to mark dirty pages of a RAM section
  vfio: Add vfio_prereg_listener_log_sync in nested stage
  hw/arm/smmuv3: Post-load stage 1 configurations to the host

 hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |  1 +
 hw/vfio/common.c    | 47 +++++++++++++++++++++++++++++------
 3 files changed, 100 insertions(+), 8 deletions(-)

-- 
2.23.0


