Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCA66CF8DE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 03:52:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phhRQ-0007Hh-5q; Wed, 29 Mar 2023 21:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phhRN-0007HR-9e
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 21:51:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phhRL-0001DM-4x
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 21:51:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id h8so70650778ede.8
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 18:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680141056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ra96PTiyny2Ee9F/YwmLVZ9Zq3wtcIxjWq1aIXOTsAs=;
 b=ywtLuNK/sYnl/tWCIxq1DzWyCh82NrHXFkIQeKkO7Iwi2sY8t0lgNgG8uINnN/+Wyz
 W4PFN+/wzkByKsBn2LbJzg2fL7NxSAAs2hqY9MguyNFa3eJLoSAHTBA9Hde6hXX7PHTj
 6GHGZ0MDha5NMI/K6xo9X1h6bs1qL+IKJ2YG6JhQ6Rw3XiQ2lRnhEN+aTlX4LAIg+p0B
 X/kzs3+i80nK/1L5IO0qyUdCWkWhUtjgm6CUWsSCVuJYKxlYKr6tReHH2QtwozmkpTxx
 RmKdpfrCbC21d2wzURMxoV8EdUjen4JgEfdi+8BM3ckQWozVVvLmKwOT9Zxe3Eb0ZRIX
 WoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680141056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ra96PTiyny2Ee9F/YwmLVZ9Zq3wtcIxjWq1aIXOTsAs=;
 b=58gBR+0snXJgXI75qV88Xdf/+qZFkyNUOfTfp5oN41pOVn86fYC1H9HdVpn+aMF6AT
 XDI3a6R4uHUgv3e5HoRv9AftB/S0VzQnbIfeql9rYeLEbqYi6pcSk2WanK+94P5mmxzn
 SYDgFqep4fDUQuFv9J+Le+ZEnIUhp/Vy/esAzd1mV0teCsXJekHYUzGy2oecmyMP/knY
 xv7WEmoUK9++PYoW9LrogyAe33vB/4U+K9fSaIJkIwqNe+HqQrQhrtar2RcrL5DeMXVs
 nKMUT/ch+hrDtkb6V/0PAPhVDVCSCbfrWjhVnQGHTtKBrNn5ZdwXgkDLsNBE44bn0REA
 F1sA==
X-Gm-Message-State: AAQBX9fpXB+LruXIoNsOc3wukioHGZ+TNq+4tvx+357hfJa3kwxpKq8A
 K4bxS5PZMox15DEUE37Hq5eCnSUTFLkMOfgQVC0JDg==
X-Google-Smtp-Source: AKy350byjnQt+A1z5A2gkI/gsESMsBBzXCcZb7oZFisFsyMeFywUpTkHKhm61hC66MNDeNOSS+CjHLRFiVUUaB7t+qE=
X-Received: by 2002:a17:907:3e8b:b0:931:ce20:db6e with SMTP id
 hs11-20020a1709073e8b00b00931ce20db6emr11965385ejc.2.1680141055752; Wed, 29
 Mar 2023 18:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <mvmlejfsivd.fsf@suse.de>
In-Reply-To: <mvmlejfsivd.fsf@suse.de>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 29 Mar 2023 19:25:05 -0600
Message-ID: <CANCZdfpd6KnaE9vrQtRXc0ORs1QoA5+HaCRExcTLTZj0v2R=JA@mail.gmail.com>
Subject: Re: [PATCH v3] linux-user,bsd-user: preserve incoming order of
 environment variables in the target
To: Andreas Schwab <schwab@suse.de>
Cc: Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@freebsd.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cd0e4605f8145257"
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000cd0e4605f8145257
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 29, 2023, 9:00 AM Andreas Schwab <schwab@suse.de> wrote:

> Do not reverse the order of environment variables in the target environ
> array relative to the incoming environ order.  Some testsuites depend on a
> specific order, even though it is not defined by any standard.
>
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  bsd-user/main.c   | 10 +++++++++-
>  linux-user/main.c | 10 +++++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 89f225dead..eff834e8d8 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -298,8 +298,16 @@ int main(int argc, char **argv)
>
>      envlist = envlist_create();
>
> -    /* add current environment into the list */
> +    /*
> +     * add current environment into the list
> +     * envlist_setenv adds to the front of the list; to preserve environ
> +     * order add from back to front
> +     */
>      for (wrk = environ; *wrk != NULL; wrk++) {
> +        continue;
> +    }
> +    while (wrk != environ) {
> +        wrk--;
>          (void) envlist_setenv(envlist, *wrk);
>      }
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4b18461969..f0173ceefa 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -690,8 +690,16 @@ int main(int argc, char **argv, char **envp)
>
>      envlist = envlist_create();
>
> -    /* add current environment into the list */
> +    /*
> +     * add current environment into the list
> +     * envlist_setenv adds to the front of the list; to preserve environ
> +     * order add from back to front
> +     */
>      for (wrk = environ; *wrk != NULL; wrk++) {
> +        continue;
> +    }
> +    while (wrk != environ) {
> +        wrk--;
>          (void) envlist_setenv(envlist, *wrk);
>      }
>
> --
> 2.40.0
>
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>

--000000000000cd0e4605f8145257
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 29, 2023, 9:00 AM Andreas Schwab &lt;<a hr=
ef=3D"mailto:schwab@suse.de">schwab@suse.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Do not reverse the order of environment variables i=
n the target environ<br>
array relative to the incoming environ order.=C2=A0 Some testsuites depend =
on a<br>
specific order, even though it is not defined by any standard.<br>
<br>
Signed-off-by: Andreas Schwab &lt;<a href=3D"mailto:schwab@suse.de" target=
=3D"_blank" rel=3D"noreferrer">schwab@suse.de</a>&gt;<br>
---<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0| 10 +++++++++-<br>
=C2=A0linux-user/main.c | 10 +++++++++-<br>
=C2=A02 files changed, 18 insertions(+), 2 deletions(-)<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Warner =
Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index 89f225dead..eff834e8d8 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -298,8 +298,16 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0envlist =3D envlist_create();<br>
<br>
-=C2=A0 =C2=A0 /* add current environment into the list */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* add current environment into the list<br>
+=C2=A0 =C2=A0 =C2=A0* envlist_setenv adds to the front of the list; to pre=
serve environ<br>
+=C2=A0 =C2=A0 =C2=A0* order add from back to front<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0for (wrk =3D environ; *wrk !=3D NULL; wrk++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while (wrk !=3D environ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrk--;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) envlist_setenv(envlist, *wrk);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index 4b18461969..f0173ceefa 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -690,8 +690,16 @@ int main(int argc, char **argv, char **envp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0envlist =3D envlist_create();<br>
<br>
-=C2=A0 =C2=A0 /* add current environment into the list */<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* add current environment into the list<br>
+=C2=A0 =C2=A0 =C2=A0* envlist_setenv adds to the front of the list; to pre=
serve environ<br>
+=C2=A0 =C2=A0 =C2=A0* order add from back to front<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0for (wrk =3D environ; *wrk !=3D NULL; wrk++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while (wrk !=3D environ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrk--;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) envlist_setenv(envlist, *wrk);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.40.0<br>
<br>
<br>
-- <br>
Andreas Schwab, SUSE Labs, <a href=3D"mailto:schwab@suse.de" target=3D"_bla=
nk" rel=3D"noreferrer">schwab@suse.de</a><br>
GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE=C2=A0 1748 E4D4 88E3 0EEA =
B9D7<br>
&quot;And now for something completely different.&quot;<br>
</blockquote></div></div></div>

--000000000000cd0e4605f8145257--

