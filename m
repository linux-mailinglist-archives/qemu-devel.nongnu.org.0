Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C2616374
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:12:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqD7L-0005vz-FK; Wed, 02 Nov 2022 08:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqD7H-0005vq-Su
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqD7F-0002uZ-SP
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667393106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8COmeqwpw4Op5MIpfYuvF37MMd8CSG63rhPMHd8hc1I=;
 b=YtWcvXpnJyGj/TX/dl7W5lHyTyVNiRpzWzIUUCXIQmrn4lRgkMTg9UPhCISxxFBmK1Psf0
 Ooh6KaOBRBcLjIukoYcVZsY5hqhdEaHB6ViJCPoFTZjkKbYOP3bLI2d+d6/B2/scUShF4h
 qeAKaZXf9WqoIMYUa1+YagiVFj4eiNk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-BtlQdh6FNxqFiZfpecYBhg-1; Wed, 02 Nov 2022 08:45:05 -0400
X-MC-Unique: BtlQdh6FNxqFiZfpecYBhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 d13-20020a05600c34cd00b003ce1f62ac5aso1034403wmq.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8COmeqwpw4Op5MIpfYuvF37MMd8CSG63rhPMHd8hc1I=;
 b=ryNpPCsbMKIMsxtZzQfyfYwKQj0fmHmhj+uzzwU0IGZmgCcdR+me8D4YzhkUsj5cUW
 storXF04la1rGSmz358CrstNzbmdxsNtEtej3vAJD4dYyJKPq6HN7bR1TxN9qGltVIKD
 JVw1CcnCbZMC/rDsrdwrF2f9KJfmBM8k6iskkuU6dttCsCjy9Ks5v30CJ8cUcPuBaXxJ
 wnbMaaehIscBZXfuiGDXTCUa9nQ9jOFAxDTSa7PB4YZtaLHsVHpDKdWFIxsX/NGgMnXe
 5z2xe/3rh13nUgEDao7Su//Uftv3oWqy52ht3k2CJ0pdIMOr4SdtFoRDvDj4LJ2SV4rA
 fm7w==
X-Gm-Message-State: ACrzQf2m5JRdEqoydW12VP+mTXzrSDPuY8INCZzoLsGFCClkv+6ffN3N
 FBwZYs2O16FCNzlM9gcbbNKnldd1m2A3mBJCquI+vtknOKabNuxPCevq06PHMOuN084GomxfOnY
 ESErZbMl6QMOrdqE=
X-Received: by 2002:adf:d1e6:0:b0:236:5ead:eac0 with SMTP id
 g6-20020adfd1e6000000b002365eadeac0mr14965710wrd.629.1667393104256; 
 Wed, 02 Nov 2022 05:45:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qF0sIrLCE44po4LCdZcQ2NYEysZ81GUZyqoHsgLp8KiWtarMkih9mJbfiMuD9YOrAaFRoRg==
X-Received: by 2002:adf:d1e6:0:b0:236:5ead:eac0 with SMTP id
 g6-20020adfd1e6000000b002365eadeac0mr14965691wrd.629.1667393104006; 
 Wed, 02 Nov 2022 05:45:04 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0023660f6cecfsm12983697wro.80.2022.11.02.05.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:45:03 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:45:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 1/2] vfio: move implement of vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221102084431-mutt-send-email-mst@kernel.org>
References: <20221031125702.1445168-1-lulu@redhat.com>
 <20221031125702.1445168-2-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031125702.1445168-2-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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

On Mon, Oct 31, 2022 at 08:57:01PM +0800, Cindy Lu wrote:
> - Move the implement vfio_get_xlat_addr to softmmu/memory.c, and
>   change the name to memory_get_xlat_addr(). So we can use this
>   function on other devices, such as vDPA device.
> - Add a new function vfio_get_xlat_addr in vfio/common.c, and it will check
>   whether the memory is backed by a discard manager. then device can
>   have its own warning.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

This is in my tree now, pls note this if you repost so
I don't get confused.

> ---
>  hw/vfio/common.c      | 66 +++------------------------------------
>  include/exec/memory.h |  4 +++
>  softmmu/memory.c      | 72 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+), 61 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9b..6bc02b32c8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -578,45 +578,11 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>  static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>                                 ram_addr_t *ram_addr, bool *read_only)
>  {
> -    MemoryRegion *mr;
> -    hwaddr xlat;
> -    hwaddr len = iotlb->addr_mask + 1;
> -    bool writable = iotlb->perm & IOMMU_WO;
> -
> -    /*
> -     * The IOMMU TLB entry we have just covers translation through
> -     * this IOMMU to its immediate target.  We need to translate
> -     * it the rest of the way through to memory.
> -     */
> -    mr = address_space_translate(&address_space_memory,
> -                                 iotlb->translated_addr,
> -                                 &xlat, &len, writable,
> -                                 MEMTXATTRS_UNSPECIFIED);
> -    if (!memory_region_is_ram(mr)) {
> -        error_report("iommu map to non memory area %"HWADDR_PRIx"",
> -                     xlat);
> -        return false;
> -    } else if (memory_region_has_ram_discard_manager(mr)) {
> -        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> -        MemoryRegionSection tmp = {
> -            .mr = mr,
> -            .offset_within_region = xlat,
> -            .size = int128_make64(len),
> -        };
> -
> -        /*
> -         * Malicious VMs can map memory into the IOMMU, which is expected
> -         * to remain discarded. vfio will pin all pages, populating memory.
> -         * Disallow that. vmstate priorities make sure any RamDiscardManager
> -         * were already restored before IOMMUs are restored.
> -         */
> -        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> -            error_report("iommu map to discarded memory (e.g., unplugged via"
> -                         " virtio-mem): %"HWADDR_PRIx"",
> -                         iotlb->translated_addr);
> -            return false;
> -        }
> +    bool ret, mr_has_discard_manager;
>  
> +    ret = memory_get_xlat_addr(iotlb, vaddr, ram_addr, read_only,
> +                               &mr_has_discard_manager);
> +    if (ret && mr_has_discard_manager) {
>          /*
>           * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
>           * pages will remain pinned inside vfio until unmapped, resulting in a
> @@ -635,29 +601,7 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
>                           " intended via an IOMMU. It's possible to mitigate "
>                           " by setting/adjusting RLIMIT_MEMLOCK.");
>      }
> -
> -    /*
> -     * Translation truncates length to the IOMMU page size,
> -     * check that it did not truncate too much.
> -     */
> -    if (len & iotlb->addr_mask) {
> -        error_report("iommu has granularity incompatible with target AS");
> -        return false;
> -    }
> -
> -    if (vaddr) {
> -        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> -    }
> -
> -    if (ram_addr) {
> -        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> -    }
> -
> -    if (read_only) {
> -        *read_only = !writable || mr->readonly;
> -    }
> -
> -    return true;
> +    return ret;
>  }
>  
>  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bfb1de8eea..d1e79c39dc 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
>  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
>                                               RamDiscardListener *rdl);
>  
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          bool *mr_has_discard_manager);
> +
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>  
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..bc0be3f62c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -33,6 +33,7 @@
>  #include "qemu/accel.h"
>  #include "hw/boards.h"
>  #include "migration/vmstate.h"
> +#include "exec/address-spaces.h"
>  
>  //#define DEBUG_UNASSIGNED
>  
> @@ -2121,6 +2122,77 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
>      rdmc->unregister_listener(rdm, rdl);
>  }
>  
> +/* Called with rcu_read_lock held.  */
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          bool *mr_has_discard_manager)
> +{
> +    MemoryRegion *mr;
> +    hwaddr xlat;
> +    hwaddr len = iotlb->addr_mask + 1;
> +    bool writable = iotlb->perm & IOMMU_WO;
> +
> +    if (mr_has_discard_manager) {
> +        *mr_has_discard_manager = false;
> +    }
> +    /*
> +     * The IOMMU TLB entry we have just covers translation through
> +     * this IOMMU to its immediate target.  We need to translate
> +     * it the rest of the way through to memory.
> +     */
> +    mr = address_space_translate(&address_space_memory, iotlb->translated_addr,
> +                                 &xlat, &len, writable, MEMTXATTRS_UNSPECIFIED);
> +    if (!memory_region_is_ram(mr)) {
> +        error_report("iommu map to non memory area %" HWADDR_PRIx "", xlat);
> +        return false;
> +    } else if (memory_region_has_ram_discard_manager(mr)) {
> +        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(mr);
> +        MemoryRegionSection tmp = {
> +            .mr = mr,
> +            .offset_within_region = xlat,
> +            .size = int128_make64(len),
> +        };
> +        if (mr_has_discard_manager) {
> +            *mr_has_discard_manager = true;
> +        }
> +        /*
> +         * Malicious VMs can map memory into the IOMMU, which is expected
> +         * to remain discarded. vfio will pin all pages, populating memory.
> +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> +         * were already restored before IOMMUs are restored.
> +         */
> +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> +            error_report("iommu map to discarded memory (e.g., unplugged via"
> +                         " virtio-mem): %" HWADDR_PRIx "",
> +                         iotlb->translated_addr);
> +            return false;
> +        }
> +    }
> +
> +    /*
> +     * Translation truncates length to the IOMMU page size,
> +     * check that it did not truncate too much.
> +     */
> +    if (len & iotlb->addr_mask) {
> +        error_report("iommu has granularity incompatible with target AS");
> +        return false;
> +    }
> +
> +    if (vaddr) {
> +        *vaddr = memory_region_get_ram_ptr(mr) + xlat;
> +    }
> +
> +    if (ram_addr) {
> +        *ram_addr = memory_region_get_ram_addr(mr) + xlat;
> +    }
> +
> +    if (read_only) {
> +        *read_only = !writable || mr->readonly;
> +    }
> +
> +    return true;
> +}
> +
>  void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
>  {
>      uint8_t mask = 1 << client;
> -- 
> 2.34.3


