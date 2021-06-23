Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A63B1864
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:04:07 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0fu-0002vI-W4
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0f1-0001xm-Cp
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:03:11 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lw0ex-0006S4-FY
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 07:03:11 -0400
Received: by mail-oi1-x22f.google.com with SMTP id q10so2870746oij.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OnPQnn1zyWYGWugr7FA1pJpmNdTYp4NNH9S144Cdfjo=;
 b=GNKqHCbaI4CkCUXtSfRkU10wdDxZ4y5M37Aaym89oKhfFgsmDHgMckVG7a4snUC//u
 vjcXrVko6W5MaOrzZi6PbSLcK+X31FDwBUQv5WRTWO73Cpn8jammWfjSAbPK9BSB0tcQ
 98yX+hIuW5pLJBEc67qmjPhixu97+MGfGtcIBCV30ptOOlL92yXUnKpFDon4GttLs25a
 5x0dL/w/Ft4Q9T40Xp932dPh8FILhDysyZniWZmSon59QFS/fsO7UW3+ODBqTLLHN6/g
 yLpSHfF0hmSwuhYsqK7H5oiWz+B1Un83pIqRdKRi7VXXOix4kO+LFpMT7CLi/L00sTfx
 guMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnPQnn1zyWYGWugr7FA1pJpmNdTYp4NNH9S144Cdfjo=;
 b=HmsWHETProCOF9X5MonQ9RX4MiBh+ZZKqmnZF8eORfVb1JT2nwHPnj3kUZr92CbCRo
 GyqCyEY3sJvhxkXUKgNh68zIe1kuKPOkCXuTNEVIAX65GTO9NvPPZh8ltnjbW3MItYY7
 m6QA9cIK4bnL4G4biJTKLRWdtyv1ZucFEZ7/b0+R7l/e3gKj295HcIRL3ou/xvAyyEV0
 XkrzG2rrLpLnlF29Mobhlu+Dtqnb/23arAZS6ZZj+qUBdjTnsW8F11VRnCbeyGITM000
 FSagNnmmwln/V8ddkiNRKYpXwYRLRqUCDNOMTJxfJOt8v8Ab1CL0kQQJKWG9w3jpw+Xi
 gw8A==
X-Gm-Message-State: AOAM5301jgLpU8xGnAtesJ3B3bRgYxiPl3tNkTm/ryyVERnJ/MXzVFic
 qRh3+Ei1bXbPPnGub/wdkW3/DkwRdTq/aGfUS8w=
X-Google-Smtp-Source: ABdhPJwacIQ6d48DRoBtUZue7o0VcPUy/yQ13hyNqb+EIn3vPDVe8Cv+3tYH90TgN6uF8h3zFjO50Kof5ip2xHM328c=
X-Received: by 2002:aca:c453:: with SMTP id u80mr2614612oif.93.1624446186227; 
 Wed, 23 Jun 2021 04:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-5-jusual@redhat.com>
 <20210617170207-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210617170207-mutt-send-email-mst@kernel.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Wed, 23 Jun 2021 14:02:55 +0300
Message-ID: <CAC_L=vUjRarOqet2NYFrLDR9=Jn+fKTRc39Nfgi+ttHOZnXGYg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] hw/pci/pcie: Do not set HPC flag if acpihp is used
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e30d5605c56cd90c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e30d5605c56cd90c
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 12:02 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Jun 17, 2021 at 09:07:36PM +0200, Julia Suvorova wrote:
> > Instead of changing the hot-plug type in _OSC register, do not
> > set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
> > hot-plug if it is preferred and leave the option to use SHPC with
> > pcie-pci-bridge.
> >
> > The ability to control hot-plug for each downstream port is retained,
> > while 'hotplug=off' on the port means all hot-plug types are disabled.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
>
> Marcel want to review this?
>
>
Sure


> > ---
> >  include/hw/pci/pcie_port.h |  5 ++++-
> >  hw/acpi/pcihp.c            |  8 ++++++++
> >  hw/core/machine.c          |  1 -
> >  hw/i386/pc_q35.c           | 11 +++++++++++
> >  hw/pci/pcie.c              |  8 +++++++-
> >  hw/pci/pcie_port.c         |  1 +
> >  6 files changed, 31 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > index bea8ecad0f..e25b289ce8 100644
> > --- a/include/hw/pci/pcie_port.h
> > +++ b/include/hw/pci/pcie_port.h
> > @@ -57,8 +57,11 @@ struct PCIESlot {
> >      /* Disable ACS (really for a pcie_root_port) */
> >      bool        disable_acs;
> >
> > -    /* Indicates whether hot-plug is enabled on the slot */
> > +    /* Indicates whether any type of hot-plug is allowed on the slot */
> >      bool        hotplug;
> > +
> > +    bool        native_hotplug;
> > +
> >      QLIST_ENTRY(PCIESlot) next;
> >  };
> >
> > diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> > index 5355618608..7a6bc1b31e 100644
> > --- a/hw/acpi/pcihp.c
> > +++ b/hw/acpi/pcihp.c
> > @@ -31,6 +31,7 @@
> >  #inhw/pci/pcie.cclude "hw/pci/pci.h"
> >  #include "hw/pci/pci_bridge.h"
> >  #include "hw/pci/pci_host.h"
> > +#include "hw/pci/pcie_port.h"
> >  #include "hw/i386/acpi-build.h"
> >  #include "hw/acpi/acpi.h"
> >  #include "hw/pci/pci_bus.h"
> > @@ -332,6 +333,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler
> *hotplug_dev, AcpiPciHpState *s,
> >              object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
> >              PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
> >
> > +            /* Remove all hot-plug handlers if hot-plug is disabled on
> slot */
> > +            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
> > +                !PCIE_SLOT(pdev)->hotplug) {
> > +                qbus_set_hotplug_handler(BUS(sec), NULL);
> > +                return;
> > +            }
> > +
> >              qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
> >              /* We don't have to overwrite any other hotplug handler yet
> */
> >              assert(QLIST_EMPTY(&sec->child));
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 55b9bc7817..6ed0575d81 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -582,7 +582,6 @@ static void machine_set_memdev(Object *obj, const
> char *value, Error **errp)
> >      ms->ram_memdev_id = g_strdup(value);
> >  }
> >
> > -
> >  static void machine_init_notify(Notifier *notifier, void *data)
> >  {
> >      MachineState *machine = MACHINE(qdev_get_machine());
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 46a0f196f4..a0ec7964cc 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -37,6 +37,7 @@
> >  #include "sysemu/kvm.h"
> >  #include "hw/kvm/clock.h"
> >  #include "hw/pci-host/q35.h"
> > +#include "hw/pci/pcie_port.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/i386/x86.h"
> >  #include "hw/i386/pc.h"
> > @@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
> >      ram_addr_t lowmem;
> >      DriveInfo *hd[MAX_SATA_PORTS];
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> > +    bool acpi_pcihp;
> >
> >      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> >       * and 256 Mbytes for PCI Express Enhanced Configuration Access
> Mapping
> > @@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
> >      object_property_set_link(OBJECT(machine),
> PC_MACHINE_ACPI_DEVICE_PROP,
> >                               OBJECT(lpc), &error_abort);
> >
> > +    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
> > +
> "acpi-pci-hotplug-with-bridge-support",
> > +                                          NULL);
> > +
> > +    if (acpi_pcihp) {
> > +        object_register_sugar_prop(TYPE_PCIE_SLOT,
> "enable-native-hotplug",
> > +                                  "false", true);
> > +    }
> > +
> >      /* irq lines */
> >      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> >
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index fd0fa157e8..6e95d82903 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
> >                                 PCI_EXP_SLTCAP_PIP |
> >                                 PCI_EXP_SLTCAP_AIP |
> >                                 PCI_EXP_SLTCAP_ABP);
> > -    if (s->hotplug) {
> > +
> > +    /*
> > +     * Enable native hot-plug on all hot-plugged bridges unless
> > +     * hot-plug is disabled on the slot.
> > +     */
> > +    if (s->hotplug &&
> > +        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
> >          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
> >                                     PCI_EXP_SLTCAP_HPS |
> >                                     PCI_EXP_SLTCAP_HPC);
> > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > index eb563ad435..a410111825 100644
> > --- a/hw/pci/pcie_port.c
> > +++ b/hw/pci/pcie_port.c
> > @@ -148,6 +148,7 @@ static Property pcie_slot_props[] = {
> >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > +    DEFINE_PROP_BOOL("enable-native-hotplug", PCIESlot, native_hotplug,
> true),
> >      DEFINE_PROP_END_OF_LIST()
> >  };
> >
> > --
> > 2.30.2
>
>
Looks good to me.
I also like Igor's comment (rename native-hotplug), a patch on top is just
fine.


 Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Thanks,
Marcel

--000000000000e30d5605c56cd90c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 18, 2021 at 12:02 AM Mich=
ael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Jun 17, 2021 at 09:07:36PM +0200, Julia Suvorova wrote:<=
br>
&gt; Instead of changing the hot-plug type in _OSC register, do not<br>
&gt; set the &#39;Hot-Plug Capable&#39; flag. This way guest will choose AC=
PI<br>
&gt; hot-plug if it is preferred and leave the option to use SHPC with<br>
&gt; pcie-pci-bridge.<br>
&gt; <br>
&gt; The ability to control hot-plug for each downstream port is retained,<=
br>
&gt; while &#39;hotplug=3Doff&#39; on the port means all hot-plug types are=
 disabled.<br>
&gt; <br>
&gt; Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com"=
 target=3D"_blank">jusual@redhat.com</a>&gt;<br>
<br>
Marcel want to review this?<br>
<br></blockquote><div><br></div><div>Sure</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; ---<br>
&gt;=C2=A0 include/hw/pci/pcie_port.h |=C2=A0 5 ++++-<br>
&gt;=C2=A0 hw/acpi/pcihp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 8 ++++++++<br>
&gt;=C2=A0 hw/core/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<=
br>
&gt;=C2=A0 hw/i386/pc_q35.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++=
+++++++++<br>
&gt;=C2=A0 hw/pci/pcie.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 +++++++-<br>
&gt;=C2=A0 hw/pci/pcie_port.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<=
br>
&gt;=C2=A0 6 files changed, 31 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h<b=
r>
&gt; index bea8ecad0f..e25b289ce8 100644<br>
&gt; --- a/include/hw/pci/pcie_port.h<br>
&gt; +++ b/include/hw/pci/pcie_port.h<br>
&gt; @@ -57,8 +57,11 @@ struct PCIESlot {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Disable ACS (really for a pcie_root_port) */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 disable_acs;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /* Indicates whether hot-plug is enabled on the slot */=
<br>
&gt; +=C2=A0 =C2=A0 /* Indicates whether any type of hot-plug is allowed on=
 the slot */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 hotplug;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 native_hotplug;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QLIST_ENTRY(PCIESlot) next;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c<br>
&gt; index 5355618608..7a6bc1b31e 100644<br>
&gt; --- a/hw/acpi/pcihp.c<br>
&gt; +++ b/hw/acpi/pcihp.c<br>
&gt; @@ -31,6 +31,7 @@<br>
&gt;=C2=A0 #inhw/pci/pcie.cclude &quot;hw/pci/pci.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_bridge.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_host.h&quot;<br>
&gt; +#include &quot;hw/pci/pcie_port.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/acpi-build.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/acpi/acpi.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci/pci_bus.h&quot;<br>
&gt; @@ -332,6 +333,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *ho=
tplug_dev, AcpiPciHpState *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_dynamic_cast(OB=
JECT(dev), TYPE_PCI_BRIDGE)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIBus *sec =3D pci_br=
idge_get_sec_bus(PCI_BRIDGE(pdev));<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remove all hot-plug hand=
lers if hot-plug is disabled on slot */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (object_dynamic_cast(OBJ=
ECT(dev), TYPE_PCIE_SLOT) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !PCIE_SLOT(pd=
ev)-&gt;hotplug) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qbus_set_hotp=
lug_handler(BUS(sec), NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qbus_set_hotplug_handl=
er(BUS(sec), OBJECT(hotplug_dev));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We don&#39;t have t=
o overwrite any other hotplug handler yet */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(QLIST_EMPTY(&am=
p;sec-&gt;child));<br>
&gt; diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
&gt; index 55b9bc7817..6ed0575d81 100644<br>
&gt; --- a/hw/core/machine.c<br>
&gt; +++ b/hw/core/machine.c<br>
&gt; @@ -582,7 +582,6 @@ static void machine_set_memdev(Object *obj, const =
char *value, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ms-&gt;ram_memdev_id =3D g_strdup(value);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 static void machine_init_notify(Notifier *notifier, void *data)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MachineState *machine =3D MACHINE(qdev_get_machine=
());<br>
&gt; diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c<br>
&gt; index 46a0f196f4..a0ec7964cc 100644<br>
&gt; --- a/hw/i386/pc_q35.c<br>
&gt; +++ b/hw/i386/pc_q35.c<br>
&gt; @@ -37,6 +37,7 @@<br>
&gt;=C2=A0 #include &quot;sysemu/kvm.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/kvm/clock.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/pci-host/q35.h&quot;<br>
&gt; +#include &quot;hw/pci/pcie_port.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/qdev-properties.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/x86.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/pc.h&quot;<br>
&gt; @@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ram_addr_t lowmem;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DriveInfo *hd[MAX_SATA_PORTS];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(machine);<b=
r>
&gt; +=C2=A0 =C2=A0 bool acpi_pcihp;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check whether RAM fits below 4G (leaving 1/2 GB=
yte for IO memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* and 256 Mbytes for PCI Express Enhanced Co=
nfiguration Access Mapping<br>
&gt; @@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 object_property_set_link(OBJECT(machine), PC_MACHI=
NE_ACPI_DEVICE_PROP,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJECT(lpc), &amp;error_abort);<br=
>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 acpi_pcihp =3D object_property_get_bool(OBJECT(lpc),<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;acpi-pci-hotplug-with-bridge-support&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (acpi_pcihp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_register_sugar_prop(TYPE_PCIE_SLOT=
, &quot;enable-native-hotplug&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;false&quot;, true);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* irq lines */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gsi_state =3D pc_gsi_create(&amp;x86ms-&gt;gsi, pc=
mc-&gt;pci_enabled);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c<br>
&gt; index fd0fa157e8..6e95d82903 100644<br>
&gt; --- a/hw/pci/pcie.c<br>
&gt; +++ b/hw/pci/pcie.c<br>
&gt; @@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot =
*s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_EXP_SLTCAP_PIP |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_EXP_SLTCAP_AIP |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_EXP_SLTCAP_ABP);<br>
&gt; -=C2=A0 =C2=A0 if (s-&gt;hotplug) {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Enable native hot-plug on all hot-plugged bridg=
es unless<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* hot-plug is disabled on the slot.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;hotplug &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (s-&gt;native_hotplug || DEVICE(dev)-&gt;=
hotplugged)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_long_test_and_set_mask(dev-&gt;c=
onfig + pos + PCI_EXP_SLTCAP,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_EXP_SLTCA=
P_HPS |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_EXP_SLTCA=
P_HPC);<br>
&gt; diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c<br>
&gt; index eb563ad435..a410111825 100644<br>
&gt; --- a/hw/pci/pcie_port.c<br>
&gt; +++ b/hw/pci/pcie_port.c<br>
&gt; @@ -148,6 +148,7 @@ static Property pcie_slot_props[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT8(&quot;chassis&quot;, PCIESlot, c=
hassis, 0),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;slot&quot;, PCIESlot, slo=
t, 0),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;hotplug&quot;, PCIESlot, ho=
tplug, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;enable-native-hotplug&quot;, PCI=
ESlot, native_hotplug, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST()<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.30.2<br>
<br></blockquote><div><br></div><div>Looks good to me.</div><div>I also lik=
e Igor&#39;s comment (rename native-hotplug), a patch on top is just fine.<=
/div><div><br></div><div><br></div><div>=C2=A0Reviewed-by: Marcel Apfelbaum=
 &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com" target=3D"_blank">marcel=
.apfelbaum@gmail.com</a>&gt;</div><div><div><br></div><div>Thanks,</div><di=
v>Marcel</div></div><div class=3D"gmail-yj6qo"></div><div class=3D"gmail-ad=
L"><br></div><div class=3D"gmail-adL"><br></div></div></div>

--000000000000e30d5605c56cd90c--

