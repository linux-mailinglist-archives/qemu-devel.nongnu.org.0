Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45D5350BA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:37:00 +0200 (CEST)
Received: from localhost ([::1]:34714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEbj-0001Nr-Ue
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEa2-0000OS-IM
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEZz-0004OW-8p
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653575710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGSCbESPGRBOjMwiDVzRc9IXbwYfQ6r+godCgm9R+1U=;
 b=PIKPLtX/wTTt8bQkcykU7T3rKF41PC1MtdCGl7byJK2SCehmEkbKSQTWIq/Dfa9hLIGRzi
 xSrDv5+ccjEZwEEtFYXnFLV9qi6p+gxzIoqzbIOw2LRyRntVUoiO3lkqC51LXXhpxDgCvq
 B4gny7hicHEgZxpQurcSqtE/yRfrRW8=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-K2vYvdbIOxOKtcxBAzJPcA-1; Thu, 26 May 2022 10:35:08 -0400
X-MC-Unique: K2vYvdbIOxOKtcxBAzJPcA-1
Received: by mail-ua1-f72.google.com with SMTP id
 y15-20020ab0638f000000b00368a2d9b075so933581uao.13
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGSCbESPGRBOjMwiDVzRc9IXbwYfQ6r+godCgm9R+1U=;
 b=TwOevx8HByjp52WrsVmB17L+6IsoGoFpikZ2idyo9VWiY1OvY43q0ym37HNBIZzFNh
 DrC8mpADwK5d3gILUgLVtAK/fP1hQDcChtga5lHnfmO/aGjDexoxkWfAUMYDomcHRTO+
 kChowKW/OWERWAebqcDkEICOtbGjR6Xsa9DVUOJS4FhhpY8wOYYtFiBuM67DRFAsXYS1
 FkEYuBzlWytw7lcKlThS6tFtRilb6PhVzHINu4gTO3hNMCSaD09X1jYF6HkMacp4A/qi
 TAmdMIF9IJA9wRLljFjLByxnO2N84ae5NuDDYt2Ni5QNF/X2rSVm6N6/lSNA9gK8KHq9
 ixlw==
X-Gm-Message-State: AOAM531MmRlf4bgce0GvDBH+Thd5JOoZ2aM+Pxv2ztJK0vcV/ZaD7WOr
 eIRVyX9At3glfFTtQliciHZvH2Myi69/S+SCIymsTkYPRm25v2yvIt0J6wd2jM70zkoKnl/KuKa
 aNMixYUf6AfHqC9V6YLmBhwjIyk0H0PA=
X-Received: by 2002:a67:c21e:0:b0:337:d926:347b with SMTP id
 i30-20020a67c21e000000b00337d926347bmr5501842vsj.11.1653575707894; 
 Thu, 26 May 2022 07:35:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlX1Lg/RkoTZ9dRaTiEIfLnUViB2rXYH8W/EkrcLqCWuHWjw5AeBiq/4iuevcw3QcZHDS+W+RFzSkOdecAVvI=
X-Received: by 2002:a67:c21e:0:b0:337:d926:347b with SMTP id
 i30-20020a67c21e000000b00337d926347bmr5501823vsj.11.1653575707661; Thu, 26
 May 2022 07:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220526000921.1581503-1-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 10:34:57 -0400
Message-ID: <CAFn=p-bdvwdJY=cKZk9Q_N6CYj+Suetworw2Xa+3kc4bf_4Fug@mail.gmail.com>
Subject: Re: [PATCH 0/9] tests, python: prepare to expand usage of test venv
To: qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aa2f4b05dfeb185d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aa2f4b05dfeb185d
Content-Type: text/plain; charset="UTF-8"

On Wed, May 25, 2022, 8:09 PM John Snow <jsnow@redhat.com> wrote:

> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/548326343
>
> This series collects some of the uncontroversial elements that serve as
> pre-requisites for a later series that seeks to generate a testing venv
> by default.
>
> This series makes the following material changes:
>
> - Install the 'qemu' package into the avocado testing venv
> - Use the avocado testing venv to run vm-tests
> - Use the avocado testing venv to run device-crash-test
>
> None of these changes impact 'make check'; these are all specialty
> tests that are not run by default. This series also doesn't change how
> iotests are run, doesn't add any new dependencies for SRPM builds, etc.
>
> NOTE: patch 8 isn't strictly required for this series, but including it
> here "early" helps the subsequent series. Since the debian docker files
> are layered, testing downstream pipelines can fail because the base
> image is pulled from the main QEMU repo instead of the downstream.
>
> In other words: I need this patch in origin/main in order to have the
> venv module available for later patches that will actually need it in
> our debian10 derivative images.
>
> (in other-other-words: the 'clang-user' test *will* need it later.)
>
> John Snow (9):
>   python: update for mypy 0.950
>   tests: add "TESTS_PYTHON" variable to Makefile
>   tests: use python3 as the python executable name
>   tests: silence pip upgrade warnings during venv creation
>   tests: add quiet-venv-pip macro
>   tests: install "qemu" namespace package into venv
>   tests: use tests/venv to run basevm.py-based scripts
>   tests: add python3-venv to debian10.docker
>   tests: run 'device-crash-test' from tests/venv
>
>  .gitlab-ci.d/buildtest.yml               |  8 +++++---
>  python/qemu/qmp/util.py                  |  4 +++-
>  python/setup.cfg                         |  1 +
>  scripts/device-crash-test                | 14 +++++++++++---
>  tests/Makefile.include                   | 18 ++++++++++--------
>  tests/avocado/avocado_qemu/__init__.py   | 11 +++++------
>  tests/avocado/virtio_check_params.py     |  1 -
>  tests/avocado/virtio_version.py          |  1 -
>  tests/docker/dockerfiles/debian10.docker |  1 +
>  tests/requirements.txt                   |  1 +
>  tests/vm/Makefile.include                | 13 +++++++------
>  tests/vm/basevm.py                       |  6 +++---
>  12 files changed, 47 insertions(+), 32 deletions(-)
>
> --
> 2.34.1
>

Paolo: thanks for reviews.

I have a follow-up series that does more adventurous things (the pythonized
bootstrapper, sub-dependency groups, and switching iotests over), but it
introduces some new problems that are more "rfc" tier again.

In short: I allow iotests to bootstrap itself, but this creates two subtle
problems:

(1) If check is engaged without running check-venv first and iotests
creates its own venv, the python binary it uses will be whichever one is
your system default, not necessarily the one you configured your build with.

This is reasonable behavior IMO, but if you later run "make check", there's
no guarantee that Make will re-make the venv with the correct python
binary  That's a subtle landmine.

(2) Similarly, if the venv requirements.txt (or python/setup.cfg) change,
iotests doesn't have the logic to notice it ought to re-make the venv. Only
the makefile does. However, at least in this case, the makefile is
guaranteed to notice if/when we run "check block" again. The odds of these
files changing for most people who aren't *me* are pretty low, so it may
not really come up much. Still, it's not bullet-proof.

(Bonus not-at-all-subtle problem) I need to remove iotest 297, otherwise
iotests under a venv that doesn't install mypy/pylint will never run. I
discussed this upstream recently w/ Kevin, but my series to address it
isn't ready yet. (Just pre-emptively pointing it out to say I'm aware of
it!)

WIP. Will send new RFC series today predicated on top of this series.

--js

>

--000000000000aa2f4b05dfeb185d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 25, 2022, 8:09 PM John Snow &lt;<a href=3D=
"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">GitLab CI: <a href=3D"https://gitlab.com/jsnow/qemu/=
-/pipelines/548326343" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://gitlab.com/jsnow/qemu/-/pipelines/548326343</a><br>
<br>
This series collects some of the uncontroversial elements that serve as<br>
pre-requisites for a later series that seeks to generate a testing venv<br>
by default.<br>
<br>
This series makes the following material changes:<br>
<br>
- Install the &#39;qemu&#39; package into the avocado testing venv<br>
- Use the avocado testing venv to run vm-tests<br>
- Use the avocado testing venv to run device-crash-test<br>
<br>
None of these changes impact &#39;make check&#39;; these are all specialty<=
br>
tests that are not run by default. This series also doesn&#39;t change how<=
br>
iotests are run, doesn&#39;t add any new dependencies for SRPM builds, etc.=
<br>
<br>
NOTE: patch 8 isn&#39;t strictly required for this series, but including it=
<br>
here &quot;early&quot; helps the subsequent series. Since the debian docker=
 files<br>
are layered, testing downstream pipelines can fail because the base<br>
image is pulled from the main QEMU repo instead of the downstream.<br>
<br>
In other words: I need this patch in origin/main in order to have the<br>
venv module available for later patches that will actually need it in<br>
our debian10 derivative images.<br>
<br>
(in other-other-words: the &#39;clang-user&#39; test *will* need it later.)=
<br>
<br>
John Snow (9):<br>
=C2=A0 python: update for mypy 0.950<br>
=C2=A0 tests: add &quot;TESTS_PYTHON&quot; variable to Makefile<br>
=C2=A0 tests: use python3 as the python executable name<br>
=C2=A0 tests: silence pip upgrade warnings during venv creation<br>
=C2=A0 tests: add quiet-venv-pip macro<br>
=C2=A0 tests: install &quot;qemu&quot; namespace package into venv<br>
=C2=A0 tests: use tests/venv to run basevm.py-based scripts<br>
=C2=A0 tests: add python3-venv to debian10.docker<br>
=C2=A0 tests: run &#39;device-crash-test&#39; from tests/venv<br>
<br>
=C2=A0.gitlab-ci.d/buildtest.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 +++++---<br>
=C2=A0python/qemu/qmp/util.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
=C2=A0python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0scripts/device-crash-test=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 14 +++++++++++---<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++--------<br>
=C2=A0tests/avocado/avocado_qemu/__init__.py=C2=A0 =C2=A0| 11 +++++------<b=
r>
=C2=A0tests/avocado/virtio_check_params.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<b=
r>
=C2=A0tests/avocado/virtio_version.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 -<br>
=C2=A0tests/docker/dockerfiles/debian10.docker |=C2=A0 1 +<br>
=C2=A0tests/requirements.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0tests/vm/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 +++++++------<br>
=C2=A0tests/vm/basevm.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A012 files changed, 47 insertions(+), 32 deletions(-)<br>
<br>
-- <br>
2.34.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Paolo: thanks for reviews.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I have a follow-up series that does more adventurous things (the =
pythonized bootstrapper, sub-dependency groups, and switching iotests over)=
, but it introduces some new problems that are more &quot;rfc&quot; tier ag=
ain.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">In short: I all=
ow iotests to bootstrap itself, but this creates two subtle problems:</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">(1) If check is engaged witho=
ut running check-venv first and iotests creates its own venv, the python bi=
nary it uses will be whichever one is your system default, not necessarily =
the one you configured your build with.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">This is reasonable behavior IMO, but if you later run &quot=
;make check&quot;, there&#39;s no guarantee that Make will re-make the venv=
 with the correct python binary=C2=A0 That&#39;s a subtle landmine.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">(2) Similarly, if the venv requ=
irements.txt (or python/setup.cfg) change, iotests doesn&#39;t have the log=
ic to notice it ought to re-make the venv. Only the makefile does. However,=
 at least in this case, the makefile is guaranteed to notice if/when we run=
 &quot;check block&quot; again. The odds of these files changing for most p=
eople who aren&#39;t *me* are pretty low, so it may not really come up much=
. Still, it&#39;s not bullet-proof.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">(Bonus not-at-all-subtle problem) I need to remove iotest 297, =
otherwise iotests under a venv that doesn&#39;t install mypy/pylint will ne=
ver run. I discussed this upstream recently w/ Kevin, but my series to addr=
ess it isn&#39;t ready yet. (Just pre-emptively pointing it out to say I&#3=
9;m aware of it!)</div><div dir=3D"auto"><br></div><div dir=3D"auto">WIP. W=
ill send new RFC series today predicated on top of this series.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000aa2f4b05dfeb185d--


