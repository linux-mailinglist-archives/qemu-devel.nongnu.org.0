Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBDB454BF7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:29:47 +0100 (CET)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOkk-000741-Ne
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:29:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOjF-0005eA-KK
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:28:14 -0500
Received: from [2607:f8b0:4864:20::92a] (port=33621
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOjD-00083U-Of
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:28:13 -0500
Received: by mail-ua1-x92a.google.com with SMTP id b17so7704031uas.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BH3/ncDWQ1Lp6ctF8tJqwHq1bcbOJ7aDEC9JGDmtLs=;
 b=Ylh1tYR6UBDCCamwAAVJu0ygIFhIzEPfUZHqEo7WFOa0nMlnMI7M82MEM7qmlLscx+
 0t/iGQfs+/WLb8WNaiQFIx0xlQZ0ZgInFPvUSMOz1O4FfU1ZX+TqSZ0TSiGafzEFxpJy
 s+K1uYvAqwrC56+k7Mfv5HI37tgsjQ1tEepubVqz5z9Fbwp85efEJ7lw2pGcVby/fgB9
 lmA10kRNndHJh8pYmFnucMtY9RIc6u/WMgls91v8VzAJkSTJA3mQqDIaS22SRUcaeJgX
 m/gnB6NfWxAKQ45Pv42CCm4MFHxnvrUS52WQOPkMI9IfJZlCeFg9bRh28U63SorVUc0a
 0kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BH3/ncDWQ1Lp6ctF8tJqwHq1bcbOJ7aDEC9JGDmtLs=;
 b=6Mn/eQbzleYG0L9xXO8yGCezMD3kLLkdCLkziMHxRfc3zujccQU1BCg8yd4oUUtvDB
 gnzCKH71X7sUjgfbzlFQBEo8i03iVoUsjXwgHN+Y5Et+qoWXw6o71t4Bz6S364JTBn0I
 3bPcYvKurumueh+J1JjMBOuFYtyB8V2Dit0HmB07n/SEnP+uTDI6wPt0y204iIneW+xm
 YFBtReBitWLIUu2Ft2TGC7wardGnx3uNCUPFeClArqzU5DPuYoV0KurGoZNgh5AqEQ35
 K4xzCdvshGAjsLIp2qM+ia8IDzq6D8LVUCBdeIhkpSef2ue3BbnbK4A+tS42TOpww2pR
 5w6g==
X-Gm-Message-State: AOAM533Xa16ktgLSC244Y8wyEv1paYsT5qDcM4hYxbnifPz+Ptxao2f/
 pkONkK20rhw6z+17/eqZ5TbaLSTnoyJiOO0LZNgrZg==
X-Google-Smtp-Source: ABdhPJwm9dOxPkIa1tMlvaMPlZ/6opeAM8jd4GhjQqWhbB/zdgJdzbInusUxYJhr/N+IyLVe+vpawsq1yeH9F6XqsUs=
X-Received: by 2002:a67:fdc3:: with SMTP id l3mr69716419vsq.42.1637170088259; 
 Wed, 17 Nov 2021 09:28:08 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-16-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-16-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:27:58 -0700
Message-ID: <CANCZdfqqg=2hCT6Wpo0OVjRVx3mxCGrQ4_3SpNq-34r2McP=Sg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] linux-user: Move thunk.c from top-level
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008db55605d0ff5d2a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008db55605d0ff5d2a
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> So far, linux-user is the only user of these functions.
> Clean up the build machinery by restricting it to linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                   | 1 -
>  thunk.c => linux-user/thunk.c | 0
>  linux-user/meson.build        | 1 +
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename thunk.c => linux-user/thunk.c (100%)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/meson.build b/meson.build
> index 387f7fe1c9..9f59c57909 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2614,7 +2614,6 @@ subdir('linux-user')
>
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>
> -linux_user_ss.add(files('thunk.c'))
>  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
>
>  common_user_ss = common_user_ss.apply(config_all, strict: false)
> diff --git a/thunk.c b/linux-user/thunk.c
> similarity index 100%
> rename from thunk.c
> rename to linux-user/thunk.c
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index bf9d945504..fcf7d40f23 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -15,6 +15,7 @@ linux_user_ss.add(files(
>    'signal.c',
>    'strace.c',
>    'syscall.c',
> +  'thunk.c',
>    'uaccess.c',
>    'uname.c',
>  ))
> --
> 2.25.1
>
>

--0000000000008db55605d0ff5d2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">So far, linux-user is the only user of these functions.<b=
r>
Clean up the build machinery by restricting it to linux-user.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0thunk.c =3D&gt; linux-user/thunk.c | 0<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A03 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename thunk.c =3D&gt; linux-user/thunk.c (100%)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
diff --git a/meson.build b/meson.build<br>
index 387f7fe1c9..9f59c57909 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2614,7 +2614,6 @@ subdir(&#39;linux-user&#39;)<br>
<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bsd_use=
r_ss)<br>
<br>
-linux_user_ss.add(files(&#39;thunk.c&#39;))<br>
=C2=A0specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: linux=
_user_ss)<br>
<br>
=C2=A0common_user_ss =3D common_user_ss.apply(config_all, strict: false)<br=
>
diff --git a/thunk.c b/linux-user/thunk.c<br>
similarity index 100%<br>
rename from thunk.c<br>
rename to linux-user/thunk.c<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index bf9d945504..fcf7d40f23 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -15,6 +15,7 @@ linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;signal.c&#39;,<br>
=C2=A0 =C2=A0&#39;strace.c&#39;,<br>
=C2=A0 =C2=A0&#39;syscall.c&#39;,<br>
+=C2=A0 &#39;thunk.c&#39;,<br>
=C2=A0 =C2=A0&#39;uaccess.c&#39;,<br>
=C2=A0 =C2=A0&#39;uname.c&#39;,<br>
=C2=A0))<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000008db55605d0ff5d2a--

