Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DEE6BD251
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 15:27:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcoYk-00047I-8A; Thu, 16 Mar 2023 10:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pcoYh-00046v-2T
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pcoYe-0006i0-9x
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 10:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678976779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=He5vy2dfONY0rkcg+Ogl12YbutvRGteOzfMdkd4bEwc=;
 b=ZOC2HWd344nT+AZNLobE5bnIk0+/OBnnOWmBTNLn/oF4y8TNtI4qFtLM2TV114QtSp2L/f
 n32E9Q2dybN1b471IjTfd2NDe5FAFM5m/PLSPHEQGuNKpX0ZN+jniah2TTz4GKOXPWjX1x
 ixf5K+qy3a859vglte6uF53nqsva9ak=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-4Tgqgzg0OkK5hWZNhTH8CA-1; Thu, 16 Mar 2023 10:26:18 -0400
X-MC-Unique: 4Tgqgzg0OkK5hWZNhTH8CA-1
Received: by mail-pg1-f198.google.com with SMTP id
 62-20020a630241000000b004fb3343142dso567724pgc.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 07:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678976777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=He5vy2dfONY0rkcg+Ogl12YbutvRGteOzfMdkd4bEwc=;
 b=bUfVUREAw/7RH+TAVnMzAO05lrwiJAnFmNcQCOro5E+oL0pwU3xviTejH/d668sCoE
 DhduxFYRAR17NnvwAtv8mrblS9kM+WLtHgB0cNMlpXEC0vpCHz353U3BUUv+fHRowWOb
 fZaMvhOR1jl69VczkDgoyVcPJLZze4bIxarU48Zif4/+TMOvd0WgCGfSCGcyJwWfSrB2
 DyBlbXAixcmVKQjCrDSFYTxo0wyYbJg4/pUrRLKkq4mkowXckSW8XCsefuFqRUXLuBYK
 ql0HYICsNAnX8dOtMuI94wjsScyI01P/ijMKoVJIPMKZ4Yorw8BEETWEt0L/J2Ygz0nW
 nicA==
X-Gm-Message-State: AO0yUKWbWc/qbVikndn7rqAfAVYR2k3Dvi45iOfbz6XtLcCTi79El7K0
 zCSZJu2JkCk0NqXI81M2M6WzARJnh9cA9QqbEUjFlcwqPgsKfR+JGTTm/20Khr/weOc0lxcCsHM
 J6P134pTvfwzHMHleryPLLvXuS/Jn3DUs6JbHyaY=
X-Received: by 2002:a17:902:ea08:b0:19f:321f:55cb with SMTP id
 s8-20020a170902ea0800b0019f321f55cbmr1647749plg.12.1678976776779; 
 Thu, 16 Mar 2023 07:26:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set8YXiWuAJ1HVHDn/pZavTfC7Ngb8x2CZ43FxYlVRSd/tA3/NBJsDSuxxWfrjIL/IWO6X/g2va/wcXCmeHy0dts=
X-Received: by 2002:a17:902:ea08:b0:19f:321f:55cb with SMTP id
 s8-20020a170902ea0800b0019f321f55cbmr1647730plg.12.1678976776448; Thu, 16 Mar
 2023 07:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-3-pbonzini@redhat.com>
 <05c4478c-542e-2cb5-3443-f94f1b9dab6a@linaro.org>
 <CAFn=p-bDbwR5ccPXCbfNhtSwCot1_t9dr4BVw0aJyvVQ4VWJhw@mail.gmail.com>
 <6a416627-b4e1-4d23-09a5-ee330755eda6@linaro.org>
In-Reply-To: <6a416627-b4e1-4d23-09a5-ee330755eda6@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Mar 2023 10:26:05 -0400
Message-ID: <CAFn=p-btHc-Tz9DyD6s88YME-3zmNZp_W6gDX-aiSddFQ0gCrQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] python: drop pipenv
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 Jan Richter <jarichte@redhat.com>, peter.maydell@linaro.org, thuth@redhat.com, 
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Mar 16, 2023 at 4:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 16/3/23 00:02, John Snow wrote:
> > On Wed, Mar 15, 2023 at 5:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> +Jan
> >>
> >> On 22/2/23 15:37, Paolo Bonzini wrote:
> >>> From: John Snow <jsnow@redhat.com>
> >>>
> >>> The pipenv tool was nice in theory, but in practice it's just too har=
d
> >>> to update selectively, and it makes using it a pain. The qemu.qmp rep=
o
> >>> dropped pipenv support a while back and it's been functioning just fi=
ne,
> >>> so I'm backporting that change here to qemu.git.
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >>> ---
> >>>    .gitlab-ci.d/static_checks.yml         |   4 +-
> >>>    python/.gitignore                      |   4 +-
> >>>    python/Makefile                        |  53 ++--
> >>>    python/Pipfile                         |  13 -
> >>>    python/Pipfile.lock                    | 347 ---------------------=
----
> >>>    python/README.rst                      |   3 -
> >>>    python/setup.cfg                       |   4 +-
> >>>    python/tests/minreqs.txt               |  45 ++++
> >>>    tests/docker/dockerfiles/python.docker |   1 -
> >>>    9 files changed, 86 insertions(+), 388 deletions(-)
> >>>    delete mode 100644 python/Pipfile
> >>>    delete mode 100644 python/Pipfile.lock
> >>>    create mode 100644 python/tests/minreqs.txt
>
>
> >>> diff --git a/python/setup.cfg b/python/setup.cfg
> >>> index 564181570654..9e923d97628f 100644
> >>> --- a/python/setup.cfg
> >>> +++ b/python/setup.cfg
> >>> @@ -33,9 +33,7 @@ packages =3D
> >>>    * =3D py.typed
> >>>
> >>>    [options.extras_require]
> >>> -# For the devel group, When adding new dependencies or bumping the m=
inimum
> >>> -# version, use e.g. "pipenv install --dev pylint=3D=3D3.0.0".
> >>> -# Subsequently, edit 'Pipfile' to remove e.g. 'pylint =3D "=3D=3D3.0=
.0'.
> >>> +# Remember to update tests/minreqs.txt if changing anything below:
> >>>    devel =3D
> >>>        avocado-framework >=3D 90.0
> >>
> >> Here >=3D 90,
> >
> > Yes. The "devel" group for the python packages here requires
> > avocado-framework 90.0 or better... to run the tests *on the python
> > package*.
> >
> >>
> >>>        flake8 >=3D 3.6.0
> >>> diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
> >>> new file mode 100644
> >>> index 000000000000..dfb8abb155f4
> >>> --- /dev/null
> >>> +++ b/python/tests/minreqs.txt
> >>> @@ -0,0 +1,45 @@
> >>> +# This file lists the ***oldest possible dependencies*** needed to r=
un
> >>> +# "make check" successfully under ***Python 3.6***. It is used prima=
rily
> >>> +# by GitLab CI to ensure that our stated minimum versions in setup.c=
fg
> >>> +# are truthful and regularly validated.
> >>> +#
> >>> +# This file should not contain any dependencies that are not express=
ed
> >>> +# by the [devel] section of setup.cfg, except for transitive
> >>> +# dependencies which must be enumerated here explicitly to eliminate
> >>> +# dependency resolution ambiguity.
> >>> +#
> >>> +# When adding new dependencies, pin the very oldest non-yanked versi=
on
> >>> +# on PyPI that allows the test suite to pass.
> >>> +
> >>> +# Dependencies for the TUI addon (Required for successful linting)
> >>> +urwid=3D=3D2.1.2
> >>> +urwid-readline=3D=3D0.13
> >>> +Pygments=3D=3D2.9.0
> >>> +
> >>> +# Dependencies for FUSE support for qom-fuse
> >>> +fusepy=3D=3D2.0.4
> >>> +
> >>> +# Test-runners, utilities, etc.
> >>> +avocado-framework=3D=3D90.0
> >>
> >> ... and here =3D=3D 90.
> >
> > Yes. This is the minimum requirements file for the purposes of testing
> > the python code via CI ("python-check-minreqs").
> > It installs *exactly* version 90.0 to ensure that there are no
> > avocado-framework features used in later versions that have
> > accidentally slipped in.
> >
> >>
> >> Anyhow I'm surprised by unreviewed commit 4320f7172f
> >> ("python: bump avocado to v90.0") and we still have:
> >
> > The implication being that it wouldn't have passed review?
>
> I want to use Avocado 90+ since more than 1 year now as this
> would make my maintainer life easier, but "something" was missing
> and Cleber said he'd address that, then we could move to v90.
>
> I suppose the qemu.qmp package is not tested on Darwin/macOS,
> or is not tested with Avocado.
>

Ah, that's true. I don't have a mac and the CI tests *on* the qemu.qmp
code run under Fedora. I don't know what stops us from running them on
mac at all, but I haven't tried.

> >> tests/requirements.txt:5:avocado-framework=3D=3D88.1
> >
> > Developing the python code needs avocado >=3D 90,
>
> What do you mean by "Developing the python code"?
>

cd qemu.git/python && make check-dev

The [devel] group of requisites are used to install requisites for
linting and running various tools on the python code itself. It's also
used for "check-tox" or "check-minreqs" which all behave slightly
differently, but ultimately do the same thing. Try "make help" to see
a nice summary.

> > running the avocado tests needs avocado=3D=3D88.1.
> >
> >>
> >> 1/ How do you run Avocado tests out of tests/ ?
> >
> > "make check-avocado", the same as anyone else, I assume.
> >
> >>
> >> 2/ Can we use Avocado on Darwin/macOS now? I thought we
> >> needed one series from Cleber [*] for that, which is why
> >> QEMU is the last project using the 'old' runner (as opposed
> >> to the 'new' runner which is the upstream /current/ one).
> >
> > I have no idea. I'm going to guess that you're wondering if you can
> > run the avocado *qemu* tests on Darwin/macOS, and I wouldn't know - I
> > don't develop avocado or those tests, and I don't have a mac.
>
> Well currently we can not run Avocado on Darwin/macOS (at least since
> macOS Big Sur which is where I started).
>


