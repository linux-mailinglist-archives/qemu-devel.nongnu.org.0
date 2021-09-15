Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7936B40CA0B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:25:03 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXiY-000655-2G
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQXhR-0005PJ-88
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:23:53 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQXhF-0006y2-5w
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:23:52 -0400
Received: by mail-ua1-x92f.google.com with SMTP id o13so2019373uat.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbzcdoftF7Ul8IWJWZdB/RitIQJmq+0Osxe4akvOue8=;
 b=OBzOm9CvcJbNQRRSzaY8l7kLKEL06YP3Oq/OvAABu/K3y5j9z9fPhMQMszVO7PoQum
 AhqU7+obTq6iFrY3682ExtVYa6yUc6hDqHT71Tqodo0rM1Q+/Oi2C8hFusawgHc/3w+s
 d88D8wZxQUY2+7uAYQQ+6fEY4kjgiSJWplb6nQBJW3BIrmIMYxBPMgXCFRruo5WTsCR3
 M5e6ICOApv/4qKDw0n3B50NHxK3otD3Mvn7Axn0h00o4x5Qgo4dzfVh+a7Sx2U8a2I/c
 G2/N+2do9BcxR2hg/3Vrd1ad9Ww67yFPK7eJr+5F3qMXyiaU1TvyS1yaSJtj41H8u9eh
 IkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbzcdoftF7Ul8IWJWZdB/RitIQJmq+0Osxe4akvOue8=;
 b=NGjkIkFKzxYTde6q5KeM0sLy/NRzdlPVIWA75mVuDcgSlWgdWt9v4neFYioKJDHJrp
 DcGzBIwTwt4ZNpLOTTIM5EN7Feu8orm3akrbi1TSxBiggU8xvE+MDFiJcsXdwmWaEWGW
 fNyYavKCo3S0fIY5Vid54xgeQTP5HYCxFOAruH9czOUb/RDquV4b4YOgyOBMSq6oyTe4
 3EuXsynFJD5FcCDYTvfNMy9E6+GX59Vskecw31bmyUcBhm4bid/oJ1SOIGiBGMfPGh5B
 tM5mVKyQpeJG3IvN9Bxes/tj1Hvmd/0ODKjEeV1pWLupM3sJXVS00xg4eN3sbxCtNXxw
 llaQ==
X-Gm-Message-State: AOAM533/fzkGCXXLO4gVNC8K0HyJmeYBZ1kklSbYuwcFJGNrMaVy3uRk
 UPUPwsq7O5mDLjsbXWzDYT+P0XpeAWXz4BxYsUutkg==
X-Google-Smtp-Source: ABdhPJyw8+nrvgRoFYVHWoGHvk0bhUJfvlUJICho3D5beVZx03wK5d5Hc3NbxG5YJdmwIsc8rTxJ0i+yb5yLf9OAe+o=
X-Received: by 2002:ab0:5fc7:: with SMTP id g7mr721747uaj.85.1631723019634;
 Wed, 15 Sep 2021 09:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-7-richard.henderson@linaro.org>
In-Reply-To: <20210913220552.604064-7-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 15 Sep 2021 10:23:28 -0600
Message-ID: <CANCZdfqkPHY_peP=NRazH9aa4T6SkWnvH0MG2Lemcj9iVz51zg@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] linux-user: Handle SIGSEGV/SIGBUS in
 host_to_target_siginfo_noswap
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f5211f05cc0b1ed4"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5211f05cc0b1ed4
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 4:05 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Remap the faulting address from the host address space into
> the guest address space.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/signal.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

If I'm understanding this right, the FreeBSD code in the bsd-user fork
won't be affected by this change.
(or conversely, it's so far behind the linux stuff that it will need to be
completely
revamped).

Warner


> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index a8faea6f09..73c0f9066b 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -405,6 +405,15 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>              tinfo->_sifields._sigpoll._fd = info->si_fd;
>              si_type = QEMU_SI_POLL;
>              break;
> +        case TARGET_SIGSEGV:
> +        case TARGET_SIGBUS:
> +            /*
> +             * Remap the host address into the target space.
> +             * Even an invalid guest address is still valid for a fault.
> +             */
> +            tinfo->_sifields._sigfault._addr = h2g_nocheck(info->si_addr);
> +            si_type = QEMU_SI_FAULT;
> +            break;
>          default:
>              /* Assume a sigqueue()/mq_notify()/rt_sigqueueinfo() source.
> */
>              tinfo->_sifields._rt._pid = info->si_pid;
> --
> 2.25.1
>
>

--000000000000f5211f05cc0b1ed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 4:05 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Remap the faulting address from the host address space in=
to<br>
the guest address space.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/signal.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br></blockquote><div><br></div><div>R=
eviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.co=
m</a>&gt;</div><div><br></div><div>If I&#39;m understanding this right, the=
 FreeBSD code in the bsd-user fork won&#39;t be affected by this change.</d=
iv><div>(or conversely, it&#39;s so far behind the linux stuff that it will=
 need to be completely</div><div>revamped).</div><div><br></div><div>Warner=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index a8faea6f09..73c0f9066b 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -405,6 +405,15 @@ static inline void host_to_target_siginfo_noswap(targe=
t_siginfo_t *tinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfo-&gt;_sifields._sigpol=
l._fd =3D info-&gt;si_fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_type =3D QEMU_SI_POLL;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SIGSEGV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SIGBUS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Remap the host address i=
nto the target space.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Even an invalid guest ad=
dress is still valid for a fault.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_sifields._sigfault._a=
ddr =3D h2g_nocheck(info-&gt;si_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_type =3D QEMU_SI_FAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assume a sigqueue()/mq_n=
otify()/rt_sigqueueinfo() source. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfo-&gt;_sifields._rt._pi=
d =3D info-&gt;si_pid;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000f5211f05cc0b1ed4--

