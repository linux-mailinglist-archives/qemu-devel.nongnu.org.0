Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7C612AB5
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 14:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1op8Ag-0000gJ-JX; Sun, 30 Oct 2022 09:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1op8Aa-0000fy-Tz
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 09:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1op8AW-0007BH-2p
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 09:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667135761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y6AQgJI4TzX2k/PspxLquSUnIY9nS1ifYstzIzGNMY0=;
 b=PJiDz3UtcA/JMh3VmFZWJQZxM6umVo9l5a39ddEfiXV1nN14ubZmXklzn76GY3e0jpRm22
 WJgamVTjkfq6dm6HlVPaDLggLST7Gz0gcGWhQBz0pmQeWdP4q5LacakkTl+brN9nzdwvAN
 U50gTtkSDaZbJiKjJabrreKE1IALBUY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-dJB4FuQcOZe9WLtaFetZig-1; Sun, 30 Oct 2022 09:15:59 -0400
X-MC-Unique: dJB4FuQcOZe9WLtaFetZig-1
Received: by mail-ed1-f69.google.com with SMTP id
 t4-20020a056402524400b004620845ba7bso6091316edd.4
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 06:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6AQgJI4TzX2k/PspxLquSUnIY9nS1ifYstzIzGNMY0=;
 b=CduQuBwcb3p3kWgLdirXcyJ5NCHOEVMci23teAHEBdxZtmDVerx2oA6jPzEauNBIB2
 vdgKCLoR8VYJALXJ2uM3NZaI0zc8d2sD+eIgqEUn8ZYxUQ9bQdieZi1ItliUPMjvL4gD
 SsxpYf/M+gCZXFPkwKd+CyGiko6ldIROrfgUMSMX/YPdyo4hvtbvafknM4NZvMkw62mT
 tsxUbn4Ii8D7lfQNehA3MHcbk2xIOBMTBWFPMlIIfHXaV7Xa3qdGDyGvcyZNHouLCcZT
 byVCaYIfynOIMGHbjqNBEQ1+M3OGPYeMTeR/3LQuibil6gdPmR/eW9ghu22XeYWin02B
 y0VA==
X-Gm-Message-State: ACrzQf3XpAFEmqm6C4eOzSsspzY7Y2tf5Rf3AGKEZ1oKM8zat/FrfCS/
 mC+I+sAFf9euNJwGvj3msnr54Zq0XotMUGqYftISpresLRDcAA+XY2OK4vpjx2KURdRiy2OKw/F
 RiWzs5vO0JAcMqqN5hQ8GjL9mbsl3A7k=
X-Received: by 2002:aa7:d858:0:b0:463:12ed:3f86 with SMTP id
 f24-20020aa7d858000000b0046312ed3f86mr5813006eds.281.1667135758666; 
 Sun, 30 Oct 2022 06:15:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4X9GT0TJmfYy8kpiDnGAMzyoC3UomyjV9jbvcQKQ5GCdMmxZj751EHQhShK5xLIC/pNydAYHJwLliqSONOMP8=
X-Received: by 2002:aa7:d858:0:b0:463:12ed:3f86 with SMTP id
 f24-20020aa7d858000000b0046312ed3f86mr5812965eds.281.1667135758289; Sun, 30
 Oct 2022 06:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221030060106.1341675-1-lulu@redhat.com>
 <20221030060106.1341675-2-lulu@redhat.com>
 <20221030070237.7920ea6a.alex.williamson@redhat.com>
In-Reply-To: <20221030070237.7920ea6a.alex.williamson@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Sun, 30 Oct 2022 21:15:20 +0800
Message-ID: <CACLfguVGw_AY8ivVjcfiL9q5yjS5Q8HPm+HGWa6fR4QNYAeviQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] vfio: move function vfio_get_xlat_addr() to
 memory.c
To: Alex Williamson <alex.williamson@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 30 Oct 2022 at 21:02, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Sun, 30 Oct 2022 14:01:05 +0800
> Cindy Lu <lulu@redhat.com> wrote:
>
> > - Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> >   change the name to memory_get_xlat_addr(). So we can use this
> >   function on other devices, such as vDPA device.
> > - Add a new bool arg in this function, which shows whether the memory is
> >   backed by a discard manager. So the device can have its own warning.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/vfio/common.c      | 135 ++++++++++++++----------------------------
> >  include/exec/memory.h |   4 ++
> >  softmmu/memory.c      |  72 ++++++++++++++++++++++
> >  3 files changed, 122 insertions(+), 89 deletions(-)
> >
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ace9562a9b..06ebbb82c7 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -574,92 +574,6 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >             section->offset_within_address_space & (1ULL << 63);
> >  }
> >
> > -/* Called with rcu_read_lock held.  */
> > -static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > -                               ram_addr_t *ram_addr, bool *read_only)
> > -{
> > -    MemoryRegion *mr;
> > -    hwaddr xlat;
> > -    hwaddr len = iotlb->addr_mask + 1;
> > -    bool writable = iotlb->perm & IOMMU_WO;
> > -
> > -    /*
> > -     * The IOMMU TLB entry we have just covers translation through
> > -     * this IOMMU to its immediate target.  We need to translate
> > -     * it the rest of the way through to memory.
> > -     */
> > -    mr = address_space_translate(&address_space_memory,
> > -                                 iotlb->translated_addr,
> > -                                 &xlat, &len, writable,
> > -                                 MEMTXATTRS_UNSPECIFIED);
> > -    if (!memory_region_is_ram(mr)) {
> > -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> > -                     xlat);
> > -        return false;
> > -    } else if (memory_region_has_ram_discard_manager(mr)) {
> > -        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > -        MemoryRegionSection tmp = {
> > -            .mr = mr,
> > -            .offset_within_region = xlat,
> > -            .size = int128_make64(len),
> > -        };
> > -
> > -        /*
> > -         * Malicious VMs can map memory into the IOMMU, which is expected
> > -         * to remain discarded. vfio will pin all pages, populating memory.
> > -         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > -         * were already restored before IOMMUs are restored.
> > -         */
> > -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > -            error_report("iommu map to discarded memory (e.g., unplugged via"
> > -                         " virtio-mem): %"HWADDR_PRIx"",
> > -                         iotlb->translated_addr);
> > -            return false;
> > -        }
> > -
> > -        /*
> > -         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > -         * pages will remain pinned inside vfio until unmapped, resulting in a
> > -         * higher memory consumption than expected. If memory would get
> > -         * populated again later, there would be an inconsistency between pages
> > -         * pinned by vfio and pages seen by QEMU. This is the case until
> > -         * unmapped from the IOMMU (e.g., during device reset).
> > -         *
> > -         * With malicious guests, we really only care about pinning more memory
> > -         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > -         * exceeded and can be used to mitigate this problem.
> > -         */
> > -        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> > -                         " RAM (e.g., virtio-mem) works, however, malicious"
> > -                         " guests can trigger pinning of more memory than"
> > -                         " intended via an IOMMU. It's possible to mitigate "
> > -                         " by setting/adjusting RLIMIT_MEMLOCK.");
> > -    }
> > -
> > -    /*
> > -     * Translation truncates length to the IOMMU page size,
> > -     * check that it did not truncate too much.
> > -     */
> > -    if (len & iotlb->addr_mask) {
> > -        error_report("iommu has granularity incompatible with target AS");
> > -        return false;
> > -    }
> > -
> > -    if (vaddr) {
> > -        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > -    }
> > -
> > -    if (ram_addr) {
> > -        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > -    }
> > -
> > -    if (read_only) {
> > -        *read_only = !writable || mr->readonly;
> > -    }
> > -
> > -    return true;
> > -}
> > -
> >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >  {
> >      VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
> > @@ -681,10 +595,32 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >
> >      if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> >          bool read_only;
> > +        bool mr_has_discard_manager;
> >
> > -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,
> > +                                  &mr_has_discard_manager)) {
> >              goto out;
> >          }
> > +        if (mr_has_discard_manager) {
> > +            /*
> > +             * Malicious VMs might trigger discarding of IOMMU-mapped memory.
> > +             * The pages will remain pinned inside vfio until unmapped,
> > +             * resulting in a higher memory consumption than expected. If memory
> > +             * would get populated again later, there would be an inconsistency
> > +             * between pages pinned by vfio and pages seen by QEMU. This is the
> > +             * case until unmapped from the IOMMU (e.g., during device reset).
> > +             *
> > +             * With malicious guests, we really only care about pinning more
> > +             * memory than expected. RLIMIT_MEMLOCK set for the user/process can
> > +             * never be exceeded and can be used to mitigate this problem.
> > +             */
> > +            warn_report_once(
> > +                "Using vfio with vIOMMUs and coordinated discarding of"
> > +                " RAM (e.g., virtio-mem) works, however, malicious"
> > +                " guests can trigger pinning of more memory than"
> > +                " intended via an IOMMU. It's possible to mitigate "
> > +                " by setting/adjusting RLIMIT_MEMLOCK.");
> > +        }
> >          /*
> >           * vaddr is only valid until rcu_read_unlock(). But after
> >           * vfio_dma_map has set up the mapping the pages will be
> > @@ -1349,6 +1285,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >      VFIOContainer *container = giommu->container;
> >      hwaddr iova = iotlb->iova + giommu->iommu_offset;
> >      ram_addr_t translated_addr;
> > +    bool mr_has_discard_manager;
> >
> >      trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
> >
> > @@ -1359,9 +1296,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >      }
> >
> >      rcu_read_lock();
> > -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> > +    if (memory_get_xlat_addr(iotlb, NULL, &translated_addr, NULL,
> > +                             &mr_has_discard_manager)) {
> >          int ret;
> > -
> >          ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
> >                                      translated_addr);
> >          if (ret) {
> > @@ -1370,6 +1307,26 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >                           container, iova,
> >                           iotlb->addr_mask + 1, ret);
> >          }
> > +        if (mr_has_discard_manager) {
> > +            /*
> > +             * Malicious VMs might trigger discarding of IOMMU-mapped memory.
> > +             * The pages will remain pinned inside vfio until unmapped,
> > +             * resulting in a higher memory consumption than expected. If memory
> > +             * would get populated again later, there would be an inconsistency
> > +             * between pages pinned by vfio and pages seen by QEMU. This is the
> > +             * case until unmapped from the IOMMU (e.g., during device reset).
> > +             *
> > +             * With malicious guests, we really only care about pinning more
> > +             * memory than expected. RLIMIT_MEMLOCK set for the user/process can
> > +             * never be exceeded and can be used to mitigate this problem.
> > +             */
> > +            warn_report_once(
> > +                "Using vfio with vIOMMUs and coordinated discarding of"
> > +                " RAM (e.g., virtio-mem) works, however, malicious"
> > +                " guests can trigger pinning of more memory than"
> > +                " intended via an IOMMU. It's possible to mitigate "
> > +                " by setting/adjusting RLIMIT_MEMLOCK.");
> > +        }
>
> This still needs a vfio wrapper to avoid the duplicate comment and
> warn_report_once.  Thanks,
>
> Alex
>
sure, will change this ,Thanks Alex
Thanks
Cindy
>
> >      }
> >      rcu_read_unlock();
> >  }
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index bfb1de8eea..d1e79c39dc 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
> >  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> >                                               RamDiscardListener *rdl);
> >
> > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > +                          ram_addr_t *ram_addr, bool *read_only,
> > +                          bool *mr_has_discard_manager);
> > +
> >  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> >  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
> >
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 7ba2048836..bc0be3f62c 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -33,6 +33,7 @@
> >  #include "qemu/accel.h"
> >  #include "hw/boards.h"
> >  #include "migration/vmstate.h"
> > +#include "exec/address-spaces.h"
> >
> >  //#define DEBUG_UNASSIGNED
> >
> > @@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> >      rdmc->unregister_listener(rdm, rdl);
> >  }
> >
> > +/* Called with rcu_read_lock held.  */
> > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > +                          ram_addr_t *ram_addr, bool *read_only,
> > +                          bool *mr_has_discard_manager)
> > +{
> > +    MemoryRegion *mr;
> > +    hwaddr xlat;
> > +    hwaddr len = iotlb->addr_mask + 1;
> > +    bool writable = iotlb->perm & IOMMU_WO;
> > +
> > +    if (mr_has_discard_manager) {
> > +        *mr_has_discard_manager = false;
> > +    }
> > +    /*
> > +     * The IOMMU TLB entry we have just covers translation through
> > +     * this IOMMU to its immediate target.  We need to translate
> > +     * it the rest of the way through to memory.
> > +     */
> > +    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
> > +                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
> > +    if (!memory_region_is_ram(mr)) {
> > +        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
> > +        return false;
> > +    } else if (memory_region_has_ram_discard_manager(mr)) {
> > +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > +        MemoryRegionSection tmp = {
> > +            .mr = mr,
> > +            .offset_within_region = xlat,
> > +            .size = int128_make64(len),
> > +        };
> > +        if (mr_has_discard_manager) {
> > +            *mr_has_discard_manager = true;
> > +        }
> > +        /*
> > +         * Malicious VMs can map memory into the IOMMU, which is expected
> > +         * to remain discarded. vfio will pin all pages, populating memory.
> > +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > +         * were already restored before IOMMUs are restored.
> > +         */
> > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > +            error_report("iommu map to discarded memory (e.g., unplugged via"
> > +                         " virtio-mem): %" HWADDR_PRIx "",
> > +                         iotlb->translated_addr);
> > +            return false;
> > +        }
> > +    }
> > +
> > +    /*
> > +     * Translation truncates length to the IOMMU page size,
> > +     * check that it did not truncate too much.
> > +     */
> > +    if (len & iotlb->addr_mask) {
> > +        error_report("iommu has granularity incompatible with target AS");
> > +        return false;
> > +    }
> > +
> > +    if (vaddr) {
> > +        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > +    }
> > +
> > +    if (ram_addr) {
> > +        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > +    }
> > +
> > +    if (read_only) {
> > +        *read_only = !writable || mr->readonly;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> >  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
> >  {
> >      uint8_t mask = 1 << client;
>


