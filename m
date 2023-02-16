Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CEF699325
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pScV6-0005OD-Vz; Thu, 16 Feb 2023 06:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pScV4-0005NR-7P
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:32:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pScV2-0004O2-Jt
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676547147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiAzqX2rEd6AnC2G00Vh6KUbhpkypQJ5a6xp2Bq9u1I=;
 b=BEmdi4bAJl3RmC/vTVxT6DlOprMd+qN6ldSVEZDgltNx0TtLqrrjLaUGuGIryuGXguYkQB
 yvj8gvoABwWzpKxqsUkfgjDzOqiEnozYsBHQKhN2heckSUHOwlcpxJRVXw8FHH2PbC19ct
 jCCVxkjecbYvFPPfzvKDjzL3UVyFHqQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-a-qDha7FPvuSp3lR6-XZzw-1; Thu, 16 Feb 2023 06:32:26 -0500
X-MC-Unique: a-qDha7FPvuSp3lR6-XZzw-1
Received: by mail-qt1-f197.google.com with SMTP id
 z12-20020ac8710c000000b003b829a0eda2so1017729qto.21
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:32:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MiAzqX2rEd6AnC2G00Vh6KUbhpkypQJ5a6xp2Bq9u1I=;
 b=j8KkQVdpw1doO2aFB51iLB8aGcgAjxWVnOqmDQdwf4KLZePALkNt0hAX0gO6RC3e7q
 ioNqRH7wa2pEynfWHkdGU9CD+tgHDXN4AZmrzHb48R8ujpgqo+BQwklBjdeAPsXT5D0R
 UMqw84wzkFfLyYsMOjpJvVWxgzLkv+5F0PUIOYWIzpJn+jlZVwZvpZH+m0j0fIIHfKm+
 dvqQMkFGBE1wO36lx0AZaNnmYJUx6wWJgxg77AG1zxN7zNawsE30TF6QATLNNtJ+/lnC
 NGE1AD5mYkrdEHMYd4KTBqvOO8Yb4Ijic7tDJhRHncOiHYnVX3P61mV2v9P9UFENzFgn
 O1OQ==
X-Gm-Message-State: AO0yUKU/kzK2IeGNa1zUquYmnmdf2vC2FGVn84uu59GpSS+UorKUfNOJ
 5/IBGrjoXTSuodCkApSRuMqOblAkp/Mu+i6GpXwaSMxmw9W7IKsJTVWxoABVHpZzWb9+OJKTpDf
 Y8yYpGsVZ5thlPQA=
X-Received: by 2002:ac8:5c02:0:b0:3b9:bc8c:c20f with SMTP id
 i2-20020ac85c02000000b003b9bc8cc20fmr3121613qti.26.1676547145644; 
 Thu, 16 Feb 2023 03:32:25 -0800 (PST)
X-Google-Smtp-Source: AK7set9i38bDKlEVZpTv3PVs/ioC07I+6SaOG9aE9pLzM04ZXWbfSAgs4KyCNi75Ixcm1GWsLjdSwQ==
X-Received: by 2002:ac8:5c02:0:b0:3b9:bc8c:c20f with SMTP id
 i2-20020ac85c02000000b003b9bc8cc20fmr3121590qti.26.1676547145329; 
 Thu, 16 Feb 2023 03:32:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n64-20020a374043000000b0073b7f2a0bcbsm1031578qka.36.2023.02.16.03.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:32:24 -0800 (PST)
Message-ID: <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
Date: Thu, 16 Feb 2023 12:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-11-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-11-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/5/23 10:44, Mostafa Saleh wrote:
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
>  hw/arm/smmuv3.c | 44 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c18460a4ff..769c735697 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -653,6 +653,8 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> +    /* ASID defaults to -1 if s1 is not supported. */
> +    cfg->asid = -1;
>      if (cfg->aborted || cfg->bypassed || !STAGE1_SUPPORTED(s->features)) {
>          return 0;
>      }
> @@ -733,6 +735,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUTLBEntry *cached_entry = NULL;
>      SMMUTransTableInfo *tt;
>      SMMUTransCfg *cfg = NULL;
> +    uint8_t granule_sz, tsz;
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
> @@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    tt = select_tt(cfg, addr);
maybe we shall adapt select_tt for S2 instead of using temp? I know
there is a single range on S2 but well, use tt[0]?
> -    if (!tt) {
> -        if (cfg->record_faults) {
> -            event.type = SMMU_EVT_F_TRANSLATION;
> -            event.u.f_translation.addr = addr;
> -            event.u.f_translation.rnw = flag & 0x1;
> +    if (STAGE1_SUPPORTED(s->features)) {
maybe check the enable state instead.
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
> +        .granule_sz = granule_sz,
> +        .tsz = tsz,
> +    };
> +
> +    cached_entry = smmu_iotlb_lookup(bs, cfg, &temp, aligned_addr);
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
Thanks

Eric


