Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E26902D1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2rh-0005LB-C5; Thu, 09 Feb 2023 04:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQ2rb-0005Jy-Cf; Thu, 09 Feb 2023 04:05:07 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQ2rX-0001u9-JR; Thu, 09 Feb 2023 04:05:06 -0500
Received: by mail-vk1-xa35.google.com with SMTP id n13so598667vkl.8;
 Thu, 09 Feb 2023 01:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uqzsfhEIXKdrO9Tam0qXi3MfapJssPlYXfjwWN7G7FA=;
 b=Lr37icpyT/nSxXJx2nsWlks2brs227n6pPGyy/Gb40Tjov9xZ5CsDpOZu4j8ar128K
 Qk7eDBFMi74YE/1bCOuH45sJ3fEBui7IP1YdhXq3IzybR1WVTh8/o9HelgyH8MWMIx2m
 7b6FSD+UlUtl8LtQm9/slWyxJgfGDIIPWPoUEAmgofV+hHP1yuxHG2BbEeHgJrUMEKeg
 SkA8R3jo4wtP6pJTTcosTTjE6yrW3MreUa/Yo06RH4GsEB0ZqD6dHRYGidMmDEzsEXEB
 wRN8hSHJLHtMKYMxjXQCa0iufv8WB/5F9zO9ppJY9jtH2c28FzJC/eigqjBZHfMjylDO
 JTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqzsfhEIXKdrO9Tam0qXi3MfapJssPlYXfjwWN7G7FA=;
 b=O4eJQdiiPpVwn6afDbkbXgPRNQZt56eOensfMNei7k6rvwydqpa9rNVTt47ZiKI5W9
 xnqpKHgWfVNT7Ztk9LHVwgmDO6tHM2qMHY5Vb3N0KZq6p00xrW9+AbFGQ+TN8chuoOx4
 EKZJKi3X5Cj6d6D1awKO7+aKaalDA/iDdl0aJvcRC9eyVFW9RGNhplX5te59PtUvOURF
 6QX0DN2DczcsgvAIaWSMn2/11Gj+dr0nxtPkUG9xHn4pxRHKyf48ITQZPhHtG0Xaj3hm
 v9b1Xqnz1QmnD3OI2tElS1qGhyIvLSdA8CkDj04cmZvCzwcehJS1y85sXJ2j7iMTYYcD
 gMIQ==
X-Gm-Message-State: AO0yUKU9nxth7dYRyPbkX9nRWeXfalDjyoz+KjYqEXyCYsIYbsdI02zN
 l9boQ0GpNOnEqXvLJoGZs9obeZzUEMpveAL5eMA=
X-Google-Smtp-Source: AK7set9ezJRGLtM6+85GTGM53JqKqtibGL+AmsDYq5+/+G/blbtXtoByb04E937trBE/wiIzn21fir1ESbrEwLM/R9Q=
X-Received: by 2002:a1f:abd0:0:b0:3e9:ffc0:fb54 with SMTP id
 u199-20020a1fabd0000000b003e9ffc0fb54mr2321997vke.9.1675933500698; Thu, 09
 Feb 2023 01:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-6-philmd@linaro.org>
In-Reply-To: <20230208000743.79415-6-philmd@linaro.org>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 9 Feb 2023 10:04:49 +0100
Message-ID: <CAG4p6K4qnDXjM+7=B1iRjUNX1astmg0Pofco+aOOPWkJG2ajFQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f9f6b605f440ac5e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f9f6b605f440ac5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2023 at 1:08 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg>
wrote:

> TYPE_PIIX3_IDE is a PCI function inheriting from QOM
> TYPE_PCI_DEVICE. To be able to call the ISA specific
> ide_init_ioport_isa(), we call this function passing
> a NULL ISADevice argument. Remove this hack by calling
> the recently added generic ide_init_ioport(), which
> doesn't expect any ISADevice.
>
> Inspired-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/ide/piix.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index a587541bb2..1cd4389611 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
>          {0x1f0, 0x3f6, 14},
>          {0x170, 0x376, 15},
>      };
> -    int i, ret;
> +    int i;
>
>      for (i =3D 0; i < 2; i++) {
>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
> -        ret =3D ide_init_ioport_isa(&d->bus[i], NULL,
> -                                  port_info[i].iobase,
> port_info[i].iobase2);
> -        if (ret) {
> -            return ret;
> -        }
> +        ide_init_ioport(&d->bus[i], OBJECT(d),
> +                        pci_address_space_io(PCI_DEVICE(d)),
> +                        port_info[i].iobase, port_info[i].iobase2);
>          ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
>
>          bmdma_init(&d->bus[i], &d->bmdma[i], d);
> --
> 2.38.1
>
> This patch essentially circumvents the mitigations introduced by
https://lore.kernel.org/qemu-devel/20210416125256.2039734-1-thuth@redhat.co=
m/
"hw/ide: Fix crash when plugging a piix3-ide device into the x-remote
machine": `qemu-system-x86_64 -M x-remote -device piix3-ide` now crashes.
This has been considered in
https://lore.kernel.org/qemu-devel/20230126211740.66874-1-shentey@gmail.com=
/
-- see cover letter there. TBH it's not entirely clear to me why we need
two competing series here at all.

Best regards,
Bernhard

--000000000000f9f6b605f440ac5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 8, 2023 at 1:08 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">TYPE_PIIX3_IDE is a PCI function inheriting from QOM<br>
TYPE_PCI_DEVICE. To be able to call the ISA specific<br>
ide_init_ioport_isa(), we call this function passing<br>
a NULL ISADevice argument. Remove this hack by calling<br>
the recently added generic ide_init_ioport(), which<br>
doesn&#39;t expect any ISADevice.<br>
<br>
Inspired-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" targ=
et=3D"_blank">shentey@gmail.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0hw/ide/piix.c | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/hw/ide/piix.c b/hw/ide/piix.c<br>
index a587541bb2..1cd4389611 100644<br>
--- a/hw/ide/piix.c<br>
+++ b/hw/ide/piix.c<br>
@@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{0x1f0, 0x3f6, 14},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{0x170, 0x376, 15},<br>
=C2=A0 =C2=A0 =C2=A0};<br>
-=C2=A0 =C2=A0 int i, ret;<br>
+=C2=A0 =C2=A0 int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 2; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_bus_init(&amp;d-&gt;bus[i], sizeof(d-=
&gt;bus[i]), DEVICE(d), i, 2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ide_init_ioport_isa(&amp;d-&gt;bus[i],=
 NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 port_info[i].iobase, port_inf=
o[i].iobase2);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_init_ioport(&amp;d-&gt;bus[i], OBJECT(d),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pci_address_space_io(PCI_DEVICE(d)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 port_info[i].iobase, port_info[i].iobase2);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ide_init2(&amp;d-&gt;bus[i], isa_get_irq(=
NULL, port_info[i].isairq));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmdma_init(&amp;d-&gt;bus[i], &amp;d-&gt;=
bmdma[i], d);<br>
-- <br>
2.38.1<br>
<br></blockquote><div>This patch essentially circumvents the mitigations in=
troduced  by <a href=3D"https://lore.kernel.org/qemu-devel/20210416125256.2=
039734-1-thuth@redhat.com/">https://lore.kernel.org/qemu-devel/202104161252=
56.2039734-1-thuth@redhat.com/</a> &quot;hw/ide: Fix crash when plugging a =
piix3-ide device into the x-remote machine&quot;:=C2=A0`qemu-system-x86_64 =
-M x-remote -device piix3-ide` now crashes. This has been considered in <a =
href=3D"https://lore.kernel.org/qemu-devel/20230126211740.66874-1-shentey@g=
mail.com/">https://lore.kernel.org/qemu-devel/20230126211740.66874-1-shente=
y@gmail.com/</a> -- see cover letter there. TBH it&#39;s not entirely clear=
 to me why we need two competing series here at all.</div><div><br></div><d=
iv>Best regards,</div><div>Bernhard<br></div></div></div>

--000000000000f9f6b605f440ac5e--

