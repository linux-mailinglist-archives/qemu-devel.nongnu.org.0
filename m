Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCA612ECC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 02:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opK4B-0005Q9-ST; Sun, 30 Oct 2022 21:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opK49-0005Pk-I4
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:58:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opK47-0006JL-Db
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667181494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SZJsw7pEyOeE8u1n+QLXRranvvcaerXuwKZbTG0Rr7w=;
 b=C5f7vxVfBaij8RDSphZv5uhL+lQYGEKU6d5muZIX6lO7hcyIAEfmGDSOJX6h2zS2v/6q+j
 EjOGc/n3w2tHSmoXGOQ2EbBXFydcg0jlOHwTCrPUwZbqgS1RWWl/awea0ysWpN1pC7d3SF
 WE+FsuQumf0H+WhetO8ffNqcIQT+e2U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-akRr6eK1PeyCiPbiuW8OZw-1; Sun, 30 Oct 2022 21:58:13 -0400
X-MC-Unique: akRr6eK1PeyCiPbiuW8OZw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so6773145ede.1
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 18:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZJsw7pEyOeE8u1n+QLXRranvvcaerXuwKZbTG0Rr7w=;
 b=yFfYH3bxBPi7ad5uCg1NQWWqVKxqwfQsTk6DlMTURak4DdR4VIaH4nMNEo8Em2yCpW
 Y5SjVXgqUfHiNzh1kjkqwlMJBlilV76iiPZ009XS2GrN51m40W7bNGPbu8VnpS8ft5s/
 dZrq3AVKSmzgMeH+ohrzxtEuWvtFDfv9aYyJi/ymL088HXJd/a09+56iWV0sle83psnZ
 TEMl/ldWFxVYv81NWIqfmeYL6DmpsznKdYtAn9SQQTJY5ae9wmO4Wycd1gWcAoMH+09h
 9NigbdfmK//oJL923zUZkwezHfRrOQ0I02TOqcpQLld52iukDN2uYJoZWHSeoChWkc4U
 cSMQ==
X-Gm-Message-State: ACrzQf2I76y89TwibJ42aNPQIdrxlLDKp2rGPT0vXitdm0kKGBLGSTD1
 768Ar6gy3erSSjfE6aLDS7HRhhA5xZD2U8Fwe4RpnbF3//Ghg9VtU/adWepUKlkri/7jhBCCHdP
 n8WPoGNwUsEvMT1fP9Off5KIXhdmlX2o=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr11065045ejc.724.1667181492022; 
 Sun, 30 Oct 2022 18:58:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4U6FOhR7Z4Fqs43xBk51nf0Loew7QKGjY4hgvbO33Zn54SFmukz2QsiudR5Vl4A3XXGM0wETBG1EU+nf0eZA0=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr11065021ejc.724.1667181491671; Sun, 30
 Oct 2022 18:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221030164539.1374058-1-lulu@redhat.com>
 <20221030164539.1374058-2-lulu@redhat.com>
 <20221030113502.5c2e5e63.alex.williamson@redhat.com>
In-Reply-To: <20221030113502.5c2e5e63.alex.williamson@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 09:57:34 +0800
Message-ID: <CACLfguU6HEEOpOC-ckcB0HQ63LwTOZhOPeMmzPAe0qWPresMJg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] vfio: move function vfio_get_xlat_addr() to
 memory.c
To: Alex Williamson <alex.williamson@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 01:35, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Mon, 31 Oct 2022 00:45:38 +0800
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
> >  hw/vfio/common.c      | 107 +++++++++++-------------------------------
> >  include/exec/memory.h |   4 ++
> >  softmmu/memory.c      |  72 ++++++++++++++++++++++++++++
> >  3 files changed, 104 insertions(+), 79 deletions(-)
> >
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ace9562a9b..a934262f39 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -573,61 +573,20 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >              */
> >             section->offset_within_address_space & (1ULL << 63);
> >  }
> > -
> > -/* Called with rcu_read_lock held.  */
> > -static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > -                               ram_addr_t *ram_addr, bool *read_only)
> > +static inline void vfio_mr_discard_manager_warn(bool mr_has_discard_manager)
> >  {
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
> > +    if (mr_has_discard_manager) {
> >          /*
> > -         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > -         * pages will remain pinned inside vfio until unmapped, resulting in a
> > -         * higher memory consumption than expected. If memory would get
> > -         * populated again later, there would be an inconsistency between pages
> > -         * pinned by vfio and pages seen by QEMU. This is the case until
> > -         * unmapped from the IOMMU (e.g., during device reset).
> > +         * Malicious VMs might trigger discarding of IOMMU-mapped memory.
> > +         * The pages will remain pinned inside vfio until unmapped,
> > +         * resulting in a higher memory consumption than expected. If memory
> > +         * would get populated again later, there would be an inconsistency
> > +         * between pages pinned by vfio and pages seen by QEMU. This is the
> > +         * case until unmapped from the IOMMU (e.g., during device reset).
> >           *
> > -         * With malicious guests, we really only care about pinning more memory
> > -         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > -         * exceeded and can be used to mitigate this problem.
> > +         * With malicious guests, we really only care about pinning more
> > +         * memory than expected. RLIMIT_MEMLOCK set for the user/process can
> > +         * never be exceeded and can be used to mitigate this problem.
> >           */
> >          warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> >                           " RAM (e.g., virtio-mem) works, however, malicious"
> > @@ -635,31 +594,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> >                           " intended via an IOMMU. It's possible to mitigate "
> >                           " by setting/adjusting RLIMIT_MEMLOCK.");
> >      }
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
> >  }
> > -
> >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >  {
> >      VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
> > @@ -681,10 +616,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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
> > +        /*
> > +         * if the mr has the discard_manager and the return value of
> > +         * memory_get_xlat_addr() is ture then we need to warn
> > +         */
> > +        vfio_mr_discard_manager_warn(mr_has_discard_manager);
>
>
> The wrapper should be around the memory_get_xlat_addr() function, not
> a separate helper whose only purpose is to trigger the error report,
> ie. extract all but the warn_report_once() into a shared
> function, keep vfio_get_xlat_addr().  The vfio call sites should not
> change.  Thanks,
>
> Alex
>
Thanks Alex, I have post a new version as your suggestion
Thanks
cindy
> >          /*
> >           * vaddr is only valid until rcu_read_unlock(). But after
> >           * vfio_dma_map has set up the mapping the pages will be
> > @@ -1349,6 +1291,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >      VFIOContainer *container = giommu->container;
> >      hwaddr iova = iotlb->iova + giommu->iommu_offset;
> >      ram_addr_t translated_addr;
> > +    bool mr_has_discard_manager;
> >
> >      trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
> >
> > @@ -1359,9 +1302,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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
> > @@ -1370,6 +1313,12 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> >                           container, iova,
> >                           iotlb->addr_mask + 1, ret);
> >          }
> > +
> > +        /*
> > +         * if the mr has the discard_manager and the return value of
> > +         * memory_get_xlat_addr() is ture then we need to warn
> > +         */
> > +        vfio_mr_discard_manager_warn(mr_has_discard_manager);
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


