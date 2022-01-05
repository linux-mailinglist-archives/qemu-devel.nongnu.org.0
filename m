Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B44D484FFB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:24:25 +0100 (CET)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Wu-0004bu-DF
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n52VK-0002oA-Dm
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:22:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n52VI-00089n-8j
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641374563;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJYdodG85/ccnAQTfgZ3AUnRmcUufSnMa1xnUl79IAI=;
 b=WOH/tIpdipa/9a1zK0+WHv6lBQylIuDl/irsaz1IX72tuDXiAEbpxYIjpCKUkI04msz4Wp
 qCL3xTiPElTR3M9BP0Bewm1y7G9fSAlgrbJyC9598aFcJiumdWuNE6Z2kuJ3uxefWO4oBQ
 rFruu0hl13CLs44nvKCGzocn4FwAyO0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-r2VrIhGZMmus_N-Wf2bbHA-1; Wed, 05 Jan 2022 04:22:42 -0500
X-MC-Unique: r2VrIhGZMmus_N-Wf2bbHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso12293933wrb.12
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=nJYdodG85/ccnAQTfgZ3AUnRmcUufSnMa1xnUl79IAI=;
 b=BXiHRw+Or60JK1Lqs9wc1HlGb8W2LzF9UH2v8CeVDZlarozcDhncvyNJiBeWgWq/13
 FNbTEXuVXfcfoIjqGPvzRuTYNQwrPfGz5vh76ZdlauGyE9kOhiKYo9CQqfoGONynDxjY
 FMNLTeBDIVOBMd2C0EEanmKG2FpU88GidttyiYIQdRvRBervMy9THAYbFsQlrEqcMsVJ
 qXMDWiHUniSbOnqEbp4gpkhTdFJxxA++gAAOxtyWusTrDjIAHjQybIRv+m272SF0gYUs
 C0C1An5WPGV4VSpZWE5tR0OoinzZW9G8WzmPgNXGS7BfVWpXI9/6++JCinogQ4RrpEUd
 PBBw==
X-Gm-Message-State: AOAM531sJlICRCu0xVs+eHS54jPZWqAzgK2J0tfSIlRyZQsabdRqz8qt
 potx788NARKgfsoNUUQAu9uuYkQ6Haxc/1rk1Zkl+fyMgPROjpA/YSX0071UVm+r3KX9uXNz4oa
 qTntjAAQI+IfKrc8=
X-Received: by 2002:a05:600c:3d0f:: with SMTP id
 bh15mr2037728wmb.27.1641374561381; 
 Wed, 05 Jan 2022 01:22:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5u8kXW70952AOxAuw5ljL9wtKWvvP0ulgX5HpX3UhLV+slhtiBMxJ6UN+z0RstQQDzjW3tw==
X-Received: by 2002:a05:600c:3d0f:: with SMTP id
 bh15mr2037711wmb.27.1641374561183; 
 Wed, 05 Jan 2022 01:22:41 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c7sm45516656wri.21.2022.01.05.01.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 01:22:40 -0800 (PST)
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Honor highmem setting when computing
 the memory map
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20211227211642.994461-1-maz@kernel.org>
 <20211227211642.994461-4-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ef8b3500-04ab-5434-6a04-0e8b1dcc65d1@redhat.com>
Date: Wed, 5 Jan 2022 10:22:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211227211642.994461-4-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 12/27/21 10:16 PM, Marc Zyngier wrote:
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
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8b600d82c1..84dd3b36fb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1678,6 +1678,11 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> +    if (!vms->highmem &&
> +        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
> +        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +        exit(EXIT_FAILURE);

The memory is composed of initial memory and device memory.
device memory is put after the initial memory but has a 1GB alignment
On top of that you have 1G page alignment per device memory slot

so potentially the highest mem address is larger than
vms->memmap[VIRT_MEM].base + ms->maxram_size.
I would rather do the check on device_memory_base + device_memory_size
> +    }
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> @@ -1707,7 +1712,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = base - 1;
> +    vms->highest_gpa = (vms->highmem ?
> +                        base :
> +                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
As per the previous comment this looks wrong to me if !highmem.

If !highmem, if RAM requirements are low we still could get benefit from
REDIST2 and HIGH ECAM which could fit within the 4GB limit. But maybe we
simply don't care? If we don't, why don't we simply skip the
extended_memmap overlay as suggested in v2? I did not get your reply sorry.

Thanks

Eric
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;


