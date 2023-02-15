Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26456983DF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMue-00046g-5c; Wed, 15 Feb 2023 13:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMuZ-00045p-PF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMuX-0006LM-8h
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwo8u/u4G1nwOBopi2ARjFOYFBg/8QHvIBF01myTrK8=;
 b=W3jr/2yWLlVMnAa8XQFidBSQjEzOHFo9/kFbYUsFpKPJ34wMvR0ImbG1J1OVYpxXuyg5vD
 4Xbgfr+a4RXgBkyvu/im73lkJocwa244MPZagOBdLzziYRY3SrhVXmg8cp0Hn0sDXFrodw
 jyqYpZYlxCaNu8UopXD2kZBIxTQKd8s=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-7EMUycgSNkGDnZmmbSdlxQ-1; Wed, 15 Feb 2023 13:53:43 -0500
X-MC-Unique: 7EMUycgSNkGDnZmmbSdlxQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 fp20-20020a05622a509400b003bcf4239f33so2811037qtb.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gwo8u/u4G1nwOBopi2ARjFOYFBg/8QHvIBF01myTrK8=;
 b=quWLbF5GZFNr+VynY0iI90X5yudw9WbNho7W152hPJ8GfOTm5RjYnPq7NiUc6hCorO
 HEp1hTRVLeb80kIoIan3PLVL+Gavhi4naUIR+EkcUp8Y+4n/LwCjR7EoxzQVY+h1Vnf5
 uORQsoDTKsx99fIOaQmnZiDFxn8i+RlRTI8lCajhMSsLzR4HpzFQoynOpNmAb+2v0p0E
 KyptRlp5AZzlzR9HHnmzXsKJTHss6MWGrGA0f+akQZ0kd4FbMOOXx10hOEC/XZisEqks
 dea+K19s2EsM/JhXPPA29d7dbmRxRsH+vCraZaiQXwWEKc2XYZ0Hip5iK2gbwGaxYDy+
 Bhyg==
X-Gm-Message-State: AO0yUKUS8hOYCShdkc3iOZ2+TWcEIpEedm5WgG06k0hVly51z8U1rakh
 6prLJNlaY3WSXZmHIxJuuE9AIHAEbWjEvQTFjGJ9N/idPOjpKQ7MeKylHylCSxUtv3/rlMm3cXN
 p25uqr8Hz1p+fDm12WaNa
X-Received: by 2002:a05:6214:29ea:b0:56b:f017:c2e4 with SMTP id
 jv10-20020a05621429ea00b0056bf017c2e4mr4237885qvb.47.1676487221826; 
 Wed, 15 Feb 2023 10:53:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/5bZ64rVq5E3A++RRFWyOZVngabxL0bNUkgderr9PZwVzPL3JfXYS+DDB1Pbp+QSG24WZBMg==
X-Received: by 2002:a05:6214:29ea:b0:56b:f017:c2e4 with SMTP id
 jv10-20020a05621429ea00b0056bf017c2e4mr4237860qvb.47.1676487221537; 
 Wed, 15 Feb 2023 10:53:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l67-20020a37bb46000000b0071d0f1d01easm14380652qkf.57.2023.02.15.10.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:53:40 -0800 (PST)
Message-ID: <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
Date: Wed, 15 Feb 2023 19:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page
 table
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-8-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-8-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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
> Check if with the configured start level, ia_bits and granularity we
> can have a valid page table as described in ARM ARM D8.2 Translation
> process.
> The idea is to see for the highest possible number of IPA bits, how
> many concatenated tables we would need, if it is more than 16, then
> this is not possible.

This rather checks the validity and consistency of the STE S2 fields.
The patch title sounds a bit misleading to me.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 6633fe40fa..c49b341287 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -341,6 +341,28 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>      return 0;
>  }
>  
> +/*
> + * Return true if s2 page table config is valid.
> + * This checks with the configured start level, ia_bits and granularity we can
> + * have a valid page table as described in ARM ARM D8.2 Translation process.
> + * The idea here is to see for the highest possible number of IPA bits, how
> + * many concatenated tables we would need, if it is more than 16, then this is
> + * not possible.
> + */
> +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> +{
> +    int level = get_start_level(sl0, gran);
> +    uint64_t ia_bits = 64 - t0sz;
s/ia/ipa
> +    uint64_t mx = (1ULL << ia_bits) - 1;
s/mx/max_ipa
> +    int nr_concat = pgd_idx(level, gran, mx) + 1;
> +
> +    if (nr_concat > SMMU_MAX_S2_CONCAT) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>  /* Returns < 0 in case of invalid STE, 0 otherwise */
>  static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>                        STE *ste, SMMUEventInfo *event)
> @@ -407,6 +429,13 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>              goto bad_ste;
>          }
>  
> +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> +                                     cfg->s2cfg.granule_sz)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "SMMUv3 STE stage 2 config not valid!\n");
> +            goto bad_ste;
> +        }
> +
To me this would need to be integrated into the STE decoding patch. This
latter shall be self-contained if possible to ease the review

Thanks

Eric
>          /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");
>          goto bad_ste;


