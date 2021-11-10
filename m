Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1244BB8D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:08:32 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgmd-0001uT-Iz
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkgji-0000Pk-EL
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:05:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkgje-0001vB-48
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636524324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CChKBmvnxqY6/i22RJ7OSdEV5TEOU/YAwSd4CdNCoMg=;
 b=UpPUZka4nkFnt+8RtFvcqAaFiZxXu/Q2+qIzKU45ta/CZhf2RAGcVUIwzZEJ2YYlqsbJCM
 H10ye+Kw0tGmp9Z/yMfl+Ysfs3IGW8PEYRL6XQ3aLZIq8LDAZdzL0X9H2CUWygzfB0D822
 9v6OPBlikalLfPm2zHNDUGhE4RpLN2I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-p-romp2GOUmy23U7xzsplQ-1; Wed, 10 Nov 2021 01:05:23 -0500
X-MC-Unique: p-romp2GOUmy23U7xzsplQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso1381317edb.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 22:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CChKBmvnxqY6/i22RJ7OSdEV5TEOU/YAwSd4CdNCoMg=;
 b=5zBpOsnO6an1/kutHgurdVeDKj7OhZmfzkeMluMEmfADgCht45UX+6QaG2UDWNa3jD
 F3cukp+T6xZUXtI+SGopgL4ZgKFOdAFvHOIlfQIo6T4J9DP7GVAg80sVIwhYpRJ2uWX4
 c6DaQnYTF/WmHy/gEEOUXJRy2PbX6ftjDDe2S0RDDhLevDs3AGwQwLBKNZQtuqNJyP/k
 XioteXJl3k9iHYvfj1or5ewphdXAXAeFRVcAe43ckSNgyR+6DNfKjdaWDkWfuLfme/r4
 6Sbo8ocaW9iHL4FXEUkyyhHrq+kiKDei19puQA8n23MYdUzEhwzFFpyquvEOGRHemSHe
 bC2g==
X-Gm-Message-State: AOAM532GVf13tLydLvcukOdt6PoBcFL4CibUVSMoZkdSDyr62h+8HolM
 Lg1eLGewo0He1r4pL302n0CRnZ0x8DtKihf09qEKwFqy9prFIWQKx2AMWEoPQbqPwmO+0t1cluO
 I4PqCoXsckBqiwMI=
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr17327872ejc.503.1636524322093; 
 Tue, 09 Nov 2021 22:05:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJm95ag8nV3kE2m3YfmJVL8rwDcOOErxhAWDWkt11pb2Vv6Dvd1kO33J8T39u2NROy8TqHXg==
X-Received: by 2002:a17:907:1b16:: with SMTP id
 mp22mr17327831ejc.503.1636524321814; 
 Tue, 09 Nov 2021 22:05:21 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id z6sm11190257edc.53.2021.11.09.22.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:05:21 -0800 (PST)
Date: Wed, 10 Nov 2021 01:04:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH 1/5] hw/pci/pcie_port: Rename 'native-hotplug' to
 'native-hpc-bit'
Message-ID: <20211110010239-mutt-send-email-mst@kernel.org>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-2-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211110053014.489591-2-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <mapfelba@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 06:30:10AM +0100, Julia Suvorova wrote:
> Rename the option to better represent its function - toggle Hot-Plug
> Capable bit in the PCIe Slot Capability.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  include/hw/pci/pcie_port.h         | 2 +-
>  hw/i386/pc_q35.c                   | 2 +-
>  hw/pci-bridge/gen_pcie_root_port.c | 6 +++++-
>  hw/pci/pcie.c                      | 2 +-
>  hw/pci/pcie_port.c                 | 2 +-
>  5 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> index e25b289ce8..0da6d66c95 100644
> --- a/include/hw/pci/pcie_port.h
> +++ b/include/hw/pci/pcie_port.h
> @@ -60,7 +60,7 @@ struct PCIESlot {
>      /* Indicates whether any type of hot-plug is allowed on the slot */
>      bool        hotplug;
>  
> -    bool        native_hotplug;
> +    bool        native_hpc_bit;
>  
>      QLIST_ENTRY(PCIESlot) next;
>  };
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c


This is ok.


> index 797e09500b..ded61f8ef7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
>                                            NULL);
>  
>      if (acpi_pcihp) {
> -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
>                                     "false", true);
>      }
>


This part is problematic since we made the feature user-settable in 6.1.
We can have two features if we really want to ...
I don't think we have a way to mark properties deprecated, do we?
  
> diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
> index 20099a8ae3..ed079d72b3 100644
> --- a/hw/pci-bridge/gen_pcie_root_port.c
> +++ b/hw/pci-bridge/gen_pcie_root_port.c
> @@ -87,7 +87,11 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
> +    /*
> +     * Make sure that IO is assigned in case the slot is hot-pluggable
> +     * but it is not visible through the PCIe Slot Capabilities
> +     */
> +    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hpc_bit) {
>          grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
>      }
>      int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 914a9bf3d1..ebe002831e 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -535,7 +535,7 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
>       * hot-plug is disabled on the slot.
>       */
>      if (s->hotplug &&
> -        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
> +        (s->native_hpc_bit || DEVICE(dev)->hotplugged)) {
>          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
>                                     PCI_EXP_SLTCAP_HPS |
>                                     PCI_EXP_SLTCAP_HPC);
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index da850e8dde..eae06d10e2 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
>      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
>      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
>      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
> +    DEFINE_PROP_BOOL("native-hpc-bit", PCIESlot, native_hpc_bit, true),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> -- 
> 2.31.1


