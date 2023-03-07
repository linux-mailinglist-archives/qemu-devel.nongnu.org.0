Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4C6AD45E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMfe-0006n9-Tr; Mon, 06 Mar 2023 21:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfc-0006mO-Kx
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:16 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfX-0004uA-9n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:13 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NwwiJ026475; Tue, 7 Mar 2023 02:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=+rl7WQ759sdWyGxisB+9Fma9MeFsvNtQsqpc0gaWTMg=;
 b=EBLdrYoXOZz44wrEcBxf8HC9TUM2h1hzFKV+m4XdZD8IlNE5CL9n6cjiNSG9xPMI2LM2
 tAkhJe969VLbRNRilRZMyQBdTNfxNmzdVSvn58r2AlgFX8WxvVp3nQ8M/2y2AI/yS8Ae
 7Nq5Frg5vumESOCRi32ScZyJjRUoqlw3HUAzRABAFkOei16KFVDzS/BaGDQM2gzLaVVe
 MPOxX3CQ3lC4jKA6MHon2UjsXfjGAzaHVh606TZgukMVFbTFaxO+AkGjbk2rAEpxYANp
 QjaIuBfmFJX1b6RKjtVbzKifp1oW9Qmes4TCA/6VzmzTZq0RJSyOFs/Gjjk5AhwVC8tz bQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180vddw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:07 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271kq5P037535; Tue, 7 Mar 2023 02:03:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:06 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272355w016763;
 Tue, 7 Mar 2023 02:03:05 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-1; Tue, 07 Mar 2023 02:03:05 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 00/14] vfio/migration: Device dirty page tracking
Date: Tue,  7 Mar 2023 02:02:44 +0000
Message-Id: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070016
X-Proofpoint-ORIG-GUID: 1ninjvManZI7Vn1y4PU0Dl4xBf3SE4qy
X-Proofpoint-GUID: 1ninjvManZI7Vn1y4PU0Dl4xBf3SE4qy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hey,

Presented herewith a series based on the basic VFIO migration protocol v2
implementation [1].

It is split from its parent series[5] to solely focus on device dirty
page tracking. Device dirty page tracking allows the VFIO device to
record its DMAs and report them back when needed. This is part of VFIO
migration and is used during pre-copy phase of migration to track the
RAM pages that the device has written to and mark those pages dirty, so
they can later be re-sent to target.

Device dirty page tracking uses the DMA logging uAPI to discover device
capabilities, to start and stop tracking, and to get dirty page bitmap
report. Extra details and uAPI definition can be found here [3].

Device dirty page tracking operates in VFIOContainer scope. I.e., When
dirty tracking is started, stopped or dirty page report is queried, all
devices within a VFIOContainer are iterated and for each of them device
dirty page tracking is started, stopped or dirty page report is queried,
respectively.

Device dirty page tracking is used only if all devices within a
VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
used, and if that is not supported as well, memory is perpetually marked
dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
support, the last two usually have the same effect of perpetually
marking all pages dirty.

Normally, when asked to start dirty tracking, all the currently DMA
mapped ranges are tracked by device dirty page tracking. If using a
vIOMMU we block live migration. It's temporary and a separate series is
going to add support for it. Thus this series focus on getting the
ground work first.

The series is organized as follows:

- Patches 1-7: Fix bugs and do some preparatory work required prior to
  adding device dirty page tracking.
- Patches 8-11: Implement device dirty page tracking.
- Patch 12: Blocks live migration with vIOMMU.
- Patches 13-14 Detect device dirty page tracking and document it.

Comments, improvements as usual appreciated.

Thanks,
	Joao

Changes from v3 [6]:
- Added Rbs in patches 4,5,6, 13,14;
 (Did not add the other because they suffered a lot of changes)
- Fix the unblocker of live migration by moving the vfio_unblock_giommu_migration
into vfio_instance_finalize()
- Refactor/Simplify the test for vIOMMU enabled
  (patch 12)
- Change the style of how we set features::flags
  (patch 9, 11)
- Return -ENOMEM in vfio_bitmap_alloc(), and change callsites to return
  ret instead of errno
  (patch 4)
- Remove iova-tree includes
- Initialize range min{32,64} to UINT{32,64}_MAX to better calculate the
  minimum range without assumptions.
- Add commentary into why we unregister the memory listener
- Add commentary about the dual-split of ranges
- Removed the mutex because the memory listener is all serialized
- Move out the vfio_section_get_iova_range() into its own patch and
  make vfio_listener_region_add() use it too.
- Add a VFIODirtyRanges struct which is allocated from the stack as
  opposed to being stored in the container and make the listener be
  registered with it.
- Remove stale paragraph from commit message
  (patch 8)
- Unroll vfio_device_dma_logging_set() to its own code in start() which
fails early and returns, and stop() which is void and we never return
early.

Changes from v2 [5]:
- Split initial dirty page tracking support from the parent series to
  split into smaller parts.
- Replace an IOVATree with a simple two range setup: one range for 32-bit
  another one for 64-bit address space. After discussions it was sorted out
  this way due to unnecessary complexity of IOVAtree while being more
  efficient too without stressing so much of the UAPI limits. (patch 7 and 8) 
- For now exclude vIOMMU, and so add a live migration blocker if a
  vIOMMU is passed in. This will be followed up with vIOMMU support in
  a separate series. (patch 10)
- Add new patches to reuse most helpers used across memory listeners.
  This is useful for reusal when recording DMA ranges.  (patch 5 and 6)
- Adjust Documentation to avoid mentioning the vIOMMU and instead
  claim that vIOMMU with device dirty page tracking is blocked. Cedric
  gave a Rb, but I've dropped taking into consideration the split and no
  vIOMMU support (patch 13)
- Improve VFIOBitmap to avoid allocating a 16byte structure to
  place it on the stack. Remove the free helper function. (patch 4)
- Fixing the compilation issues (patch 8 and 10). Possibly not 100%
  addressed as I am still working out the env to repro it.

Changes from v1 [4]:
- Rebased on latest master branch. As part of it, made some changes in
  pre-copy to adjust it to Juan's new patches:
  1. Added a new patch that passes threshold_size parameter to
     .state_pending_{estimate,exact}() handlers.
  2. Added a new patch that refactors vfio_save_block().
  3. Changed the pre-copy patch to cache and report pending pre-copy
     size in the .state_pending_estimate() handler.
- Removed unnecessary P2P code. This should be added later on when P2P
  support is added. (Alex)
- Moved the dirty sync to be after the DMA unmap in vfio_dma_unmap()
  (patch #11). (Alex)
- Stored vfio_devices_all_device_dirty_tracking()'s value in a local
  variable in vfio_get_dirty_bitmap() so it can be re-used (patch #11).
- Refactored the viommu device dirty tracking ranges creation code to
  make it clearer (patch #15).
- Changed overflow check in vfio_iommu_range_is_device_tracked() to
  emphasize that we specifically check for 2^64 wrap around (patch #15).
- Added R-bs / Acks.

[1] https://lore.kernel.org/qemu-devel/167658846945.932837.1420176491103357684.stgit@omen/
[2] https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/
[3] https://lore.kernel.org/netdev/20220908183448.195262-4-yishaih@nvidia.com/
[4] https://lore.kernel.org/qemu-devel/20230126184948.10478-1-avihaih@nvidia.com/
[5] https://lore.kernel.org/qemu-devel/20230222174915.5647-1-avihaih@nvidia.com/
[6] https://lore.kernel.org/qemu-devel/20230304014343.33646-1-joao.m.martins@oracle.com/

Avihai Horon (6):
  vfio/common: Fix error reporting in vfio_get_dirty_bitmap()
  vfio/common: Fix wrong %m usages
  vfio/common: Abort migration if dirty log start/stop/sync fails
  vfio/common: Add VFIOBitmap and alloc function
  vfio/common: Extract code from vfio_get_dirty_bitmap() to new function
  docs/devel: Document VFIO device dirty page tracking

Joao Martins (8):
  vfio/common: Add helper to validate iova/end against hostwin
  vfio/common: Consolidate skip/invalid section into helper
  vfio/common: Add helper to consolidate iova/end calculation
  vfio/common: Record DMA mapped IOVA ranges
  vfio/common: Add device dirty page tracking start/stop
  vfio/common: Add device dirty page bitmap sync
  vfio/migration: Block migration with vIOMMU
  vfio/migration: Query device dirty page tracking support

 docs/devel/vfio-migration.rst |  46 ++-
 hw/vfio/common.c              | 685 ++++++++++++++++++++++++++++------
 hw/vfio/migration.c           |  20 +
 hw/vfio/pci.c                 |   1 +
 hw/vfio/trace-events          |   2 +
 include/hw/vfio/vfio-common.h |  17 +
 6 files changed, 634 insertions(+), 137 deletions(-)

-- 
2.17.2


