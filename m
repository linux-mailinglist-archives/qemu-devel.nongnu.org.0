Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE783298A57
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 11:26:49 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWziC-0003QG-Rp
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 06:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzS5-0007kl-5r
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:10:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWzS1-0007tH-Rg
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 06:10:08 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f96a0820000>; Mon, 26 Oct 2020 03:10:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct
 2020 10:09:52 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 26 Oct 2020 10:09:43 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH v29 00/17] Add migration support for VFIO devices
Date: Mon, 26 Oct 2020 15:06:10 +0530
Message-ID: <1603704987-20977-1-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603707010; bh=p4xWT4nr2UPR6QW9pfAM44lVPnu+wyWMFDFMpzLJQdY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
 MIME-Version:Content-Type;
 b=Q9lRCK/C6ALwQj6P+TOvU/TFuMFswdcfbdESlAs4Ccy1hKCQD9JdEUsKXrPvisdDT
 Omk6+VvFR11cncuxSbwCTHbsAj8kbIxDM82WYLA/dUvbMpRf123JE4oOR/wmLpdHas
 vMZtRmhvu+I35koo73ut+VEtgSdSEufIQsz9BbfaBfhAJR8/7ccSyoy1X1gsADKeFR
 /DoBzGi/d7UCSNrrVNMiPs4juIhvyfR8+p684pGTffhTX9aoKMRfAWthzMVbKxbnF/
 69UlYgHpRGVWXk/N9UN34pRTxaCL2iHQXB6CjiG3JUgddNnzr3fhg9aGbNuQ1BRtSk
 mkpe+M6PY4a8A==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 06:10:03
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This Patch set adds migration support for VFIO devices in QEMU.

This Patch set include patches as below:
Patch 1-2:
- Few code refactor

Patch 3:
- Added save and restore functions for PCI configuration space. Used
  pci_device_save() and pci_device_load() so that config space cache is saved
  and restored.

Patch 4-9:
- Generic migration functionality for VFIO device.
  * This patch set adds functionality for PCI devices, but can be
    extended to other VFIO devices.
  * Added all the basic functions required for pre-copy, stop-and-copy and
    resume phases of migration.
  * Added state change notifier and from that notifier function, VFIO
    device's state changed is conveyed to VFIO device driver.
  * During save setup phase and resume/load setup phase, migration region
    is queried and is used to read/write VFIO device data.
  * .save_live_pending and .save_live_iterate are implemented to use QEMU's
    functionality of iteration during pre-copy phase.
  * In .save_live_complete_precopy, that is in stop-and-copy phase,
    iteration to read data from VFIO device driver is implemented till pending
    bytes returned by driver are zero.

Patch 10
- Set DIRTY_MEMORY_MIGRATION flag in dirty log mask for migration with vIOMMU
  enabled.

Patch 11:
- Get migration capability from kernel module.

Patch 12-13:
- Add function to start and stop dirty pages tracking.
- Add vfio_listerner_log_sync to mark dirty pages. Dirty pages bitmap is queried
  per container. All pages pinned by vendor driver through vfio_pin_pages
  external API has to be marked as dirty during  migration.
  When there are CPU writes, CPU dirty page tracking can identify dirtied
  pages, but any page pinned by vendor driver can also be written by
  device. As of now there is no device which has hardware support for
  dirty page tracking. So all pages which are pinned by vendor driver
  should be considered as dirty.
  In Qemu, marking pages dirty is only done when device is in stop-and-copy
  phase because if pages are marked dirty during pre-copy phase and content is
  transfered from source to distination, there is no way to know newly dirtied
  pages from the point they were copied earlier until device stops. To avoid
  repeated copy of same content, pinned pages are marked dirty only during
  stop-and-copy phase.

Patch 14:
  When vIOMMU is enabled, used IOMMU notifier to get call back for mapped pages
  on replay during stop-and-copy phase.

Patch 15:
- With vIOMMU, IO virtual address range can get unmapped while in pre-copy
  phase of migration. In that case, unmap ioctl should return pages pinned
  in that range and QEMU should report corresponding guest physical pages
  dirty.

Patch 16:
- Make VFIO PCI device migration capable. If migration region is not provided by
  driver, migration is blocked.

Patch 17:
- Added VFIO device stats to MigrationInfo

Yet TODO:
Since there is no device which has hardware support for system memmory
dirty bitmap tracking, right now there is no other API from vendor driver
to VFIO IOMMU module to report dirty pages. In future, when such hardware
support will be implemented, an API will be required in kernel such that
vendor driver could report dirty pages to VFIO module during migration phases.

Below is the flow of state change for live migration where states in brackets
represent VM state, migration state and VFIO device state as:
    (VM state, MIGRATION_STATUS, VFIO_DEVICE_STATE)

Live migration save path:
        QEMU normal running state
        (RUNNING, _NONE, _RUNNING)
                        |
    migrate_init spawns migration_thread.
    (RUNNING, _SETUP, _RUNNING|_SAVING)
    Migration thread then calls each device's .save_setup()
                        |
    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
    If device is active, get pending bytes by .save_live_pending()
    if pending bytes >= threshold_size,  call save_live_iterate()
    Data of VFIO device for pre-copy phase is copied.
    Iterate till total pending bytes converge and are less than threshold
                        |
    On migration completion, vCPUs stops and calls .save_live_complete_precopy
    for each active device. VFIO device is then transitioned in
     _SAVING state.
    (FINISH_MIGRATE, _DEVICE, _SAVING)
    For VFIO device, iterate in .save_live_complete_precopy until
    pending data is 0.
    (FINISH_MIGRATE, _DEVICE, _STOPPED)
                        |
    (FINISH_MIGRATE, _COMPLETED, _STOPPED)
    Migraton thread schedule cleanup bottom half and exit

Live migration resume path:
    Incomming migration calls .load_setup for each device
    (RESTORE_VM, _ACTIVE, _STOPPED)
                        |
    For each device, .load_state is called for that device section data
    (RESTORE_VM, _ACTIVE, _RESUMING)
                        |
    At the end, called .load_cleanup for each device and vCPUs are started.
                        |
        (RUNNING, _NONE, _RUNNING)

Note that:
- Migration post copy is not supported.

v28 -> 29
- Nit picks.
- Write through PCI_COMMAND register on loading PCI config space as suggested by
  Yan.

v27 -> 28
- Nit picks and minor changes suggested by Alex.

v26 -> 27
- Major change in Patch 3 -PCI config space save and long using VMSTATE_*
- Major change in Patch 14 - Dirty page tracking when vIOMMU is enabled using IOMMU notifier and
  its replay functionality - as suggested by Alex.
- Some Structure changes to keep all migration related members at one place.
- Pulled fix suggested by Zhi Wang <zhi.wang.linux@gmail.com>
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg743722.html
- Add comments where even suggested and required.

v25 -> 26
- Removed emulated_config_bits cache and vdev->pdev.wmask from config space save
  load functions.
- Used VMStateDescription for config space save and load functionality.
- Major fixes from previous version review.
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg714625.html

v23 -> 25
- Updated config space save and load to save config cache, emulated bits cache
  and wmask cache.
- Created idr string as suggested by Dr Dave that includes bus path.
- Updated save and load function to read/write data to mixed regions, mapped or
  trapped.
- When vIOMMU is enabled, created mapped iova range list which also keeps
  translated address. This list is used to mark dirty pages. This reduces
  downtime significantly with vIOMMU enabled than migration patches from
   previous version. 
- Removed get_address_limit() function from v23 patch as this not required now.

v22 -> v23
-- Fixed issue reported by Yan
https://lore.kernel.org/kvm/97977ede-3c5b-c5a5-7858-7eecd7dd531c@nvidia.com/
- Sending this version to test v23 kernel version patches:
https://lore.kernel.org/kvm/1589998088-3250-1-git-send-email-kwankhede@nvidia.com/

v18 -> v22
- Few fixes from v18 review. But not yet fixed all concerns. I'll address those
  concerns in subsequent iterations.
- Sending this version to test v22 kernel version patches:
https://lore.kernel.org/kvm/1589781397-28368-1-git-send-email-kwankhede@nvidia.com/

v16 -> v18
- Nit fixes
- Get migration capability flags from container
- Added VFIO stats to MigrationInfo
- Fixed bug reported by Yan
    https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg00004.html

v9 -> v16
- KABI almost finalised on kernel patches.
- Added support for migration with vIOMMU enabled.

v8 -> v9:
- Split patch set in 2 sets, Kernel and QEMU sets.
- Dirty pages bitmap is queried from IOMMU container rather than from
  vendor driver for per device. Added 2 ioctls to achieve this.

v7 -> v8:
- Updated comments for KABI
- Added BAR address validation check during PCI device's config space load as
  suggested by Dr. David Alan Gilbert.
- Changed vfio_migration_set_state() to set or clear device state flags.
- Some nit fixes.

v6 -> v7:
- Fix build failures.

v5 -> v6:
- Fix build failure.

v4 -> v5:
- Added decriptive comment about the sequence of access of members of structure
  vfio_device_migration_info to be followed based on Alex's suggestion
- Updated get dirty pages sequence.
- As per Cornelia Huck's suggestion, added callbacks to VFIODeviceOps to
  get_object, save_config and load_config.
- Fixed multiple nit picks.
- Tested live migration with multiple vfio device assigned to a VM.

v3 -> v4:
- Added one more bit for _RESUMING flag to be set explicitly.
- data_offset field is read-only for user space application.
- data_size is read for every iteration before reading data from migration, that
  is removed assumption that data will be till end of migration region.
- If vendor driver supports mappable sparsed region, map those region during
  setup state of save/load, similarly unmap those from cleanup routines.
- Handles race condition that causes data corruption in migration region during
  save device state by adding mutex and serialiaing save_buffer and
  get_dirty_pages routines.
- Skip called get_dirty_pages routine for mapped MMIO region of device.
- Added trace events.
- Splitted into multiple functional patches.

v2 -> v3:
- Removed enum of VFIO device states. Defined VFIO device state with 2 bits.
- Re-structured vfio_device_migration_info to keep it minimal and defined action
  on read and write access on its members.

v1 -> v2:
- Defined MIGRATION region type and sub-type which should be used with region
  type capability.
- Re-structured vfio_device_migration_info. This structure will be placed at 0th
  offset of migration region.
- Replaced ioctl with read/write for trapped part of migration region.
- Added both type of access support, trapped or mmapped, for data section of the
  region.
- Moved PCI device functions to pci file.
- Added iteration to get dirty page bitmap until bitmap for all requested pages
  are copied.

Thanks,
Kirti


Kirti Wankhede (17):
  vfio: Add function to unmap VFIO region
  vfio: Add vfio_get_object callback to VFIODeviceOps
  vfio: Add save and load functions for VFIO PCI devices
  vfio: Add migration region initialization and finalize function
  vfio: Add VM state change handler to know state of VM
  vfio: Add migration state change notifier
  vfio: Register SaveVMHandlers for VFIO device
  vfio: Add save state functions to SaveVMHandlers
  vfio: Add load state functions to SaveVMHandlers
  memory: Set DIRTY_MEMORY_MIGRATION when IOMMU is enabled
  vfio: Get migration capability flags for container
  vfio: Add function to start and stop dirty pages tracking
  vfio: Add vfio_listener_log_sync to mark dirty pages
  vfio: Dirty page tracking when vIOMMU is enabled
  vfio: Add ioctl to get dirty pages bitmap during dma unmap
  vfio: Make vfio-pci device migration capable
  qapi: Add VFIO devices migration stats in Migration stats

 hw/vfio/common.c              | 441 +++++++++++++++++++-
 hw/vfio/meson.build           |   1 +
 hw/vfio/migration.c           | 933 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 |  87 +++-
 hw/vfio/pci.h                 |   1 -
 hw/vfio/trace-events          |  21 +
 include/hw/vfio/vfio-common.h |  26 ++
 migration/migration.c         |  17 +
 monitor/hmp-cmds.c            |   6 +
 qapi/migration.json           |  17 +
 softmmu/memory.c              |   2 +-
 11 files changed, 1508 insertions(+), 44 deletions(-)
 create mode 100644 hw/vfio/migration.c

-- 
2.7.0


