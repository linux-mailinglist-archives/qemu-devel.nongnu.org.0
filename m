Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFF63C47B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 17:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p030o-0006bI-LH; Tue, 29 Nov 2022 10:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p030h-0006av-C6
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:59:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p030f-00063e-Eb
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669737540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F5c9SF3Ja52Gja2HyZQL9DttznXg9GgOfTd73vVYYF8=;
 b=XNP6+SZ4UkgEMiVQ6aXUBVBl7a7ZNvWRDOKY5iViZit0Rlv/1g/fYYUlyV4rtCxMLtwSq7
 qWdfF9NkKTOQdQSs+7WVxLPwa5T25g/uvE8dHz8WOluQyDZMK7bZ698RXFBqH1j/L8w9OS
 YRSPi+Z9EluasU9Mc0dYKK6FbCoTeNc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-vJDjrD-BMg2ZS4u1Tn3_Fw-1; Tue, 29 Nov 2022 10:57:27 -0500
X-MC-Unique: vJDjrD-BMg2ZS4u1Tn3_Fw-1
Received: by mail-qt1-f197.google.com with SMTP id
 n12-20020ac85a0c000000b003a5849497f9so22193869qta.20
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F5c9SF3Ja52Gja2HyZQL9DttznXg9GgOfTd73vVYYF8=;
 b=H+QhVMv+ajwzSsi70icIOAesDcPYVhB1xxSLm6EvfkLZL4BL+uSOysYnHkNfsXN1cf
 E3gEUizuEhLFbsawvi6KP+i2VI1iJWsM/YJzT+z9FB2NlEhcqIBdgbXdC77ADODmKfuT
 aRgCDOHWRt+4zJ2Fs2ppBrmn/csWv/5pUnJQvqEKou4N5RDSeqYIYK/FOneK4P52JWeP
 NoZPYIeLO8svKTEuKDhATfFF8bCv20wdzBbXSpYQ4VoUjtbHKgH9X7Pb5+ahF5gVN/DV
 aG9tFItZtu9t4bzfyqUyi6O+8vOHA6N5z10VEjzDJ4bku162VmVG+6rL/uhvjv5FQl++
 HQmQ==
X-Gm-Message-State: ANoB5pn4gUXKk4McpcqALRR/o1DNJsvB6P6NCyPL8HeBrkMZERX1LSBP
 5YcA5U7+d7PLkxNqhI5CscuI5Yzof5sYx6V5J2M5apR2vwvMB2AaaHZ8S96Wqkk/3ylITUUPNzh
 uGCOp6VR1mxfOxR4=
X-Received: by 2002:a05:6214:3002:b0:4c7:14b:18a3 with SMTP id
 ke2-20020a056214300200b004c7014b18a3mr9946372qvb.41.1669737446662; 
 Tue, 29 Nov 2022 07:57:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf620jp6juxBxMlgOfLehaTmcGtoP60GlS4F17xep5TJAgRFLn4wl++/R9RHQOUcFRL+NZSq1g==
X-Received: by 2002:a05:6214:3002:b0:4c7:14b:18a3 with SMTP id
 ke2-20020a056214300200b004c7014b18a3mr9946350qvb.41.1669737446364; 
 Tue, 29 Nov 2022 07:57:26 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05620a0d8100b006fc2f74ad12sm10903356qkl.92.2022.11.29.07.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:57:26 -0800 (PST)
Date: Tue, 29 Nov 2022 10:57:25 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Message-ID: <Y4Yr5WvfioOJWOEX@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-4-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 04:10:37PM +0800, Jason Wang wrote:
> The IOVA tree is only built during page walk this breaks the device
> that tries to use UNMAP notifier only. One example is vhost-net, it
> tries to use UNMAP notifier when vIOMMU doesn't support DEVIOTLB_UNMAP
> notifier (e.g when dt mode is not enabled). The interesting part is
> that it doesn't use MAP since it can query the IOMMU translation by
> itself upon a IOTLB miss.
> 
> This doesn't work since Qemu doesn't build IOVA tree in IOMMU
> translation which means the UNMAP notifier won't be triggered during
> the page walk since Qemu think it is never mapped. This could be
> noticed when vIOMMU is used with vhost_net but dt is disabled.
> 
> Fixing this by build the iova tree during IOMMU translation, this
> makes sure the UNMAP notifier event could be identified during page
> walk. And we need to walk page table not only for UNMAP notifier but
> for MAP notifier during PSI.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 43 ++++++++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index d025ef2873..edeb62f4b2 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -1834,6 +1834,8 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
>      uint8_t access_flags;
>      bool rid2pasid = (pasid == PCI_NO_PASID) && s->root_scalable;
>      VTDIOTLBEntry *iotlb_entry;
> +    const DMAMap *mapped;
> +    DMAMap target;
>  
>      /*
>       * We have standalone memory region for interrupt addresses, we
> @@ -1954,6 +1956,21 @@ out:
>      entry->translated_addr = vtd_get_slpte_addr(slpte, s->aw_bits) & page_mask;
>      entry->addr_mask = ~page_mask;
>      entry->perm = access_flags;
> +
> +    target.iova = entry->iova;
> +    target.size = entry->addr_mask;
> +    target.translated_addr = entry->translated_addr;
> +    target.perm = entry->perm;
> +
> +    mapped = iova_tree_find(vtd_as->iova_tree, &target);
> +    if (!mapped) {
> +        /* To make UNMAP notifier work, we need build iova tree here
> +         * in order to have the UNMAP iommu notifier to be triggered
> +         * during the page walk.
> +         */
> +        iova_tree_insert(vtd_as->iova_tree, &target);
> +    }
> +
>      return true;
>  
>  error:
> @@ -2161,31 +2178,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
>          ret = vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
>                                         vtd_as->devfn, &ce);
>          if (!ret && domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
> -            if (vtd_as_has_map_notifier(vtd_as)) {
> -                /*
> -                 * As long as we have MAP notifications registered in
> -                 * any of our IOMMU notifiers, we need to sync the
> -                 * shadow page table.
> -                 */
> -                vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
> -            } else {
> -                /*
> -                 * For UNMAP-only notifiers, we don't need to walk the
> -                 * page tables.  We just deliver the PSI down to
> -                 * invalidate caches.
> -                 */
> -                IOMMUTLBEvent event = {
> -                    .type = IOMMU_NOTIFIER_UNMAP,
> -                    .entry = {
> -                        .target_as = &address_space_memory,
> -                        .iova = addr,
> -                        .translated_addr = 0,
> -                        .addr_mask = size - 1,
> -                        .perm = IOMMU_NONE,
> -                    },
> -                };
> -                memory_region_notify_iommu(&vtd_as->iommu, 0, event);

Isn't this path the one that will be responsible for pass-through the UNMAP
events from guest to vhost when there's no MAP notifier requested?

At least that's what I expected when introducing the iova tree, because for
unmap-only device hierachy I thought we didn't need the tree at all.

Jason, do you know where I miss?

Thanks,

> -            }
> +            vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
>          }
>      }
>  }
> -- 
> 2.25.1
> 

-- 
Peter Xu


