Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA76AA957
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQTW-0000vN-1k; Sat, 04 Mar 2023 06:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQTM-0000v4-0G; Sat, 04 Mar 2023 06:54:44 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQTK-0003ve-AT; Sat, 04 Mar 2023 06:54:43 -0500
Received: by mail-ua1-x932.google.com with SMTP id v48so3379553uad.6;
 Sat, 04 Mar 2023 03:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1d/H5mAq9oYLO/OaRQthQrbDN4kMDEvfNQ5Al7ikGf8=;
 b=f87rdAAM2udDaY2k+xCLW6heblplLz+jPCtMdxiHbQZZ4aywUxcok6IDSTA6J3b9i3
 uJnFiSYHkBGuy9jOUt0Rl7td0Y1G7sZd7F9GDrImUSFHa9CeKOKKKHp+GQKPlSbcTAhd
 ZKFih1IPEFVaSMPPP3tRR0JRXUQkXWvzpwoXD/h05lWVOizwA/rDHzOhvTBexM0sInRK
 k8Jnsox8e/kBAjz+TDd5ZXj3nwpq8xx0FORTzFF9X/FYnR6HCnf42UccchoiXSAkmPkp
 IlxynhzFk5qb89nfyzf4Nl9DKfZ/DNRAI126AUMR1PuMPf5dWM4iPsgxozLAE6/1aJFd
 UH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930880;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1d/H5mAq9oYLO/OaRQthQrbDN4kMDEvfNQ5Al7ikGf8=;
 b=VU38C9T7Ibf6jrMUMHjoGbZiHIZT/zGJLwwwiiUoMbNXqfmQU6ydhbARXII2H+oov0
 Ph/Sv4jFeT7Ca2oivtgKVGiI9j1g1Xr2MbQYCU34hVJ4cVUQfJbdk0hETBuf+oteosZV
 rTYTjdc0pl0DgG7P0xsiR3ytKh1qYgKs5yGpvHs1gh3wHPfUw/Rd6TbWiZi+WIz1G0ah
 z/tTFm6aquod+QU7EiIxqNPMumhXVHx/7CvT0dZOmtFHMu03PgRt1d0tkSq+ZzBIM9KK
 FXJI5frWmz5Ia1l5fBKERx8yjWtOUYcCIbFEzde7K4+shVqlWsizFSd/zxLy9t1jd+wG
 ZDjg==
X-Gm-Message-State: AO0yUKVXrfTiDFjfQRX1HEZCVjBA7xF/kxqtCz1mHS3dB5vbBrtZjOXH
 vWzA+EhiPlNmH2SttCoLU9HXcEARnZmi1TSz7CtkOyEJ
X-Google-Smtp-Source: AK7set91tRonaVi06LEA9PwqnICZNbmDHwd5gtE0UWJE7CoBK1UDP5gRgisQM4BnrRXtu2fsO6bpyOb4axMdujaKoC4=
X-Received: by 2002:ab0:4a12:0:b0:68b:b624:7b86 with SMTP id
 q18-20020ab04a12000000b0068bb6247b86mr3220320uae.2.1677930880420; Sat, 04 Mar
 2023 03:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20230304114043.121024-1-shentey@gmail.com>
In-Reply-To: <20230304114043.121024-1-shentey@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 4 Mar 2023 12:54:29 +0100
Message-ID: <CAG4p6K4HQTfhbMkkUq9+9NoA0Pun7L4Q3xs0+9kSx77riX0vGg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000015d01e05f611ba27"
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=shentey@gmail.com; helo=mail-ua1-x932.google.com
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

--00000000000015d01e05f611ba27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 4, 2023 at 12:40=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:

> A recent series [1] attempted to remove some PIC -> CPU interrupt
> indirections.
> This inadvertantly caused NULL qemu_irqs to be passed to the i8259 becaus=
e
> the
> qemu_irqs aren't initialized at that time yet. This series provides a fix
> by
> initializing the qemu_irq of the respective south bridges before they
> are passed to i2859_init().
>
> Furthermore -- as an optional extension -- this series also fixes some
> usability
> issues in the API for creating multifunction PCI devices.
>
> The series is structured as follows: The first three commits fix the
> regressions, the last two fix the public API for creating multifunction P=
CI
> devices.
>

Testing done:
* `make check`
* `make check-avocado`
* Start MorphOS ISO

>
> [1]
> https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.o=
rg/
>
> Bernhard Beschow (5):
>   hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>   hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>   hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>   hw/pci/pci: Remove multifunction parameter from
>     pci_create_simple_multifunction()
>   hw/pci/pci: Remove multifunction parameter from
>     pci_new_multifunction()
>
>  include/hw/pci/pci.h |  4 +---
>  hw/alpha/dp264.c     |  8 +++++---
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     | 10 +++++-----
>  hw/isa/vt82c686.c    |  3 ++-
>  hw/mips/boston.c     |  3 +--
>  hw/mips/fuloong2e.c  |  9 +++++----
>  hw/mips/malta.c      |  2 +-
>  hw/pci-host/sabre.c  |  6 ++----
>  hw/pci/pci.c         | 18 ++++++++++++------
>  hw/ppc/pegasos2.c    |  9 +++++----
>  hw/ppc/prep.c        |  4 +++-
>  hw/sparc64/sun4u.c   |  5 ++---
>  13 files changed, 45 insertions(+), 38 deletions(-)
>
> --
> 2.39.2
>
>

--00000000000015d01e05f611ba27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 4, 2023 at 12:40=E2=80=AF=
PM Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">A recent series [1] attempted to remove some PIC -&gt; CPU interrupt ind=
irections.<br>
This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because =
the<br>
qemu_irqs aren&#39;t initialized at that time yet. This series provides a f=
ix by<br>
initializing the qemu_irq of the respective south bridges before they<br>
are passed to i2859_init().<br>
<br>
Furthermore -- as an optional extension -- this series also fixes some usab=
ility<br>
issues in the API for creating multifunction PCI devices.<br>
<br>
The series is structured as follows: The first three commits fix the<br>
regressions, the last two fix the public API for creating multifunction PCI=
<br>
devices.<br></blockquote><div><br></div><div>Testing done:</div><div>* `mak=
e check`</div><div>* `make check-avocado`</div><div>* Start MorphOS ISO <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[1] <a href=3D"https://lore.kernel.org/qemu-devel/20230302224058.43315-1-ph=
ilmd@linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.=
org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/</a><br>
<br>
Bernhard Beschow (5):<br>
=C2=A0 hw/isa/vt82c686: Fix wiring of PIC -&gt; CPU interrupt<br>
=C2=A0 hw/alpha/dp264: Fix wiring of PIC -&gt; CPU interrupt<br>
=C2=A0 hw/ppc/prep: Fix wiring of PIC -&gt; CPU interrupt<br>
=C2=A0 hw/pci/pci: Remove multifunction parameter from<br>
=C2=A0 =C2=A0 pci_create_simple_multifunction()<br>
=C2=A0 hw/pci/pci: Remove multifunction parameter from<br>
=C2=A0 =C2=A0 pci_new_multifunction()<br>
<br>
=C2=A0include/hw/pci/pci.h |=C2=A0 4 +---<br>
=C2=A0hw/alpha/dp264.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++---<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/i386/pc_q35.c=C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0hw/isa/vt82c686.c=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/mips/boston.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +--<br>
=C2=A0hw/mips/fuloong2e.c=C2=A0 |=C2=A0 9 +++++----<br>
=C2=A0hw/mips/malta.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0hw/pci-host/sabre.c=C2=A0 |=C2=A0 6 ++----<br>
=C2=A0hw/pci/pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++------=
<br>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 |=C2=A0 9 +++++----<br>
=C2=A0hw/ppc/prep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0hw/sparc64/sun4u.c=C2=A0 =C2=A0|=C2=A0 5 ++---<br>
=C2=A013 files changed, 45 insertions(+), 38 deletions(-)<br>
<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--00000000000015d01e05f611ba27--

