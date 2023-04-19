Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDA6E765E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp4CX-0005fk-U3; Wed, 19 Apr 2023 05:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pp4CR-0005fI-Vd
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:34:04 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pp4CO-0007UT-LK
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:34:03 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94f7a0818aeso182117766b.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 02:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1681896838; x=1684488838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QfHgSiR/CsxChE6M5DctIryHmM7eI0Ww2WmugepwD7E=;
 b=f0r+V13YGi47u/JvUSE/+AsKmM2lyqut+27kgljnWXB+ImlblC4E8QY3lmzWJTaMYf
 axYbtUAIQ/mwbGCIMoKbL0++OPrzXXCBBtoaVDF6sHbr4jlU254e/gASipxCiwiBY+91
 Zk9b9fHK5cukRv9AuiGQDNGQQA7v82S7AHWSCcQry/k2pRpoo6g+kXH1xZ8qqquCUetG
 tt78OgOV6G+Be0db/1XWCIzF+LCASX8GaYIwNhv3dPmAeWl1yi178s2nK3G/CveCO0DQ
 Mhs9CqeZNleJkwu3tuHJPMLLDur2W/vU3ypy7OMYB3+Ragv1dkk198PzZOpwZ7fy1Vhh
 8upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681896838; x=1684488838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QfHgSiR/CsxChE6M5DctIryHmM7eI0Ww2WmugepwD7E=;
 b=VCE8FvDLMG2aI2OPC2rMn7i7QvAktNstUe0l57m61T5UOf4CoK5NMjXh9wdlbTO2xy
 A1cV0swVWP9VotQq+EdsEUBYcGa2xoHBimLYlUjfVJ42PkUsmIwpuSybZ6B6Brv9V7ae
 PObjjuyhfuIv0b3PdxHHso2zY7Ov3cEfrqGkSciJRsUd0dwJNoePIdAXGKsu16lUdBrF
 YGE44v5UUYD7vRRiwSej/XXxB10vrNeWAiWi4dNtP/lB7uTItACih+opxOFM4n/grcQc
 +aNp59PIGqeeMPz2fiCKx00v+TVuYnaGfw17vDwlxcWzn1SpaW7lwfiWFtQ6QcPixGIf
 Lcvw==
X-Gm-Message-State: AAQBX9dgbIFrZ2xQzAZ25DIPQLS1TD9EJNiyMwmlM8OPHr/5VshEQpM3
 04bheXoPl/mJ+ovTB2oH2v4jI0Vj51d70+zXCp+vQQ==
X-Google-Smtp-Source: AKy350Y0UkHnvwf91i0FLOyAnkEPFtUI+WCBS4tpWKPBD7q0VNjjcn/MKr7gG+HhFkRKJMnwM4b5CTlUKSVSfEHZvbQ=
X-Received: by 2002:aa7:d153:0:b0:506:a44c:47e3 with SMTP id
 r19-20020aa7d153000000b00506a44c47e3mr5146704edo.16.1681896838203; Wed, 19
 Apr 2023 02:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230418160225.529172-1-thuth@redhat.com>
 <CANCZdfpzw10B_cyV0mmbkE94GKTBVJg6BVZ2csjcMCur07nseg@mail.gmail.com>
 <4b9d16e8-a2cb-1c78-7d4a-cdb10adcd522@redhat.com>
In-Reply-To: <4b9d16e8-a2cb-1c78-7d4a-cdb10adcd522@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 19 Apr 2023 03:33:47 -0600
Message-ID: <CANCZdfoL7ksbOsNJJujf_=ZXbzLdSXviFqhNdcZ3DrYhkN6trg@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000971d8405f9ad1f5e"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000971d8405f9ad1f5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023, 12:23 AM Thomas Huth <thuth@redhat.com> wrote:

> On 18/04/2023 21.46, Warner Losh wrote:
> >
> >
> > On Tue, Apr 18, 2023 at 10:02=E2=80=AFAM Thomas Huth <thuth@redhat.com
> > <mailto:thuth@redhat.com>> wrote:
> >
> >     FreeBSD 13.0 has been released in April 2021:
> >
> >     https://www.freebsd.org/releases/13.0R/announce/
> >     <https://www.freebsd.org/releases/13.0R/announce/>
> >
> >     According to QEMU's support policy, we stop supporting the previous
> >     major release two years after the the new major release has been
> >     published. So we can stop testing FreeBSD 12 in our CI now.
> >
> >
> > 13.2 was just released this week, and the FreeBSD project will be
> > dropping support for 12 by the end of the year. 14.0 is up in late
> > string / early summer.
> >
> >     Signed-off-by: Thomas Huth <thuth@redhat.com <mailto:
> thuth@redhat.com>>
> >
> >
> > Reviewed-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> >
> >     ---
> >       We should likely also update tests/vm/freebsd ... however, FreeBS=
D
> 13
> >       seems not to use the serial console by default anymore, so I've g=
ot
> >       no clue how we could use their images now... Does anybody have an=
y
> >       suggestions?
> >
> >
> > I should look at this... It should still be using serial console by
> default...
>
> I did some more tests ... looks like both
> FreeBSD-13.2-RELEASE-amd64-disc1.iso and FreeBSD-13.2-RELEASE-amd64.qcow2
> have serial (and ssh) disabled by default - but there is a
> FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw image now that has the serial
> console (and ssh) enabled by default, so I think we could use that one fo=
r
> our CI tests.
>

I'm surprised a little by this state and will see why and see if that can't
be fixed for 14.0.

Warner

  Thomas
>
>

--000000000000971d8405f9ad1f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Apr 19, 2023, 12:23 AM Thomas Huth &lt;<a href=
=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 18/04/2023 21.46, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Tue, Apr 18, 2023 at 10:02=E2=80=AFAM Thomas Huth &lt;<a href=3D"ma=
ilto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.co=
m</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank" rel=
=3D"noreferrer">thuth@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0FreeBSD 13.0 has been released in April 2021:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.freebsd.org/releases/13.0R/a=
nnounce/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.freeb=
sd.org/releases/13.0R/announce/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.freebsd.org/releases/13.=
0R/announce/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.f=
reebsd.org/releases/13.0R/announce/</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0According to QEMU&#39;s support policy, we stop sup=
porting the previous<br>
&gt;=C2=A0 =C2=A0 =C2=A0major release two years after the the new major rel=
ease has been<br>
&gt;=C2=A0 =C2=A0 =C2=A0published. So we can stop testing FreeBSD 12 in our=
 CI now.<br>
&gt; <br>
&gt; <br>
&gt; 13.2 was just released=C2=A0this week, and the FreeBSD project will be=
<br>
&gt; dropping support for 12 by the end of the year. 14.0 is up in late<br>
&gt; string / early summer.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:th=
uth@redhat.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a> &=
lt;mailto:<a href=3D"mailto:thuth@redhat.com" target=3D"_blank" rel=3D"nore=
ferrer">thuth@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank" rel=3D"noreferrer">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mai=
lto:imp@bsdimp.com" target=3D"_blank" rel=3D"noreferrer">imp@bsdimp.com</a>=
&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0We should likely also update tests/vm/freebs=
d ... however, FreeBSD 13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seems not to use the serial console by defau=
lt anymore, so I&#39;ve got<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0no clue how we could use their images now...=
 Does anybody have any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0suggestions?<br>
&gt; <br>
&gt; <br>
&gt; I should look at this... It should still be using serial console by de=
fault...<br>
<br>
I did some more tests ... looks like both <br>
FreeBSD-13.2-RELEASE-amd64-disc1.iso and FreeBSD-13.2-RELEASE-amd64.qcow2 <=
br>
have serial (and ssh) disabled by default - but there is a <br>
FreeBSD-13.2-RELEASE-amd64-BASIC-CI.raw image now that has the serial <br>
console (and ssh) enabled by default, so I think we could use that one for =
<br>
our CI tests.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I&#39;m surprised a little by this state and will see why and =
see if that can&#39;t be fixed for 14.0.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Warner=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--000000000000971d8405f9ad1f5e--

