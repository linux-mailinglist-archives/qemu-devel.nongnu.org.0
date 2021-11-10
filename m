Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D444BC5C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 08:50:03 +0100 (CET)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkiMs-0004EZ-4Z
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 02:50:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mkiLJ-0002vw-8Y
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 02:48:25 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mkiLE-0003bD-EV
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 02:48:24 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hpxlp56yZz911c;
 Wed, 10 Nov 2021 15:47:50 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 15:48:05 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 10 Nov 2021 15:48:04 +0800
Subject: Re: [PATCH V6 19/27] vfio-pci: cpr part 1 (fd and dma)
To: Alex Williamson <alex.williamson@redhat.com>, Steve Sistare
 <steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-20-git-send-email-steven.sistare@oracle.com>
 <20210810110608.480af93b.alex.williamson@redhat.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <803a8bee-ec82-a41b-38ad-57d7ef572019@huawei.com>
Date: Wed, 10 Nov 2021 15:48:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210810110608.480af93b.alex.williamson@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhengchuan@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Xiexiangyou <xiexiangyou@huawei.com>, Stefan
 Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi, steve

On 2021/8/11 1:06, Alex Williamson wrote:
> On Fri,  6 Aug 2021 14:43:53 -0700
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> At vfio creation time, save the value of vfio container, group, and device
>> descriptors in cpr state.
>>
>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>> should not persist across miscellaneous fork and exec calls that may be
>> performed during normal operation.
>>
>> On qemu restart, vfio_realize() finds the descriptor env vars, uses
>> the descriptors, and notes that the device is being reused.  Device and
>> iommu state is already configured, so operations in vfio_realize that
>> would modify the configuration are skipped for a reused device, including
>> vfio ioctl's and writes to PCI configuration space.  The result is that
>> vfio_realize constructs qemu data structures that reflect the current
>> state of the device.  However, the reconstruction is not complete until
>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>> state.  It rebuilds vector data structures and attaches the interrupts to
>> the new KVM instance.  cpr-load then walks the flattened ranges of the
>> vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to inform the kernel
>> of the new VA's.  Lastly, it starts the VM and suppresses vfio device reset.
>>
>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>> support.  Part 3 adds INTX support.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  MAINTAINERS                   |   1 +
>>  hw/pci/pci.c                  |   4 ++
>>  hw/vfio/common.c              |  69 ++++++++++++++++--
>>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 |  57 +++++++++++++++
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/pci/pci.h          |   1 +
>>  include/hw/vfio/vfio-common.h |   5 ++
>>  include/migration/cpr.h       |   3 +
>>  linux-headers/linux/vfio.h    |   6 ++
>>  migration/cpr.c               |  10 ++-
>>  migration/target.c            |  14 ++++
>>  13 files changed, 325 insertions(+), 7 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a9d2ed8..3132965 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2904,6 +2904,7 @@ CPR
>>  M: Steve Sistare <steven.sistare@oracle.com>
>>  M: Mark Kanda <mark.kanda@oracle.com>
>>  S: Maintained
>> +F: hw/vfio/cpr.c
>>  F: include/migration/cpr.h
>>  F: migration/cpr.c
>>  F: qapi/cpr.json
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 59408a3..b9c6ca1 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -307,6 +307,10 @@ static void pci_do_device_reset(PCIDevice *dev)
>>  {
>>      int r;
>>  
>> +    if (dev->reused) {
>> +        return;
>> +    }
>> +
>>      pci_device_deassert_intx(dev);
>>      assert(dev->irq_state == 0);
>>  
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 7918c0d..872a1ac 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -31,6 +31,7 @@
>>  #include "exec/memory.h"
>>  #include "exec/ram_addr.h"
>>  #include "hw/hw.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/range.h"
>> @@ -464,6 +465,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
>>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
>>      }
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>>          /*
>>           * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
>> @@ -501,6 +506,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .size = size,
>>      };
>>  
>> +    if (container->reused) {
>> +        return 0;
>> +    }
>> +
>>      if (!readonly) {
>>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>>      }
>> @@ -1872,6 +1881,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>      if (iommu_type < 0) {
>>          return iommu_type;
>>      }
>> +    if (container->reused) {
>> +        container->iommu_type = iommu_type;
>> +        return 0;
>> +    }
>>  
> 
> I'd like to see more comments throughout, but particularly where we're
> dumping out of functions for reused containers, groups, and devices.
> For instance map/unmap we're assuming we'll reach the same IOMMU
> mapping state we had previously, how do we validate that, why can't we
> only set vaddr in the mapping path rather than skipping it for a later
> pass at the flatmap, do we actually see unmaps, is deferring listener
> registration an alternate option, which specific reset path are we
> trying to defer, why are VFIOPCIDevices the only PCIDevices that set
> reused, there are some assumptions about the iommu_type that could use
> further description, etc.
> 
>>      ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
>>      if (ret) {
>> @@ -1972,6 +1985,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>  {
>>      VFIOContainer *container;
>>      int ret, fd;
>> +    bool reused;
>>      VFIOAddressSpace *space;
>>  
>>      space = vfio_get_address_space(as);
>> @@ -2007,7 +2021,13 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>       * details once we know which type of IOMMU we are using.
>>       */
>>  
>> +    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
>> +    reused = (fd >= 0);
>> +
>>      QLIST_FOREACH(container, &space->containers, next) {
>> +        if (container->fd == fd) {
>> +            break;
>> +        }
>>          if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
> 
> 
> Letting the reused case call this ioctl feels a little sloppy.  I'm
> assuming we've tested this in a vIOMMU config or other setups where
> we'd actually have multiple containers and we're relying on the ioctl
> failing, but why call it at all if we already know the group is
> attached to a container.
> 
> 
>>              ret = vfio_ram_block_discard_disable(container, true);
>>              if (ret) {
>> @@ -2020,14 +2040,25 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                  }
>>                  return ret;
>>              }
>> -            group->container = container;
>> -            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (container) {
>> +        group->container = container;
>> +        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>> +        if (!reused) {
>>              vfio_kvm_device_add_group(group);
>> -            return 0;
>> +            cpr_save_fd("vfio_container_for_group", group->groupid,
>> +                        container->fd);
>>          }
>> +        return 0;
>> +    }
>> +
>> +    if (!reused) {
>> +        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>>      }
>>  
>> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>>          ret = -errno;
>> @@ -2045,6 +2076,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container = g_malloc0(sizeof(*container));
>>      container->space = space;
>>      container->fd = fd;
>> +    container->reused = reused;
>>      container->error = NULL;
>>      container->dirty_pages_supported = false;
>>      container->dma_max_mappings = 0;
>> @@ -2183,6 +2215,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      }
>>  
>>      container->initialized = true;
>> +    cpr_save_fd("vfio_container_for_group", group->groupid, fd);
>>  
>>      return 0;
>>  listener_release_exit:
>> @@ -2212,6 +2245,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>  
>>      QLIST_REMOVE(group, container_next);
>>      group->container = NULL;
>> +    cpr_delete_fd("vfio_container_for_group", group->groupid);
>>  
>>      /*
>>       * Explicitly release the listener first before unset container,
>> @@ -2253,6 +2287,7 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>      VFIOGroup *group;
>>      char path[32];
>>      struct vfio_group_status status = { .argsz = sizeof(status) };
>> +    bool reused;
>>  
>>      QLIST_FOREACH(group, &vfio_group_list, next) {
>>          if (group->groupid == groupid) {
>> @@ -2270,7 +2305,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>      group = g_malloc0(sizeof(*group));
>>  
>>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
>> -    group->fd = qemu_open_old(path, O_RDWR);
>> +
>> +    group->fd = cpr_find_fd("vfio_group", groupid);
>> +    reused = (group->fd >= 0);
>> +    if (!reused) {
>> +        group->fd = qemu_open_old(path, O_RDWR);
>> +    }
>> +
>>      if (group->fd < 0) {
>>          error_setg_errno(errp, errno, "failed to open %s", path);
>>          goto free_group_exit;
>> @@ -2304,6 +2345,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>>  
>>      QLIST_INSERT_HEAD(&vfio_group_list, group, next);
>>  
>> +    if (!reused) {
>> +        cpr_save_fd("vfio_group", groupid, group->fd);
>> +    }
>> +
>>      return group;
>>  
>>  close_fd_exit:
>> @@ -2328,6 +2373,7 @@ void vfio_put_group(VFIOGroup *group)
>>      vfio_disconnect_container(group);
>>      QLIST_REMOVE(group, next);
>>      trace_vfio_put_group(group->fd);
>> +    cpr_delete_fd("vfio_group", group->groupid);
>>      close(group->fd);
>>      g_free(group);
>>  
>> @@ -2341,8 +2387,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>  {
>>      struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>>      int ret, fd;
>> +    bool reused;
>> +
>> +    fd = cpr_find_fd(name, 0);
>> +    reused = (fd >= 0);
>> +    if (!reused) {
>> +        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>> +    }
>>  
>> -    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>>      if (fd < 0) {
>>          error_setg_errno(errp, errno, "error getting device from group %d",
>>                           group->groupid);
>> @@ -2387,6 +2439,10 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>>      vbasedev->num_irqs = dev_info.num_irqs;
>>      vbasedev->num_regions = dev_info.num_regions;
>>      vbasedev->flags = dev_info.flags;
>> +    vbasedev->reused = reused;
>> +    if (!reused) {
>> +        cpr_save_fd(name, 0, fd);
>> +    }
>>  
>>      trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
>>                            dev_info.num_irqs);
>> @@ -2403,6 +2459,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>>      QLIST_REMOVE(vbasedev, next);
>>      vbasedev->group = NULL;
>>      trace_vfio_put_base_device(vbasedev->fd);
>> +    cpr_delete_fd(vbasedev->name, 0);
>>      close(vbasedev->fd);
>>  }
>>  
>> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
>> new file mode 100644
>> index 0000000..0981d31
>> --- /dev/null
>> +++ b/hw/vfio/cpr.c
>> @@ -0,0 +1,160 @@
>> +/*
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <sys/ioctl.h>
>> +#include <linux/vfio.h>
>> +#include "hw/vfio/vfio-common.h"
>> +#include "sysemu/kvm.h"
>> +#include "qapi/error.h"
>> +#include "trace.h"
>> +
>> +static int
>> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_unmap unmap = {
>> +        .argsz = sizeof(unmap),
>> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
>> +        .iova = 0,
>> +        .size = 0,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
>> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
>> +                              ram_addr_t size, void *vaddr,
>> +                              Error **errp)
>> +{
>> +    struct vfio_iommu_type1_dma_map map = {
>> +        .argsz = sizeof(map),
>> +        .flags = VFIO_DMA_MAP_FLAG_VADDR,
>> +        .vaddr = (__u64)(uintptr_t)vaddr,
>> +        .iova = iova,
>> +        .size = size,
>> +    };
>> +    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
>> +        error_setg_errno(errp, errno,
>> +                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
>> +                         iova, size, vaddr);
>> +        return -errno;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int
>> +vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
>> +{
>> +    MemoryRegion *mr = section->mr;
>> +    VFIOContainer *container = handle;
>> +    const char *name = memory_region_name(mr);
>> +    ram_addr_t size = int128_get64(section->size);
>> +    hwaddr offset, iova, roundup;
>> +    void *vaddr;
>> +
>> +    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
> 
> A comment reminding us why we're also skipping iommu regions would be
> useful.  It's not clear to me why this needs to happen separately from
> the listener.  There's a sufficient degree of magic here that I'm
> afraid it's going to get broken too easily if it's left to me trying to
> remember how it's supposed to work.
> 
>> +        return 0;
>> +    }
>> +
>> +    offset = section->offset_within_address_space;
>> +    iova = REAL_HOST_PAGE_ALIGN(offset);
We should not do remap if it shares on host page with other structures.
I think a judgement like int128_ge((int128_make64(iova), llend)) in vfio_listener_region_add() should be also added here to check it,
otherwise it will remap no-exit dma which causes the live update failure.
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
index 0981d31..d231841 100644
--- a/hw/vfio/cpr.c
+++ b/hw/vfio/cpr.c
@@ -58,13 +58,21 @@ vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
     ram_addr_t size = int128_get64(section->size);
     hwaddr offset, iova, roundup;
     void *vaddr;
-
+    Int128 llend;
+
     if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
         return 0;
     }

     offset = section->offset_within_address_space;
     iova = REAL_HOST_PAGE_ALIGN(offset);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
+    if (int128_ge(int128_make64(iova), llend)) {
+        return 0;
+    }
+
     roundup = iova - offset;
     size -= roundup;
     size = REAL_HOST_PAGE_ALIGN(size);

>> +    roundup = iova - offset;
>> +    size -= roundup;
>> +    size = REAL_HOST_PAGE_ALIGN(size);
>> +    vaddr = memory_region_get_ram_ptr(mr) +
>> +            section->offset_within_region + roundup;
>> +
>> +    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
>> +    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
>> +}
>> +
>> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
>> +{
>> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
>> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
>> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
>> +                         "or VFIO_UNMAP_ALL");
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +int vfio_cpr_save(Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +    VFIOAddressSpace *space, *last_space;
>> +    VFIOContainer *container, *last_container;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_is_cpr_capable(container, errp)) {
>> +                return -1;
>> +            }
>> +        }
>> +    }
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
>> +                goto unwind;
>> +            }
>> +        }
>> +    }
>> +    return 0;
>> +
>> +unwind:
>> +    last_space = space;
>> +    last_container = container;
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            Error *err;
>> +
>> +            if (space == last_space && container == last_container) {
>> +                break;
>> +            }
> 
> Isn't it sufficient to only test the container?  I think we'd be in
> trouble if we found a container on multiple address space lists.  Too
> bad we don't have a continue_reverse foreach or it might be trivial to
> convert to a qtailq. 
> 
>> +            if (address_space_flat_for_each_section(space->as,
>> +                                                    vfio_region_remap,
>> +                                                    container, &err)) {
>> +                error_prepend(errp, "%s", error_get_pretty(err));
>> +                error_free(err);
>> +            }
>> +        }
>> +    }
>> +    return -1;
>> +}
>> +
>> +int vfio_cpr_load(Error **errp)
>> +{
>> +    VFIOAddressSpace *space;
>> +    VFIOContainer *container;
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
>> +        QLIST_FOREACH(container, &space->containers, next) {
>> +            if (!vfio_is_cpr_capable(container, errp)) {
>> +                return -1;
>> +            }
>> +            container->reused = false;
>> +            if (address_space_flat_for_each_section(space->as,
>> +                                                    vfio_region_remap,
>> +                                                    container, errp)) {
>> +                return -1;
>> +            }
>> +        }
>> +    }
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            vbasedev->reused = false;
>> +        }
>> +    }
> 
> The above is a bit disjoint between group/device and space/container,
> how about walking container->group_list rather than the global group
> list?
> 
>> +    return 0;
>> +}
>> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
>> index da9af29..e247b2b 100644
>> --- a/hw/vfio/meson.build
>> +++ b/hw/vfio/meson.build
>> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>>    'migration.c',
>>  ))
>>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
>> +  'cpr.c',
>>    'display.c',
>>    'pci-quirks.c',
>>    'pci.c',
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e8e371e..64e2557 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -29,6 +29,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/qdev-properties-system.h"
>>  #include "migration/vmstate.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/module.h"
>> @@ -2899,6 +2900,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>          vfio_put_group(group);
>>          goto error;
>>      }
>> +    pdev->reused = vdev->vbasedev.reused;
>>  
>>      vfio_populate_device(vdev, &err);
>>      if (err) {
>> @@ -3168,6 +3170,10 @@ static void vfio_pci_reset(DeviceState *dev)
>>  {
>>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>>  
>> +    if (vdev->pdev.reused) {
>> +        return;
>> +    }
> 
> Why are we the only ones using PCIDevice.reused and why are we testing
> that rather than VFIOPCIDevice.reused above?  These have different
> lifecycles and the difference is too subtle, esp. w/o comments.
> 
>> +
>>      trace_vfio_pci_reset(vdev->vbasedev.name);
>>  
>>      vfio_pci_pre_reset(vdev);
>> @@ -3275,6 +3281,56 @@ static Property vfio_pci_dev_properties[] = {
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>  
>> +static void vfio_merge_config(VFIOPCIDevice *vdev)
>> +{
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
>> +    g_autofree uint8_t *phys_config = g_malloc(size);
>> +    uint32_t mask;
>> +    int ret, i;
>> +
>> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
>> +    if (ret < size) {
>> +        ret = ret < 0 ? errno : EFAULT;
>> +        error_report("failed to read device config space: %s", strerror(ret));
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < size; i++) {
>> +        mask = vdev->emulated_config_bits[i];
>> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
>> +    }
>> +}
>> +
>> +static int vfio_pci_post_load(void *opaque, int version_id)
>> +{
>> +    VFIOPCIDevice *vdev = opaque;
>> +    PCIDevice *pdev = &vdev->pdev;
>> +
>> +    vfio_merge_config(vdev);
>> +
>> +    pdev->reused = false;
>> +
>> +    return 0;
>> +}
>> +
>> +static bool vfio_pci_needed(void *opaque)
>> +{
>> +    return cpr_mode() == CPR_MODE_RESTART;
>> +}
>> +
>> +static const VMStateDescription vfio_pci_vmstate = {
>> +    .name = "vfio-pci",
>> +    .unmigratable = 1,
> 
> 
> Doesn't this break the experimental (for now) migration support?
> 
> 
>> +    .version_id = 0,
>> +    .minimum_version_id = 0,
>> +    .post_load = vfio_pci_post_load,
>> +    .needed = vfio_pci_needed,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>> @@ -3282,6 +3338,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>>  
>>      dc->reset = vfio_pci_reset;
>>      device_class_set_props(dc, vfio_pci_dev_properties);
>> +    dc->vmsd = &vfio_pci_vmstate;
>>      dc->desc = "VFIO-based PCI device assignment";
>>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>      pdc->realize = vfio_realize;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 0ef1b5f..63dd0fe 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>>  vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>>  vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>>  vfio_dma_unmap_overflow_workaround(void) ""
>> +vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>>  
>>  # platform.c
>>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index bf5be06..f079423 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -360,6 +360,7 @@ struct PCIDevice {
>>      /* ID of standby device in net_failover pair */
>>      char *failover_pair_id;
>>      uint32_t acpi_index;
>> +    bool reused;
>>  };
>>  
>>  void pci_register_bar(PCIDevice *pci_dev, int region_num,
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index cb04cc6..0766cc4 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -85,6 +85,7 @@ typedef struct VFIOContainer {
>>      Error *error;
>>      bool initialized;
>>      bool dirty_pages_supported;
>> +    bool reused;
>>      uint64_t dirty_pgsizes;
>>      uint64_t max_dirty_bitmap_size;
>>      unsigned long pgsizes;
>> @@ -136,6 +137,7 @@ typedef struct VFIODevice {
>>      bool no_mmap;
>>      bool ram_block_discard_allowed;
>>      bool enable_migration;
>> +    bool reused;
>>      VFIODeviceOps *ops;
>>      unsigned int num_irqs;
>>      unsigned int num_regions;
>> @@ -212,6 +214,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
>>  void vfio_put_group(VFIOGroup *group);
>>  int vfio_get_device(VFIOGroup *group, const char *name,
>>                      VFIODevice *vbasedev, Error **errp);
>> +int vfio_cpr_save(Error **errp);
>> +int vfio_cpr_load(Error **errp);
>> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp);
>>  
>>  extern const MemoryRegionOps vfio_region_ops;
>>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
>> index 83f69c9..e9b987f 100644
>> --- a/include/migration/cpr.h
>> +++ b/include/migration/cpr.h
>> @@ -25,4 +25,7 @@ int cpr_state_load(Error **errp);
>>  CprMode cpr_state_mode(void);
>>  void cpr_state_print(void);
>>  
>> +int cpr_vfio_save(Error **errp);
>> +int cpr_vfio_load(Error **errp);
>> +
>>  #endif
>> diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
>> index e680594..48a02c0 100644
>> --- a/linux-headers/linux/vfio.h
>> +++ b/linux-headers/linux/vfio.h
>> @@ -52,6 +52,12 @@
>>  /* Supports the vaddr flag for DMA map and unmap */
>>  #define VFIO_UPDATE_VADDR		10
>            ^^^^^^^^^^^^^^^^^
> 
> It's already there.  Thanks,
> 
> Alex
> 
>>  
>> +/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
>> +#define VFIO_UNMAP_ALL                        9
>> +
>> +/* Supports VFIO DMA map and unmap with the VADDR flag */
>> +#define VFIO_UPDATE_VADDR              10
>> +
>>  /*
>>   * The IOCTL interface is designed for extensibility by embedding the
>>   * structure length (argsz) and flags into structures passed between
>> diff --git a/migration/cpr.c b/migration/cpr.c
>> index 72a5f4b..16f11bd 100644
>> --- a/migration/cpr.c
>> +++ b/migration/cpr.c
>> @@ -7,6 +7,7 @@
>>  
>>  #include "qemu/osdep.h"
>>  #include "exec/memory.h"
>> +#include "hw/vfio/vfio-common.h"
>>  #include "io/channel-buffer.h"
>>  #include "io/channel-file.h"
>>  #include "migration.h"
>> @@ -108,7 +109,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
>>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>>          return;
>>      }
>> -
>> +    if (cpr_vfio_save(errp)) {
>> +        return;
>> +    }
>>      cpr_walk_fd(preserve_fd, 0);
>>      if (cpr_state_save(errp)) {
>>          return;
>> @@ -148,6 +151,11 @@ void qmp_cpr_load(const char *filename, Error **errp)
>>          goto out;
>>      }
>>  
>> +    if (cpr_active_mode == CPR_MODE_RESTART &&
>> +        cpr_vfio_load(errp)) {
>> +        goto out;
>> +    }
>> +
>>      state = global_state_get_runstate();
>>      if (state == RUN_STATE_RUNNING) {
>>          vm_start();
>> diff --git a/migration/target.c b/migration/target.c
>> index 4390bf0..984bc9e 100644
>> --- a/migration/target.c
>> +++ b/migration/target.c
>> @@ -8,6 +8,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/qapi-types-migration.h"
>>  #include "migration.h"
>> +#include "migration/cpr.h"
>>  #include CONFIG_DEVICES
>>  
>>  #ifdef CONFIG_VFIO
>> @@ -22,8 +23,21 @@ void populate_vfio_info(MigrationInfo *info)
>>          info->vfio->transferred = vfio_mig_bytes_transferred();
>>      }
>>  }
>> +
>> +int cpr_vfio_save(Error **errp)
>> +{
>> +    return vfio_cpr_save(errp);
>> +}
>> +
>> +int cpr_vfio_load(Error **errp)
>> +{
>> +    return vfio_cpr_load(errp);
>> +}
>> +
>>  #else
>>  
>>  void populate_vfio_info(MigrationInfo *info) {}
>> +int cpr_vfio_save(Error **errp) { return 0; }
>> +int cpr_vfio_load(Error **errp) { return 0; }
>>  
>>  #endif /* CONFIG_VFIO */
> 
> .
> 

-- 
Regards.
Chuan

