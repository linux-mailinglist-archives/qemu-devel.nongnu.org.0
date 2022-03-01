Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FC4C8ED8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:22:11 +0100 (CET)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4KH-0001jY-T5
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP4IX-000052-Qy
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:20:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nP4IT-0005s6-Aq
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646148015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOBGVGnTvxLdGfrpVj4mi0ohpFuZagU5VIOqKtuLwPs=;
 b=XHHuuGbbUOL8PRpRwJA8Mn9SSlFBNQ8J6W5DO+//dVE3FbpJuLgGPOB8NxZyp4DPIekcBx
 tcaIG3FpIwYvCKdVsBPkH2TI/fm0j4D49zCtKKM7edll4FxWh5kuzQ606J48Xt2L2ESb3L
 cNiGuWjBy13yWARn5YBwpSwEz8bI4zY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-1pR6oNV5MTeK4vbq9xz47A-1; Tue, 01 Mar 2022 10:20:11 -0500
X-MC-Unique: 1pR6oNV5MTeK4vbq9xz47A-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso694254wrq.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 07:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WOBGVGnTvxLdGfrpVj4mi0ohpFuZagU5VIOqKtuLwPs=;
 b=FrHG+OvbbEwv2pD0IHfzUhHP9+x3z0nnAGdwMzJ2JaRPjWCT7e1OoJldKrf/VGryME
 HCUlz+2KK+YRNrdWD40zptVc8WVLcHphHjgNBHKSjqAEY9h20hfH0Dw7u6HPlrVnORi7
 cE87lqUHaI9BLH8gPF416YqG7iAzgwMPUfikOHUGFS8qOBzgLZD+1Dwq8dVnJFm/AxXi
 WYh+az6jIY9NUe0nuf12/8aoyqQCVaFO/7G6e+McAzV6IIzbXkiMgPYMyfOX2gCWwW8c
 3DcxWDN/TYZ4vCjusc6IMiDIjBO67qphfGZ2GUhnQ/txPkh6v7M8KRvJY9zu2j5IgYKo
 aOcA==
X-Gm-Message-State: AOAM5334XKxdED4hLLUGNZepOvnD2uDsL5i5rcdULoZ67XdzXNo+0etn
 gz231ocCIPD6gJKzG0JG1xUpODS9je8UoSEkUvhmj+aNcPTnt6ObitgTnyyZVldGZXDBUP6qJCp
 HlAJ6iJQ8J75iBVM=
X-Received: by 2002:a5d:6488:0:b0:1ea:7ff1:93e with SMTP id
 o8-20020a5d6488000000b001ea7ff1093emr20960277wri.284.1646148010556; 
 Tue, 01 Mar 2022 07:20:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5ZoHdBAH9o0uK67FdXBkdPqayd8ihBe8G9mqSJKZ2mJQsD53UvMQzZ/KwCe/kDj/VpCV/7w==
X-Received: by 2002:a5d:6488:0:b0:1ea:7ff1:93e with SMTP id
 o8-20020a5d6488000000b001ea7ff1093emr20960255wri.284.1646148010234; 
 Tue, 01 Mar 2022 07:20:10 -0800 (PST)
Received: from redhat.com ([2.53.2.184]) by smtp.gmail.com with ESMTPSA id
 d29-20020adf9b9d000000b001e75e86d39fsm14256829wrc.74.2022.03.01.07.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:20:09 -0800 (PST)
Date: Tue, 1 Mar 2022 10:20:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 3/3] q35: compat: keep hotplugged PCIe device broken
 after migration for 6.2 and older machine types
Message-ID: <20220301101828-mutt-send-email-mst@kernel.org>
References: <20220301151200.3507298-1-imammedo@redhat.com>
 <20220301151200.3507298-4-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220301151200.3507298-4-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 10:12:00AM -0500, Igor Mammedov wrote:
> Q35 switched to ACPI PCI hotplug by default in since 6.1
> machine type and migration worked as expected (with BARs
> on target being the same as on source)
> 
> However native PCIe fixes [1] merged in 6.2 time, regressed
> migration part, resulting in disabled BARs on target. The
> issue affects pc-q35-6.2 and pc-q35-6.1 machine types (and
> older if qemu-6.2 binary is used on source with manually
> enabled ACPI PCI hotplug).
> 
> Introduce x-pcihp-disable-pcie-slot-power-on-fixup compat
> property to keep 6.2 and older machine types in broken state
> when ACPI PCI hotplug is enabled to make sure that guest does
> see the same PCIe device and slot on src & dst.
> 
> 1)
> Fixes: d5daff7d312 (pcie: implement slot power control for pcie root ports)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

I am not sure why we need this one. What's the scenario that's broken
otherwise?


> ---
>  include/hw/acpi/pcihp.h |  1 +
>  hw/acpi/ich9.c          | 20 ++++++++++++++++++++
>  hw/acpi/pcihp.c         | 11 +++++++----
>  hw/core/machine.c       |  4 +++-
>  4 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index af1a169fc3..2436151678 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -52,6 +52,7 @@ typedef struct AcpiPciHpState {
>      bool legacy_piix;
>      uint16_t io_base;
>      uint16_t io_len;
> +    bool disable_pcie_slot_power_on_fixup;
>  } AcpiPciHpState;
>  
>  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index bd9bbade70..e3bffdef71 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -430,6 +430,23 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
>      s->pm.keep_pci_slot_hpc = value;
>  }
>  
> +static bool ich9_pm_get_disable_pcie_slot_power_on_fixup(Object *obj,
> +                                                         Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    return s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup;
> +}
> +
> +static void ich9_pm_set_disable_pcie_slot_power_on_fixup(Object *obj,
> +                                                         bool value,
> +                                                         Error **errp)
> +{
> +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> +
> +    s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup = value;
> +}
> +
>  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>  {
>      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> @@ -469,6 +486,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
>      object_property_add_bool(obj, "x-keep-pci-slot-hpc",
>                               ich9_pm_get_keep_pci_slot_hpc,
>                               ich9_pm_set_keep_pci_slot_hpc);
> +    object_property_add_bool(obj, "x-pcihp-disable-pcie-slot-power-on-fixup",
> +                             ich9_pm_get_disable_pcie_slot_power_on_fixup,
> +                             ich9_pm_set_disable_pcie_slot_power_on_fixup);
>  }
>  
>  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 6351bd3424..4c06caf4a9 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -369,10 +369,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
>      }
>  
>      bus = pci_get_bus(pdev);
> -    bridge = pci_bridge_get_device(bus);
> -    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
> -        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
> -        pcie_cap_slot_enable_power(bridge);
> +    /* compat knob to preserve pci_config as in 6.2 & older when pcihp in use */
> +    if (s->disable_pcie_slot_power_on_fixup == false) {
> +        bridge = pci_bridge_get_device(bus);
> +        if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
> +            object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
> +            pcie_cap_slot_enable_power(bridge);
> +        }
>      }
>  
>      bsel = acpi_pcihp_get_bsel(bus);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..1758b49c2f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> -GlobalProperty hw_compat_6_2[] = {};
> +GlobalProperty hw_compat_6_2[] = {
> +    { "ICH9-LPC", "x-pcihp-disable-pcie-slot-power-on-fixup", "on" },
> +};
>  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>  
>  GlobalProperty hw_compat_6_1[] = {
> -- 
> 2.31.1


