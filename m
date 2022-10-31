Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACEA612F10
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:41:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKjL-0006cK-4V; Sun, 30 Oct 2022 22:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opKjG-0006aj-MI
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 22:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opKjE-0001UF-MF
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 22:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667184043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvtw5R0q/mR0UZbbCmZDW5Ci8yJ4QEUq4enP589vOm4=;
 b=Jpm2jXWgTMoTMTAR8b+nV71+mKtQ1Fi2uSsSIyXStNUf/NpuuY8J7MeisT57hqFJI9UvlK
 EXkAiFPl1/8nJjHt97ZN0HgzP3bM3nI/chryNkMTO2645mtsWjWVb9MsZIZY06PXvgtwl4
 n8MAiE4atlKiycC8s7s/5PWPfeCHUn4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-0xoZIX-IOwK1OIXxvjYrBw-1; Sun, 30 Oct 2022 22:40:41 -0400
X-MC-Unique: 0xoZIX-IOwK1OIXxvjYrBw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso6942329edc.21
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 19:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvtw5R0q/mR0UZbbCmZDW5Ci8yJ4QEUq4enP589vOm4=;
 b=d8j7l9q2OCJxLnUkDHcgM2FQHmqIs4dIg99CeIbLofx21tuP4cWkuBSQpk1MqXWPmU
 oU7X/u0sIJOWhzmfasUCcWjU/Kk7ZLoDzwpGwZd3GGAJpjnktnvxGjwdnAtkeGiGJkhJ
 cDGkKKYBEvkje6DyRZix13Du/jjpjNsk0CTfVOpryOpELuNE4boaUYEzPwwGupn9dn41
 v1TIEdNeyzY5mn26dRXphz8BZ97y9qO7m84B2ZFc5SHGJwT+vF3N6ZpIvt2/Hjqy7x+a
 9KNrrtm55tVoRx056VCdQ3FrwG63fHUXA5emGMCfQTt1nqFnSlYphtKEvF8zArVuTdqg
 NlDg==
X-Gm-Message-State: ACrzQf1aVrr44RcPV/TfihPGjaCZ3JFDHMwOs4kMpu2ZjcYU51blrOIe
 wCDpl9G7+sxwurX4EYfjS27PlFMrTT139DKKKb847rZ71V7UhR+Bc6EgR6KoMHMBrype0hYjxTY
 5iH7Mqw3ozctT/XE0gTP3M/nPGGkUhxA=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr11201615ejc.724.1667184040657; 
 Sun, 30 Oct 2022 19:40:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZbQurvHdnovI1XD0hQgdajJwyKdAg13VpNKHm49i+DV9zKKd+XwnHjjCK0es6xAlSrkUWMJkJzvaG2bKSIo4=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr11201592ejc.724.1667184040360; Sun, 30
 Oct 2022 19:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221031015605.1396243-1-lulu@redhat.com>
 <20221031015605.1396243-2-lulu@redhat.com>
 <20221030203048.3f557509.alex.williamson@redhat.com>
In-Reply-To: <20221030203048.3f557509.alex.williamson@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 31 Oct 2022 10:40:03 +0800
Message-ID: <CACLfguU5awkh9DQv2Ur+rdJ85gq-tYQXsxkpD2GR=v63ORCwVQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
To: Alex Williamson <alex.williamson@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

On Mon, 31 Oct 2022 at 10:30, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Mon, 31 Oct 2022 09:56:04 +0800
> Cindy Lu <lulu@redhat.com> wrote:
>
> > - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
> >   change the name to memory_get_xlat_addr(). So we can use this
> >   function on other devices, such as vDPA device.
> > - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
> >   whether the memory is backed by a discard manager. the device can
> >   have its own warning.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/vfio/common.c      | 101 +++++++++++-------------------------------
> >  include/exec/memory.h |   4 ++
> >  softmmu/memory.c      |  72 ++++++++++++++++++++++++++++++
> >  3 files changed, 102 insertions(+), 75 deletions(-)
>
> Some changes I'd like to see below, but otherwise
>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>
>
> >
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ace9562a9b..5bfd55de86 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -578,86 +578,37 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
> >  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> >                                 ram_addr_t *ram_addr, bool *read_only)
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
> > +    bool mr_has_discard_manager;
> > +    if (memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
> > +                             &mr_has_discard_manager)) {
> >          /*
> > -         * Malicious VMs can map memory into the IOMMU, which is expected
> > -         * to remain discarded. vfio will pin all pages, populating memory.
> > -         * Disallow that. vmstate priorities make sure any RamDiscardManager
> > -         * were already restored before IOMMUs are restored.
> > +         * if the mr has the discard_manager and the return value of
> > +         * memory_get_xlat_addr() is ture then we need to warn
>
> s/ture/true/
>
> But then the comment below is really describing why we're generating a
> warning, so the above additional comment is mostly just noise.
>
sure, will remove this
> I'd also prefer to see this as:
>
> {
>     bool ret, mr_has_discard_manager;
>
>     ret = memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
>                                &mr_has_discard_manager));
>
>     if (ret && mr_has_discard_manager) {
>         // Unmodified comment and warn report from existing code
>     }
>
>     return ret;
> }
>
sure, Will change this, Thanks Alex
Thanks
Cindy
> >           */
> > -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> > -            error_report("iommu map to discarded memory (e.g., unplugged via"
> > -                         " virtio-mem): %"HWADDR_PRIx"",
> > -                         iotlb->translated_addr);
> > -            return false;
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
> >          }
> >
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
> > +        return true;
> >      }
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
> > +    return false;
> >  }
> >
> >  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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


