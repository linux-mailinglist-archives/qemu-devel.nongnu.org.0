Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380922B5AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:28:09 +0100 (CET)
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewLQ-0004Dc-Ah
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewK2-0003VW-17
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:26:42 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:44393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kewK0-0004co-Bd
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:26:41 -0500
Received: by mail-ej1-x641.google.com with SMTP id y17so22560642ejh.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=681dJGZJ2nF3ajKD79z2aTrgj6ZquDscqGNy5HOLOrU=;
 b=JvIvp/906zdsQW0dLASWYToV4ds2fgxPzEf0Jazg6IUks0d/ezNVXZrC6sx6nfUGJT
 DrUGv8HgDPBdXvFbSqmnjBOaGocugmL/d8/OJQDvpQKLd8qSWf000pH3tYKmXHxHGrzx
 afDwtkfbIzY0ronos3c1auThUSzrgz4/C963wdjEGGUUHEnLthjDnNovOOwfqcNfMRT1
 sRYYCCroZHQiPjTiOb3NfnVyituka19vZPBsMuVwr4ITHWaaXIwdcPfDaLEemGZYnQDH
 KyRlrlaSs98e5fITZUsENhHSj9d5+uepN+AyGRYF2FvuETuH52V8KNm0hLzp/OZ0c5LQ
 jZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=681dJGZJ2nF3ajKD79z2aTrgj6ZquDscqGNy5HOLOrU=;
 b=EXh3fqGEY/af2YvD05SjL0xsbd4RLXTpc8GG7GK7vlMFBT8N1rct+phgpgyqFdQYg4
 PXeKkxA/I0ByT/6579pmgReMcrL0mv+BS1OwE9YCDFsYYibUBnB72tD9lPBUsThkofg4
 fF53nCutZIReXctggdMaGgEnJXKNS33R+p0VxWiTcUEM1hniAk78qpZZpqFw+H0TURKw
 3vehoW1nq0eCh6pEBEnkUxArGV7ovGTBmNb1QfZFxo9tb/mtsnI2pKwVH8ghNhi2aYSH
 zBq/nmoffDnOzU2IhSi9uW2g3j9TdFuFfe15+irkuGsiCfMwU4yYSGSEe5bSHHzAGEds
 XVLQ==
X-Gm-Message-State: AOAM531rjGhNOcUnvbooJNhfCicJnHIKEdyOh270L+3deeTXg0EvUd9R
 0hPbYxLWD1Jk1nP4uMS7/SAaY20PvX0rOPRelLI=
X-Google-Smtp-Source: ABdhPJwp8lPbZc12C5UwWuNPaDGD9Hm4/q0ZcpRXZeyJ6etItqxv0xNM+z9L7Xn4xWwKqzEF/zrXRZdH1285/N3WUJo=
X-Received: by 2002:a17:906:7c54:: with SMTP id
 g20mr18690557ejp.105.1605601598835; 
 Tue, 17 Nov 2020 00:26:38 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-3-ehabkost@redhat.com>
In-Reply-To: <20201116224143.1284278-3-ehabkost@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 12:26:27 +0400
Message-ID: <CAJ+F1C+ioNfrXMREj9wZkC5LXqyjoK1YrzUGFhK+Hk9HooqCEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] qnum: Make qnum_get_double() get const pointer
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f310fa05b4494069"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f310fa05b4494069
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> qnum_get_double() won't change the object, the argument can be
> const.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>

No idea why I didn't make it const in the first place.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/qapi/qmp/qnum.h | 2 +-
>  qobject/qnum.c          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> index 25f4733efc..55c27b1c24 100644
> --- a/include/qapi/qmp/qnum.h
> +++ b/include/qapi/qmp/qnum.h
> @@ -66,7 +66,7 @@ int64_t qnum_get_int(const QNum *qn);
>  bool qnum_get_try_uint(const QNum *qn, uint64_t *val);
>  uint64_t qnum_get_uint(const QNum *qn);
>
> -double qnum_get_double(QNum *qn);
> +double qnum_get_double(const QNum *qn);
>
>  char *qnum_to_string(QNum *qn);
>
> diff --git a/qobject/qnum.c b/qobject/qnum.c
> index 017c8aa739..69fd9a82d9 100644
> --- a/qobject/qnum.c
> +++ b/qobject/qnum.c
> @@ -154,7 +154,7 @@ uint64_t qnum_get_uint(const QNum *qn)
>   *
>   * qnum_get_double() loses precision for integers beyond 53 bits.
>   */
> -double qnum_get_double(QNum *qn)
> +double qnum_get_double(const QNum *qn)
>  {
>      switch (qn->kind) {
>      case QNUM_I64:
> --
> 2.28.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f310fa05b4494069
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 2:43 AM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">qn=
um_get_double() won&#39;t change the object, the argument can be<br>
const.<br>
<br>
Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com" t=
arget=3D"_blank">ehabkost@redhat.com</a>&gt;<br></blockquote><div><br></div=
><div>No idea why I didn&#39;t make it const in the first place.</div><div>=
<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; <br></div><d=
iv><br> </div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qapi/qmp/qnum.h | 2 +-<br>
=C2=A0qobject/qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h<br>
index 25f4733efc..55c27b1c24 100644<br>
--- a/include/qapi/qmp/qnum.h<br>
+++ b/include/qapi/qmp/qnum.h<br>
@@ -66,7 +66,7 @@ int64_t qnum_get_int(const QNum *qn);<br>
=C2=A0bool qnum_get_try_uint(const QNum *qn, uint64_t *val);<br>
=C2=A0uint64_t qnum_get_uint(const QNum *qn);<br>
<br>
-double qnum_get_double(QNum *qn);<br>
+double qnum_get_double(const QNum *qn);<br>
<br>
=C2=A0char *qnum_to_string(QNum *qn);<br>
<br>
diff --git a/qobject/qnum.c b/qobject/qnum.c<br>
index 017c8aa739..69fd9a82d9 100644<br>
--- a/qobject/qnum.c<br>
+++ b/qobject/qnum.c<br>
@@ -154,7 +154,7 @@ uint64_t qnum_get_uint(const QNum *qn)<br>
=C2=A0 *<br>
=C2=A0 * qnum_get_double() loses precision for integers beyond 53 bits.<br>
=C2=A0 */<br>
-double qnum_get_double(QNum *qn)<br>
+double qnum_get_double(const QNum *qn)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0switch (qn-&gt;kind) {<br>
=C2=A0 =C2=A0 =C2=A0case QNUM_I64:<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f310fa05b4494069--

