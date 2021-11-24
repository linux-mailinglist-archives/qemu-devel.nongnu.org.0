Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EF45B629
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:04:24 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnGR-0003c3-Hh
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:04:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpn9r-0002me-Cd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mpn9l-0000by-GY
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637740647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JDSz+3c3HaTljov9qkxGYroaEC2AL7cR7lq40rperlg=;
 b=Q7bSAbWJkbO0Ft6lfcsuZ0OBhUPt+CPZofVS1dXA67qGGvCpN2XAKxPFvq/fKq0uilz0A4
 H4aXjNUaqU0dU1PQLtLSfr9dt0/uHwHD+62XFMTEHH6CimfFAZ7DNhxpZZ7QuyuDbFcrsG
 5yhOBSd04z7h4k7amx7NMpR1HSfoYDs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-405-QxjRxYXmMU-jmGrQgiPVmw-1; Wed, 24 Nov 2021 02:57:26 -0500
X-MC-Unique: QxjRxYXmMU-jmGrQgiPVmw-1
Received: by mail-pl1-f200.google.com with SMTP id
 4-20020a170902c20400b0014381f710d5so388532pll.11
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JDSz+3c3HaTljov9qkxGYroaEC2AL7cR7lq40rperlg=;
 b=PloNJP3YS/d0RkCmQ5SDSeQpYplNTr07m4awXsMHZr3k7KfAN67Pw235HC1h2G8lCl
 6jJ+qblIyI2jSmdFQXSqaqiD8ZhWLRK1Y8daAWVPnA7tY8djpDOecQ4PCvQanVG6fnV0
 w4SsysGBZm8cBEgQy0ENxdJICwEk+wK21HujK7FJQj74hzYu58YIJMMNBAu5ahYqgajv
 VgxD1EjOSYqy9I+3vrvBDuvAtEZmRfWcPQl6pkEnaloUN3cHgyXeGGR8h0yU3Ik/cxNr
 O8teLPSnzgFVkc1cyXanmhmDHjeCRwcbTvPsrNUf6kedtI+vxvKHKkM9pW//43THoDFN
 JFuw==
X-Gm-Message-State: AOAM532yY9xJCclJf4meFtzXs7EcC0iokNo6toJg/kkOUEJiagx8h/KN
 TEkEZZtIwIPkQ9Tp7sCkaDuDTJIJ4725LBNDtPJAYu0cYGrpionjKVSWU3nCse/gHBNjd6vXliA
 sP1jeWS6HJMha5J8=
X-Received: by 2002:a05:6a00:cd0:b0:49f:b198:97a5 with SMTP id
 b16-20020a056a000cd000b0049fb19897a5mr3924322pfv.80.1637740645254; 
 Tue, 23 Nov 2021 23:57:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNpWGiSLAIZZVewMYdXUOcvToHImY+WgTQKyMEYSvbYmvAAdPNuBF5RN4Z1+rBDCS7SXb7Sw==
X-Received: by 2002:a05:6a00:cd0:b0:49f:b198:97a5 with SMTP id
 b16-20020a056a000cd000b0049fb19897a5mr3924285pfv.80.1637740644802; 
 Tue, 23 Nov 2021 23:57:24 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id j13sm3544022pgm.35.2021.11.23.23.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:57:24 -0800 (PST)
Date: Wed, 24 Nov 2021 15:57:18 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YZ3wXo5XueDtuk8c@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124060309.6872-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 02:03:09PM +0800, Jason Wang wrote:
> When booting with scalable mode, I hit this error:
> 
> qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve non-zero iova=0xfffff002, level=0x1slpte=0x102681803)
> qemu-system-x86_64: vtd_iommu_translate: detected translation failure (dev=01:00:00, iova=0xfffff002)
> qemu-system-x86_64: New fault is not recorded due to compression of faults
> 
> This is because the SNP bit is set since Linux kernel commit
> 6c00612d0cba1 ("iommu/vt-d: Report right snoop capability when using
> FL for IOVA") where SNP bit is set if scalable mode is on though this
> seems to be an violation on the spec which said the SNP bit is
> considered to be reserved if SC is not supported.

When I was reading that commit, I was actually confused by this change:

---8<---
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 956a02eb40b4..0ee5f1bd8af2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -658,7 +658,14 @@ static int domain_update_iommu_snooping(struct intel_iommu *skip)
        rcu_read_lock();
        for_each_active_iommu(iommu, drhd) {
                if (iommu != skip) {
-                       if (!ecap_sc_support(iommu->ecap)) {
+                       /*
+                        * If the hardware is operating in the scalable mode,
+                        * the snooping control is always supported since we
+                        * always set PASID-table-entry.PGSNP bit if the domain
+                        * is managed outside (UNMANAGED).
+                        */
+                       if (!sm_supported(iommu) &&
+                           !ecap_sc_support(iommu->ecap)) {
                                ret = 0;
                                break;
                        }
---8<---

Does it mean that for some hardwares that has sm_supported()==true, it'll have
SC bit cleared in ecap register?  That sounds odd, and not sure why.  Maybe Yi
Liu or Yi Sun may know?

> 
> To unbreak the guest, ignore the SNP bit for scalable mode first. In
> the future we may consider to add SC support.

Oh yes, I remembered the last time we discussed this.  Could you remind me
what's missing for us to support SC?

IIUC, for common device emulations we can just declare SC==1, right?  As all
the DMAs (including kernel accels like vhost) will be from host processors so
there're no coherent issues with guest vcpu threads.

If that's correct, the only challenge is device assignment in any form (I am
not familiar with vdpa; so perhaps that includes vfio, vpda and any other kind
of assigning host devices to guest?), then we'll try to detect IOMMU_CACHE
capability from the host iommu groups that covers the assigned devices, and we
only set SC==1 if we have cache coherency on all the devices?

> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c          | 18 ++++++++++++------
>  hw/i386/intel_iommu_internal.h |  2 ++
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 294499ee20..3bcac56c3e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -969,7 +969,8 @@ static dma_addr_t vtd_get_iova_pgtbl_base(IntelIOMMUState *s,
>  static uint64_t vtd_spte_rsvd[5];
>  static uint64_t vtd_spte_rsvd_large[5];
>  
> -static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
> +static bool vtd_slpte_nonzero_rsvd(IntelIOMMUState *s,
> +                                   uint64_t slpte, uint32_t level)
>  {
>      uint64_t rsvd_mask = vtd_spte_rsvd[level];
>  
> @@ -979,6 +980,10 @@ static bool vtd_slpte_nonzero_rsvd(uint64_t slpte, uint32_t level)
>          rsvd_mask = vtd_spte_rsvd_large[level];
>      }
>  
> +    if (s->scalable_mode) {
> +        rsvd_mask &= ~VTD_SPTE_SNP;
> +    }

IMHO what we want to do is only to skip the leaves of pgtables on SNP, so maybe
we still want to keep checking the bit 11 reserved for e.g. common pgtable dir
entries?

To do so, how about directly modifying the vtd_spte_rsvd* fields in vtd_init()?
I think we only need to modify 4k/2m/1g entries to mask bit 11, they're:

  - vtd_spte_rsvd[1] (4K)
  - vtd_spte_rsvd_large[2] (2M)
  - vtd_spte_rsvd_large[3] (1G)

What do you think?  Then we avoid passing IntelIOMMUState* all over too.

> +
>      return slpte & rsvd_mask;
>  }
>  
> @@ -1054,7 +1059,7 @@ static int vtd_iova_to_slpte(IntelIOMMUState *s, VTDContextEntry *ce,
>                                iova, level, slpte, is_write);
>              return is_write ? -VTD_FR_WRITE : -VTD_FR_READ;
>          }
> -        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
> +        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
>              error_report_once("%s: detected splte reserve non-zero "
>                                "iova=0x%" PRIx64 ", level=0x%" PRIx32
>                                "slpte=0x%" PRIx64 ")", __func__, iova,
> @@ -1185,7 +1190,8 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
>   * @write: whether parent level has write permission
>   * @info: constant information for the page walk
>   */
> -static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
> +static int vtd_page_walk_level(IntelIOMMUState *s,
> +                               dma_addr_t addr, uint64_t start,
>                                 uint64_t end, uint32_t level, bool read,
>                                 bool write, vtd_page_walk_info *info)
>  {
> @@ -1214,7 +1220,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
>              goto next;
>          }
>  
> -        if (vtd_slpte_nonzero_rsvd(slpte, level)) {
> +        if (vtd_slpte_nonzero_rsvd(s, slpte, level)) {
>              trace_vtd_page_walk_skip_reserve(iova, iova_next);
>              goto next;
>          }
> @@ -1235,7 +1241,7 @@ static int vtd_page_walk_level(dma_addr_t addr, uint64_t start,
>               * This is a valid PDE (or even bigger than PDE).  We need
>               * to walk one further level.
>               */
> -            ret = vtd_page_walk_level(vtd_get_slpte_addr(slpte, info->aw),
> +            ret = vtd_page_walk_level(s, vtd_get_slpte_addr(slpte, info->aw),
>                                        iova, MIN(iova_next, end), level - 1,
>                                        read_cur, write_cur, info);
>          } else {
> @@ -1294,7 +1300,7 @@ static int vtd_page_walk(IntelIOMMUState *s, VTDContextEntry *ce,
>          end = vtd_iova_limit(s, ce, info->aw);
>      }
>  
> -    return vtd_page_walk_level(addr, start, end, level, true, true, info);
> +    return vtd_page_walk_level(s, addr, start, end, level, true, true, info);
>  }
>  
>  static int vtd_root_entry_rsvd_bits_check(IntelIOMMUState *s,
> diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> index 3d5487fe2c..a6c788049b 100644
> --- a/hw/i386/intel_iommu_internal.h
> +++ b/hw/i386/intel_iommu_internal.h
> @@ -388,6 +388,8 @@ typedef union VTDInvDesc VTDInvDesc;
>  #define VTD_INV_DESC_DEVICE_IOTLB_RSVD_LO 0xffff0000ffe0fff8
>  
>  /* Rsvd field masks for spte */
> +#define VTD_SPTE_SNP 0x800ULL
> +
>  #define VTD_SPTE_PAGE_L1_RSVD_MASK(aw, dt_supported) \
>          dt_supported ? \
>          (0x800ULL | ~(VTD_HAW_MASK(aw) | VTD_SL_IGN_COM | VTD_SL_TM)) : \
> -- 
> 2.25.1
> 

-- 
Peter Xu


