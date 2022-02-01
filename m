Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C24A69DC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:14:53 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5AV-0000SG-Do
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:14:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0DK-0007Hq-MD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:57:23 -0500
Received: from [2607:f8b0:4864:20::92c] (port=42649
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF0DI-0006iI-Ht
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:57:22 -0500
Received: by mail-ua1-x92c.google.com with SMTP id e17so15441391uad.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kUbP8Oq7luBxAbSFJ7hQdpByJ3uqfJJMSdl3s2uHog=;
 b=4rujRKr23Fg+9cgIpRGLHBDEcuTym6wdxFfoD48E+BhVg70Ma57z4cyFEv8RGa1GpR
 J4bWqafYwlrFSJWoTpObzM+boFTYibnUETJazpeowyYFl4yGSF//Fuv/9QTeHqga+HFt
 2okdmXb+AQ+iPoByGBC6B89VcE8ADAXvdYCbDfwe3Q9gcw9I2mMBUHhdL9cAuPfag726
 0jfneTFvF0/DHTXD/JQKqnLYO7HR910lqBjZWxGAvqxgV2mHCvTrMQ6WuorPgXX3SrtS
 0eQe8XaUnwaMgVEKxWr+mneOPyOCtKAveZnzIUsHBEJACB29BUfEsYH5t5QaCCNrVb1n
 85XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kUbP8Oq7luBxAbSFJ7hQdpByJ3uqfJJMSdl3s2uHog=;
 b=pFcz3d+pOJoXx/7TpCVsVaD23FqHY61736t6pzn9yYvW4g14/g0IKLfkOOWCa2wDFo
 7wWrboAs5EvqNSqvF6dsWKwSrQAMud4nXWHY4F1+R3czBkSzxS1jXFESszrgj0iptmWL
 AJJTQVDyNe+9+4D8BbCQkyoxHVvgWrLGBF4x9vNyb5Q6f0dzw7UPPZ8R0aBpxs5bx1Qi
 HviKIUITXVMxIteNx/ItPU12YXawKeBey9wIcV8khIuexRapCFrkyq/ZxlpDGbVfYCwg
 DPcGADqmmoyszM6MJDVzj25MS2zr50Z0IXq3/TUQjHQ4j69G7ZzEQT5cDJjljiwC/J1D
 dP0w==
X-Gm-Message-State: AOAM5335HMdTueDIpPBjx3i0Wr5Xd2i5ChDhp8eDbJkEpbk+XLuyleBo
 kuDW0AkBmjXDQNRYvqZv8zysWKYsbhGZjmco0ppHLnzxZcg=
X-Google-Smtp-Source: ABdhPJzD5hC4CcSNzNJgwFYTItp2V1hovH2xeKsT+B4SGOkH/v1lwzXflkymY+jaQTeqkQ7Bc5K2gRCAI9eIe2PwQv0=
X-Received: by 2002:a67:fac3:: with SMTP id g3mr11639134vsq.6.1643749038805;
 Tue, 01 Feb 2022 12:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20220201205251.57691-1-imp@bsdimp.com>
In-Reply-To: <20220201205251.57691-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 13:57:07 -0700
Message-ID: <CANCZdfpjUSdZ0aZKOxtg4_96XtS81tfaDcEe4FDO89t8-oofRw@mail.gmail.com>
Subject: Re: [PATCH] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008ee6c805d6fb259d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008ee6c805d6fb259d
Content-Type: text/plain; charset="UTF-8"

This fixes a build regression. The _capsicum member was added on -current
recently, and isn't in FreeBSD 12 or 13. This fixes the build regression
there.

My apologies...

Warner

On Tue, Feb 1, 2022 at 1:52 PM Warner Losh <imp@bsdimp.com> wrote:

> The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
> copy them on a new enough system.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/signal.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ad22ba9d90d..b43266e6e06 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -242,8 +242,10 @@ static inline void
> host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>           * one, then we know what to save.
>           */
>          if (sig == TARGET_SIGTRAP) {
> +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
>              tinfo->_reason._capsicum._syscall =
>                  info->_reason._capsicum._syscall;
> +#endif
>              si_type = QEMU_SI_CAPSICUM;
>          }
>          break;
> @@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo,
> const target_siginfo_t *info)
>          __put_user(info->_reason._poll._band,
> &tinfo->_reason._poll._band);
>          break;
>      case QEMU_SI_CAPSICUM:
> +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
>          __put_user(info->_reason._capsicum._syscall,
>                     &tinfo->_reason._capsicum._syscall);
> +#endif
>          break;
>      default:
>          g_assert_not_reached();
> --
> 2.33.1
>
>

--0000000000008ee6c805d6fb259d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fixes a build regression. The _capsicum member was ad=
ded on -current recently, and isn&#39;t in FreeBSD 12 or 13. This fixes the=
 build regression there.<div><br></div><div>My apologies...</div><div><br><=
/div><div>Warner</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Feb 1, 2022 at 1:52 PM Warner Losh &lt;<a hre=
f=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">The capsicum signal stuff is new =
with FreeBSD 14, rev 1400026, so only<br>
copy them on a new enough system.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/signal.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
index ad22ba9d90d..b43266e6e06 100644<br>
--- a/bsd-user/signal.c<br>
+++ b/bsd-user/signal.c<br>
@@ -242,8 +242,10 @@ static inline void host_to_target_siginfo_noswap(targe=
t_siginfo_t *tinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * one, then we know what to save.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sig =3D=3D TARGET_SIGTRAP) {<br>
+#if defined(__FreeBSD_version) &amp;&amp; __FreeBSD_version &gt;=3D 140002=
6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tinfo-&gt;_reason._capsicum=
._syscall =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;_rea=
son._capsicum._syscall;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_type =3D QEMU_SI_CAPSICU=
M;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo, con=
st target_siginfo_t *info)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user(info-&gt;_reason._poll._band, =
&amp;tinfo-&gt;_reason._poll._band);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case QEMU_SI_CAPSICUM:<br>
+#if defined(__FreeBSD_version) &amp;&amp; __FreeBSD_version &gt;=3D 140002=
6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__put_user(info-&gt;_reason._capsicum._sy=
scall,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;=
tinfo-&gt;_reason._capsicum._syscall);<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
-- <br>
2.33.1<br>
<br>
</blockquote></div>

--0000000000008ee6c805d6fb259d--

