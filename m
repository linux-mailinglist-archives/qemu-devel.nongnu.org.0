Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0C6DDD6B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:15:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmElf-0008O1-VF; Tue, 11 Apr 2023 10:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmEle-0008Nq-AB
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pmElc-0007ZG-IC
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681222479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n/0ztKas2XA+85jzBmk4AhmTkv/FOBgjRyUxT9J2a1w=;
 b=FqxWGFSsS1sldDesboWU+vtqfGVedWjWQm6c6/pj9XJIuGCzpCjcpCODAXnsxFSPoBk8rf
 isFGHRYKuCVW96kXHN/YoBTYo4An4bSEeGVv6Oge0/HRK/V6YevMSBp/o9ztL7tfz64mYN
 B7spDBAIC9gembS0DmQKSPSE2JttW20=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-GaZ9DmjFPSyvqhPvlFCUmA-1; Tue, 11 Apr 2023 10:14:37 -0400
X-MC-Unique: GaZ9DmjFPSyvqhPvlFCUmA-1
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-42c8d37c298so1771137.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681222476; x=1683814476;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/0ztKas2XA+85jzBmk4AhmTkv/FOBgjRyUxT9J2a1w=;
 b=6XO5/VDJnH8pA0HWeCLSgiEgsjpUJzVq2g4Qa27Q/bMeZDvF+h0vn9EHDK7GPfWuH9
 XjduqM983s6vjXHs1a/kthQvc10d+xmObfFcYI17zS5oduRUivaL6wL8vtwAHz+0YNyP
 qFBh2KNfWgNx6nGNFPvHMNQceHrQyqrMSMT1dg99m3G3uBb439HVrH83J4QMRnC4PGPg
 zky17Hn5ybuhLwUXsM2rZP5k6i3IBREGDo/Rzmmxw0G93Fy3436neV1KavpfK34MbCOc
 eCvGrVovzozEeC2v1VB3vbvLrRgg/Pn2b61OlkE2DDKU55/Rz8fVtjJTfahAkaJLifhU
 ozeA==
X-Gm-Message-State: AAQBX9ed00GmHTS5o2GmbTn1IpjD5s1Pk71o7QOScNZsoA5bzMIl4njn
 6zcuhUbery5kgzU8cDtdvMJ6HvWDEVRS6zbVaf+Bw6bsIIkQ0D9rbLDx553XLcAMHmEZl/R4ZFN
 4q1JUln7PX4daplk=
X-Received: by 2002:a67:43c5:0:b0:42c:6f24:da62 with SMTP id
 q188-20020a6743c5000000b0042c6f24da62mr1714302vsa.1.1681222475633; 
 Tue, 11 Apr 2023 07:14:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zlyc56Ab1qT6lUxXrHklTcatD1CN2IuRUmbairpMbaqQngzPFifkNzQr2Olan3hTMbgTsLAw==
X-Received: by 2002:a67:43c5:0:b0:42c:6f24:da62 with SMTP id
 q188-20020a6743c5000000b0042c6f24da62mr1714283vsa.1.1681222475379; 
 Tue, 11 Apr 2023 07:14:35 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 q22-20020a374316000000b007422fd3009esm3998734qka.20.2023.04.11.07.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:14:34 -0700 (PDT)
Date: Tue, 11 Apr 2023 10:14:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
Message-ID: <ZDVrSVW0FoEuq6+2@x1n>
References: <20230410033208.54663-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230410033208.54663-1-jasowang@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Mon, Apr 10, 2023 at 11:32:08AM +0800, Jason Wang wrote:
> Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
> account when calculating iotlb hash like:
> 
> static guint vtd_iotlb_hash(gconstpointer v)
> {
>     const struct vtd_iotlb_key *key = v;
> 
>     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>            (key->level) << VTD_IOTLB_LVL_SHIFT |
>            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> }
> 
> This turns out to be problematic since:
> 
> - the shift will lose bits if not converting to uint64_t
> - level should be off by one in order to fit into 2 bits
> - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
>   some bits
> 
> So this patch fixes them by
> 
> - converting the keys into uint64_t before doing the shift
> - off level by one to make it fit into two bits
> - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
>   take the full width of uint64_t if possible
> 
> Fixes: Coverity CID 1508100
> Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c          | 8 ++++----
>  hw/i386/intel_iommu_internal.h | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a62896759c..d394976e9b 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -64,8 +64,8 @@ struct vtd_as_key {
>  struct vtd_iotlb_key {
>      uint64_t gfn;
>      uint32_t pasid;
> -    uint32_t level;
>      uint16_t sid;
> +    uint8_t level;
>  };
>  
>  static void vtd_address_space_refresh_all(IntelIOMMUState *s);
> @@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
>  {
>      const struct vtd_iotlb_key *key = v;
>  
> -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> +    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT) |
> +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
>  }
>  
>  static gboolean vtd_as_equal(gconstpointer v1, gconstpointer v2)
> diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> index f090e61e11..2e61eec2f5 100644
> --- a/hw/i386/intel_iommu_internal.h
> +++ b/hw/i386/intel_iommu_internal.h
> @@ -114,9 +114,9 @@
>                                       VTD_INTERRUPT_ADDR_FIRST + 1)
>  
>  /* The shift of source_id in the key of IOTLB hash table */
> -#define VTD_IOTLB_SID_SHIFT         20
> -#define VTD_IOTLB_LVL_SHIFT         28
> -#define VTD_IOTLB_PASID_SHIFT       30
> +#define VTD_IOTLB_SID_SHIFT         26
> +#define VTD_IOTLB_LVL_SHIFT         42
> +#define VTD_IOTLB_PASID_SHIFT       44

This is for the hash function only, IIUC it means anything over
sizeof(guint) will be ignored and not contributing anything to the hash
value being generated due to the uint64->guint conversion.

IOW, I think "level" and "pasid" will just be ignored.

If the whole point of hash function here is to try provide the best
distribution of hash value generated for keys... perhaps we can cut some of
the fields, but still we should fit all things into 32bits?

My wild guess is coverity complains mostly because of the shift overflow,
so that'll be addressed too if we explicit cut things off with uint64_t.

Thanks,

>  #define VTD_IOTLB_MAX_SIZE          1024    /* Max size of the hash table */
>  
>  /* IOTLB_REG */
> -- 
> 2.25.1
> 

-- 
Peter Xu


