Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885048D6AD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:30:34 +0100 (CET)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yJN-0001KE-Ef
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:30:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7yBg-0004ZX-7D
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:22:36 -0500
Received: from [2a00:1450:4864:20::133] (port=34765
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7yBe-0008MH-7E
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:22:35 -0500
Received: by mail-lf1-x133.google.com with SMTP id p27so6608073lfa.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r6xh8y8M86rwmgvpbmsLPURgPSXevLGT5kSiStDFvDc=;
 b=OlBObrVd6Y7ClbMiyWaCSSecXLbRnDFbcrgbuXbpzVX4XhhB7INhQxv9xQmNf4z9Uo
 RxvgDVW/o+pEjfC0akraKImbwRx0HWPfH8mYZeQeLjmpEG2CHaMPqeP5uOAees8jNjNl
 ChI2g99csutG5YcsBxd+6UCafbkRV8csjmsUg7xxeM+z+TYS7CIWU8VdvuI4/ZZ/PgVU
 LEciietXMgY+zt24zj4Vy92kPhpIBkEr/0NxdqQJXvIj0J3HTl2nUihrTss8RfbRT50S
 7j79JVqci+JrZQjYF+q2AN1fiuJ0d2Fnwwe6C9BjhIGCCJCLeDcooA8frSPUil+ncCIi
 Q2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r6xh8y8M86rwmgvpbmsLPURgPSXevLGT5kSiStDFvDc=;
 b=sYaZEny65z2f1sp8tJKwEG07yvg7FrYPC7HJXDjfW+cQf+Pvty8og9k9gm1QaBEST2
 /wfCx6dks85h0SdJEgbBOwkscpt4UMoc/FHuRIp9HaqSHSaXmKQnc1yY8/esS2jsy4RQ
 snFae+pBnHv+Moo/24g78dAt6R1I638mG/RFQUUIgMmeZMF6WfPe2/fVFCucoRlWrKKX
 Z5pZ3TFDOKjI0bpPn9ZVqssooedCljPSC6hBrrKZK+w3JAJIGhstcyxYtFYBo9OHeKGv
 RLGU6NeZUc5tzViqXVTVLqOMGeOgjPtZZ95KlooJ4gDmTLq0bONH78iEhl/JtjVF7fsd
 b7nw==
X-Gm-Message-State: AOAM5332Y9AH+dZ89rYBeBoFAveinaTMoczT5aWSIjSYzc8Jnhj/t4ZR
 9xKyhi1TbFYD2j1+eS0OY4zoClQdSxBVIoKYQVc=
X-Google-Smtp-Source: ABdhPJx7XOxG7PRA+dK2FzM3AtBmD2Kn5uynw5wNS+Q8Col71afI12LO4i5zVqkp3uB+e2trq6i6ZVj2CcyWPEtpVXo=
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr2696394ljh.63.1642072952354;
 Thu, 13 Jan 2022 03:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20220112213629.9126-1-shentey@gmail.com>
 <1dfcfd7a-5f21-f467-32e3-c8db5476ab29@amsat.org>
In-Reply-To: <1dfcfd7a-5f21-f467-32e3-c8db5476ab29@amsat.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 13 Jan 2022 12:22:13 +0100
Message-ID: <CAG4p6K5jx5eJC1BCBRsTdQ--dFv5TEjgRLP9qMjmkEh0q69EcA@mail.gmail.com>
Subject: Re: [PATCH 0/3] malta: Move PCI interrupt handling from gt64xxx to
 piix4
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000005394805d574e747"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000005394805d574e747
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Thu, Jan 13, 2022 at 10:24 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Bernhard,
>
> On 12/1/22 22:36, Bernhard Beschow wrote:
> > Hi,
> >
> > first-time contributor here. Inspired by an article in LWN [1] I figure=
d
> I'd
> > get my hands dirty with QEMU development. According to the article my
> goal is
> > to eliminate some "accidental complexity".
> >
> > While studying the code I noticed some (accidental?) differences betwee=
n
> piix3
> > and piix4 where the PCI interrupts are handled. Moreover, I noticed
> presence of
> > global variables in piix4 which probably constitute a limitation of
> QOM's idea
> > of configuration-driven machine creation. By applying piix3 concepts,
> i.e.
> > moving the interrupt handling from gt64xxx to piix4, it's possible to
> both
> > eliminate the differences and resolve the global variables.
> >
> > The patch series is structured as follows: Patch 1 eliminates the
> differences,
> > patch 3 resolves the global variables. Patch 2 is a preparation for
> patch 3.
> > Some of my further comments regarding the patches are:
> >
> > Patch 1:
> > * pci_slot_get_pirq() looks quite malta-specific. Neither gt64xxx nor
> piix4
> >    seem to be the perfect fit. So I moved it to piix4, analogous to
> piix3.
> > * The i8259 property moved from MaltaState to PIIX4State looks quite
> redundant
> >    to the isa property. Could isa be used instead, eliminating i8259?
> >
> > Patch 2:
> > * Besides piix4, there were four further cases where the PIC array was
> passed
> >    as the opaque parameter to the pci_map_irq_fn's. AFAICS in all other
> cases
> >    the DeviceState is passed instead. With this patch, consistency is
> >    esablished.
> > * Passing PIIX4State to piix4_set_irq() paves the way for eliminating a=
ll
> >    global variables left in piix4.c (see patch 3).
> >
> > Comments welcome.
> >
> > Cheers
> > Bernhard
> >
> > [1] https://lwn.net/Articles/872321/
> >
> > Bernhard Beschow (3):
> >    malta: Move PCI interrupt handling from gt64xxx to piix4
> >    pci: Always pass own DeviceState to pci_map_irq_fn's
> >    isa/piix4: Resolve global variables
>
> Did you forget to sent the patches?
>

I can see my patches in-reply-to my cover letter here [1]. Do I miss
something?

[1]  https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02786.html

--00000000000005394805d574e747
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Philippe,</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 20=
22 at 10:24 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi Bernhard,<br>
<br>
On 12/1/22 22:36, Bernhard Beschow wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; first-time contributor here. Inspired by an article in LWN [1] I figur=
ed I&#39;d<br>
&gt; get my hands dirty with QEMU development. According to the article my =
goal is<br>
&gt; to eliminate some &quot;accidental complexity&quot;.<br>
&gt; <br>
&gt; While studying the code I noticed some (accidental?) differences betwe=
en piix3<br>
&gt; and piix4 where the PCI interrupts are handled. Moreover, I noticed pr=
esence of<br>
&gt; global variables in piix4 which probably constitute a limitation of QO=
M&#39;s idea<br>
&gt; of configuration-driven machine creation. By applying piix3 concepts, =
i.e.<br>
&gt; moving the interrupt handling from gt64xxx to piix4, it&#39;s possible=
 to both<br>
&gt; eliminate the differences and resolve the global variables.<br>
&gt; <br>
&gt; The patch series is structured as follows: Patch 1 eliminates the diff=
erences,<br>
&gt; patch 3 resolves the global variables. Patch 2 is a preparation for pa=
tch 3.<br>
&gt; Some of my further comments regarding the patches are:<br>
&gt; <br>
&gt; Patch 1:<br>
&gt; * pci_slot_get_pirq() looks quite malta-specific. Neither gt64xxx nor =
piix4<br>
&gt;=C2=A0 =C2=A0 seem to be the perfect fit. So I moved it to piix4, analo=
gous to piix3.<br>
&gt; * The i8259 property moved from MaltaState to PIIX4State looks quite r=
edundant<br>
&gt;=C2=A0 =C2=A0 to the isa property. Could isa be used instead, eliminati=
ng i8259?<br>
&gt; <br>
&gt; Patch 2:<br>
&gt; * Besides piix4, there were four further cases where the PIC array was=
 passed<br>
&gt;=C2=A0 =C2=A0 as the opaque parameter to the pci_map_irq_fn&#39;s. AFAI=
CS in all other cases<br>
&gt;=C2=A0 =C2=A0 the DeviceState is passed instead. With this patch, consi=
stency is<br>
&gt;=C2=A0 =C2=A0 esablished.<br>
&gt; * Passing PIIX4State to piix4_set_irq() paves the way for eliminating =
all<br>
&gt;=C2=A0 =C2=A0 global variables left in piix4.c (see patch 3).<br>
&gt; <br>
&gt; Comments welcome.<br>
&gt; <br>
&gt; Cheers<br>
&gt; Bernhard<br>
&gt; <br>
&gt; [1] <a href=3D"https://lwn.net/Articles/872321/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lwn.net/Articles/872321/</a><br>
&gt; <br>
&gt; Bernhard Beschow (3):<br>
&gt;=C2=A0 =C2=A0 malta: Move PCI interrupt handling from gt64xxx to piix4<=
br>
&gt;=C2=A0 =C2=A0 pci: Always pass own DeviceState to pci_map_irq_fn&#39;s<=
br>
&gt;=C2=A0 =C2=A0 isa/piix4: Resolve global variables<br>
<br>
Did you forget to sent the patches?<br></blockquote><div><br></div><div>I c=
an see my patches in-reply-to my cover letter here [1]. Do I miss something=
?<br></div><div><br></div><div>[1]=C2=A0 <a href=3D"https://lists.nongnu.or=
g/archive/html/qemu-devel/2022-01/msg02786.html">https://lists.nongnu.org/a=
rchive/html/qemu-devel/2022-01/msg02786.html</a></div></div></div>

--00000000000005394805d574e747--

