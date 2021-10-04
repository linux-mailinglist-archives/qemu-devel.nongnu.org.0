Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7A420954
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:31:13 +0200 (CEST)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXLFX-0000jq-Qv
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKwJ-0001Uh-Hh
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKwH-0001l0-8Q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 06:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633342275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vrwkiYNmH9gme5GZD+IE0TvO4gorlXeNfmKqQOUQ2A=;
 b=TR2WaA+qUVsOG0nnh6lPkR7gdKo1UqNrrlO8AHalFwGjF3/0vWctP6omRxeNXnKzmor7k6
 z1+ygRcHtgEiDTAo9PImbjk23z1FTH+6ptwhdIo5KGR+9dgUY5ql4Eem5usSUfTwkskoO/
 Ek8B85W5S3ijyXvHMOxw3pYiOHYw0vw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-1AKiqph3MryJ17jSzC5u9A-1; Mon, 04 Oct 2021 06:11:13 -0400
X-MC-Unique: 1AKiqph3MryJ17jSzC5u9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so9747433wmc.8
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 03:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7vrwkiYNmH9gme5GZD+IE0TvO4gorlXeNfmKqQOUQ2A=;
 b=OVfuASFJanhmnvH4AXcQCQ73HBx3rEQ1co9H9Vqd104okULROxq7bEv8ElbBCcDS2g
 VFtJ9tY9StytLF9QU2O63iIRpUYSolwWUgaM49wdpyKuQp8XFnrtO/fE1FKTaZKiy/cG
 Mx+fHSRP5mLtY2mkzkLsyC3wp/iGbXX+PLFJY7e5t4FaFVTZRBZlFR3MXdgQBqNicXY7
 3+3KG+hfY8aeIsU/z6QwRYgDKcooOhaWPLiM0cC9IS8a1NSoeywCnTrs9j8oO1BHCrJM
 T/4yNJfOCjs6VihXja3aL9uUf5CHM5y9stvqAjemN8mw6LzHXY2VS1fdwdSTBnoH1xov
 kpAQ==
X-Gm-Message-State: AOAM5335Br8rjIKT8r+/ZMzlKwCNd3Ytf1RTKA4y3YfHXEYR/SMpiMge
 84QcI5Gt6ayYO6M8l0OGRyqof/5oqJZ3V6oGLk0fNrMSr1TuGNUiNj3IR48rea5PthsPZ1XTg6u
 36GlvBZPxifeQQGY=
X-Received: by 2002:adf:a30b:: with SMTP id c11mr12974080wrb.289.1633342272562; 
 Mon, 04 Oct 2021 03:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq2FZ3CpAT5XH1tlJ1e5mgY4TiPIO/pbY6WYKk/ugWs9aFSuDXGQ1ktJJSgRf+gzBqButoyw==
X-Received: by 2002:adf:a30b:: with SMTP id c11mr12974021wrb.289.1633342272059; 
 Mon, 04 Oct 2021 03:11:12 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id t11sm13810480wrz.65.2021.10.04.03.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 03:11:11 -0700 (PDT)
Date: Mon, 4 Oct 2021 12:11:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 4/5] hw/arm/virt: Use the PA range to compute the
 memory map
Message-ID: <20211004101110.imtfcufnrdwhneev@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-5-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-5-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:04PM +0100, Marc Zyngier wrote:
> The highmem attribute is nothing but another way to express the
> PA range of a VM. To support HW that has a smaller PA range then
> what QEMU assumes, pass this PA range to the virt_set_memmap()
> function, allowing it to correctly exclude highmem devices
> if they are outside of the PA range.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt.c | 46 +++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9d2abdbd5f..a572e0c9d9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1610,10 +1610,10 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> -static void virt_set_memmap(VirtMachineState *vms)
> +static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
> -    hwaddr base, device_memory_base, device_memory_size;
> +    hwaddr base, device_memory_base, device_memory_size, memtop;
>      int i;
>  
>      vms->memmap = extended_memmap;
> @@ -1628,9 +1628,12 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> -    if (!vms->highmem &&
> -        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
> -        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +    if (!vms->highmem)
> +	    pa_bits = 32;
> +
> +    if (vms->memmap[VIRT_MEM].base + ms->maxram_size > BIT_ULL(pa_bits)) {
> +	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
> +			 pa_bits, vms->memmap[VIRT_MEM].base + ms->maxram_size - BIT_ULL(pa_bits));
>          exit(EXIT_FAILURE);
>      }
>      /*
> @@ -1645,7 +1648,7 @@ static void virt_set_memmap(VirtMachineState *vms)
>      device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
>  
>      /* Base address of the high IO region */
> -    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> +    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
>      if (base < device_memory_base) {
>          error_report("maxmem/slots too huge");
>          exit(EXIT_FAILURE);
> @@ -1662,9 +1665,17 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = (vms->highmem ?
> -                        base :
> -                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
> +
> +    /*
> +     * If base fits within pa_bits, all good. If it doesn't, limit it
> +     * to the end of RAM, which is guaranteed to fit within pa_bits.

We tested that

  vms->memmap[VIRT_MEM].base + ms->maxram_size

fits within pa_bits, but here we're setting highest_gpa to

  ROUND_UP(vms->memmap[VIRT_MEM].base + ms->ram_size, GiB) +
  ROUND_UP(ms->maxram_size - ms->ram_size + ms->ram_slots * GiB, GiB)

which will be larger. Shouldn't we test memtop instead to make this
guarantee?


> +     */
> +    if (base <= BIT_ULL(pa_bits)) {
> +        vms->highest_gpa = base -1;
> +    } else {
> +        vms->highest_gpa = memtop - 1;
> +    }
> +
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;
> @@ -1860,7 +1871,20 @@ static void machvirt_init(MachineState *machine)
>       * to create a VM with the right number of IPA bits.
>       */
>      if (!vms->memmap) {
> -        virt_set_memmap(vms);
> +        ARMCPU *armcpu = ARM_CPU(first_cpu);


I think it's too early to use first_cpu here (although, I'll admit I'm
always confused as to what gets initialized when...) Assuming we need to
realize the cpus first, then we don't do that until a bit further down
in this function. I wonder if it's possible to delay this memmap setup
until after cpu realization. I see the memmap getting used prior when
calculating virt_max_cpus, but that looks like it needs to be updated
anyway to take highmem into account as to whether or not we should
consider the high gicv3 redist region in the calculation.

> +        int pa_bits;
> +
> +        if (object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL)) {
> +            pa_bits = arm_pamax(armcpu);
> +        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
> +            /* v7 with LPAE */
> +            pa_bits = 40;
> +        } else {
> +            /* Anything else */
> +            pa_bits = 32;
> +        }
> +
> +        virt_set_memmap(vms, pa_bits);
>      }
>  
>      /* We can probe only here because during property set
> @@ -2596,7 +2620,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>      max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
>  
>      /* we freeze the memory map to compute the highest gpa */
> -    virt_set_memmap(vms);
> +    virt_set_memmap(vms, max_vm_pa_size);
>  
>      requested_pa_size = 64 - clz64(vms->highest_gpa);
>  
> -- 
> 2.30.2
> 

Thanks,
drew


