Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFF5783A0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:23:11 +0200 (CEST)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQiM-0008Fy-Sd
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQe0-0001TN-BM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oDQdx-0004Ni-DK
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658150315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9ZFrRWyZrnC7R01FUymfPZ0l2WcFso2UUw90Yc0Z40=;
 b=gXGpxOlhscyer2xL5hUGmDw8xjTYhsf7stkEROzjOUvBY0DiHOQ3iynapzuNLb+n43q4rj
 8E66f8Tv1bDtTmpY/NY3Uwle2LbLmpqgW7rwJAMlct/0K9v86SxI/9jcZ45O3IGPLNEkN2
 YwdGwjz2laG+dxXS1io7QRL9LbH25YI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-jngcoZw-Po6cp7uTsfbj3g-1; Mon, 18 Jul 2022 09:18:34 -0400
X-MC-Unique: jngcoZw-Po6cp7uTsfbj3g-1
Received: by mail-ed1-f71.google.com with SMTP id
 j6-20020a05640211c600b0043a8ea2c138so7873716edw.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9ZFrRWyZrnC7R01FUymfPZ0l2WcFso2UUw90Yc0Z40=;
 b=WxnqYF37NUGCuTtbbk7bVLnR9x/nYOAuZDNI/n+ZXFAZbQCIhAr/C1xDwtGEsnNocF
 QSyVxonGFR0F9EStkjBsAawgeqROinysNkJSUIfRq1xqgAUii8fwo9zbkfTro6CfAMVA
 oYwGMk4rR3nPYAekVHFHvCm5efyT+vH/YC2w+whLkFJGFTGylZrlEfX1PvMEmW6VBgxS
 NqsBn7rglV/cCaEtFlxLRS6xxMzLfxurqGuHTQ4QUIipd3jP1wMo9K8ukEUlTZJJc+/8
 ZWkak30OuC3qFqD7G95NIgbXwBFfiuzPIwEDfrQR5NgqYN2iZNsh131Nc0pPkEc/hfaB
 ddCA==
X-Gm-Message-State: AJIora/y/JhXl2TNGsI7kZYma5dPxpo+14Inxl+6v9DEbrxa8aV9VSv9
 LTIRaEWZN3lQPd6X8OCPcUXlWrWa9pMS0abn3NCS/WIoa2Liegv9YzkfFBmX89txAty3YZigJyJ
 GlXEQ9cfvOywft4c=
X-Received: by 2002:a05:6402:414b:b0:43b:6b1a:c230 with SMTP id
 x11-20020a056402414b00b0043b6b1ac230mr4327382eda.42.1658150313347; 
 Mon, 18 Jul 2022 06:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQiGSLxxZn4Zw1ivrXXyIFibnD1SKj0t+RhTvJs8qVqDHbvZGcItlH2vJ4aOlJDqPsFQlVnw==
X-Received: by 2002:a05:6402:414b:b0:43b:6b1a:c230 with SMTP id
 x11-20020a056402414b00b0043b6b1ac230mr4327358eda.42.1658150313122; 
 Mon, 18 Jul 2022 06:18:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 cd2-20020a170906b34200b0072a47b18f7csm5513339ejb.42.2022.07.18.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:18:32 -0700 (PDT)
Date: Mon, 18 Jul 2022 15:18:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v8 10/11] i386/pc: relocate 4g start to 1T where applicable
Message-ID: <20220718151831.28bbd8bd@redhat.com>
In-Reply-To: <20220715171628.21437-11-joao.m.martins@oracle.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-11-joao.m.martins@oracle.com>
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

On Fri, 15 Jul 2022 18:16:27 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> It is assumed that the whole GPA space is available to be DMA
> addressable, within a given address space limit, except for a
> tiny region before the 4G. Since Linux v5.4, VFIO validates
> whether the selected GPA is indeed valid i.e. not reserved by
> IOMMU on behalf of some specific devices or platform-defined
> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>  -EINVAL.
> 
> AMD systems with an IOMMU are examples of such platforms and
> particularly may only have these ranges as allowed:
> 
>         0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>         00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>         0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
> 
> We already account for the 4G hole, albeit if the guest is big
> enough we will fail to allocate a guest with  >1010G due to the
> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
> 
> [*] there is another reserved region unrelated to HT that exists
> in the 256T boundary in Fam 17h according to Errata #1286,
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
>          alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>         alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
> 
> If the relocation is done or the address space covers it, we
> also add the the reserved HT e820 range as reserved.
> 
> Default phys-bits on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough
> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
> ram-above-4g relocation is attempted and the CPU wasn't configured
> with a big enough phys-bits, an error message will be printed
> due to the maxphysaddr vs maxusedaddr check previously added.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/pc.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f30661b7f1a2..a71135930833 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -892,6 +892,40 @@ static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>      return pc_pci_hole64_start() + pci_hole64_size - 1;
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
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> @@ -915,6 +949,26 @@ void pc_memory_init(PCMachineState *pcms,
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> +    /*
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
>      /*
>       * phys-bits is required to be appropriately configured
>       * to make sure max used GPA is reachable.


