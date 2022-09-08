Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBC5B19B8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:14:21 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEY7-00060a-K0
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWEVc-0003dy-0D; Thu, 08 Sep 2022 06:11:44 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWEVa-0000KI-7r; Thu, 08 Sep 2022 06:11:43 -0400
Received: by mail-lj1-x22b.google.com with SMTP id v6so5889180ljj.0;
 Thu, 08 Sep 2022 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Tbk2nheDNdld4sI5Sfpnftfd9qG4PMAdy89bCuQjkhE=;
 b=JP/dxedPXWF+4oAcnxhEx//b8aBp7JN6rBbvdX+CTgtzEyBdunwliOoA9+kPRBFQT9
 rY6CvsbpE8SbinVm/L9PJywvDs2DeFVnWWDuYYXKESzqRe5ssajS9yQMAFI2esjTd03b
 KG7bG9TOjMdcwkxNs0VtYNt5adWQmZNJRl6gpB2vwsBYf01Je9MCUAyFUNlzZoWtWJL9
 4xppNnD/74ZrE10cfOtSPHMohdfqstWh4VVqvWSLCzJV+W0mT2X3AHf1PDGPpfeasuwC
 nzDInAVOY455jQ5J7uWLL96ePVrP2WY13G22s6wD/H7FOHasmDgKJsnraajKot51H95U
 /u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Tbk2nheDNdld4sI5Sfpnftfd9qG4PMAdy89bCuQjkhE=;
 b=GYCzVmrtotvFE+G0EuwxTBWUIKPh/Kt+VOXLASvQygL8ogeHK9I05ly+isSc9sp+Tu
 A2TLE3RlwrmcXKjg5B3HZCw3S6fssSDiubhU5SQ8U8PjmotGCgijzJJP/oHvBG1vaN5d
 aFWc0M0ciC57fMZxem4OaGQmj9HaBeqTkSHU0abugQaMX0mX/dfQDY3jHZnm43kX5Ar5
 /pE4Fbb3ZBoUrWYS5lT1VAoCJjjpnGvz4u+GsFIzkMQDoryalRQ1jO2AWitNVf/x+H2C
 X3gIaEcN5IuVogH/5EUVE1+fPGALUJzVUnbEVE0Y6KR4MQPQCg76j5eCz86eEBWpd0+1
 NUKQ==
X-Gm-Message-State: ACgBeo16dc6PFGfn5jIJC51DvE73YzAA83SU/nuHd/3Q1tf62vNkeIZl
 7y331+dUksfiEtUyd9BKz284WSCn0BvK8MTdyuo=
X-Google-Smtp-Source: AA6agR4INZBqWmUUyde2PtazBTF8k7B86ujJhUBVS0Lp34yW24SjwIeBa47K094FJ+4/UcmM+UM1r2/3gbKLk5uL768=
X-Received: by 2002:a2e:a789:0:b0:267:917b:401b with SMTP id
 c9-20020a2ea789000000b00267917b401bmr2377373ljf.452.1662631900163; Thu, 08
 Sep 2022 03:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-5-arwed.meyer@gmx.de>
In-Reply-To: <20220906194755.98090-5-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 14:11:28 +0400
Message-ID: <CAJ+F1CLX8gTZ_MsDB+nK7Gp4mBe5UDnaEmKYvfsyjNzKzcQw8g@mail.gmail.com>
Subject: Re: [PATCH 4/4] serial: Allow unaligned i/o access
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd33b805e827a777"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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

--000000000000cd33b805e827a777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 7, 2022 at 2:03 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Unaligned i/o access on serial UART works on real PCs.
> This is used for example by FreeDOS CTMouse driver. Without this it
> can't reset and detect serial mice.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
> ---
>  hw/char/serial.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 7061aacbce..41b5e61977 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t
> frequency)
>  const MemoryRegionOps serial_io_ops =3D {
>      .read =3D serial_ioport_read,
>      .write =3D serial_ioport_write,
> +    .valid =3D {
> +        .unaligned =3D 1,
> +    },
>

I don't get how this can help if both min_access_size & max_access_size are
1.


>      .impl =3D {
>          .min_access_size =3D 1,
>          .max_access_size =3D 1,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000cd33b805e827a777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 2:03 AM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Unalign=
ed i/o access on serial UART works on real PCs.<br>
This is used for example by FreeDOS CTMouse driver. Without this it<br>
can&#39;t reset and detect serial mice.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/77" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/77</a><br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br>
---<br>
=C2=A0hw/char/serial.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/hw/char/serial.c b/hw/char/serial.c<br>
index 7061aacbce..41b5e61977 100644<br>
--- a/hw/char/serial.c<br>
+++ b/hw/char/serial.c<br>
@@ -961,6 +961,9 @@ void serial_set_frequency(SerialState *s, uint32_t freq=
uency)<br>
=C2=A0const MemoryRegionOps serial_io_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.read =3D serial_ioport_read,<br>
=C2=A0 =C2=A0 =C2=A0.write =3D serial_ioport_write,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D 1,<br>
+=C2=A0 =C2=A0 },<br></blockquote><div><br></div><div>I don&#39;t get how t=
his can help if both min_access_size &amp; max_access_size are 1.<br></div>=
<div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0.impl =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.min_access_size =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_access_size =3D 1,<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000cd33b805e827a777--

