Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B571698163
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:54:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSL2O-0003js-O4; Wed, 15 Feb 2023 11:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL2C-0003g5-0Q
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSL2A-0005Pp-Jb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676480009;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DyEQ0ssRz6jKJymW6QFmq+3seEU9MM3fb0kcX98Ckk=;
 b=RxYKa8hSCAWdS0WuzTArYFvhU0xN8WIE92bb9bUVjAxjLsqtNowUtqz2+c43Bo1RB/aUnp
 DgJQa/uwL7OZiacgsohD3reKxvls4j5wTUy6EoF5JgAgZeeaVmL7EDA2W50xcEAPXpUL6x
 XeGXJs4TpGSze76Kg4y+1Is75td2iz0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-ahOGi67dMWWCmSAwkiWlVA-1; Wed, 15 Feb 2023 11:53:27 -0500
X-MC-Unique: ahOGi67dMWWCmSAwkiWlVA-1
Received: by mail-qv1-f71.google.com with SMTP id
 r10-20020a0562140c8a00b0056ed45f262dso2429773qvr.11
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6DyEQ0ssRz6jKJymW6QFmq+3seEU9MM3fb0kcX98Ckk=;
 b=bXWAsPtVYV+AanD1iH9LNR9gcyuZcwA+Nxfz1nM3J1jG6fKYVnnvsC3YOML9281V9+
 kwTcynLeeiq4uvH2K6cXsvEC3UsF4jlsSdNpAFqZElTqwMLoEfZYMmYptLYuUGtLjYxB
 kK9AGA3yiR4S+wxNBzJfGQQAAIwPfxQTX+vWc95Y8oi41nHgm+jSthyjov1563FS+nJM
 QpNe0nnTCCU2tO80z0uYumqulvy4VNORqRriddP2+PrOq40NQ5CZBS91j1COHgAJjvju
 T3B3Z4inMP4/2fT0ND839UnysOw6ffF2W8lVdsKouC03aZblI4KUxcj8lx39np08VZAm
 Ovjg==
X-Gm-Message-State: AO0yUKXGwAhfjYhM7somHi9NnIA/ksaijpPam1EpQrHN8vCM4rnLP1A2
 qVR23ZpbpYdaSEr2fMQaTPE/Gp4pXOxGYYauJZ611gxXgOKoktH+OAuMcrMLuvuaUaKRjK5acUI
 0HiIRFGNoAjc6reFCCcPv
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr4556537qtk.57.1676480006270; 
 Wed, 15 Feb 2023 08:53:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+CXT8griWJswCmn4wbR5VdngcZPovsEa4rVpHhyWh+hBeW86aHYSdW/zWvDNSw1qA0wK1gKA==
X-Received: by 2002:a05:622a:118b:b0:3b9:a372:e456 with SMTP id
 m11-20020a05622a118b00b003b9a372e456mr4556512qtk.57.1676480005997; 
 Wed, 15 Feb 2023 08:53:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d19-20020ae9ef13000000b0071ddbe8fe23sm14132155qkg.24.2023.02.15.08.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 08:53:25 -0800 (PST)
Message-ID: <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
Date: Wed, 15 Feb 2023 17:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-4-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-4-smostafa@google.com>
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



On 2/5/23 10:43, Mostafa Saleh wrote:
> In preparation for adding stage-2 support. Rename smmu_ptw_64 to
> smmu_ptw_64_s1.
>
> No functional change intended.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 54186f31cb..4fcbffa2f1 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -264,7 +264,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>  }
>  
>  /**
> - * smmu_ptw_64 - VMSAv8-64 Walk of the page tables for a given IOVA
> + * smmu_ptw_64_s1 - VMSAv8-64 Walk of the page tables for a given IOVA
>   * @cfg: translation config
>   * @iova: iova to translate
>   * @perm: access type
> @@ -276,9 +276,9 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>   * Upon success, @tlbe is filled with translated_addr and entry
>   * permission rights.
>   */
> -static int smmu_ptw_64(SMMUTransCfg *cfg,
> -                       dma_addr_t iova, IOMMUAccessFlags perm,
> -                       SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
> +                          dma_addr_t iova, IOMMUAccessFlags perm,
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
>      dma_addr_t baseaddr, indexmask;
>      int stage = cfg->stage;
> @@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
>          g_assert_not_reached();
>      }
>  
> -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
May need to rename the trace points as well

Thanks

Eric
>  }
>  
>  /**


