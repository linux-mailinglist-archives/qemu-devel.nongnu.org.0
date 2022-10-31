Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8126130D0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOjn-0000Bo-Q7; Mon, 31 Oct 2022 02:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opOjk-0000Am-Qf
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opOji-0001aK-8s
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667199449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h4o+QF1hnK+1TBVZkll896rvtLie2IGieb8UX31KatM=;
 b=Z6ssnmKOXGdw9LQgA1eB2iWnT/W+uaU6A48ZzkeHMBNOstTfQ1KHgV7DZz4s5qYUDz4ZOp
 FqrmqeI1cuyPGZTd1Ea7VTpi8VAVXccItRrqYGyNZGu4y7U4qMqnpI29mZgInA9+WEv9rh
 VxieYb61fJ5KFN4oDeVCIWhiSfj4jFk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-PNUASBoOOAiSQH58ptB_nw-1; Mon, 31 Oct 2022 02:57:26 -0400
X-MC-Unique: PNUASBoOOAiSQH58ptB_nw-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk31-20020a1709077f9f00b00791a3e02c80so5408238ejc.21
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 23:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h4o+QF1hnK+1TBVZkll896rvtLie2IGieb8UX31KatM=;
 b=ejH/qXnRTb8xdljJrs5nvfVQmOAj9NTV+97lfLjge0Ca7+GzYh9+Q2SrEhM1uyve4b
 I7IZKN39H3yihz0CqYYtcSUyOpqo5MwG72j8cKTKLrmyWVPt5DWYS4pnxrKXKCLykCDA
 KyHgZnDTKwO9Llzdrv/hYHUjfENkbgEbiGaH6ROXR58W++f3fYKn4tHw3NP0zoOhP2o3
 7RpaPgY6nbWJ3tD2S9tlAFetObRY+82GYNWDNLAm6Fs5PLbzPN1KYdU2qvTRK79qeXcN
 JE3FFaOJzs8RRGGIwY2DxndKLZzs3ItgFRiAFriNhQkSvk28Ok+mRZQEcIck4zFDJ80K
 7L5g==
X-Gm-Message-State: ACrzQf1T5bnfKyGMqLFAACxvg/OV31ftpvClqtDDd0ASgvNtbzoXaUwX
 mVa6iW5FdewJXVwHLQOeYEmI3ke6UUr7CfFqi2Xs86jLxa7xLAM6pk6uONBULJBH0bf7w23VOM5
 gBVOKMsEpvAN8+qmqXy5wHHycEZvHFaM=
X-Received: by 2002:a17:907:31c1:b0:742:28a3:5d08 with SMTP id
 xf1-20020a17090731c100b0074228a35d08mr11434318ejb.112.1667199444838; 
 Sun, 30 Oct 2022 23:57:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7bt4AhJgcbpmNEIPp4R4qSbaJt80nbbZja6INVijHcwIcbQ7PtxeM3TbEGXKdqvRQGJ+2gzJCFSqzUhIL+Dmw=
X-Received: by 2002:a17:907:31c1:b0:742:28a3:5d08 with SMTP id
 xf1-20020a17090731c100b0074228a35d08mr11434292ejb.112.1667199444491; Sun, 30
 Oct 2022 23:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221031031020.1405111-3-lulu@redhat.com>
 <20221031031020.1405111-2-lulu@redhat.com>
 <20221031023754-mutt-send-email-mst@kernel.org>
 <CACLfguXzKyqgtQvXuGqt14d5MW8pQ2c7sD4zp-4piesnRNJqvg@mail.gmail.com>
 <20221031025344-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221031025344-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 14:56:47 +0800
Message-ID: <CACLfguVckM5xb1+32TTh5OsP=pwkPgOavTadbnqzy3fNRqnk4Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, 
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

On Mon, 31 Oct 2022 at 14:55, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Oct 31, 2022 at 02:44:11PM +0800, Cindy Lu wrote:
> > On Mon, 31 Oct 2022 at 14:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Oct 31, 2022 at 11:10:19AM +0800, Cindy Lu wrote:
> > > > - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
> > > >   change the name to memory_get_xlat_addr(). So we can use this
> > > >   function on other devices, such as vDPA device.
> > > > - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
> > > >   whether the memory is backed by a discard manager. then device can
> > > >   have its own warning.
> > > >
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > >
> > > Could you rebase on top of my tree (config interrupt support conflicts).
> > >
> > Hi Micheal,
> > sure, will do, but I found a crash in config interrupt while testing
> > vhost user,
> > should I post a new version for it? Or maybe a patch later?
> > Thanks
> > Cindy
>
> New version, I will drop this one. So do you want this one picked up and
> config interrupt on top?
>
sure, I will rebase the config interrupt patches on top of this
Thanks
Cindy
> > > > ---
> > > >  hw/vfio/common.c      | 66 +++------------------------------------
> > > >  include/exec/memory.h |  4 +++
> > > >  softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 81 insertions(+), 61 deletions(-)
> > > >
> > > > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > > > index ace9562a9b..6bc02b32c8 100644
> > > > --- a/hw/vfio/common.c
> > > > +++ b/hw/vfio/common.c
> > > > @@ -578,45 +578,11 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > > >  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > >                                 ram_addr_t *ram_addr, bool *read_only)
> > > >  {
> > > > -    MemoryRegion *mr;
> > > > -    hwaddr xlat;
> > > > -    hwaddr len = iotlb->addr_mask + 1;
> > > > -    bool writable = iotlb->perm & IOMMU_WO;
> > > > -
> > > > -    /*
> > > > -     * The IOMMU TLB entry we have just covers translation through
> > > > -     * this IOMMU to its immediate target.  We need to translate
> > > > -     * it the rest of the way through to memory.
> > > > -     */
> > > > -    mr = address_space_translate(&address_space_memory,
> > > > -                                 iotlb->translated_addr,
> > > > -                                 &xlat, &len, writable,
> > > > -                                 MEMTXATTRS_UNSPECIFIED);
> > > > -    if (!memory_region_is_ram(mr)) {
> > > > -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> > > > -                     xlat);
> > > > -        return false;
> > > > -    } else if (memory_region_has_ram_discard_manager(mr)) {
> > > > -        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > > > -        MemoryRegionSection tmp = {
> > > > -            .mr = mr,
> > > > -            .offset_within_region = xlat,
> > > > -            .size = int128_make64(len),
> > > > -        };
> > > > -
> > > > -        /*
> > > > -         * Malicious VMs can map memory into the IOMMU, which is expected
> > > > -         * to remain discarded. vfio will pin all pages, populating memory.
> > > > -         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > > > -         * were already restored before IOMMUs are restored.
> > > > -         */
> > > > -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > > -            error_report("iommu map to discarded memory (e.g., unplugged via"
> > > > -                         " virtio-mem): %"HWADDR_PRIx"",
> > > > -                         iotlb->translated_addr);
> > > > -            return false;
> > > > -        }
> > > > +    bool ret, mr_has_discard_manager;
> > > >
> > > > +    ret = memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
> > > > +                               &mr_has_discard_manager);
> > > > +    if (ret && mr_has_discard_manager) {
> > > >          /*
> > > >           * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > > >           * pages will remain pinned inside vfio until unmapped, resulting in a
> > > > @@ -635,29 +601,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > >                           " intended via an IOMMU. It's possible to mitigate "
> > > >                           " by setting/adjusting RLIMIT_MEMLOCK.");
> > > >      }
> > > > -
> > > > -    /*
> > > > -     * Translation truncates length to the IOMMU page size,
> > > > -     * check that it did not truncate too much.
> > > > -     */
> > > > -    if (len & iotlb->addr_mask) {
> > > > -        error_report("iommu has granularity incompatible with target AS");
> > > > -        return false;
> > > > -    }
> > > > -
> > > > -    if (vaddr) {
> > > > -        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > > > -    }
> > > > -
> > > > -    if (ram_addr) {
> > > > -        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > > > -    }
> > > > -
> > > > -    if (read_only) {
> > > > -        *read_only = !writable || mr->readonly;
> > > > -    }
> > > > -
> > > > -    return true;
> > > > +    return ret;
> > > >  }
> > > >
> > > >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > > index bfb1de8eea..d1e79c39dc 100644
> > > > --- a/include/exec/memory.h
> > > > +++ b/include/exec/memory.h
> > > > @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
> > > >  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > > >                                               RamDiscardListener *rdl);
> > > >
> > > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > > +                          bool *mr_has_discard_manager);
> > > > +
> > > >  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> > > >  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
> > > >
> > > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > > index 7ba2048836..bc0be3f62c 100644
> > > > --- a/softmmu/memory.c
> > > > +++ b/softmmu/memory.c
> > > > @@ -33,6 +33,7 @@
> > > >  #include "qemu/accel.h"
> > > >  #include "hw/boards.h"
> > > >  #include "migration/vmstate.h"
> > > > +#include "exec/address-spaces.h"
> > > >
> > > >  //#define DEBUG_UNASSIGNED
> > > >
> > > > @@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > > >      rdmc->unregister_listener(rdm, rdl);
> > > >  }
> > > >
> > > > +/* Called with rcu_read_lock held.  */
> > > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > > +                          bool *mr_has_discard_manager)
> > > > +{
> > > > +    MemoryRegion *mr;
> > > > +    hwaddr xlat;
> > > > +    hwaddr len = iotlb->addr_mask + 1;
> > > > +    bool writable = iotlb->perm & IOMMU_WO;
> > > > +
> > > > +    if (mr_has_discard_manager) {
> > > > +        *mr_has_discard_manager = false;
> > > > +    }
> > > > +    /*
> > > > +     * The IOMMU TLB entry we have just covers translation through
> > > > +     * this IOMMU to its immediate target.  We need to translate
> > > > +     * it the rest of the way through to memory.
> > > > +     */
> > > > +    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
> > > > +                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
> > > > +    if (!memory_region_is_ram(mr)) {
> > > > +        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
> > > > +        return false;
> > > > +    } else if (memory_region_has_ram_discard_manager(mr)) {
> > > > +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > > > +        MemoryRegionSection tmp = {
> > > > +            .mr = mr,
> > > > +            .offset_within_region = xlat,
> > > > +            .size = int128_make64(len),
> > > > +        };
> > > > +        if (mr_has_discard_manager) {
> > > > +            *mr_has_discard_manager = true;
> > > > +        }
> > > > +        /*
> > > > +         * Malicious VMs can map memory into the IOMMU, which is expected
> > > > +         * to remain discarded. vfio will pin all pages, populating memory.
> > > > +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > > > +         * were already restored before IOMMUs are restored.
> > > > +         */
> > > > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > > +            error_report("iommu map to discarded memory (e.g., unplugged via"
> > > > +                         " virtio-mem): %" HWADDR_PRIx "",
> > > > +                         iotlb->translated_addr);
> > > > +            return false;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * Translation truncates length to the IOMMU page size,
> > > > +     * check that it did not truncate too much.
> > > > +     */
> > > > +    if (len & iotlb->addr_mask) {
> > > > +        error_report("iommu has granularity incompatible with target AS");
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    if (vaddr) {
> > > > +        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > > > +    }
> > > > +
> > > > +    if (ram_addr) {
> > > > +        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > > > +    }
> > > > +
> > > > +    if (read_only) {
> > > > +        *read_only = !writable || mr->readonly;
> > > > +    }
> > > > +
> > > > +    return true;
> > > > +}
> > > > +
> > > >  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
> > > >  {
> > > >      uint8_t mask = 1 << client;
> > > > --
> > > > 2.34.3
> > >
> > > On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > > > Add support for vIOMMU. add the new function to deal with iommu MR.
> > > > - during iommu_region_add register a specific IOMMU notifier,
> > > >  and store all notifiers in a list.
> > > > - during iommu_region_del, compare and delete the IOMMU notifier from the list
> > > >
> > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > >
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-vdpa.c         | 123 ++++++++++++++++++++++++++++++---
> > > >  include/hw/virtio/vhost-vdpa.h |  10 +++
> > > >  2 files changed, 122 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 3ff9ce3501..dcfaaccfa9 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -26,6 +26,7 @@
> > > >  #include "cpu.h"
> > > >  #include "trace.h"
> > > >  #include "qapi/error.h"
> > > > +#include "hw/virtio/virtio-access.h"
> > > >
> > > >  /*
> > > >   * Return one past the end of the end of section. Be careful with uint64_t
> > > > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > > >                                                  uint64_t iova_min,
> > > >                                                  uint64_t iova_max)
> > > >  {
> > > > -    Int128 llend;
> > > >
> > > >      if ((!memory_region_is_ram(section->mr) &&
> > > >           !memory_region_is_iommu(section->mr)) ||
> > > > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > > >          return true;
> > > >      }
> > > >
> > > > -    llend = vhost_vdpa_section_end(section);
> > > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > -        error_report("RAM section out of device range (max=0x%" PRIx64
> > > > -                     ", end addr=0x%" PRIx64 ")",
> > > > -                     iova_max, int128_get64(llend));
> > > > -        return true;
> > > > -    }
> > > > -
> > > >      return false;
> > > >  }
> > > >
> > > > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > >      v->iotlb_batch_begin_sent = false;
> > > >  }
> > > >
> > > > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > > +{
> > > > +    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
> > > > +
> > > > +    hwaddr iova = iotlb->iova + iommu->iommu_offset;
> > > > +    struct vhost_vdpa *v = iommu->dev;
> > > > +    void *vaddr;
> > > > +    int ret;
> > > > +
> > > > +    if (iotlb->target_as != &address_space_memory) {
> > > > +        error_report("Wrong target AS \"%s\", only system memory is allowed",
> > > > +                     iotlb->target_as->name ? iotlb->target_as->name : "none");
> > > > +        return;
> > > > +    }
> > > > +    RCU_READ_LOCK_GUARD();
> > > > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > > > +
> > > > +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> > > > +        bool read_only;
> > > > +
> > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> > > > +            return;
> > > > +        }
> > > > +        ret =
> > > > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
> > > > +        if (ret) {
> > > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > > > +                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
> > > > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > > > +        }
> > > > +    } else {
> > > > +        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> > > > +        if (ret) {
> > > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> > > > +                         "0x%" HWADDR_PRIx ") = %d (%m)",
> > > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > > > +                                        MemoryRegionSection *section)
> > > > +{
> > > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +    Int128 end;
> > > > +    int iommu_idx;
> > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > +    int ret;
> > > > +
> > > > +    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> > > > +
> > > > +    iommu = g_malloc0(sizeof(*iommu));
> > > > +    end =  int128_add(int128_make64(section->offset_within_region),
> > > > +            section->size);
> > > > +    end = int128_sub(end, int128_one());
> > > > +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> > > > +            MEMTXATTRS_UNSPECIFIED);
> > > > +
> > > > +    iommu->iommu_mr = iommu_mr;
> > > > +
> > > > +    iommu_notifier_init(
> > > > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
> > > > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > > > +    iommu->iommu_offset =
> > > > +        section->offset_within_address_space - section->offset_within_region;
> > > > +    iommu->dev = v;
> > > > +
> > > > +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> > > > +    if (ret) {
> > > > +        g_free(iommu);
> > > > +        return;
> > > > +    }
> > > > +
> > > > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > > > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > > > +
> > > > +    return;
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > > > +                                        MemoryRegionSection *section)
> > > > +{
> > > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > > +
> > > > +    struct vdpa_iommu *iommu;
> > > > +
> > > > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > > > +    {
> > > > +        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
> > > > +            iommu->n.start == section->offset_within_region) {
> > > > +            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
> > > > +            QLIST_REMOVE(iommu, iommu_next);
> > > > +            g_free(iommu);
> > > > +            break;
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > > >                                             MemoryRegionSection *section)
> > > >  {
> > > > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        vhost_vdpa_iommu_region_add(listener, section);
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> > > >                                              v->iova_range.last)) {
> > > >          return;
> > > >      }
> > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > > +        return;
> > > > +    }
> > > >
> > > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory_listener = {
> > > >      .region_del = vhost_vdpa_listener_region_del,
> > > >  };
> > > >
> > > > +
> > > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
> > > >                               void *arg)
> > > >  {
> > > > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
> > > >      v = dev->opaque;
> > > >      trace_vhost_vdpa_cleanup(dev, v);
> > > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > > -    memory_listener_unregister(&v->listener);
> > > >      vhost_vdpa_svq_cleanup(dev);
> > > >
> > > >      dev->opaque = NULL;
> > > > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> > > >      }
> > > >
> > > >      if (started) {
> > > > -        memory_listener_register(&v->listener, &address_space_memory);
> > > > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > > > +
> > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > > >      } else {
> > > >          vhost_vdpa_reset_device(dev);
> > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> > > > index d10a89303e..64a46e37cb 100644
> > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> > > >      void *shadow_vq_ops_opaque;
> > > >      struct vhost_dev *dev;
> > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > > +    IOMMUNotifier n;
> > > >  } VhostVDPA;
> > > >
> > > > +struct vdpa_iommu {
> > > > +    struct vhost_vdpa *dev;
> > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > +    hwaddr iommu_offset;
> > > > +    IOMMUNotifier n;
> > > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > > +};
> > > > +
> > > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > > >                         void *vaddr, bool readonly);
> > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> > > > --
> > > > 2.34.3
> > >
>


