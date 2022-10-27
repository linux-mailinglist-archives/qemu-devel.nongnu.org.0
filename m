Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431D60F1F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:12:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxzc-0004ic-0D; Thu, 27 Oct 2022 04:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxzY-0004R9-Eg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxzW-00038N-9J
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666858313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q42HD+egj9lbRfZABShNymw+inI8Nd2cLLcTAmcwrvE=;
 b=LxkTooTtoDLPKJKF6cVD5cE3ZebIneAC8Gc1SqUGOmyPd3QFWioPVdMN0SqFoxLzgsCeZu
 cZKjJKIUiODUzG/ME/nPzi25D627uWHteUkwHf4SEWmie2V4Faz04b+8+1XeBnsHk/D2gE
 dmRv66KBY+Cu7H5NF9BVIavNBs66mUw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-Kn2mMTuONcm2PMTKJC_O3w-1; Thu, 27 Oct 2022 04:11:52 -0400
X-MC-Unique: Kn2mMTuONcm2PMTKJC_O3w-1
Received: by mail-oo1-f69.google.com with SMTP id
 v10-20020a4a860a000000b00480b3e2b5afso389084ooh.12
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q42HD+egj9lbRfZABShNymw+inI8Nd2cLLcTAmcwrvE=;
 b=7N85sprXb3sX0coOBs25K2jOBc4d/dzT9WtyQ+oMjwA8vx55pZUgjvgX9WPV1qRpBo
 w/ty9jTHbyjfYKPhFT/LqF4VYwPlfXU/OomjvQOtGPaJ1cbcEfxBzaegYGNfRXDaGMz2
 XzfGA9VZ6tnfWsx8FiBainFI17vdrYU1D1h4pOmAEvnPeFWv5Dm3PBGdDr/NKuXsXsNs
 JCjLx67j8WVG2UzTwHcht4bl3kK5x1HRjd045Ya1wRXPla0q5qqEW8TDoM993rNF9Mh7
 6Kdib9a+zb4MozZ+40YP9QDfK4japaJrTZPWSPc5HNyAAzXG+zb/1SD5f9Oe+aWfj49A
 aj5w==
X-Gm-Message-State: ACrzQf0o5ikTVhFQg2eMk5WTfblNrPEvAlHc1CowkdLU/Bg5hQ1iXqyJ
 zo6dS6PgmPQTw73haUUrH9R+W6hQJJ2HKSk9qLGBNnFPmARBXDnO2QQZJM92Hz2g1OoYkarw9QY
 AxHZnLCED7iAONRM0LWE+SdwXCImMJL8=
X-Received: by 2002:a4a:c590:0:b0:480:5ecf:85f4 with SMTP id
 x16-20020a4ac590000000b004805ecf85f4mr20711816oop.93.1666858311476; 
 Thu, 27 Oct 2022 01:11:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6NJBTnmP4kCuNZywxdEcq9gEK7BZbEZRVopIQe8eJEez3VRQAgelzYhzQa4pDthzxvpWgA/GTFsVcRlK6iJjo=
X-Received: by 2002:a4a:c590:0:b0:480:5ecf:85f4 with SMTP id
 x16-20020a4ac590000000b004805ecf85f4mr20711800oop.93.1666858311190; Thu, 27
 Oct 2022 01:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221027074032.1101939-2-lulu@redhat.com>
In-Reply-To: <20221027074032.1101939-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Oct 2022 16:11:39 +0800
Message-ID: <CACGkMEtV4m2Na_XjCLBEW=JVU5fcWyTaPt41s4rrfPLpaaBgnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Oct 27, 2022 at 3:41 PM Cindy Lu <lulu@redhat.com> wrote:
>
> Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> change the name to memory_get_xlat_addr().So we can use this
> function in other devices,such as vDPA device.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/vfio/common.c      | 92 ++-----------------------------------------
>  include/exec/memory.h |  4 ++
>  softmmu/memory.c      | 84 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 88 deletions(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9b..2b5a9f3d8d 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -574,92 +574,6 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
>             section->offset_within_address_space & (1ULL << 63);
>  }
>
> -/* Called with rcu_read_lock held.  */
> -static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> -                               ram_addr_t *ram_addr, bool *read_only)
> -{
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
> -
> -        /*
> -         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> -         * pages will remain pinned inside vfio until unmapped, resulting in a
> -         * higher memory consumption than expected. If memory would get
> -         * populated again later, there would be an inconsistency between pages
> -         * pinned by vfio and pages seen by QEMU. This is the case until
> -         * unmapped from the IOMMU (e.g., during device reset).
> -         *
> -         * With malicious guests, we really only care about pinning more memory
> -         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> -         * exceeded and can be used to mitigate this problem.
> -         */
> -        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> -                         " RAM (e.g., virtio-mem) works, however, malicious"
> -                         " guests can trigger pinning of more memory than"
> -                         " intended via an IOMMU. It's possible to mitigate "
> -                         " by setting/adjusting RLIMIT_MEMLOCK.");
> -    }
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
> -}
> -
>  static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>  {
>      VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
> @@ -682,7 +596,8 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
>          bool read_only;
>
> -        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,
> +                                  &address_space_memory)) {
>              goto out;
>          }
>          /*
> @@ -1359,7 +1274,8 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>      }
>
>      rcu_read_lock();
> -    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
> +    if (memory_get_xlat_addr(iotlb, NULL, &translated_addr, NULL,
> +                             &address_space_memory)) {
>          int ret;
>
>          ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bfb1de8eea..282de1d5ad 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -713,6 +713,10 @@ void ram_discard_manager_register_listener(RamDiscardManager *rdm,
>  void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
>                                               RamDiscardListener *rdl);
>
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          AddressSpace *as);
> +
>  typedef struct CoalescedMemoryRange CoalescedMemoryRange;
>  typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7ba2048836..8586863ffa 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2121,6 +2121,90 @@ void ram_discard_manager_unregister_listener(RamDiscardManager *rdm,
>      rdmc->unregister_listener(rdm, rdl);
>  }
>
> +/* Called with rcu_read_lock held.  */
> +bool memory_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
> +                          ram_addr_t *ram_addr, bool *read_only,
> +                          AddressSpace *as)
> +{
> +    MemoryRegion *mr;
> +    hwaddr xlat;
> +    hwaddr len = iotlb->addr_mask + 1;
> +    bool writable = iotlb->perm & IOMMU_WO;
> +
> +    /*
> +     * The IOMMU TLB entry we have just covers translation through
> +     * this IOMMU to its immediate target.  We need to translate
> +     * it the rest of the way through to memory.
> +     */
> +    mr = address_space_translate(as, iotlb->translated_addr, &xlat, &len,
> +                                 writable, MEMTXATTRS_UNSPECIFIED);
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
> +
> +        /*
> +         * Malicious VMs can map memory into the IOMMU, which is expected
> +         * to remain discarded. device will pin all pages, populating memory.
> +         * Disallow that. vmstate priorities make sure any RamDiscardManager
> +         * were already restored before IOMMUs are restored.
> +         */
> +        if (!ram_discard_manager_is_populated(rdm, &tmp)) {
> +            error_report("iommu map to discarded memory (e.g., unplugged via"
> +                         " virtio-mem): %" HWADDR_PRIx "",
> +                         iotlb->translated_addr);
> +            return false;
> +        }
> +
> +        /*
> +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> +         * pages will remain pinned inside device until unmapped, resulting in a
> +         * higher memory consumption than expected. If memory would get
> +         * populated again later, there would be an inconsistency between pages
> +         * pinned by device and pages seen by QEMU. This is the case until
> +         * unmapped from the IOMMU (e.g., during device reset).
> +         *
> +         * With malicious guests, we really only care about pinning more memory
> +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> +         * exceeded and can be used to mitigate this problem.
> +         */
> +        warn_report_once("Using device with vIOMMUs and coordinated discarding"
> +                         " of RAM (e.g., virtio-mem) works, however, malicious"
> +                         " guests can trigger pinning of more memory than"
> +                         " intended via an IOMMU. It's possible to mitigate "
> +                         " by setting/adjusting RLIMIT_MEMLOCK.");
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
>


