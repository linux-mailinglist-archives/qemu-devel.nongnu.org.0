Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEC4162BB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:06:38 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRF5-00068D-Lc
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mTR9D-00029p-1f
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:00:31 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mTR99-00056E-Th
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:00:30 -0400
Received: by mail-oi1-x22f.google.com with SMTP id s24so7738561oij.8
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GvlaqHPy6utlO3qyGzjZALw6+K1gDZiId/VB+Aknv9U=;
 b=oCIeV7bPTbAVc9FlZ23YU6PCdCKx1bDGKvsW4lt4z3pSR0FrQJfSgEpEgWHUgyfTU5
 uiUkt8rH/WjTdIaUer/mklxmUKcUJyedBaiVMy6ycdrilBcTQoNTR+lPgQ7Z2aTPPLub
 g44cgRLrRs8GpE/+iQgnoatc+sx6Wa3lWt5WsaXiM4DoW4NC3jEjd+EHruEpLLheqyd/
 4PiNgfTX0u8EoxF8GF3t1/4+oyfhaz4d3NoE+4B39HjimrGIawzyxIa2TlIBwN++IsBD
 7YOVh37HJiW9bos6jhs1FO0wnfiDoDXf60MxDmTyiYQcgvAP39Thyg6f1pMFrEiYFfrW
 n7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=GvlaqHPy6utlO3qyGzjZALw6+K1gDZiId/VB+Aknv9U=;
 b=Z/P17XzYcAu4SBDU3LwWRx2UK9+XPDQ7yhDmtSp5rjqVdKn2pvVYVWUbinduV6diFM
 Vh3VuBu5yxXZPzKq1VR0jksdEELgV9aPP7XF1alAAUD5FQZBfmY/2J3J7+5kBw7aOf6c
 1dQNUL+kjStvTxFhcMk5BiwIgdBjlvviXB9B1iEzauBCoR9KEMYwu3aciD+v0EXcQxLL
 1OURrQ6WzzRUJedIQSmArRG/nXsa7n/J8Z42YCg2OplYHVSbZghnf2+GAWmC96XP8dXj
 eBcOoQZW1aQxLXEFYBXDz/CULq10iLh2PuRHPNr7nUhI7KQKoGVLbTOXzWvCS9xK0ZJd
 aR7g==
X-Gm-Message-State: AOAM5333pLq3FYAOy4RIV9YF7VaCOyv5Opva4f//jrh88FhxjNOPJCTE
 szuUiBvJ0iQlFHaLaZNbWA==
X-Google-Smtp-Source: ABdhPJylz26haQSI7RibX1cNA+pfpyVnuBi5mQXKwCNGtAG8g2wkhDFp+53tJfJR3qyCH+wchUzV3Q==
X-Received: by 2002:a05:6808:d51:: with SMTP id
 w17mr13018117oik.179.1632412824284; 
 Thu, 23 Sep 2021 09:00:24 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id 64sm1373089otx.51.2021.09.23.09.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 09:00:23 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c8d6:d400:67d8:3383])
 by serve.minyard.net (Postfix) with ESMTPSA id 0ABA81800F0;
 Thu, 23 Sep 2021 16:00:22 +0000 (UTC)
Date: Thu, 23 Sep 2021 11:00:20 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/6] qbus: Rename qbus_create() to qbus_new()
Message-ID: <20210923160020.GI4867@minyard.net>
References: <20210923121153.23754-1-peter.maydell@linaro.org>
 <20210923121153.23754-6-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210923121153.23754-6-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Fam Zheng <fam@euphon.net>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 01:11:52PM +0100, Peter Maydell wrote:
> Rename the "allocate and return" qbus creation function to
> qbus_new(), to bring it into line with our _init vs _new convention.

This looks like a good idea to me.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/qdev-core.h      | 2 +-
>  hw/core/bus.c               | 2 +-
>  hw/hyperv/vmbus.c           | 2 +-
>  hw/i2c/core.c               | 2 +-
>  hw/isa/isa-bus.c            | 2 +-
>  hw/misc/auxbus.c            | 2 +-
>  hw/nubus/mac-nubus-bridge.c | 2 +-
>  hw/pci/pci.c                | 2 +-
>  hw/ppc/spapr_vio.c          | 2 +-
>  hw/s390x/ap-bridge.c        | 2 +-
>  hw/s390x/css-bridge.c       | 2 +-
>  hw/s390x/s390-pci-bus.c     | 2 +-
>  hw/ssi/ssi.c                | 2 +-
>  hw/xen/xen-bus.c            | 2 +-
>  hw/xen/xen-legacy-backend.c | 2 +-
>  15 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index ebca8cf9fca..4ff19c714bd 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -680,7 +680,7 @@ typedef int (qdev_walkerfn)(DeviceState *dev, void *opaque);
>  
>  void qbus_init(void *bus, size_t size, const char *typename,
>                 DeviceState *parent, const char *name);
> -BusState *qbus_create(const char *typename, DeviceState *parent, const char *name);
> +BusState *qbus_new(const char *typename, DeviceState *parent, const char *name);
>  bool qbus_realize(BusState *bus, Error **errp);
>  void qbus_unrealize(BusState *bus);
>  
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index cec49985024..c7831b5293b 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -159,7 +159,7 @@ void qbus_init(void *bus, size_t size, const char *typename,
>      qbus_init_internal(bus, parent, name);
>  }
>  
> -BusState *qbus_create(const char *typename, DeviceState *parent, const char *name)
> +BusState *qbus_new(const char *typename, DeviceState *parent, const char *name)
>  {
>      BusState *bus;
>  
> diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
> index c9887d5a7bc..dbce3b35fba 100644
> --- a/hw/hyperv/vmbus.c
> +++ b/hw/hyperv/vmbus.c
> @@ -2729,7 +2729,7 @@ static void vmbus_bridge_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    bridge->bus = VMBUS(qbus_create(TYPE_VMBUS, dev, "vmbus"));
> +    bridge->bus = VMBUS(qbus_new(TYPE_VMBUS, dev, "vmbus"));
>  }
>  
>  static char *vmbus_bridge_ofw_unit_address(const SysBusDevice *dev)
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 416372ad00c..0e7d2763b9e 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -60,7 +60,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
>  {
>      I2CBus *bus;
>  
> -    bus = I2C_BUS(qbus_create(TYPE_I2C_BUS, parent, name));
> +    bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
>      QLIST_INIT(&bus->current_devs);
>      vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
>      return bus;
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index cffaa35e9cf..6c31398dda6 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -64,7 +64,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      }
>  
> -    isabus = ISA_BUS(qbus_create(TYPE_ISA_BUS, dev, NULL));
> +    isabus = ISA_BUS(qbus_new(TYPE_ISA_BUS, dev, NULL));
>      isabus->address_space = address_space;
>      isabus->address_space_io = address_space_io;
>      return isabus;
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 434ff8d910d..8a8012f5f08 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -65,7 +65,7 @@ AUXBus *aux_bus_init(DeviceState *parent, const char *name)
>      AUXBus *bus;
>      Object *auxtoi2c;
>  
> -    bus = AUX_BUS(qbus_create(TYPE_AUX_BUS, parent, name));
> +    bus = AUX_BUS(qbus_new(TYPE_AUX_BUS, parent, name));
>      auxtoi2c = object_new_with_props(TYPE_AUXTOI2C, OBJECT(bus), "i2c",
>                                       &error_abort, NULL);
>  
> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index 7c329300b82..148979dab13 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -16,7 +16,7 @@ static void mac_nubus_bridge_init(Object *obj)
>      MacNubusState *s = MAC_NUBUS_BRIDGE(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>  
> -    s->bus = NUBUS_BUS(qbus_create(TYPE_NUBUS_BUS, DEVICE(s), NULL));
> +    s->bus = NUBUS_BUS(qbus_new(TYPE_NUBUS_BUS, DEVICE(s), NULL));
>  
>      sysbus_init_mmio(sbd, &s->bus->super_slot_io);
>      sysbus_init_mmio(sbd, &s->bus->slot_io);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 14cb15a0aa1..186758ee11f 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -478,7 +478,7 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
>  {
>      PCIBus *bus;
>  
> -    bus = PCI_BUS(qbus_create(typename, parent, name));
> +    bus = PCI_BUS(qbus_new(typename, parent, name));
>      pci_root_bus_internal_init(bus, parent, address_space_mem,
>                                 address_space_io, devfn_min);
>      return bus;
> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
> index b59452bcd62..b975ed29cad 100644
> --- a/hw/ppc/spapr_vio.c
> +++ b/hw/ppc/spapr_vio.c
> @@ -577,7 +577,7 @@ SpaprVioBus *spapr_vio_bus_init(void)
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      /* Create bus on bridge device */
> -    qbus = qbus_create(TYPE_SPAPR_VIO_BUS, dev, "spapr-vio");
> +    qbus = qbus_new(TYPE_SPAPR_VIO_BUS, dev, "spapr-vio");
>      bus = SPAPR_VIO_BUS(qbus);
>      bus->next_reg = SPAPR_VIO_REG_BASE;
>  
> diff --git a/hw/s390x/ap-bridge.c b/hw/s390x/ap-bridge.c
> index 8bcf8ece9dd..ef8fa2b15be 100644
> --- a/hw/s390x/ap-bridge.c
> +++ b/hw/s390x/ap-bridge.c
> @@ -55,7 +55,7 @@ void s390_init_ap(void)
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      /* Create bus on bridge device */
> -    bus = qbus_create(TYPE_AP_BUS, dev, TYPE_AP_BUS);
> +    bus = qbus_new(TYPE_AP_BUS, dev, TYPE_AP_BUS);
>  
>      /* Enable hotplugging */
>      qbus_set_hotplug_handler(bus, OBJECT(dev));
> diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
> index 191b29f0771..4017081d49c 100644
> --- a/hw/s390x/css-bridge.c
> +++ b/hw/s390x/css-bridge.c
> @@ -106,7 +106,7 @@ VirtualCssBus *virtual_css_bus_init(void)
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>  
>      /* Create bus on bridge device */
> -    bus = qbus_create(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
> +    bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
>      cbus = VIRTUAL_CSS_BUS(bus);
>  
>      /* Enable hotplugging */
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 6c0225c3a01..6fafffb029a 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -813,7 +813,7 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>      qbus_set_hotplug_handler(bus, OBJECT(dev));
>      phb->bus = b;
>  
> -    s->bus = S390_PCI_BUS(qbus_create(TYPE_S390_PCI_BUS, dev, NULL));
> +    s->bus = S390_PCI_BUS(qbus_new(TYPE_S390_PCI_BUS, dev, NULL));
>      qbus_set_hotplug_handler(BUS(s->bus), OBJECT(dev));
>  
>      s->iommu_table = g_hash_table_new_full(g_int64_hash, g_int64_equal,
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index e5d7ce95237..003931fb509 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -107,7 +107,7 @@ DeviceState *ssi_create_peripheral(SSIBus *bus, const char *name)
>  SSIBus *ssi_create_bus(DeviceState *parent, const char *name)
>  {
>      BusState *bus;
> -    bus = qbus_create(TYPE_SSI_BUS, parent, name);
> +    bus = qbus_new(TYPE_SSI_BUS, parent, name);
>      return SSI_BUS(bus);
>  }
>  
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 8c588920d9f..416583f130b 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -1398,7 +1398,7 @@ type_init(xen_register_types)
>  void xen_bus_init(void)
>  {
>      DeviceState *dev = qdev_new(TYPE_XEN_BRIDGE);
> -    BusState *bus = qbus_create(TYPE_XEN_BUS, dev, NULL);
> +    BusState *bus = qbus_new(TYPE_XEN_BUS, dev, NULL);
>  
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      qbus_set_bus_hotplug_handler(bus);
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index dd8ae1452d1..be3cf4a195e 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -702,7 +702,7 @@ int xen_be_init(void)
>  
>      xen_sysdev = qdev_new(TYPE_XENSYSDEV);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(xen_sysdev), &error_fatal);
> -    xen_sysbus = qbus_create(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
> +    xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
>      qbus_set_bus_hotplug_handler(xen_sysbus);
>  
>      return 0;
> -- 
> 2.20.1
> 
> 

