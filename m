Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE471493BE9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 15:29:20 +0100 (CET)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nABxf-000644-Au
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 09:29:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nABle-0001dr-Ma
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nABlZ-0008Sc-Gt
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642601805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Evzypk6n3+MdQrbdJ0GqKA7iUTJMbbPA8RQJ6Y7xGF4=;
 b=dJopL8HQRCMedSY+r9s1IMx2z1YHZMb3xhrxSqArWCN+JQvldqbGU6Vi86tODijA9z5mby
 MVDxlu8ouovl/VPGtOufiGAljmdgGqNNamGutrpC8ei7bMc2HmXCnI4XF/1WKJ9TMOYTP6
 2+yylgM+D7UBGMg7DtULNQxlGjR8400=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-6vFyj6EvOhOeU2QIJrBSCw-1; Wed, 19 Jan 2022 09:16:43 -0500
X-MC-Unique: 6vFyj6EvOhOeU2QIJrBSCw-1
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso1427344edb.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 06:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Evzypk6n3+MdQrbdJ0GqKA7iUTJMbbPA8RQJ6Y7xGF4=;
 b=MltNonFXhQxWDcOAo1pb4JVgQktBKdqfAGTJ3/PX/5G0jkfbsPNHYJkwIOKqMUlv17
 xnXvR/yJG/JHYAmqeKKIVyBHX8aOHX/KpPW4MqS7Otzw2ZtEoG4bPmtPqkFYQbJTcWhc
 y2bXkqIRl8aRHb5iuNKymtQ3KwzF36fMsNXpHL6807FW5AUkRLX4DrLOJj8rnOJPE2kt
 dpr/4PF9y+b1Hd7hdaE0jjiLjaSyZ4AFWURlkhdbe47KlaZnS30dhrkfhuhE0+Xdkn0U
 wwRQiatxnJzYMP9MGCBTxzN7YmF0crXuHqjvft3kdhVwRsmcEn5Fx4DaZFHONu1hc3CD
 edvA==
X-Gm-Message-State: AOAM530cs762a0A1Q+OXWd7AXOqOT+WElPZT7X62au19lNG4elMN446T
 r/PhZ1luCbHKUkGYPlcinjkAS8ntRm+PMR4PvBm+xJ7OszOupI8FW+QymvTcEJaX2TZ5BNaRHYV
 h3800bjjA4ZRDKXY=
X-Received: by 2002:a17:907:6da5:: with SMTP id
 sb37mr336226ejc.595.1642601802110; 
 Wed, 19 Jan 2022 06:16:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUsvoe/K+SxOKX0LkZRyUptzMt7c8b1gEkf6/J0+Y5h7K6i6sWed00CAYp9LqlQJL3eav1Og==
X-Received: by 2002:a17:907:6da5:: with SMTP id
 sb37mr336153ejc.595.1642601801519; 
 Wed, 19 Jan 2022 06:16:41 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d10sm696793ejt.55.2022.01.19.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 06:16:40 -0800 (PST)
Date: Wed, 19 Jan 2022 15:16:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 1/2] Mark remaining global TypeInfo instances as const
Message-ID: <20220119151638.23d80dc5@redhat.com>
In-Reply-To: <20220117145805.173070-2-shentey@gmail.com>
References: <20220117145805.173070-1-shentey@gmail.com>
 <20220117145805.173070-2-shentey@gmail.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Corey Minyard <minyard@acm.org>,
 "open list:S390
 PCI" <qemu-s390x@nongnu.org>, Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, "open list:e500" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 15:58:04 +0100
Bernhard Beschow <shentey@gmail.com> wrote:

> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> This commit was created with:
>   git grep -z -l 'static TypeInfo' -- '*.c' | \
>   xargs -0 sed -i 's/static TypeInfo/static const TypeInfo/'
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

for hw/mem and hw/i386

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/generic-loader.c   | 2 +-
>  hw/core/guest-loader.c     | 2 +-
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/display/i2c-ddc.c       | 2 +-
>  hw/display/macfb.c         | 4 ++--
>  hw/display/virtio-vga.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/sgx-epc.c          | 2 +-
>  hw/intc/bcm2835_ic.c       | 2 +-
>  hw/intc/bcm2836_control.c  | 2 +-
>  hw/ipmi/ipmi.c             | 4 ++--
>  hw/mem/nvdimm.c            | 2 +-
>  hw/mem/pc-dimm.c           | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_powermgt.c | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  hw/misc/bcm2835_rng.c      | 2 +-
>  hw/misc/pvpanic-isa.c      | 2 +-
>  hw/misc/pvpanic-pci.c      | 2 +-
>  hw/net/fsl_etsec/etsec.c   | 2 +-
>  hw/ppc/prep_systemio.c     | 2 +-
>  hw/ppc/spapr_iommu.c       | 2 +-
>  hw/s390x/s390-pci-bus.c    | 2 +-
>  hw/s390x/sclp.c            | 2 +-
>  hw/s390x/tod-kvm.c         | 2 +-
>  hw/s390x/tod-tcg.c         | 2 +-
>  hw/s390x/tod.c             | 2 +-
>  hw/scsi/lsi53c895a.c       | 2 +-
>  hw/sd/allwinner-sdhost.c   | 2 +-
>  hw/sd/aspeed_sdhci.c       | 2 +-
>  hw/sd/bcm2835_sdhost.c     | 2 +-
>  hw/sd/cadence_sdhci.c      | 2 +-
>  hw/sd/npcm7xx_sdhci.c      | 2 +-
>  hw/usb/dev-mtp.c           | 2 +-
>  hw/usb/host-libusb.c       | 2 +-
>  hw/vfio/igd.c              | 2 +-
>  hw/virtio/virtio-pmem.c    | 2 +-
>  qom/object.c               | 4 ++--
>  39 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 9a24ffb880..eaafc416f4 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
> -static TypeInfo generic_loader_info = {
> +static const TypeInfo generic_loader_info = {
>      .name = TYPE_GENERIC_LOADER,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(GenericLoaderState),
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index d3f9d1a06e..391c875a29 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -129,7 +129,7 @@ static void guest_loader_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
> -static TypeInfo guest_loader_info = {
> +static const TypeInfo guest_loader_info = {
>      .name = TYPE_GUEST_LOADER,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(GuestLoaderState),
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 2be77bdd3a..088fc3d51c 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -454,7 +454,7 @@ static void bcm2835_fb_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_fb;
>  }
>  
> -static TypeInfo bcm2835_fb_info = {
> +static const TypeInfo bcm2835_fb_info = {
>      .name          = TYPE_BCM2835_FB,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835FBState),
> diff --git a/hw/display/i2c-ddc.c b/hw/display/i2c-ddc.c
> index 13eb529fc1..146489518c 100644
> --- a/hw/display/i2c-ddc.c
> +++ b/hw/display/i2c-ddc.c
> @@ -113,7 +113,7 @@ static void i2c_ddc_class_init(ObjectClass *oc, void *data)
>      isc->send = i2c_ddc_tx;
>  }
>  
> -static TypeInfo i2c_ddc_info = {
> +static const TypeInfo i2c_ddc_info = {
>      .name = TYPE_I2CDDC,
>      .parent = TYPE_I2C_SLAVE,
>      .instance_size = sizeof(I2CDDCState),
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 4bd7c3ad6a..69c2ea2b6e 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -783,14 +783,14 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
>      device_class_set_props(dc, macfb_nubus_properties);
>  }
>  
> -static TypeInfo macfb_sysbus_info = {
> +static const TypeInfo macfb_sysbus_info = {
>      .name          = TYPE_MACFB,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(MacfbSysBusState),
>      .class_init    = macfb_sysbus_class_init,
>  };
>  
> -static TypeInfo macfb_nubus_info = {
> +static const TypeInfo macfb_nubus_info = {
>      .name          = TYPE_NUBUS_MACFB,
>      .parent        = TYPE_NUBUS_DEVICE,
>      .instance_size = sizeof(MacfbNubusState),
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index b23a75a04b..5a2f7a4540 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -220,7 +220,7 @@ static void virtio_vga_base_class_init(ObjectClass *klass, void *data)
>                                     virtio_vga_set_big_endian_fb);
>  }
>  
> -static TypeInfo virtio_vga_base_info = {
> +static const TypeInfo virtio_vga_base_info = {
>      .name          = TYPE_VIRTIO_VGA_BASE,
>      .parent        = TYPE_VIRTIO_PCI,
>      .instance_size = sizeof(VirtIOVGABase),
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index eb0002a2b9..5e9306110d 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -394,7 +394,7 @@ static void bcm2835_dma_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_dma;
>  }
>  
> -static TypeInfo bcm2835_dma_info = {
> +static const TypeInfo bcm2835_dma_info = {
>      .name          = TYPE_BCM2835_DMA,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835DMAState),
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 7c7790a5ce..f6557d3c21 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -865,7 +865,7 @@ static void isa_bridge_class_init(ObjectClass *klass, void *data)
>      k->class_id     = PCI_CLASS_BRIDGE_ISA;
>  };
>  
> -static TypeInfo isa_bridge_info = {
> +static const TypeInfo isa_bridge_info = {
>      .name          = "igd-passthrough-isa-bridge",
>      .parent        = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PCIDevice),
> diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> index 96b2940d75..d664829d35 100644
> --- a/hw/i386/sgx-epc.c
> +++ b/hw/i386/sgx-epc.c
> @@ -167,7 +167,7 @@ static void sgx_epc_class_init(ObjectClass *oc, void *data)
>      mdc->fill_device_info = sgx_epc_md_fill_device_info;
>  }
>  
> -static TypeInfo sgx_epc_info = {
> +static const TypeInfo sgx_epc_info = {
>      .name          = TYPE_SGX_EPC,
>      .parent        = TYPE_DEVICE,
>      .instance_size = sizeof(SGXEPCDevice),
> diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
> index 9000d995e8..4513fad16f 100644
> --- a/hw/intc/bcm2835_ic.c
> +++ b/hw/intc/bcm2835_ic.c
> @@ -227,7 +227,7 @@ static void bcm2835_ic_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_ic;
>  }
>  
> -static TypeInfo bcm2835_ic_info = {
> +static const TypeInfo bcm2835_ic_info = {
>      .name          = TYPE_BCM2835_IC,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835ICState),
> diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
> index 2ead76ffdc..b0589df188 100644
> --- a/hw/intc/bcm2836_control.c
> +++ b/hw/intc/bcm2836_control.c
> @@ -392,7 +392,7 @@ static void bcm2836_control_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2836_control;
>  }
>  
> -static TypeInfo bcm2836_control_info = {
> +static const TypeInfo bcm2836_control_info = {
>      .name          = TYPE_BCM2836_CONTROL,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2836ControlState),
> diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> index 8d35c9fdd6..bbb07b151e 100644
> --- a/hw/ipmi/ipmi.c
> +++ b/hw/ipmi/ipmi.c
> @@ -85,7 +85,7 @@ static void ipmi_interface_class_init(ObjectClass *class, void *data)
>      ik->do_hw_op = ipmi_do_hw_op;
>  }
>  
> -static TypeInfo ipmi_interface_type_info = {
> +static const TypeInfo ipmi_interface_type_info = {
>      .name = TYPE_IPMI_INTERFACE,
>      .parent = TYPE_INTERFACE,
>      .class_size = sizeof(IPMIInterfaceClass),
> @@ -120,7 +120,7 @@ static void bmc_class_init(ObjectClass *oc, void *data)
>      device_class_set_props(dc, ipmi_bmc_properties);
>  }
>  
> -static TypeInfo ipmi_bmc_type_info = {
> +static const TypeInfo ipmi_bmc_type_info = {
>      .name = TYPE_IPMI_BMC,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(IPMIBmc),
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7397b67156..933bc5e0c7 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -248,7 +248,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
> -static TypeInfo nvdimm_info = {
> +static const TypeInfo nvdimm_info = {
>      .name          = TYPE_NVDIMM,
>      .parent        = TYPE_PC_DIMM,
>      .class_size    = sizeof(NVDIMMClass),
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 48b913aba6..28af0d71b2 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -286,7 +286,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
>      mdc->fill_device_info = pc_dimm_md_fill_device_info;
>  }
>  
> -static TypeInfo pc_dimm_info = {
> +static const TypeInfo pc_dimm_info = {
>      .name          = TYPE_PC_DIMM,
>      .parent        = TYPE_DEVICE,
>      .instance_size = sizeof(PCDIMMDevice),
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 9f73cbd5e4..1908c152f6 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -324,7 +324,7 @@ static void bcm2835_mbox_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_mbox;
>  }
>  
> -static TypeInfo bcm2835_mbox_info = {
> +static const TypeInfo bcm2835_mbox_info = {
>      .name          = TYPE_BCM2835_MBOX,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835MboxState),
> diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
> index 25fa804cbd..976f3d34e5 100644
> --- a/hw/misc/bcm2835_powermgt.c
> +++ b/hw/misc/bcm2835_powermgt.c
> @@ -144,7 +144,7 @@ static void bcm2835_powermgt_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_powermgt;
>  }
>  
> -static TypeInfo bcm2835_powermgt_info = {
> +static const TypeInfo bcm2835_powermgt_info = {
>      .name          = TYPE_BCM2835_POWERMGT,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835PowerMgtState),
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 76ea511d53..e94e951057 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -421,7 +421,7 @@ static void bcm2835_property_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_property;
>  }
>  
> -static TypeInfo bcm2835_property_info = {
> +static const TypeInfo bcm2835_property_info = {
>      .name          = TYPE_BCM2835_PROPERTY,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835PropertyState),
> diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
> index d0c4e64e88..b3c80cf186 100644
> --- a/hw/misc/bcm2835_rng.c
> +++ b/hw/misc/bcm2835_rng.c
> @@ -131,7 +131,7 @@ static void bcm2835_rng_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_rng;
>  }
>  
> -static TypeInfo bcm2835_rng_info = {
> +static const TypeInfo bcm2835_rng_info = {
>      .name          = TYPE_BCM2835_RNG,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835RngState),
> diff --git a/hw/misc/pvpanic-isa.c b/hw/misc/pvpanic-isa.c
> index 7b66d58acc..a39fcdd1fc 100644
> --- a/hw/misc/pvpanic-isa.c
> +++ b/hw/misc/pvpanic-isa.c
> @@ -77,7 +77,7 @@ static void pvpanic_isa_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
> -static TypeInfo pvpanic_isa_info = {
> +static const TypeInfo pvpanic_isa_info = {
>      .name          = TYPE_PVPANIC_ISA_DEVICE,
>      .parent        = TYPE_ISA_DEVICE,
>      .instance_size = sizeof(PVPanicISAState),
> diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
> index af8cbe2830..62e1be68c1 100644
> --- a/hw/misc/pvpanic-pci.c
> +++ b/hw/misc/pvpanic-pci.c
> @@ -74,7 +74,7 @@ static void pvpanic_pci_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
> -static TypeInfo pvpanic_pci_info = {
> +static const TypeInfo pvpanic_pci_info = {
>      .name          = TYPE_PVPANIC_PCI_DEVICE,
>      .parent        = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PVPanicPCIState),
> diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
> index bd9d62b559..e7fc082518 100644
> --- a/hw/net/fsl_etsec/etsec.c
> +++ b/hw/net/fsl_etsec/etsec.c
> @@ -430,7 +430,7 @@ static void etsec_class_init(ObjectClass *klass, void *data)
>      dc->user_creatable = true;
>  }
>  
> -static TypeInfo etsec_info = {
> +static const TypeInfo etsec_info = {
>      .name                  = TYPE_ETSEC_COMMON,
>      .parent                = TYPE_SYS_BUS_DEVICE,
>      .instance_size         = sizeof(eTSEC),
> diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
> index b2bd783248..8c9b8dd67b 100644
> --- a/hw/ppc/prep_systemio.c
> +++ b/hw/ppc/prep_systemio.c
> @@ -300,7 +300,7 @@ static void prep_systemio_class_initfn(ObjectClass *klass, void *data)
>      device_class_set_props(dc, prep_systemio_properties);
>  }
>  
> -static TypeInfo prep_systemio800_info = {
> +static const TypeInfo prep_systemio800_info = {
>      .name          = TYPE_PREP_SYSTEMIO,
>      .parent        = TYPE_ISA_DEVICE,
>      .instance_size = sizeof(PrepSystemIoState),
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index db01071858..81e5a1aea3 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -685,7 +685,7 @@ static void spapr_tce_table_class_init(ObjectClass *klass, void *data)
>      spapr_register_hypercall(H_STUFF_TCE, h_stuff_tce);
>  }
>  
> -static TypeInfo spapr_tce_table_info = {
> +static const TypeInfo spapr_tce_table_info = {
>      .name = TYPE_SPAPR_TCE_TABLE,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(SpaprTceTable),
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 01b58ebc70..4b2bdd94b3 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1392,7 +1392,7 @@ static const TypeInfo s390_pci_device_info = {
>      .class_init = s390_pci_device_class_init,
>  };
>  
> -static TypeInfo s390_pci_iommu_info = {
> +static const TypeInfo s390_pci_iommu_info = {
>      .name = TYPE_S390_PCI_IOMMU,
>      .parent = TYPE_OBJECT,
>      .instance_size = sizeof(S390PCIIOMMU),
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index 89c30a8a91..eff74479f4 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -460,7 +460,7 @@ static void sclp_class_init(ObjectClass *oc, void *data)
>      sc->service_interrupt = service_interrupt;
>  }
>  
> -static TypeInfo sclp_info = {
> +static const TypeInfo sclp_info = {
>      .name = TYPE_SCLP,
>      .parent = TYPE_DEVICE,
>      .instance_init = sclp_init,
> diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
> index ec855811ae..9d0cbfbce2 100644
> --- a/hw/s390x/tod-kvm.c
> +++ b/hw/s390x/tod-kvm.c
> @@ -147,7 +147,7 @@ static void kvm_s390_tod_init(Object *obj)
>      td->stopped = false;
>  }
>  
> -static TypeInfo kvm_s390_tod_info = {
> +static const TypeInfo kvm_s390_tod_info = {
>      .name = TYPE_KVM_S390_TOD,
>      .parent = TYPE_S390_TOD,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
> index 9bb94ff72b..ad4993203d 100644
> --- a/hw/s390x/tod-tcg.c
> +++ b/hw/s390x/tod-tcg.c
> @@ -73,7 +73,7 @@ static void qemu_s390_tod_init(Object *obj)
>      }
>  }
>  
> -static TypeInfo qemu_s390_tod_info = {
> +static const TypeInfo qemu_s390_tod_info = {
>      .name = TYPE_QEMU_S390_TOD,
>      .parent = TYPE_S390_TOD,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/s390x/tod.c b/hw/s390x/tod.c
> index fd5a36bf24..c81b1c0338 100644
> --- a/hw/s390x/tod.c
> +++ b/hw/s390x/tod.c
> @@ -123,7 +123,7 @@ static void s390_tod_class_init(ObjectClass *oc, void *data)
>      dc->user_creatable = false;
>  }
>  
> -static TypeInfo s390_tod_info = {
> +static const TypeInfo s390_tod_info = {
>      .name = TYPE_S390_TOD,
>      .parent = TYPE_DEVICE,
>      .instance_size = sizeof(S390TODState),
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index 4c431adb77..c8773f73f7 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -2352,7 +2352,7 @@ static void lsi53c810_class_init(ObjectClass *klass, void *data)
>      k->device_id = PCI_DEVICE_ID_LSI_53C810;
>  }
>  
> -static TypeInfo lsi53c810_info = {
> +static const TypeInfo lsi53c810_info = {
>      .name          = TYPE_LSI53C810,
>      .parent        = TYPE_LSI53C895A,
>      .class_init    = lsi53c810_class_init,
> diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> index de5bc49e68..041e45c680 100644
> --- a/hw/sd/allwinner-sdhost.c
> +++ b/hw/sd/allwinner-sdhost.c
> @@ -835,7 +835,7 @@ static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
>      sc->max_desc_size = 64 * KiB;
>  }
>  
> -static TypeInfo allwinner_sdhost_info = {
> +static const TypeInfo allwinner_sdhost_info = {
>      .name          = TYPE_AW_SDHOST,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_init = allwinner_sdhost_init,
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index df1bdf1fa4..be8cafd65f 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -198,7 +198,7 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
>      device_class_set_props(dc, aspeed_sdhci_properties);
>  }
>  
> -static TypeInfo aspeed_sdhci_info = {
> +static const TypeInfo aspeed_sdhci_info = {
>      .name          = TYPE_ASPEED_SDHCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(AspeedSDHCIState),
> diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
> index 088a7ac6ed..9431c35914 100644
> --- a/hw/sd/bcm2835_sdhost.c
> +++ b/hw/sd/bcm2835_sdhost.c
> @@ -436,7 +436,7 @@ static void bcm2835_sdhost_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_bcm2835_sdhost;
>  }
>  
> -static TypeInfo bcm2835_sdhost_info = {
> +static const TypeInfo bcm2835_sdhost_info = {
>      .name          = TYPE_BCM2835_SDHOST,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(BCM2835SDHostState),
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> index 56b8bae1c3..75db34befe 100644
> --- a/hw/sd/cadence_sdhci.c
> +++ b/hw/sd/cadence_sdhci.c
> @@ -175,7 +175,7 @@ static void cadence_sdhci_class_init(ObjectClass *classp, void *data)
>      dc->vmsd = &vmstate_cadence_sdhci;
>  }
>  
> -static TypeInfo cadence_sdhci_info = {
> +static const TypeInfo cadence_sdhci_info = {
>      .name          = TYPE_CADENCE_SDHCI,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(CadenceSDHCIState),
> diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
> index ef503365df..b2f5b4a542 100644
> --- a/hw/sd/npcm7xx_sdhci.c
> +++ b/hw/sd/npcm7xx_sdhci.c
> @@ -166,7 +166,7 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
>                              TYPE_SYSBUS_SDHCI);
>  }
>  
> -static TypeInfo npcm7xx_sdhci_info = {
> +static const TypeInfo npcm7xx_sdhci_info = {
>      .name = TYPE_NPCM7XX_SDHCI,
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(NPCM7xxSDHCIState),
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index c1d1694fd0..1e6ac76bef 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -2106,7 +2106,7 @@ static void usb_mtp_class_initfn(ObjectClass *klass, void *data)
>      device_class_set_props(dc, mtp_properties);
>  }
>  
> -static TypeInfo mtp_info = {
> +static const TypeInfo mtp_info = {
>      .name          = TYPE_USB_MTP,
>      .parent        = TYPE_USB_DEVICE,
>      .instance_size = sizeof(MTPState),
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index d0d46dd0a4..2b35cb6cdd 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1801,7 +1801,7 @@ static void usb_host_class_initfn(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }
>  
> -static TypeInfo usb_host_dev_info = {
> +static const TypeInfo usb_host_dev_info = {
>      .name          = TYPE_USB_HOST_DEVICE,
>      .parent        = TYPE_USB_DEVICE,
>      .instance_size = sizeof(USBHostDevice),
> diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
> index d4685709a3..afe3fe7efc 100644
> --- a/hw/vfio/igd.c
> +++ b/hw/vfio/igd.c
> @@ -199,7 +199,7 @@ static void vfio_pci_igd_lpc_bridge_class_init(ObjectClass *klass, void *data)
>      k->class_id = PCI_CLASS_BRIDGE_ISA;
>  }
>  
> -static TypeInfo vfio_pci_igd_lpc_bridge_info = {
> +static const TypeInfo vfio_pci_igd_lpc_bridge_info = {
>      .name = "vfio-pci-igd-lpc-bridge",
>      .parent = TYPE_PCI_DEVICE,
>      .class_init = vfio_pci_igd_lpc_bridge_class_init,
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index d1aeb90a31..5419dca75e 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -182,7 +182,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
> -static TypeInfo virtio_pmem_info = {
> +static const TypeInfo virtio_pmem_info = {
>      .name          = TYPE_VIRTIO_PMEM,
>      .parent        = TYPE_VIRTIO_DEVICE,
>      .class_size    = sizeof(VirtIOPMEMClass),
> diff --git a/qom/object.c b/qom/object.c
> index 4f0677cca9..9f7a33139d 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -2793,13 +2793,13 @@ static void object_class_init(ObjectClass *klass, void *data)
>  
>  static void register_types(void)
>  {
> -    static TypeInfo interface_info = {
> +    static const TypeInfo interface_info = {
>          .name = TYPE_INTERFACE,
>          .class_size = sizeof(InterfaceClass),
>          .abstract = true,
>      };
>  
> -    static TypeInfo object_info = {
> +    static const TypeInfo object_info = {
>          .name = TYPE_OBJECT,
>          .instance_size = sizeof(Object),
>          .class_init = object_class_init,


