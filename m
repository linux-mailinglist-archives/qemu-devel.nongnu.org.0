Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6547F66BBA0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:23:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMdB-0002Si-PZ; Mon, 16 Jan 2023 05:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pHMd6-0002Rm-Kt
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pHMd2-0005bM-87
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673864528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mTAZqNfLU0iBqZH1CYKg4YMw8H+z+4lw5slwyyI9cOA=;
 b=WVolKpAHAfVnF2FpJvKmQo9+Pc8/C6pYfG4CEqNhUOKeYzeXGDOr6HrobyASE84bt7EKkk
 iapvWICZ2zBoPyti8+ZbJoGJ5J3Oof2/dFn6riwFmd8tL2Jyma1Zat2cy0PvquRbVtCW6k
 IS2ozb7TgLzhu50JDEyXLqZdUW4yRo8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-HCKkhIJdPsaDckksQM8mJQ-1; Mon, 16 Jan 2023 05:22:07 -0500
X-MC-Unique: HCKkhIJdPsaDckksQM8mJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso18849415edd.10
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 02:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mTAZqNfLU0iBqZH1CYKg4YMw8H+z+4lw5slwyyI9cOA=;
 b=0fYPS+O9JuY8F9mUgHWl1QD+MXUPx6SJsYSp5rqIrjYsKxrXcmFlbqrT91ND75HtyP
 ceqQ4bAUQGFEDuLJBY5luIylfo/F74VLPM9glE5+NE5nhHaIO1E4Jz0dJikos3pvRdSN
 8YcsBsu5+C9FTlwuOV61daMuAfCH455iwTIPRwJ4QTyEt+Fgg+Eo8AyOLLlCjH5nEKAb
 AXY56BBVw/hDvaifVfWL4nwlBeXQ/3uFY+vix/e/Fc82fuqraE9lXNlb1qkrp5mRmPm7
 A1TIty3gp6A57J66nsB3hi1BZqWxfFkZLBSBaG7RKOt/V0CARrlvFDDHgCEcnaaLEGwF
 43FA==
X-Gm-Message-State: AFqh2kp/GQqAQnHfZlOm9IqJj/rk0ZFtDDocmubi6ZxGvA4cZv9vDTAp
 ICUZboR0yJ9jQ9LSFxl1onkWw4i4KwwOI+LeUigv6MRiHdf6GQQ394pPQ7M6abNfwy8lBoD8PXV
 Mdo7vG5X1P/f2ngkwGcY19HIr3cYFKzU=
X-Received: by 2002:a05:6402:5293:b0:497:c96b:4de9 with SMTP id
 en19-20020a056402529300b00497c96b4de9mr2564698edb.237.1673864525873; 
 Mon, 16 Jan 2023 02:22:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3qpehxfYETE1sr7E1h4FRnW3CuDWX38CAmnwdGhFKQpU/uiTAc9n/5AINKboYJTHQhvgkGd41/G0iZUGRcfk=
X-Received: by 2002:a05:6402:5293:b0:497:c96b:4de9 with SMTP id
 en19-20020a056402529300b00497c96b4de9mr2564677edb.237.1673864525649; Mon, 16
 Jan 2023 02:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
 <87bkmyvljj.fsf@linaro.org>
In-Reply-To: <87bkmyvljj.fsf@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 16 Jan 2023 14:21:53 +0400
Message-ID: <CAMxuvawwnEo_KwbEWUTMWdnwFS83h_wv1vMpZeyrUt_nCt4aOA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] lcitool: drop texinfo from QEMU
 project/dependencies
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>, 
 Michael Roth <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000074338605f25ef48e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000074338605f25ef48e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jan 16, 2023 at 2:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> I'm not sure how but this is re-breaking the windows build you just fixed=
:
>
>   In file included from
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl.h:46,
>                    from /tmp/qemu-test/src/include/ui/egl-helpers.h:5,
>                    from /tmp/qemu-test/src/include/ui/gtk.h:25,
>                    from ../src/ui/gtk.c:42:
>
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:11:1=
0:
> fatal error: EGL/eglplatform.h: No such file or directory
>      11 | #include "EGL/eglplatform.h"
>         |          ^~~~~~~~~~~~~~~~~~~
>   compilation terminated.
>
> I'm going to drop this patch for now.
>

Why is this patch related?

How did you get that error? It looks like your system mingw-epoxy is bad
(on Fedora, I have
/usr/x86_64-w64-mingw32/sys-root/mingw/include/EGL/eglplatform.h installed
by mingw64-angleproject-3280-6.git57ea533.fc37.noarch)



>
> > ---
> >  .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
> >  .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
> >  .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
> >  tests/docker/dockerfiles/alpine.docker                | 1 -
> >  tests/docker/dockerfiles/centos8.docker               | 1 -
> >  tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 +--
> >  tests/docker/dockerfiles/debian-amd64.docker          | 1 -
> >  tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 +--
> >  tests/docker/dockerfiles/debian-armel-cross.docker    | 3 +--
> >  tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 +--
> >  tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +--
> >  tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 +--
> >  tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 +--
> >  tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 +--
> >  tests/docker/dockerfiles/debian-toolchain.docker      | 1 -
> >  tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
> >  tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
> >  tests/docker/dockerfiles/fedora.docker                | 1 -
> >  tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
> >  tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
> >  tests/lcitool/projects/qemu.yml                       | 1 -
> >  21 files changed, 11 insertions(+), 29 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars
> b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > index f32f01a954..8934e5d57f 100644
> > --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> > +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> > @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
> >  NINJA=3D'/usr/local/bin/ninja'
> >  PACKAGING_COMMAND=3D'pkg'
> >  PIP3=3D'/usr/local/bin/pip-3.8'
> > -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex
> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libf=
fi
> libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1
> llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy
> py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3
> rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo
> usbredir virglrenderer vte3 zstd'
> > +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex
> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libf=
fi
> libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1
> llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy
> py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3
> rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir
> virglrenderer vte3 zstd'
> >  PYPI_PKGS=3D''
> >  PYTHON=3D'/usr/local/bin/python3'
> > diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars
> b/.gitlab-ci.d/cirrus/freebsd-13.vars
> > index 813c051616..65ce456c48 100644
> > --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> > +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> > @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
> >  NINJA=3D'/usr/local/bin/ninja'
> >  PACKAGING_COMMAND=3D'pkg'
> >  PIP3=3D'/usr/local/bin/pip-3.8'
> > -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex
> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libf=
fi
> libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1
> llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy
> py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3
> rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract texinfo
> usbredir virglrenderer vte3 zstd'
> > +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache
> cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex
> fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libf=
fi
> libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1
> llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy
> py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3
> rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol tesseract usbredir
> virglrenderer vte3 zstd'
> >  PYPI_PKGS=3D''
> >  PYTHON=3D'/usr/local/bin/python3'
> > diff --git a/.gitlab-ci.d/cirrus/macos-12.vars
> b/.gitlab-ci.d/cirrus/macos-12.vars
> > index 33bb4e1040..65b78fa08f 100644
> > --- a/.gitlab-ci.d/cirrus/macos-12.vars
> > +++ b/.gitlab-ci.d/cirrus/macos-12.vars
> > @@ -11,6 +11,6 @@ MAKE=3D'/opt/homebrew/bin/gmake'
> >  NINJA=3D'/opt/homebrew/bin/ninja'
> >  PACKAGING_COMMAND=3D'brew'
> >  PIP3=3D'/opt/homebrew/bin/pip3'
> > -PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus
> diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc
> jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libsli=
rp
> libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman
> pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol
> tesseract texinfo usbredir vde vte3 zlib zstd'
> > +PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus
> diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc
> jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libsli=
rp
> libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman
> pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol
> tesseract usbredir vde vte3 zlib zstd'
> >  PYPI_PKGS=3D'PyYAML numpy pillow sphinx sphinx-rtd-theme'
> >  PYTHON=3D'/opt/homebrew/bin/python3'
> > diff --git a/tests/docker/dockerfiles/alpine.docker
> b/tests/docker/dockerfiles/alpine.docker
> > index 3293c790c9..4a569d82f6 100644
> > --- a/tests/docker/dockerfiles/alpine.docker
> > +++ b/tests/docker/dockerfiles/alpine.docker
> > @@ -99,7 +99,6 @@ RUN apk update && \
> >          spice-protocol \
> >          tar \
> >          tesseract-ocr \
> > -        texinfo \
> >          usbredir-dev \
> >          util-linux \
> >          vde2-dev \
> > diff --git a/tests/docker/dockerfiles/centos8.docker
> b/tests/docker/dockerfiles/centos8.docker
> > index f13745e6cc..fbc953c6dc 100644
> > --- a/tests/docker/dockerfiles/centos8.docker
> > +++ b/tests/docker/dockerfiles/centos8.docker
> > @@ -110,7 +110,6 @@ RUN dnf distro-sync -y && \
> >          systemd-devel \
> >          systemtap-sdt-devel \
> >          tar \
> > -        texinfo \
> >          usbredir-devel \
> >          util-linux \
> >          virglrenderer-devel \
> > diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker
> b/tests/docker/dockerfiles/debian-amd64-cross.docker
> > index d0ace6d0f7..5175095a85 100644
> > --- a/tests/docker/dockerfiles/debian-amd64-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-amd64.docker
> b/tests/docker/dockerfiles/debian-amd64.docker
> > index 0517c4c315..b61f664ea2 100644
> > --- a/tests/docker/dockerfiles/debian-amd64.docker
> > +++ b/tests/docker/dockerfiles/debian-amd64.docker
> > @@ -125,7 +125,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        tar \
> >                        tesseract-ocr \
> >                        tesseract-ocr-eng \
> > -                      texinfo \
> >                        xfslibs-dev \
> >                        zlib1g-dev && \
> >      eatmydata apt-get autoremove -y && \
> > diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker
> b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > index 9ac1c1ba3f..b69958c69f 100644
> > --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker
> b/tests/docker/dockerfiles/debian-armel-cross.docker
> > index 8be492f4ad..96b524fab6 100644
> > --- a/tests/docker/dockerfiles/debian-armel-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-armel-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker
> b/tests/docker/dockerfiles/debian-armhf-cross.docker
> > index da789e04af..08a75cebdb 100644
> > --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker
> b/tests/docker/dockerfiles/debian-mips64el-cross.docker
> > index 8b7c59c4f9..5930e6fa5d 100644
> > --- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker
> b/tests/docker/dockerfiles/debian-mipsel-cross.docker
> > index f9f1ed5fd2..c65d9830e7 100644
> > --- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> > index e423d88c2d..2ae56c978e 100644
> > --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker
> b/tests/docker/dockerfiles/debian-s390x-cross.docker
> > index c1134f4cec..0db86a0fcd 100644
> > --- a/tests/docker/dockerfiles/debian-s390x-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
> > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        sparse \
> >                        tar \
> >                        tesseract-ocr \
> > -                      tesseract-ocr-eng \
> > -                      texinfo && \
> > +                      tesseract-ocr-eng && \
> >      eatmydata apt-get autoremove -y && \
> >      eatmydata apt-get autoclean -y && \
> >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> > diff --git a/tests/docker/dockerfiles/debian-toolchain.docker
> b/tests/docker/dockerfiles/debian-toolchain.docker
> > index d3d4d3344e..6c73408b34 100644
> > --- a/tests/docker/dockerfiles/debian-toolchain.docker
> > +++ b/tests/docker/dockerfiles/debian-toolchain.docker
> > @@ -21,7 +21,6 @@ RUN apt update && \
> >          libmpc-dev \
> >          libmpfr-dev \
> >          rsync \
> > -        texinfo \
> >          wget && \
> >      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> >      apt build-dep -yy --arch-only gcc glibc
> > diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker
> b/tests/docker/dockerfiles/fedora-win32-cross.docker
> > index de811b332b..b659c0b8a8 100644
> > --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> > +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> > @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
> >                 tar \
> >                 tesseract \
> >                 tesseract-langpack-eng \
> > -               texinfo \
> >                 util-linux \
> >                 which && \
> >      nosync dnf autoremove -y && \
> > diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker
> b/tests/docker/dockerfiles/fedora-win64-cross.docker
> > index 71681d6f92..0a404c15bf 100644
> > --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> > +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> > @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
> >                 tar \
> >                 tesseract \
> >                 tesseract-langpack-eng \
> > -               texinfo \
> >                 util-linux \
> >                 which && \
> >      nosync dnf autoremove -y && \
> > diff --git a/tests/docker/dockerfiles/fedora.docker
> b/tests/docker/dockerfiles/fedora.docker
> > index ca3793b04b..5d60a96141 100644
> > --- a/tests/docker/dockerfiles/fedora.docker
> > +++ b/tests/docker/dockerfiles/fedora.docker
> > @@ -121,7 +121,6 @@ exec "$@"' > /usr/bin/nosync && \
> >                 tar \
> >                 tesseract \
> >                 tesseract-langpack-eng \
> > -               texinfo \
> >                 usbredir-devel \
> >                 util-linux \
> >                 virglrenderer-devel \
> > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
> b/tests/docker/dockerfiles/opensuse-leap.docker
> > index 680f49e7dc..4b2c02d6ab 100644
> > --- a/tests/docker/dockerfiles/opensuse-leap.docker
> > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> > @@ -111,7 +111,6 @@ RUN zypper update -y && \
> >             tar \
> >             tesseract-ocr \
> >             tesseract-ocr-traineddata-english \
> > -           texinfo \
> >             usbredir-devel \
> >             util-linux \
> >             virglrenderer-devel \
> > diff --git a/tests/docker/dockerfiles/ubuntu2004.docker
> b/tests/docker/dockerfiles/ubuntu2004.docker
> > index 6594bba338..13ab0b6887 100644
> > --- a/tests/docker/dockerfiles/ubuntu2004.docker
> > +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> > @@ -124,7 +124,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> >                        tar \
> >                        tesseract-ocr \
> >                        tesseract-ocr-eng \
> > -                      texinfo \
> >                        xfslibs-dev \
> >                        zlib1g-dev && \
> >      eatmydata apt-get autoremove -y && \
> > diff --git a/tests/lcitool/projects/qemu.yml
> b/tests/lcitool/projects/qemu.yml
> > index c2af92348a..6467bcf08a 100644
> > --- a/tests/lcitool/projects/qemu.yml
> > +++ b/tests/lcitool/projects/qemu.yml
> > @@ -109,7 +109,6 @@ packages:
> >   - tar
> >   - tesseract
> >   - tesseract-eng
> > - - texinfo
> >   - usbredir
> >   - virglrenderer
> >   - vte
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--00000000000074338605f25ef48e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 16, 2023 at 2:08 PM Ale=
x Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.=
lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
I&#39;m not sure how but this is re-breaking the windows build you just fix=
ed:<br>
<br>
=C2=A0 In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include=
/epoxy/egl.h:46,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /=
tmp/qemu-test/src/include/ui/egl-helpers.h:5,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /=
tmp/qemu-test/src/include/ui/gtk.h:25,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from .=
./src/ui/gtk.c:42:<br>
=C2=A0 /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h=
:11:10: fatal error: EGL/eglplatform.h: No such file or directory<br>
=C2=A0 =C2=A0 =C2=A011 | #include &quot;EGL/eglplatform.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~<br>
=C2=A0 compilation terminated.<br>
<br>
I&#39;m going to drop this patch for now.<br></blockquote><div><br></div><d=
iv>Why is this patch related?</div><div><br></div><div>How did you get that=
 error? It looks like your system mingw-epoxy is bad (on Fedora, I have /us=
r/x86_64-w64-mingw32/sys-root/mingw/include/EGL/eglplatform.h installed by =
mingw64-angleproject-3280-6.git57ea533.fc37.noarch)</div><div><br></div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; ---<br>
&gt;=C2=A0 .gitlab-ci.d/cirrus/freebsd-12.vars=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .gitlab-ci.d/cirrus/freebsd-13.vars=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 .gitlab-ci.d/cirrus/macos-12.vars=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 tests/docker/dockerfiles/alpine.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/centos8.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-amd64-cross.docker=C2=A0 =C2=A0 =
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-amd64.docker=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-arm64-cross.docker=C2=A0 =C2=A0 =
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-armel-cross.docker=C2=A0 =C2=A0 =
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-armhf-cross.docker=C2=A0 =C2=A0 =
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +--<br=
>
&gt;=C2=A0 tests/docker/dockerfiles/debian-mipsel-cross.docker=C2=A0 =C2=A0=
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-ppc64el-cross.docker=C2=A0 | 3 +=
--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-s390x-cross.docker=C2=A0 =C2=A0 =
| 3 +--<br>
&gt;=C2=A0 tests/docker/dockerfiles/debian-toolchain.docker=C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora-win32-cross.docker=C2=A0 =C2=A0 =
| 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora-win64-cross.docker=C2=A0 =C2=A0 =
| 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/opensuse-leap.docker=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 tests/docker/dockerfiles/ubuntu2004.docker=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 tests/lcitool/projects/qemu.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 21 files changed, 11 insertions(+), 29 deletions(-)<br>
&gt;<br>
&gt; diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus=
/freebsd-12.vars<br>
&gt; index f32f01a954..8934e5d57f 100644<br>
&gt; --- a/.gitlab-ci.d/cirrus/freebsd-12.vars<br>
&gt; +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars<br>
&gt; @@ -11,6 +11,6 @@ MAKE=3D&#39;/usr/local/bin/gmake&#39;<br>
&gt;=C2=A0 NINJA=3D&#39;/usr/local/bin/ninja&#39;<br>
&gt;=C2=A0 PACKAGING_COMMAND=3D&#39;pkg&#39;<br>
&gt;=C2=A0 PIP3=3D&#39;/usr/local/bin/pip-3.8&#39;<br>
&gt; -PKGS=3D&#39;alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cd=
rkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusef=
s-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libg=
crypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lz=
o2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pil=
low py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio s=
dl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virgl=
renderer vte3 zstd&#39;<br>
&gt; +PKGS=3D&#39;alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cd=
rkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusef=
s-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libg=
crypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lz=
o2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pil=
low py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio s=
dl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer=
 vte3 zstd&#39;<br>
&gt;=C2=A0 PYPI_PKGS=3D&#39;&#39;<br>
&gt;=C2=A0 PYTHON=3D&#39;/usr/local/bin/python3&#39;<br>
&gt; diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus=
/freebsd-13.vars<br>
&gt; index 813c051616..65ce456c48 100644<br>
&gt; --- a/.gitlab-ci.d/cirrus/freebsd-13.vars<br>
&gt; +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars<br>
&gt; @@ -11,6 +11,6 @@ MAKE=3D&#39;/usr/local/bin/gmake&#39;<br>
&gt;=C2=A0 NINJA=3D&#39;/usr/local/bin/ninja&#39;<br>
&gt;=C2=A0 PACKAGING_COMMAND=3D&#39;pkg&#39;<br>
&gt;=C2=A0 PIP3=3D&#39;/usr/local/bin/pip-3.8&#39;<br>
&gt; -PKGS=3D&#39;alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cd=
rkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusef=
s-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libg=
crypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lz=
o2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pil=
low py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio s=
dl2 sdl2_image snappy sndio spice-protocol tesseract texinfo usbredir virgl=
renderer vte3 zstd&#39;<br>
&gt; +PKGS=3D&#39;alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cd=
rkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusef=
s-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libg=
crypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lz=
o2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pil=
low py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio s=
dl2 sdl2_image snappy sndio spice-protocol tesseract usbredir virglrenderer=
 vte3 zstd&#39;<br>
&gt;=C2=A0 PYPI_PKGS=3D&#39;&#39;<br>
&gt;=C2=A0 PYTHON=3D&#39;/usr/local/bin/python3&#39;<br>
&gt; diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/m=
acos-12.vars<br>
&gt; index 33bb4e1040..65b78fa08f 100644<br>
&gt; --- a/.gitlab-ci.d/cirrus/macos-12.vars<br>
&gt; +++ b/.gitlab-ci.d/cirrus/macos-12.vars<br>
&gt; @@ -11,6 +11,6 @@ MAKE=3D&#39;/opt/homebrew/bin/gmake&#39;<br>
&gt;=C2=A0 NINJA=3D&#39;/opt/homebrew/bin/ninja&#39;<br>
&gt;=C2=A0 PACKAGING_COMMAND=3D&#39;brew&#39;<br>
&gt;=C2=A0 PIP3=3D&#39;/opt/homebrew/bin/pip3&#39;<br>
&gt; -PKGS=3D&#39;bash bc bison bzip2 capstone ccache cmocka ctags curl dbu=
s diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc j=
peg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp =
libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-=
config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesser=
act texinfo usbredir vde vte3 zlib zstd&#39;<br>
&gt; +PKGS=3D&#39;bash bc bison bzip2 capstone ccache cmocka ctags curl dbu=
s diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc j=
peg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp =
libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-=
config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesser=
act usbredir vde vte3 zlib zstd&#39;<br>
&gt;=C2=A0 PYPI_PKGS=3D&#39;PyYAML numpy pillow sphinx sphinx-rtd-theme&#39=
;<br>
&gt;=C2=A0 PYTHON=3D&#39;/opt/homebrew/bin/python3&#39;<br>
&gt; diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/doc=
kerfiles/alpine.docker<br>
&gt; index 3293c790c9..4a569d82f6 100644<br>
&gt; --- a/tests/docker/dockerfiles/alpine.docker<br>
&gt; +++ b/tests/docker/dockerfiles/alpine.docker<br>
&gt; @@ -99,7 +99,6 @@ RUN apk update &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spice-protocol \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usbredir-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vde2-dev \<br>
&gt; diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/do=
ckerfiles/centos8.docker<br>
&gt; index f13745e6cc..fbc953c6dc 100644<br>
&gt; --- a/tests/docker/dockerfiles/centos8.docker<br>
&gt; +++ b/tests/docker/dockerfiles/centos8.docker<br>
&gt; @@ -110,7 +110,6 @@ RUN dnf distro-sync -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd-devel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemtap-sdt-devel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tar \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usbredir-devel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 util-linux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virglrenderer-devel \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/test=
s/docker/dockerfiles/debian-amd64-cross.docker<br>
&gt; index d0ace6d0f7..5175095a85 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-amd64-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-amd64-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/dock=
er/dockerfiles/debian-amd64.docker<br>
&gt; index 0517c4c315..b61f664ea2 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-amd64.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-amd64.docker<br>
&gt; @@ -125,7 +125,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&=
amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 xfslibs-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 zlib1g-dev &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/test=
s/docker/dockerfiles/debian-arm64-cross.docker<br>
&gt; index 9ac1c1ba3f..b69958c69f 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-arm64-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/test=
s/docker/dockerfiles/debian-armel-cross.docker<br>
&gt; index 8be492f4ad..96b524fab6 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-armel-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-armel-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/test=
s/docker/dockerfiles/debian-armhf-cross.docker<br>
&gt; index da789e04af..08a75cebdb 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-armhf-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/t=
ests/docker/dockerfiles/debian-mips64el-cross.docker<br>
&gt; index 8b7c59c4f9..5930e6fa5d 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-mips64el-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tes=
ts/docker/dockerfiles/debian-mipsel-cross.docker<br>
&gt; index f9f1ed5fd2..c65d9830e7 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-mipsel-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/te=
sts/docker/dockerfiles/debian-ppc64el-cross.docker<br>
&gt; index e423d88c2d..2ae56c978e 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/test=
s/docker/dockerfiles/debian-s390x-cross.docker<br>
&gt; index c1134f4cec..0db86a0fcd 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-s390x-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-s390x-cross.docker<br>
&gt; @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&am=
p; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sparse \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tesseract-ocr-eng &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoclean -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -Ei &#39;s,^# (en_US\.UTF-8 .*)$,\1,&#39; /etc=
/locale.gen &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/=
docker/dockerfiles/debian-toolchain.docker<br>
&gt; index d3d4d3344e..6c73408b34 100644<br>
&gt; --- a/tests/docker/dockerfiles/debian-toolchain.docker<br>
&gt; +++ b/tests/docker/dockerfiles/debian-toolchain.docker<br>
&gt; @@ -21,7 +21,6 @@ RUN apt update &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libmpc-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libmpfr-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsync \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wget &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEBIAN_FRONTEND=3Dnoninteractive eatmydata \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 apt build-dep -yy --arch-only gcc glibc<br>
&gt; diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/test=
s/docker/dockerfiles/fedora-win32-cross.docker<br>
&gt; index de811b332b..b659c0b8a8 100644<br>
&gt; --- a/tests/docker/dockerfiles/fedora-win32-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker<br>
&gt; @@ -57,7 +57,6 @@ exec &quot;$@&quot;&#39; &gt; /usr/bin/nosync &amp;&=
amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
-langpack-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linu=
x \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which &am=
p;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nosync dnf autoremove -y &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/test=
s/docker/dockerfiles/fedora-win64-cross.docker<br>
&gt; index 71681d6f92..0a404c15bf 100644<br>
&gt; --- a/tests/docker/dockerfiles/fedora-win64-cross.docker<br>
&gt; +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker<br>
&gt; @@ -57,7 +57,6 @@ exec &quot;$@&quot;&#39; &gt; /usr/bin/nosync &amp;&=
amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
-langpack-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linu=
x \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0which &am=
p;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nosync dnf autoremove -y &amp;&amp; \<br>
&gt; diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/doc=
kerfiles/fedora.docker<br>
&gt; index ca3793b04b..5d60a96141 100644<br>
&gt; --- a/tests/docker/dockerfiles/fedora.docker<br>
&gt; +++ b/tests/docker/dockerfiles/fedora.docker<br>
&gt; @@ -121,7 +121,6 @@ exec &quot;$@&quot;&#39; &gt; /usr/bin/nosync &amp=
;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract=
-langpack-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbredir-=
devel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linu=
x \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virglrend=
erer-devel \<br>
&gt; diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/doc=
ker/dockerfiles/opensuse-leap.docker<br>
&gt; index 680f49e7dc..4b2c02d6ab 100644<br>
&gt; --- a/tests/docker/dockerfiles/opensuse-leap.docker<br>
&gt; +++ b/tests/docker/dockerfiles/opensuse-leap.docker<br>
&gt; @@ -111,7 +111,6 @@ RUN zypper update -y &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract-ocr \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tesseract-ocr-trainedda=
ta-english \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usbredir-devel \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0util-linux \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virglrenderer-devel \<b=
r>
&gt; diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker=
/dockerfiles/ubuntu2004.docker<br>
&gt; index 6594bba338..13ab0b6887 100644<br>
&gt; --- a/tests/docker/dockerfiles/ubuntu2004.docker<br>
&gt; +++ b/tests/docker/dockerfiles/ubuntu2004.docker<br>
&gt; @@ -124,7 +124,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive &amp;&=
amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tar \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 tesseract-ocr-eng \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 texinfo \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 xfslibs-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 zlib1g-dev &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 eatmydata apt-get autoremove -y &amp;&amp; \<br>
&gt; diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/=
qemu.yml<br>
&gt; index c2af92348a..6467bcf08a 100644<br>
&gt; --- a/tests/lcitool/projects/qemu.yml<br>
&gt; +++ b/tests/lcitool/projects/qemu.yml<br>
&gt; @@ -109,7 +109,6 @@ packages:<br>
&gt;=C2=A0 =C2=A0- tar<br>
&gt;=C2=A0 =C2=A0- tesseract<br>
&gt;=C2=A0 =C2=A0- tesseract-eng<br>
&gt; - - texinfo<br>
&gt;=C2=A0 =C2=A0- usbredir<br>
&gt;=C2=A0 =C2=A0- virglrenderer<br>
&gt;=C2=A0 =C2=A0- vte<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div>

--00000000000074338605f25ef48e--


