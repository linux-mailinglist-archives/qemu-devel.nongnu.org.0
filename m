Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355F6130CD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 07:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opOhQ-0007QR-Pt; Mon, 31 Oct 2022 02:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opOhM-0007QD-EL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opOhJ-0000Sd-TK
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 02:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667199301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ira1rhffMQIiVPoYqfmjLRdiygYv3DdSpNr0euc2adw=;
 b=RpUwnyLnMUJON6CncHiL9NbcMFPwG48LkAH1NA4uRQ+UikQ79unsgTmW9uQAm3LVWgxZoq
 +JVxTD1myB+RT8lj7pRFRYELkIXfbauETSqL3lKVNnD7XPQe7WsLASqQ2dZNXjr62dvuF2
 ihtkeuH/Ot1ORegT3YAwWjCFInIdC78=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-Z3bH0O4uODSOLAUVvbljLw-1; Mon, 31 Oct 2022 02:54:59 -0400
X-MC-Unique: Z3bH0O4uODSOLAUVvbljLw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfa287000000b00236c367fcddso1084260wra.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 23:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ira1rhffMQIiVPoYqfmjLRdiygYv3DdSpNr0euc2adw=;
 b=MpHmzsAhBgxNfqpO515zYCnJcuPw1KeMv8q0NyIzanujLiRVahZK6gCIauwE93e42J
 x2oirT3p6MnnTHgRsEc0+5E44vCRZzMwS8p1GOMhOUCjzIVvv7Roenp5GAEwUNQ0sMer
 avle2T9EUBNTU9lr1nTPE28/yXZmAfynhGLdDOesjw6VezSh3XuiBqghjoJnN7rrcqUZ
 jshXA6T6jzXPahzU0wyT6+TsMX2k5ZUPGLxwT//kCKLxfY59xcz1CDZzfEJ+7emf8YjY
 2YARzFyKXsdlx5W2LHjA350SYGBTmIQRxcAfZNoYx3VQ87BM5g3+T4/KTwVaqGaDuTvv
 RHrQ==
X-Gm-Message-State: ACrzQf1+Ct483fAWEyNBU6pLsBOpOhRvaITk1EbRSeSGB4NU72QMVvlN
 eBFw4hcXcUFA28f8xwsEjxrZs4a7aOmVcdDdyAERZaxMgEhimxIxH23SMeESxfTPiM1jhzAN0Wu
 zq12rtuheHiW6CU0=
X-Received: by 2002:a05:6000:186e:b0:22e:5dd3:e32a with SMTP id
 d14-20020a056000186e00b0022e5dd3e32amr6904892wri.167.1667199298590; 
 Sun, 30 Oct 2022 23:54:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n4BO9kF0JGu9neH5Wlvx4Bt42UXM9Ze7nhYxMGh3TApq94yS0f8W+AGt/qmiEBAyI9KbtJQ==
X-Received: by 2002:a05:6000:186e:b0:22e:5dd3:e32a with SMTP id
 d14-20020a056000186e00b0022e5dd3e32amr6904882wri.167.1667199298254; 
 Sun, 30 Oct 2022 23:54:58 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm6173671wru.11.2022.10.30.23.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 23:54:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 02:54:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221031025344-mutt-send-email-mst@kernel.org>
References: <20221031031020.1405111-3-lulu@redhat.com>
 <20221031031020.1405111-2-lulu@redhat.com>
 <20221031023754-mutt-send-email-mst@kernel.org>
 <CACLfguXzKyqgtQvXuGqt14d5MW8pQ2c7sD4zp-4piesnRNJqvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACLfguXzKyqgtQvXuGqt14d5MW8pQ2c7sD4zp-4piesnRNJqvg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 02:44:11PM +0800, Cindy Lu wrote:
> On Mon, 31 Oct 2022 at 14:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Oct 31, 2022 at 11:10:19AM +0800, Cindy Lu wrote:
> > > - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
> > >   change the name to memory_get_xlat_addr(). So we can use this
> > >   function on other devices, such as vDPA device.
> > > - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
> > >   whether the memory is backed by a discard manager. then device can
> > >   have its own warning.
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> >
> > Could you rebase on top of my tree (config interrupt support conflicts).
> >
> Hi Micheal,
> sure, will do, but I found a crash in config interrupt while testing
> vhost user,
> should I post a new version for it? Or maybe a patch later?
> Thanks
> Cindy

New version, I will drop this one. So do you want this one picked up and
config interrupt on top?

> > > ---
> > >  hw/vfio/common.c      | 66 +++------------------------------------
> > >  include/exec/memory.h |  4 +++
> > >  softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 81 insertions(+), 61 deletions(-)
> > >
> > > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > > index ace9562a9b..6bc02b32c8 100644
> > > --- a/hw/vfio/common.c
> > > +++ b/hw/vfio/common.c
> > > @@ -578,45 +578,11 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> > >  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > >                                 ram_addr_t *ram_addr, bool *read_only)
> > >  {
> > > -    MemoryRegion *mr;
> > > -    hwaddr xlat;
> > > -    hwaddr len = iotlb->addr_mask + 1;
> > > -    bool writable = iotlb->perm & IOMMU_WO;
> > > -
> > > -    /*
> > > -     * The IOMMU TLB entry we have just covers translation through
> > > -     * this IOMMU to its immediate target.  We need to translate
> > > -     * it the rest of the way through to memory.
> > > -     */
> > > -    mr = address_space_translate(&address_space_memory,
> > > -                                 iotlb->translated_addr,
> > > -                                 &xlat, &len, writable,
> > > -                                 MEMTXATTRS_UNSPECIFIED);
> > > -    if (!memory_region_is_ram(mr)) {
> > > -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> > > -                     xlat);
> > > -        return false;
> > > -    } else if (memory_region_has_ram_discard_manager(mr)) {
> > > -        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > > -        MemoryRegionSection tmp = {
> > > -            .mr = mr,
> > > -            .offset_within_region = xlat,
> > > -            .size = int128_make64(len),
> > > -        };
> > > -
> > > -        /*
> > > -         * Malicious VMs can map memory into the IOMMU, which is expected
> > > -         * to remain discarded. vfio will pin all pages, populating memory.
> > > -         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > > -         * were already restored before IOMMUs are restored.
> > > -         */
> > > -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > -            error_report("iommu map to discarded memory (e.g., unplugged via"
> > > -                         " virtio-mem): %"HWADDR_PRIx"",
> > > -                         iotlb->translated_addr);
> > > -            return false;
> > > -        }
> > > +    bool ret, mr_has_discard_manager;
> > >
> > > +    ret = memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
> > > +                               &mr_has_discard_manager);
> > > +    if (ret && mr_has_discard_manager) {
> > >          /*
> > >           * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > >           * pages will remain pinned inside vfio until unmapped, resulting in a
> > > @@ -635,29 +601,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > >                           " intended via an IOMMU. It's possible to mitigate "
> > >                           " by setting/adjusting RLIMIT_MEMLOCK.");
> > >      }
> > > -
> > > -    /*
> > > -     * Translation truncates length to the IOMMU page size,
> > > -     * check that it did not truncate too much.
> > > -     */
> > > -    if (len & iotlb->addr_mask) {
> > > -        error_report("iommu has granularity incompatible with target AS");
> > > -        return false;
> > > -    }
> > > -
> > > -    if (vaddr) {
> > > -        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > > -    }
> > > -
> > > -    if (ram_addr) {
> > > -        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > > -    }
> > > -
> > > -    if (read_only) {
> > > -        *read_only = !writable || mr->readonly;
> > > -    }
> > > -
> > > -    return true;
> > > +    return ret;
> > >  }
> > >
> > >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index bfb1de8eea..d1e79c39dc 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
> > >  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > >                                               RamDiscardListener *rdl);
> > >
> > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > +                          bool *mr_has_discard_manager);
> > > +
> > >  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
> > >  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
> > >
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index 7ba2048836..bc0be3f62c 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -33,6 +33,7 @@
> > >  #include "qemu/accel.h"
> > >  #include "hw/boards.h"
> > >  #include "migration/vmstate.h"
> > > +#include "exec/address-spaces.h"
> > >
> > >  //#define DEBUG_UNASSIGNED
> > >
> > > @@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
> > >      rdmc->unregister_listener(rdm, rdl);
> > >  }
> > >
> > > +/* Called with rcu_read_lock held.  */
> > > +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> > > +                          ram_addr_t *ram_addr, bool *read_only,
> > > +                          bool *mr_has_discard_manager)
> > > +{
> > > +    MemoryRegion *mr;
> > > +    hwaddr xlat;
> > > +    hwaddr len = iotlb->addr_mask + 1;
> > > +    bool writable = iotlb->perm & IOMMU_WO;
> > > +
> > > +    if (mr_has_discard_manager) {
> > > +        *mr_has_discard_manager = false;
> > > +    }
> > > +    /*
> > > +     * The IOMMU TLB entry we have just covers translation through
> > > +     * this IOMMU to its immediate target.  We need to translate
> > > +     * it the rest of the way through to memory.
> > > +     */
> > > +    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
> > > +                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
> > > +    if (!memory_region_is_ram(mr)) {
> > > +        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
> > > +        return false;
> > > +    } else if (memory_region_has_ram_discard_manager(mr)) {
> > > +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> > > +        MemoryRegionSection tmp = {
> > > +            .mr = mr,
> > > +            .offset_within_region = xlat,
> > > +            .size = int128_make64(len),
> > > +        };
> > > +        if (mr_has_discard_manager) {
> > > +            *mr_has_discard_manager = true;
> > > +        }
> > > +        /*
> > > +         * Malicious VMs can map memory into the IOMMU, which is expected
> > > +         * to remain discarded. vfio will pin all pages, populating memory.
> > > +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > > +         * were already restored before IOMMUs are restored.
> > > +         */
> > > +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > > +            error_report("iommu map to discarded memory (e.g., unplugged via"
> > > +                         " virtio-mem): %" HWADDR_PRIx "",
> > > +                         iotlb->translated_addr);
> > > +            return false;
> > > +        }
> > > +    }
> > > +
> > > +    /*
> > > +     * Translation truncates length to the IOMMU page size,
> > > +     * check that it did not truncate too much.
> > > +     */
> > > +    if (len & iotlb->addr_mask) {
> > > +        error_report("iommu has granularity incompatible with target AS");
> > > +        return false;
> > > +    }
> > > +
> > > +    if (vaddr) {
> > > +        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> > > +    }
> > > +
> > > +    if (ram_addr) {
> > > +        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> > > +    }
> > > +
> > > +    if (read_only) {
> > > +        *read_only = !writable || mr->readonly;
> > > +    }
> > > +
> > > +    return true;
> > > +}
> > > +
> > >  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
> > >  {
> > >      uint8_t mask = 1 << client;
> > > --
> > > 2.34.3
> >
> > On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > > Add support for vIOMMU. add the new function to deal with iommu MR.
> > > - during iommu_region_add register a specific IOMMU notifier,
> > >  and store all notifiers in a list.
> > > - during iommu_region_del, compare and delete the IOMMU notifier from the list
> > >
> > > Verified in vp_vdpa and vdpa_sim_net driver
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > ---
> > >  hw/virtio/vhost-vdpa.c         | 123 ++++++++++++++++++++++++++++++---
> > >  include/hw/virtio/vhost-vdpa.h |  10 +++
> > >  2 files changed, 122 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 3ff9ce3501..dcfaaccfa9 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -26,6 +26,7 @@
> > >  #include "cpu.h"
> > >  #include "trace.h"
> > >  #include "qapi/error.h"
> > > +#include "hw/virtio/virtio-access.h"
> > >
> > >  /*
> > >   * Return one past the end of the end of section. Be careful with uint64_t
> > > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > >                                                  uint64_t iova_min,
> > >                                                  uint64_t iova_max)
> > >  {
> > > -    Int128 llend;
> > >
> > >      if ((!memory_region_is_ram(section->mr) &&
> > >           !memory_region_is_iommu(section->mr)) ||
> > > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > >          return true;
> > >      }
> > >
> > > -    llend = vhost_vdpa_section_end(section);
> > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > -        error_report("RAM section out of device range (max=0x%" PRIx64
> > > -                     ", end addr=0x%" PRIx64 ")",
> > > -                     iova_max, int128_get64(llend));
> > > -        return true;
> > > -    }
> > > -
> > >      return false;
> > >  }
> > >
> > > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > >      v->iotlb_batch_begin_sent = false;
> > >  }
> > >
> > > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > +{
> > > +    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
> > > +
> > > +    hwaddr iova = iotlb->iova + iommu->iommu_offset;
> > > +    struct vhost_vdpa *v = iommu->dev;
> > > +    void *vaddr;
> > > +    int ret;
> > > +
> > > +    if (iotlb->target_as != &address_space_memory) {
> > > +        error_report("Wrong target AS \"%s\", only system memory is allowed",
> > > +                     iotlb->target_as->name ? iotlb->target_as->name : "none");
> > > +        return;
> > > +    }
> > > +    RCU_READ_LOCK_GUARD();
> > > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > > +
> > > +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> > > +        bool read_only;
> > > +
> > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> > > +            return;
> > > +        }
> > > +        ret =
> > > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
> > > +        if (ret) {
> > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > > +                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
> > > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > > +        }
> > > +    } else {
> > > +        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> > > +        if (ret) {
> > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> > > +                         "0x%" HWADDR_PRIx ") = %d (%m)",
> > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > > +                                        MemoryRegionSection *section)
> > > +{
> > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > +
> > > +    struct vdpa_iommu *iommu;
> > > +    Int128 end;
> > > +    int iommu_idx;
> > > +    IOMMUMemoryRegion *iommu_mr;
> > > +    int ret;
> > > +
> > > +    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> > > +
> > > +    iommu = g_malloc0(sizeof(*iommu));
> > > +    end =  int128_add(int128_make64(section->offset_within_region),
> > > +            section->size);
> > > +    end = int128_sub(end, int128_one());
> > > +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> > > +            MEMTXATTRS_UNSPECIFIED);
> > > +
> > > +    iommu->iommu_mr = iommu_mr;
> > > +
> > > +    iommu_notifier_init(
> > > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
> > > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > > +    iommu->iommu_offset =
> > > +        section->offset_within_address_space - section->offset_within_region;
> > > +    iommu->dev = v;
> > > +
> > > +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> > > +    if (ret) {
> > > +        g_free(iommu);
> > > +        return;
> > > +    }
> > > +
> > > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > > +
> > > +    return;
> > > +}
> > > +
> > > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > > +                                        MemoryRegionSection *section)
> > > +{
> > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > +
> > > +    struct vdpa_iommu *iommu;
> > > +
> > > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > > +    {
> > > +        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
> > > +            iommu->n.start == section->offset_within_region) {
> > > +            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
> > > +            QLIST_REMOVE(iommu, iommu_next);
> > > +            g_free(iommu);
> > > +            break;
> > > +        }
> > > +    }
> > > +}
> > > +
> > >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > >                                             MemoryRegionSection *section)
> > >  {
> > > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > >                                              v->iova_range.last)) {
> > >          return;
> > >      }
> > > +    if (memory_region_is_iommu(section->mr)) {
> > > +        vhost_vdpa_iommu_region_add(listener, section);
> > > +        return;
> > > +    }
> > >
> > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> > >                                              v->iova_range.last)) {
> > >          return;
> > >      }
> > > +    if (memory_region_is_iommu(section->mr)) {
> > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > +        return;
> > > +    }
> > >
> > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory_listener = {
> > >      .region_del = vhost_vdpa_listener_region_del,
> > >  };
> > >
> > > +
> > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
> > >                               void *arg)
> > >  {
> > > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
> > >      v = dev->opaque;
> > >      trace_vhost_vdpa_cleanup(dev, v);
> > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > -    memory_listener_unregister(&v->listener);
> > >      vhost_vdpa_svq_cleanup(dev);
> > >
> > >      dev->opaque = NULL;
> > > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> > >      }
> > >
> > >      if (started) {
> > > -        memory_listener_register(&v->listener, &address_space_memory);
> > > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > > +
> > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > >      } else {
> > >          vhost_vdpa_reset_device(dev);
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> > > index d10a89303e..64a46e37cb 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> > >      void *shadow_vq_ops_opaque;
> > >      struct vhost_dev *dev;
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > +    IOMMUNotifier n;
> > >  } VhostVDPA;
> > >
> > > +struct vdpa_iommu {
> > > +    struct vhost_vdpa *dev;
> > > +    IOMMUMemoryRegion *iommu_mr;
> > > +    hwaddr iommu_offset;
> > > +    IOMMUNotifier n;
> > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > +};
> > > +
> > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > >                         void *vaddr, bool readonly);
> > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> > > --
> > > 2.34.3
> >


