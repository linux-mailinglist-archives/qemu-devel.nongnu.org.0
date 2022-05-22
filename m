Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F3530210
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 11:25:33 +0200 (CEST)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nshq1-0005b7-GF
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 05:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshmU-0004tp-S4; Sun, 22 May 2022 05:21:47 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshmS-0001NQ-Qo; Sun, 22 May 2022 05:21:46 -0400
Received: by mail-qv1-xf34.google.com with SMTP id n10so10245684qvi.5;
 Sun, 22 May 2022 02:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zXow3kajF8K2twX/QurSkjB/x2eSaFRNkqwyDXpJrsU=;
 b=UFuT566Vmj6m9nfpV/xLy4S/siFJ7WFujbUTHTA8dFLBufs8Rs8Rpd8vpRMhGN4MZu
 z22YFGsQ59aJAm/AfEkWr6JnVTC/XxF5Ek5LXpuHRfUlIkhBNrDoQKWaeFTLD+uF9qAd
 vpX3IrVK1hlQZ7u56Zk7TGj9MYfYz5PVRO6aan4vIGJ1Nf4WL2XO1hka2YAvjatlQAnu
 GMhI1MahAqXZbKDRLSy0dYunKslBBXhekZ+qNiG1/r4zLFsTojZil1cdvPAFX39O2GDs
 010oY3DIDrMwP+iEwzaDDaNOVoWHWiyQ0wHVkOuGZOkeY671UOT9bKxDRn3miIFkyBiw
 nISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXow3kajF8K2twX/QurSkjB/x2eSaFRNkqwyDXpJrsU=;
 b=VYev8eDdBlR+/QCzXHGR7dnRbFzz2feWp+0QBWIOvL/HJo+czYNZ9BEAbrrkVI6LTy
 FOeCOOel4y5y7gaY1Id4wFQps/CxHVdHDAs2gkHAtaujnOLn/R0rPoJ9NmP8FgzNymOk
 jLx22v953LQKc8WZ7y5Vm9YlhZxRZSX1LxDC6qXnDcxyu1JS+5P8qEQkaGA117mSlx3v
 QA7rBA9Lz5z2k+2KR55VjMDkAMMFs2m0fmgzHsLJsMj0ASAKkpSKsykgguNav/9Ue2Vg
 WNAef13VceLR1vnA75yWqKCCtuSCtSAlqjGgORO5N+MqQDF1zAwP1S5/ZbPoGo8winEO
 Zj5Q==
X-Gm-Message-State: AOAM5315hL9anQmapTZJsBgrMONYNKiU5dvx5tFbtkMHHYcA7W018ufZ
 +LS8J4hqzQLTZnbZqoZVCC6VCk8+krXmtb00TbE=
X-Google-Smtp-Source: ABdhPJyQeJR7DyVP4tQ7w4Wc7hisYMLqC6pqXpwgw4buGr8uXB5NCZZtKXC3eiEhp5brHHdXaVzXwCQckdAO4gxYHws=
X-Received: by 2002:a05:6214:2265:b0:45a:84e4:42c with SMTP id
 gs5-20020a056214226500b0045a84e4042cmr13665591qvb.109.1653211303481; Sun, 22
 May 2022 02:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-6-shentey@gmail.com>
 <ca32eb63-7a23-706c-cf17-6f74da7f2161@ilande.co.uk>
In-Reply-To: <ca32eb63-7a23-706c-cf17-6f74da7f2161@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 22 May 2022 11:21:26 +0200
Message-ID: <CAG4p6K5smE4G3xTf-miJ5OCgV4y7_BUkORccOpMTjcvPC-GROQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/isa/piix4: Factor out SM bus initialization from
 create() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007b968b05df96400d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=shentey@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000007b968b05df96400d
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 10:39 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 13/05/2022 18:54, Bernhard Beschow wrote:
>
> > Initialize the SM bus just like is done for piix3 which modernizes the
> > code.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/isa/piix4.c                | 15 +++------------
> >   hw/mips/malta.c               |  7 ++++++-
> >   include/hw/southbridge/piix.h |  2 +-
> >   3 files changed, 10 insertions(+), 14 deletions(-)
> >
> > diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> > index 4968c69da9..852e5c4db1 100644
> > --- a/hw/isa/piix4.c
> > +++ b/hw/isa/piix4.c
> > @@ -301,21 +301,12 @@ static void piix4_register_types(void)
> >
> >   type_init(piix4_register_types)
> >
> > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
> > +PCIDevice *piix4_create(PCIBus *pci_bus)
> >   {
> >       PCIDevice *pci;
> > -    DeviceState *dev;
> > -    int devfn = PCI_DEVFN(10, 0);
> >
> > -    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
> > +    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> true,
> >                                             TYPE_PIIX4_PCI_DEVICE);
> > -    dev = DEVICE(pci);
> >
> > -    if (smbus) {
> > -        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
> > -                               qdev_get_gpio_in_named(dev, "isa", 9),
> > -                               NULL, 0, NULL);
> > -    }
> > -
> > -    return dev;
> > +    return pci;
> >   }
>
> I don't think it makes sense to return PCIDevice here: when returning a
> QOM object
> from a function, the general expectation is that for a device you would
> return a
> DeviceState since then it can natively be used by the qdev API. So please
> keep the
> original return type above.
>

Okay, will do.

I've been toying with moving piix4_pm_init() into piix4_realize(), such
that it is created as part of TYPE_PIIX4_PCI_DEVICE - just as the real
hardware. I think I like this solution much better.

>
> > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> > index e446b25ad0..d4bd3549d0 100644
> > --- a/hw/mips/malta.c
> > +++ b/hw/mips/malta.c
> > @@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)
> >       int be;
> >       MaltaState *s;
> >       DeviceState *dev;
> > +    PCIDevice *piix4;
> >
> >       s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
> >       sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
> > @@ -1399,8 +1400,12 @@ void mips_malta_init(MachineState *machine)
> >       empty_slot_init("GT64120", 0, 0x20000000);
> >
> >       /* Southbridge */
> > -    dev = piix4_create(pci_bus, &smbus);
> > +    piix4 = piix4_create(pci_bus);
> > +    dev = DEVICE(piix4);
> >       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
> > +    smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
> > +                          qdev_get_gpio_in_named(dev, "isa", 9),
> > +                          NULL, 0, NULL);
>
> ... then here you can do either "piix4 = PCI_DEVICE(dev)" or perhaps even
> inline it
> directly as PCI_DEVICE(dev)->devfn if it isn't used elsewhere.
>

When instantiating the pm in TYPE_PIIX4_PCI_DEVICE this problem just
disappears magically. So I'd roll with this in v2.

>
> >       /* Interrupt controller */
> >       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
> > diff --git a/include/hw/southbridge/piix.h
> b/include/hw/southbridge/piix.h
> > index b768109f30..bea3b44551 100644
> > --- a/include/hw/southbridge/piix.h
> > +++ b/include/hw/southbridge/piix.h
> > @@ -74,6 +74,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
> >
> >   PIIX3State *piix3_create(PCIBus *pci_bus);
> >
> > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
> > +PCIDevice *piix4_create(PCIBus *pci_bus);
> >
> >   #endif
>
>
> ATB,
>
> Mark.
>

--0000000000007b968b05df96400d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, May 21, 2022 at 10:39 AM Mark Cav=
e-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave-ayl=
and@ilande.co.uk</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 13/05/2022 18:54, Bernhard Be=
schow wrote:<br>
<br>
&gt; Initialize the SM bus just like is done for piix3 which modernizes the=
<br>
&gt; code.<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 15 +++------------<br>
&gt;=C2=A0 =C2=A0hw/mips/malta.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 7 ++++++-<br>
&gt;=C2=A0 =C2=A0include/hw/southbridge/piix.h |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 10 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
&gt; index 4968c69da9..852e5c4db1 100644<br>
&gt; --- a/hw/isa/piix4.c<br>
&gt; +++ b/hw/isa/piix4.c<br>
&gt; @@ -301,21 +301,12 @@ static void piix4_register_types(void)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0type_init(piix4_register_types)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)<br>
&gt; +PCIDevice *piix4_create(PCIBus *pci_bus)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PCIDevice *pci;<br>
&gt; -=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; -=C2=A0 =C2=A0 int devfn =3D PCI_DEVFN(10, 0);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 pci =3D pci_create_simple_multifunction(pci_bus, devfn,=
=C2=A0 true,<br>
&gt; +=C2=A0 =C2=A0 pci =3D pci_create_simple_multifunction(pci_bus, PCI_DE=
VFN(10, 0), true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0TYPE_PIIX4_PCI_DEVICE);<br>
&gt; -=C2=A0 =C2=A0 dev =3D DEVICE(pci);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (smbus) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *smbus =3D piix4_pm_init(pci_bus, devfn +=
 3, 0x1100,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in_named(dev, &quot=
;isa&quot;, 9),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0, NULL);<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 return dev;<br>
&gt; +=C2=A0 =C2=A0 return pci;<br>
&gt;=C2=A0 =C2=A0}<br>
<br>
I don&#39;t think it makes sense to return PCIDevice here: when returning a=
 QOM object <br>
from a function, the general expectation is that for a device you would ret=
urn a <br>
DeviceState since then it can natively be used by the qdev API. So please k=
eep the <br>
original return type above.<br></blockquote><div><br></div><div>Okay, will =
do.</div><div><br></div><div>I&#39;ve been toying with moving piix4_pm_init=
() into piix4_realize(), such that it is created as part of TYPE_PIIX4_PCI_=
DEVICE - just as the real hardware. I think I like this solution much bette=
r.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; diff --git a/hw/mips/malta.c b/hw/mips/malta.c<br>
&gt; index e446b25ad0..d4bd3549d0 100644<br>
&gt; --- a/hw/mips/malta.c<br>
&gt; +++ b/hw/mips/malta.c<br>
&gt; @@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int be;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MaltaState *s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DeviceState *dev;<br>
&gt; +=C2=A0 =C2=A0 PCIDevice *piix4;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_realize_and_unref(SYS_BUS_DEVICE(s), =
&amp;error_fatal);<br>
&gt; @@ -1399,8 +1400,12 @@ void mips_malta_init(MachineState *machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0empty_slot_init(&quot;GT64120&quot;, 0, 0x20=
000000);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Southbridge */<br>
&gt; -=C2=A0 =C2=A0 dev =3D piix4_create(pci_bus, &amp;smbus);<br>
&gt; +=C2=A0 =C2=A0 piix4 =3D piix4_create(pci_bus);<br>
&gt; +=C2=A0 =C2=A0 dev =3D DEVICE(piix4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, =
&quot;isa.0&quot;));<br>
&gt; +=C2=A0 =C2=A0 smbus =3D piix4_pm_init(pci_bus, piix4-&gt;devfn + 3, 0=
x1100,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in_named(dev, &quot;isa&quot;, 9),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NULL, 0, NULL);<br>
<br>
... then here you can do either &quot;piix4 =3D PCI_DEVICE(dev)&quot; or pe=
rhaps even inline it <br>
directly as PCI_DEVICE(dev)-&gt;devfn if it isn&#39;t used elsewhere.<br></=
blockquote><div><br></div><div>When instantiating the pm in TYPE_PIIX4_PCI_=
DEVICE this problem just disappears magically. So I&#39;d roll with this in=
 v2.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Interrupt controller */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_connect_gpio_out_named(dev, &quot;intr&=
quot;, 0, i8259_irq);<br>
&gt; diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/pi=
ix.h<br>
&gt; index b768109f30..bea3b44551 100644<br>
&gt; --- a/include/hw/southbridge/piix.h<br>
&gt; +++ b/include/hw/southbridge/piix.h<br>
&gt; @@ -74,6 +74,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVIC=
E,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PIIX3State *piix3_create(PCIBus *pci_bus);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);<br>
&gt; +PCIDevice *piix4_create(PCIBus *pci_bus);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--0000000000007b968b05df96400d--

