Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A763B1475
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 09:16:17 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvx7P-0000pJ-Vt
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 03:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvx4o-00082x-1b
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvx39-0006sQ-RU
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624432308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2FatcxNshpFxFJE8T+mUyJN8sMD7//FMA30t6ev6Wc=;
 b=M1FrtQkhrQ0of4skPkRB+raAmeZoTwSngVOkxvN/lVN1QiWzrlPMwYyaxF4P9++LSoMUeI
 Vk7tp+Yc6cemdqYOSaVwexK5PDOMoPf5UCwRbf9wQuu4Uxno4oPo3ycodPu/1JmfcLZ35B
 QxLDknGU9Hw7xAb2/TcS+mNeR0W2puI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-w9Eh15emMyaN_5jWP4rHVQ-1; Wed, 23 Jun 2021 03:11:47 -0400
X-MC-Unique: w9Eh15emMyaN_5jWP4rHVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF5911084F57;
 Wed, 23 Jun 2021 07:11:45 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B031D19C87;
 Wed, 23 Jun 2021 07:11:39 +0000 (UTC)
Date: Wed, 23 Jun 2021 09:11:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 1/6] i386/pc: Account IOVA reserved ranges above 4G
 boundary
Message-ID: <20210623091138.2f7828dd@redhat.com>
In-Reply-To: <20210622154905.30858-2-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-2-joao.m.martins@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 16:49:00 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> It is assumed that the whole GPA space is available to be
> DMA addressable, within a given address space limit. Since
> v5.4 based that is not true, and VFIO will validate whether
> the selected IOVA is indeed valid i.e. not reserved by IOMMU
> on behalf of some specific devices or platform-defined.
> 
> AMD systems with an IOMMU are examples of such platforms and
> particularly may export only these ranges as allowed:
> 
> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb)
> 
> We already know of accounting for the 4G hole, albeit if the
> guest is big enough we will fail to allocate a >1010G given
> the ~12G hole at the 1Tb boundary, reserved for HyperTransport.
> 
> When creating the region above 4G, take into account what
> IOVAs are allowed by defining the known allowed ranges
> and search for the next free IOVA ranges. When finding a
> invalid IOVA we mark them as reserved and proceed to the
> next allowed IOVA region.
> 
> After accounting for the 1Tb hole on AMD hosts, mtree should
> look like:
> 
> 0000000100000000-000000fcffffffff (prio 0, i/o):
> 	alias ram-above-4g @pc.ram 0000000080000000-000000fc7fffffff
> 0000010000000000-000001037fffffff (prio 0, i/o):
> 	alias ram-above-1t @pc.ram 000000fc80000000-000000ffffffffff

why not push whole ram-above-4g above 1Tb mark
when RAM is sufficiently large (regardless of used host),
instead of creating yet another hole and all complexity it brings along?


> Co-developed-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c         | 103 +++++++++++++++++++++++++++++++++++++++----
>  include/hw/i386/pc.h |  57 ++++++++++++++++++++++++
>  target/i386/cpu.h    |   3 ++
>  3 files changed, 154 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index c6d8d0d84d91..52a5473ba846 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -91,6 +91,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "e820_memory_layout.h"
>  #include "fw_cfg.h"
> +#include "target/i386/cpu.h"
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> @@ -860,6 +861,93 @@ void xen_load_linux(PCMachineState *pcms)
>      x86ms->fw_cfg = fw_cfg;
>  }
>  
> +struct GPARange usable_iova_ranges[] = {
> +    { .start = 4 * GiB, .end = UINT64_MAX, .name = "ram-above-4g" },
> +
> +/*
> + * AMD systems with an IOMMU have an additional hole close to the
> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
> + * on kernel version, VFIO may or may not let you DMA map those ranges.
> + * Starting v5.4 we validate it, and can't create guests on AMD machines
> + * with certain memory sizes. The range is:
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
> +#define DEFAULT_NR_USABLE_IOVAS 1
> +#define AMD_MAX_PHYSADDR_BELOW_1TB  0xfcffffffff
> +    { .start = 1 * TiB, .end = UINT64_MAX, .name = "ram-above-1t" },
> +};
> +
> + uint32_t nb_iova_ranges = DEFAULT_NR_USABLE_IOVAS;
> +
> +static void init_usable_iova_ranges(void)
> +{
> +    uint32_t eax, vendor[3];
> +
> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> +    if (IS_AMD_VENDOR(vendor)) {
> +        usable_iova_ranges[0].end = AMD_MAX_PHYSADDR_BELOW_1TB;
> +        nb_iova_ranges++;
> +    }
> +}
> +
> +static void add_memory_region(MemoryRegion *system_memory, MemoryRegion *ram,
> +                                hwaddr base, hwaddr size, hwaddr offset)
> +{
> +    hwaddr start, region_size, resv_start, resv_end;
> +    struct GPARange *range;
> +    MemoryRegion *region;
> +    uint32_t index;
> +
> +    for_each_usable_range(index, base, size, range, start, region_size) {
> +        region = g_malloc(sizeof(*region));
> +        memory_region_init_alias(region, NULL, range->name, ram,
> +                                 offset, region_size);
> +        memory_region_add_subregion(system_memory, start, region);
> +        e820_add_entry(start, region_size, E820_RAM);
> +
> +        assert(size >= region_size);
> +        if (size == region_size) {
> +            return;
> +        }
> +
> +        /*
> +         * There's memory left to create a region for, so there should be
> +         * another valid IOVA range left.  Creating the reserved region
> +         * would also be pointless.
> +         */
> +        if (index + 1 == nb_iova_ranges) {
> +            return;
> +        }
> +
> +        resv_start = start + region_size;
> +        resv_end = usable_iova_ranges[index + 1].start;
> +
> +        /* Create a reserved region in the IOVA hole. */
> +        e820_add_entry(resv_start, resv_end - resv_start, E820_RESERVED);
> +
> +        offset += region_size;
> +    }
> +}
> +
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -867,7 +955,7 @@ void pc_memory_init(PCMachineState *pcms,
>  {
>      int linux_boot, i;
>      MemoryRegion *option_rom_mr;
> -    MemoryRegion *ram_below_4g, *ram_above_4g;
> +    MemoryRegion *ram_below_4g;
>      FWCfgState *fw_cfg;
>      MachineState *machine = MACHINE(pcms);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> @@ -877,6 +965,8 @@ void pc_memory_init(PCMachineState *pcms,
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
>  
> +    init_usable_iova_ranges();
> +
>      linux_boot = (machine->kernel_filename != NULL);
>  
>      /*
> @@ -888,16 +978,11 @@ void pc_memory_init(PCMachineState *pcms,
>      memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
>                               0, x86ms->below_4g_mem_size);
>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
> +
>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>      if (x86ms->above_4g_mem_size > 0) {
> -        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
> -        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
> -                                 machine->ram,
> -                                 x86ms->below_4g_mem_size,
> -                                 x86ms->above_4g_mem_size);
> -        memory_region_add_subregion(system_memory, 0x100000000ULL,
> -                                    ram_above_4g);
> -        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
> +        add_memory_region(system_memory, machine->ram, 4 * GiB,
> +                          x86ms->above_4g_mem_size, x86ms->below_4g_mem_size);
>      }
>  
>      if (!pcmc->has_reserved_memory &&
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 1522a3359a93..73b8e2900c72 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -151,6 +151,63 @@ void pc_guest_info_init(PCMachineState *pcms);
>  #define PCI_HOST_BELOW_4G_MEM_SIZE     "below-4g-mem-size"
>  #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
>  
> +struct GPARange {
> +    uint64_t start;
> +    uint64_t end;
> +#define range_len(r) ((r).end - (r).start + 1)
> +
> +    const char *name;
> +};
> +
> +extern uint32_t nb_iova_ranges;
> +extern struct GPARange usable_iova_ranges[];
> +
> +static inline void next_iova_range_index(uint32_t i, hwaddr base, hwaddr size,
> +                                         hwaddr *start, hwaddr *region_size,
> +                                         uint32_t *index, struct GPARange **r)
> +{
> +    struct GPARange *range;
> +
> +    while (i < nb_iova_ranges) {
> +        range = &usable_iova_ranges[i];
> +        if (range->end >= base) {
> +            break;
> +        }
> +        i++;
> +    }
> +
> +    *index = i;
> +    /* index is out of bounds or no region left to process */
> +    if (i >= nb_iova_ranges || !size) {
> +        return;
> +    }
> +
> +    *start = MAX(range->start, base);
> +    *region_size = MIN(range->end - *start + 1, size);
> +    *r = range;
> +}
> +
> +/*
> + * for_each_usable_range() - iterates over usable IOVA regions
> + *
> + * @i:      range index within usable_iova_ranges
> + * @base:   requested address we want to use
> + * @size:   total size of the region with @base
> + * @r:      range indexed by @i within usable_iova_ranges
> + * @s:      calculated usable iova address base
> + * @i_size: calculated usable iova region size starting @s
> + *
> + * Use this iterator to walk through usable GPA ranges. Platforms
> + * such as AMD with IOMMU capable hardware restrict certain address
> + * ranges for Hyper Transport. This iterator helper lets user avoid
> + * using those said reserved ranges.
> + */
> +#define for_each_usable_range(i, base, size, r, s, i_size) \
> +    for (s = 0, i_size = 0, r = NULL, \
> +         next_iova_range_index(0, base, size, &s, &i_size, &i, &r); \
> +         i < nb_iova_ranges && size != 0; \
> +         size -= i_size, \
> +         next_iova_range_index(i + 1, base, size, &s, &i_size, &i, &r))
>  
>  void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
>                              MemoryRegion *pci_address_space);
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 1e11071d817b..f8f15a4523c6 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -869,6 +869,9 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
>                           (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
>                           (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
> +#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
> +                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
> +                         (vendor[2]) == CPUID_VENDOR_AMD_3)
>  
>  #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
>  #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */


