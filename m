Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C5526231
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:42:09 +0200 (CEST)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUcR-0007wp-H5
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npUTs-00068j-RD
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npUTq-00084q-Fo
 for qemu-devel@nongnu.org; Fri, 13 May 2022 08:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652445192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHDZZb8JEiadWTA0EGbzou4OmnTpK16WETBmlnxK/PA=;
 b=MX1m98P5/ijkyeJNGudQJMTY+aA0aEV58t7Umvv4YTIiTD6CpuFB49Ovm3QjPV/oTSetZl
 aihWfcthvpAf1fJ+E5iBpnJ0uG2j//B6JJe1UF/vJaBFq1amDMwFHUNVRY0v/ILX0iKs8N
 H4BG7HScI46oo5adA5emJcOJArTxAcY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-i91jiCNEP4ObA9EaM4aL3A-1; Fri, 13 May 2022 08:33:10 -0400
X-MC-Unique: i91jiCNEP4ObA9EaM4aL3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so2875674wma.6
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fHDZZb8JEiadWTA0EGbzou4OmnTpK16WETBmlnxK/PA=;
 b=qxn6dzqp/rcKTa+QHMok64QG9BTVu/1bEDRyRp+QSymv3WcYd1zHqr/72zTiAD3NeG
 +A+xbYPF3OAwqobqLwPe4m609a6xU0weLbjWlagOzncB6MS85D27o6djgpMXVU+a7gP2
 Yf6Z9MsbKbR7NSyhWMfVZmE+Zj+z8AOeMW8zGBLSy4KwHhumdEj1wxZliC88CM+6toHU
 EbTRFxd3FiiY/LMRmmn/Ayseu7Eem4V+IKl9g8BEVFKTSH2w1/3sRzxwjj8ghdTUB7VA
 racRiwI4Lt/Dz7OYd0NYZ1fD1HCSwiRNNyXgnjUyl7bMtaQhAszsw+SoCs+qlugaLIJ2
 x0Cg==
X-Gm-Message-State: AOAM5302Cs55ltRG4ZSyDjzI1YiPTJYRklWGW76gqVgQBaMmddSak2+G
 dahorrO2ibSximK/aMaeWXWbqhPOrOHJlmEy+0vaGIW8mglNSTV/42NHPc/p2iEptyX05/HS6G7
 RPu1AfyLQcAzUY+Y=
X-Received: by 2002:a5d:58d0:0:b0:20a:e9f0:aea6 with SMTP id
 o16-20020a5d58d0000000b0020ae9f0aea6mr3855175wrf.60.1652445189470; 
 Fri, 13 May 2022 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaGxf6GWVBlGZepysOrUAAdFti1E+/jkO0iGLK/0p66vhrsMG2S4RdnQ16v261gOXyBpIGfA==
X-Received: by 2002:a5d:58d0:0:b0:20a:e9f0:aea6 with SMTP id
 o16-20020a5d58d0000000b0020ae9f0aea6mr3855151wrf.60.1652445189143; 
 Fri, 13 May 2022 05:33:09 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 f8-20020a7bcc08000000b003942a244f35sm5451016wmh.14.2022.05.13.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 05:33:08 -0700 (PDT)
Date: Fri, 13 May 2022 08:33:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v4 4/5] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220513083052-mutt-send-email-mst@kernel.org>
References: <20220420201138.23854-1-joao.m.martins@oracle.com>
 <20220420201138.23854-5-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420201138.23854-5-joao.m.martins@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Apr 20, 2022 at 09:11:37PM +0100, Joao Martins wrote:
> It is assumed that the whole GPA space is available to be DMA
> addressable, within a given address space limit, expect for a
> tiny region before the 4G. Since Linux v5.4, VFIO validates
> whether the selected GPA is indeed valid i.e. not reserved by
> IOMMU on behalf of some specific devices or platform-defined
> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>  -EINVAL.
> 
> AMD systems with an IOMMU are examples of such platforms and
> particularly may only have these ranges as allowed:
> 
> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> 
> We already account for the 4G hole, albeit if the guest is big
> enough we will fail to allocate a guest with  >1010G due to the
> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> 
> [*] there is another reserved region unrelated to HT that exists
> in the 256T boundaru in Fam 17h according to Errata #1286,
> documeted also in "Open-Source Register Reference for AMD Family
> 17h Processors (PUB)"
> 
> When creating the region above 4G, take into account that on AMD
> platforms the HyperTransport range is reserved and hence it
> cannot be used either as GPAs. On those cases rather than
> establishing the start of ram-above-4g to be 4G, relocate instead
> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
> Topology", for more information on the underlying restriction of
> IOVAs.
> 
> After accounting for the 1Tb hole on AMD hosts, mtree should
> look like:
> 
> 0000000000000000-000000007fffffff (prio 0, i/o):
> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> 0000010000000000-000001ff7fffffff (prio 0, i/o):
> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> 
> If the relocation is done, we also add the the reserved HT
> e820 range as reserved.
> 
> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation may be desired and the CPU wasn't configured
> with a big enough phys-bits, print an error message to the user
> and do not make the relocation of the above-4g-region if phys-bits
> is too low.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8eaa32ee2106..aac32ba0bd02 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -803,6 +803,110 @@ void xen_load_linux(PCMachineState *pcms)
>  #define PC_ROM_ALIGN       0x800
>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
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
> +static hwaddr x86_max_phys_addr(PCMachineState *pcms,
> +                                hwaddr above_4g_mem_start,
> +                                uint64_t pci_hole64_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    ram_addr_t device_mem_size = 0;
> +    hwaddr base;
> +
> +    if (!x86ms->above_4g_mem_size) {
> +       /*
> +        * 32-bit pci hole goes from
> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
> +        */
> +        return IO_APIC_DEFAULT_ADDRESS - 1;
> +    }
> +
> +    if (pcmc->has_reserved_memory &&
> +       (machine->ram_size < machine->maxram_size)) {
> +        device_mem_size = machine->maxram_size - machine->ram_size;
> +    }
> +
> +    base = ROUND_UP(above_4g_mem_start + x86ms->above_4g_mem_size +
> +                    pcms->sgx_epc.size, 1 * GiB);
> +
> +    return base + device_mem_size + pci_hole64_size;
> +}
> +
> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> +                                          uint64_t pci_hole64_size)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    CPUX86State *env = &X86_CPU(first_cpu)->env;
> +    hwaddr start = x86ms->above_4g_mem_start;
> +    hwaddr maxphysaddr, maxusedaddr;
> +
> +    /*
> +     * The HyperTransport range close to the 1T boundary is unique to AMD
> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> +     * to above 1T to AMD vCPUs only.
> +     */
> +    if (!IS_AMD_CPU(env)) {
> +        return;
> +    }
> +
> +    /* Bail out if max possible address does not cross HT range */
> +    if (x86_max_phys_addr(pcms, start, pci_hole64_size) < AMD_HT_START) {
> +        return;
> +    }
> +
> +    /*
> +     * Relocating ram-above-4G requires more than TCG_PHYS_BITS (40).
> +     * So make sure phys-bits is required to be appropriately sized in order
> +     * to proceed with the above-4g-region relocation and thus boot.
> +     */
> +    start = AMD_ABOVE_1TB_START;
> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
> +    maxusedaddr = x86_max_phys_addr(pcms, start, pci_hole64_size);
> +    if (maxphysaddr < maxusedaddr) {
> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
> +        exit(EXIT_FAILURE);
> +    }
> +
> +
> +    x86ms->above_4g_mem_start = start;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -823,6 +927,8 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
> @@ -833,6 +939,11 @@ void pc_memory_init(PCMachineState *pcms,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +
> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +    }


Causes a warning (and so a build failure) on 32 bit mingw:

../qemu/hw/i386/pc.c: In function 'pc_memory_init':
../qemu/hw/i386/pc.c:939:35: error: comparison is always false due to limited range of data type [-Werror=type-limits]
  939 |     if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
      |                                   ^~
cc1: all warnings being treated as errors


Looking at the code, how is it supposed to work on 32 bit?
It's ok if it does not work but I'd like a graceful failure
not a silent corruption.



> +
>      if (x86ms->above_4g_mem_size > 0) {
>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> -- 
> 2.17.2


