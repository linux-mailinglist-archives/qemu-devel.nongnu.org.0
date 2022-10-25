Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6D60D1AC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:34:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMoE-0005Sh-M8; Tue, 25 Oct 2022 12:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMoC-00059k-O9
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1onMnt-0007tF-Cp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715364;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nWofdGNEfqlQ+Jii/wTlqRhRTMCB/hdTcwspVO0GAuE=;
 b=DnjjdY04VpXF+kT2dIjuaAQSYEe4h+zsAgRLVz6drCyVgLqVX20X71vUIKD/D93C9N8yQG
 asU1ZBiljwj69510CrdQvDbvFMbeXPnKcPitlmnBQLmShzGIyoWGTzgLA3Ojy4WTcNDbTr
 FGtA1aTSqCFFBjkWsMd5Qdj0ah3KJXs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-uN69b4MGOZaP4Y_4Vtxi2A-1; Tue, 25 Oct 2022 12:29:22 -0400
X-MC-Unique: uN69b4MGOZaP4Y_4Vtxi2A-1
Received: by mail-qk1-f199.google.com with SMTP id
 u9-20020a05620a454900b006eeafac8ea4so11916889qkp.19
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWofdGNEfqlQ+Jii/wTlqRhRTMCB/hdTcwspVO0GAuE=;
 b=jSOX08BEAVlOuQAH2Aw33vuLax9GRwyOHKJkOmGWnbBdVfo8DTCbPrGI66Ytwl/O5T
 TAPa0e5uk/zJ20lBIev0TJuE3uU5KWw/Z51Vi5RPN3D8W4WDq3kbU1f9Spa8Ao3pRTCX
 nKoqo7bbAvVBuJPYRbw7carhNBLRqKnbPuUJcjg4mg6iqaI91eFoh1ARZLuxGApskz+1
 SyAUuIqR2kRmswgki8oniKe5quphL/fQhnBXbgNi077M0gMCYbiiVUnSMXbSgv8y9xdO
 dI+PYNOh6ne23FPbwyYR4IQvVVjLWIix31Kf/mPq4NrLe0oEcy/3O/9VzQGwQBesWxRL
 wmhg==
X-Gm-Message-State: ACrzQf2PH499gnl+BXOg3kFDjKnqU0vrt9tcK9TENMT+U21Ie5tBvmXH
 MzE/clsgACK88G9RBKKv1n+OKykcVSSoCEIwDNEn/4vB/IYHsx4zQtLiMK1FSS9so177xeSuWRO
 1mYW11h7qqA0FGT0=
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id
 gc6-20020a056214230600b00473f77a85a7mr32245671qvb.106.1666715362145; 
 Tue, 25 Oct 2022 09:29:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lsuV/75wcfiPgDcoB84r1JWhjkkBUMco5AhuOg82Ce0VyKKPhYyNZJg8d7wmddM/0pp7sow==
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id
 gc6-20020a056214230600b00473f77a85a7mr32245643qvb.106.1666715361888; 
 Tue, 25 Oct 2022 09:29:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a05620a12e200b006eeb185c209sm2231830qkl.50.2022.10.25.09.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 09:29:21 -0700 (PDT)
Message-ID: <42375c62-c9d4-3276-2ce6-04ee0c9222f7@redhat.com>
Date: Tue, 25 Oct 2022 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 5/7] hw/arm/virt: Improve high memory region address
 assignment
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-6-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221024035416.34068-6-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Gavin,

On 10/24/22 05:54, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is likely to be disabled by
>     code by toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_{memmap, high_memmap}() isn't
> optimized because the high memory region's PA space is always reserved,
> regardless of whatever the actual state in the corresponding
> vms->highmem_{redists, ecam, mmio} flag. In the code, 'base' and
> 'vms->highest_gpa' are always increased for case (1), (2) and (3).
> It's unnecessary since the assigned PA space for the disabled high
> memory region won't be used afterwards.
>
> Improve the address assignment for those three high memory region by
> skipping the address assignment for one specific high memory region if
> it has been disabled in case (1), (2) and (3). The memory layout may
> be changed after the improvement is applied, which leads to potential
> migration breakage. So 'vms->highmem_compact' is added to control if
> the improvement should be applied. For now, 'vms->highmem_compact' is
> set to false, meaning that we don't have memory layout change until it
> becomes configurable through property 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
the code has quite changed since Connie's R-b
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c         | 15 ++++++++++-----
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ee98a8a3b6..4896f600b4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1721,18 +1721,23 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>          vms->memmap[i].size = region_size;
>  
>          /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> +         * Check each device to see if it fits in the PA space,
> +         * moving highest_gpa as we go. For compatibility, move
> +         * highest_gpa for disabled fitting devices as well, if
> +         * the compact layout has been disabled.
>           *
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = region_base + region_size - 1;
> +        *region_enabled &= fits;
> +        if (vms->highmem_compact && !*region_enabled) {
> +            continue;
>          }
>  
> -        *region_enabled &= fits;
>          base = region_base + region_size;
> +        if (fits) {
> +            vms->highest_gpa = region_base + region_size - 1;

vms->highest_gpa = base - 1;

> +        }
>      }
>  }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6ec479ca2b..709f623741 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -144,6 +144,7 @@ struct VirtMachineState {
>      PFlashCFI01 *flash[2];
>      bool secure;
>      bool highmem;
> +    bool highmem_compact;
>      bool highmem_ecam;
>      bool highmem_mmio;
>      bool highmem_redists;
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


