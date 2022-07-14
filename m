Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F5574C7B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 13:53:03 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBxOw-0000Xr-SB
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 07:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBxMX-00076Q-FV
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 07:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oBxMR-0003HN-J6
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 07:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657799405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npg3DHcQuPOkt5BuwVaJ95++HNw0c/gFe6TjCSZOU0U=;
 b=JKkzFTYoh+hllBgKx4iWLIfbjR2cVvsFL0aw2rKPfFwzZ5ObCgk7n9/IvBsgsiTx7g1SFm
 10FcSKj7YRtRNWWPiV7MQG6a1xCHGcBbRX0HeCMmP1nX2JTY85F4/1H65jzGOmyea/GSMQ
 DjWorhnk2V9kYE6jW+j0smmmAZP3xc0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-IvbaWAcRPvG9320AJkDelQ-1; Thu, 14 Jul 2022 07:50:03 -0400
X-MC-Unique: IvbaWAcRPvG9320AJkDelQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 j6-20020a05640211c600b0043a8ea2c138so1372464edw.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 04:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=npg3DHcQuPOkt5BuwVaJ95++HNw0c/gFe6TjCSZOU0U=;
 b=Wc5txScDkpiSLjWAyfrKpA8ouXc2tNQpOt9Y9AMQZw1MLfJ+m51uyYwkF9ebtDFbx8
 /033PZ+P34BRZKSD180dZi/DyqfETCInyeL3o3a4YIPLQLytqcXaa3Ml8iAP9iqlSEsR
 PeQx+haOIiSPbKKszBD+P67vs5WbCr289LKKR3FbdiNmCMG8qg600KmblcjHFlhvMVX+
 UigtPEW2ulkqLLg0g3Jx9mQWVcrDdRkEwQgdGoePMgcNgkRmF/eFARTSdTiC5CQioBMf
 lYCOoLLlnqAsZgPHEeZtJtDpGApelb3k0QrZzYFaFe/Pfr5kQPcqB9b0fKhiTynfEz4J
 iOMA==
X-Gm-Message-State: AJIora+H/J8ZL9nO7Y8KQiXOZBfGCdP2EB7kar0bZazy78DH5GLQ6rgu
 vwoS48hzDfAkVgW7rW/9M2DCjGBf0uBV7wizfCb6y9rbngUN/aeDiRVJ+kaZHoNb3bmk8KD3D/F
 g1ahjaEEzrWM7rdY=
X-Received: by 2002:a17:907:969f:b0:72b:7141:d6ef with SMTP id
 hd31-20020a170907969f00b0072b7141d6efmr8616015ejc.501.1657799402442; 
 Thu, 14 Jul 2022 04:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqBwJ+RCkTgM1s1Z6N9xxWOkqDzeMv6d/rU/ArR+ODrHQauus9FNLljByUPNnd0kmDLmsDzw==
X-Received: by 2002:a17:907:969f:b0:72b:7141:d6ef with SMTP id
 hd31-20020a170907969f00b0072b7141d6efmr8615979ejc.501.1657799402022; 
 Thu, 14 Jul 2022 04:50:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 kz20-20020a17090777d400b00704fa2748ffsm623890ejc.99.2022.07.14.04.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 04:50:01 -0700 (PDT)
Date: Thu, 14 Jul 2022 13:50:00 +0200
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
Message-ID: <20220714135000.0b669b2a@redhat.com>
In-Reply-To: <22b27ecb-3ce4-bd47-90d5-4784468a8776@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
 <addb6d9f-5d04-0280-a0b4-79edd888faeb@oracle.com>
 <20220714112820.2cf526ea@redhat.com>
 <19de0ed6-f29a-2f59-658d-aeb694043038@oracle.com>
 <22b27ecb-3ce4-bd47-90d5-4784468a8776@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 14 Jul 2022 11:47:19 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 7/14/22 10:54, Joao Martins wrote:
> > On 7/14/22 10:28, Igor Mammedov wrote:  
> >> On Tue, 12 Jul 2022 12:35:49 +0100
> >> Joao Martins <joao.m.martins@oracle.com> wrote:  
> >>> On 7/12/22 11:01, Joao Martins wrote:  
> >>>> On 7/12/22 10:06, Igor Mammedov wrote:    
> >>>>> On Mon, 11 Jul 2022 21:03:28 +0100
> >>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>>> On 7/11/22 16:31, Joao Martins wrote:    
> >>>>>>> On 7/11/22 15:52, Joao Martins wrote:      
> >>>>>>>> On 7/11/22 13:56, Igor Mammedov wrote:      
> >>>>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
> >>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
> >>>>>>  void pc_memory_init(PCMachineState *pcms,
> >>>>>>                      MemoryRegion *system_memory,
> >>>>>>                      MemoryRegion *rom_memory,
> >>>>>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
> >>>>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>>>>      hwaddr cxl_base, cxl_resv_end = 0;
> >>>>>> +    X86CPU *cpu = X86_CPU(first_cpu);
> >>>>>>
> >>>>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
> >>>>>>                                  x86ms->above_4g_mem_size);
> >>>>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
> >>>>>>      linux_boot = (machine->kernel_filename != NULL);
> >>>>>>
> >>>>>>      /*
> >>>>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> >>>>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> >>>>>> +     * to above 1T to AMD vCPUs only.
> >>>>>> +     */
> >>>>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {    
> >>>>>
> >>>>> it has the same issue as pc_max_used_gpa(), i.e.
> >>>>>   x86ms->above_4g_mem_size != 0
> >>>>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
> >>>>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
> >>>>> max_used_gpa
> >>>>> I'd prefer to keep pc_max_used_gpa(),
> >>>>> idea but make it work for above cases and be more generic (i.e. not to be
> >>>>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
> >>>>> applies to equally
> >>>>> to AMD and Intel (and to trip it, one just have to configure small enough
> >>>>> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
> >>>>>    
> >>>> I can reproduce the issue you're thinking with basic memory hotplug.     
> >>>
> >>> I was mislead by a bug that only existed in v6. Which I fixed now.
> >>> So any bug possibility with hotplug, SGX and CXL, or pcihole64 is simply covered with:
> >>>
> >>> 	pc_pci_hole64_start() + pci_hole64_size;
> >>>
> >>> which is what pc_max_used_gpa() does. This works fine /without/ above_4g_mem_size != 0
> >>> check even without above_4g_mem_size (e.g. mem=2G,maxmem=1024G).
> >>>
> >>> And as a reminder: SGX, hotplug, CXL and pci-hole64 *require* memory above 4G[*]. And part
> >>> of the point of us moving to pc_pci_hole64_start() was to make these all work in a generic
> >>> way.
> >>>
> >>> So I've removed the x86ms->above_4g_mem_size != 0 check. Current patch diff pasted at the end.
> >>>
> >>> [*] As reiterated here:
> >>>  
> >>>> Let me see
> >>>> what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.
> >>>>     
> >>>
> >>> I was over-complicating things here. It turns out nothing else is needed aside in the
> >>> context of 1T hole.
> >>>
> >>> This is because I only need to check address space limits (as consequence of
> >>> pc_set_amd_above_4g_mem_start()) when pc_max_used_gpa() surprasses HT_START. Which
> >>> requires fundamentally a value closer to 1T well beyond what 32-bit can cover. So on
> >>> 32-bit guests this is never true and thus it things don't change behaviour from current
> >>> default for these guests. And thus I won't break qtests and things fail correctly in the
> >>> right places.
> >>>
> >>> Now I should say that pc_max_used_gpa() is still not returning the accurate 32-bit guest
> >>> max used GPA value, given that I return pci hole64 end (essentially). Do you still that
> >>> addressed out of correctness even if it doesn't matter much for the 64-bit 1T case?
> >>>
> >>> If so, our only option seems to be to check phys_bits <= 32 and return max CPU
> >>> boundary there? Unless you have something enterily different in mind?
> >>>  
> >>>> I would really love to have v7.1.0 with this issue fixed but I am not very
> >>>> confident it is going to make it :(
> >>>>
> >>>> Meanwhile, let me know if you have thoughts on this one:
> >>>>
> >>>> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
> >>>>
> >>>> I am going to assume that if no comments on the above that I'll keep things as is.
> >>>>
> >>>> And also, whether I can retain your ack with Bernhard's suggestion here:
> >>>>
> >>>> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
> >>>>     
> >>>
> >>>  
> 
> [...]
> 
> >>>      /*
> >>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> >>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> >>> +     * to above 1T to AMD vCPUs only.
> >>> +     */
> >>> +    if (IS_AMD_CPU(&cpu->env)) {
> >>> +        /* Bail out if max possible address does not cross HT range */
> >>> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
> >>> +            pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);  
> >>
> >> I'd replace call with 
> >>    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> >>  
> > See below.
> >   
> >>> +        }
> >>> +
> >>> +        /*
> >>> +         * Advertise the HT region if address space covers the reserved
> >>> +         * region or if we relocate.
> >>> +         */
> >>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
> >>> +            cpu->phys_bits >= 40) {
> >>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> >>> +        }
> >>> +    }  
> >>
> >> and then here check that pc_max_used_gpa() fits into phys_bits
> >> which should cover AMD case and case where pci64_hole goes beyond 
> >> supported address range even without 1TB hole
> >>  
> > 
> > When you say 'here' you mean outside IS_AMD_CPU() ?
> > 
> > If we put outside (and thus generic) where it was ... it will break qtests
> > as pc_max_used_gpa() does not handle 32-bit case, as mentioned earlier.
> > Hence why it is inside pc_set_amd_above_4g_mem_start(), or in other words
> > inside the scope of:
> > 
> > 	if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START)
> > 
> > Which means I will for sure have a pci_hole64.
> > Making it generic to /outside/ this conditional requires addressing this
> > earlier comment I made:
> > 
> >  our only option seems to be to check phys_bits <= 32 and return max CPU
> >  boundary there?
> >   
> 
> Here's how this patch looks like, after your comments and the above issue
> I am talking. The added part is inside pc_max_used_gpa().
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 668e15c8f2a6..2d85c66502d5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -881,6 +881,51 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>      return start;
>  }
> 
> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
> +{
> +    X86CPU *cpu = X86_CPU(first_cpu);
> +
> +    if (cpu->phys_bits <= 32) {

> +        return (1ULL << cpu->phys_bits) - 1ULL;
Add a comment here as to why this value is returned

> +    }
> +
> +    return pc_pci_hole64_start() + pci_hole64_size;
> +}
> +
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
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -895,7 +940,9 @@ void pc_memory_init(PCMachineState *pcms,
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
> +    hwaddr maxphysaddr, maxusedaddr;
>      hwaddr cxl_base, cxl_resv_end = 0;
> +    X86CPU *cpu = X86_CPU(first_cpu);
> 
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
> @@ -903,6 +950,40 @@ void pc_memory_init(PCMachineState *pcms,
>      linux_boot = (machine->kernel_filename != NULL);
> 
>      /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (IS_AMD_CPU(&cpu->env)) {
> +        /* Bail out if max possible address does not cross HT range */
> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
> +            x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> +        }
> +
> +        /*
> +         * Advertise the HT region if address space covers the reserved
> +         * region or if we relocate.
> +         */
> +        if (cpu->phys_bits >= 40) {
> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +        }
> +    }
> +
> +    /*
> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
> +     * So make sure phys-bits is required to be appropriately sized in order
> +     * to proceed with the above-4g-region relocation and thus boot.
> +     */
> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
> +    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u)",
> +                     maxphysaddr, maxusedaddr, cpu->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +

it looks fine to me

> +    /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
>       */
> 


