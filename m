Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB9F6922E2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:02:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVqM-0005gR-0N; Fri, 10 Feb 2023 11:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVqE-0005fU-SW
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQVqD-0001ii-5o
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676044896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38BEHx6hNHMfsKewiIfSZs7i86UloC5/pij1MGmR1Ws=;
 b=MacAsJDrmIQovPNdu0uT+wbDYuxfTjJhkG20easd2R1RKMEUSeYzRcvJQ4BGvhQwZFLMTI
 Hp/fv3Rrh6OzSQpyW/sMzFWNl0vrUXNjpzLNAxyaH/6gPZh6RNbJmBZbZFnp9vfqN1DuD4
 WiQQ0YIIGpJsgvPrUNO8rczmc2+GOdM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-Cbw9f4yGMfm1E67eNilgvw-1; Fri, 10 Feb 2023 11:01:31 -0500
X-MC-Unique: Cbw9f4yGMfm1E67eNilgvw-1
Received: by mail-pf1-f200.google.com with SMTP id
 x21-20020a056a000bd500b005a84de949aeso2860939pfu.18
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38BEHx6hNHMfsKewiIfSZs7i86UloC5/pij1MGmR1Ws=;
 b=Ri36GclBf/QtMAwqAqOJq+Tqsk+DZTB5Y4ni+PNJhyo+46Z1jOq5Q5v/HlxC6b+4Kg
 Np1vGGgWAR1Cf0hh1RpVjMTdVbj4bbbEY6/y5h15N5GN72NhHEn454bGk2hCedRkivXf
 gCZvtRZnLn6JQD8Fjh0uRI8WQfPZD4jwV8DubiRY4MqlUtCIFgQIiGbpMZL+F3moumdh
 qoVFI7IKSEvU+H7H030BiCCM8IHjGwLPGJSJryg8FLNM2vraTr9t5SLLVIbWACqQoBIz
 ECutnXp3AABsXjURg6p3TZts/xtqw+rMi18Tk8bORPDLX2M7WMHC7qZVOpgvmgGxDPlB
 IQKg==
X-Gm-Message-State: AO0yUKWZ8v3ODgEC3DB/Wl4iA58CG109QYVTpdrz2ORIIAMPmu9Hiy/c
 8HsNKH2AI9O+c8EQPd3EPkNm+c+n6iY0H8koFlTcWNDfUkTp7JWqkp4n4+LEGwVPA0AS8jjncsX
 Eq9opN4aIgkBXemJ/GoMS9Czn67maqOs=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr3543591plr.29.1676044890156; 
 Fri, 10 Feb 2023 08:01:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/J3QTr5CPRITDpa3qYRpEWFEuAynfU3xJoC4RRO7Atu2dKITHHAxpHq/dFINzYrjnpAGmHgyVNgt6Uo/x3vyE=
X-Received: by 2002:a17:902:b20f:b0:199:1e59:fdf6 with SMTP id
 t15-20020a170902b20f00b001991e59fdf6mr3543579plr.29.1676044889829; Fri, 10
 Feb 2023 08:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
In-Reply-To: <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Feb 2023 11:01:18 -0500
Message-ID: <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000049505505f45a9c45"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000049505505f45a9c45
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 5:41 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
> >
> > CentOS 8 does not ship with a sphinx new enough for our purposes (It
> > necessarily uses Python 3.6), so drop this from this build. We can
> > resume building docs on CentOS 9 if we wish, but we also currently test
> > and build docs on Fedora, Ubuntu, Alpine and Debian.
>
> This confuses me. We work fine with Python 3.6 today.
>

That won't last - Many tools such as mypy, pylint and flake8 which I use to
manage our python codebase have been dropping support for 3.6 and I've had
to implement an increasing number of workarounds to help keep it possible
to test 3.6 via CI while also ensuring our newest platforms work as dev
environments.

Our testing matrix for Python is novel and thorough enough that it's
revealed  several bugs in other downstream Python distributions for Debian
and Fedora, and dozens of bugs for the linters themselves.

I'm concerned that when 3.7 is EOL'd in just a few months that the support
and testing gap is going to get even uglier.

In addition, Avocado framework has been asking me to drop 3.6 so they can
follow suit, for much of the same reasons - maintenance cost.

The typing work we've been pursuing for our testing and qapi libraries
would also be greatly helped by dropping 3.6, but it's really the
maintenance argument that's driving this.

Anyway, just trying to explain that it's not just a frivolous thing I'm
doing for the sake of itself.

Either:
>  * CentOS 8 has fallen off the end of our "supported build platforms"
>    list -- if so, we don't need to be CI'ing anything on it.
>  * CentOS 8 is still a supported platform -- in this case building
>    the docs is something we need to continue to support, and we
>    can't drop Python 3.6 until all of our supported build
>    platforms have a newer Python available.
>

The argument I'm making is:

- CentOS 8 is a supported build platform
- All platforms *do* have a Python modern enough to allow us to drop 3.6
- CentOS's repo version of sphinx is hardcoded to use the older 3.6, though
- You expressed a preference to me in the past to NOT use a pip installed
version of sphinx in preference to the system version in "configure"
- It's still possible to build docs on CentOS 8 after this patchset, you
just need a pip version.
- We've used the justification that our build platform promise does not
necessarily extend to docs and tests in the past.
- So just skip docs building for CentOS 8, only in the CI.

If you believe docs in CI for CentOS 8 is a hard deal breaker, then I want
to go back to discussing the possibility of using sphinx versions from pip.

Paolo mentioned wanting to do similar in reply to another patch on this
series (#5) to preserve docs building on the platform.


> thanks
> -- PMM
>
>

--00000000000049505505f45a9c45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 5:41 AM Peter Maydell &lt;<a hre=
f=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Fri, 10 Feb 2023 at 00:31, Jo=
hn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"no=
referrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; CentOS 8 does not ship with a sphinx new enough for our purposes (It<b=
r>
&gt; necessarily uses Python 3.6), so drop this from this build. We can<br>
&gt; resume building docs on CentOS 9 if we wish, but we also currently tes=
t<br>
&gt; and build docs on Fedora, Ubuntu, Alpine and Debian.<br>
<br>
This confuses me. We work fine with Python 3.6 today.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">That won&#39;t last - =
Many tools such as mypy, pylint and flake8 which I use to manage our python=
 codebase have been dropping support for 3.6 and I&#39;ve had to implement =
an increasing number of workarounds to help keep it possible to test 3.6 vi=
a CI while also ensuring our newest platforms work as dev environments.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Our testing matrix for Pyth=
on is novel and thorough enough that it&#39;s revealed=C2=A0 several bugs i=
n other downstream Python distributions for Debian and Fedora, and dozens o=
f bugs for the linters themselves.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">I&#39;m concerned that when 3.7 is EOL&#39;d in just a few month=
s that the support and testing gap is going to get even uglier.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">In addition, Avocado framework has =
been asking me to drop 3.6 so they can follow suit, for much of the same re=
asons - maintenance cost.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">The typing work we&#39;ve been pursuing for our testing and qapi librarie=
s would also be greatly helped by dropping 3.6, but it&#39;s really the mai=
ntenance argument that&#39;s driving this.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Anyway, just trying to explain that it&#39;s not just a =
frivolous thing I&#39;m doing for the sake of itself.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Either:<br>
=C2=A0* CentOS 8 has fallen off the end of our &quot;supported build platfo=
rms&quot;<br>
=C2=A0 =C2=A0list -- if so, we don&#39;t need to be CI&#39;ing anything on =
it.<br>
=C2=A0* CentOS 8 is still a supported platform -- in this case building<br>
=C2=A0 =C2=A0the docs is something we need to continue to support, and we<b=
r>
=C2=A0 =C2=A0can&#39;t drop Python 3.6 until all of our supported build<br>
=C2=A0 =C2=A0platforms have a newer Python available.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">The argument I&#39;m m=
aking is:</div><div dir=3D"auto"><br></div><div dir=3D"auto">- CentOS 8 is =
a supported build platform</div><div dir=3D"auto">- All platforms *do* have=
 a Python modern enough to allow us to drop 3.6</div><div dir=3D"auto">- Ce=
ntOS&#39;s repo version of sphinx is hardcoded to use the older 3.6, though=
</div><div dir=3D"auto">- You expressed a preference to me in the past to N=
OT use a pip installed version of sphinx in preference to the system versio=
n in &quot;configure&quot;</div><div dir=3D"auto">- It&#39;s still possible=
 to build docs on CentOS 8 after this patchset, you just need a pip version=
.</div><div dir=3D"auto">- We&#39;ve used the justification that our build =
platform promise does not necessarily extend to docs and tests in the past.=
</div><div dir=3D"auto">- So just skip docs building for CentOS 8, only in =
the CI.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you believe d=
ocs in CI for CentOS 8 is a hard deal breaker, then I want to go back to di=
scussing the possibility of using sphinx versions from pip.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo mentioned wanting to do similar=
 in reply to another patch on this series (#5) to preserve docs building on=
 the platform.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--00000000000049505505f45a9c45--


