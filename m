Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFEA6107EC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 04:24:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooF25-0005kc-55; Thu, 27 Oct 2022 22:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooF23-0005df-4d
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:23:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooF20-0005XG-Pd
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 22:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666923816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUk54YaCmV379LKZSKfbWY8d8mP5tJTqu/K/rXpvv9U=;
 b=R28fnmmmdErsTaCwzRNnUFE1ayuvrRdO7xdfoQAyIB+JdGCN7d3SR1OMIwl3J3vZ4hZp4z
 Ee3xeZpbM4Uo2PrpmJlRy+h4O8WolLXM2C8AQdDADcBNlwMJmuvENpkJjfXHZCGg3mPfdh
 2k/n3Wdl1fupasceCWkRIRdpZXYO1Bc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-ksDahXNOOMataqkM1wlIEg-1; Thu, 27 Oct 2022 22:23:32 -0400
X-MC-Unique: ksDahXNOOMataqkM1wlIEg-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso2325934edc.15
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 19:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zUk54YaCmV379LKZSKfbWY8d8mP5tJTqu/K/rXpvv9U=;
 b=g4j5ZaPaQ1B1Whkatd8xl0e4Z9lFIANekwrMMoysCpSb5wo0LEgRZMoZlQx5dBHNOQ
 4L0B9ruFDtE9BZLSu5SeDZyCTlfUE3S2AdIR4LN0f/cTIkPLQaE0zaucZPTIH/AVnEun
 dLQMCm3lMkaG9TrdXbd6ImWX8ILIY940xN5OVupCRGRrrd4989F7GGJIzZGKnD6XJXYC
 NaAjuS1x3mNks/I1pUiBXA+T6ONJ+MuulVwEEvzK4OuvXcrolcVlm7a28lGYMv7POyaS
 mzX4LLaKz/EkxqJmtnpQ8tqd9EyzmVqRdIplrIGBikKZlISxOxwrA6pBmAxqlpnoErsN
 XYFA==
X-Gm-Message-State: ACrzQf3Cnfbs60k2itIIwIB8VfsyJQOZnuRCRu66qzzVBR50ChCKG9Qc
 GJEhtwWfXSPfTpjkK+M24XREHCMga5GODbO0NnOg3NH31OVmK1akCHGGHU0vH9FNdRLiIhofIi+
 ap8BQn86lRKzCmXLihndVaLAWYa6HBqY=
X-Received: by 2002:aa7:cb59:0:b0:461:7378:7be0 with SMTP id
 w25-20020aa7cb59000000b0046173787be0mr29485159edt.60.1666923811449; 
 Thu, 27 Oct 2022 19:23:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KMyP20vuK3AjvNW6dIko1zbKlYHLNKR1DVctIz/Qb5gmd0PYoTLdiaJdGyuhRAuzQP/DVTiIUYR2MUnR7xpQ=
X-Received: by 2002:aa7:cb59:0:b0:461:7378:7be0 with SMTP id
 w25-20020aa7cb59000000b0046173787be0mr29485125edt.60.1666923811092; Thu, 27
 Oct 2022 19:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221027074032.1101939-2-lulu@redhat.com>
 <20221027151134.354bd3bb.alex.williamson@redhat.com>
 <CACGkMEtoOFLUr0uKHagxUb-yPrrrS0BJ68tXNMP1D8pyT34Ttg@mail.gmail.com>
 <20221027200811.7e586f7b.alex.williamson@redhat.com>
In-Reply-To: <20221027200811.7e586f7b.alex.williamson@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 28 Oct 2022 10:23:16 +0800
Message-ID: <CACGkMEtqvD-tf=LhhP-xNREMj2ToWqOLwa8-+mjoSW9UJ8S07g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, 
 david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Fri, Oct 28, 2022 at 10:08 AM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Fri, 28 Oct 2022 09:50:10 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
> > On Fri, Oct 28, 2022 at 5:11 AM Alex Williamson
> > <alex.williamson@redhat.com> wrote:
> > >
> > > On Thu, 27 Oct 2022 15:40:31 +0800
> > > Cindy Lu <lulu@redhat.com> wrote:
> > >
> > > > Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> > > > change the name to memory_get_xlat_addr().So we can use this
> > > > function in other devices,such as vDPA device.
> > > >
> > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > ---
> > > >  hw/vfio/common.c      | 92 ++-----------------------------------------
> > > >  include/exec/memory.h |  4 ++
> > > >  softmmu/memory.c      | 84 +++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 92 insertions(+), 88 deletions(-)
> > > >
> > > > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > > > index ace9562a9b..2b5a9f3d8d 100644
> > > > --- a/hw/vfio/common.c
> > > > +++ b/hw/vfio/common.c
> > > > @@ -574,92 +574,6 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > > >             section->offset_within_address_space & (1ULL << 63);
> > > >  }
> > > >
> > > > -/* Called with rcu_read_lock held.  */
> > > > -static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > > -                               ram_addr_t *ram_addr, bool *read_only)
> > > > -{
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
> > > > -
> > > > -        /*
> > > > -         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > > > -         * pages will remain pinned inside vfio until unmapped, resulting in a
> > > > -         * higher memory consumption than expected. If memory would get
> > > > -         * populated again later, there would be an inconsistency between pages
> > > > -         * pinned by vfio and pages seen by QEMU. This is the case until
> > > > -         * unmapped from the IOMMU (e.g., during device reset).
> > > > -         *
> > > > -         * With malicious guests, we really only care about pinning more memory
> > > > -         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > > > -         * exceeded and can be used to mitigate this problem.
> > > > -         */
> > > > -        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> > > > -                         " RAM (e.g., virtio-mem) works, however, malicious"
> > > > -                         " guests can trigger pinning of more memory than"
> > > > -                         " intended via an IOMMU. It's possible to mitigate "
> > > > -                         " by setting/adjusting RLIMIT_MEMLOCK.");
> > > > -    }
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
> > > > -}
> > > > -
> > > >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > >  {
> > > >      VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
> > > > @@ -682,7 +596,8 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > >      if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> > > >          bool read_only;
> > > >
> > > > -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,
> > > > +                                  &address_space_memory)) {
> > > >              goto out;
> > > >          }
> > > >          /*
> > > > @@ -1359,7 +1274,8 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > >      }
> > > >
> > > >      rcu_read_lock();
> > > > -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> > > > +    if (memory_get_xlat_addr(iotlb, NULL, &translated_addr, NULL,
> > > > +                             &address_space_memory)) {
> > > >          int ret;
> > > >
> > > >          ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
> > > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > > index bfb1de8eea..282de1d5ad 100644
> > > > --- a/include/exec/memory.h
> > > > +++ b/include/exec/memory.h
> > > > @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
> > > >  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > > >                                               RamDiscardListener *rdl);
> > > >
> > > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > > +                          AddressSpace *as);
> > > > +
> > > >  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> > > >  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
> > > >
> > > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > > index 7ba2048836..8586863ffa 100644
> > > > --- a/softmmu/memory.c
> > > > +++ b/softmmu/memory.c
> > > > @@ -2121,6 +2121,90 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > > >      rdmc->unregister_listener(rdm, rdl);
> > > >  }
> > > >
> > > > +/* Called with rcu_read_lock held.  */
> > > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > > +                          AddressSpace *as)
> > > > +{
> > > > +    MemoryRegion *mr;
> > > > +    hwaddr xlat;
> > > > +    hwaddr len = iotlb->addr_mask + 1;
> > > > +    bool writable = iotlb->perm & IOMMU_WO;
> > > > +
> > > > +    /*
> > > > +     * The IOMMU TLB entry we have just covers translation through
> > > > +     * this IOMMU to its immediate target.  We need to translate
> > > > +     * it the rest of the way through to memory.
> > > > +     */
> > > > +    mr = address_space_translate(as, iotlb->translated_addr, &xlat, &len,
> > > > +                                 writable, MEMTXATTRS_UNSPECIFIED);
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
> > > > +
> > > > +        /*
> > > > +         * Malicious VMs can map memory into the IOMMU, which is expected
> > > > +         * to remain discarded. device will pin all pages, populating memory.
> > > > +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > > > +         * were already restored before IOMMUs are restored.
> > > > +         */
> > > > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > > +            error_report("iommu map to discarded memory (e.g., unplugged via"
> > > > +                         " virtio-mem): %" HWADDR_PRIx "",
> > > > +                         iotlb->translated_addr);
> > > > +            return false;
> > > > +        }
> > > > +
> > > > +        /*
> > > > +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > > > +         * pages will remain pinned inside device until unmapped, resulting in a
> > > > +         * higher memory consumption than expected. If memory would get
> > > > +         * populated again later, there would be an inconsistency between pages
> > > > +         * pinned by device and pages seen by QEMU. This is the case until
> > > > +         * unmapped from the IOMMU (e.g., during device reset).
> > > > +         *
> > > > +         * With malicious guests, we really only care about pinning more memory
> > > > +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > > > +         * exceeded and can be used to mitigate this problem.
> > > > +         */
> > > > +        warn_report_once("Using device with vIOMMUs and coordinated discarding"
> > > > +                         " of RAM (e.g., virtio-mem) works, however, malicious"
> > > > +                         " guests can trigger pinning of more memory than"
> > > > +                         " intended via an IOMMU. It's possible to mitigate "
> > > > +                         " by setting/adjusting RLIMIT_MEMLOCK.");
> > >
> > > Is this really fit to be in shared code?  Simply replacing "vfio" with
> > > "device" for comments and warnings that are really of concern for a
> > > specific use case doesn't look much better to me.
> > >
> > > I think translating an unpopulated address, as in the previous test
> > > above, is generally invalid, but the comment is certainly trying to
> > > frame the severity of this error relative to a specific use case.
> > >
> > > Here we're generating an unconditional warning, assuming that this code
> > > path has been triggered by device code, for the condition of simply
> > > asking for a translation to a MemoryRegion under discard manager
> > > control?  Again, isn't that an action that has implications for a
> > > specific use case of a device that supports pinning host memory?
> >
> >
> > Or can we rename the function to memory_get_xlat_addr_no_discard()?
> > This looks more general and fit for the caller that doesn't want to
> > map region that has a discard manager.
>
> Is a guest restricted from mapping virtio-mem regions to a device?

For the region that is not populated, it should be restricted. If this
is wrong, we need a separate fix.

> AFAIK, this is something that a guest can do and we can't restrict them
> from doing it, it's just that it opens some potential for malicious
> activity that we rely on things like locked memory limits to keep from
> getting out of hand.  Thanks,

So it's the fault of the name, it could be
memory_get_xlat_addr_no_unpopulated_discard().

Or as I replied, stick to what you've suggested.

Thanks

>
> Alex
>
> > > Should the shared code be generating this warning, or could an optional
> > > pointer arg be updated to indicate a translation to discard manager
> > > controlled memory and this comment and warning should remain in the
> > > caller?  Thanks,
> >
> > I think this should also work.
> >
> > Thanks
> >
> > >
> > > Alex
> > >
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
> > >
> >
>


