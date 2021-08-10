Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3443E54FE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:18:08 +0200 (CEST)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDMxb-0003pj-7D
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDMwT-0002eG-2p
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:16:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mDMwR-0007bq-CG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:16:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x14so6440896edr.12
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zxK7d0xnas31Dhun2qSx0fQO1G/ZpwyPk9nEXx4Y1o=;
 b=c2tpe28jD6cBooPGLVXtlyPQ2xYPtPNmNdUjwP0LxUE+yTZWCFXg+LFHCVscf47J1+
 w3qAJFoHkF3+7vxNxNny1yeZ2jXRY2xLNar1edJubwL3HxovEm4G+Exa7Viwi2besmRz
 8IiLGIb1x+QmXcsS8qAhI6GcYZIpTDa3s9THCg7V6/CnydbBJ6t4MEiAaglvlh6YvZGF
 LXbmUnku2iIgnZH5nEH0RZrSIWBwOlW2Hfl/7EsqiquR6pABQab7HdbnAz8aTxHYNFjn
 p5t18Mb1Y67bxO4+iZPgyHCdbwjKNE8zu3BV85E6juefpYY9r7hGbEd6NVepnraiBdP2
 4A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zxK7d0xnas31Dhun2qSx0fQO1G/ZpwyPk9nEXx4Y1o=;
 b=XbEL64Lr0ptxqGAFxmgg6Ano8NxQjQMLpKpf48nkkCzIgf1UCmnrqHPenv0p6ojTtJ
 +mH0itftXaUk9PDuHmuYxo5xkwKW6W5NnINuFziDIjbO6mDdc+KqnbCgMAVaOzWi0T3d
 R4GNiw1RfjWV/eA4ra4uI0xflrU40ubtBg53MqArvWujRydzw62iJSc619SzAiPHUZkt
 a0HpjCPCOmQ7hDD9AhI/g7DZwhRjjUJt2d4UeuAnfakhc0T93lxkuTr4a1XIqNnRs34o
 Elpp8cs11H4AvexB8Xx02ccXI1QOY1eQP23wjOQxxuDo9Ok4gtleYEyGOhq6/vSK2whJ
 /uNA==
X-Gm-Message-State: AOAM533xZDll3EpW+I0vOdYZWb1srQ7cuAtyWB5kNsS1Jy51241EXara
 0rfCE8l5V5INZFa9CrGXKBKcYXaMBHxXrjN6mJ0=
X-Google-Smtp-Source: ABdhPJy+QrZgIZUzLVpkOsslymjb80Y6t0Zb2pDOcFngTXocxeCkTOUb7XOVP5VfLdMOxhErz3VfuLmHuV6Pf2nbZBI=
X-Received: by 2002:aa7:c6d0:: with SMTP id b16mr3514789eds.257.1628583413875; 
 Tue, 10 Aug 2021 01:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210810063257.17411-1-vr_qemu@t-online.de>
In-Reply-To: <20210810063257.17411-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 10 Aug 2021 12:16:42 +0400
Message-ID: <CAJ+F1CL0=w8zqyjYp5Av96R=Q1KT2SZt4jB_LrgYPg=xmix_3w@mail.gmail.com>
Subject: Re: [PATCH for 6.1] ui/gtk: retry sending VTE console input
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="000000000000df06c305c9301fdc"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000df06c305c9301fdc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 10:35 AM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> Commit 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE
> consoles") changed the VTE chardev backend code to rely on the
> chr_accept_input() callback function. The code expects a
> chr_accept_input() call whenever qemu_chr_be_can_write() bytes
> were written. It turns out this is wrong. Some chardev
> frontends only call this callback after can_write was 0.
>
> Change the code to send data until the keyboard fifo is empty
> or qemu_chr_be_can_write() returns 0.
>
> Fixes: 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE consoles")
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/gtk.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 974e4dfc0b..cfb0728d1f 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1646,16 +1646,14 @@ static void gd_vc_send_chars(VirtualConsole *vc)
>
>      len =3D qemu_chr_be_can_write(vc->vte.chr);
>      avail =3D fifo8_num_used(&vc->vte.out_fifo);
> -    if (len > avail) {
> -        len =3D avail;
> -    }
> -    while (len > 0) {
> +    while (len > 0 && avail > 0) {
>          const uint8_t *buf;
>          uint32_t size;
>
> -        buf =3D fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
> +        buf =3D fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size)=
;
>          qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
> -        len -=3D size;
> +        len =3D qemu_chr_be_can_write(vc->vte.chr);
> +        avail -=3D size;
>      }
>  }
>
> --
> 2.26.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000df06c305c9301fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 10:35 AM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Commit 584af1f1d9 (&quot;ui/gtk: add a keyboard fifo to the VTE<br>
consoles&quot;) changed the VTE chardev backend code to rely on the<br>
chr_accept_input() callback function. The code expects a<br>
chr_accept_input() call whenever qemu_chr_be_can_write() bytes<br>
were written. It turns out this is wrong. Some chardev<br>
frontends only call this callback after can_write was 0.<br>
<br>
Change the code to send data until the keyboard fifo is empty<br>
or qemu_chr_be_can_write() returns 0.<br>
<br>
Fixes: 584af1f1d9 (&quot;ui/gtk: add a keyboard fifo to the VTE consoles&qu=
ot;)<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk.c | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 974e4dfc0b..cfb0728d1f 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -1646,16 +1646,14 @@ static void gd_vc_send_chars(VirtualConsole *vc)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0len =3D qemu_chr_be_can_write(vc-&gt;vte.chr);<br>
=C2=A0 =C2=A0 =C2=A0avail =3D fifo8_num_used(&amp;vc-&gt;vte.out_fifo);<br>
-=C2=A0 =C2=A0 if (len &gt; avail) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
+=C2=A0 =C2=A0 while (len &gt; 0 &amp;&amp; avail &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;vc-&gt;vte.out_fifo=
, len, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;vc-&gt;vte.out_fifo=
, MIN(len, avail), &amp;size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_be_write(vc-&gt;vte.chr, (uint8_=
t *)buf, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(vc-&gt;vte.chr);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail -=3D size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000df06c305c9301fdc--

