Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE00B49295B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:05:38 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9q3F-000309-L4
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:05:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otG-0003q3-S0
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otE-00005R-Tg
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642513872;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IV/Hx1jkX3VwLb2o92NQtn3ieGMfBmGV7PzMzvtGQKA=;
 b=M4VtEY7nHoQH12PcKeDfqtGmVoFraiyjIr/FFhs+CYzeQOAFTWplPBelVuqLSAjxUKLW18
 W00/5CYXqKD/WZJFlNh4/hNl7j1QoalrGfj6wcHAy2mfFlq4SZF+i17iavDHDOIolPBXPd
 TfI6GnyZV8VBNyEpK13MpkzpwburHVQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-rqJiLbCBM-es5EMWVdSaWQ-1; Tue, 18 Jan 2022 08:51:11 -0500
X-MC-Unique: rqJiLbCBM-es5EMWVdSaWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso6033442wmq.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IV/Hx1jkX3VwLb2o92NQtn3ieGMfBmGV7PzMzvtGQKA=;
 b=wYl4y2bz07iDGX0pJDDF1GkBoJeKjniKr1o5ZHqL0DHhX/xMTJvOnPQoZkRQSCvF1Y
 UwffDin+4DMpRAGlf2mteYOgXA96YqBjhQIIeFcKA+ZKnSJKRORGMbygChB3obhiR5Et
 OEwr6dLzKPx1dZbkzmceb4M8uSuhTK9wnfvcTih2bNHocTQ+/DPCuNlzfBhdNpgm/q15
 OpTh5I5b8VDs3Rd/LCNSMCG2ZulR6Q+8kx6vC5XKCutB+A5innXR+ko6585LbFw1LHcv
 VPZZPcbPmWB5f+RLjSxCvUcBmIJNhUh6qB2+kVl1PlYXai0uq/kHKRUBnRuc2ec4C2lo
 03yw==
X-Gm-Message-State: AOAM532GNSE8vZTvRWPt6cdBvT1guCjP5wvFFylOstNpY8kooaBUyZBP
 sdt9Hp7Ik7bdooEFou30fjHONnpW3PW4eVb8+uhuKs4dNoTaP5mx/NPtqzXg8RLqAHxqwfyZTPR
 8SpYNuB1UwGNNOoE=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr13126884wrp.295.1642513870007; 
 Tue, 18 Jan 2022 05:51:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrIGdSslb48O5M3ejy7PJ5Kh04oTQTMGjFS5pktNugCXQuFWbbbLr9Z35fe4Tdbnb3eXzt1A==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr13126862wrp.295.1642513869772; 
 Tue, 18 Jan 2022 05:51:09 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id g17sm3527084wmq.9.2022.01.18.05.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:51:09 -0800 (PST)
Subject: Re: [PATCH v5 4/6] hw/arm/virt: Use the PA range to compute the
 memory map
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220114140741.1358263-1-maz@kernel.org>
 <20220114140741.1358263-5-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <027ca7c0-b71a-7dfd-cd39-1dd4e78cc390@redhat.com>
Date: Tue, 18 Jan 2022 14:51:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220114140741.1358263-5-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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



On 1/14/22 3:07 PM, Marc Zyngier wrote:
> The highmem attribute is nothing but another way to express the
> PA range of a VM. To support HW that has a smaller PA range then
> what QEMU assumes, pass this PA range to the virt_set_memmap()
> function, allowing it to correctly exclude highmem devices
> if they are outside of the PA range.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Thanks

Eric
> ---
>  hw/arm/virt.c | 64 +++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 52 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ecc3e3e5b0..a427676b50 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1660,7 +1660,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> -static void virt_set_memmap(VirtMachineState *vms)
> +static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>  {
>      MachineState *ms = MACHINE(vms);
>      hwaddr base, device_memory_base, device_memory_size, memtop;
> @@ -1678,6 +1678,14 @@ static void virt_set_memmap(VirtMachineState *vms)
>          exit(EXIT_FAILURE);
>      }
>  
> +    /*
> +     * !highmem is exactly the same as limiting the PA space to 32bit,
> +     * irrespective of the underlying capabilities of the HW.
> +     */
> +    if (!vms->highmem) {
> +        pa_bits = 32;
> +    }
> +
>      /*
>       * We compute the base of the high IO region depending on the
>       * amount of initial and device memory. The device memory start/size
> @@ -1691,8 +1699,9 @@ static void virt_set_memmap(VirtMachineState *vms)
>  
>      /* Base address of the high IO region */
>      memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
> -    if (!vms->highmem && memtop > 4 * GiB) {
> -        error_report("highmem=off, but memory crosses the 4GiB limit\n");
> +    if (memtop > BIT_ULL(pa_bits)) {
> +	    error_report("Addressing limited to %d bits, but memory exceeds it by %llu bytes\n",
> +			 pa_bits, memtop - BIT_ULL(pa_bits));
>          exit(EXIT_FAILURE);
>      }
>      if (base < device_memory_base) {
> @@ -1711,7 +1720,13 @@ static void virt_set_memmap(VirtMachineState *vms)
>          vms->memmap[i].size = size;
>          base += size;
>      }
> -    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
> +
> +    /*
> +     * If base fits within pa_bits, all good. If it doesn't, limit it
> +     * to the end of RAM, which is guaranteed to fit within pa_bits.
> +     */
> +    vms->highest_gpa = (base <= BIT_ULL(pa_bits) ? base : memtop) - 1;
> +
>      if (device_memory_size > 0) {
>          ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
>          ms->device_memory->base = device_memory_base;
> @@ -1902,12 +1917,43 @@ static void machvirt_init(MachineState *machine)
>      unsigned int smp_cpus = machine->smp.cpus;
>      unsigned int max_cpus = machine->smp.max_cpus;
>  
> +    if (!cpu_type_valid(machine->cpu_type)) {
> +        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> +        exit(1);
> +    }
> +
> +    possible_cpus = mc->possible_cpu_arch_ids(machine);
> +
>      /*
>       * In accelerated mode, the memory map is computed earlier in kvm_type()
>       * to create a VM with the right number of IPA bits.
>       */
>      if (!vms->memmap) {
> -        virt_set_memmap(vms);
> +        Object *cpuobj;
> +        ARMCPU *armcpu;
> +        int pa_bits;
> +
> +        /*
> +         * Instanciate a temporary CPU object to find out about what
> +         * we are about to deal with. Once this is done, get rid of
> +         * the object.
> +         */
> +        cpuobj = object_new(possible_cpus->cpus[0].type);
> +        armcpu = ARM_CPU(cpuobj);
> +
> +        if (object_property_get_bool(cpuobj, "aarch64", NULL)) {
> +            pa_bits = arm_pamax(armcpu);
> +        } else if (arm_feature(&armcpu->env, ARM_FEATURE_LPAE)) {
> +            /* v7 with LPAE */
> +            pa_bits = 40;
> +        } else {
> +            /* Anything else */
> +            pa_bits = 32;
> +        }
> +
> +        object_unref(cpuobj);
> +
> +        virt_set_memmap(vms, pa_bits);
>      }
>  
>      /* We can probe only here because during property set
> @@ -1915,11 +1961,6 @@ static void machvirt_init(MachineState *machine)
>       */
>      finalize_gic_version(vms);
>  
> -    if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
> -        exit(1);
> -    }
> -
>      if (vms->secure) {
>          /*
>           * The Secure view of the world is the same as the NonSecure,
> @@ -1989,7 +2030,6 @@ static void machvirt_init(MachineState *machine)
>  
>      create_fdt(vms);
>  
> -    possible_cpus = mc->possible_cpu_arch_ids(machine);
>      assert(possible_cpus->len == max_cpus);
>      for (n = 0; n < possible_cpus->len; n++) {
>          Object *cpuobj;
> @@ -2646,7 +2686,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>      max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
>  
>      /* we freeze the memory map to compute the highest gpa */
> -    virt_set_memmap(vms);
> +    virt_set_memmap(vms, max_vm_pa_size);
>  
>      requested_pa_size = 64 - clz64(vms->highest_gpa);
>  


