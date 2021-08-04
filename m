Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6413E0753
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:14:10 +0200 (CEST)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLP7-0004ms-Kv
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBK1V-0000CC-Q5
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:45:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBK1O-0007Vm-Bp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 12:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628095527;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyWXuO04ZEfjFluj7tiRsdXaqPipWmcwBUfHogVSjW8=;
 b=XhnJqAt9dYJRcLRwgFcQRP/eoDEwUPebaAvfF/kPEYct0tf5YpVJQGJwc54MsppsRUD+ff
 G9LHyDQ+LygvGEllqBrJ1DMPxynkvUceP/2enhcIS1kb/F7rnCaZgS2b1/reON/VfLunE5
 cWJqhIjRkdqg7f7kGFill6LHzR6+r0A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-4xR4AJMOMeyI05O7N7FKGQ-1; Wed, 04 Aug 2021 12:45:26 -0400
X-MC-Unique: 4xR4AJMOMeyI05O7N7FKGQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c5-20020adfed850000b02901537ecbecc6so1011542wro.19
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 09:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GyWXuO04ZEfjFluj7tiRsdXaqPipWmcwBUfHogVSjW8=;
 b=HVMLb4NIG65ry9aRRG6NKbXwwhyIaAfWjGZV8Sm55/XlU/lYIFuaBuP8GkQvwWI58c
 y4ZRYLEQicfc4CeismSRjJV1s7EV5Ky1Hgill0k2OdsfYMLfpz7VpdDpD+KAD4RmeCZP
 BcFbArbg9Nli7iJAZSacZSf44I3MGoUFx3zGE5MT4kCON4sbPZc6MSYw/vZUEqIXm3hc
 Mv+OipHKL7HCH2EhanQejxcNpwspTPWLfdJIrJtttgQ3IegRS3GfQAUjOVpA7xswGHWW
 +Cs7kxo5Abbd6z6qX/5XHnVoKFsGsriusNCxr784pjaqOXi0Jz1g+BKyKUkSjbRk+XSm
 9xeQ==
X-Gm-Message-State: AOAM532WDwZ9juRB7yvQuKYqR/uqY/mgcZUTEk5FYtF8Yt031bI/ts7q
 7JdFCqTHLhLcQA+wG01a4XPnaXpDA6KOa6KLpyEO47E1ypyHlzVjo/JjEsq6m2cN3joMCPzcRPX
 3bl4t81VNEnIGD9E=
X-Received: by 2002:a1c:7509:: with SMTP id o9mr537976wmc.32.1628095524623;
 Wed, 04 Aug 2021 09:45:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKYnzPak8ZxiswIxfMTFSFApRGv7ufqCUD+/Tv47mp6z2tvz6LYZGOwLuAyBYINfCvS1jZcg==
X-Received: by 2002:a1c:7509:: with SMTP id o9mr537961wmc.32.1628095524422;
 Wed, 04 Aug 2021 09:45:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t8sm3408137wmj.5.2021.08.04.09.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 09:45:23 -0700 (PDT)
Subject: Re: [PATCH 1/1] hw/arm/smmu: Add access flag handling
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1627687022-366528-1-git-send-email-joe.komlodi@xilinx.com>
 <1627687022-366528-2-git-send-email-joe.komlodi@xilinx.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0931b4da-a8e2-ba61-e759-9855ff64b137@redhat.com>
Date: Wed, 4 Aug 2021 18:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1627687022-366528-2-git-send-email-joe.komlodi@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joe,

On 7/31/21 1:17 AM, Joe Komlodi wrote:
> The SMMU should access fault if AF == 0 in a TTD, and if AFFD == 0 in the CD.
>
> Per the spec, an access fault has a higher priority over a permission fault.
> For instance, a write to a writable clean (temporarily non-writable) page with
> AF == 0 && AFFD == 0 will cause an access fault.
> If AF == 1 in this situation, then a permission fault would occur.
>
> Access flag handling is more complicated if HTTU is supported and HA != 0 in
> the CD, however we currently do not support HTTU.
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
> ---
>  hw/arm/smmu-common.c         | 7 +++++++
>  hw/arm/smmu-internal.h       | 8 ++++++++
>  hw/arm/smmuv3-internal.h     | 1 +
>  hw/arm/smmuv3.c              | 1 +
>  include/hw/arm/smmu-common.h | 1 +
>  5 files changed, 18 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0459850..0fcc65c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -305,6 +305,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
> +        bool af;
>  
>          if (get_pte(baseaddr, offset, &pte, info)) {
>                  goto error;
> @@ -341,6 +342,12 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>                                       pte_addr, pte, iova, gpa,
>                                       block_size >> 20);
>          }
> +        af = PTE_AF(pte);
> +        if (is_access_fault(af, perm)) {
I don't get the perm argument here.
 
Below there is this macro definition

+#define is_access_fault(af, cfg) \
+    (!cfg->affd && !af)

Thanks

Eric

> +            info->type = SMMU_PTW_ERR_ACCESS;
> +            goto error;
> +        }
> +
>          ap = PTE_AP(pte);
>          if (is_permission_fault(ap, perm)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31..9d3b22c 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -58,6 +58,11 @@
>      ((level == 3) &&                                                    \
>       ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>  
> +/* access flag */
> +
> +#define PTE_AF(pte) \
> +    (extract64(pte, 10, 1))
> +
>  /* access permissions */
>  
>  #define PTE_AP(pte) \
> @@ -66,6 +71,9 @@
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define is_access_fault(af, cfg) \
> +    (!cfg->affd && !af)
> +
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae..0ccad1d 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -587,6 +587,7 @@ static inline int pa_range(STE *ste)
>  #define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
>  #define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
>  #define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
> +#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
>  #define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
>  #define CD_HD(x)         extract32((x)->word[1], 10 , 1)
>  #define CD_HA(x)         extract32((x)->word[1], 11 , 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60be..df5a194 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -483,6 +483,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
> +    cfg->affd = CD_AFFD(cd);
>  
>      trace_smmuv3_decode_cd(cfg->oas);
>  
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 706be3c..b0e82ad 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    bool affd;                 /* Access Flag Fault Disabled */
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */


