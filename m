Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD2F6BC09E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 00:04:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pca8y-00029k-Ty; Wed, 15 Mar 2023 19:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pca8w-00029B-To
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pca8t-0008UU-PL
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 19:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678921365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2wGqgDCfsq8+emb7T8YHiuj6LXuvnIqyjyLTOlOo/Kk=;
 b=LgY1kRxaa0BvJMBgiV/s64NdU6jBTRMcW+ZEsfnrqm5TiCsZp4G7LIjLJsnZTqVA3Z1WTW
 UIip/lDrrBqTfo8/ZQLijoHX2N6knYJDFDS/E/ZVVMD1cDRfjyKUP51hVL4CFMrK6hBR1i
 6NFV0JHSVSxgUmj1ilKDOPKiTxzrINI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-GZPArv_UNn2-bOumBiwzuw-1; Wed, 15 Mar 2023 19:02:43 -0400
X-MC-Unique: GZPArv_UNn2-bOumBiwzuw-1
Received: by mail-pl1-f198.google.com with SMTP id
 p10-20020a170902e74a00b0019ec1acba17so11079487plf.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 16:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678921361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wGqgDCfsq8+emb7T8YHiuj6LXuvnIqyjyLTOlOo/Kk=;
 b=GhtRyjWnthBp2JorG9t12Sxo6QNzRkJdvWAfOULQnYJDxJgFrQpgMACEVbypToPpf+
 CIVBfCjjzpsBDrlGcRfgv3vx8qAs20s4IMM/Ng3oIn1uscr0DtKwvw6yGrZQc30DPu3y
 A1FKFo77kq4UKQjQs2djq0V6B1+23urllxo1xuaJxUt3pfuBuUj7UNbRYIsh7lwxaVAc
 b2ZAFtYBnl8Hx3kD6g9J55tI4E84yyic4ztFTiNI+AHGuySN5imDAIwkzymw8gmDwAZp
 mjmajfnMR1D0sid8bzLZIU9O6S0tqZhtky+IhOOfqxfVbVlfNvTjxOCZMCQPwmUIJ0GU
 W/eA==
X-Gm-Message-State: AO0yUKWujgLxr05NqtXX2zXPM3rNgpFkKdUR4XiTiF8baMTOFZFQlvW4
 hVWR3vRoLbjIzAlgolKFgIQq8xMJeURSKKDRrgu5pQP+GRvMBA0ESP3LpIwJ8YT6LTJxgez2oak
 xLucxbdoT9HzW3EKM60PhvU+jiHwh3Gg=
X-Received: by 2002:a17:902:db09:b0:1a0:503a:2a42 with SMTP id
 m9-20020a170902db0900b001a0503a2a42mr511394plx.12.1678921360874; 
 Wed, 15 Mar 2023 16:02:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set+fivsQjekro/p9NoNrTTSsjUhxTHSX98xRb9EXQo8xiJd6/KO8DRFQsW+mUBaVUpj3ROUTYAIxVEUb71JzFYg=
X-Received: by 2002:a17:902:db09:b0:1a0:503a:2a42 with SMTP id
 m9-20020a170902db0900b001a0503a2a42mr511372plx.12.1678921360281; Wed, 15 Mar
 2023 16:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-3-pbonzini@redhat.com>
 <05c4478c-542e-2cb5-3443-f94f1b9dab6a@linaro.org>
In-Reply-To: <05c4478c-542e-2cb5-3443-f94f1b9dab6a@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Mar 2023 19:02:28 -0400
Message-ID: <CAFn=p-bDbwR5ccPXCbfNhtSwCot1_t9dr4BVw0aJyvVQ4VWJhw@mail.gmail.com>
Subject: Re: [PATCH 02/10] python: drop pipenv
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
 Jan Richter <jarichte@redhat.com>, peter.maydell@linaro.org, thuth@redhat.com, 
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Wed, Mar 15, 2023 at 5:17=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> +Jan
>
> On 22/2/23 15:37, Paolo Bonzini wrote:
> > From: John Snow <jsnow@redhat.com>
> >
> > The pipenv tool was nice in theory, but in practice it's just too hard
> > to update selectively, and it makes using it a pain. The qemu.qmp repo
> > dropped pipenv support a while back and it's been functioning just fine=
,
> > so I'm backporting that change here to qemu.git.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   .gitlab-ci.d/static_checks.yml         |   4 +-
> >   python/.gitignore                      |   4 +-
> >   python/Makefile                        |  53 ++--
> >   python/Pipfile                         |  13 -
> >   python/Pipfile.lock                    | 347 ------------------------=
-
> >   python/README.rst                      |   3 -
> >   python/setup.cfg                       |   4 +-
> >   python/tests/minreqs.txt               |  45 ++++
> >   tests/docker/dockerfiles/python.docker |   1 -
> >   9 files changed, 86 insertions(+), 388 deletions(-)
> >   delete mode 100644 python/Pipfile
> >   delete mode 100644 python/Pipfile.lock
> >   create mode 100644 python/tests/minreqs.txt
> >
> > diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_check=
s.yml
> > index 289ad1359e3a..b4cbdbce2abf 100644
> > --- a/.gitlab-ci.d/static_checks.yml
> > +++ b/.gitlab-ci.d/static_checks.yml
> > @@ -23,12 +23,12 @@ check-dco:
> >     before_script:
> >       - apk -U add git
> >
> > -check-python-pipenv:
> > +check-python-minreqs:
> >     extends: .base_job_template
> >     stage: test
> >     image: $CI_REGISTRY_IMAGE/qemu/python:latest
> >     script:
> > -    - make -C python check-pipenv
> > +    - make -C python check-minreqs
> >     variables:
> >       GIT_DEPTH: 1
> >     needs:
> > diff --git a/python/.gitignore b/python/.gitignore
> > index 904f324bb11a..c3ceb1ca0ab1 100644
> > --- a/python/.gitignore
> > +++ b/python/.gitignore
> > @@ -11,8 +11,8 @@ qemu.egg-info/
> >   .idea/
> >   .vscode/
> >
> > -# virtual environments (pipenv et al)
> > -.venv/
> > +# virtual environments
> > +.min-venv/
> >   .tox/
> >   .dev-venv/
> >
> > diff --git a/python/Makefile b/python/Makefile
> > index b170708398ab..c5bd6ff83ac9 100644
> > --- a/python/Makefile
> > +++ b/python/Makefile
> > @@ -1,15 +1,16 @@
> >   QEMU_VENV_DIR=3D.dev-venv
> > +QEMU_MINVENV_DIR=3D.min-venv
> >   QEMU_TOX_EXTRA_ARGS ?=3D
> >
> >   .PHONY: help
> >   help:
> >       @echo "python packaging help:"
> >       @echo ""
> > -     @echo "make check-pipenv:"
> > -     @echo "    Run tests in pipenv's virtual environment."
> > +     @echo "make check-minreqs:"
> > +     @echo "    Run tests in the minreqs virtual environment."
> >       @echo "    These tests use the oldest dependencies."
> > -     @echo "    Requires: Python 3.6 and pipenv."
> > -     @echo "    Hint (Fedora): 'sudo dnf install python3.6 pipenv'"
> > +     @echo "    Requires: Python 3.6"
> > +     @echo "    Hint (Fedora): 'sudo dnf install python3.6'"
> >       @echo ""
> >       @echo "make check-tox:"
> >       @echo "    Run tests against multiple python versions."
> > @@ -33,8 +34,8 @@ help:
> >       @echo "    and install the qemu package in editable mode."
> >       @echo "    (Can be used in or outside of a venv.)"
> >       @echo ""
> > -     @echo "make pipenv"
> > -     @echo "    Creates pipenv's virtual environment (.venv)"
> > +     @echo "make min-venv"
> > +     @echo "    Creates the minreqs virtual environment ($(QEMU_MINVEN=
V_DIR))"
> >       @echo ""
> >       @echo "make dev-venv"
> >       @echo "    Creates a simple venv for check-dev. ($(QEMU_VENV_DIR)=
)"
> > @@ -43,21 +44,38 @@ help:
> >       @echo "    Remove package build output."
> >       @echo ""
> >       @echo "make distclean:"
> > -     @echo "    remove pipenv/venv files, qemu package forwarder,"
> > +     @echo "    remove venv files, qemu package forwarder,"
> >       @echo "    built distribution files, and everything from 'make cl=
ean'."
> >       @echo ""
> >       @echo -e "Have a nice day ^_^\n"
> >
> > -.PHONY: pipenv
> > -pipenv: .venv
> > -.venv: Pipfile.lock
> > -     @PIPENV_VENV_IN_PROJECT=3D1 pipenv sync --dev --keep-outdated
> > -     rm -f pyproject.toml
> > -     @touch .venv
> > +.PHONY: pipenv check-pipenv
> > +pipenv check-pipenv:
> > +     @echo "pipenv was dropped; try 'make check-minreqs' or 'make min-=
venv'"
> > +     @exit 1
> >
> > -.PHONY: check-pipenv
> > -check-pipenv: pipenv
> > -     @pipenv run make check
> > +.PHONY: min-venv
> > +min-venv: $(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate
> > +$(QEMU_MINVENV_DIR) $(QEMU_MINVENV_DIR)/bin/activate: setup.cfg tests/=
minreqs.txt
> > +     @echo "VENV $(QEMU_MINVENV_DIR)"
> > +     @python3.6 -m venv $(QEMU_MINVENV_DIR)
> > +     @(                                                              \
> > +             echo "ACTIVATE $(QEMU_MINVENV_DIR)";                    \
> > +             . $(QEMU_MINVENV_DIR)/bin/activate;                     \
> > +             echo "INSTALL -r tests/minreqs.txt $(QEMU_MINVENV_DIR)";\
> > +             pip install -r tests/minreqs.txt 1>/dev/null;           \
> > +             echo "INSTALL -e qemu $(QEMU_MINVENV_DIR)";             \
> > +             pip install -e . 1>/dev/null;                           \
> > +     )
> > +     @touch $(QEMU_MINVENV_DIR)
> > +
> > +.PHONY: check-minreqs
> > +check-minreqs: min-venv
> > +     @(                                                      \
> > +             echo "ACTIVATE $(QEMU_MINVENV_DIR)";            \
> > +             . $(QEMU_MINVENV_DIR)/bin/activate;             \
> > +             make check;                                     \
> > +     )
> >
> >   .PHONY: dev-venv
> >   dev-venv: $(QEMU_VENV_DIR) $(QEMU_VENV_DIR)/bin/activate
> > @@ -106,6 +124,7 @@ clean:
> >
> >   .PHONY: distclean
> >   distclean: clean
> > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > +     rm -rf qemu.egg-info/ .eggs/ dist/
> > +     rm -rf $(QEMU_VENV_DIR) $(QEMU_MINVENV_DIR) .tox/
> >       rm -f .coverage .coverage.*
> >       rm -rf htmlcov/
> > diff --git a/python/Pipfile b/python/Pipfile
> > deleted file mode 100644
> > index e7acb8cefa4d..000000000000
> > --- a/python/Pipfile
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -[[source]]
> > -name =3D "pypi"
> > -url =3D "https://pypi.org/simple"
> > -verify_ssl =3D true
> > -
> > -[dev-packages]
> > -qemu =3D {editable =3D true, extras =3D ["devel"], path =3D "."}
> > -
> > -[packages]
> > -qemu =3D {editable =3D true,path =3D "."}
> > -
> > -[requires]
> > -python_version =3D "3.6"
> > diff --git a/python/Pipfile.lock b/python/Pipfile.lock
> > deleted file mode 100644
> > index ce46404ce084..000000000000
> > --- a/python/Pipfile.lock
> > +++ /dev/null
> > @@ -1,347 +0,0 @@
> > -{
> > -    "_meta": {
> > -        "hash": {
> > -            "sha256": "f1a25654d884a5b450e38d78b1f2e3ebb9073e421cc4358=
d4bbb83ac251a5670"
> > -        },
> > -        "pipfile-spec": 6,
> > -        "requires": {
> > -            "python_version": "3.6"
> > -        },
> > -        "sources": [
> > -            {
> > -                "name": "pypi",
> > -                "url": "https://pypi.org/simple",
> > -                "verify_ssl": true
> > -            }
> > -        ]
> > -    },
> > -    "default": {
> > -        "qemu": {
> > -            "editable": true,
> > -            "path": "."
> > -        }
> > -    },
> > -    "develop": {
> > -        "appdirs": {
> > -            "hashes": [
> > -                "sha256:7d5d0167b2b1ba821647616af46a749d1c653740dd0d24=
15100fe26e27afdf41",
> > -                "sha256:a841dacd6b99318a741b166adb07e19ee71a274450e682=
37b4650ca1055ab128"
> > -            ],
> > -            "version": "=3D=3D1.4.4"
> > -        },
> > -        "astroid": {
> > -            "hashes": [
> > -                "sha256:09bdb456e02564731f8b5957cdd0c98a7f01d2db5e90eb=
1d794c353c28bfd705",
> > -                "sha256:6a8a51f64dae307f6e0c9db752b66a7951e282389d8362=
cc1d39a56f3feeb31d"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.6.0"
> > -        },
> > -        "avocado-framework": {
> > -            "hashes": [
> > -                "sha256:244cb569f8eb4e50a22ac82e1a2b2bba2458999f4281ef=
be2651bd415d59c65b",
> > -                "sha256:6f15998b67ecd0e7dde790c4de4dd249d6df52dfe6d5cc=
4e2dd6596df51c3583"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D90.0"
> > -        },
> > -        "distlib": {
> > -            "hashes": [
> > -                "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335f=
a28420463a6f799736",
> > -                "sha256:23e223426b28491b1ced97dc3bbe183027419dfc7982b4=
fa2f05d5f3ff10711c"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D0.3.2"
> > -        },
> > -        "filelock": {
> > -            "hashes": [
> > -                "sha256:18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cda=
add0f82159d6a6ff59",
> > -                "sha256:929b7d63ec5b7d6b71b0fa5ac14e030b3f70b75747cef1=
b10da9b879fef15836"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D3.0.12"
> > -        },
> > -        "flake8": {
> > -            "hashes": [
> > -                "sha256:6a35f5b8761f45c5513e3405f110a86bea57982c3b75b7=
66ce7b65217abe1670",
> > -                "sha256:c01f8a3963b3571a8e6bd7a4063359aff90749e160778e=
03817cd9b71c9e07d2"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D3.6.0"
> > -        },
> > -        "fusepy": {
> > -            "hashes": [
> > -                "sha256:10f5c7f5414241bffecdc333c4d3a725f1d6605cae6b4e=
af86a838ff49cdaf6c",
> > -                "sha256:a9f3a3699080ddcf0919fd1eb2cf743e1f5859ca54c201=
8632f939bdfac269ee"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.0.4"
> > -        },
> > -        "importlib-metadata": {
> > -            "hashes": [
> > -                "sha256:90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc=
5783edea9f9b077f83",
> > -                "sha256:dc15b2969b4ce36305c51eebe62d418ac7791e9a157911=
d58bfb1f9ccd8e2070"
> > -            ],
> > -            "markers": "python_version < '3.8'",
> > -            "version": "=3D=3D1.7.0"
> > -        },
> > -        "importlib-resources": {
> > -            "hashes": [
> > -                "sha256:54161657e8ffc76596c4ede7080ca68cb02962a2e074a2=
586b695a93a925d36e",
> > -                "sha256:e962bff7440364183203d179d7ae9ad90cb1f2b74dcb84=
300e88ecc42dca3351"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D5.1.4"
> > -        },
> > -        "isort": {
> > -            "hashes": [
> > -                "sha256:408e4d75d84f51b64d0824894afee44469eba34a4caee6=
21dc53799f80d71ccc",
> > -                "sha256:64022dea6a06badfa09b300b4dfe8ba968114a737919e8=
ed50aea1c288f078aa"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D5.1.2"
> > -        },
> > -        "lazy-object-proxy": {
> > -            "hashes": [
> > -                "sha256:17e0967ba374fc24141738c69736da90e94419338fd4c7=
c7bef01ee26b339653",
> > -                "sha256:1fee665d2638491f4d6e55bd483e15ef21f6c8c2095f23=
5fef72601021e64f61",
> > -                "sha256:22ddd618cefe54305df49e4c069fa65715be4ad0e78e8d=
252a33debf00f6ede2",
> > -                "sha256:24a5045889cc2729033b3e604d496c2b6f588c754f7a62=
027ad4437a7ecc4837",
> > -                "sha256:410283732af311b51b837894fa2f24f2c0039aa7f22013=
5192b38fcc42bd43d3",
> > -                "sha256:4732c765372bd78a2d6b2150a6e99d00a78ec963375f23=
6979c0626b97ed8e43",
> > -                "sha256:489000d368377571c6f982fba6497f2aa13c6d1facc406=
60963da62f5c379726",
> > -                "sha256:4f60460e9f1eb632584c9685bccea152f4ac2130e29978=
4dbaf9fae9f49891b3",
> > -                "sha256:5743a5ab42ae40caa8421b320ebf3a998f89c85cdc8376=
d6b2e00bd12bd1b587",
> > -                "sha256:85fb7608121fd5621cc4377a8961d0b32ccf84a7285b4f=
1d21988b2eae2868e8",
> > -                "sha256:9698110e36e2df951c7c36b6729e96429c9c32b3331989=
ef19976592c5f3c77a",
> > -                "sha256:9d397bf41caad3f489e10774667310d73cb9c4258e9aed=
94b9ec734b34b495fd",
> > -                "sha256:b579f8acbf2bdd9ea200b1d5dea36abd93cabf56cf626a=
b9c744a432e15c815f",
> > -                "sha256:b865b01a2e7f96db0c5d12cfea590f98d8c5ba64ad2223=
00d93ce6ff9138bcad",
> > -                "sha256:bf34e368e8dd976423396555078def5cfc3039ebc6fc06=
d1ae2c5a65eebbcde4",
> > -                "sha256:c6938967f8528b3668622a9ed3b31d145fab161a32f589=
1ea7b84f6b790be05b",
> > -                "sha256:d1c2676e3d840852a2de7c7d5d76407c772927addff8d7=
42b9808fe0afccebdf",
> > -                "sha256:d7124f52f3bd259f510651450e18e0fd081ed82f3c0854=
1dffc7b94b883aa981",
> > -                "sha256:d900d949b707778696fdf01036f58c9876a0d8bfe116e8=
d220cfd4b15f14e741",
> > -                "sha256:ebfd274dcd5133e0afae738e6d9da4323c3eb021b3e130=
52d8cbd0e457b1256e",
> > -                "sha256:ed361bb83436f117f9917d282a456f9e5009ea12fd6de8=
742d1a4752c3017e93",
> > -                "sha256:f5144c75445ae3ca2057faac03fda5a902eff196702b0a=
24daf1d6ce0650514b"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D1.6.0"
> > -        },
> > -        "mccabe": {
> > -            "hashes": [
> > -                "sha256:ab8a6258860da4b6677da4bd2fe5dc2c659cff31b3ee4f=
7f5d64e79735b80d42",
> > -                "sha256:dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd=
87eb0f125271b8831f"
> > -            ],
> > -            "version": "=3D=3D0.6.1"
> > -        },
> > -        "mypy": {
> > -            "hashes": [
> > -                "sha256:00cb1964a7476e871d6108341ac9c1a857d6bd20bf5877=
f4773ac5e9d92cd3cd",
> > -                "sha256:127de5a9b817a03a98c5ae8a0c46a20dc44442af6dcfa2=
ae7f96cb519b312efa",
> > -                "sha256:1f3976a945ad7f0a0727aafdc5651c2d3278e3c88dee94=
e2bf75cd3386b7b2f4",
> > -                "sha256:2f8c098f12b402c19b735aec724cc9105cc1a9eea405d0=
8814eb4b14a6fb1a41",
> > -                "sha256:4ef13b619a289aa025f2273e05e755f8049bb4eaba6d70=
3a425de37d495d178d",
> > -                "sha256:5d142f219bf8c7894dfa79ebfb7d352c4c63a325e75f10=
dfb4c3db9417dcd135",
> > -                "sha256:62eb5dd4ea86bda8ce386f26684f7f26e4bfe6283c9f2b=
6ca6d17faf704dcfad",
> > -                "sha256:64c36eb0936d0bfb7d8da49f92c18e312ad2e3ed46e554=
8ae4ca997b0d33bd59",
> > -                "sha256:75eed74d2faf2759f79c5f56f17388defd2fc994222312=
ec54ee921e37b31ad4",
> > -                "sha256:974bebe3699b9b46278a7f076635d219183da26e1a675c=
1f8243a69221758273",
> > -                "sha256:a5e5bb12b7982b179af513dddb06fca12285f0316d74f3=
964078acbfcf4c68f2",
> > -                "sha256:d31291df31bafb997952dc0a17ebb2737f802c754aed31=
dd155a8bfe75112c57",
> > -                "sha256:d3b4941de44341227ece1caaf5b08b23e42ad4eeb8b603=
219afb11e9d4cfb437",
> > -                "sha256:eadb865126da4e3c4c95bdb47fe1bb087a3e3ea14d39a3=
b13224b8a4d9f9a102"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D0.780"
> > -        },
> > -        "mypy-extensions": {
> > -            "hashes": [
> > -                "sha256:090fedd75945a69ae91ce1303b5824f428daf5a028d2f6=
ab8a299250a846f15d",
> > -                "sha256:2d82818f5bb3e369420cb3c4060a7970edba416647068e=
b4c5343488a6c604a8"
> > -            ],
> > -            "version": "=3D=3D0.4.3"
> > -        },
> > -        "packaging": {
> > -            "hashes": [
> > -                "sha256:5b327ac1320dc863dca72f4514ecc086f31186744b84a2=
30374cc1fd776feae5",
> > -                "sha256:67714da7f7bc052e064859c05c595155bd1ee9f69f7655=
7e21f051443c20947a"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D20.9"
> > -        },
> > -        "pluggy": {
> > -            "hashes": [
> > -                "sha256:15b2acde666561e1298d71b523007ed7364de07029219b=
604cf808bfa1c765b0",
> > -                "sha256:966c145cd83c96502c3c3868f50408687b38434af77734=
af1e9ca461a4081d2d"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D0.13.1"
> > -        },
> > -        "py": {
> > -            "hashes": [
> > -                "sha256:21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f81=
7e7a809035269e1bd3",
> > -                "sha256:3b80836aa6d1feeaa108e046da6423ab8f6ceda6468545=
ae8d02d9d58d18818a"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D1.10.0"
> > -        },
> > -        "pycodestyle": {
> > -            "hashes": [
> > -                "sha256:74abc4e221d393ea5ce1f129ea6903209940c1ecd29e00=
2e8c6933c2b21026e0",
> > -                "sha256:cbc619d09254895b0d12c2c691e237b2e91e9b2ecf5e84=
c26b35400f93dcfb83",
> > -                "sha256:cbfca99bd594a10f674d0cd97a3d802a1fdef635d4361e=
1a2658de47ed261e3a"
> > -            ],
> > -            "version": "=3D=3D2.4.0"
> > -        },
> > -        "pyflakes": {
> > -            "hashes": [
> > -                "sha256:9a7662ec724d0120012f6e29d6248ae3727d821bba522a=
0e6b356eff19126a49",
> > -                "sha256:f661252913bc1dbe7fcfcbf0af0db3f42ab65aabd1a6ca=
68fe5d466bace94dae"
> > -            ],
> > -            "version": "=3D=3D2.0.0"
> > -        },
> > -        "pygments": {
> > -            "hashes": [
> > -                "sha256:a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38=
ed15aef65f0545519f",
> > -                "sha256:d66e804411278594d764fc69ec36ec13d9ae9147193a17=
40cd34d272ca383b8e"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.9.0"
> > -        },
> > -        "pylint": {
> > -            "hashes": [
> > -                "sha256:082a6d461b54f90eea49ca90fff4ee8b6e45e8029e5dbd=
72f6107ef84f3779c0",
> > -                "sha256:a01cd675eccf6e25b3bdb42be184eb46aaf89187d612ba=
0fb5f93328ed6b0fd5"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.8.0"
> > -        },
> > -        "pyparsing": {
> > -            "hashes": [
> > -                "sha256:c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5=
f8ead507bc3246ecc1",
> > -                "sha256:ef9d7589ef3c200abe66653d3f1ab1033c3c419ae9b9bd=
b1240a85b024efc88b"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.4.7"
> > -        },
> > -        "qemu": {
> > -            "editable": true,
> > -            "path": "."
> > -        },
> > -        "setuptools": {
> > -            "hashes": [
> > -                "sha256:22c7348c6d2976a52632c67f7ab0cdf40147db7789f9ae=
d18734643fe9cf3373",
> > -                "sha256:4ce92f1e1f8f01233ee9952c04f6b81d1e02939d6e1b48=
8428154974a4d0783e"
> > -            ],
> > -            "markers": "python_version >=3D '3.6'",
> > -            "version": "=3D=3D59.6.0"
> > -        },
> > -        "six": {
> > -            "hashes": [
> > -                "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892=
072e49de9c60c4c926",
> > -                "sha256:8abb2f1d86890a2dfb989f9a77cfcfd3e47c2a354b0111=
1771326f8aa26e0254"
> > -            ],
> > -            "markers": "python_version >=3D '2.7' and python_version n=
ot in '3.0, 3.1, 3.2, 3.3'",
> > -            "version": "=3D=3D1.16.0"
> > -        },
> > -        "toml": {
> > -            "hashes": [
> > -                "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b563=
0894a5f779cabb4f9b",
> > -                "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b7492=
00bded2f839ccbe68f"
> > -            ],
> > -            "markers": "python_version >=3D '2.6' and python_version n=
ot in '3.0, 3.1, 3.2, 3.3'",
> > -            "version": "=3D=3D0.10.2"
> > -        },
> > -        "tox": {
> > -            "hashes": [
> > -                "sha256:c60692d92fe759f46c610ac04c03cf0169432d1ff8e981=
e8ae63e068d0954fc3",
> > -                "sha256:f179cb4043d7dc1339425dd49ab1dd8c916246b0d91731=
43c1b0af7498a03ab0"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D3.18.0"
> > -        },
> > -        "typed-ast": {
> > -            "hashes": [
> > -                "sha256:01ae5f73431d21eead5015997ab41afa53aa1fbe252f9d=
a060be5dad2c730ace",
> > -                "sha256:067a74454df670dcaa4e59349a2e5c81e567d8d65458d4=
80a5b3dfecec08c5ff",
> > -                "sha256:0fb71b8c643187d7492c1f8352f2c15b4c4af3f6338f21=
681d3681b3dc31a266",
> > -                "sha256:1b3ead4a96c9101bef08f9f7d1217c096f31667617b58d=
e957f690c92378b528",
> > -                "sha256:2068531575a125b87a41802130fa7e29f26c09a2833fea=
68d9a40cf33902eba6",
> > -                "sha256:209596a4ec71d990d71d5e0d312ac935d86930e6eecff6=
ccc7007fe54d703808",
> > -                "sha256:2c726c276d09fc5c414693a2de063f521052d9ea7c240c=
e553316f70656c84d4",
> > -                "sha256:398e44cd480f4d2b7ee8d98385ca104e35c81525dd98c5=
19acff1b79bdaac363",
> > -                "sha256:52b1eb8c83f178ab787f3a4283f68258525f8d70f778a2=
f6dd54d3b5e5fb4341",
> > -                "sha256:5feca99c17af94057417d744607b82dd0a664fd5e4ca98=
061480fd8b14b18d04",
> > -                "sha256:7538e495704e2ccda9b234b82423a4038f324f3a10c43b=
c088a1636180f11a41",
> > -                "sha256:760ad187b1041a154f0e4d0f6aae3e40fdb51d6de16e5c=
99aedadd9246450e9e",
> > -                "sha256:777a26c84bea6cd934422ac2e3b78863a37017618b6e5c=
08f92ef69853e765d3",
> > -                "sha256:95431a26309a21874005845c21118c83991c63ea800dd4=
4843e42a916aec5899",
> > -                "sha256:9ad2c92ec681e02baf81fdfa056fe0d818645efa9af1f1=
cd5fd6f1bd2bdfd805",
> > -                "sha256:9c6d1a54552b5330bc657b7ef0eae25d00ba7ffe85d9ea=
8ae6540d2197a3788c",
> > -                "sha256:aee0c1256be6c07bd3e1263ff920c325b59849dc95392a=
05f258bb9b259cf39c",
> > -                "sha256:af3d4a73793725138d6b334d9d247ce7e5f084d96284ed=
23f22ee626a7b88e39",
> > -                "sha256:b36b4f3920103a25e1d5d024d155c504080959582b928e=
91cb608a65c3a49e1a",
> > -                "sha256:b9574c6f03f685070d859e75c7f9eeca02d6933273b5e6=
9572e5ff9d5e3931c3",
> > -                "sha256:bff6ad71c81b3bba8fa35f0f1921fb24ff4476235a6e94=
a26ada2e54370e6da7",
> > -                "sha256:c190f0899e9f9f8b6b7863debfb739abcb21a5c054f911=
ca3596d12b8a4c4c7f",
> > -                "sha256:c907f561b1e83e93fad565bac5ba9c22d96a54e7ea0267=
c708bffe863cbe4075",
> > -                "sha256:cae53c389825d3b46fb37538441f75d6aecc4174f615d0=
48321b716df2757fb0",
> > -                "sha256:dd4a21253f42b8d2b48410cb31fe501d32f8b9fbeb1f55=
063ad102fe9c425e40",
> > -                "sha256:dde816ca9dac1d9c01dd504ea5967821606f02e5104381=
20091b84e852367428",
> > -                "sha256:f2362f3cb0f3172c42938946dbc5b7843c2a28aec307c4=
9100c8b38764eb6927",
> > -                "sha256:f328adcfebed9f11301eaedfa48e15bdece9b519fb27e6=
a8c01aa52a17ec31b3",
> > -                "sha256:f8afcf15cc511ada719a88e013cec87c11aff7b91f0192=
95eb4530f96fe5ef2f",
> > -                "sha256:fb1bbeac803adea29cedd70781399c99138358c26d05fc=
bd23c13016b7f5ec65"
> > -            ],
> > -            "markers": "python_version < '3.8' and implementation_name=
 =3D=3D 'cpython'",
> > -            "version": "=3D=3D1.4.3"
> > -        },
> > -        "typing-extensions": {
> > -            "hashes": [
> > -                "sha256:0ac0f89795dd19de6b97debb0c6af1c70987fd80a2d62d=
1958f7e56fcc31b497",
> > -                "sha256:50b6f157849174217d0656f99dc82fe932884fb250826c=
18350e159ec6cdf342",
> > -                "sha256:779383f6086d90c99ae41cf0ff39aac8a7937a9283ce0a=
414e5dd782f4c94a84"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D3.10.0.0"
> > -        },
> > -        "urwid": {
> > -            "hashes": [
> > -                "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f=
51efe318a3f2127eae"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D2.1.2"
> > -        },
> > -        "urwid-readline": {
> > -            "hashes": [
> > -                "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9=
c569aac3bded1efaf4"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D0.13"
> > -        },
> > -        "virtualenv": {
> > -            "hashes": [
> > -                "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f54=
15fa2f1606010ab467",
> > -                "sha256:2b0126166ea7c9c3661f5b8e06773d28f83322de7a3ff7=
d06f0aed18c9de6a76"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D20.4.7"
> > -        },
> > -        "wrapt": {
> > -            "hashes": [
> > -                "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a0=
82ec1eb88e6d9b97d7"
> > -            ],
> > -            "version": "=3D=3D1.12.1"
> > -        },
> > -        "zipp": {
> > -            "hashes": [
> > -                "sha256:3607921face881ba3e026887d8150cca609d517579abe0=
52ac81fc5aeffdbd76",
> > -                "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29=
abea5a63edc3e03098"
> > -            ],
> > -            "index": "pypi",
> > -            "version": "=3D=3D3.4.1"
> > -        }
> > -    }
> > -}
> > diff --git a/python/README.rst b/python/README.rst
> > index 9c1fceaee73b..d62e71528d24 100644
> > --- a/python/README.rst
> > +++ b/python/README.rst
> > @@ -77,9 +77,6 @@ Files in this directory
> >   - ``MANIFEST.in`` is read by python setuptools, it specifies addition=
al files
> >     that should be included by a source distribution.
> >   - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.=
org.
> > -- ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
> > -- ``Pipfile.lock`` is a set of pinned package dependencies that this p=
ackage
> > -  is tested under in our CI suite. It is used by ``make check-pipenv``=
.
> >   - ``README.rst`` you are here!
> >   - ``VERSION`` contains the PEP-440 compliant version used to describe
> >     this package; it is referenced by ``setup.cfg``.
> > diff --git a/python/setup.cfg b/python/setup.cfg
> > index 564181570654..9e923d97628f 100644
> > --- a/python/setup.cfg
> > +++ b/python/setup.cfg
> > @@ -33,9 +33,7 @@ packages =3D
> >   * =3D py.typed
> >
> >   [options.extras_require]
> > -# For the devel group, When adding new dependencies or bumping the min=
imum
> > -# version, use e.g. "pipenv install --dev pylint=3D=3D3.0.0".
> > -# Subsequently, edit 'Pipfile' to remove e.g. 'pylint =3D "=3D=3D3.0.0=
'.
> > +# Remember to update tests/minreqs.txt if changing anything below:
> >   devel =3D
> >       avocado-framework >=3D 90.0
>
> Here >=3D 90,

Yes. The "devel" group for the python packages here requires
avocado-framework 90.0 or better... to run the tests *on the python
package*.

>
> >       flake8 >=3D 3.6.0
> > diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
> > new file mode 100644
> > index 000000000000..dfb8abb155f4
> > --- /dev/null
> > +++ b/python/tests/minreqs.txt
> > @@ -0,0 +1,45 @@
> > +# This file lists the ***oldest possible dependencies*** needed to run
> > +# "make check" successfully under ***Python 3.6***. It is used primari=
ly
> > +# by GitLab CI to ensure that our stated minimum versions in setup.cfg
> > +# are truthful and regularly validated.
> > +#
> > +# This file should not contain any dependencies that are not expressed
> > +# by the [devel] section of setup.cfg, except for transitive
> > +# dependencies which must be enumerated here explicitly to eliminate
> > +# dependency resolution ambiguity.
> > +#
> > +# When adding new dependencies, pin the very oldest non-yanked version
> > +# on PyPI that allows the test suite to pass.
> > +
> > +# Dependencies for the TUI addon (Required for successful linting)
> > +urwid=3D=3D2.1.2
> > +urwid-readline=3D=3D0.13
> > +Pygments=3D=3D2.9.0
> > +
> > +# Dependencies for FUSE support for qom-fuse
> > +fusepy=3D=3D2.0.4
> > +
> > +# Test-runners, utilities, etc.
> > +avocado-framework=3D=3D90.0
>
> ... and here =3D=3D 90.

Yes. This is the minimum requirements file for the purposes of testing
the python code via CI ("python-check-minreqs").
It installs *exactly* version 90.0 to ensure that there are no
avocado-framework features used in later versions that have
accidentally slipped in.

>
> Anyhow I'm surprised by unreviewed commit 4320f7172f
> ("python: bump avocado to v90.0") and we still have:

The implication being that it wouldn't have passed review?

>
> tests/requirements.txt:5:avocado-framework=3D=3D88.1

Developing the python code needs avocado >=3D 90,
running the avocado tests needs avocado=3D=3D88.1.

>
> 1/ How do you run Avocado tests out of tests/ ?

"make check-avocado", the same as anyone else, I assume.

>
> 2/ Can we use Avocado on Darwin/macOS now? I thought we
> needed one series from Cleber [*] for that, which is why
> QEMU is the last project using the 'old' runner (as opposed
> to the 'new' runner which is the upstream /current/ one).

I have no idea. I'm going to guess that you're wondering if you can
run the avocado *qemu* tests on Darwin/macOS, and I wouldn't know - I
don't develop avocado or those tests, and I don't have a mac.


