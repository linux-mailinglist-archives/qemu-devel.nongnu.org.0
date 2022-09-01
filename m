Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAF5A96FD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:37:20 +0200 (CEST)
Received: from localhost ([::1]:39644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjRd-0003cj-Uw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTifm-0000rc-Jw; Thu, 01 Sep 2022 07:47:51 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:39748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTifk-00013C-9f; Thu, 01 Sep 2022 07:47:50 -0400
Received: by mail-qk1-x72f.google.com with SMTP id c9so12960098qkk.6;
 Thu, 01 Sep 2022 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=frPbpHnnMJ4WM7J9TzNdKY+8frhja70r73S8bLNja4g=;
 b=fYD877qBr0Mi2yD1KYjXOjND9rafjlTlvhrDPFuiAsaFSBXxV62oQNwCctHdHXnKQP
 +gs/zpHixAzt9vI8ZztAFZvgatzQeckjnmx/Xa7HH2b/vcZB5Dx8hFCg8MwFFxDzYmx8
 HE83f4FZ/kn04zNh94Le1IBDfedDDVnq5jNO+vAGGXiySThF+56xAteHaNPR8g2MOxdo
 d0vH5YXt5s7EFjBTmMTs1IDhSDIN4aS+Dr0l1bBNHGCa4SmG094ScOnt+cfyrsHUpfcO
 LCoY/m7AqEO74h+4xQL9p7pXm7pVtSG73tXDYiadq9ruHTWvXQG8UN1aDpSOqtE6lSpm
 fetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=frPbpHnnMJ4WM7J9TzNdKY+8frhja70r73S8bLNja4g=;
 b=n1MJd1yzEsN7w9oCj5BtdcGUcDp8hPReu/ymp+93v9uAODtsGw/FOquNqR9cgkCGso
 4gajnAVzlHYr2El+Bm6Iv7df+/nd/9bgJkjzqHjv7mvlk6QOPSIvUbJp7LHzZXkugXZG
 LoiO0y9XKFwb3p3YzNnkb5H3HqcNoR4XVIKBwgxA/tIhvMjrrjkmeaI1hJOfm+Ps69IF
 UcL3cVQXSNx5BZ1Jj1AN5/Fs4WyYma816235e1qQoJu2YyXrO+cJBu/dZO8ITmTKZaRp
 Lb3i5NL7igJnVaXNctW3HiA7GqXXGyTASJFoDt2Aek5vfTDEn6So0Yl6CNNDlPWPTT6o
 YjxA==
X-Gm-Message-State: ACgBeo0pkMClQp9x0dAlY4jcvdWuwmhvRWXJDra9VpOV7xdSLQMeiAX2
 cr99I5052EsEBncbogmL4E7goinnIcTiGB9evFojk/g8Gj8=
X-Google-Smtp-Source: AA6agR6TBhxC1FmD2VIwXA0OBItuDkcLYLYSXzUV5B93NrlI3kNq6lfTqyGvfwLzhzRJsKG7hRd+mkUKnj7pwjj1fKE=
X-Received: by 2002:a05:620a:bc3:b0:6a7:9e01:95ac with SMTP id
 s3-20020a05620a0bc300b006a79e0195acmr19136163qki.91.1662032866559; Thu, 01
 Sep 2022 04:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220901114127.53914-1-shentey@gmail.com>
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Thu, 1 Sep 2022 13:47:33 +0200
Message-ID: <CAG4p6K4cvTXPuzFrf_rDUHNawk7kVjEHsm5uVspwUsgpiGpyKQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:sam460ex" <qemu-ppc@nongnu.org>, John Snow <jsnow@redhat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="0000000000009dc97305e79c2e3b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x72f.google.com
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

--0000000000009dc97305e79c2e3b
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 1:41 PM Bernhard Beschow <shentey@gmail.com> wrote:

> v5:
> * Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)
> * Use machine parameter when creating rtc-time alias (Zoltan)
>
> Testing done: Same as in v3.
>
> v4:
> * Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)
> * Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)
> * Introduce TYPE_VIA_IDE define (for consistency)
>
> v3:
> * Replace pre increment by post increment in for loop (Zoltan)
> * Move class defines close to where the class is defined (Zoltan)
>
> Testing done:
> * `make check-avocado`
>   Passes for boot_linux_console.py for mips64el_fuloong2e
> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device
> ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel
> morphos-3.17/boot.img`
>   Boots successfully and it is possible to open games and tools.
>
> v2:
> * Keep the call to pci_ide_create_devs() in board code for consistency
> (Zoltan)
> * Create rtc-time alias in board rather than in south bridge code
> * Remove stale comments about PCI functions (Zoltan)
>
> v1:
> This series instantiates all PCI functions of the VT82xx south bridges in
> the south bridges themselves.
> For the IDE function this is especially important since its interrupt
> routing is configured in the
> ISA function, hence doesn't make sense to instantiate it as a
> "Frankenstein" device. The interrupt
> routing is currently hardcoded and changing that is currently not in the
> scope of this series.
>
> Testing done:
> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device
> ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel
> morphos-3.17/boot.img`
>   Boots successfully and it is possible to open games and tools.
>
> * I was unable to test the fuloong2e board even before this series since
> it seems to be unfinished [1].
>   A buildroot-baked kernel [2] booted but doesn't find its root partition,
> though the issues could be in the buildroot receipt I created.
>
> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
> [2] https://github.com/shentok/buildroot/commits/fuloong2e


Forgot to mention: All patches except  "hw/mips/fuloong2e: Inline
vt82c686b_southbridge_init() and remove it" are:

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

Best regards,
Bernhard

>
> Bernhard Beschow (13):
>   hw/isa/vt82c686: Resolve chip-specific realize methods
>   hw/isa/vt82c686: Resolve unneeded attribute
>   hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
>   hw/isa/vt82c686: Reuse errp
>   hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
>   hw/isa/vt82c686: Instantiate IDE function in host device
>   hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
>   hw/isa/vt82c686: Instantiate USB functions in host device
>   hw/isa/vt82c686: Instantiate PM function in host device
>   hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
>   hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
>   hw/isa/vt82c686: Embed RTCState in host device
>   hw/isa/vt82c686: Create rtc-time alias in boards instead
>
>  configs/devices/mips64el-softmmu/default.mak |   1 -
>  hw/ide/via.c                                 |   2 +-
>  hw/isa/Kconfig                               |   1 +
>  hw/isa/vt82c686.c                            | 120 +++++++++++++++----
>  hw/mips/fuloong2e.c                          |  39 +++---
>  hw/ppc/Kconfig                               |   1 -
>  hw/ppc/pegasos2.c                            |  25 ++--
>  hw/usb/vt82c686-uhci-pci.c                   |   4 +-
>  include/hw/isa/vt82c686.h                    |   4 +-
>  9 files changed, 126 insertions(+), 71 deletions(-)
>
> --
> 2.37.3
>
>

--0000000000009dc97305e79c2e3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Sep 1, 2022 at 1:41 PM Bernhard B=
eschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">v5:<br>
* Add patch &quot;Inline vt82c686b_southbridge_init() and remove it&quot; (=
Zoltan)<br>
* Use machine parameter when creating rtc-time alias (Zoltan)<br>
<br>
Testing done: Same as in v3.<br>
<br>
v4:<br>
* Fix in comment: AC97 Modem -&gt; MC97 Modem (Zoltan)<br>
* Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)<br>
* Introduce TYPE_VIA_IDE define (for consistency)<br>
<br>
v3:<br>
* Replace pre increment by post increment in for loop (Zoltan)<br>
* Move class defines close to where the class is defined (Zoltan)<br>
<br>
Testing done:<br>
* `make check-avocado`<br>
=C2=A0 Passes for boot_linux_console.py for mips64el_fuloong2e<br>
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D&quot;&quot; -cdrom morphos-3.17.iso -kerne=
l morphos-3.17/boot.img`<br>
=C2=A0 Boots successfully and it is possible to open games and tools.<br>
<br>
v2:<br>
* Keep the call to pci_ide_create_devs() in board code for consistency (Zol=
tan)<br>
* Create rtc-time alias in board rather than in south bridge code<br>
* Remove stale comments about PCI functions (Zoltan)<br>
<br>
v1:<br>
This series instantiates all PCI functions of the VT82xx south bridges in t=
he south bridges themselves.<br>
For the IDE function this is especially important since its interrupt routi=
ng is configured in the<br>
ISA function, hence doesn&#39;t make sense to instantiate it as a &quot;Fra=
nkenstein&quot; device. The interrupt<br>
routing is currently hardcoded and changing that is currently not in the sc=
ope of this series.<br>
<br>
Testing done:<br>
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D&quot;&quot; -cdrom morphos-3.17.iso -kerne=
l morphos-3.17/boot.img`<br>
=C2=A0 Boots successfully and it is possible to open games and tools.<br>
<br>
* I was unable to test the fuloong2e board even before this series since it=
 seems to be unfinished [1].<br>
=C2=A0 A buildroot-baked kernel [2] booted but doesn&#39;t find its root pa=
rtition, though the issues could be in the buildroot receipt I created.<br>
<br>
[1] <a href=3D"https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2" rel=
=3D"noreferrer" target=3D"_blank">https://osdn.net/projects/qmiga/wiki/Subp=
rojectPegasos2</a><br>
[2] <a href=3D"https://github.com/shentok/buildroot/commits/fuloong2e" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/shentok/buildroot/comm=
its/fuloong2e</a></blockquote><div><br></div><div>Forgot to mention: All pa=
tches except=C2=A0 &quot;hw/mips/fuloong2e: Inline vt82c686b_southbridge_in=
it() and remove it&quot; are:</div><div><br></div>Reviewed-by: BALATON Zolt=
an &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&gt;</di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Best rega=
rds,</div><div class=3D"gmail_quote">Bernhard<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bernhard Beschow (13):<br>
=C2=A0 hw/isa/vt82c686: Resolve chip-specific realize methods<br>
=C2=A0 hw/isa/vt82c686: Resolve unneeded attribute<br>
=C2=A0 hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()=
<br>
=C2=A0 hw/isa/vt82c686: Reuse errp<br>
=C2=A0 hw/isa/vt82c686: Introduce TYPE_VIA_IDE define<br>
=C2=A0 hw/isa/vt82c686: Instantiate IDE function in host device<br>
=C2=A0 hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define<br>
=C2=A0 hw/isa/vt82c686: Instantiate USB functions in host device<br>
=C2=A0 hw/isa/vt82c686: Instantiate PM function in host device<br>
=C2=A0 hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device<=
br>
=C2=A0 hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it=
<br>
=C2=A0 hw/isa/vt82c686: Embed RTCState in host device<br>
=C2=A0 hw/isa/vt82c686: Create rtc-time alias in boards instead<br>
<br>
=C2=A0configs/devices/mips64el-softmmu/default.mak |=C2=A0 =C2=A01 -<br>
=C2=A0hw/ide/via.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0hw/isa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0hw/isa/vt82c686.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 120 +++++++++++++++----<br>
=C2=A0hw/mips/fuloong2e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 39 +++---<br>
=C2=A0hw/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<b=
r>
=C2=A0hw/ppc/pegasos2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 ++--<br>
=C2=A0hw/usb/vt82c686-uhci-pci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0include/hw/isa/vt82c686.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A09 files changed, 126 insertions(+), 71 deletions(-)<br>
<br>
-- <br>
2.37.3<br>
<br>
</blockquote></div></div>

--0000000000009dc97305e79c2e3b--

