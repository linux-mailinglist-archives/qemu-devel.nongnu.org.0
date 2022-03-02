Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82B4C9EA8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 08:54:13 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPJoK-0001X7-5S
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 02:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nPJmB-0000n4-2Q
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nPJm9-00088E-DA
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 02:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646207516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCSsP/fQOL/0jYLoo3GzvHxxi7pAIu5Xn2+wiSnWwh8=;
 b=DHeeC+B99Ngw5pyvqW3v+1YNo0gdgu37gOyuf9MCDBOU2OLCGsl6W9bC0KeFZ5EZPbEAAO
 Fpslxrqf6G5a1S1SExYwJSBGA9LU2s+5Ava2Z1z79urkNHjhjqucM41x2o3XOmSDDM7nbz
 lcFQWGS9wc2BLmFIhHYQs5GMnoBcOLY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-PyWy3b-GNMmUsKVYlFiD5w-1; Wed, 02 Mar 2022 02:51:55 -0500
X-MC-Unique: PyWy3b-GNMmUsKVYlFiD5w-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso533779edh.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 23:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cCSsP/fQOL/0jYLoo3GzvHxxi7pAIu5Xn2+wiSnWwh8=;
 b=rPTJL5NzbT3xhcKBbJmDDOJVOTcuWggAXNHJ1ykmjqtrjDsoQ5LWJv6SxPCypF2I3C
 0KYG19JC71F25Oywp1IMfETOmy3Il5EZAja8+Ra6hdkpfimIBhBPgyrAdRDBW9NN/WA1
 QVINVB7QLSY7i9jwRixdlFFL0G+KaRXokJykTMDmueInfXIwkxemK8WQV6wleum6PgIh
 iGX4xAdfJHs3cYD3VZj188opG1BKUO240BaRA0oaPrUsWtbC04aL2JhDP/iY0Iv4VVPX
 /xq/uwPdqnZVcu0jnJqRnvJh5dOwKH5dtNgJ1qrs7GGp+u8RyIyULD48/Y3erWpaQvZa
 2ktw==
X-Gm-Message-State: AOAM530yOKYPjxnuVSC4hD4bkkDQi/zfJAlRjsjM1u41OzGEOmQogmvh
 8utJ/Xj9AW7cxy3+MiNErQh8FyCavBv0CcFja+xT6pMiUnmKF9Ftcfy2Q7qaSqW0nXDwZB/Dngd
 zg7enM3CNZerII8I=
X-Received: by 2002:a17:906:1e42:b0:6d6:df12:7f8d with SMTP id
 i2-20020a1709061e4200b006d6df127f8dmr7174190ejj.15.1646207514198; 
 Tue, 01 Mar 2022 23:51:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA6l+IQR5CbJ8DLktf0ttGSAq0ShSBCH+G/1UWS787IbGwssHgcWCmXqKO1Bt69b0wTshENw==
X-Received: by 2002:a17:906:1e42:b0:6d6:df12:7f8d with SMTP id
 i2-20020a1709061e4200b006d6df127f8dmr7174175ejj.15.1646207513989; 
 Tue, 01 Mar 2022 23:51:53 -0800 (PST)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 q10-20020aa7cc0a000000b0040f826f09fdsm8230010edt.81.2022.03.01.23.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 23:51:53 -0800 (PST)
Date: Wed, 2 Mar 2022 08:51:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 3/3] q35: compat: keep hotplugged PCIe device broken
 after migration for 6.2 and older machine types
Message-ID: <20220302085151.22a0bb20@redhat.com>
In-Reply-To: <20220301101828-mutt-send-email-mst@kernel.org>
References: <20220301151200.3507298-1-imammedo@redhat.com>
 <20220301151200.3507298-4-imammedo@redhat.com>
 <20220301101828-mutt-send-email-mst@kernel.org>
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

On Tue, 1 Mar 2022 10:20:06 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Mar 01, 2022 at 10:12:00AM -0500, Igor Mammedov wrote:
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
> > Introduce x-pcihp-disable-pcie-slot-power-on-fixup compat
> > property to keep 6.2 and older machine types in broken state
> > when ACPI PCI hotplug is enabled to make sure that guest does
> > see the same PCIe device and slot on src & dst.
> > 
> > 1)
> > Fixes: d5daff7d312 (pcie: implement slot power control for pcie root ports)
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> I am not sure why we need this one. What's the scenario that's broken
> otherwise?

Probably none (but I won't bet on it) beside user confusion where device
sometimes works and sometimes don't for 6.1-6.2 machine types depending
on whether source runs qemu-6.2 or not.
Guest also will observe PCI_EXP_SLTCTL_PCC flip depending on source QEMU
version, but it shouldn't use it anyways since slot is under control of
ACPI CPI hotplug module.

Feel free to drop this patch if you think it's overkill.

> 
> 
> > ---
> >  include/hw/acpi/pcihp.h |  1 +
> >  hw/acpi/ich9.c          | 20 ++++++++++++++++++++
> >  hw/acpi/pcihp.c         | 11 +++++++----
> >  hw/core/machine.c       |  4 +++-
> >  4 files changed, 31 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> > index af1a169fc3..2436151678 100644
> > --- a/include/hw/acpi/pcihp.h
> > +++ b/include/hw/acpi/pcihp.h
> > @@ -52,6 +52,7 @@ typedef struct AcpiPciHpState {
> >      bool legacy_piix;
> >      uint16_t io_base;
> >      uint16_t io_len;
> > +    bool disable_pcie_slot_power_on_fixup;
> >  } AcpiPciHpState;
> >  
> >  void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index bd9bbade70..e3bffdef71 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -430,6 +430,23 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
> >      s->pm.keep_pci_slot_hpc = value;
> >  }
> >  
> > +static bool ich9_pm_get_disable_pcie_slot_power_on_fixup(Object *obj,
> > +                                                         Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    return s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup;
> > +}
> > +
> > +static void ich9_pm_set_disable_pcie_slot_power_on_fixup(Object *obj,
> > +                                                         bool value,
> > +                                                         Error **errp)
> > +{
> > +    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
> > +
> > +    s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup = value;
> > +}
> > +
> >  void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >  {
> >      static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
> > @@ -469,6 +486,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
> >      object_property_add_bool(obj, "x-keep-pci-slot-hpc",
> >                               ich9_pm_get_keep_pci_slot_hpc,
> >                               ich9_pm_set_keep_pci_slot_hpc);
> > +    object_property_add_bool(obj, "x-pcihp-disable-pcie-slot-power-on-fixup",
> > +                             ich9_pm_get_disable_pcie_slot_power_on_fixup,
> > +                             ich9_pm_set_disable_pcie_slot_power_on_fixup);
> >  }
> >  
> >  void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 6351bd3424..4c06caf4a9 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -369,10 +369,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
> >      }
> >  
> >      bus = pci_get_bus(pdev);
> > -    bridge = pci_bridge_get_device(bus);
> > -    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
> > -        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
> > -        pcie_cap_slot_enable_power(bridge);
> > +    /* compat knob to preserve pci_config as in 6.2 & older when pcihp in use */
> > +    if (s->disable_pcie_slot_power_on_fixup == false) {
> > +        bridge = pci_bridge_get_device(bus);
> > +        if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
> > +            object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
> > +            pcie_cap_slot_enable_power(bridge);
> > +        }
> >      }
> >  
> >      bsel = acpi_pcihp_get_bsel(bus);
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index d856485cb4..1758b49c2f 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -37,7 +37,9 @@
> >  #include "hw/virtio/virtio.h"
> >  #include "hw/virtio/virtio-pci.h"
> >  
> > -GlobalProperty hw_compat_6_2[] = {};
> > +GlobalProperty hw_compat_6_2[] = {
> > +    { "ICH9-LPC", "x-pcihp-disable-pcie-slot-power-on-fixup", "on" },
> > +};
> >  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
> >  
> >  GlobalProperty hw_compat_6_1[] = {
> > -- 
> > 2.31.1  
> 


