Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDF2B36AB
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:44:53 +0100 (CET)
Received: from localhost ([::1]:55180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keL92-0003Y0-O8
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1keL7j-0002FW-WF
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:43:32 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1keL7h-0002sK-K0
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:43:31 -0500
Received: by mail-ot1-x342.google.com with SMTP id a15so13596936otf.5
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=cd8vA8Z1NV/HTn9FN2aFf3IlzkCsIritCPkupUEBmCs=;
 b=pxYExwkJ1XvyUGluYUUhh6I8TXWCoLU6IvPg/1r8E//rtAZ6OnRynYGIA2WoBojRpf
 uhUsXt1ZtYhg1DRJ9s09e/47vnm+cJit1XwzoLGWQHR2a+DYY9AfcGY/BUeN2+XQz0vJ
 kpkFyhfDEuwyLDJ8LLJWb7PukwVQhmNFAcYLtFBk6sinEEtoue2lSwJ8P5tLyfxDqlVe
 l/mmR2QAyCs//07PMNXsywJ5xBCuXjKlmpvXYaC8YltSPhPAK78HiIY5h35sLAFR1VJK
 GhfqUJ4XnQxQKUavpFnB1i7mrV2KA2RdrluMwRXSVFqP8JCm0aCEGqsYm/DbRAJXId32
 Ax7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=cd8vA8Z1NV/HTn9FN2aFf3IlzkCsIritCPkupUEBmCs=;
 b=uHwJYv/NWBVKaOLLPL8UeXyM+LSTvraIRpXe1F3s+V7Zk7p2J8+blapfbxkl3idlv9
 +WsJeyj6TFHUdlUlmI60tmpRRwDkKv9bRv9GbA+gx/Mg5HUoISciO4FqitUCNj/rX/HQ
 A1NZZfUgw5sqCipA4OJ7AcdaKX1j4pmz7QSE6VwmUbytJagthnzs7pEUJ+UJKQ2M91di
 1KwOpDTx4g9yYGTkTvPFwkgCMeJ17MVvnQMOOCGHoWhljLmnRrEvjrgt1CjfcNFvbjcO
 fXXiGzBaEv2wKwZEt87zj0d7PsFnp12p4r4ZT4YeYanIEXN3tboELqFRoziPhjeZT4Te
 UPzA==
X-Gm-Message-State: AOAM531V+TzuJiZ+CpVPt8iMINdfYDfpEWqTuo0JjxV0ejNeRLLxbu/v
 4eW+mUHBrK5VIn1pNgpeKkYsoPtGbf0MStCkY+Q=
X-Google-Smtp-Source: ABdhPJxbrX/RS9A6bpziHTcNAb3SfxwyjL0ZYpLHVq/2Y0uvYcexMuuknBCIcNcnnOWcPKdfntsKTHi56tlA1L0POtg=
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr8575838otp.102.1605458605626; 
 Sun, 15 Nov 2020 08:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20201022114026.31968-1-marcel.apfelbaum@gmail.com>
 <20201111160953.GA2865@rvkaganb.lan>
In-Reply-To: <20201111160953.GA2865@rvkaganb.lan>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Sun, 15 Nov 2020 18:43:14 +0200
Message-ID: <CAC_L=vVDARMcT2a5Rr=DpW7jRJjW4VWJo0GZKeOK_zjg9PdwUQ@mail.gmail.com>
Subject: Re: [PATCH] pci: Refuse to hotplug PCI Devices when the Guest OS is
 not ready
To: Roman Kagan <rvkagan@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 qemu devel list <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <dgibson@redhat.com>, Julia Suvorova <jusual@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e3da4905b427f53c"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e3da4905b427f53c
Content-Type: text/plain; charset="UTF-8"

Hi Roman,

On Wed, Nov 11, 2020 at 6:10 PM Roman Kagan <rvkagan@yandex-team.ru> wrote:

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
>
> I wonder if hw/pci/shpc.c is free from this issue?
>
>
I did not encounter the issue with shpc.

However, the SHPC spec describes the Power Indicator behavior for hotplug
only leaving the booting sequence out of it:
    "Although the Standard Usage Model presented in Section 2.2.1.2
requires a specific
     relationship between the Power Indicator and the state of the slot,
this relationship is
     enforced by software, not by the SHPC."

It looks like it depends on the software implementation.


Thanks,
Marcel


> Roman.
>

--000000000000e3da4905b427f53c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Roman,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 11, 2020 at 6:10 PM =
Roman Kagan &lt;<a href=3D"mailto:rvkagan@yandex-team.ru">rvkagan@yandex-te=
am.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, Oct 22, 2020 at 02:40:26PM +0300, Marcel Apfelbaum wrote:<br>
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
<br>
I wonder if hw/pci/shpc.c is free from this issue?<br>
<br></blockquote><div><br></div><div>I did not encounter the issue with shp=
c.</div><div><br></div><div>However, the SHPC spec describes the Power Indi=
cator behavior for hotplug only leaving the booting sequence out of it:=C2=
=A0</div><div>=C2=A0 =C2=A0 &quot;Although the Standard Usage Model present=
ed in Section 2.2.1.2 requires a specific</div>=C2=A0 =C2=A0 =C2=A0relation=
ship between the Power Indicator and the state of the slot, this relationsh=
ip is<br><div>=C2=A0 =C2=A0 =C2=A0enforced by software, not by the SHPC.&qu=
ot;</div><div><br></div><div>It looks like it depends on the software imple=
mentation.</div><div><br></div><div><br></div><div>Thanks,</div><div>Marcel=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Roman.<br>
</blockquote></div></div>

--000000000000e3da4905b427f53c--

