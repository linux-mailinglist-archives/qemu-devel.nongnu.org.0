Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08E966C2DC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:55:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQre-0003tr-V8; Mon, 16 Jan 2023 09:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHQrc-0003tJ-Nm
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:53:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHQra-0001p8-11
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:53:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so22326833wms.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hem6wnvQ3CEm68NySn+4t0ECXW7yQAyXLFCo1Lh2W8g=;
 b=g/yDMSNn/dmercp4Cwm9+FeUHp+sLtF6ZP2T+6Ld4mtOj2ZgM0ig1gKZGBwKIC81vf
 nBWfbgaUmr727xeJ+Kc8azC3PcJnkTNzI7ytJHCh9jVMVu5GYm1JCwI6aaqLv5UTQHu4
 KrzDg/87XavjBiUX1i3FJJVbt4EBj4WRRG3xNXVYKFvD9OXM4rAIXfNbjFr09xbi2BrB
 7KmLL2niYrl3a9Y86a5Xkm/PweOSowcdtQZuJy2joujum39nkOyB1pfU4qZ7mRxhnneB
 LCXFOSlP9O1a3/q6jkYbDyrDcuWVqzkYpInSvCU3H3RmVOsc8rmSEM2rV7GDZR1kFaUK
 it4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hem6wnvQ3CEm68NySn+4t0ECXW7yQAyXLFCo1Lh2W8g=;
 b=We6LJdllRd5/GP0CdRnfQnr5Fg/cZhpsVsGpmm+yOFzFYb0bkQE530pMn5HgDf2ocX
 Fwr0ZiDYNBmGT1/cPEF5Cvc00EhpgG8ozd0QV/bkKMDdkPoKeKWjXM3X7PPQ3syodliM
 l3R8E/dAfhvMUJcZ3xiKfCDL++khXfMyS4Eio5FLgTassywWqyvW2UYjyA9vBU/HDnSp
 IYxsoA7KYCb6H19HjDl0tZJXjQtITRsMV4Jh8iURvuSQnKl4IuxpQZI5T92NfrVM3lMG
 21wQeWLtMb38QBLiit1GyqiKNDOBpR3s4uN5DiJmZmFAN9omL0kf8T39X4v9S8zyp43S
 Wouw==
X-Gm-Message-State: AFqh2kolXf54CylMHfVpurF1Uh6gx9uDNkqgIIG7lOwljbzCA42heNaI
 Dzz1fCMsAqm9X090glhBObwcWQ==
X-Google-Smtp-Source: AMrXdXsFipP98xBIbFzk+MVLIWI+4uw4thQnDRn8EZ8BH+HlsHt2Xp+y9hPoKsDSziJha4TEBLDI2Q==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id
 j1-20020a05600c1c0100b003dafc075e80mr3174437wms.12.1673880808286; 
 Mon, 16 Jan 2023 06:53:28 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c3ac600b003da0dc39872sm16422158wms.6.2023.01.16.06.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:53:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 488F51FFB7;
 Mon, 16 Jan 2023 14:53:26 +0000 (GMT)
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
 <87bkmyvljj.fsf@linaro.org>
 <CAMxuvawwnEo_KwbEWUTMWdnwFS83h_wv1vMpZeyrUt_nCt4aOA@mail.gmail.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John
 Snow <jsnow@redhat.com>, kraxel@redhat.com, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 thuth@redhat.com, Halil Pasic <pasic@linux.ibm.com>, Michael Roth
 <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 8/8] lcitool: drop texinfo from QEMU
 project/dependencies
Date: Mon, 16 Jan 2023 14:52:38 +0000
In-reply-to: <CAMxuvawwnEo_KwbEWUTMWdnwFS83h_wv1vMpZeyrUt_nCt4aOA@mail.gmail.com>
Message-ID: <87k01medjt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Mon, Jan 16, 2023 at 2:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>  marcandre.lureau@redhat.com writes:
>
>  > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>  >
>  > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>  I'm not sure how but this is re-breaking the windows build you just fixe=
d:
>
>    In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/e=
poxy/egl.h:46,
>                     from /tmp/qemu-test/src/include/ui/egl-helpers.h:5,
>                     from /tmp/qemu-test/src/include/ui/gtk.h:25,
>                     from ../src/ui/gtk.c:42:
>    /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:1=
1:10: fatal error:
>  EGL/eglplatform.h: No such file or directory
>       11 | #include "EGL/eglplatform.h"
>          |          ^~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
>  I'm going to drop this patch for now.
>
> Why is this patch related?
>
> How did you get that error? It looks like your system mingw-epoxy is bad =
(on Fedora, I have
> /usr/x86_64-w64-mingw32/sys-root/mingw/include/EGL/eglplatform.h installe=
d by
> mingw64-angleproject-3280-6.git57ea533.fc37.noarch)

Something else is obviously throwing git bisect off its game. Clean
builds with NOCACHE=3D1 all work so I'll leave it in.
it in.

>
>=20=20
>=20=20
>  > ---
>  >  .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>  >  .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>  >  .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>  >  tests/docker/dockerfiles/alpine.docker                | 1 -
>  >  tests/docker/dockerfiles/centos8.docker               | 1 -
>  >  tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 +--
>  >  tests/docker/dockerfiles/debian-amd64.docker          | 1 -
>  >  tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 +--
>  >  tests/docker/dockerfiles/debian-armel-cross.docker    | 3 +--
>  >  tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 +--
>  >  tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +--
>  >  tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 +--
>  >  tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 +--
>  >  tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 +--
>  >  tests/docker/dockerfiles/debian-toolchain.docker      | 1 -
>  >  tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
>  >  tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
>  >  tests/docker/dockerfiles/fedora.docker                | 1 -
>  >  tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
>  >  tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
>  >  tests/lcitool/projects/qemu.yml                       | 1 -
>  >  21 files changed, 11 insertions(+), 29 deletions(-)
>  >
>  > diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus=
/freebsd-12.vars
>  > index f32f01a954..8934e5d57f 100644
>  > --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
>  > +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
>  > @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  >  NINJA=3D'/usr/local/bin/ninja'
>  >  PACKAGING_COMMAND=3D'pkg'
>  >  PIP3=3D'/usr/local/bin/pip-3.8'
>  > -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit=
-genisoimage cmocka ctags curl
>  cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake g=
nutls gsed gtk3 json-c libepoxy libffi
>  libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 =
llvm lzo2 meson ncurses nettle ninja
>  opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py=
39-sphinx_rtd_theme
>  py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol t=
esseract texinfo usbredir
>  virglrenderer vte3 zstd'
>  > +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit=
-genisoimage cmocka ctags
>  curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gm=
ake gnutls gsed gtk3 json-c libepoxy
>  libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh li=
btasn1 llvm lzo2 meson ncurses nettle
>  ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sph=
inx py39-sphinx_rtd_theme
>  py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol t=
esseract usbredir
>  virglrenderer vte3 zstd'
>  >  PYPI_PKGS=3D''
>  >  PYTHON=3D'/usr/local/bin/python3'
>  > diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus=
/freebsd-13.vars
>  > index 813c051616..65ce456c48 100644
>  > --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
>  > +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
>  > @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  >  NINJA=3D'/usr/local/bin/ninja'
>  >  PACKAGING_COMMAND=3D'pkg'
>  >  PIP3=3D'/usr/local/bin/pip-3.8'
>  > -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit=
-genisoimage cmocka ctags curl
>  cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake g=
nutls gsed gtk3 json-c libepoxy libffi
>  libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 =
llvm lzo2 meson ncurses nettle ninja
>  opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py=
39-sphinx_rtd_theme
>  py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol t=
esseract texinfo usbredir
>  virglrenderer vte3 zstd'
>  > +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit=
-genisoimage cmocka ctags
>  curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gm=
ake gnutls gsed gtk3 json-c libepoxy
>  libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh li=
btasn1 llvm lzo2 meson ncurses nettle
>  ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sph=
inx py39-sphinx_rtd_theme
>  py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio spice-protocol t=
esseract usbredir
>  virglrenderer vte3 zstd'
>  >  PYPI_PKGS=3D''
>  >  PYTHON=3D'/usr/local/bin/python3'
>  > diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/m=
acos-12.vars
>  > index 33bb4e1040..65b78fa08f 100644
>  > --- a/.gitlab-ci.d/cirrus/macos-12.vars
>  > +++ b/.gitlab-ci.d/cirrus/macos-12.vars
>  > @@ -11,6 +11,6 @@ MAKE=3D'/opt/homebrew/bin/gmake'
>  >  NINJA=3D'/opt/homebrew/bin/ninja'
>  >  PACKAGING_COMMAND=3D'brew'
>  >  PIP3=3D'/opt/homebrew/bin/pip3'
>  > -PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus di=
ffutils dtc flex gcovr gettext git
>  glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi lib=
gcrypt libiscsi libnfs libpng libslirp
>  libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman p=
kg-config python3 rpm2cpio sdl2
>  sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde v=
te3 zlib zstd'
>  > +PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus di=
ffutils dtc flex gcovr gettext
>  git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi=
 libgcrypt libiscsi libnfs libpng libslirp
>  libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman p=
kg-config python3 rpm2cpio sdl2
>  sdl2_image snappy sparse spice-protocol tesseract usbredir vde vte3 zlib=
 zstd'
>  >  PYPI_PKGS=3D'PyYAML numpy pillow sphinx sphinx-rtd-theme'
>  >  PYTHON=3D'/opt/homebrew/bin/python3'
>  > diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/doc=
kerfiles/alpine.docker
>  > index 3293c790c9..4a569d82f6 100644
>  > --- a/tests/docker/dockerfiles/alpine.docker
>  > +++ b/tests/docker/dockerfiles/alpine.docker
>  > @@ -99,7 +99,6 @@ RUN apk update && \
>  >          spice-protocol \
>  >          tar \
>  >          tesseract-ocr \
>  > -        texinfo \
>  >          usbredir-dev \
>  >          util-linux \
>  >          vde2-dev \
>  > diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/do=
ckerfiles/centos8.docker
>  > index f13745e6cc..fbc953c6dc 100644
>  > --- a/tests/docker/dockerfiles/centos8.docker
>  > +++ b/tests/docker/dockerfiles/centos8.docker
>  > @@ -110,7 +110,6 @@ RUN dnf distro-sync -y && \
>  >          systemd-devel \
>  >          systemtap-sdt-devel \
>  >          tar \
>  > -        texinfo \
>  >          usbredir-devel \
>  >          util-linux \
>  >          virglrenderer-devel \
>  > diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker
>  b/tests/docker/dockerfiles/debian-amd64-cross.docker
>  > index d0ace6d0f7..5175095a85 100644
>  > --- a/tests/docker/dockerfiles/debian-amd64-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-amd64.docker
>  b/tests/docker/dockerfiles/debian-amd64.docker
>  > index 0517c4c315..b61f664ea2 100644
>  > --- a/tests/docker/dockerfiles/debian-amd64.docker
>  > +++ b/tests/docker/dockerfiles/debian-amd64.docker
>  > @@ -125,7 +125,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        tar \
>  >                        tesseract-ocr \
>  >                        tesseract-ocr-eng \
>  > -                      texinfo \
>  >                        xfslibs-dev \
>  >                        zlib1g-dev && \
>  >      eatmydata apt-get autoremove -y && \
>  > diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker
>  b/tests/docker/dockerfiles/debian-arm64-cross.docker
>  > index 9ac1c1ba3f..b69958c69f 100644
>  > --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker
>  b/tests/docker/dockerfiles/debian-armel-cross.docker
>  > index 8be492f4ad..96b524fab6 100644
>  > --- a/tests/docker/dockerfiles/debian-armel-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-armel-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker
>  b/tests/docker/dockerfiles/debian-armhf-cross.docker
>  > index da789e04af..08a75cebdb 100644
>  > --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker
>  b/tests/docker/dockerfiles/debian-mips64el-cross.docker
>  > index 8b7c59c4f9..5930e6fa5d 100644
>  > --- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker
>  b/tests/docker/dockerfiles/debian-mipsel-cross.docker
>  > index f9f1ed5fd2..c65d9830e7 100644
>  > --- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
>  b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
>  > index e423d88c2d..2ae56c978e 100644
>  > --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker
>  b/tests/docker/dockerfiles/debian-s390x-cross.docker
>  > index c1134f4cec..0db86a0fcd 100644
>  > --- a/tests/docker/dockerfiles/debian-s390x-cross.docker
>  > +++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
>  > @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        sparse \
>  >                        tar \
>  >                        tesseract-ocr \
>  > -                      tesseract-ocr-eng \
>  > -                      texinfo && \
>  > +                      tesseract-ocr-eng && \
>  >      eatmydata apt-get autoremove -y && \
>  >      eatmydata apt-get autoclean -y && \
>  >      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>  > diff --git a/tests/docker/dockerfiles/debian-toolchain.docker
>  b/tests/docker/dockerfiles/debian-toolchain.docker
>  > index d3d4d3344e..6c73408b34 100644
>  > --- a/tests/docker/dockerfiles/debian-toolchain.docker
>  > +++ b/tests/docker/dockerfiles/debian-toolchain.docker
>  > @@ -21,7 +21,6 @@ RUN apt update && \
>  >          libmpc-dev \
>  >          libmpfr-dev \
>  >          rsync \
>  > -        texinfo \
>  >          wget && \
>  >      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>  >      apt build-dep -yy --arch-only gcc glibc
>  > diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker
>  b/tests/docker/dockerfiles/fedora-win32-cross.docker
>  > index de811b332b..b659c0b8a8 100644
>  > --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
>  > +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
>  > @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
>  >                 tar \
>  >                 tesseract \
>  >                 tesseract-langpack-eng \
>  > -               texinfo \
>  >                 util-linux \
>  >                 which && \
>  >      nosync dnf autoremove -y && \
>  > diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker
>  b/tests/docker/dockerfiles/fedora-win64-cross.docker
>  > index 71681d6f92..0a404c15bf 100644
>  > --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
>  > +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
>  > @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
>  >                 tar \
>  >                 tesseract \
>  >                 tesseract-langpack-eng \
>  > -               texinfo \
>  >                 util-linux \
>  >                 which && \
>  >      nosync dnf autoremove -y && \
>  > diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/doc=
kerfiles/fedora.docker
>  > index ca3793b04b..5d60a96141 100644
>  > --- a/tests/docker/dockerfiles/fedora.docker
>  > +++ b/tests/docker/dockerfiles/fedora.docker
>  > @@ -121,7 +121,6 @@ exec "$@"' > /usr/bin/nosync && \
>  >                 tar \
>  >                 tesseract \
>  >                 tesseract-langpack-eng \
>  > -               texinfo \
>  >                 usbredir-devel \
>  >                 util-linux \
>  >                 virglrenderer-devel \
>  > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
>  b/tests/docker/dockerfiles/opensuse-leap.docker
>  > index 680f49e7dc..4b2c02d6ab 100644
>  > --- a/tests/docker/dockerfiles/opensuse-leap.docker
>  > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
>  > @@ -111,7 +111,6 @@ RUN zypper update -y && \
>  >             tar \
>  >             tesseract-ocr \
>  >             tesseract-ocr-traineddata-english \
>  > -           texinfo \
>  >             usbredir-devel \
>  >             util-linux \
>  >             virglrenderer-devel \
>  > diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker=
/dockerfiles/ubuntu2004.docker
>  > index 6594bba338..13ab0b6887 100644
>  > --- a/tests/docker/dockerfiles/ubuntu2004.docker
>  > +++ b/tests/docker/dockerfiles/ubuntu2004.docker
>  > @@ -124,7 +124,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>  >                        tar \
>  >                        tesseract-ocr \
>  >                        tesseract-ocr-eng \
>  > -                      texinfo \
>  >                        xfslibs-dev \
>  >                        zlib1g-dev && \
>  >      eatmydata apt-get autoremove -y && \
>  > diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/=
qemu.yml
>  > index c2af92348a..6467bcf08a 100644
>  > --- a/tests/lcitool/projects/qemu.yml
>  > +++ b/tests/lcitool/projects/qemu.yml
>  > @@ -109,7 +109,6 @@ packages:
>  >   - tar
>  >   - tesseract
>  >   - tesseract-eng
>  > - - texinfo
>  >   - usbredir
>  >   - virglrenderer
>  >   - vte
>
>  --=20
>  Alex Benn=C3=A9e
>  Virtualisation Tech Lead @ Linaro


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

