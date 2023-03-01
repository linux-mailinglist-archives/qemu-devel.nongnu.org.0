Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9686A747B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSQX-00078z-Nj; Wed, 01 Mar 2023 14:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXSQV-00078q-R6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:47:47 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXSQT-0006oU-7C
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:47:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id ck15so58762240edb.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fTeQEhURtg0lqZ3Ns396CIFolx8DBSEYMT0DKJfuixs=;
 b=ncxIePHGgvrgttUf9lS2SzP1eL7a5qwn1ppEuNI9EEB/AoCPCzLoGOGGydhJob97CS
 ZsjVoMY5JqTx5qAMXnf8BiBcsIwhfLgAGihRfSbWoBG6QXXHNb9W6MPA9JINU8O8hiSi
 WJwx2PpxmFCafHJPiJmv2aHG241XQNmFt9cfzcpmnRba32fqhnhnhMQDggyINsbbLOWN
 Q15ha0AKEkXZ+yntx1ov3hYt7OMD36jCLzIyydPnJAX1btpgKkhE17SafO3QFHG1Divy
 DIT5WpprI8I/qG5jFF3Pu/KkjZZR1/QiebPHTR4Ve7VozBv5fNHtPZnEcTHghhH8/z54
 r5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTeQEhURtg0lqZ3Ns396CIFolx8DBSEYMT0DKJfuixs=;
 b=xmuw2Q4t564CVUy11rH4S5rzj7BKn26M7QsBXMrW5Po5qP49Zz60vYXAuODuWTaw1c
 6fdg6d1KVt/wKxdTdEZmg4UAtsbEVrEUNIO7T8SvvENCoOJnc0XvjbBMVvjIBZdUq7Bv
 cbmRuquEUQKY2DRorJ2LYYnFx3FzKHo50I+FOnkpsewWQH9xxB/2g/ufvgqNqvxCBD0t
 HySUWIZhsmfSVuAEyHdHJN7gLcZpEtB8eYJHCQFJbW8vlA+wAwIYHZx7Lpn8k7IwJ9P1
 VAdmVg4qKI42GphVMJfRcnJBpI+6zT5gfUBmstKEqNqJpYDJnFZKEbbTPnYbkgzQ/f6Q
 gwLQ==
X-Gm-Message-State: AO0yUKXeb+LPxwZIXc5WiQSlDRw6AtCBXN8+6Te2xzgC9OKUQD9imknJ
 BugNepY2gjdwTOQpEsVg9EPlHABaBfkeRnO3UBcS5A==
X-Google-Smtp-Source: AK7set9BWV6OU/CHi5oYGlF3tXjbxxmbmAAWWziBef21yblwU/FIzSkmQR0Ojav4BbksDwtkdYZfP8cTVlvAIlM3v70=
X-Received: by 2002:a17:906:52d2:b0:8b1:7ac6:318a with SMTP id
 w18-20020a17090652d200b008b17ac6318amr3620716ejn.4.1677700063321; Wed, 01 Mar
 2023 11:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
In-Reply-To: <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Wed, 1 Mar 2023 19:47:31 +0000
Message-ID: <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005071f205f5dbfce6"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000005071f205f5dbfce6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From the other thread:

I think the underlying config needs updating:

  .git/modules/tests/fp/berkeley-testfloat-3/config

I'm surprised the git config for submodules doesn't carry the metadata.

On Wed, 1 Mar 2023 at 19:19, Peter Maydell <peter.maydell@linaro.org> wrote=
:

> On Wed, 1 Mar 2023 at 18:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> > >>
> > >> The following changes since commit
> 627634031092e1514f363fd8659a579398de0f0e:
> > >>
> > >>   Merge tag 'buildsys-qom-qdev-ui-20230227' of
> > >> https://github.com/philmd/qemu into staging (2023-02-28 15:09:18
> > >> +0000)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-=
1
> > >>
> > >> for you to fetch changes up to
> c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb:
> > >>
> > >>   tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01
> 12:51:01 +0000)
> > >>
> > >> ----------------------------------------------------------------
> > >> testing updates:
> > >>
> > >>   - ensure socat available for tests
> > >>   - skip socat tests for MacOS
> > >>   - properly clean up fifos after use
> > >>   - make fp-test less chatty
> > >>   - store test artefacts on Cirrus
> > >>   - control custom runners with QEMU_CI knobs
> > >>   - disable benchmark runs under tsan build
> > >>   - update ubuntu 2004 to 2204
> > >>   - skip nios2 kernel replay test
> > >>   - add tuxrun baselines to avocado
> > >>   - binary build of tricore tools
> > >>   - export test results on cross builds
> > >>   - improve windows builds
> > >>   - ensure we properly print TAP headers
> > >>   - migrate away from docker.py for building containers
> > >>   - be more efficient in our handling of build artefacts between
> stages
> > >>   - enable ztsd in containers so we can run tux_baselines
> > >>   - disable heavyweight PPC64 Boot Linux test in CI
> > >
> > > This still won't merge:
> > >
> > > e104462:jammy:qemu-for-merges$ apply-pullreq
> > > https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
> > > Switched to branch 'master'
> > > Your branch is up-to-date with 'origin/master'.
> > > Already up-to-date.
> > > Switched to branch 'staging'
> > > fetching from remote https://gitlab.com/stsquad/qemu.git
> > > tags/pull-testing-next-010323-1
> > > remote: Enumerating objects: 288, done.
> > > remote: Counting objects: 100% (288/288), done.
> > > remote: Compressing objects: 100% (135/135), done.
> > > remote: Total 221 (delta 182), reused 114 (delta 84), pack-reused 0
> > > Receiving objects: 100% (221/221), 43.20 KiB | 3.08 MiB/s, done.
> > > Resolving deltas: 100% (182/182), completed with 57 local objects.
> > > From https://gitlab.com/stsquad/qemu
> > >  * tag                       pull-testing-next-010323-1 -> FETCH_HEAD
> > > Fetching submodule tests/fp/berkeley-testfloat-3
> > > fatal: unable to connect to github.com:
> > > github.com[0: 140.82.121.3]: errno=3DConnection timed out
> > >
> > > fatal: unable to connect to github.com:
> > > github.com[0: 140.82.114.4]: errno=3DConnection timed out
> > >
> > > Errors during submodule fetch:
> > >         tests/fp/berkeley-testfloat-3
> > >         tests/fp/berkeley-testfloat-3
> >
> > You'll need to do a fresh checkout or manually fix up the .git/ metadat=
a
>
> What metadata? I don't understand what's going on here...
> The .gitmodules I have points at gitlab URLs for the
> softfloat and testfloat stuff.
>
> -- PMM
>


--=20
Alex Benn=C3=A9e
Emulation and Virtualisation Tech Lead @ Linaro

--0000000000005071f205f5dbfce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>From the other thread:</div><div><br></div><div>I thi=
nk the underlying config needs updating:</div><br>=C2=A0 .git/modules/tests=
/fp/berkeley-testfloat-3/config<br><br>I&#39;m surprised the git config for=
 submodules doesn&#39;t carry the metadata.<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Mar 2023 at 19:19,=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, 1 Mar 2023 at 18:17, Alex Benn=C3=A9e &lt;<a href=3D"ma=
ilto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=
=3D"_blank">peter.maydell@linaro.org</a>&gt; writes:<br>
&gt;<br>
&gt; &gt; On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e &lt;<a href=3D"mail=
to:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;=
 wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The following changes since commit 627634031092e1514f363fd865=
9a579398de0f0e:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0Merge tag &#39;buildsys-qom-qdev-ui-20230227&#39;=
 of<br>
&gt; &gt;&gt; <a href=3D"https://github.com/philmd/qemu" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/philmd/qemu</a> into staging (2023-02=
-28 15:09:18<br>
&gt; &gt;&gt; +0000)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; are available in the Git repository at:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/stsquad/qemu.git" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/stsquad/qemu.git</a>=
 tags/pull-testing-next-010323-1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5=
a5e35dd4bb:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0tests/avocado: disable BootLinuxPPC64 test in CI =
(2023-03-01 12:51:01 +0000)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -------------------------------------------------------------=
---<br>
&gt; &gt;&gt; testing updates:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- ensure socat available for tests<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- skip socat tests for MacOS<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- properly clean up fifos after use<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- make fp-test less chatty<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- store test artefacts on Cirrus<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- control custom runners with QEMU_CI knobs<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- disable benchmark runs under tsan build<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- update ubuntu 2004 to 2204<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- skip nios2 kernel replay test<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- add tuxrun baselines to avocado<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- binary build of tricore tools<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- export test results on cross builds<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- improve windows builds<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- ensure we properly print TAP headers<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- migrate away from docker.py for building contai=
ners<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- be more efficient in our handling of build arte=
facts between stages<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- enable ztsd in containers so we can run tux_bas=
elines<br>
&gt; &gt;&gt;=C2=A0 =C2=A0- disable heavyweight PPC64 Boot Linux test in CI=
<br>
&gt; &gt;<br>
&gt; &gt; This still won&#39;t merge:<br>
&gt; &gt;<br>
&gt; &gt; e104462:jammy:qemu-for-merges$ apply-pullreq<br>
&gt; &gt; <a href=3D"https://gitlab.com/stsquad/qemu.git" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.com/stsquad/qemu.git</a> tags/pull-testi=
ng-next-010323-1<br>
&gt; &gt; Switched to branch &#39;master&#39;<br>
&gt; &gt; Your branch is up-to-date with &#39;origin/master&#39;.<br>
&gt; &gt; Already up-to-date.<br>
&gt; &gt; Switched to branch &#39;staging&#39;<br>
&gt; &gt; fetching from remote <a href=3D"https://gitlab.com/stsquad/qemu.g=
it" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/stsquad/qemu.gi=
t</a><br>
&gt; &gt; tags/pull-testing-next-010323-1<br>
&gt; &gt; remote: Enumerating objects: 288, done.<br>
&gt; &gt; remote: Counting objects: 100% (288/288), done.<br>
&gt; &gt; remote: Compressing objects: 100% (135/135), done.<br>
&gt; &gt; remote: Total 221 (delta 182), reused 114 (delta 84), pack-reused=
 0<br>
&gt; &gt; Receiving objects: 100% (221/221), 43.20 KiB | 3.08 MiB/s, done.<=
br>
&gt; &gt; Resolving deltas: 100% (182/182), completed with 57 local objects=
.<br>
&gt; &gt; From <a href=3D"https://gitlab.com/stsquad/qemu" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.com/stsquad/qemu</a><br>
&gt; &gt;=C2=A0 * tag=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pull-testing-next-010323-1 -&gt; FETCH_HEAD<=
br>
&gt; &gt; Fetching submodule tests/fp/berkeley-testfloat-3<br>
&gt; &gt; fatal: unable to connect to <a href=3D"http://github.com" rel=3D"=
noreferrer" target=3D"_blank">github.com</a>:<br>
&gt; &gt; <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank=
">github.com</a>[0: 140.82.121.3]: errno=3DConnection timed out<br>
&gt; &gt;<br>
&gt; &gt; fatal: unable to connect to <a href=3D"http://github.com" rel=3D"=
noreferrer" target=3D"_blank">github.com</a>:<br>
&gt; &gt; <a href=3D"http://github.com" rel=3D"noreferrer" target=3D"_blank=
">github.com</a>[0: 140.82.114.4]: errno=3DConnection timed out<br>
&gt; &gt;<br>
&gt; &gt; Errors during submodule fetch:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests/fp/berkeley-testfloat-3<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests/fp/berkeley-testfloat-3<br=
>
&gt;<br>
&gt; You&#39;ll need to do a fresh checkout or manually fix up the .git/ me=
tadata<br>
<br>
What metadata? I don&#39;t understand what&#39;s going on here...<br>
The .gitmodules I have points at gitlab URLs for the<br>
softfloat and testfloat stuff.<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr">Alex Benn=C3=A9e<br>Emulation and Virtuali=
sation Tech Lead @ Linaro</div></div>

--0000000000005071f205f5dbfce6--

