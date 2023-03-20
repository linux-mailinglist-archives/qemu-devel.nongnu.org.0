Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA146C1AE5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peI13-00083L-8m; Mon, 20 Mar 2023 12:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peI0z-00080n-4r
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peI0x-00026I-8j
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679328338;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUMv9A7RNpRYk7oPygg+/jkNCczRL3lw9XXXmM/bsQg=;
 b=V4mYQl3qHVc/ygDDRYGuUmO1BV6PXaigS5Uw49RZmTBZq45IgX1Dj91QgaehutJWgnF3Eu
 ZqkpExzOwxlem3KgGYqSJQ6nziVzsvcddjbJDs52eUyVIp5/4SHkzZe6sEbaTI6S7aBhkG
 wOxCoEYwlEBy0vLmy1n9Y6LBhbGubYg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-TclZiSdAOQ6H2nxLLxIYmw-1; Mon, 20 Mar 2023 12:05:36 -0400
X-MC-Unique: TclZiSdAOQ6H2nxLLxIYmw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o5-20020adf8b85000000b002d58b4b7698so454904wra.19
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sUMv9A7RNpRYk7oPygg+/jkNCczRL3lw9XXXmM/bsQg=;
 b=ZEWU0nKHAoCwV1Y5DnJZNx/xje9cuVWF+SHbj+x1C0N9unvDFIx4XaioX/gTe/Jp+2
 URR19u5DXychou33pqBLkE2RBKtiS/tVl1c6Lot5tds0yHjPV0R9kRWnp5vCNE7Gc9Qz
 7YEfEXMstPgESmUnpM5d48A7eN6FjrUdxjeELUBMAmXeCkn3GVnbV5Kzr6FFVPM/0zFD
 Bk5iHDCfyViqlv8qyolJRVOhe7IEI6rcpTjIrFR+xPIHiGCtV+i1/ZWRGKyHFDNqzY5H
 mZl9riKDbALQdGQDI1YVTprOJuFCt5ypkq+bX70G2bU1K8JCHIT4ONrH8H8e8kZnthF8
 EMQw==
X-Gm-Message-State: AO0yUKU2kQAJWSZ1XN4N3yA+6g+Xq6ihxP31V3pfD8Xr1m+cG0MQA3UF
 +zzOnhMCQOxRokqoVzct/KFuAyXmKwWXFJUx07Eo9RujEvL2NBA19Xb7m6+8w+pigIR5XkFlBIg
 UCaI8Tl908kD4p9TrePTD4TY=
X-Received: by 2002:a5d:5955:0:b0:2cf:e29f:d7f5 with SMTP id
 e21-20020a5d5955000000b002cfe29fd7f5mr13106318wri.25.1679328334013; 
 Mon, 20 Mar 2023 09:05:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/J+/tiPLcffmWmeuDv+D6PqZtA4jtgriH3kDBDUZ4LHI4hFRmS6mtl1JHze6Pw4Dp0RGStmA==
X-Received: by 2002:a5d:5955:0:b0:2cf:e29f:d7f5 with SMTP id
 e21-20020a5d5955000000b002cfe29fd7f5mr13106292wri.25.1679328333658; 
 Mon, 20 Mar 2023 09:05:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b002d2033ec465sm9249725wrq.36.2023.03.20.09.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:05:33 -0700 (PDT)
Message-ID: <45961bdc-cd3a-c35a-8f10-bb9a52dd2e33@redhat.com>
Date: Mon, 20 Mar 2023 17:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 06/11] hw/arm/smmuv3: Make TLB lookup work for
 stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-7-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-7-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> Right now, either stage-1 or stage-2 are supported, this simplifies
> how we can deal with TLBs.
> This patch makes TLB lookup work if stage-2 is enabled instead of
> stage-1.
> TLB lookup is done before a PTW, if a valid entry is found we won't
> do the PTW.
> To be able to do TLB lookup, we need the correct tagging info, as
> granularity and input size, so we get this based on the supported
> translation stage. The TLB entries are added correctly from each
> stage PTW.
>
> When nested translation is supported, this would need to change, for
> example if we go with a combined TLB implementation, we would need to
> use the min of the granularities in TLB.
>
> As stage-2 shouldn't be tagged by ASID, it will be set to -1 if S1P
> is not enabled.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - check if S1 is enabled(not supported) when reading S1 TT.
> ---
>  hw/arm/smmuv3.c | 45 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index dc74a5442d..ce193e9598 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -697,6 +697,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>      STE ste;
>      CD cd;
>  
> +    /* ASID defaults to -1 (if s1 is not supported). */
> +    cfg->asid = -1;
> +
>      ret = smmu_find_ste(s, sid, &ste, event);
>      if (ret) {
>          return ret;
> @@ -787,6 +790,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUTLBEntry *cached_entry = NULL;
>      SMMUTransTableInfo *tt;
>      SMMUTransCfg *cfg = NULL;
> +    uint8_t granule_sz, tsz;
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
> @@ -822,21 +826,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    tt = select_tt(cfg, addr);
> -    if (!tt) {
> -        if (cfg->record_faults) {
> -            event.type = SMMU_EVT_F_TRANSLATION;
> -            event.u.f_translation.addr = addr;
> -            event.u.f_translation.rnw = flag & 0x1;
> +    if (cfg->stage == 1) {
> +        /* Select stage1 translation table. */
> +        tt = select_tt(cfg, addr);
> +        if (!tt) {
> +            if (cfg->record_faults) {
> +                event.type = SMMU_EVT_F_TRANSLATION;
> +                event.u.f_translation.addr = addr;
> +                event.u.f_translation.rnw = flag & 0x1;
> +            }
> +            status = SMMU_TRANS_ERROR;
> +            goto epilogue;
>          }
> -        status = SMMU_TRANS_ERROR;
> -        goto epilogue;
> -    }
> +        granule_sz = tt->granule_sz;
> +        tsz = tt->tsz;
>  
> -    page_mask = (1ULL << (tt->granule_sz)) - 1;
> +    } else {
> +        /* Stage2. */
> +        granule_sz = cfg->s2cfg.granule_sz;
> +        tsz = cfg->s2cfg.tsz;
> +    }
> +    /*
> +     * TLB lookup looks for granule and input size for a translation stage,
> +     * as only one stage is supported right now, choose the right values
> +     * from the configuration.
> +     */
> +    page_mask = (1ULL << granule_sz) - 1;
>      aligned_addr = addr & ~page_mask;
>  
> -    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
> +    SMMUTransTableInfo temp = {
Move the declaration at the top. Also rename temp into tt to be more
explicit about what it is?
> +        .granule_sz = granule_sz,
> +        .tsz = tsz,
> +    };
> +
> +    cached_entry = smmu_iotlb_lookup(bs, cfg, &temp, aligned_addr);
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
Besides, looks good to me

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


