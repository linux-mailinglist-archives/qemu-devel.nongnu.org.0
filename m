Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461A587A02
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:43:14 +0200 (CEST)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoQi-0004PC-N4
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoOs-0002d8-MR
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oIoOq-00005J-HS
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659433274;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcS7wR86v9QRbiEB59dTOPyqPoZmvNKhmB9srERWZiI=;
 b=N+kG6dMoyzwp966lN4ALftLpG+08kofppoZ80bW0Ds8gwKZVBWyDUgXYXTP3N8T0e0e1sC
 DBjg93Pi3quOWCXVoyybqI2BzfknkPLf7JOsh01j04uUl1F19PXVZ9mX9UKcrUXF81a5yn
 Ml2MHWWTPjaA8nsB7GGTlsne92yx23Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-bNB78RqaMDqbM43ybendtQ-1; Tue, 02 Aug 2022 05:41:13 -0400
X-MC-Unique: bNB78RqaMDqbM43ybendtQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h18-20020adfaa92000000b0021ec200d50fso3343023wrc.14
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=dcS7wR86v9QRbiEB59dTOPyqPoZmvNKhmB9srERWZiI=;
 b=W0SucThDogg4JwQkx/o8zwj4NSt+qj8WXSOYSfQM91GUFtTvUX8yRFe3NkfXkowbQG
 tnyPvq725yqJtIa+JdS9Z7qx9TLPU3SlvUTKDldI6Xn1BPkKxH7n7pI43Txsnp2aaUjl
 Wrd/BFa8l1touVBW0K5mvIfE4soZ77oPI5xoh/EHbj9ydaJtTGAbCpx8B8ETjroi80Ue
 Sp0wmvs8wm89AexAPtOrxZV/NTbIEN1Dtgxv/fW+01m9VMR0CBrNVUiHo9QrOYp2IqOe
 UCys/blDFIOE6JSDhyaBWpl0Ur9J4DHsEsC4wRhHGDTydNqe0bBx/bR2cDUkz0Fomyb5
 Y6fg==
X-Gm-Message-State: AJIora99uWu19462Du9QpBbm+4SFINEoW0jlyO/gLPRx9NTAjjvEPVkn
 xjlD+h5tsCZ1StRLU14QU140VVnTWJVFlEbTIcRajKEpNle9YGcqFgesdseeciC4pI/x8KWNypD
 MHJrGjix0OxwkfBs=
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr13567095wmr.11.1659433272759; 
 Tue, 02 Aug 2022 02:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLfWqyPcXyaimCifR9ph97Dn58fonJCBdv/4ASWOV7ulMz7cNBvkM8UVfSjWXRi9oYZntxZw==
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr13567072wmr.11.1659433272424; 
 Tue, 02 Aug 2022 02:41:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 y8-20020adfdf08000000b0021e084d9133sm17260368wrl.27.2022.08.02.02.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 02:41:11 -0700 (PDT)
Message-ID: <dcca0792-4f62-2cf0-9080-309d2e78e690@redhat.com>
Date: Tue, 2 Aug 2022 11:41:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] hw/arm/virt: Improve address assignment for highmem
 IO regions
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, cohuck@redhat.com, zhenyzha@redhat.com,
 shan.gavin@gmail.com, Marc Zyngier <maz@kernel.org>
References: <20220802064529.547361-1-gshan@redhat.com>
 <20220802064529.547361-2-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220802064529.547361-2-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/2/22 08:45, Gavin Shan wrote:
> There are 3 highmem IO regions as below. They can be disabled in
> two situations: (a) The specific region is disabled by user. (b)
> The specific region doesn't fit in the PA space. However, the base
> address and highest_gpa are still updated no matter if the region
> is enabled or disabled. It's incorrectly incurring waste in the PA
> space.
If I am not wrong highmem_redists and highmem_mmio are not user selectable

Only highmem ecam depends on machine type & ACPI setup. But I would say
that in server use case it is always set. So is that optimization really
needed?
>
> Improve address assignment for highmem IO regions to avoid the waste
> in the PA space by putting the logic into virt_memmap_fits().
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 54 +++++++++++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9633f822f3..bc0cd218f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1688,6 +1688,34 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static void virt_memmap_fits(VirtMachineState *vms, int index,
> +                             bool *enabled, hwaddr *base, int pa_bits)
> +{
> +    hwaddr size = extended_memmap[index].size;
> +
> +    /* The region will be disabled if its size isn't given */
> +    if (!*enabled || !size) {
In which case do you have !size?
> +        *enabled = false;
> +        vms->memmap[index].base = 0;
> +        vms->memmap[index].size = 0;
It looks dangerous to me to reset the region's base and size like that.
for instance fdt_add_gic_node() will add dummy data in the dt.
> +        return;
> +    }
> +
> +    /*
> +     * Check if the memory region fits in the PA space. The memory map
> +     * and highest_gpa are updated if it fits. Otherwise, it's disabled.
> +     */
> +    *enabled = (ROUND_UP(*base, size) + size <= BIT_ULL(pa_bits));
using a 'fits' local variable would make the code more obvious I think
> +    if (*enabled) {
> +        *base = ROUND_UP(*base, size);
> +        vms->memmap[index].base = *base;
> +        vms->memmap[index].size = size;
> +        vms->highest_gpa = *base + size - 1;
> +
> +	*base = *base + size;
> +    }
> +}
> +
>  static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> @@ -1744,37 +1772,17 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      vms->highest_gpa = memtop - 1;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr size = extended_memmap[i].size;
> -        bool fits;
> -
> -        base = ROUND_UP(base, size);
> -        vms->memmap[i].base = base;
> -        vms->memmap[i].size = size;
> -
> -        /*
> -         * Check each device to see if they fit in the PA space,
> -         * moving highest_gpa as we go.
> -         *
> -         * For each device that doesn't fit, disable it.
> -         */
> -        fits = (base + size) <= BIT_ULL(pa_bits);
> -        if (fits) {
> -            vms->highest_gpa = base + size - 1;
> -        }
> -

we could avoid running the code below in case highmem is not set. We would need to reset that flags though.

>          switch (i) {
>          case VIRT_HIGH_GIC_REDIST2:
> -            vms->highmem_redists &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_redists, &base, pa_bits);
>              break;
>          case VIRT_HIGH_PCIE_ECAM:
> -            vms->highmem_ecam &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_ecam, &base, pa_bits);
>              break;
>          case VIRT_HIGH_PCIE_MMIO:
> -            vms->highmem_mmio &= fits;
> +            virt_memmap_fits(vms, i, &vms->highmem_mmio, &base, pa_bits);
>              break;
>          }
> -
> -        base += size;
>      }
>  
>      if (device_memory_size > 0) {
Thanks

Eric


