Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F757420AE1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:26:38 +0200 (CEST)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXN3E-0005nj-IJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXN0Y-0004GY-71
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXN0V-000189-Kt
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633350225;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wl7ICQODkHW0YfDfZWHTQGFAOQQBlguFC3IFpZqYzao=;
 b=bZYcqv9ZABKO/NIvZXNHmDf6zcYS/6x3VmDDF6fRnfjuy0XsPDFpNDnTXDUuiBbNdT0VpH
 u/v7yBDnLWduOBE7DyC69Zts0jYOxCGtD3sLJsoeN5MOOC1cw24zDqYr1YvAj0fn9Y7Q/+
 PIIWO0lkAtuT7SFxvckz3+1LUve3v1U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-hEWsA9GCNVqZs48LDMhfmw-1; Mon, 04 Oct 2021 08:23:44 -0400
X-MC-Unique: hEWsA9GCNVqZs48LDMhfmw-1
Received: by mail-wm1-f70.google.com with SMTP id
 129-20020a1c1987000000b0030cd1616fbfso9888269wmz.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 05:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Wl7ICQODkHW0YfDfZWHTQGFAOQQBlguFC3IFpZqYzao=;
 b=Mmcxfy5W0TNs5Mp06Dn2kWpA8Qeve9op26YrNZjZwJCRVePvq35Qp1jE3/9YqSzQdf
 SOi7Jp+1VCGVEuQFeky+zu3q4AsqYGahrRByFpwW+D1PIrjlbtZwu6v7+gKSDd/gHL/y
 BwFD8/PbP3LNGfwdSB8oFaLQgXVjMvvlF+h0mxBNFE30Y7silFQ8+phorkIaPfOCLSH+
 AZBaVZtWekQ0ZiyrxHnUHwI7orz2T8FBdETZBVhxlcY1HfdWTq0TRaIn3kXUGmsg+ikB
 MLRE38t+yWEAdgDxq32iGdfMV7S5hCubWMrf2IJ5iFI/N8G3iyK5/ABttYY4BWmOCBRI
 jMHA==
X-Gm-Message-State: AOAM5303JKDB+oRjVTNFTN0jMSCfpdGhjpFn0nc3E7iG0/aPU3FH9R0W
 AFjBD4Mi/4MijbHx8vs8GZ1CwB0zys2gUQXuxqWOD0Yfe1ZtGDSvSEHxvuSRnpoveh/AFfMvZYO
 oQ2+FieHw4hE4R24=
X-Received: by 2002:a05:600c:aca:: with SMTP id
 c10mr18225428wmr.174.1633350223589; 
 Mon, 04 Oct 2021 05:23:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxitcIwPYb5MpA3gCLqjGct65p9PyV+TzRYqXfXifFRuJt7/5ttvdPSHfIcdPnoBpfMalndPA==
X-Received: by 2002:a05:600c:aca:: with SMTP id
 c10mr18225400wmr.174.1633350223347; 
 Mon, 04 Oct 2021 05:23:43 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f19sm14674493wmf.11.2021.10.04.05.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 05:23:42 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-4-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <b36a602e-a8f4-c8ac-bd4b-95fd6d426736@redhat.com>
Date: Mon, 4 Oct 2021 14:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-4-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 10/3/21 6:46 PM, Marc Zyngier wrote:
> Even when the VM is configured with highmem=off, the highest_gpa
> field includes devices that are above the 4GiB limit.
> Similarily, nothing seem to check that the memory is within
> the limit set by the highmem=off option.
>
> This leads to failures in virt_kvm_type() on systems that have
> a crippled IPA range, as the reported IPA space is larger than
> what it should be.
>
> Instead, honor the user-specified limit to only use the devices
> at the lowest end of the spectrum, and fail if we have memory
> crossing the 4GiB limit.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bcf58f677d..9d2abdbd5f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1628,6 +1628,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> +    if (!vms->highmem &&
> +        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +        exit(EXIT_FAILURE);
> +    }
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> @@ -1657,7 +1662,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = base - 1;
> +    vms->highest_gpa = (vms->highmem ?
> +                        base :
> +                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
I think I would have preferred to have

if (vms->highmem) {
   for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
        hwaddr size = extended_memmap[i].size;

        base = ROUND_UP(base, size);
        vms->memmap[i].base = base;
        vms->memmap[i].size = size;
        base += size;
    }
}
as it is useless to execute that code and create new memmap entries in
case of !highmem.

But nevertheless, this looks correct

Eric
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;


