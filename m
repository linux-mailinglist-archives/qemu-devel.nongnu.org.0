Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74F4BD6B0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:00:31 +0100 (CET)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM2gN-0007ip-Ub
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:00:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nM2eK-000717-Pq
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 01:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nM2eE-0003zo-Gn
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 01:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645426691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pb+ozWp6yv7XmvpZ5Vu2dU8XmJu9PXGc4wD6hwll480=;
 b=eTwEjT5zTKMHrspzfx6FqPrbASRFwtfp5hkg066M08MlHpYd9DWtd0AIMC0oAbcEPMgSl1
 SH17bXGnzUsY6xy7eq9p9wp1TubkgrZ/Y9OzzKtCeNEoHJFpPEXtXWTgGufuXLytlBm1i6
 zaROf4DRJjPiXIIZHk2+I6QwDKZBokw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-K6AJYVTVOSGbne7k8yLHDQ-1; Mon, 21 Feb 2022 01:58:10 -0500
X-MC-Unique: K6AJYVTVOSGbne7k8yLHDQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso4243708ejd.23
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 22:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pb+ozWp6yv7XmvpZ5Vu2dU8XmJu9PXGc4wD6hwll480=;
 b=vpNqbG8hcHiPIUFnHhbFelzcnnfnqAOyfUQ5Apv9vpuOp30rMii18SQ8/qjDfnjV8Z
 GFTV4Te+kebpYSS/IiDZcQN48qqBUp+tbqTIXwgvWxhJusZIUBlxedlXFMPRpOp7/6ab
 OQRANzqsLpcgGHZgkTHSEzLAgNKZvhTZ5SALcSZpncuGrtWhFev/2/FGUKBpTVyOwUoQ
 7FLiePAoU35aiYmZnXbXkrTmb0aOL5YxuCdtUasn0wquNTVO5su2Si3GEED0bF7E3hwg
 KMVBIpsGFA0DprIW8V4490VmC8Wfy6bE8vrqd9Vq2duX/zrjvK81OAjvaZlKIbRyXTF+
 Zazg==
X-Gm-Message-State: AOAM532l5+XpeT7q2UwY0bBvRjwMXJONZHdqUD7bnOBVAvzZGRLEac0s
 sva3YTBOCRP9z4xgibgdI7L8jLLNbjKMcrHcoATAbdS/BNMY+ZBpet2KZlMQOYVN68SG/V0uCRQ
 CzbSUprglh364saY=
X-Received: by 2002:a50:ec81:0:b0:410:ae5d:88f6 with SMTP id
 e1-20020a50ec81000000b00410ae5d88f6mr20025091edr.261.1645426689255; 
 Sun, 20 Feb 2022 22:58:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0R7jA2pCzYHQdkVh61PKd+xXDA6uEUN8ANldm6XkaMEoTkuXkI95gSNwAOGCWb5N8ZbpXMw==
X-Received: by 2002:a50:ec81:0:b0:410:ae5d:88f6 with SMTP id
 e1-20020a50ec81000000b00410ae5d88f6mr20025074edr.261.1645426688997; 
 Sun, 20 Feb 2022 22:58:08 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z8sm4801382ejc.151.2022.02.20.22.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 22:58:08 -0800 (PST)
Date: Mon, 21 Feb 2022 07:58:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Message-ID: <20220221075807.7415884a@redhat.com>
In-Reply-To: <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 17:12:21 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 2/14/22 15:31, Igor Mammedov wrote:
> > On Mon, 14 Feb 2022 15:05:00 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> On 2/14/22 14:53, Igor Mammedov wrote:  
> >>> On Mon,  7 Feb 2022 20:24:20 +0000
> >>> Joao Martins <joao.m.martins@oracle.com> wrote:  
> >>>> +{
> >>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> >>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> >>>> +    ram_addr_t device_mem_size = 0;
> >>>> +    uint32_t eax, vendor[3];
> >>>> +
> >>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
> >>>> +    if (!IS_AMD_VENDOR(vendor)) {
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    if (pcmc->has_reserved_memory &&
> >>>> +       (machine->ram_size < machine->maxram_size)) {
> >>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
> >>>> +    }
> >>>> +
> >>>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
> >>>> +         device_mem_size) < AMD_HT_START) {    
> >>>     
> >> And I was at two minds on this one, whether to advertise *always*
> >> the 1T hole, regardless of relocation. Or account the size
> >> we advertise for the pci64 hole and make that part of the equation
> >> above. Although that has the flaw that the firmware at admin request
> >> may pick some ludricous number (limited by maxphysaddr).  
> > 
> > it this point we have only pci64 hole size (machine property),
> > so I'd include that in equation to make firmware assign
> > pci64 aperture above HT range.
> > 
> > as for checking maxphysaddr, we can only check 'default' PCI hole
> > range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
> > and hard error on it.
> >   
> 
> Igor, in the context of your comment above, I'll be introducing another
> preparatory patch that adds up pci_hole64_size to pc_memory_init() such
> that all used/max physaddr space checks are consolidated in pc_memory_init().
>
> To that end, the changes involve mainly moves the the pcihost qdev creation
> to be before pc_memory_init(). Q35 just needs a 2-line order change. i440fx
> needs slightly more of a dance to extract that from i440fx_init() and also
> because most i440fx state is private (hence the new helper for size). But
> the actual initialization of I440fx/q35 pci host is still after pc_memory_init(),
> it is just to extra pci_hole64_size from the object + user passed args (-global etc).

Shuffling init order is looks too intrusive and in practice
quite risky.
How about moving maxphysaddr check to pc_machine_done() instead?
(this way you won't have to move pcihost around)


> Raw staging changes below the scissors mark so far.
> 
> -->8--  
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b2e43eba1106..902977081350 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -875,7 +875,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms)
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory)
> +                    MemoryRegion **ram_memory,
> +                    uint64_t pci_hole64_size)
>  {
>      int linux_boot, i;
>      MemoryRegion *option_rom_mr;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index d9b344248dac..5a608e30e28f 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -91,6 +91,8 @@ static void pc_init1(MachineState *machine,
>      MemoryRegion *pci_memory;
>      MemoryRegion *rom_memory;
>      ram_addr_t lowmem;
> +    uint64_t hole64_size;
> +    DeviceState *i440fx_dev;
> 
>      /*
>       * Calculate ram split, for memory below and above 4G.  It's a bit
> @@ -164,9 +166,13 @@ static void pc_init1(MachineState *machine,
>          pci_memory = g_new(MemoryRegion, 1);
>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>          rom_memory = pci_memory;
> +        i440fx_dev = qdev_new(host_type);
> +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
>      } else {
>          pci_memory = NULL;
>          rom_memory = system_memory;
> +        i440fx_dev = NULL;
> +        hole64_size = 0;
>      }
> 
>      pc_guest_info_init(pcms);
> @@ -183,7 +189,7 @@ static void pc_init1(MachineState *machine,
>      /* allocate ram and load rom/bios */
>      if (!xen_enabled()) {
>          pc_memory_init(pcms, system_memory,
> -                       rom_memory, &ram_memory);
> +                       rom_memory, &ram_memory, hole64_size);
>      } else {
>          pc_system_flash_cleanup_unused(pcms);
>          if (machine->kernel_filename != NULL) {
> @@ -199,7 +205,7 @@ static void pc_init1(MachineState *machine,
> 
>          pci_bus = i440fx_init(host_type,
>                                pci_type,
> -                              &i440fx_state,
> +                              i440fx_dev, &i440fx_state,
>                                system_memory, system_io, machine->ram_size,
>                                x86ms->below_4g_mem_size,
>                                x86ms->above_4g_mem_size,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 1780f79bc127..b7cf44d4755e 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -203,12 +203,13 @@ static void pc_q35_init(MachineState *machine)
>                              pcms->smbios_entry_point_type);
>      }
> 
> -    /* allocate ram and load rom/bios */
> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
> -
>      /* create pci host bus */
>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
> 
> +    /* allocate ram and load rom/bios */
> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
> +                   q35_host->mch.pci_hole64_size);
> +
>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>                               OBJECT(ram_memory), NULL);
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index e08716142b6e..c5cc28250d5c 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -237,7 +237,15 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>      }
>  }
> 
> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
> +{
> +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
> +
> +        return i440fx->pci_hole64_size;
> +}
> +
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> +                    DeviceState *dev,
>                      PCII440FXState **pi440fx_state,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
> @@ -247,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      MemoryRegion *pci_address_space,
>                      MemoryRegion *ram_memory)
>  {
> -    DeviceState *dev;
>      PCIBus *b;
>      PCIDevice *d;
>      PCIHostState *s;
> @@ -255,7 +262,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>      unsigned i;
>      I440FXState *i440fx;
> 
> -    dev = qdev_new(host_type);
>      s = PCI_HOST_BRIDGE(dev);
>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>                           address_space_io, 0, TYPE_PCI_BUS);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 9c9f4ac74810..d8b9c4ebd748 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
>  void pc_memory_init(PCMachineState *pcms,
>                      MemoryRegion *system_memory,
>                      MemoryRegion *rom_memory,
> -                    MemoryRegion **ram_memory);
> +                    MemoryRegion **ram_memory,
> +                    uint64_t pci_hole64_size);
>  uint64_t pc_pci_hole64_start(void);
>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>  void pc_basic_device_init(struct PCMachineState *pcms,
> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
> index f068aaba8fda..1299d6a2b0e4 100644
> --- a/include/hw/pci-host/i440fx.h
> +++ b/include/hw/pci-host/i440fx.h
> @@ -36,7 +36,7 @@ struct PCII440FXState {
>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
> 
>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
> -                    PCII440FXState **pi440fx_state,
> +                    DeviceState *dev, PCII440FXState **pi440fx_state,
>                      MemoryRegion *address_space_mem,
>                      MemoryRegion *address_space_io,
>                      ram_addr_t ram_size,
> @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>                      MemoryRegion *pci_memory,
>                      MemoryRegion *ram_memory);
> 
> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
> 
>  #endif
> 


