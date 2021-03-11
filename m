Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBCC336F91
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:07:21 +0100 (CET)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIDw-0006Ux-3z
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKIBY-0004xg-JC
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:04:52 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lKIBV-0003vu-Sn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:04:52 -0500
Received: by mail-ed1-x535.google.com with SMTP id y6so1856212eds.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bg9CP7RJUKVqlipVJQbb5yhDV6Z/zfnXqfb5Pbq5n5A=;
 b=NmPQl5ja91KVeO4Gc3CpVDRZ2RCit/ALc2UjCKVR1Qly4bAWQnv5zEmp4PgQkbSPZp
 Q6pF5mRknbgYDEBn8iWbOHrP+bI4pPqNwQo6RP2eye6GjI0co4K7/KlozZuBQnTTf5QY
 n/vb4P3LWUVezOeC4gLf0bZDTawfcTxhZXJrIJflYc13eJ1rYxyWgGmG1YTTe4AhE0QX
 vEn4MtQltloSfVc88+cTgbYWm0uY0pbPPo1RjOtqnjDCijJhMB6ppHI4NNrfLy3btgez
 Pn1xENkTRF69aJIo1OsskjTINwblY9wt2F9i5O9faNBtUbw0l1JZder3hBbHUAtmIVca
 DuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bg9CP7RJUKVqlipVJQbb5yhDV6Z/zfnXqfb5Pbq5n5A=;
 b=lOxjlxh4X6JSkFP+YR01vOPBlJ9JGFw5z43H8nPACk0n+14ENK8XTuVQW6ySlSwb7X
 6zL1NXgjVchnHsUyo6l3y8B9z1GuXDnDzQug1EGGJiu0stR03mhaoe9/0zw+6t3URNtL
 Wr665eBnjb9NCH/Q9tfs8DLrBHr3bsQh/jU0RkZKxSDIyCP5wxaAmbwITwheXMnW4DJw
 NWJv5gO7K0I0Btk97SSR0vszsYKMr9fCIiawq94qB44QcwQrqX/VJ3p0qtIp1ti30zAw
 JURm0MVHUEsJ4EoTCw2ku7fawS0a4ih522hJe/TJNs0WsBz7hEDBwZ0huh9OgKKDqgLy
 fBAA==
X-Gm-Message-State: AOAM530DBNRZXQU8ZFbtLQjZ5AJla9pLu9kG6ilqBc211eb1UKx9zggS
 iPsZ+K/oAwztewV3b4fCgAY8fmKhYurbgiF698o=
X-Google-Smtp-Source: ABdhPJw3c83W++/5TkF+kBekeq3JQBh6B9b9wbOUY0c+Nu0csSINGJW+cRcI4bliLumkgRg1DDilYUWMcRqVO1lFT0g=
X-Received: by 2002:a50:ee05:: with SMTP id g5mr7686332eds.164.1615457087917; 
 Thu, 11 Mar 2021 02:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-2-ma.mandourr@gmail.com>
In-Reply-To: <20210311031538.5325-2-ma.mandourr@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 11 Mar 2021 14:04:36 +0400
Message-ID: <CAJ+F1CKVyUvmX3A4U-i2=s0UEtaHuBm753ZHrv6kTh1e5Vy_FQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] tpm: Changed a qemu_mutex_lock to QEMU_LOCK_GUARD
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e00f4b05bd3fe92b"
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
Cc: QEMU <qemu-devel@nongnu.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e00f4b05bd3fe92b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 1:26 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Removed a qemu_mutex_lock() and its respective qemu_mutex_unlock()
> and used QEMU_LOCK_GUARD instead. This simplifies the code by
> eliminiating gotos and removing the qemu_mutex_unlock() calls.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  backends/tpm/tpm_emulator.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index a012adc193..a3c041e402 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -126,7 +126,7 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm,
> unsigned long cmd, void *msg,
>      uint8_t *buf =3D NULL;
>      int ret =3D -1;
>
> -    qemu_mutex_lock(&tpm->mutex);
> +    QEMU_LOCK_GUARD(&tpm->mutex);
>
>      buf =3D g_alloca(n);
>      memcpy(buf, &cmd_no, sizeof(cmd_no));
> @@ -134,20 +134,18 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm,
> unsigned long cmd, void *msg,
>
>      n =3D qemu_chr_fe_write_all(dev, buf, n);
>      if (n <=3D 0) {
> -        goto end;
> +        return ret;
>      }
>
>      if (msg_len_out !=3D 0) {
>          n =3D qemu_chr_fe_read_all(dev, msg, msg_len_out);
>          if (n <=3D 0) {
> -            goto end;
> +            return ret;
>          }
>      }
>
>      ret =3D 0;
>
> -end:
> -    qemu_mutex_unlock(&tpm->mutex);
>      return ret;
>  }
>
> --
> 2.25.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e00f4b05bd3fe92b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 11, 2021 at 1:26 PM Mahmo=
ud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Removed a qemu_mutex_lock() and its respective qemu_mutex_unlock()<br>
and used QEMU_LOCK_GUARD instead. This simplifies the code by<br>
eliminiating gotos and removing the qemu_mutex_unlock() calls.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0backends/tpm/tpm_emulator.c | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c<br>
index a012adc193..a3c041e402 100644<br>
--- a/backends/tpm/tpm_emulator.c<br>
+++ b/backends/tpm/tpm_emulator.c<br>
@@ -126,7 +126,7 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsig=
ned long cmd, void *msg,<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *buf =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>
<br>
-=C2=A0 =C2=A0 qemu_mutex_lock(&amp;tpm-&gt;mutex);<br>
+=C2=A0 =C2=A0 QEMU_LOCK_GUARD(&amp;tpm-&gt;mutex);<br>
<br>
=C2=A0 =C2=A0 =C2=A0buf =3D g_alloca(n);<br>
=C2=A0 =C2=A0 =C2=A0memcpy(buf, &amp;cmd_no, sizeof(cmd_no));<br>
@@ -134,20 +134,18 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, uns=
igned long cmd, void *msg,<br>
<br>
=C2=A0 =C2=A0 =C2=A0n =3D qemu_chr_fe_write_all(dev, buf, n);<br>
=C2=A0 =C2=A0 =C2=A0if (n &lt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (msg_len_out !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D qemu_chr_fe_read_all(dev, msg, msg_=
len_out);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (n &lt;=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
<br>
-end:<br>
-=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;tpm-&gt;mutex);<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e00f4b05bd3fe92b--

