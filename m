Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCF40FE57
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:04:44 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHI3-0000xg-Bo
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mRHFM-0007hM-Oj
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mRHFC-0002eO-3b
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631898102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zkNfZVSI2mKGpekE3Vn357S6xU21KhD/CQ6Olk0VTNo=;
 b=OCsNyRCrrIlX6l4s6DsEHSYVyBiCfc6hResTf1GZ9KZ51HRo3NrdcWk+OfIoYBOnodWsel
 s9IFtxfCZMMNxqagrM2zWt5eNZkRrd+hFsQauL9GD5dlLrTqssT8PjzI46pgCJrYCHNM0S
 tmOaGpM20Htde14EdlqA0L2Nrl20f1o=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-zddhtzZ5PRuvYcTmAyj97A-1; Fri, 17 Sep 2021 13:01:41 -0400
X-MC-Unique: zddhtzZ5PRuvYcTmAyj97A-1
Received: by mail-pf1-f200.google.com with SMTP id
 v206-20020a627ad7000000b0043e010e5392so7732361pfc.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zkNfZVSI2mKGpekE3Vn357S6xU21KhD/CQ6Olk0VTNo=;
 b=zoop5VG0YB5zbsP6JGg36dvZzprxl4KZwveyEs8UNii9cPAyxvjm9V4Dd46GTXF1Q3
 gfiegkdSLHlAiMahTA0IrZxINveSFNcZKpXbQ4QYrg0LWjXeji2T9QauSj+6trCaNFk7
 iZOjUZ/9i5HxMGNAUGOx51mdKI1NmbJBa6wUxMznSl76I4LOOsD4Lv49EE4UHnFy87VR
 G6aBaYa7kuKOYTpsYAnqMBCLYj3zr6xJsDmPidp86cr0Pwm6bpCiqCD+/dGTN998DYEx
 KUl3hWNLNaXnUByQzRgeT/qxo3hpEqfIJujHKnBiLO4GufDzMqyRTQjID9VlbwdU+egz
 ajQg==
X-Gm-Message-State: AOAM5324D4/7qQwb+yrBJe0JyIZnqpUqb0rwp+F+I/MTMSUGifEdGM9f
 L16FjnrEUxtihP9z2wCEQFbYhy5kIjCXx1VBr6Fg7NDGPps0cc73ITZVNJ2KvpWnPOkjd5MqLOL
 VohS/wwjuWaoaxlrXgOlinqmUGKP9v1Y=
X-Received: by 2002:a05:6a00:124f:b0:416:4ed7:e4c6 with SMTP id
 u15-20020a056a00124f00b004164ed7e4c6mr11570672pfi.85.1631898099424; 
 Fri, 17 Sep 2021 10:01:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8PqS/qs9iivp4KXga6DI7VIqBr5cB59J4ia5JcuzgDWBml9PEIsSNixeofT5+xnrRzifbGOoGJ/91+3pw0zI=
X-Received: by 2002:a05:6a00:124f:b0:416:4ed7:e4c6 with SMTP id
 u15-20020a056a00124f00b004164ed7e4c6mr11570642pfi.85.1631898099102; Fri, 17
 Sep 2021 10:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
 <20210916192239.18742-1-vr_qemu@t-online.de>
In-Reply-To: <20210916192239.18742-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 17 Sep 2021 21:01:28 +0400
Message-ID: <CAMxuvaxBvRQLOuYC9ghYx6zGe=i_SXrjvPDpcVt_BmqsQK_aOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ui/console: replace QEMUFIFO with Fifo8
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000081c7e605cc33e21a"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000081c7e605cc33e21a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2021 at 11:22 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> One of the two FIFO implementations QEMUFIFO and Fifo8 is
> redundant. Replace QEMUFIFO with Fifo8.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/console.c | 86 ++++++++++++----------------------------------------
>  1 file changed, 20 insertions(+), 66 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index eabbbc951c..d2433c0636 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -27,6 +27,7 @@
>  #include "hw/qdev-core.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qemu/fifo8.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "qemu/timer.h"
> @@ -62,57 +63,6 @@ enum TTYState {
>      TTY_STATE_CSI,
>  };
>
> -typedef struct QEMUFIFO {
> -    uint8_t *buf;
> -    int buf_size;
> -    int count, wptr, rptr;
> -} QEMUFIFO;
> -
> -static int qemu_fifo_write(QEMUFIFO *f, const uint8_t *buf, int len1)
> -{
> -    int l, len;
> -
> -    l =3D f->buf_size - f->count;
> -    if (len1 > l)
> -        len1 =3D l;
> -    len =3D len1;
> -    while (len > 0) {
> -        l =3D f->buf_size - f->wptr;
> -        if (l > len)
> -            l =3D len;
> -        memcpy(f->buf + f->wptr, buf, l);
> -        f->wptr +=3D l;
> -        if (f->wptr >=3D f->buf_size)
> -            f->wptr =3D 0;
> -        buf +=3D l;
> -        len -=3D l;
> -    }
> -    f->count +=3D len1;
> -    return len1;
> -}
> -
> -static int qemu_fifo_read(QEMUFIFO *f, uint8_t *buf, int len1)
> -{
> -    int l, len;
> -
> -    if (len1 > f->count)
> -        len1 =3D f->count;
> -    len =3D len1;
> -    while (len > 0) {
> -        l =3D f->buf_size - f->rptr;
> -        if (l > len)
> -            l =3D len;
> -        memcpy(buf, f->buf + f->rptr, l);
> -        f->rptr +=3D l;
> -        if (f->rptr >=3D f->buf_size)
> -            f->rptr =3D 0;
> -        buf +=3D l;
> -        len -=3D l;
> -    }
> -    f->count -=3D len1;
> -    return len1;
> -}
> -
>  typedef enum {
>      GRAPHIC_CONSOLE,
>      TEXT_CONSOLE,
> @@ -165,8 +115,7 @@ struct QemuConsole {
>
>      Chardev *chr;
>      /* fifo for key pressed */
> -    QEMUFIFO out_fifo;
> -    uint8_t out_fifo_buf[16];
> +    Fifo8 out_fifo;
>      QEMUTimer *kbd_timer;
>      CoQueue dump_queue;
>
> @@ -1160,21 +1109,25 @@ static int vc_chr_write(Chardev *chr, const
> uint8_t *buf, int len)
>  static void kbd_send_chars(void *opaque)
>  {
>      QemuConsole *s =3D opaque;
> -    int len;
> -    uint8_t buf[16];
> +    uint32_t len, avail;
>
>      len =3D qemu_chr_be_can_write(s->chr);
> -    if (len > s->out_fifo.count)
> -        len =3D s->out_fifo.count;
> -    if (len > 0) {
> -        if (len > sizeof(buf))
> -            len =3D sizeof(buf);
> -        qemu_fifo_read(&s->out_fifo, buf, len);
> -        qemu_chr_be_write(s->chr, buf, len);
> +    avail =3D fifo8_num_used(&s->out_fifo);
> +    if (len > avail) {
> +        len =3D avail;
> +    }
> +    while (len > 0) {
> +        const uint8_t *buf;
> +        uint32_t size;
> +
> +        buf =3D fifo8_pop_buf(&s->out_fifo, len, &size);
> +        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> +        len -=3D size;
> +        avail -=3D size;
>      }
>      /* characters are pending: we send them a bit later (XXX:
>         horrible, should change char device API) */
> -    if (s->out_fifo.count > 0) {
> +    if (avail > 0) {
>          timer_mod(s->kbd_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) +
> 1);
>      }
>  }
> @@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s, int
> keysym)
>      uint8_t buf[16], *q;
>      CharBackend *be;
>      int c;
> +    uint32_t num_free;
>
>      if (!s || (s->console_type =3D=3D GRAPHIC_CONSOLE))
>          return;
> @@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int
> keysym)
>          }
>          be =3D s->chr->be;
>          if (be && be->chr_read) {
> -            qemu_fifo_write(&s->out_fifo, buf, q - buf);
> +            num_free =3D fifo8_num_free(&s->out_fifo);
> +            fifo8_push_all(&s->out_fifo, buf, MIN(num_free, q - buf));
>              kbd_send_chars(s);
>          }
>          break;
> @@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev *chr,
> DisplayState *ds)
>      int g_width =3D 80 * FONT_WIDTH;
>      int g_height =3D 24 * FONT_HEIGHT;
>
> -    s->out_fifo.buf =3D s->out_fifo_buf;
> -    s->out_fifo.buf_size =3D sizeof(s->out_fifo_buf);
> +    fifo8_create(&s->out_fifo, 16);
>      s->kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, kbd_send_chars, s=
);
>      s->ds =3D ds;
>
> --
> 2.31.1
>
>

--00000000000081c7e605cc33e21a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 16, 2021 at 11:22 PM Volk=
er R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">One of the two FIFO implementations QEMUFIFO and Fifo8 is<br>
redundant. Replace QEMUFIFO with Fifo8.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 86 ++++++++++++---------------------------------------=
-<br>
=C2=A01 file changed, 20 insertions(+), 66 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index eabbbc951c..d2433c0636 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;hw/qdev-core.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
+#include &quot;qemu/fifo8.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
@@ -62,57 +63,6 @@ enum TTYState {<br>
=C2=A0 =C2=A0 =C2=A0TTY_STATE_CSI,<br>
=C2=A0};<br>
<br>
-typedef struct QEMUFIFO {<br>
-=C2=A0 =C2=A0 uint8_t *buf;<br>
-=C2=A0 =C2=A0 int buf_size;<br>
-=C2=A0 =C2=A0 int count, wptr, rptr;<br>
-} QEMUFIFO;<br>
-<br>
-static int qemu_fifo_write(QEMUFIFO *f, const uint8_t *buf, int len1)<br>
-{<br>
-=C2=A0 =C2=A0 int l, len;<br>
-<br>
-=C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;count;<br>
-=C2=A0 =C2=A0 if (len1 &gt; l)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len1 =3D l;<br>
-=C2=A0 =C2=A0 len =3D len1;<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;wptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt; len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(f-&gt;buf + f-&gt;wptr, buf, l);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;wptr +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f-&gt;wptr &gt;=3D f-&gt;buf_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;wptr =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D l;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 f-&gt;count +=3D len1;<br>
-=C2=A0 =C2=A0 return len1;<br>
-}<br>
-<br>
-static int qemu_fifo_read(QEMUFIFO *f, uint8_t *buf, int len1)<br>
-{<br>
-=C2=A0 =C2=A0 int l, len;<br>
-<br>
-=C2=A0 =C2=A0 if (len1 &gt; f-&gt;count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len1 =3D f-&gt;count;<br>
-=C2=A0 =C2=A0 len =3D len1;<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;rptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt; len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf, f-&gt;buf + f-&gt;rptr, l);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;rptr +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f-&gt;rptr &gt;=3D f-&gt;buf_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;rptr =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D l;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 f-&gt;count -=3D len1;<br>
-=C2=A0 =C2=A0 return len1;<br>
-}<br>
-<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0GRAPHIC_CONSOLE,<br>
=C2=A0 =C2=A0 =C2=A0TEXT_CONSOLE,<br>
@@ -165,8 +115,7 @@ struct QemuConsole {<br>
<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr;<br>
=C2=A0 =C2=A0 =C2=A0/* fifo for key pressed */<br>
-=C2=A0 =C2=A0 QEMUFIFO out_fifo;<br>
-=C2=A0 =C2=A0 uint8_t out_fifo_buf[16];<br>
+=C2=A0 =C2=A0 Fifo8 out_fifo;<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer *kbd_timer;<br>
=C2=A0 =C2=A0 =C2=A0CoQueue dump_queue;<br>
<br>
@@ -1160,21 +1109,25 @@ static int vc_chr_write(Chardev *chr, const uint8_t=
 *buf, int len)<br>
=C2=A0static void kbd_send_chars(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuConsole *s =3D opaque;<br>
-=C2=A0 =C2=A0 int len;<br>
-=C2=A0 =C2=A0 uint8_t buf[16];<br>
+=C2=A0 =C2=A0 uint32_t len, avail;<br>
<br>
=C2=A0 =C2=A0 =C2=A0len =3D qemu_chr_be_can_write(s-&gt;chr);<br>
-=C2=A0 =C2=A0 if (len &gt; s-&gt;out_fifo.count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D s-&gt;out_fifo.count;<br>
-=C2=A0 =C2=A0 if (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; sizeof(buf))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D sizeof(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fifo_read(&amp;s-&gt;out_fifo, buf, len);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(s-&gt;chr, buf, len);<br>
+=C2=A0 =C2=A0 avail =3D fifo8_num_used(&amp;s-&gt;out_fifo);<br>
+=C2=A0 =C2=A0 if (len &gt; avail) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while (len &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;s-&gt;out_fifo, len=
, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(s-&gt;chr, (uint8_t *)buf, s=
ize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail -=3D size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/* characters are pending: we send them a bit later (XX=
X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 horrible, should change char device API) */<br>
-=C2=A0 =C2=A0 if (s-&gt;out_fifo.count &gt; 0) {<br>
+=C2=A0 =C2=A0 if (avail &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;kbd_timer, qemu_clock_get=
_ms(QEMU_CLOCK_REALTIME) + 1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s, int keysy=
m)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t buf[16], *q;<br>
=C2=A0 =C2=A0 =C2=A0CharBackend *be;<br>
=C2=A0 =C2=A0 =C2=A0int c;<br>
+=C2=A0 =C2=A0 uint32_t num_free;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!s || (s-&gt;console_type =3D=3D GRAPHIC_CONSOLE))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int keysy=
m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be =3D s-&gt;chr-&gt;be;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (be &amp;&amp; be-&gt;chr_read) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fifo_write(&amp;s-&gt;out_f=
ifo, buf, q - buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_free =3D fifo8_num_free(&amp=
;s-&gt;out_fifo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&amp;s-&gt;out_fi=
fo, buf, MIN(num_free, q - buf));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kbd_send_chars(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev *chr, Displa=
yState *ds)<br>
=C2=A0 =C2=A0 =C2=A0int g_width =3D 80 * FONT_WIDTH;<br>
=C2=A0 =C2=A0 =C2=A0int g_height =3D 24 * FONT_HEIGHT;<br>
<br>
-=C2=A0 =C2=A0 s-&gt;out_fifo.buf =3D s-&gt;out_fifo_buf;<br>
-=C2=A0 =C2=A0 s-&gt;out_fifo.buf_size =3D sizeof(s-&gt;out_fifo_buf);<br>
+=C2=A0 =C2=A0 fifo8_create(&amp;s-&gt;out_fifo, 16);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, k=
bd_send_chars, s);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;ds =3D ds;<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000081c7e605cc33e21a--


