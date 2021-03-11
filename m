Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A01336F9A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:10:43 +0100 (CET)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIHB-0001yL-Jb
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKICE-0005ci-P3
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:34 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKICC-0004Yi-Tn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:34 -0500
Received: by mail-ed1-x535.google.com with SMTP id h13so1860212eds.5
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hbuo7BNkfdNVplF+xs0lk0+0tJnOIupYbC+a6MpKJ1o=;
 b=uNO6T8pzRztP5FbVL8z9t+2eb5HD8yUuvaqWQqQ0HHzUbKvVx0X9D3iklQtvSsOq79
 HmZBdlJ3mMtwfriESpq15JzN9Fu/HTkc/80L331CAERTPLexmGkv0FkWapHj3gc+W7fI
 UCC3kA91gvi3sxyO6voNX8nQABXytBTpwIdbG4MuK//yloKJYc047XXU7Uet2Ny1/yTM
 IfkhuiLpfrpJS/2K6BwGhyNpmKg1G5UKKFGIeYyitSiWRVZX7X+TJgXlVIalLEc8tB7/
 lwMkM4vSNwcnO3y2jbivRkoig7enmH9xjKKGchdeKSLKlctzRZdVCN4PbES9K4P9vdMs
 f25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hbuo7BNkfdNVplF+xs0lk0+0tJnOIupYbC+a6MpKJ1o=;
 b=fDYLxdvbnAH3eZy1JFHZH3X2iyEYX8B/OSVrkwfDGeFWEzlgZ82+siFkC1F7sYIp8M
 LxbVJCMur0n5OroQGVV70+bHLh69XYDHduFoFwlKPWz1gMBoebqN/InTp4a7f48YyN3E
 /zo1s1CtYmFiWMzWyzYer5WSAmJakniB1hKpW69TEnR+VooRF+jMIzcYztevDk4ni+vz
 KvVSGWfdwOtDIpYcCWSuxxig0bamDZcAhWl9WT0jEhyOxDX0Q8FSS5+1lNLgOcypFlS6
 6DaHcGd1IJBBeJXRdG+AvAzymO2w30L/0wdST3uZQDYL2kH0j4KEoTBDEA6cp0WbTtpj
 e3Fw==
X-Gm-Message-State: AOAM530ooTckI+zx/vp+bnu1wIT6HHDW3sHiDzCFS9L4RGdaOfxw5bAu
 pImIYGGOKwDrgstHaofs/0EvhFV2xujQ2jUgr6I=
X-Google-Smtp-Source: ABdhPJz6BdF2qOZsH2WqoVBe0zsHUhfFwAViLOZdGL0Z8wB8CfjuJYsTqM6+RbzKglPHERo/eZXklzyzL4ZBmwFjQc8=
X-Received: by 2002:aa7:cf17:: with SMTP id a23mr7916001edy.30.1615457131575; 
 Thu, 11 Mar 2021 02:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-4-ma.mandourr@gmail.com>
In-Reply-To: <20210311031538.5325-4-ma.mandourr@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Mar 2021 14:05:20 +0400
Message-ID: <CAJ+F1CL0E9VyZzNAFHaDiJVC4E6jE6ti61s8t1viim6WSQNUNw@mail.gmail.com>
Subject: Re: [PATCH 3/9] char: Replaced a qemu_mutex_lock with QEMU_LOCK_GUARD
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007a3d8205bd3fecd7"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007a3d8205bd3fecd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 1:28 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Removed a pair of qemu_mutex_lock and its respective qemu_mutex_unlock
> and used a QEMU_LOCK_GUARD instead. This improves readability by
> removing the call to qemu_mutex_unlock.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 97cafd6849..2b0bc1325c 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -115,7 +115,7 @@ static int qemu_chr_write_buffer(Chardev *s,
>      int res =3D 0;
>      *offset =3D 0;
>
> -    qemu_mutex_lock(&s->chr_write_lock);
> +    QEMU_LOCK_GUARD(&s->chr_write_lock);
>      while (*offset < len) {
>      retry:
>          res =3D cc->chr_write(s, buf + *offset, len - *offset);
> @@ -153,7 +153,6 @@ static int qemu_chr_write_buffer(Chardev *s,
>           */
>          qemu_chr_write_log(s, buf, len);
>      }
> -    qemu_mutex_unlock(&s->chr_write_lock);
>
>      return res;
>  }
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007a3d8205bd3fecd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 1:28 PM Mahmo=
ud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Removed a pair of qemu_mutex_lock and its respective qemu_mutex_unlock<br=
>
and used a QEMU_LOCK_GUARD instead. This improves readability by<br>
removing the call to qemu_mutex_unlock.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 97cafd6849..2b0bc1325c 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -115,7 +115,7 @@ static int qemu_chr_write_buffer(Chardev *s,<br>
=C2=A0 =C2=A0 =C2=A0int res =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0*offset =3D 0;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock(&amp;s-&gt;chr_write_lock);<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;s-&gt;chr_write_lock);<br>
=C2=A0 =C2=A0 =C2=A0while (*offset &lt; len) {<br>
=C2=A0 =C2=A0 =C2=A0retry:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D cc-&gt;chr_write(s, buf + *offset=
, len - *offset);<br>
@@ -153,7 +153,6 @@ static int qemu_chr_write_buffer(Chardev *s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_write_log(s, buf, len);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;s-&gt;chr_write_lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return res;<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007a3d8205bd3fecd7--

