Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407354D0AF6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:22:39 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLkU-0005G7-Ah
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nRLeR-0000dW-By
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nRLeO-0001Hm-5F
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5xiH6dQlVe3PPNe3dWqkwzGEDWVIQwXDlDU6yMEWIw=;
 b=KqEgCGJD4zAcArK9aBtP/yREDSuIXJCUJ9bc8ywbCGuoatbP4S0eII5iUv1yhPBF5EsGIq
 KJf3t8BYr6p0ccHbYZ9oZx8J6ld5nwNjuWVwwKJeMSXJ4iLMl4n7nCiY4QYDvJKAnIk1Z9
 GaNTZuqqhsT89+ZFLQV4TzHeyVKk3fw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-HGTg8arQM5a7hZvL5MK1gQ-1; Mon, 07 Mar 2022 17:16:13 -0500
X-MC-Unique: HGTg8arQM5a7hZvL5MK1gQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 s22-20020a0568301c7600b005b231252cb8so4436487otg.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5xiH6dQlVe3PPNe3dWqkwzGEDWVIQwXDlDU6yMEWIw=;
 b=PkkI0G5PTF7tJQC/VFpgRFH0d69R0n/i60lDYdHRe6Hcho739fDOzf+jx7xpH27CPX
 gDDK92Rm7DsL4bsYy2Wo/WvkauOv6xPvxrWoJkGxPQDPbLzG09Acslfi9lVcUdMaFo8T
 bwEKCTNspr6VdV5vT5X13NvNPVBadO71HQgXKYfnDx498WaTd3ClenWC5mbJ03WK4Vxe
 uUrahgg2yZyTcyWyAuEMReYgb2x0i/FNpStfCZnzrVfhbWpfbMDvsswaJqQt2wn5XW4A
 RHNqKJ3VW1EFn7pedm1OkGWH4ob07Yh2c/YSW1ostLnlRnH3AEAsSP6K3ogw66D9jvTA
 RKRQ==
X-Gm-Message-State: AOAM531a16KydD7dHRrIafvea1uejgtYZv1FCBfEjeHAXgSKvWV2969a
 f0fMpLEESWjzHam+tXdb8n3VM3CoZZoX3beoU1l81jXvT6D/yJphPCbEexVt2089fmNTWy8gHIv
 FUDb94Bp8Iusk0AQ=
X-Received: by 2002:aca:1813:0:b0:2d9:a01a:4bf0 with SMTP id
 h19-20020aca1813000000b002d9a01a4bf0mr737669oih.279.1646691372557; 
 Mon, 07 Mar 2022 14:16:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZyWUHLwxWMYpXxXz9BSM5BIwsnWSiI53cjitj5+j0cu1cpKApCG8fTWsiLE98mzIpBlEA6w==
X-Received: by 2002:aca:1813:0:b0:2d9:a01a:4bf0 with SMTP id
 h19-20020aca1813000000b002d9a01a4bf0mr737634oih.279.1646691371971; 
 Mon, 07 Mar 2022 14:16:11 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 e7-20020a9d2a87000000b005af548abe73sm6926909otb.4.2022.03.07.14.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:16:11 -0800 (PST)
Date: Mon, 7 Mar 2022 15:16:10 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Message-ID: <20220307151610.0d8b2269.alex.williamson@redhat.com>
In-Reply-To: <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Dec 2021 11:05:24 -0800
Steve Sistare <steven.sistare@oracle.com> wrote:

> Enable vfio-pci devices to be saved and restored across an exec restart
> of qemu.
> 
> At vfio creation time, save the value of vfio container, group, and device
> descriptors in cpr state.
> 
> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
> at a different VA after exec.  DMA to already-mapped pages continues.  Save
> the msi message area as part of vfio-pci vmstate, save the interrupt and
> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
> vfio descriptors.  The flag is not cleared earlier because the descriptors
> should not persist across miscellaneous fork and exec calls that may be
> performed during normal operation.
> 
> On qemu restart, vfio_realize() finds the saved descriptors, uses
> the descriptors, and notes that the device is being reused.  Device and
> iommu state is already configured, so operations in vfio_realize that
> would modify the configuration are skipped for a reused device, including
> vfio ioctl's and writes to PCI configuration space.  The result is that
> vfio_realize constructs qemu data structures that reflect the current
> state of the device.  However, the reconstruction is not complete until
> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
> state.  It rebuilds vector data structures and attaches the interrupts to
> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
> which walks the flattened ranges of the vfio_address_spaces and calls
> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
> starts the VM and suppresses vfio pci device reset.
> 
> This functionality is delivered by 3 patches for clarity.  Part 1 handles
> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
> support.  Part 3 adds INTX support.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  MAINTAINERS                   |   1 +
>  hw/pci/pci.c                  |  10 ++++
>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |   1 +
>  include/hw/pci/pci.h          |   1 +
>  include/hw/vfio/vfio-common.h |   8 +++
>  include/migration/cpr.h       |   3 ++
>  migration/cpr.c               |  10 +++-
>  migration/target.c            |  14 +++++
>  12 files changed, 324 insertions(+), 11 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfe7480..feed239 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2992,6 +2992,7 @@ CPR
>  M: Steve Sistare <steven.sistare@oracle.com>
>  M: Mark Kanda <mark.kanda@oracle.com>
>  S: Maintained
> +F: hw/vfio/cpr.c
>  F: include/migration/cpr.h
>  F: migration/cpr.c
>  F: qapi/cpr.json
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 0fd21e1..e35df4f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
>  {
>      int r;
>  
> +    /*
> +     * A reused vfio-pci device is already configured, so do not reset it
> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
> +     * updated with new state in cpr-load with no ill effects.
> +     */
> +    if (dev->reused) {
> +        return;
> +    }
> +
>      pci_device_deassert_intx(dev);
>      assert(dev->irq_state == 0);
>  
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 5b87f95..90f66ad 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -31,6 +31,7 @@
>  #include "exec/memory.h"
>  #include "exec/ram_addr.h"
>  #include "hw/hw.h"
> +#include "migration/cpr.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> @@ -459,6 +460,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
>          .size = size,
>      };
>  
> +    assert(!container->reused);
> +
>      if (iotlb && container->dirty_pages_supported &&
>          vfio_devices_all_running_and_saving(container)) {
>          return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
> @@ -495,12 +498,24 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>  {
>      struct vfio_iommu_type1_dma_map map = {
>          .argsz = sizeof(map),
> -        .flags = VFIO_DMA_MAP_FLAG_READ,
>          .vaddr = (__u64)(uintptr_t)vaddr,
>          .iova = iova,
>          .size = size,
>      };
>  
> +    /*
> +     * Set the new vaddr for any mappings registered during cpr-load.
> +     * Reused is cleared thereafter.
> +     */
> +    if (container->reused) {
> +        map.flags = VFIO_DMA_MAP_FLAG_VADDR;
> +        if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
> +            goto fail;
> +        }
> +        return 0;
> +    }
> +
> +    map.flags = VFIO_DMA_MAP_FLAG_READ;
>      if (!readonly) {
>          map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
>      }
> @@ -516,7 +531,9 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>          return 0;
>      }
>  
> -    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
> +fail:
> +    error_report("vfio_dma_map %s (iova %lu, size %ld, va %p): %s",
> +        (container->reused ? "VADDR" : ""), iova, size, vaddr, strerror(errno));
>      return -errno;
>  }
>  
> @@ -865,6 +882,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> +    vfio_container_region_add(container, section);
> +}
> +
> +void vfio_container_region_add(VFIOContainer *container,
> +                               MemoryRegionSection *section)
> +{
>      hwaddr iova, end;
>      Int128 llend, llsize;
>      void *vaddr;
> @@ -985,6 +1008,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          int iommu_idx;
>  
>          trace_vfio_listener_region_add_iommu(iova, end);
> +
>          /*
>           * FIXME: For VFIO iommu types which have KVM acceleration to
>           * avoid bouncing all map/unmaps through qemu this way, this
> @@ -1459,6 +1483,12 @@ static void vfio_listener_release(VFIOContainer *container)
>      }
>  }
>  
> +void vfio_listener_register(VFIOContainer *container)
> +{
> +    container->listener = vfio_memory_listener;
> +    memory_listener_register(&container->listener, container->space->as);
> +}
> +
>  static struct vfio_info_cap_header *
>  vfio_get_cap(void *ptr, uint32_t cap_offset, uint16_t id)
>  {
> @@ -1878,6 +1908,18 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>  {
>      int iommu_type, ret;
>  
> +    /*
> +     * If container is reused, just set its type and skip the ioctls, as the
> +     * container and group are already configured in the kernel.
> +     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
> +     * If you ever add new types or spapr cpr support, kind reader, please
> +     * also implement VFIO_GET_IOMMU.
> +     */

VFIO_CHECK_EXTENSION should be able to tell us this, right?  Maybe the
problem is that vfio_iommu_type1_check_extension() should actually base
some of the details on the instantiated vfio_iommu, ex.

	switch (arg) {
	case VFIO_TYPE1_IOMMU:
		return (iommu && iommu->v2) ? 0 : 1;
	case VFIO_UNMAP_ALL:
	case VFIO_UPDATE_VADDR:
	case VFIO_TYPE1v2_IOMMU:
		return (iommu && !iommu->v2) ? 0 : 1;
	case VFIO_TYPE1_NESTING_IOMMU:
		return (iommu && !iommu->nesting) ? 0 : 1;
	...

We can't support v1 if we've already set a v2 container and vice versa.
There are probably some corner cases and compatibility to puzzle
through, but I wouldn't think we need a new ioctl to check this.


> +    if (container->reused) {
> +        container->iommu_type = VFIO_TYPE1v2_IOMMU;
> +        return 0;
> +    }
> +
>      iommu_type = vfio_get_iommu_type(container, errp);
>      if (iommu_type < 0) {
>          return iommu_type;
> @@ -1982,9 +2024,12 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>  {
>      VFIOContainer *container;
>      int ret, fd;
> +    bool reused;
>      VFIOAddressSpace *space;
>  
>      space = vfio_get_address_space(as);
> +    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
> +    reused = (fd > 0);
>  
>      /*
>       * VFIO is currently incompatible with discarding of RAM insofar as the
> @@ -2017,8 +2062,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>       * details once we know which type of IOMMU we are using.
>       */
>  
> +    /*
> +     * If the container is reused, then the group is already attached in the
> +     * kernel.  If a container with matching fd is found, then update the
> +     * userland group list and return.  It not, then after the loop, create

s/It/If/

> +     * the container struct and group list.
> +     */
> +
>      QLIST_FOREACH(container, &space->containers, next) {
> -        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
> +        if ((reused && container->fd == fd) ||
> +            !ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {


We can have multiple containers, so this can still call the ioctl when
reused = true.  I think it still works, but it's a bit ugly, we're
relying on the ioctl failing when the container is already set for the
group.  Does this need to be something like:

        if (reused) {
            if (container->fd != fd) {
                continue;
            }
        } else if (ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
            continue;
        }

>              ret = vfio_ram_block_discard_disable(container, true);
>              if (ret) {
>                  error_setg_errno(errp, -ret,
> @@ -2032,12 +2085,19 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>              }
>              group->container = container;
>              QLIST_INSERT_HEAD(&container->group_list, group, container_next);
> -            vfio_kvm_device_add_group(group);
> +            if (!reused) {
> +                vfio_kvm_device_add_group(group);
> +                cpr_save_fd("vfio_container_for_group", group->groupid,
> +                            container->fd);
> +            }
>              return 0;
>          }
>      }
>  
> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
> +    if (!reused) {
> +        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
> +    }
> +
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>          ret = -errno;
> @@ -2055,6 +2115,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container = g_malloc0(sizeof(*container));
>      container->space = space;
>      container->fd = fd;
> +    container->reused = reused;
>      container->error = NULL;
>      container->dirty_pages_supported = false;
>      container->dma_max_mappings = 0;
> @@ -2181,9 +2242,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      group->container = container;
>      QLIST_INSERT_HEAD(&container->group_list, group, container_next);
>  
> -    container->listener = vfio_memory_listener;
> -
> -    memory_listener_register(&container->listener, container->space->as);
> +    /*
> +     * If reused, register the listener later, after all state that may
> +     * affect regions and mapping boundaries has been cpr-load'ed.  Later,
> +     * the listener will invoke its callback on each flat section and call
> +     * vfio_dma_map to supply the new vaddr, and the calls will match the
> +     * mappings remembered by the kernel.
> +     */
> +    if (!reused) {
> +        vfio_listener_register(container);
> +    }
>  
>      if (container->error) {
>          ret = -1;
> @@ -2193,6 +2261,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      }
>  
>      container->initialized = true;
> +    if (!reused) {
> +        cpr_save_fd("vfio_container_for_group", group->groupid, fd);
> +    }
>  
>      return 0;
>  listener_release_exit:
> @@ -2222,6 +2293,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>  
>      QLIST_REMOVE(group, container_next);
>      group->container = NULL;
> +    cpr_delete_fd("vfio_container_for_group", group->groupid);

Did you consider having cpr_save_fd() do a find_name() and update/no-op
if found so that we can casually call cpr_save_fd() without nesting it
in a branch the same as done for cpr_delete_fd()?

>  
>      /*
>       * Explicitly release the listener first before unset container,
> @@ -2270,6 +2342,7 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>      VFIOGroup *group;
>      char path[32];
>      struct vfio_group_status status = { .argsz = sizeof(status) };
> +    bool reused;
>  
>      QLIST_FOREACH(group, &vfio_group_list, next) {
>          if (group->groupid == groupid) {
> @@ -2287,7 +2360,13 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>      group = g_malloc0(sizeof(*group));
>  
>      snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
> -    group->fd = qemu_open_old(path, O_RDWR);
> +
> +    group->fd = cpr_find_fd("vfio_group", groupid);
> +    reused = (group->fd >= 0);
> +    if (!reused) {
> +        group->fd = qemu_open_old(path, O_RDWR);
> +    }
> +
>      if (group->fd < 0) {
>          error_setg_errno(errp, errno, "failed to open %s", path);
>          goto free_group_exit;
> @@ -2321,6 +2400,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>  
>      QLIST_INSERT_HEAD(&vfio_group_list, group, next);
>  
> +    if (!reused) {
> +        cpr_save_fd("vfio_group", groupid, group->fd);
> +    }

If cpr_save_fd() were idempotent as above, we wouldn't need the reused
variable here and the previous chunk could be simplified.  It might
even suggest a function like "cpr_find_or_open_fd()".

> +
>      return group;
>  
>  close_fd_exit:
> @@ -2345,6 +2428,7 @@ void vfio_put_group(VFIOGroup *group)
>      vfio_disconnect_container(group);
>      QLIST_REMOVE(group, next);
>      trace_vfio_put_group(group->fd);
> +    cpr_delete_fd("vfio_group", group->groupid);
>      close(group->fd);
>      g_free(group);
>  
> @@ -2358,8 +2442,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>  {
>      struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
>      int ret, fd;
> +    bool reused;
> +
> +    fd = cpr_find_fd(name, 0);
> +    reused = (fd >= 0);
> +    if (!reused) {
> +        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
> +    }
>  
> -    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
>      if (fd < 0) {
>          error_setg_errno(errp, errno, "error getting device from group %d",
>                           group->groupid);
> @@ -2404,6 +2494,10 @@ int vfio_get_device(VFIOGroup *group, const char *name,
>      vbasedev->num_irqs = dev_info.num_irqs;
>      vbasedev->num_regions = dev_info.num_regions;
>      vbasedev->flags = dev_info.flags;
> +    vbasedev->reused = reused;
> +    if (!reused) {
> +        cpr_save_fd(name, 0, fd);
> +    }

Another cleanup here if we didn't need to tiptoe around cpr_save_fd().

>  
>      trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
>                            dev_info.num_irqs);
> @@ -2420,6 +2514,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
>      QLIST_REMOVE(vbasedev, next);
>      vbasedev->group = NULL;
>      trace_vfio_put_base_device(vbasedev->fd);
> +    cpr_delete_fd(vbasedev->name, 0);
>      close(vbasedev->fd);
>  }
>  
> diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
> new file mode 100644
> index 0000000..2c39cd5
> --- /dev/null
> +++ b/hw/vfio/cpr.c
> @@ -0,0 +1,94 @@
> +/*
> + * Copyright (c) 2021 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <sys/ioctl.h>
> +#include <linux/vfio.h>
> +#include "hw/vfio/vfio-common.h"
> +#include "sysemu/kvm.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +
> +static int
> +vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
> +{
> +    struct vfio_iommu_type1_dma_unmap unmap = {
> +        .argsz = sizeof(unmap),
> +        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
> +        .iova = 0,
> +        .size = 0,
> +    };
> +    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
> +        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
> +        return -errno;
> +    }
> +    return 0;
> +}
> +
> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
> +{
> +    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
> +        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
> +        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
> +                         "or VFIO_UNMAP_ALL");
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}

We could have minimally used this where we assumed a TYPE1v2 container.

> +
> +/*
> + * Verify that all containers support CPR, and unmap all dma vaddr's.
> + */
> +int vfio_cpr_save(Error **errp)
> +{
> +    ERRP_GUARD();
> +    VFIOAddressSpace *space;
> +    VFIOContainer *container;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            if (!vfio_is_cpr_capable(container, errp)) {
> +                return -1;
> +            }
> +            if (vfio_dma_unmap_vaddr_all(container, errp)) {
> +                return -1;
> +            }
> +        }
> +    }

Seems like we ought to validate all containers support CPR before we
start blasting vaddrs.  It looks like qmp_cpr_exec() simply returns if
this fails with no attempt to unwind!  Yikes!  Wouldn't we need to
replay the listeners to remap the vaddrs in case of an error?

> +
> +    return 0;
> +}
> +
> +/*
> + * Register the listener for each container, which causes its callback to be
> + * invoked for every flat section.  The callback will see that the container
> + * is reused, and call vfo_dma_map with the new vaddr.
> + */
> +int vfio_cpr_load(Error **errp)
> +{
> +    VFIOAddressSpace *space;
> +    VFIOContainer *container;
> +    VFIOGroup *group;
> +    VFIODevice *vbasedev;
> +
> +    QLIST_FOREACH(space, &vfio_address_spaces, list) {
> +        QLIST_FOREACH(container, &space->containers, next) {
> +            if (!vfio_is_cpr_capable(container, errp)) {
> +                return -1;
> +            }
> +            vfio_listener_register(container);
> +            container->reused = false;
> +        }
> +    }
> +    QLIST_FOREACH(group, &vfio_group_list, next) {
> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
> +            vbasedev->reused = false;
> +        }
> +    }
> +    return 0;
> +}
> diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
> index da9af29..e247b2b 100644
> --- a/hw/vfio/meson.build
> +++ b/hw/vfio/meson.build
> @@ -5,6 +5,7 @@ vfio_ss.add(files(
>    'migration.c',
>  ))
>  vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
> +  'cpr.c',
>    'display.c',
>    'pci-quirks.c',
>    'pci.c',
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index a90cce2..acac8a7 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -30,6 +30,7 @@
>  #include "hw/qdev-properties-system.h"
>  #include "migration/vmstate.h"
>  #include "qapi/qmp/qdict.h"
> +#include "migration/cpr.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> @@ -2926,6 +2927,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>          vfio_put_group(group);
>          goto error;
>      }
> +    pdev->reused = vdev->vbasedev.reused;
>  
>      vfio_populate_device(vdev, &err);
>      if (err) {
> @@ -3195,6 +3197,11 @@ static void vfio_pci_reset(DeviceState *dev)
>  {
>      VFIOPCIDevice *vdev = VFIO_PCI(dev);
>  
> +    /* Do not reset the device during qemu_system_reset prior to cpr-load */
> +    if (vdev->pdev.reused) {
> +        return;
> +    }
> +
>      trace_vfio_pci_reset(vdev->vbasedev.name);
>  
>      vfio_pci_pre_reset(vdev);
> @@ -3302,6 +3309,75 @@ static Property vfio_pci_dev_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void vfio_merge_config(VFIOPCIDevice *vdev)
> +{
> +    PCIDevice *pdev = &vdev->pdev;
> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
> +    g_autofree uint8_t *phys_config = g_malloc(size);
> +    uint32_t mask;
> +    int ret, i;
> +
> +    ret = pread(vdev->vbasedev.fd, phys_config, size, vdev->config_offset);
> +    if (ret < size) {
> +        ret = ret < 0 ? errno : EFAULT;
> +        error_report("failed to read device config space: %s", strerror(ret));
> +        return;
> +    }
> +
> +    for (i = 0; i < size; i++) {
> +        mask = vdev->emulated_config_bits[i];
> +        pdev->config[i] = (pdev->config[i] & mask) | (phys_config[i] & ~mask);
> +    }
> +}

IIUC, we get a copy of config space from the vfio device and for each
byte, we keep what we have in emulated config space for emulated bits
and fill in from the device for non-emulated bits.  Meanwhile,
vfio_pci_read_config() doesn't ever return non-emulated bits from
emulated config space, so what specifically are we accomplishing here?

> +
> +/*
> + * The kernel may change non-emulated config bits.  Exclude them from the
> + * changed-bits check in get_pci_config_device.
> + */
> +static int vfio_pci_pre_load(void *opaque)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +    int size = MIN(pci_config_size(pdev), vdev->config_size);
> +    int i;
> +
> +    for (i = 0; i < size; i++) {
> +        pdev->cmask[i] &= vdev->emulated_config_bits[i];
> +    }
> +
> +    return 0;
> +}

The previous function seemed like maybe an attempt to make non-emulated
bits in emulated config space consistent for testing, but here we're
masking all non-emulated bits out of that mask.  Why do we need to do
both?

> +
> +static int vfio_pci_post_load(void *opaque, int version_id)
> +{
> +    VFIOPCIDevice *vdev = opaque;
> +    PCIDevice *pdev = &vdev->pdev;
> +
> +    vfio_merge_config(vdev);
> +
> +    pdev->reused = false;
> +
> +    return 0;
> +}
> +
> +static bool vfio_pci_needed(void *opaque)
> +{
> +    return cpr_get_mode() == CPR_MODE_RESTART;
> +}
> +
> +static const VMStateDescription vfio_pci_vmstate = {
> +    .name = "vfio-pci",
> +    .unmigratable = 1,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .pre_load = vfio_pci_pre_load,
> +    .post_load = vfio_pci_post_load,
> +    .needed = vfio_pci_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -3309,6 +3385,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = vfio_pci_reset;
>      device_class_set_props(dc, vfio_pci_dev_properties);
> +    dc->vmsd = &vfio_pci_vmstate;
>      dc->desc = "VFIO-based PCI device assignment";
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      pdc->realize = vfio_realize;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f..63dd0fe 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>  vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>  vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>  vfio_dma_unmap_overflow_workaround(void) ""
> +vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>  
>  # platform.c
>  vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index cc63dd4..8557e82 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -361,6 +361,7 @@ struct PCIDevice {
>      /* ID of standby device in net_failover pair */
>      char *failover_pair_id;
>      uint32_t acpi_index;
> +    bool reused;
>  };
>  
>  void pci_register_bar(PCIDevice *pci_dev, int region_num,
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index 1641753..bc23c29 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -85,6 +85,7 @@ typedef struct VFIOContainer {
>      Error *error;
>      bool initialized;
>      bool dirty_pages_supported;
> +    bool reused;
>      uint64_t dirty_pgsizes;
>      uint64_t max_dirty_bitmap_size;
>      unsigned long pgsizes;
> @@ -136,6 +137,7 @@ typedef struct VFIODevice {
>      bool no_mmap;
>      bool ram_block_discard_allowed;
>      bool enable_migration;
> +    bool reused;
>      VFIODeviceOps *ops;
>      unsigned int num_irqs;
>      unsigned int num_regions;
> @@ -212,6 +214,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
>  void vfio_put_group(VFIOGroup *group);
>  int vfio_get_device(VFIOGroup *group, const char *name,
>                      VFIODevice *vbasedev, Error **errp);
> +int vfio_cpr_save(Error **errp);
> +int vfio_cpr_load(Error **errp);
> +bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp);
>  
>  extern const MemoryRegionOps vfio_region_ops;
>  typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
> @@ -236,6 +241,9 @@ struct vfio_info_cap_header *
>  vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
>  #endif
>  extern const MemoryListener vfio_prereg_listener;
> +void vfio_listener_register(VFIOContainer *container);
> +void vfio_container_region_add(VFIOContainer *container,
> +                               MemoryRegionSection *section);
>  
>  int vfio_spapr_create_window(VFIOContainer *container,
>                               MemoryRegionSection *section,
> diff --git a/include/migration/cpr.h b/include/migration/cpr.h
> index a4da24e..a4007cf 100644
> --- a/include/migration/cpr.h
> +++ b/include/migration/cpr.h
> @@ -25,4 +25,7 @@ int cpr_state_save(Error **errp);
>  int cpr_state_load(Error **errp);
>  void cpr_state_print(void);
>  
> +int cpr_vfio_save(Error **errp);
> +int cpr_vfio_load(Error **errp);
> +
>  #endif
> diff --git a/migration/cpr.c b/migration/cpr.c
> index 37eca66..cee82cf 100644
> --- a/migration/cpr.c
> +++ b/migration/cpr.c
> @@ -7,6 +7,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "exec/memory.h"
> +#include "hw/vfio/vfio-common.h"
>  #include "io/channel-buffer.h"
>  #include "io/channel-file.h"
>  #include "migration.h"
> @@ -101,7 +102,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>          return;
>      }
> -
> +    if (cpr_vfio_save(errp)) {
> +        return;
> +    }

Why is vfio so unique that it needs separate handlers versus other
devices?  Thanks,

Alex


>      cpr_walk_fd(preserve_fd, 0);
>      if (cpr_state_save(errp)) {
>          return;
> @@ -139,6 +142,11 @@ void qmp_cpr_load(const char *filename, Error **errp)
>          goto out;
>      }
>  
> +    if (cpr_get_mode() == CPR_MODE_RESTART &&
> +        cpr_vfio_load(errp)) {
> +        goto out;
> +    }
> +
>      state = global_state_get_runstate();
>      if (state == RUN_STATE_RUNNING) {
>          vm_start();
> diff --git a/migration/target.c b/migration/target.c
> index 4390bf0..984bc9e 100644
> --- a/migration/target.c
> +++ b/migration/target.c
> @@ -8,6 +8,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "migration.h"
> +#include "migration/cpr.h"
>  #include CONFIG_DEVICES
>  
>  #ifdef CONFIG_VFIO
> @@ -22,8 +23,21 @@ void populate_vfio_info(MigrationInfo *info)
>          info->vfio->transferred = vfio_mig_bytes_transferred();
>      }
>  }
> +
> +int cpr_vfio_save(Error **errp)
> +{
> +    return vfio_cpr_save(errp);
> +}
> +
> +int cpr_vfio_load(Error **errp)
> +{
> +    return vfio_cpr_load(errp);
> +}
> +
>  #else
>  
>  void populate_vfio_info(MigrationInfo *info) {}
> +int cpr_vfio_save(Error **errp) { return 0; }
> +int cpr_vfio_load(Error **errp) { return 0; }
>  
>  #endif /* CONFIG_VFIO */


