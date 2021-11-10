Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4344C22C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:36:28 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknm7-0005Ih-0I
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mknjr-0003mn-5p
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mknjj-0002Nv-6z
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PX1J4H39o0T0nKTGyLBC3CzSGbKDXPpKA7LdoJ65eQs=;
 b=ARZuL2HgvBVHWM7AonQZHDkIr5LvpfNZW9ETYB7lSEcjLz1AmFIIgy5rYiVQz1VAmk97Yy
 Tb1hIST885o8iwpE0GcsJr9sz1FIAceuwgjnOzZyyEMoEg3PHX1exJL1oRa37h6lCqiuXa
 Ct4GSJNFTzHo4wwSyvIULDuMdzzEV7A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-WN05dEobM-yB1yGiFRidHg-1; Wed, 10 Nov 2021 08:33:57 -0500
X-MC-Unique: WN05dEobM-yB1yGiFRidHg-1
Received: by mail-ed1-f69.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso2365721edb.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 05:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PX1J4H39o0T0nKTGyLBC3CzSGbKDXPpKA7LdoJ65eQs=;
 b=ZtxmKp5ABu73I8yPHBUwJlxD/X2eWyhpOgm044sjadOq/JpLLaH959s3qhwyzNQsko
 pAmhw/VZRRLjU84leoJa2ygp1RyROzpOITiLrdbCSUs/IKCR9mCKtIJ4fhlFJeIZ+PeG
 IQ77Aw9HfXalaJVtCkekDbLF2rr2wbeB9PPcs5JyGatsYq76NwFQ8akVjfZTGuNQc9pd
 shhk/p/JYzby9SQ+P3S+M/NFzcucWB9dWtlATCw6BsWiyd2iickf0Z74lPhZ5fv9swaU
 FqYC9UreBx06YEE5alRFqltHdhYD/9htUw3e5f0Vk/TO9cgkcOj/pz2Fc97iHwnfILrm
 cBBA==
X-Gm-Message-State: AOAM532Qus4I+OeS6Z0Csduncq0XQDhyDOotIDp3RulPJy8AvJYY9KFC
 Okg4+tbjTZXrca78w5mAGj5YwtrqclnPPymZGgCNvtrRPqfJf60uZOA1TJuYdleLIvlv0trmOyE
 9b7DVo8yOHRyV1j0=
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr21321443ede.321.1636551236186; 
 Wed, 10 Nov 2021 05:33:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7qB8IyQsywU1rzGDZtF9gPc4wm3G76Toyy07fNy2DtibJyqnW0MZ4aVrHQLvtXe9PbYT61g==
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr21321422ede.321.1636551235987; 
 Wed, 10 Nov 2021 05:33:55 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id a20sm10991925ejd.112.2021.11.10.05.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:33:55 -0800 (PST)
Date: Wed, 10 Nov 2021 14:33:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH 2/5] hw/acpi/ich9: Add compatibility option for
 'native-hpc-bit'
Message-ID: <20211110143354.0c14aef0@redhat.com>
In-Reply-To: <20211110053014.489591-3-jusual@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-3-jusual@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <mapfelba@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 06:30:11 +0100
Julia Suvorova <jusual@redhat.com> wrote:

> To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
> turned on, while the switch to ACPI Hot-plug will be done in the
> DSDT table.
> 
> Introducing 'x-keep-native-hpc' option disables the HPC bit only
> in 6.1 and as a result keeps the forced 'reserve-io' on
> pcie-root-ports in 6.1 too.

using property from the 1st patch (native-hotplug),
should be enough to keep 6.1 ABI, so this patch is likely
not needed.

> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  include/hw/acpi/ich9.h |  1 +
>  hw/acpi/ich9.c         | 18 ++++++++++++++++++
>  hw/i386/pc.c           |  2 ++
>  hw/i386/pc_q35.c       |  7 ++++++-
>  4 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index f04f1791bd..7ca92843c6 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
>      AcpiCpuHotplug gpe_cpu;
>      CPUHotplugState cpuhp_state;
>  
> +    bool keep_pci_slot_hpc;
>      bool use_acpi_hotplug_bridge;
>      AcpiPciHpState acpi_pci_hotplug;
>      MemHotplugState acpi_memory_hotplug;
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 1ee2ba2c50..ebe08ed831 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
>      s->pm.use_acpi_hotplug_bridge = value;
>  }
>  
> +static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.keep_pci_slot_hpc;
> +}
> +
> +static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.keep_pci_slot_hpc = value;
> +}
> +
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> @@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      pm->disable_s4 = 0;
>      pm->s4_val = 2;
>      pm->use_acpi_hotplug_bridge = true;
> +    pm->keep_pci_slot_hpc = true;
>  
>      object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
>                                     &pm->pm_io_base, OBJ_PROP_FLAG_READ);
> @@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
>                               ich9_pm_get_acpi_pci_hotplug,
>                               ich9_pm_set_acpi_pci_hotplug);
> +    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> +                             ich9_pm_get_keep_pci_slot_hpc,
> +                             ich9_pm_set_keep_pci_slot_hpc);
>  }
>  
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a82148..a2ef40ecbc 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
>      { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
>      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
>      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
> +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
>  };
>  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
>  
> @@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
>      { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
>      { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
>      { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
> +    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
>  };
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index ded61f8ef7..06f09dfcc6 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
>      DriveInfo *hd[MAX_SATA_PORTS];
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      bool acpi_pcihp;
> +    bool keep_pci_slot_hpc;
>  
>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> @@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
>                                            ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
>                                            NULL);
>  
> -    if (acpi_pcihp) {
> +    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
> +                                                 "x-keep-pci-slot-hpc",
> +                                                 NULL);
> +
> +    if (!keep_pci_slot_hpc && acpi_pcihp) {
>          object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
>                                     "false", true);
>      }


