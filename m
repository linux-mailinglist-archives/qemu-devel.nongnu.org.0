Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF754F7AF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:36:41 +0200 (CEST)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BDM-0001Ef-GF
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2B9p-00076d-GX
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2B9m-0007qH-Nq
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655469177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKiLon0RCzZEJNTTDGsmFW4SXeNv3haLJI9iU/YtDH4=;
 b=f9XboeWK8sJgDBVyGxWoPbKiRSG9AB3CTC8mb4fCM5WcKsn9EnX0cSKtX7OXR6r71Kii2c
 SMlbWpfB0R0b83EUp3i19Lw4gy8MpnDQg0XauJWXKI6jAku1RJLp5p498Q44ScVxCiq8dH
 Osbx8R/Wz9uaK2QhagOvTD9mTDQaTuM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-bujxboKzNe-HDKXKULvmIQ-1; Fri, 17 Jun 2022 08:32:54 -0400
X-MC-Unique: bujxboKzNe-HDKXKULvmIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h205-20020a1c21d6000000b0039c96ec500fso2645623wmh.8
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 05:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKiLon0RCzZEJNTTDGsmFW4SXeNv3haLJI9iU/YtDH4=;
 b=U+Yx38/R3aCrDJtDl+d3uv2l7Wi+9NvKtcFNF4jy3nJ4ES68tzGms6a2mtCvJf8EKc
 TqGwNqg+jivFV6se+6KaQNz0SPsUlxi2UStgHyNUMHpefa4rKyc3jxhJ9eVeqHGirj0C
 EqCO1iU1SwK7LjBAkGqIw371+I6tZh+bMF9YStkDAUWTWI/BshaNrsigJdrjqehQfk5z
 ESEoHa965tZihZYW9EA/xoneIdSmzC7C6p3LAtMgUNEDU8/ntLSH43Qe2krb0JiglTC9
 g2g5EtELdEUuk68t2Qa3jlr+pyhhycfqk9bXXY/rZ2x0hTwmBrsP004E/jA5CCJmghAO
 etTw==
X-Gm-Message-State: AOAM532QmLmX7TGuPKNy0joyp2u8uvhl3hiM6Zgpw77dXZbvI8lqplxp
 jim3Lze7A9HgaxYdzV3kZGr2zre8lppfDHPjzdWifqn8wlzjMa/l+bPO2E7JU6dwnCZhbGw3oCz
 XNK2rwdjHcKmcEwU=
X-Received: by 2002:a05:600c:4e91:b0:39c:7f1e:fb00 with SMTP id
 f17-20020a05600c4e9100b0039c7f1efb00mr20804510wmq.81.1655469172965; 
 Fri, 17 Jun 2022 05:32:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb5tBTAHXG6uISwW+N81JqwPz27zQHg8wmumPfzFJEO/eVtOR3kqQcajvkJ7vR4sogJ8bRVg==
X-Received: by 2002:a05:600c:4e91:b0:39c:7f1e:fb00 with SMTP id
 f17-20020a05600c4e9100b0039c7f1efb00mr20804466wmq.81.1655469172567; 
 Fri, 17 Jun 2022 05:32:52 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b0039c871d3191sm6409111wmp.3.2022.06.17.05.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 05:32:52 -0700 (PDT)
Date: Fri, 17 Jun 2022 14:32:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220617143251.5f064694@redhat.com>
In-Reply-To: <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
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

On Fri, 17 Jun 2022 13:18:38 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 6/16/22 15:23, Igor Mammedov wrote:
> > On Fri, 20 May 2022 11:45:31 +0100
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> It is assumed that the whole GPA space is available to be DMA
> >> addressable, within a given address space limit, expect for a  
> >                                                    ^^^ typo?
> >   
> Yes, it should have been 'except'.
> 
> >> tiny region before the 4G. Since Linux v5.4, VFIO validates
> >> whether the selected GPA is indeed valid i.e. not reserved by
> >> IOMMU on behalf of some specific devices or platform-defined
> >> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
> >>  -EINVAL.
> >>
> >> AMD systems with an IOMMU are examples of such platforms and
> >> particularly may only have these ranges as allowed:
> >>
> >> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> >> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> >> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> >>
> >> We already account for the 4G hole, albeit if the guest is big
> >> enough we will fail to allocate a guest with  >1010G due to the
> >> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> >>
> >> [*] there is another reserved region unrelated to HT that exists
> >> in the 256T boundaru in Fam 17h according to Errata #1286,  
> >               ^ ditto
> >   
> Fixed.
> 
> >> documeted also in "Open-Source Register Reference for AMD Family
> >> 17h Processors (PUB)"
> >>
> >> When creating the region above 4G, take into account that on AMD
> >> platforms the HyperTransport range is reserved and hence it
> >> cannot be used either as GPAs. On those cases rather than
> >> establishing the start of ram-above-4g to be 4G, relocate instead
> >> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
> >> Topology", for more information on the underlying restriction of
> >> IOVAs.
> >>
> >> After accounting for the 1Tb hole on AMD hosts, mtree should
> >> look like:
> >>
> >> 0000000000000000-000000007fffffff (prio 0, i/o):
> >> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> >> 0000010000000000-000001ff7fffffff (prio 0, i/o):
> >> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> >>
> >> If the relocation is done, we also add the the reserved HT
> >> e820 range as reserved.
> >>
> >> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
> >> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> >> ram-above-4g relocation may be desired and the CPU wasn't configured
> >> with a big enough phys-bits, print an error message to the user
> >> and do not make the relocation of the above-4g-region if phys-bits
> >> is too low.
> >>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 111 insertions(+)
> >>
> >> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> >> index af52d4ff89ef..652ae8ff9ccf 100644
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -796,6 +796,110 @@ void xen_load_linux(PCMachineState *pcms)
> >>  #define PC_ROM_ALIGN       0x800
> >>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
> >>  
> >> +/*
> >> + * AMD systems with an IOMMU have an additional hole close to the
> >> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> >> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> >> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
> >> + * with certain memory sizes. It's also wrong to use those IOVA ranges
> >> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
> >> + * The ranges reserved for Hyper-Transport are:
> >> + *
> >> + * FD_0000_0000h - FF_FFFF_FFFFh
> >> + *
> >> + * The ranges represent the following:
> >> + *
> >> + * Base Address   Top Address  Use
> >> + *
> >> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
> >> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
> >> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
> >> + * FD_F910_0000h FD_F91F_FFFFh System Management
> >> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
> >> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
> >> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
> >> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
> >> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
> >> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
> >> + *
> >> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
> >> + * Table 3: Special Address Controls (GPA) for more information.
> >> + */
> >> +#define AMD_HT_START         0xfd00000000UL
> >> +#define AMD_HT_END           0xffffffffffUL
> >> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
> >> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
> >> +
> >> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,  
> > 
> > s/x86_max_phys_addr/pc_max_used_gpa/
> >   
> Fixed.
> 
> >> +                                hwaddr above_4g_mem_start,
> >> +                                uint64_t pci_hole64_size)
> >> +{
> >> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >> +    MachineState *machine = MACHINE(pcms);
> >> +    ram_addr_t device_mem_size = 0;
> >> +    hwaddr base;
> >> +
> >> +    if (!x86ms->above_4g_mem_size) {
> >> +       /*
> >> +        * 32-bit pci hole goes from
> >> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> >> +        */
> >> +        return IO_APIC_DEFAULT_ADDRESS - 1;  
> > 
> > lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
> > that's located above it.
> >   
> 
> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
> otherwise. We won't hit the 1T hole, hence a nop.

I don't get the reasoning, can you clarify it pls?

>  Unless we plan on using
> pc_max_used_gpa() for something else other than this.

Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
large enough on CLI.

Looks like guesstimate we could use is taking pci64_hole_end as max used GPA

> 
> The alternative would be to just early bail out of pc_set_amd_above_4g_mem_start() if
> !above_4g_mem_size. And I guess in that case we can just remove pc_max_used_gpa()
> and replace with a:
> 
> 	max_used_gpa = pc_pci_hole64_start() + pci_hole64_size
> 
> Which makes this even simpler. thoughts?
> 
> >> +    }
> >> +
> >> +    if (pcmc->has_reserved_memory &&
> >> +       (machine->ram_size < machine->maxram_size)) {
> >> +        device_mem_size = machine->maxram_size - machine->ram_size;
> >> +    }
> >> +
> >> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
> >> +                    pcms->sgx_epc.size, 1 * GiB);
> >> +
> >> +    return base + device_mem_size + pci_hole64_size;  
> > 
> > it's not guarantied that pci64 hole starts right away device_mem,
> > but you are not 1st doing this assumption in code, maybe instead of
> > all above use existing 
> >    pc_pci_hole64_start() + pci_hole64_size
> > to gestimate max address 
> >   
> I've switched the block above to that instead.
> 
> >> +}
> >> +
> >> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> >> +                                          uint64_t pci_hole64_size)  
> > 
> > s/x86_update_above_4g_mem_start/pc_set_amd_above_4g_mem_start/
> >   
> Fixed.
> 
> >> +{
> >> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
> >> +    hwaddr start = x86ms->above_4g_mem_start;
> >> +    hwaddr maxphysaddr, maxusedaddr;  
> > 
> >   
> >> +    /*
> >> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> >> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> >> +     * to above 1T to AMD vCPUs only.
> >> +     */
> >> +    if (!IS_AMD_CPU(env)) {
> >> +        return;
> >> +    }  
> > 
> > move this to caller
> >   
> Done (same for the patch after this one):
> 
> -    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
> +    /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (IS_AMD_CPU(env)) {
> +        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
> +    }
> 
> 
> >> +    /* Bail out if max possible address does not cross HT range */
> >> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
> >> +        return;
> >> +    }
> >> +
> >> +    /*
> >> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
> >> +     * So make sure phys-bits is required to be appropriately sized in order
> >> +     * to proceed with the above-4g-region relocation and thus boot.
> >> +     */
> >> +    start = AMD_ABOVE_1TB_START;
> >> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> >> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
> >> +    if (maxphysaddr < maxusedaddr) {
> >> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> >> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
> >> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
> >> +        exit(EXIT_FAILURE);
> >> +    }
> >> +
> >> +
> >> +    x86ms->above_4g_mem_start = start;
> >> +}
> >> +
> >>  void pc_memory_init(PCMachineState *pcms,
> >>                      MemoryRegion *system_memory,
> >>                      MemoryRegion *rom_memory,
> >> @@ -817,6 +921,8 @@ void pc_memory_init(PCMachineState *pcms,
> >>  
> >>      linux_boot = (machine->kernel_filename != NULL);
> >>  
> >> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
> >> +
> >>      /*
> >>       * Split single memory region and use aliases to address portions of it,
> >>       * done for backwards compatibility with older qemus.
> >> @@ -827,6 +933,11 @@ void pc_memory_init(PCMachineState *pcms,
> >>                               0, x86ms->below_4g_mem_size);
> >>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
> >>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> >> +
> >> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
> >> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> >> +    }  
> > probably it is not necessary, but it doesn't hurt
> >   
> 
> virtual firmware can make better decisions to avoid reserved ranges.
> 
> I was actually thinking that if phys_bits was >= 40 that we would
> anyways add it.
> 
> >>      if (x86ms->above_4g_mem_size > 0) {
> >>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
> >>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",  
> >   
> 


