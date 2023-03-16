Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD646BCA9A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:19:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjk5-0000rP-RC; Thu, 16 Mar 2023 05:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcjjx-0000qu-Dl; Thu, 16 Mar 2023 05:17:41 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcjjv-0000at-4R; Thu, 16 Mar 2023 05:17:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so954004pjb.0; 
 Thu, 16 Mar 2023 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678958257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7wEQshZ99ikoqzHJDMK332OZvYbj1NQq6ZMFa9HgwYE=;
 b=IJmauUwuhbAGWjUyr02uUZp2L0z6XKtAqIbm/dLJA0wUGQpbrgWS6LF60hFQOQalSI
 TNrUyKS+6Y/hbbedsvGvjnfY2XcAtfThUWrW1J1oJ/0U8uC/2ap9AFSFzkRDK3vIu+m3
 Z4qUGtR+Fyc1OHnP0IuTvCmGZNPaSOPARfhl/cvYibCLIxFbj6ZJ7VyAqpu9cYZeubHM
 fqHL8rnpwo4ltDKT/9VKDBE9u0UvVAU2DBi8ccOuR3z1BwOyDj7A6rsaeUcKXU5oebEh
 lEdBxNXcObAhc6nCFplS8LjffErl4wZ6mBnOprCyehc/F80ffL3jtZW6315dYOY7wsrr
 +TzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678958257;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wEQshZ99ikoqzHJDMK332OZvYbj1NQq6ZMFa9HgwYE=;
 b=gv9Mu96nuEkMRnIT1PmEl15MKE97CjT45+m5i+UVbxye9shx5s5VRus8x/WZZPsiPS
 GCwiFJmFWvestzsny1B+slUkZ6GdDTMW50lAHLcvqUC8ZjMQ36B35hSu4Kgcoh9qq+uX
 aZb3q6bmi/Dp55a07P/IBDfMmqOVG9QUGP1dp21n3dkAa0zn/G38dG2Ct+Cs63ynrp56
 VWxHILmmRrX+y74piS4KU1NNdLw9VBdnnRtharM6LSiR8/uMNvDDqcC2ZAwSG1oec0aa
 rmh4iU3IJvoBv0KebcrlJa2ppXuc6GCnp3D/JPAovpmTYg6rDh663XeJLgybo2hveNSS
 goIQ==
X-Gm-Message-State: AO0yUKU5AfjC0ufWD3kX/LjG6GHbzaXpROkaqhyULSGoQCMAe2x91YVu
 NGFRwBRRdGkv/2c7JGsvqYFtGcDFO75cnRbzQTM=
X-Google-Smtp-Source: AK7set+HH6K+GOe94t2AFBBGG9jWt+LiLHLud83BwmYILO1KCqJ3CtDXIO9YLRNxJii8Sz0NQJX31IGpJLBsbCZWZ2Q=
X-Received: by 2002:a17:903:1c2:b0:1a0:7630:8ef8 with SMTP id
 e2-20020a17090301c200b001a076308ef8mr1153243plh.2.1678958257190; Thu, 16 Mar
 2023 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
In-Reply-To: <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 12:17:24 +0300
Message-ID: <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000833b2805f700eee7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=randrianasulu@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000833b2805f700eee7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas Huth <thuth=
@redhat.com>:

> On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 16/3/23 08:17, Andrew Randrianasulu wrote:
> >>
> >> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Math=
ieu-Daud=C3=A9 <philmd@linaro.org
> >> <mailto:philmd@linaro.org>>:
> >>
> >>     Hi Andrew,
> >>
> >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
> >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
> >>     <https://wiki.qemu.org/ChangeLog/8.0>
> >>      > <https://wiki.qemu.org/ChangeLog/8.0
> >>     <https://wiki.qemu.org/ChangeLog/8.0>>
> >>      >
> >>      > =3D=3D=3D
> >>      > System emulation on 32-bit x86 and ARM hosts has been deprecate=
d.
> >>     The
> >>      > QEMU project no longer considers 32-bit x86 and ARM support for
> >>     system
> >>      > emulation to be an effective use of its limited resources, and
> thus
> >>      > intends to discontinue.
> >>      >
> >>      >   =3D=3D
> >>      >
> >>      > well, I guess arguing from memory-consuption point on 32 bit x8=
6
> >>     hosts
> >>      > (like my machine where I run 32 bit userspace on 64 bit kernel)
>
> All current PCs have multiple gigabytes of RAM, so using a 32-bit
> userspace
> to save some few bytes sounds weird.
>

I think difference more like in 20-30% (on disk and in ram), not *few
bytes*. Also, this whole "my program is only one running on user's
machine"  is flawed.



> (and in case you're talking about a very old PC that cannot be extened
> anymore, you're likely better off with an older version of QEMU anyway)
>
> >>
> >>     If you use a 64-bit kernel, then your host is 64-bit :)
> >>
> >>
> >>
> >> No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit=
.
> >> So, qemu naturally will be 32-bit binary on my system.
> >
> > This configuration is still supported!
> >
> > Thomas, should we clarify yet again? Maybe adding examples?
>
> There are two aspects here:
>
> 1) 32-bit KVM support - this won't be supported in the future anymore.
> Since
> running a 32-bit QEMU on a 64-bit kernel still uses the 32-bit KVM API,
> KVM
> also won't be possible anymore with a QEMU that has been compiled in
> 32-bit
> mode.
>
> 2) Compiling a 32-bit QEMU binary won't be officially supported anymore.
> We
> won't waste any more precious CI minutes on this (which is where we're
> struggling the most currently), and likely no active support for finding
> and
> fixing bugs.


Well, does this CI thing reuse build objects (even indirectly, via ccache)
currently?


But I guess we won't actively disable this possibility
> (especially since we did not deprecate the corresponding 32-bit linux-use=
r
> emulation yet, so the emulation code will mostly still stay around).
>
> In the long run, we likely want to get rid of the separate compilation of
> the qemu-system-i386 binary, too, but that's still to be discussed. E.g.
> we
> could add a special run mode to the qemu-system-x86_64 instead that makes
> sure that the guest can only run in 32-bit mode.
>
> >>     host: hardware where you run QEMU
> >>     guest: what is run within QEMU
> >>
> >>     Running 32-bit *guest* on your 64-bit *host* is still supported.
>
> If the complete userspace is 32-bit, I'd rather consider it a 32-bit host=
.
>
> >> [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Android,
> >> too) for emulating old mac os 9. Yes, I can wait 10 min per guest boot=
.
> >> Fedora 36 armhf boots even slower on emulation!
>
> Yes, but for such scenarios, you can also use older versions of QEMU, you
> don't need the latest and greatest shiny QEMU version.
>
> >> Well, sometimes simple patch restores functionality. I patched for
> example
> >> olive-editor to run on 32 bit, and before this intel embree (raytracin=
g
> >> kernels for Lux renderer). So, _sometimes_ it really not that costly.
> >> While if this CI thing really runs per-commit and thrown away each
> result
> >> ... may be letting interested users to build things on their own
> machines
> >> (and share patches, if they develop them, publicly) actually good idea=
.
>
> The problem is really that we don't have unlimited resources in the QEMU
> project. Currently we're heavily struggling with the load in the CI, but
> also pure man power is always very scarce. So at one point in time, you
> have
> to decide to say good bye to some old and hardly used features - at least
> to
> stop testing and actively supporting it. If you want to continue testing
> and
> fixing bugs for such host systems, that's fine, of course, but don't
> expect
> the QEMU developers to do that job in the future.
>
>   Thomas
>
>

--000000000000833b2805f700eee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:=
31 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On 16/03/2023 08.36, Philippe=
 Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 16/3/23 08:17, Andrew Randrianasulu wrote:<br>
&gt;&gt;<br>
&gt;&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blan=
k" rel=3D"noreferrer">philmd@linaro.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" =
rel=3D"noreferrer">philmd@linaro.org</a>&gt;&gt;:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Andrew,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 On 16/3/23 01:57, Andrew Randrianasulu wrote:<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Looking at <a href=3D"https://wiki.q=
emu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/=
8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/=
ChangeLog/8.0</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; &lt;<a href=3D"https://wiki.qemu.org=
/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wik=
i.qemu.org/ChangeLog/8.0</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/=
8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/=
ChangeLog/8.0</a>&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; =3D=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; System emulation on 32-bit x86 and A=
RM hosts has been deprecated.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 The<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; QEMU project no longer considers 32-=
bit x86 and ARM support for<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 system<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; emulation to be an effective use of =
its limited resources, and thus<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; intends to discontinue.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;=C2=A0 =C2=A0=3D=3D<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; well, I guess arguing from memory-co=
nsuption point on 32 bit x86<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 hosts<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; (like my machine where I run 32 bit =
userspace on 64 bit kernel)<br>
<br>
All current PCs have multiple gigabytes of RAM, so using a 32-bit userspace=
 <br>
to save some few bytes sounds weird.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think difference more like in 20-30=
% (on disk and in ram), not *few bytes*. Also, this whole &quot;my program =
is only one running on user&#39;s machine&quot;=C2=A0 is flawed.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
(and in case you&#39;re talking about a very old PC that cannot be extened =
<br>
anymore, you&#39;re likely better off with an older version of QEMU anyway)=
<br>
<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 If you use a 64-bit kernel, then your host is 6=
4-bit :)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 3=
2bit. <br>
&gt;&gt; So, qemu naturally will be 32-bit binary on my system.<br>
&gt; <br>
&gt; This configuration is still supported!<br>
&gt; <br>
&gt; Thomas, should we clarify yet again? Maybe adding examples?<br>
<br>
There are two aspects here:<br>
<br>
1) 32-bit KVM support - this won&#39;t be supported in the future anymore. =
Since <br>
running a 32-bit QEMU on a 64-bit kernel still uses the 32-bit KVM API, KVM=
 <br>
also won&#39;t be possible anymore with a QEMU that has been compiled in 32=
-bit <br>
mode.<br>
<br>
2) Compiling a 32-bit QEMU binary won&#39;t be officially supported anymore=
. We <br>
won&#39;t waste any more precious CI minutes on this (which is where we&#39=
;re <br>
struggling the most currently), and likely no active support for finding an=
d <br>
fixing bugs. </blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Well, does this CI thing reuse build objects (even indirectly, vi=
a ccache) currently?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">But I guess we won&#39;t actively disable this possibility <b=
r>
(especially since we did not deprecate the corresponding 32-bit linux-user =
<br>
emulation yet, so the emulation code will mostly still stay around).<br>
<br>
In the long run, we likely want to get rid of the separate compilation of <=
br>
the qemu-system-i386 binary, too, but that&#39;s still to be discussed. E.g=
. we <br>
could add a special run mode to the qemu-system-x86_64 instead that makes <=
br>
sure that the guest can only run in 32-bit mode.<br>
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 host: hardware where you run QEMU<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 guest: what is run within QEMU<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Running 32-bit *guest* on your 64-bit *host* is=
 still supported.<br>
<br>
If the complete userspace is 32-bit, I&#39;d rather consider it a 32-bit ho=
st.<br>
<br>
&gt;&gt; [...] I also ran qemu-system-ppc on Huawei Matepad T8 (32 bit Andr=
oid, <br>
&gt;&gt; too) for emulating old mac os 9. Yes, I can wait 10 min per guest =
boot. <br>
&gt;&gt; Fedora 36 armhf boots even slower on emulation!<br>
<br>
Yes, but for such scenarios, you can also use older versions of QEMU, you <=
br>
don&#39;t need the latest and greatest shiny QEMU version.<br>
<br>
&gt;&gt; Well, sometimes simple patch restores functionality. I patched for=
 example <br>
&gt;&gt; olive-editor to run on 32 bit, and before this intel embree (raytr=
acing <br>
&gt;&gt; kernels for Lux renderer). So, _sometimes_ it really not that cost=
ly. <br>
&gt;&gt; While if this CI thing really runs per-commit and thrown away each=
 result <br>
&gt;&gt; ... may be letting interested users to build things on their own m=
achines <br>
&gt;&gt; (and share patches, if they develop them, publicly) actually good =
idea.<br>
<br>
The problem is really that we don&#39;t have unlimited resources in the QEM=
U <br>
project. Currently we&#39;re heavily struggling with the load in the CI, bu=
t <br>
also pure man power is always very scarce. So at one point in time, you hav=
e <br>
to decide to say good bye to some old and hardly used features - at least t=
o <br>
stop testing and actively supporting it. If you want to continue testing an=
d <br>
fixing bugs for such host systems, that&#39;s fine, of course, but don&#39;=
t expect <br>
the QEMU developers to do that job in the future.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--000000000000833b2805f700eee7--

