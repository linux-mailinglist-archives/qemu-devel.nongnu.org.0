Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D866983F5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMyq-0000nN-7V; Wed, 15 Feb 2023 13:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMyl-0000HM-9V
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMyj-00081a-L7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZLoMDW5w8Ufme+LRAyvKzZJwCc+TbF49px5JHKmINk=;
 b=DymM7tKWQ7JNGTYAtAhf8nZgCXBfosvfTnNXy4N08joHJpFJm1ulplMhX+VAjnhohJEYQQ
 di8AkAdMsX+Fi/i7zacEemCQRH9GukhdwWP6FPNIxePPcTqXrYAvyQAFPn80yoaJIzIxoI
 Arhbeq3nyUVZlA0/hTShCww2BQAPIzQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-25wXYC6VOe2Ygx0Y3OGlOQ-1; Wed, 15 Feb 2023 13:58:03 -0500
X-MC-Unique: 25wXYC6VOe2Ygx0Y3OGlOQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 g9-20020ac80709000000b003ba266c0c2bso11476334qth.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WZLoMDW5w8Ufme+LRAyvKzZJwCc+TbF49px5JHKmINk=;
 b=6aFrIubgT5X6I5UMevZXuUk/2PG7N5wA/DLh/9J477JhhdBb/bIdIQrFD50kBXMPEA
 QjcPN7PQfxrH5n2q6vcMFXgxN8GQoeTaKbjzER8yl/Y2tNTMbUBKOI3G05SypZffGuaa
 jwHMaztIHACQEvVpceCzzKylbiMwFUQ59Yv/VSGyJcJ2VsNLrJyQ0q2xkmFdQ1S4Lxfx
 Ao6ejr4M3X64cvUSWpsQdGsugnG5xMWqpaMOiUR44Cu7gu6/ctXCT4Fe1ke8YlsF6f7E
 tLlWVb8mxlGoaTP9spSAvnSgLEnBNnl/VIt/1O6fbAzwnK5ba3ViD/GNxrlOhUK9hRKs
 kSIQ==
X-Gm-Message-State: AO0yUKXcXpERn1MpbowHaJDykYDqYiQPxsz24NzClgq3I1uS7r/zLRpU
 3A2LcT9AfB09OtR5t/3mqxJNg/ui/hM8hHBNR2sCTVeMF5+d6wdTUIN2OEgtTyGJtPPtLl4EkP8
 CnCt+cTXGDwU+ugJ5mSMf
X-Received: by 2002:ac8:7d50:0:b0:3b8:6b30:7e30 with SMTP id
 h16-20020ac87d50000000b003b86b307e30mr4687694qtb.54.1676487482531; 
 Wed, 15 Feb 2023 10:58:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+QJgjDMDnRXJH7ejskskb3rcKjshWm3rg3MDXcQdAcxcrV4f4pcVNBiDnllbwju6lmZW0MEg==
X-Received: by 2002:ac8:7d50:0:b0:3b8:6b30:7e30 with SMTP id
 h16-20020ac87d50000000b003b86b307e30mr4687671qtb.54.1676487482178; 
 Wed, 15 Feb 2023 10:58:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cc5-20020a05622a410500b003995f6513b9sm6586196qtb.95.2023.02.15.10.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:58:01 -0800 (PST)
Message-ID: <d7f4e2cd-e60e-7187-105c-0e29b7745bbd@redhat.com>
Date: Wed, 15 Feb 2023 19:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 02/16] hw/arm/smmuv3: Update translation config to
 hold stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-3-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-3-smostafa@google.com>
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

hi Mostafa,

On 2/5/23 10:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support. Add it's configuration.
replace "support. Add it's " by "support, add a S2 config struct,
composed of the following fields and embedded in the main TransCfg ../.."

>
> They are added as SMMUS2Cfg in SMMUTransCfg, SMMUS2Cfg hold configs
> parsed from STE:
>  -tsz: Input range
>  -sl0: start level of translation
>  -affd: AF fault disable
>  -granule_sz: Granule page shift
>  -vmid: VMID
>  -vttb: PA of translation table
>
> They will be used in the next patches in stage-2 address translation.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  include/hw/arm/smmu-common.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index c5683af07d..45f74d0e93 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -60,6 +60,16 @@ typedef struct SMMUTLBEntry {
>      uint8_t granule;
>  } SMMUTLBEntry;
>  
> +typedef struct SMMUS2Cfg {
> +    uint8_t tsz;            /* Input range */
> +    uint8_t sl0;            /* Start level of translation */
> +    bool affd;              /* AF Fault Disable */
> +    uint8_t granule_sz;     /* Granule page shift */
> +    uint16_t vmid;          /* Virtual machine ID */
> +    uint64_t vttb;          /* PA of translation table */
> +} SMMUS2Cfg;
> +
> +
>  /*
>   * Generic structure populated by derived SMMU devices
>   * after decoding the configuration information and used as
> @@ -79,6 +89,7 @@ typedef struct SMMUTransCfg {
>      SMMUTransTableInfo tt[2];
>      uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
>      uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
> +    struct SMMUS2Cfg s2cfg;
>  } SMMUTransCfg;
>  
>  typedef struct SMMUDevice {
Eric


