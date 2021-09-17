Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0840FE59
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 19:07:57 +0200 (CEST)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRHLA-0004V6-Gs
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 13:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHI1-0002Sp-2j
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:04:41 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:44825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mRHHx-0005CC-PR
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 13:04:40 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id c28so10037791vsh.11
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhUltIfnb0l0LBt+3gK+dbpoFSk4IcQJF3ZaWspCJhY=;
 b=XRl01+ORBgIwtnROrbA4M8cxp/AU1I6gNPqv1PK4bV9CTdjRSY/7PeTvK8oVeWNx2N
 +H5TLXlzw/E/84BZ0VCvoUab4d43hkMmYW/4UQWqVAX1jIjLcfC8uhaU6Zi1HoSbH0g8
 a47UY5dfCYrhjniipivADtq986/8bGgt/CsPDP3/iDs1xfh5KVNZC1VZJU/q/db/6mHR
 utRxzlyPtToQsCJeGer0psJ9N0cBY6Gujlqh7i/WJIUNSEkknpV+AxLa45/sJyf2xH7k
 UwNCe+ugsnEcH/hkZbdMwa1P6DD0nLIUd2KiMgiz1Rhf6HsvslQp7xxlQfqtATUPCjAZ
 sVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhUltIfnb0l0LBt+3gK+dbpoFSk4IcQJF3ZaWspCJhY=;
 b=kAeQn29H1OAF8CjtvUGlv6q/kq3IcUxFkujBAPpfx9AQcLBXpYMmHFekxwesJ7weOC
 JOmEowUDwBzkpohev7XTo24DUhxDemf+MOS2HFaO4nV2mZ+Mxyo2mCrs9nBAcGsdB4gW
 LrWjA8LjAxhDuBMxnRHtj7BitI/HTxWFbr+ezFaC4sOpnckjzhvKREdrjm55IuQRsilU
 lMCR1LRu9ciKeF4gxYeku07c8wAfqesAkMKOjnpgnx6b9xkBhCikHOcIZQY4WXeiaKRA
 17AqIYSnTOqZpwTVDZQXkqc81yGXgMNZ+qwem63XVy6f+bCuXOZiNSacRE6fI3EW1gNc
 IKsQ==
X-Gm-Message-State: AOAM532JewlFK7pxX61LleEb+BcB9VYHMf5EOwR0hdE2x6x7hYYMIX2q
 jYtUndXW6JYDcUSlP+02QXEK25jAWmwBBAmDpTXBqg==
X-Google-Smtp-Source: ABdhPJweKuFj0VV2dOcvwVKkyf+LhKNOPb7IuAsgnQTvno0Zpmywdrhg/8LCh6PwtDT/S8QLIdEiXc3GvORCKSsDBcU=
X-Received: by 2002:a05:6102:1175:: with SMTP id
 k21mr9703222vsg.42.1631898276066; 
 Fri, 17 Sep 2021 10:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
 <20210917162332.3511179-2-alex.bennee@linaro.org>
In-Reply-To: <20210917162332.3511179-2-alex.bennee@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Sep 2021 11:04:25 -0600
Message-ID: <CANCZdfoJNeanSSUpYPSY1299pgJ=RMA_a66ynfzQ3oLua6S-gQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] configure: don't override the selected host test
 compiler if defined
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000000e084e05cc33edcd"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000e084e05cc33edcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:23 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

> There are not many cases you would want to do this but one is if you
> want to use a test friendly compiler like gcc instead of a system
> compiler like clang. Either way we should honour the users choice if
> they have made it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Warner Losh <imp@bsdimp.com>
> ---
>  configure | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/configure b/configure
> index 1043ccce4f..049c50a933 100755
> --- a/configure
> +++ b/configure
> @@ -1686,8 +1686,11 @@ case "$cpu" in
>      # No special flags required for other host CPUs
>  esac
>
> -eval "cross_cc_${cpu}=3D\$cc"
> -cross_cc_vars=3D"$cross_cc_vars cross_cc_${cpu}"
> +if eval test -z "\${cross_cc_$cpu}"; then
> +    eval "cross_cc_${cpu}=3D\$cc"
> +    cross_cc_vars=3D"$cross_cc_vars cross_cc_${cpu}"
> +fi
> +
>  QEMU_CFLAGS=3D"$CPU_CFLAGS $QEMU_CFLAGS"
>
>  # For user-mode emulation the host arch has to be one we explicitly
> --
> 2.30.2
>
>

--0000000000000e084e05cc33edcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:23 AM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">There are not many cases you would want to do this but one is if you<=
br>
want to use a test friendly compiler like gcc instead of a system<br>
compiler like clang. Either way we should honour the users choice if<br>
they have made it.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
Cc: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp=
@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0configure | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
diff --git a/configure b/configure<br>
index 1043ccce4f..049c50a933 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1686,8 +1686,11 @@ case &quot;$cpu&quot; in<br>
=C2=A0 =C2=A0 =C2=A0# No special flags required for other host CPUs<br>
=C2=A0esac<br>
<br>
-eval &quot;cross_cc_${cpu}=3D\$cc&quot;<br>
-cross_cc_vars=3D&quot;$cross_cc_vars cross_cc_${cpu}&quot;<br>
+if eval test -z &quot;\${cross_cc_$cpu}&quot;; then<br>
+=C2=A0 =C2=A0 eval &quot;cross_cc_${cpu}=3D\$cc&quot;<br>
+=C2=A0 =C2=A0 cross_cc_vars=3D&quot;$cross_cc_vars cross_cc_${cpu}&quot;<b=
r>
+fi<br>
+<br>
=C2=A0QEMU_CFLAGS=3D&quot;$CPU_CFLAGS $QEMU_CFLAGS&quot;<br>
<br>
=C2=A0# For user-mode emulation the host arch has to be one we explicitly<b=
r>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--0000000000000e084e05cc33edcd--

