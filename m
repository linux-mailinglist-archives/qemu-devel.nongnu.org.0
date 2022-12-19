Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E601A6508A3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7BgN-0003JX-Sb; Mon, 19 Dec 2022 03:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgL-0003Ih-7t
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p7BgJ-0006U3-Sd
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytofBJVkfpW+gFtfBo3vLT5zyrk3b4zzTiuL/3hZ+kQ=;
 b=KAt6Om68VjDocTwsqbsSrp8Og6lU2SEkumke0PT+SK2LoIE5yNmZxBnl6QcuBLeEnCyu+/
 xvWUs3Skvmpd5/hqMp7o2JgQN8gyCR7Bg5bPngFBd+NfnMifKfHX3Ntlk6Pkpy3+nj9i3R
 NFTSShNRnxXUh1SVtlR2CIZwoW4AN/8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-56-2ECpiyqNMQSeKrezMn4mvA-1; Mon, 19 Dec 2022 03:39:29 -0500
X-MC-Unique: 2ECpiyqNMQSeKrezMn4mvA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j29-20020adfb31d000000b0024237066261so1287701wrd.14
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 00:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytofBJVkfpW+gFtfBo3vLT5zyrk3b4zzTiuL/3hZ+kQ=;
 b=Ns88V/U4LuGGHjbP4xvbbxToyVcl+0tuTXpNToyvgvXTrCROEORliVYNP9NQaYsHx2
 1bM3RGe6sa84F1Tyut1M4wB33yThY9ciQYjhzgZPQugLO3CvlDvBm2HLyQZkq/w1+g/U
 I4b+AQ5iABcVbWpPBVipRVSTVHzikCwPHDV4NRtYuDYsCKpJGcZ2hnqzT30xtWEFvzwa
 k6oigv+YtenizswWYaXAb6K3GMBFRWWFx/jToqnaXX1bw7utERUrT+zOUQySXSGCflrc
 mQYelXrJJzLfKC55mUUxxm1yrVnCtd9Pgmo0DfbSAfW6kzvYv2PGxYyydn5jsa4Pf/R/
 3oPw==
X-Gm-Message-State: ANoB5pkckIHdnQ5hm4OpN15qKVhf73CFmvzQHsYuaFxFetIY1IsgDGt/
 nWDNeZYIdrTXB8VGtuvbo7A0riTnYE4x04ZCm9fhTyYCyWuyZS546jQSI7KlyU9Pc9D/4ORS0uO
 dL6ERPyj3ADkxAr0=
X-Received: by 2002:adf:e4c3:0:b0:242:3ca5:5e6d with SMTP id
 v3-20020adfe4c3000000b002423ca55e6dmr29648097wrm.56.1671439168490; 
 Mon, 19 Dec 2022 00:39:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7To83qy4A92EAAbi9d0Nly8by1EfH+4+4I8wIt220KE90sFIpejmrUSgdy8Yc3hY8frtufUA==
X-Received: by 2002:adf:e4c3:0:b0:242:3ca5:5e6d with SMTP id
 v3-20020adfe4c3000000b002423ca55e6dmr29648089wrm.56.1671439168248; 
 Mon, 19 Dec 2022 00:39:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm9405911wrb.41.2022.12.19.00.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:39:27 -0800 (PST)
Message-ID: <88700341-7a3b-db42-d5d7-bf088192e9b0@redhat.com>
Date: Mon, 19 Dec 2022 09:39:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr()
 scope
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221216214924.4711-1-philmd@linaro.org>
 <20221216214924.4711-2-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221216214924.4711-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi

On 12/16/22 22:49, Philippe Mathieu-Daudé wrote:
> This function is not used anywhere outside this file,
> so we can make the function "static void".
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c         | 2 +-
>  include/hw/arm/smmu-common.h | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 220838525d..9f196625a2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -483,7 +483,7 @@ static void smmu_unmap_notifier_range(IOMMUNotifier *n)
>  }
>  
>  /* Unmap all notifiers attached to @mr */
> -inline void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
> +static void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr)
>  {
>      IOMMUNotifier *n;
>  
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 21e62342e9..c5683af07d 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -173,7 +173,4 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  
> -/* Unmap the range of all the notifiers registered to @mr */
> -void smmu_inv_notifiers_mr(IOMMUMemoryRegion *mr);
> -
>  #endif /* HW_ARM_SMMU_COMMON_H */


