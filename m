Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21486ADF48
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWqz-0005Mm-FV; Tue, 07 Mar 2023 07:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWqw-0005Lk-RX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWqt-00052v-Rb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:38 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32784EAD032061; Tue, 7 Mar 2023 12:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=fLbsFowIYoqdL/+HqdpYcek35ndENAz9a7nae20ADjo=;
 b=qEig5/PLYEp+1dr7fnEc4wq/B40MxNDSeelUw7xj8Uurfw6YTkvuWaAYF5x4ZZ2sNrf3
 iRSnfAWe493m6HxR4ErJWx5M+Q7UXdP2P7abmIynJQGWC3PEloI+tJxD6LR/HzGkc/Kd
 +nxENMTEFyojzTZIWGKLB6M1IJpYN1Mp+bq32Yu3WDnailRyDBCZdMapI0qU1rWkC+ID
 xlr9ixQ9mCvMIOQq2VX9QZZAonKH7Q4J/ycMSeyqZpNufrzgApj9oFwsnda1HPSoO8N6
 /TcUwKJQaziGjJRyRAW3VLDRA2XmkUXLHTFLGrXFjFuvf1ktVZMHOoxsyK1QAZBuNX/T jA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xwdhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:33 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327C8dmp029280; Tue, 7 Mar 2023 12:55:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyej6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:31 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV4x004358;
 Tue, 7 Mar 2023 12:55:31 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-1; Tue, 07 Mar 2023 12:55:31 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 00/15] vfio/migration: Device dirty page tracking
Date: Tue,  7 Mar 2023 12:54:35 +0000
Message-Id: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: jN98GFO6Zxgwv9N1mBfwVb59q0JbLszN
X-Proofpoint-ORIG-GUID: jN98GFO6Zxgwv9N1mBfwVb59q0JbLszN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

- Patches 1-8: Fix bugs and do some preparatory work required prior to
  adding device dirty page tracking.
- Patches 9-11: Implement device dirty page tracking.
- Patch 13: Blocks live migration with vIOMMU.
- Patches 14-15 Detect device dirty page tracking and document it.

Comments, improvements as usual appreciated.

Thanks,
	Joao

Changes from v4 [7]:
- Add a new patch which consolidates all region skips into a single
     tracepoint
  (*new* patch 6)
- Add a name to vfio_listener_valid_section() to be able to use the new
     tracepoint
  (patch 7, 9)
- Use the new vfio_get_section_iova_range() in region_del listener too
  Remove stale comment
  (patch 8)
- Rename VFIODirtyRanges to VFIODirtyRangesListener
  Rename VFIODirtyTrackingRange to VFIODirtyRanges
  Move both of these types to be private in vfio/common.c
  Allocate VFIODirtyRangesListener in the stack in vfio_dirty_tracking_init() 
    while passing instead a VFIODirtyRange argument, as the ranges is the
    only thing we care about
  Fix range check which would exclude UINT32_MAX - 1 from tracking
  Remove the !range->min64 check
  Simplify the dirty tracking listener update for readability
  (patch 9)
- Fix various comment messages
- Remove unneeded ret variable in vfio_devices_dma_logging_stop() and
  fix the error message
  (patch 10)
- Fix one remnant style issue of initializing features::flags
  (patch 14)
- Add Rbs in patches 5, 6, 14.

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
[7] https://lore.kernel.org/qemu-devel/20230307020258.58215-1-joao.m.martins@oracle.com/ 

Avihai Horon (6):
  vfio/common: Fix error reporting in vfio_get_dirty_bitmap()
  vfio/common: Fix wrong %m usages
  vfio/common: Abort migration if dirty log start/stop/sync fails
  vfio/common: Add VFIOBitmap and alloc function
  vfio/common: Extract code from vfio_get_dirty_bitmap() to new function
  docs/devel: Document VFIO device dirty page tracking

Joao Martins (9):
  vfio/common: Add helper to validate iova/end against hostwin
  vfio/common: Use a single tracepoint for skipped sections
  vfio/common: Consolidate skip/invalid section into helper
  vfio/common: Add helper to consolidate iova/end calculation
  vfio/common: Record DMA mapped IOVA ranges
  vfio/common: Add device dirty page tracking start/stop
  vfio/common: Add device dirty page bitmap sync
  vfio/migration: Block migration with vIOMMU
  vfio/migration: Query device dirty page tracking support

 docs/devel/vfio-migration.rst |  46 ++-
 hw/vfio/common.c              | 699 +++++++++++++++++++++++++++-------
 hw/vfio/migration.c           |  20 +
 hw/vfio/pci.c                 |   1 +
 hw/vfio/trace-events          |   5 +-
 include/hw/vfio/vfio-common.h |   4 +
 6 files changed, 628 insertions(+), 147 deletions(-)

-- 
2.17.2


