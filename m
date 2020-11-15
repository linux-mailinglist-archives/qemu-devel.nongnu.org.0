Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663722B36B8
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:49:35 +0100 (CET)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keLDa-0006Ie-FI
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1keLCL-0005kA-RF
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:48:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1keLCK-0004j2-0B
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:48:17 -0500
Received: by mail-ot1-x342.google.com with SMTP id z16so13599854otq.6
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sCLjhQLTcLwP9IZs7NI9UEstZ8f984nO3DlttmApaQo=;
 b=l7c5Zr5itDMQtqSs0q6EcpxuugXsgn2Qz5DFpiECkgoEjp6+HHD9bA7iM83yuHGEij
 vWOM1fM7aswEanB9KuvSKPdnZ6nPFz2q/t1BXlLG1A7p+7Q3uXqh3J8r9th+s1tckIHT
 bUUUbHHPcdw9yWqFgJQK60AnavSGtB1+FFiqK2cAPvEmC/a9ICDRso/hy2fb+3BROhez
 p0jC2s4qtVuv/wtP8hjLfdEfj8mFKDu6/SADzeYGEh7Nak+BQ3WsVygdAlBOIzM+aOuT
 lvWM5hHHi9C3TpMj+bLdIGAzwFF+iLcyf2Jb1ap16bg2PZ7c/5d3qLA959rQdH1Z/XaG
 TIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCLjhQLTcLwP9IZs7NI9UEstZ8f984nO3DlttmApaQo=;
 b=Xccor7IaFiwCTBpm29zyPritPDhPI9/UgsQWou+T+oGwo146xfFSiImcbJoP/Zpgjr
 Vt7289OQW9XAx6ro+e6/CTbgXb3KQ4aELfaw/vYfi7vQh1HLxBXw5/2zaVHMbhU+0har
 RN+2Wt64coD3Fbuluo+OsRB2BkqaoZ08PVspS0d3zeXMxfu5d07/hfGOaMx6T+v/cNTR
 +QJuPYtIDAq8zVimuYbnQ8xT2wm/WErKg2wWzygv+xd9pnsvXm+D4VD8EUcfJRVitMDp
 16bPK7DnV7Wofr1oqE2ZM3kQQP8UMtbMNZZmfo5G1QPpL8/y7Bm8xbzYRZbvLALXZQTt
 yPBA==
X-Gm-Message-State: AOAM531K7SEdrioHLF7xCCXfiR0rlVhynmvRcICnKyCkzA84hKzHdu0n
 ZnBW9wfjUX9DTNDeFIIJQKiVqkJCLlVIGCPD0cs=
X-Google-Smtp-Source: ABdhPJxJ0x4w6JzYMRriz9mTBPIsH0pTsWJcaBnoNYz0yy4ShRU+9/1G3Zp8OPU4FEHvCAvtay8RPsm/yT1IfRb4AS8=
X-Received: by 2002:a05:6830:18f8:: with SMTP id
 d24mr8237999otf.44.1605458895064; 
 Sun, 15 Nov 2020 08:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
 <20201111073443-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201111073443-mutt-send-email-mst@kernel.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 15 Nov 2020 18:48:03 +0200
Message-ID: <CAC_L=vXH3=33h3xQwpT1ftPYtCcXeSn39LoizxW7qHrDuN61CQ@mail.gmail.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000024546a05b428071d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: David Gibson <dgibson@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024546a05b428071d
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Wed, Nov 11, 2020 at 2:35 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:
> > From: Marcel Apfelbaum <marcel@redhat.com>
> >
> > During PCIe Root Port's transition from Power-Off to Power-ON (or
> vice-versa)
> > the "Slot Control Register" has the "Power Indicator Control"
> > set to "Blinking" expressing a "power transition" mode.
> >
> > Any hotplug operation during the "power transition" mode is not permitted
> > or at least not expected by the Guest OS leading to strange failures.
> >
> > Detect and refuse hotplug operations in such case.
> >
> > Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>
>
> Going back to this I have another question: could we get
> a bit more detail on when do we get into this situation?
> When does guest start blinking the indicator without us
> first starting a hotplug operation?
>

While David has more insight on the kernel behavior during the mentioned
issue,
it seems the PCI subsystem sets the Power Indicator
to "blinking" as part of the init sequence of the PCIe Root Port.
The kernel will turn it off as soon as it finishes the init sequence.

A hotplug operation during the "init" sequence will surprise the Guest OS.
I'll let David to give us more info.

Thank you,
Marcel


> > ---
> >  hw/pci/pcie.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 5b48bae0f6..2fe5c1473f 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -410,6 +410,7 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler
> *hotplug_dev, DeviceState *dev,
> >      PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
> >      uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
> >      uint32_t sltcap = pci_get_word(exp_cap + PCI_EXP_SLTCAP);
> > +    uint32_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
> >
> >      /* Check if hot-plug is disabled on the slot */
> >      if (dev->hotplugged && (sltcap & PCI_EXP_SLTCAP_HPC) == 0) {
> > @@ -418,6 +419,12 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler
> *hotplug_dev, DeviceState *dev,
> >          return;
> >      }
> >
> > +    if ((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_BLINK) {
> > +        error_setg(errp, "Hot-plug failed: %s is in Power Transition",
> > +                   DEVICE(hotplug_pdev)->id);
> > +        return;
> > +    }
> > +
> >      pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev), dev, errp);
> >  }
> >
> > --
> > 2.17.2
>
>

--00000000000024546a05b428071d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Michael,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11, 2020 at 2:35 P=
M Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:<br>
&gt; From: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.com" target=
=3D"_blank">marcel@redhat.com</a>&gt;<br>
&gt; <br>
&gt; During PCIe Root Port&#39;s transition from Power-Off to Power-ON (or =
vice-versa)<br>
&gt; the &quot;Slot Control Register&quot; has the &quot;Power Indicator Co=
ntrol&quot;<br>
&gt; set to &quot;Blinking&quot; expressing a &quot;power transition&quot; =
mode.<br>
&gt; <br>
&gt; Any hotplug operation during the &quot;power transition&quot; mode is =
not permitted<br>
&gt; or at least not expected by the Guest OS leading to strange failures.<=
br>
&gt; <br>
&gt; Detect and refuse hotplug operations in such case.<br>
&gt; <br>
&gt; Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum=
@gmail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
<br>
<br>
Going back to this I have another question: could we get<br>
a bit more detail on when do we get into this situation?<br>
When does guest start blinking the indicator without us<br>
first starting a hotplug operation?<br></blockquote><div><br></div><div>Whi=
le David has more insight on the kernel behavior during the mentioned issue=
,</div><div>it seems the PCI subsystem sets the Power Indicator</div><div>t=
o &quot;blinking&quot; as part of the init sequence of the PCIe Root Port.<=
/div><div>The kernel will turn it off as soon as it finishes the init seque=
nce.</div><div><br></div><div>A hotplug operation during the &quot;init&quo=
t; sequence will surprise the Guest OS.</div><div>I&#39;ll let David to giv=
e us more info.</div><div><br></div><div>Thank you,</div><div>Marcel=C2=A0<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 hw/pci/pcie.c | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c<br>
&gt; index 5b48bae0f6..2fe5c1473f 100644<br>
&gt; --- a/hw/pci/pcie.c<br>
&gt; +++ b/hw/pci/pcie.c<br>
&gt; @@ -410,6 +410,7 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *hot=
plug_dev, DeviceState *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIDevice *hotplug_pdev =3D PCI_DEVICE(hotplug_dev=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t *exp_cap =3D hotplug_pdev-&gt;config + hot=
plug_pdev-&gt;exp.exp_cap;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t sltcap =3D pci_get_word(exp_cap + PCI_EXP=
_SLTCAP);<br>
&gt; +=C2=A0 =C2=A0 uint32_t sltctl =3D pci_get_word(exp_cap + PCI_EXP_SLTC=
TL);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check if hot-plug is disabled on the slot */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 if (dev-&gt;hotplugged &amp;&amp; (sltcap &amp; PC=
I_EXP_SLTCAP_HPC) =3D=3D 0) {<br>
&gt; @@ -418,6 +419,12 @@ void pcie_cap_slot_pre_plug_cb(HotplugHandler *ho=
tplug_dev, DeviceState *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if ((sltctl &amp; PCI_EXP_SLTCTL_PIC) =3D=3D PCI_EXP_SL=
TCTL_PWR_IND_BLINK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Hot-plug failed: %=
s is in Power Transition&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
DEVICE(hotplug_pdev)-&gt;id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pcie_cap_slot_plug_common(PCI_DEVICE(hotplug_dev),=
 dev, errp);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.17.2<br>
<br>
</blockquote></div></div>

--00000000000024546a05b428071d--

