Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2357155F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:09:11 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBtG-0004Ep-CH
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBBqf-0002lu-Qb
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBBqZ-0003y5-97
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657616781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTf56C1mReEL9QNivYwxUflvuoVCqgZsBSBA/QM1a+M=;
 b=Y0s/GAmjKmdtHlhzA9SfMb2OwCPuuLAJ6O09axE3qadrA18/w7mjMwf8eFOAy5tKC2FsJA
 Ntt+MfRSdtaNFLEqIjVpXgdCxNI47QXk7QPw1q8t2/geHqIVDjVrnWK+5eyYHH8AQnL5dq
 Cxt//tQiU+YNloC/+qgnsMNLpEV8UXA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-3LYuVjnBNnyCdr6iwcJQaA-1; Tue, 12 Jul 2022 05:06:18 -0400
X-MC-Unique: 3LYuVjnBNnyCdr6iwcJQaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z24-20020a1c4c18000000b003a2e963c399so1642842wmf.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 02:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTf56C1mReEL9QNivYwxUflvuoVCqgZsBSBA/QM1a+M=;
 b=QpUIKFLqmRnVAjONPwZk50hswdMAXj4Zw16JvIbj6D2mGyZbXY0S/nZG7xwfbhQbVw
 LtTsRI4nKbPx1mghd9d13f9IOqk/7Rjm7p4xPbWdRTy2B+hCUsRRFkLKd9yMwHQ193id
 bFYMpwejYGoJa9Zy7d1urFBDw+3CRE4gGg5xd8+GdJHnTOmBmNljXbTRXdVaaM2Z0aGQ
 w5zAER6GOeIq1hGp6BUA58EQv5A3AarWotEt4fshkl8X4se7m6y85FQAa+STkoma7Mug
 +CTvL3DHJjwIU3J2czlbkd6g7muH4S8mLX0tR+xVQQShxVoV3hJ3/kTLO9iS26phgAwq
 XtpA==
X-Gm-Message-State: AJIora9ti7QKNQbM6dwlX1xOBHwg8whJ7NQ7P7E4T5D9Lr3JWbBGvuX1
 /ksS/idGZbifAQkXnAhvk00OZK1slXZga60OR+IlGUQcmt0h/kiu9g6ogZnUGNdV53kfY0dQH59
 L0fbXMmCApyMpz68=
X-Received: by 2002:a5d:4344:0:b0:21d:578a:d8b7 with SMTP id
 u4-20020a5d4344000000b0021d578ad8b7mr20264234wrr.108.1657616777602; 
 Tue, 12 Jul 2022 02:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v8AqWdEM3eMu0vL7W/OKqxDOvUc7b/D+SBGH4FKo80XftecD+njldgtylSN65TsEbCiNGUEw==
X-Received: by 2002:a5d:4344:0:b0:21d:578a:d8b7 with SMTP id
 u4-20020a5d4344000000b0021d578ad8b7mr20264201wrr.108.1657616777248; 
 Tue, 12 Jul 2022 02:06:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p188-20020a1c29c5000000b003a2cf1535aasm9008887wmp.17.2022.07.12.02.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 02:06:16 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:06:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220712110615.09c3e303@redhat.com>
In-Reply-To: <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 21:03:28 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 7/11/22 16:31, Joao Martins wrote:
> > On 7/11/22 15:52, Joao Martins wrote:  
> >> On 7/11/22 13:56, Igor Mammedov wrote:  
> >>> On Fri,  1 Jul 2022 17:10:13 +0100
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:
> >>>  
> >>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >>>> index a79fa1b6beeb..07025b510540 100644
> >>>> --- a/hw/i386/pc.c
> >>>> +++ b/hw/i386/pc.c
> >>>> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
> >>>>      return start;
> >>>>  }
> >>>>  
> >>>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
> >>>> +                                hwaddr above_4g_mem_start,
> >>>> +                                uint64_t pci_hole64_size)
> >>>> +{
> >>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>> +  
> >>>  
> >>>> +    if (!x86ms->above_4g_mem_size) {
> >>>> +        /*
> >>>> +         * 32-bit pci hole goes from
> >>>> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> >>>> +          */
> >>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
> >>>> +    }  
> >>> this hunk still bothers me (nothing changed wrt v5 issues around it)
> >>> issues recap: (
> >>>  1. correctness of it
> >>>  2. being limited to AMD only, while it seems pretty generic to me
> >>>  3. should be a separate patch
> >>> )
> >>>  
> >> How about I instead delete this hunk, and only call pc_set_amd_above_4g_mem_start()
> >> when there's @above_4g_mem_size ? Like in pc_memory_init() I would instead:
> >>
> >> if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
> >>     hwaddr start = x86ms->above_4g_mem_start;
> >>
> >>     if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
> >>         pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
> >>     }
> >>     ...
> >> }
> >>
> >> Given that otherwise it is impossible to ever encounter the 1T boundary.
> >>  
> > 
> > And while at it I would also remove any unneeded arguments from pc_max_used_gpa(),
> > which would turn the function into this:
> > 
> > +static hwaddr pc_max_used_gpa(uint64_t pci_hole64_size)
> > +{
> > +    return pc_pci_hole64_start() + pci_hole64_size;
> > +}
> > 
> > I would nuke the added helper if it wasn't for having 2 call sites in this patch.
> >   
> 
> Full patch diff further below -- after removing pc_max_used_gpa() and made further
> cleanups given this code can be much simpler after using this approach.
> 
> >> If not ... what other alternative would address your concern?
> >>  
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index e178bbc4129c..1ded3faeffe0 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -882,6 +882,62 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>      return start;
>  }
> 
> +/*
> + * AMD systems with an IOMMU have an additional hole close to the
> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
> + * with certain memory sizes. It's also wrong to use those IOVA ranges
> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
> + * The ranges reserved for Hyper-Transport are:
> + *
> + * FD_0000_0000h - FF_FFFF_FFFFh
> + *
> + * The ranges represent the following:
> + *
> + * Base Address   Top Address  Use
> + *
> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
> + * FD_F910_0000h FD_F91F_FFFFh System Management
> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
> + *
> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
> + * Table 3: Special Address Controls (GPA) for more information.
> + */
> +#define AMD_HT_START         0xfd00000000UL
> +#define AMD_HT_END           0xffffffffffUL
> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
> +
> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
> +                                          hwaddr maxusedaddr)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    hwaddr maxphysaddr;
> +
> +    /*
> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
> +     * So make sure phys-bits is required to be appropriately sized in order
> +     * to proceed with the above-4g-region relocation and thus boot.
> +     */
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>      hwaddr cxl_base, cxl_resv_end = 0;
> +    X86CPU *cpu = X86_CPU(first_cpu);
> 
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>      linux_boot = (machine->kernel_filename != NULL);
> 
>      /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {

it has the same issue as pc_max_used_gpa(), i.e.
  x86ms->above_4g_mem_size != 0
doesn't mean that there isn't any memory above 4Gb nor that there aren't
any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
max_used_gpa

I'd prefer to keep pc_max_used_gpa(),
idea but make it work for above cases and be more generic (i.e. not to be
tied to AMD only) since 'pc_max_used_gpa() < physbits' applies to equally
to AMD and Intel (and to trip it, one just have to configure small enough
physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)



> +        hwaddr maxusedaddr = pc_pci_hole64_start() + pci_hole64_size;
> +
> +        /* Bail out if max possible address does not cross HT range */
> +        if (maxusedaddr >= AMD_HT_START) {
> +            pc_set_amd_above_4g_mem_start(pcms, maxusedaddr);
> +        }
> +
> +        /*
> +         * Advertise the HT region if address space covers the reserved
> +         * region or if we relocate.
> +         */
> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
> +            cpu->phys_bits >= 40) {
> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +        }
> +    }
> +
> +    /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
>       */
> 


