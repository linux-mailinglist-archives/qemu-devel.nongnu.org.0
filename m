Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5038B61042F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:15:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAAK-0002lv-VY; Thu, 27 Oct 2022 17:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooAAG-0002jA-61
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ooAAB-0002t3-2I
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666905101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPOGUY5U/djnFhrns60rlUO6pT8ah0PvF8RLfDwTHN0=;
 b=WkTJg/XcSIg1CqtPkZ+IU8zJdCTvwaiQKcD7x2/73AJ+tL7RrQvTMVAanVdPTuCl4+w2oK
 n04HydpGUb66wvU3+VaDH/xnjJPvS0TBsdx9FtBbIOZlx8RKavF9HieslCa4X2WXiaknzI
 1/DmsNOJefTbXYxmeumpBTzy1f2+hkI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-gZwSFlRKPIqhoLBKtgMg5Q-1; Thu, 27 Oct 2022 17:11:38 -0400
X-MC-Unique: gZwSFlRKPIqhoLBKtgMg5Q-1
Received: by mail-io1-f71.google.com with SMTP id
 j17-20020a5d93d1000000b006bcdc6b49cbso2191718ioo.22
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPOGUY5U/djnFhrns60rlUO6pT8ah0PvF8RLfDwTHN0=;
 b=0nNC+dJe5pk4flt8quvjnA65D9WaZ7vP2eNjKtyEf4DOukZvxN0kHFldroKzk26M1X
 lFWaxuYGOpWCPiJnG+LtW2NNmt1hwPO+dk1b2iH6se4Botbk2YHg4Os3oqVJJyff7GFR
 VRQvf/2udMYL5NzlcUlz68WXbfLRrAJtaQgfl6Wb6k9QIQ46odJ9WoenHDR9a8/xKTqH
 b1CY+0EN0HtJCQg9Hjlow0PRMFAAtp1t96He5AXvUz6h9uRJEgoux6hv7Gy9dKzq9XkT
 xUc53P9lNnHzNgwm6prgu3guCFUPQMblBQkrqETNgCTi03frWYzdwWcyXgcq0YNyvrCh
 ZRpA==
X-Gm-Message-State: ACrzQf0BhIAlst0SEzGVy/Ii+7OvD9bV3lbVHGxsU9V0NzPOUQKqde4K
 riXRX6NO0kHbb2w6k2j9SnoilsFef+K5ssCYm/jY8wrQYyHCOuBEvmbYKnJRRBqE5whxKwLJduU
 1BUO+tlCrYu3GMSY=
X-Received: by 2002:a05:6e02:1905:b0:2ff:a163:8497 with SMTP id
 w5-20020a056e02190500b002ffa1638497mr18175453ilu.147.1666905097193; 
 Thu, 27 Oct 2022 14:11:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ZxGellneDik9JvLA97/J/KBNXPQ+GgtP52XESMGzi+xt854bIVfxxqzbrHcI3HzPOWEiXYQ==
X-Received: by 2002:a05:6e02:1905:b0:2ff:a163:8497 with SMTP id
 w5-20020a056e02190500b002ffa1638497mr18175423ilu.147.1666905096865; 
 Thu, 27 Oct 2022 14:11:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 a5-20020a027345000000b00363aefdf040sm981530jae.83.2022.10.27.14.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 14:11:36 -0700 (PDT)
Date: Thu, 27 Oct 2022 15:11:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221027151134.354bd3bb.alex.williamson@redhat.com>
In-Reply-To: <20221027074032.1101939-2-lulu@redhat.com>
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221027074032.1101939-2-lulu@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Thu, 27 Oct 2022 15:40:31 +0800
Cindy Lu <lulu@redhat.com> wrote:

> Move the function vfio_get_xlat_addr to softmmu/memory.c, and
> change the name to memory_get_xlat_addr().So we can use this
> function in other devices,such as vDPA device.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
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

Is this really fit to be in shared code?  Simply replacing "vfio" with
"device" for comments and warnings that are really of concern for a
specific use case doesn't look much better to me.

I think translating an unpopulated address, as in the previous test
above, is generally invalid, but the comment is certainly trying to
frame the severity of this error relative to a specific use case.

Here we're generating an unconditional warning, assuming that this code
path has been triggered by device code, for the condition of simply
asking for a translation to a MemoryRegion under discard manager
control?  Again, isn't that an action that has implications for a
specific use case of a device that supports pinning host memory?

Should the shared code be generating this warning, or could an optional
pointer arg be updated to indicate a translation to discard manager
controlled memory and this comment and warning should remain in the
caller?  Thanks,

Alex

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


