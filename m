Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50405EE13C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:12:10 +0200 (CEST)
Received: from localhost ([::1]:50988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZfK-0005Eo-Rt
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odWXh-0006Zr-43
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odWXa-0001xI-9U
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664369513;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVbZi56WWVl+SPbWvCThowte/6idgZ6SqtpR3owqm+g=;
 b=DsK1OVwCrfZ9Vka+FlVwnB7ZItolejfA0nzzbLwHHHG/IJU2HJRg8isluNsK45ntUL75nO
 5MPHRSgNX9ASu4tBERYPt92cpLy18RWHJG/8Q+Hc9UXnNs4nvuLYmZjCoBIXoTb0nN1CIq
 RCloRD2cT1SoNudDTP6u3u8cTVf/d/E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-DSCVjgrKO9O8WVOn_HWK8g-1; Wed, 28 Sep 2022 08:51:44 -0400
X-MC-Unique: DSCVjgrKO9O8WVOn_HWK8g-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so1364148wrg.16
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=HVbZi56WWVl+SPbWvCThowte/6idgZ6SqtpR3owqm+g=;
 b=wBcoPBxtGBD0rdGHjYzJc2QnkyNxPw8jo1PAYtP5cuE2s4yhxHNza6dgke3DI83JVl
 0rPJwupgBlrSunqm0WoGlUQnAa2zzrudRNTdHzrv0dF7VxIiDddUG/FOH8YazZG6zESj
 Kx8GB+fpUn7DzL2ac2aGVpDTLYqq3hHhhN1GbmpBNoJhYYp4ccm4DaTbWAwLM/+F1zTS
 U9bzRsUAqa3ZSU1rmQgjHnEAF0BLS9dvoX4xhUVta0gtdQLokqSyi9BCDozyfL7xhFdp
 YqwcjSKiQjFLB/I/y0MUagETmG/5wKLynG2myvRXJ3ZzNDfVpxx5U/Eood41/Re9DfSs
 jtag==
X-Gm-Message-State: ACrzQf2hibU5JadmJo1zW0vNudb4jyI9aaOfUHqV9AnV5EZ+boJzggZy
 Jjjve6WOtBOb/kI9LqKpipOd7cc6p16Ryzuh+2a0xnh16zgyS7BYQmM2YfqNTEV/sOGaxTGbrGc
 VvhjXR1XluqdATJs=
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr6861392wmq.107.1664369503337; 
 Wed, 28 Sep 2022 05:51:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fIARaSjJqJ9oaMl/i3zUNywZl6OwJigtbcOAk5GfhqoB3X0ltECYHvYyQ4xdH3agYq88Lgg==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr6861366wmq.107.1664369503073; 
 Wed, 28 Sep 2022 05:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d63d0000000b00228d8420f57sm4192862wrw.95.2022.09.28.05.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:51:42 -0700 (PDT)
Message-ID: <6c9a644a-6add-af29-8463-eddb101c1c99@redhat.com>
Date: Wed, 28 Sep 2022 14:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] hw/arm/virt: Improve high memory region address
 assignment
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-5-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin,

On 9/22/22 01:13, Gavin Shan wrote:
> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
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
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 44 ++++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0b679d1f4..b702f8f2b5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1693,15 +1693,31 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
>      hwaddr region_base, region_size;
> -    bool fits;
> +    bool *region_enabled, fits;
IDo you really need a pointer? If the region is unknown this is a bug in
virt code.
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
>          region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        vms->memmap[i].base = region_base;
> -        vms->memmap[i].size = region_size;
> +        switch (i) {
> +        case VIRT_HIGH_GIC_REDIST2:
> +            region_enabled = &vms->highmem_redists;
> +            break;
> +        case VIRT_HIGH_PCIE_ECAM:
> +            region_enabled = &vms->highmem_ecam;
> +            break;
> +        case VIRT_HIGH_PCIE_MMIO:
> +            region_enabled = &vms->highmem_mmio;
> +            break;
While we are at it I would change the vms fields dealing with those
highmem regions and turn those fields into an array of bool indexed
using i - VIRT_LOWMEMMAP_LAST (using a macro or something alike). We
would not be obliged to have this switch, now duplicated.
> +        default:
> +            region_enabled = NULL;
> +        }
> +
> +        /* Skip unknown region */
> +        if (!region_enabled) {
> +            continue;
> +        }
>  
>          /*
>           * Check each device to see if they fit in the PA space,
> @@ -1710,23 +1726,15 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           * For each device that doesn't fit, disable it.
>           */
>          fits = (region_base + region_size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = region_base + region_size - 1;
> -        }
> +        if (*region_enabled && fits) {
> +            vms->memmap[i].base = region_base;
> +            vms->memmap[i].size = region_size;
>  
> -        switch (i) {
> -        case VIRT_HIGH_GIC_REDIST2:
> -            vms->highmem_redists &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_ECAM:
> -            vms->highmem_ecam &= fits;
> -            break;
> -        case VIRT_HIGH_PCIE_MMIO:
> -            vms->highmem_mmio &= fits;
> -            break;
> +            vms->highest_gpa = region_base + region_size - 1;
> +            base = region_base + region_size;
> +        } else {
> +            *region_enabled = false;
>          }
> -
> -        base = region_base + region_size;
>      }
>  }
>  
Thanks

Eric


