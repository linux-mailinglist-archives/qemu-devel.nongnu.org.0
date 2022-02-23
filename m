Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A7F4C1DB2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 22:23:52 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMz71-000829-5z
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 16:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nMz64-0007AS-2M
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 16:22:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nMz5z-000723-MD
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 16:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645651361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=orkLAxSMdb1x/2lm5+m2G6Mjcoj2pY876Hc/XyD4tuU=;
 b=I76cTHXRWo+3nL0ikUb66klMCA3BNIBXprstfK0CXr1rh4rASZnnk6H7g7Z48Iav1VHGuB
 ZxCj+aIhtGfasZXvEYaPtqjuSqTXQpCGa0O4w/En2LYvcH3Qyzmsiu9pGCMGeVg1hb9d1W
 ANcztZ3HaBl25Y8yHiB26Ys6rdZKOWA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-zqa4G1_QOLy92CUKlHt0PQ-1; Wed, 23 Feb 2022 16:22:40 -0500
X-MC-Unique: zqa4G1_QOLy92CUKlHt0PQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 eg48-20020a05640228b000b00413041cd917so35875edb.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 13:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=orkLAxSMdb1x/2lm5+m2G6Mjcoj2pY876Hc/XyD4tuU=;
 b=fmMh1TsuoP8p3XovzvW0jy3+PsU7Agem05LPn4PFsbpuAotZ2c3gBncXjPAvO/k3Sa
 9xBp+9ZanFS6ujIT4PY78kjmpt77dxiaTZDWjxSvr8CepcDJjhigzyMhAwAezuWJTWge
 pSYALiSNaaROw9h9OTTLoVXMD2pnzaYqIpTZVHKdTjQ74gyKlMXM1PBsQvr+dX8n6BJS
 S/KMptHpFGKUqcus3FKNXvpEGckl4VLDo95B+LwZN53Igrja9R+GXMZnCgi4go7b9Kim
 3YtKYXkyTu3IbF/gKcLG/RMxjSBSBYAi6gARmC0x2ut684QadyZg7pMnmXMWG0h4Kum7
 AAgw==
X-Gm-Message-State: AOAM530IPy7J33q2j9QokVD2qO0Ps/2Q5JIbOfWOaRmzKha8GoXJ7yg1
 eAAxze8iyTlAWoH4am39hRJROadnvLiP6W94WxzUyzPdkpfqRnba0RUNEJVF7yohgE2/BtBvROY
 QFep+JUTkj5cCxQQ=
X-Received: by 2002:a50:c042:0:b0:409:be35:5a7b with SMTP id
 u2-20020a50c042000000b00409be355a7bmr1246824edd.379.1645651358930; 
 Wed, 23 Feb 2022 13:22:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZd5owG4oGnT4damZGxpy4x9WLrlaBpt6Xd6QD922P9eCv9ryM+h80r8oO0+zLV4XcBAfd6Q==
X-Received: by 2002:a50:c042:0:b0:409:be35:5a7b with SMTP id
 u2-20020a50c042000000b00409be355a7bmr1246798edd.379.1645651358651; 
 Wed, 23 Feb 2022 13:22:38 -0800 (PST)
Received: from redhat.com ([2.55.145.157])
 by smtp.gmail.com with ESMTPSA id 16sm326009eji.94.2022.02.23.13.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 13:22:37 -0800 (PST)
Date: Wed, 23 Feb 2022 16:22:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220223161744-mutt-send-email-mst@kernel.org>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220223184455.9057-5-joao.m.martins@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 06:44:53PM +0000, Joao Martins wrote:
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

Could you point me to which driver then reserves the
other regions on Linux for AMD platforms?

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
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c      | 79 +++++++++++++++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h |  4 +++
>  2 files changed, 83 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 360f4e10001b..6e4f5c87a2e5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -802,6 +802,78 @@ void xen_load_linux(PCMachineState *pcms)
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
> +                                uint64_t pci_hole64_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    ram_addr_t device_mem_size = 0;
> +    hwaddr base;
> +
> +    if (pcmc->has_reserved_memory &&
> +       (machine->ram_size < machine->maxram_size)) {
> +        device_mem_size = machine->maxram_size - machine->ram_size;
> +    }
> +
> +    base = ROUND_UP(x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
> +                    pcms->sgx_epc.size, 1 * GiB);
> +
> +    return base + device_mem_size + pci_hole64_size;
> +}
> +
> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
> +                                          uint64_t pci_hole64_size)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +    uint32_t eax, vendor[3];
> +
> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> +    if (!IS_AMD_VENDOR(vendor)) {
> +        return;
> +    }

Wait a sec, should this actually be tying things to the host CPU ID?
It's really about what we present to the guest though,
isn't it?

Also, can't we tie this to whether the AMD IOMMU is present?


> +
> +    if (x86_max_phys_addr(pcms, pci_hole64_size) < AMD_HT_START) {
> +        return;
> +    }
> +
> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -822,6 +894,8 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    x86_update_above_4g_mem_start(pcms, pci_hole64_size);
> +
>      /*
>       * Split single memory region and use aliases to address portions of it,
>       * done for backwards compatibility with older qemus.
> @@ -832,6 +906,11 @@ void pc_memory_init(PCMachineState *pcms,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +
> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
> +    }
> +
>      if (x86ms->above_4g_mem_size > 0) {
>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 9911d7c8711b..1acebc569b02 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -906,6 +906,10 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
>                           (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
>                           (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
> +#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
> +                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
> +                         (vendor[2]) == CPUID_VENDOR_AMD_3)
> +
>  
>  #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
>  #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */
> -- 
> 2.17.2


