Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE916983E2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:56:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMwM-0005S8-Sf; Wed, 15 Feb 2023 13:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMwK-0005Rm-FM
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSMwJ-0007b4-2i
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:55:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676487334;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHgPSsY5tsE4Bl4KPlfDiI+7AxE3H2cnXZaZIM67PSc=;
 b=A4RIyhTZJtLZDHN/fhAhKoYGwk03IzKjE77rxqlt+11bpTSrwg+lSlCL7eTJIIzeIDVPtC
 62zOZh7rAYppHcV3D4NQDkdQM7NHBUnw6hTGEwC6kHrsT7kNIQ5RI9LtkeWrZcwdtlWmqJ
 L2ME4lHlyvtaHCxcJXCWAzUaczKao7Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-UK1W-XjeMjGvGWu8w2bCag-1; Wed, 15 Feb 2023 13:55:31 -0500
X-MC-Unique: UK1W-XjeMjGvGWu8w2bCag-1
Received: by mail-qk1-f200.google.com with SMTP id
 z40-20020a05620a262800b0073b344eb74dso6334218qko.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sHgPSsY5tsE4Bl4KPlfDiI+7AxE3H2cnXZaZIM67PSc=;
 b=60jV7CVr8JMqdnXcKkUNwHEVlo3Wj3A8t20KXKOuPBVBkC2h8nVkf7IuwFebofhZOf
 5KY7bl5RE0JaM+6iawH6+l+gZJnYZq7rOQvQSJMSmhUW7DRM1GlSZLzAAo2d+ZCY3Bbv
 6YYdbLxtkBY5jI58HshSBh34ngUHdycnst9ttLAhZlFw9KT3Ppfg9TYuAjIc64KXGIMY
 2Ejh3N7OiFMzVEXgwX0X05Oa4cNAcO/YeVME66LJZTxpC42RyRVJ4zSmC4loa8hCjE0X
 roo8RhVdbBgr6CO+G3zuTqm+lxbzJNp0ED0QR0+mooqhAit8iSMbFa+BkhOuhlt9StCJ
 QuSg==
X-Gm-Message-State: AO0yUKUgr45W2ZAulMpX9nhNtaKytv6RwH2hat3wbJVfhH64gQWl74gh
 l3F658ff/dETT59PljHVzEY26+HXhmbHjrojVUTnG8IEYMH5iPvBhfFOGWOFU2fpAxN8VyNPraJ
 9h+VonIrFX+M/1c4=
X-Received: by 2002:a05:622a:1447:b0:3b6:3596:182b with SMTP id
 v7-20020a05622a144700b003b63596182bmr5066230qtx.36.1676487330683; 
 Wed, 15 Feb 2023 10:55:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8aDqcmakTC6pAIhjRW5GGAi4qp/8S9T44jpC7D9t57qd0P2fD46YUZUy97h5I68qtw2zb0ag==
X-Received: by 2002:a05:622a:1447:b0:3b6:3596:182b with SMTP id
 v7-20020a05622a144700b003b63596182bmr5066208qtx.36.1676487330424; 
 Wed, 15 Feb 2023 10:55:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f18-20020ac80692000000b003b9e1d3a502sm13628343qth.54.2023.02.15.10.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:55:29 -0800 (PST)
Message-ID: <7300b312-d58b-fdab-a72e-6ee9d0a1aa95@redhat.com>
Date: Wed, 15 Feb 2023 19:55:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 15/16] hw/arm/smmuv3: Add fault configuration for
 stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-16-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-16-smostafa@google.com>
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



On 2/5/23 10:44, Mostafa Saleh wrote:
> As stall is not supported, if S2S is set the translation would abort.
> For S2R, we reuse the same code used for stage-1 with flag
> record_faults. However when nested translation is supported we would
> need to separate stage-1 and stage-2 faults.
same here, please squash that code in the STE decoding and possible add
those above comments in the commit msg

Thanks

Eric
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3-internal.h | 2 ++
>  hw/arm/smmuv3.c          | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 3ccb9d118e..ccdae81db8 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -528,6 +528,8 @@ typedef struct CD {
>  #define STE_S2HD(x)        extract32((x)->word[5], 24, 1)
>  #define STE_S2HA(x)        extract32((x)->word[5], 25, 1)
>  #define STE_S2S(x)         extract32((x)->word[5], 26, 1)
> +#define STE_S2R(x)         extract32((x)->word[5], 27, 1)
> +
>  #define STE_CTXPTR(x)                                           \
>      ({                                                          \
>          unsigned long addr;                                     \
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e0976ac236..5f792d96ab 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -446,6 +446,11 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>  
>          cfg->s2cfg.affd = STE_S2AFFD(ste);
> +        cfg->record_faults = STE_S2R(ste);
> +        if (STE_S2S(ste)) {
> +            qemu_log_mask(LOG_UNIMP, "SMMUv3 Stall not implemented!\n");
> +            goto bad_ste;
> +        }
>  
>          /* This is still here as stage 2 has not been fully enabled yet. */
>          qemu_log_mask(LOG_UNIMP, "SMMUv3 does not support stage 2 yet\n");


