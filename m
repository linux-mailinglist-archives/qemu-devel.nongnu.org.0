Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8704C40ED
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:07:14 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWZF-0008CS-90
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:07:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNVv2-0006KW-MJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNVuy-0001rc-F8
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645777534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yL9nhbG6PdfCTZxQ78ZurdvtRqxbPc3ErNR1UxtlVkY=;
 b=ZIbX/n21TUkHp4/YU+7Jeagz0/A1Rqnas98mud2fzXFiVHYs2zOrCfAM7JpMDpvjO2lmU1
 yl/hnmb7I8S2cf3DjkcSOw+iaN6R1g1vlAswQiDJCr7OkhZrWaGGTKmlUt+EaWsZy9MRDO
 DHaeyzvU3hse+qMjJcV3xMQSHA+5JSg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-rp7DomtrOICaw2DFLxYO8Q-1; Fri, 25 Feb 2022 03:25:33 -0500
X-MC-Unique: rp7DomtrOICaw2DFLxYO8Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 m11-20020a056402430b00b00410678d119eso1948433edc.21
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yL9nhbG6PdfCTZxQ78ZurdvtRqxbPc3ErNR1UxtlVkY=;
 b=MlR9Eb4GncPXGWtLBkBr5rRy6GMvVCUb9wG4Ry/UOBV87YJRRsEJSo2ANw0Fav3z5R
 F4QxRGbmyoBEn6GR9zmJFiVyw/TBVuUbYQUXihEPvEAEErY3rX0dnBGi2a5Q2NjFB3Cw
 jSfRso3aHP+VdyX0SHMzPO7bcjTroz23uUT+ssxuDFEoc+4CuXLo9/SgSCo6J/6ZQi+e
 rtLIqE7sk9xyAGmh6AxIds+o68bTiIe5Mf9dQJlh58xsEBjyjGL6+4vOJ7+6SUmUBuPR
 0Iexscj9gi6FczKBCDcF6DS70IeYdLxVjijDVIt5lVsRqFvpDSt5G0vMJh5kHjd+fMYC
 /PqQ==
X-Gm-Message-State: AOAM532oRmICsa3wMUfa7ykQw6FlaBLCPMAl1NfWexxqXiYfkpZ+EHGu
 rKxVM56R6qAUmq8sacJ8sL4BgCuDZVDjUbylCs3EFGSwkt/2klPDoelWsgIqxTZKLDMCz8LF+Fd
 ZyqSidBph1vpucuc=
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id
 h20-20020a05640250d400b004132a276b56mr6152516edb.228.1645777532410; 
 Fri, 25 Feb 2022 00:25:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmjMOqEsJaL2uI57zKzaA2Z4fDmU37XljUuDEvWsT2CqQYnUqbIGOh7PXi5kO+GJGn3wQEAQ==
X-Received: by 2002:a05:6402:50d4:b0:413:2a27:6b56 with SMTP id
 h20-20020a05640250d400b004132a276b56mr6152496edb.228.1645777532060; 
 Fri, 25 Feb 2022 00:25:32 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1709062dd200b006cea705948fsm694876eji.215.2022.02.25.00.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:25:31 -0800 (PST)
Date: Fri, 25 Feb 2022 09:25:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 4/4] q35: compat: keep hotplugged PCIe device broken
 after migration for 6.2-older machine types
Message-ID: <20220225092530.3c632135@redhat.com>
In-Reply-To: <20220224130910-mutt-send-email-mst@kernel.org>
References: <20220224174411.3296848-1-imammedo@redhat.com>
 <20220224174411.3296848-5-imammedo@redhat.com>
 <20220224130910-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Thu, 24 Feb 2022 13:11:53 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Feb 24, 2022 at 12:44:11PM -0500, Igor Mammedov wrote:
> > Q35 switched to ACPI PCI hotplug by default in since 6.1
> > machine type and migration worked as expected (with BARs
> > on target being the same as on source)
> > 
> > However native PCIe fixes [1] merged in 6.2 time, regressed
> > migration part, resulting in disabled BARs on target. The
> > issue affects pc-q35-6.2 and pc-q35-6.1 machine types (and
> > older if qemu-6.2 binary is used on source with manually
> > enabled ACPI PCI hotplug).
> > 
> > Introduce x-pcihp-enable-pcie-pcp-cap compat property to
> > keep 6.2 and older machine types in broken state when ACPI
> > PCI hotplug is enabled to make sure that guest does see the
> > same PCIe device and slot on  rc & dst (i.e. with or without
> > power control present/configured).
> > 
> > 1) commit d5daff7d312 (pcie: implement slot power control for pcie root ports)
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/acpi/pcihp.h         |  4 +++-
> >  hw/acpi/acpi-pci-hotplug-stub.c |  3 ++-
> >  hw/acpi/ich9.c                  | 21 ++++++++++++++++++++-
> >  hw/acpi/pcihp.c                 | 20 ++++++++++++--------
> >  hw/acpi/piix4.c                 |  3 ++-
> >  hw/core/machine.c               |  4 +++-
> >  6 files changed, 42 insertions(+), 13 deletions(-)
> > 
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > index af1a169fc3..06466dd2a8 100644
> > --- a/include/hw/acpi/pcihp.h
> > +++ b/include/hw/acpi/pcihp.h
> > @@ -52,6 +52,7 @@ typedef struct AcpiPciHpState {
> >      bool legacy_piix;
> >      uint16_t io_base;
> >      uint16_t io_len;
> > +    bool enable_pcie_pcp_cap;
> >  } AcpiPciHpState;
> >  
> >  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> > @@ -59,7 +60,8 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> >                       uint16_t io_base);
> >  
> >  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > -                                   DeviceState *dev, Error **errp);
> > +                                   AcpiPciHpState *s, DeviceState *dev,
> > +                                   Error **errp);
> >  void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >                                 DeviceState *dev, Error **errp);
> >  void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> > diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
> > index 734e4c5986..6904b772b3 100644
> > --- a/hw/acpi/acpi-pci-hotplug-stub.c
> > +++ b/hw/acpi/acpi-pci-hotplug-stub.c
> > @@ -18,7 +18,8 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >  }
> >  
> >  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > -                                   DeviceState *dev, Error **errp)
> > +                                   AcpiPciHpState *s, DeviceState *dev,
> > +                                   Error **errp)
> >  {
> >      return;
> >  }
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index bd9bbade70..928d5c101c 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -430,6 +430,21 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> >      s->pm.keep_pci_slot_hpc = value;
> >  }
> >  
> > +static bool ich9_pm_get_enable_pcie_pcp_cap(Object *obj, Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    return s->pm.acpi_pci_hotplug.enable_pcie_pcp_cap;
> > +}
> > +
> > +static void ich9_pm_set_enable_pcie_pcp_cap(Object *obj, bool value,
> > +                                             Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    s->pm.acpi_pci_hotplug.enable_pcie_pcp_cap = value;
> > +}
> > +
> >  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >  {
> >      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> > @@ -469,6 +484,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> >                               ich9_pm_get_keep_pci_slot_hpc,
> >                               ich9_pm_set_keep_pci_slot_hpc);
> > +    object_property_add_bool(obj, "x-pcihp-enable-pcie-pcp-cap",
> > +                             ich9_pm_get_enable_pcie_pcp_cap,
> > +                             ich9_pm_set_enable_pcie_pcp_cap);
> >  }
> >  
> >  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > @@ -477,7 +495,8 @@ void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> >      ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
> >  
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > -        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> > +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, &lpc->pm.acpi_pci_hotplug,
> > +                                      dev, errp);
> >          return;
> >      }
> >  
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index bc47d1bf64..4c1fdb2211 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -291,7 +291,8 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
> >  #define ONBOARD_INDEX_MAX (16 * 1024 - 1)
> >  
> >  void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > -                                   DeviceState *dev, Error **errp)
> > +                                   AcpiPciHpState *s, DeviceState *dev,
> > +                                   Error **errp)
> >  {
> >      PCIDevice *pdev = PCI_DEVICE(dev);
> >  
> > @@ -331,13 +332,16 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >                                   g_cmp_uint32, NULL);
> >      }
> >  
> > -    /*
> > -     * since acpi_pcihp manages hotplug, disable PCI-E power control on slot
> > -     */
> > -    if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT) ||
> > -        object_dynamic_cast(OBJECT(dev), TYPE_XIO3130_DOWNSTREAM)) {
> > -        object_property_set_bool(OBJECT(dev), COMPAT_PROP_PCP, false,
> > -                                 &error_abort);
> > +    /* compat knob to preserve pci_config as in 6.2 & older when pcihp in use */  
> 
> This comment probably belongs where the field is defined, not where
> it's used.
ok

> 
> > +    if (s->enable_pcie_pcp_cap == false) {
> > +        /*
> > +         * since acpi_pcihp manages hotplug, disable PCI-E power control on slot  
> 
> Do we then need to check ACPI_PM_PROP_ACPI_PCIHP_BRIDGE to make sure
> acpi hotplug is actually enabled?

no need for it,
this code path is called only when acpi hotplug is enabled.
In case it's disabled these callbacks are not wired to affected PCI buses,
and PCI[e] uses default native hotplug callbacks.


> > +         */
> > +        if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT) ||
> > +            object_dynamic_cast(OBJECT(dev), TYPE_XIO3130_DOWNSTREAM)) {
> > +            object_property_set_bool(OBJECT(dev), COMPAT_PROP_PCP, false,
> > +                                     &error_abort);
> > +        }
> >      }
> >  }
> >  
> > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > index cc37fa3416..0d25f75112 100644
> > --- a/hw/acpi/piix4.c
> > +++ b/hw/acpi/piix4.c
> > @@ -350,7 +350,8 @@ static void piix4_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> >      PIIX4PMState *s = PIIX4_PM(hotplug_dev);
> >  
> >      if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> > -        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> > +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, &s->acpi_pci_hotplug, dev,
> > +                                      errp);
> >      } else if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> >          if (!s->acpi_memory_hotplug.is_enabled) {
> >              error_setg(errp,
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index d856485cb4..48ffc85f8d 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -37,7 +37,9 @@
> >  #include "hw/virtio/virtio.h"
> >  #include "hw/virtio/virtio-pci.h"
> >  
> > -GlobalProperty hw_compat_6_2[] = {};
> > +GlobalProperty hw_compat_6_2[] = {
> > +    { "ICH9-LPC", "x-pcihp-enable-pcie-pcp-cap", "on" },
> > +};
> >  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
> >  
> >  GlobalProperty hw_compat_6_1[] = {
> > -- 
> > 2.31.1  
> 


