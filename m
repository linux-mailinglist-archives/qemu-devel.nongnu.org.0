Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073CE69A1B8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 23:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnCJ-0008Ah-Ea; Thu, 16 Feb 2023 17:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSnCH-0008AA-DN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 17:57:49 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSnCF-0002bp-FM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 17:57:49 -0500
Received: by mail-ed1-x52c.google.com with SMTP id dn12so5326155edb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 14:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C5WiqgFvQhY1ER3kWJQvTJ6Hxg6hb4rji58hNnJKtLU=;
 b=pXGIPHdgiB/v4j0OOCGB+TSGOZ/85RPC/8/7kC0qHrcVBFfqSCFaIA1Ehu/A96/eyd
 0q3MRrY6PvsXeJNBrySZea+FFWuEYMhOar1981rpuxCd+f+y+7jXYKeK4awI3Y0mBWz4
 pi2gomEh2J6LxuF6s9D4e6QNMWp5BCx4qNUGD/hU2lLb8VCXeOGwLXFRZsx+nnniwC1w
 /gUUhGzJmGKBIUtkeTpWRmwwYY1XQKNTk9H7+6lcNErUwzBBIn7MUCpWCkNja7l9f3Ue
 GoXeiodYU25CZXLKNl9cn49kBfJ5dWz8TDpkEovHCFVmMtxXfC9kf2sbZVKF6A3cE98W
 Hu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C5WiqgFvQhY1ER3kWJQvTJ6Hxg6hb4rji58hNnJKtLU=;
 b=6nRUSMyJ8NPmfLjnijCR4E2ZQSvMJJyBWuGpw9VamdxyxwIMMIt7nlfEW2nMYeR6Uh
 cJf1iMRUj2EAnWNU9lsw02pRahdbuQxsOvlRsmlz4BfcKa+5OGJ0U52N01ZvgFg5KF1P
 8IIFepl2dkmfUk2126Rxa5usyXAcpYex7nW+5azIIv08xQiN1Xy3tUBHo/ZyIMtbN2y8
 NnrCVQCgFmIrAhAuIfYfJ+A4uT5onWgzhUvNiRtREIC3JSD5cdNSY6ANBSQ+anr/SWtg
 jFHe17pA1kylVR2VEXOrlG/lP3bfJgyl7RsyhKi/aDYrGf9VkDwG4LFzLfnY47k1SyCq
 5Aow==
X-Gm-Message-State: AO0yUKVuaTQS+dgJsboT5IyJoYdoDEn3weWho2gKoSpG/Cs2eDwRZFMU
 XQIPmHdqseatjDBOcbfc+h5rfhlXH09IJoNX36la9g==
X-Google-Smtp-Source: AK7set8OYQcVAwVPHyIpiZ/aOW7Fx8MPjyzORNorpDZzblPaZ24y0jXqDRRlVnFM/pWMES0N1PKOYMomE7NqaAeOJd4=
X-Received: by 2002:a17:906:4e4d:b0:8b1:3298:c587 with SMTP id
 g13-20020a1709064e4d00b008b13298c587mr3662226ejw.2.1676588265115; Thu, 16 Feb
 2023 14:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-10-imp@bsdimp.com>
 <9ad1f69e-f3ab-bced-1299-525c156dbcb3@linaro.org>
In-Reply-To: <9ad1f69e-f3ab-bced-1299-525c156dbcb3@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 16 Feb 2023 15:57:34 -0700
Message-ID: <CANCZdfr+vuFizE=k+fNOdSb-5MM92ysoiJ9mnES-NRgpAnLVSw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] bsd-user: Start translation of arch-specific
 sysctls
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org, 
 Thomas Huth <thuth@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000fa238505f4d91fba"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
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

--000000000000fa238505f4d91fba
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 2:36 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/13/23 14:27, Warner Losh wrote:
> > +        case HW_NCPU:
> > +            if (oldlen) {
> > +                (*(int32_t *)holdp) = tswap32(bsd_get_ncpu());
> > +            }
> > +            holdlen = sizeof(int32_t);
> > +            ret = 0;
> > +            goto out;
>
> Anything using SYSCTL_INT should use abi_int.
>
> > +#if defined(TARGET_ARM)
> > +        case HW_FLOATINGPT:
> > +            if (oldlen) {
> > +                ARMCPU *cpu = env_archcpu(env);
> > +                *(abi_int *)holdp = cpu_isar_feature(aa32_vfp, cpu);
> > +            }
> > +            holdlen = sizeof(int32_t);
>
> abi_int for consistency.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Makes sense.. Thanks!

Warner

--000000000000fa238505f4d91fba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 2:36 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/13/23 14:27, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_NCPU:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*(int32_t *)=
holdp) =3D tswap32(bsd_get_ncpu());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 holdlen =3D sizeof(int32_t)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
<br>
Anything using SYSCTL_INT should use abi_int.<br>
<br>
&gt; +#if defined(TARGET_ARM)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_FLOATINGPT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARMCPU *cpu =
=3D env_archcpu(env);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(abi_int *)h=
oldp =3D cpu_isar_feature(aa32_vfp, cpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 holdlen =3D sizeof(int32_t)=
;<br>
<br>
abi_int for consistency.<br>
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Makes sense.. Thanks!</div><div><br></div><div>Warn=
er</div></div></div>

--000000000000fa238505f4d91fba--

