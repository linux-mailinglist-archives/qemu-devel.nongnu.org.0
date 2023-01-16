Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6766BB46
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 11:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHMQK-0006uM-38; Mon, 16 Jan 2023 05:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHMQB-0006u4-MG
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:08:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHMQ8-0003UW-V5
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 05:08:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so23225923wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS4g4Jh/uvUh0OZ0kPhz0bfmCkk5WTGuiVscMSrG5Pk=;
 b=YL8ifBV+QaX4F/Yq6rAFJ2g/LBg9m8PO3aO6gwx6H1Fvb6bkl+BL8FSp+dZRrjg1Ey
 1wxGvKcbMw4h57S2/IopajiePfrPlzqbYYLc8xy3Xr4IN4m+7xVGeJz/qMb/0+467Npt
 JBofNIE4CR/aRPN4kqsbBM+IUYej4Ptz6q5Gf8ZUnyfmNZBZ2TxbHnHrgqKrdS1q1Oun
 GokvUfJ8nFW6AwA7rpIGaiL2CbaHVV6ruM0vqitJ0Galk7/HMCkRE7dUyEzWwMB25SPc
 xvyJTN+Xr048vAHAIcq8ripIyjJGyiYOMKiTfPtf3plvl8pdlxupjbZWHBlExAiwSbHl
 5ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KS4g4Jh/uvUh0OZ0kPhz0bfmCkk5WTGuiVscMSrG5Pk=;
 b=MK141keRvZKsYQyHWAUhFW7DEliW0JDiDseTzcngT5ZM4nvrbM/ylBoKlVZS15icl2
 elDAm9h2logVv9bAgqjsDRTu4AtimAyPJuGmj8RdcfRgNUPK082vX31y7tEBnAAXQNjX
 F20kkEk3FQpDGzvx0S/u4BSw0x3C2uqCGdlATnyICSLh+kk75/x5RfMy0RlinSdnTn/S
 KHFe+dfHyzZaCuz0lNvM7dc8/eOMQedwCYASGUM7qwlkVa1D/Tg3ope2CMi6G2JgLXT0
 v+L1Fy+IkVF/2K5/ayVmj85gT3dLv/EG8ZpwJHVzTCGEvgaT1oxcnw6bZ2NNKj5vPpnY
 gT2g==
X-Gm-Message-State: AFqh2kot1gGyuiCsy7iLw6hAkWhJxHC4KRSgf5LNCzzEKrkp85Fc9IIN
 08nR1j3SK47YAfAN9TUkKMR1jQ==
X-Google-Smtp-Source: AMrXdXvudAZWU/PUb5eKxTDGJv3hv/S5vh7fIpvZ8KVp2hQSJONlik7y0PPr2XHfsrENOasgbWrxGw==
X-Received: by 2002:a05:600c:4e08:b0:3d2:139e:f64f with SMTP id
 b8-20020a05600c4e0800b003d2139ef64fmr69199986wmq.40.1673863731260; 
 Mon, 16 Jan 2023 02:08:51 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ba29-20020a0560001c1d00b002b065272da2sm4809263wrb.13.2023.01.16.02.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 02:08:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DAFC1FFB7;
 Mon, 16 Jan 2023 10:08:49 +0000 (GMT)
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-9-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
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
Date: Mon, 16 Jan 2023 10:06:07 +0000
In-reply-to: <20230110132700.833690-9-marcandre.lureau@redhat.com>
Message-ID: <87bkmyvljj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I'm not sure how but this is re-breaking the windows build you just fixed:

  In file included from /usr/x86_64-w64-mingw32/sys-root/mingw/include/epox=
y/egl.h:46,
                   from /tmp/qemu-test/src/include/ui/egl-helpers.h:5,
                   from /tmp/qemu-test/src/include/ui/gtk.h:25,
                   from ../src/ui/gtk.c:42:
  /usr/x86_64-w64-mingw32/sys-root/mingw/include/epoxy/egl_generated.h:11:1=
0: fatal error: EGL/eglplatform.h: No such file or directory
     11 | #include "EGL/eglplatform.h"
        |          ^~~~~~~~~~~~~~~~~~~
  compilation terminated.

I'm going to drop this patch for now.

> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>  .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>  tests/docker/dockerfiles/alpine.docker                | 1 -
>  tests/docker/dockerfiles/centos8.docker               | 1 -
>  tests/docker/dockerfiles/debian-amd64-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-amd64.docker          | 1 -
>  tests/docker/dockerfiles/debian-arm64-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-armel-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-armhf-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-mips64el-cross.docker | 3 +--
>  tests/docker/dockerfiles/debian-mipsel-cross.docker   | 3 +--
>  tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 3 +--
>  tests/docker/dockerfiles/debian-s390x-cross.docker    | 3 +--
>  tests/docker/dockerfiles/debian-toolchain.docker      | 1 -
>  tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 -
>  tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 -
>  tests/docker/dockerfiles/fedora.docker                | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker            | 1 -
>  tests/lcitool/projects/qemu.yml                       | 1 -
>  21 files changed, 11 insertions(+), 29 deletions(-)
>
> diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/fr=
eebsd-12.vars
> index f32f01a954..8934e5d57f 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-12.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
> @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  NINJA=3D'/usr/local/bin/ninja'
>  PACKAGING_COMMAND=3D'pkg'
>  PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-ge=
nisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3=
 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt l=
ibjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meso=
n ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py3=
9-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl=
2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrendere=
r vte3 zstd'
> +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-ge=
nisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3=
 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt l=
ibjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meso=
n ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py3=
9-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl=
2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 z=
std'
>  PYPI_PKGS=3D''
>  PYTHON=3D'/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/fr=
eebsd-13.vars
> index 813c051616..65ce456c48 100644
> --- a/.gitlab-ci.d/cirrus/freebsd-13.vars
> +++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
> @@ -11,6 +11,6 @@ MAKE=3D'/usr/local/bin/gmake'
>  NINJA=3D'/usr/local/bin/ninja'
>  PACKAGING_COMMAND=3D'pkg'
>  PIP3=3D'/usr/local/bin/pip-3.8'
> -PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-ge=
nisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3=
 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt l=
ibjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meso=
n ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py3=
9-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl=
2_image snappy sndio spice-protocol tesseract texinfo usbredir virglrendere=
r vte3 zstd'
> +PKGS=3D'alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-ge=
nisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3=
 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt l=
ibjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meso=
n ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py3=
9-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl=
2_image snappy sndio spice-protocol tesseract usbredir virglrenderer vte3 z=
std'
>  PYPI_PKGS=3D''
>  PYTHON=3D'/usr/local/bin/python3'
> diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/maco=
s-12.vars
> index 33bb4e1040..65b78fa08f 100644
> --- a/.gitlab-ci.d/cirrus/macos-12.vars
> +++ b/.gitlab-ci.d/cirrus/macos-12.vars
> @@ -11,6 +11,6 @@ MAKE=3D'/opt/homebrew/bin/gmake'
>  NINJA=3D'/opt/homebrew/bin/ninja'
>  PACKAGING_COMMAND=3D'brew'
>  PIP3=3D'/opt/homebrew/bin/pip3'
> -PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffu=
tils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-tur=
bo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh =
libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config =
python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract tex=
info usbredir vde vte3 zlib zstd'
> +PKGS=3D'bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffu=
tils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-tur=
bo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh =
libtasn1 libusb llvm lzo make meson ncurses nettle ninja pixman pkg-config =
python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract usb=
redir vde vte3 zlib zstd'
>  PYPI_PKGS=3D'PyYAML numpy pillow sphinx sphinx-rtd-theme'
>  PYTHON=3D'/opt/homebrew/bin/python3'
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/docker=
files/alpine.docker
> index 3293c790c9..4a569d82f6 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -99,7 +99,6 @@ RUN apk update && \
>          spice-protocol \
>          tar \
>          tesseract-ocr \
> -        texinfo \
>          usbredir-dev \
>          util-linux \
>          vde2-dev \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index f13745e6cc..fbc953c6dc 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -110,7 +110,6 @@ RUN dnf distro-sync -y && \
>          systemd-devel \
>          systemtap-sdt-devel \
>          tar \
> -        texinfo \
>          usbredir-devel \
>          util-linux \
>          virglrenderer-devel \
> diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/d=
ocker/dockerfiles/debian-amd64-cross.docker
> index d0ace6d0f7..5175095a85 100644
> --- a/tests/docker/dockerfiles/debian-amd64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/=
dockerfiles/debian-amd64.docker
> index 0517c4c315..b61f664ea2 100644
> --- a/tests/docker/dockerfiles/debian-amd64.docker
> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> @@ -125,7 +125,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        tar \
>                        tesseract-ocr \
>                        tesseract-ocr-eng \
> -                      texinfo \
>                        xfslibs-dev \
>                        zlib1g-dev && \
>      eatmydata apt-get autoremove -y && \
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/d=
ocker/dockerfiles/debian-arm64-cross.docker
> index 9ac1c1ba3f..b69958c69f 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/d=
ocker/dockerfiles/debian-armel-cross.docker
> index 8be492f4ad..96b524fab6 100644
> --- a/tests/docker/dockerfiles/debian-armel-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armel-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/d=
ocker/dockerfiles/debian-armhf-cross.docker
> index da789e04af..08a75cebdb 100644
> --- a/tests/docker/dockerfiles/debian-armhf-cross.docker
> +++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/test=
s/docker/dockerfiles/debian-mips64el-cross.docker
> index 8b7c59c4f9..5930e6fa5d 100644
> --- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/=
docker/dockerfiles/debian-mipsel-cross.docker
> index f9f1ed5fd2..c65d9830e7 100644
> --- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests=
/docker/dockerfiles/debian-ppc64el-cross.docker
> index e423d88c2d..2ae56c978e 100644
> --- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> +++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/d=
ocker/dockerfiles/debian-s390x-cross.docker
> index c1134f4cec..0db86a0fcd 100644
> --- a/tests/docker/dockerfiles/debian-s390x-cross.docker
> +++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
> @@ -55,8 +55,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        sparse \
>                        tar \
>                        tesseract-ocr \
> -                      tesseract-ocr-eng \
> -                      texinfo && \
> +                      tesseract-ocr-eng && \
>      eatmydata apt-get autoremove -y && \
>      eatmydata apt-get autoclean -y && \
>      sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/doc=
ker/dockerfiles/debian-toolchain.docker
> index d3d4d3344e..6c73408b34 100644
> --- a/tests/docker/dockerfiles/debian-toolchain.docker
> +++ b/tests/docker/dockerfiles/debian-toolchain.docker
> @@ -21,7 +21,6 @@ RUN apt update && \
>          libmpc-dev \
>          libmpfr-dev \
>          rsync \
> -        texinfo \
>          wget && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt build-dep -yy --arch-only gcc glibc
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win32-cross.docker
> index de811b332b..b659c0b8a8 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
>                 tar \
>                 tesseract \
>                 tesseract-langpack-eng \
> -               texinfo \
>                 util-linux \
>                 which && \
>      nosync dnf autoremove -y && \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win64-cross.docker
> index 71681d6f92..0a404c15bf 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -57,7 +57,6 @@ exec "$@"' > /usr/bin/nosync && \
>                 tar \
>                 tesseract \
>                 tesseract-langpack-eng \
> -               texinfo \
>                 util-linux \
>                 which && \
>      nosync dnf autoremove -y && \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
> index ca3793b04b..5d60a96141 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -121,7 +121,6 @@ exec "$@"' > /usr/bin/nosync && \
>                 tar \
>                 tesseract \
>                 tesseract-langpack-eng \
> -               texinfo \
>                 usbredir-devel \
>                 util-linux \
>                 virglrenderer-devel \
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker=
/dockerfiles/opensuse-leap.docker
> index 680f49e7dc..4b2c02d6ab 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -111,7 +111,6 @@ RUN zypper update -y && \
>             tar \
>             tesseract-ocr \
>             tesseract-ocr-traineddata-english \
> -           texinfo \
>             usbredir-devel \
>             util-linux \
>             virglrenderer-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/do=
ckerfiles/ubuntu2004.docker
> index 6594bba338..13ab0b6887 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -124,7 +124,6 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        tar \
>                        tesseract-ocr \
>                        tesseract-ocr-eng \
> -                      texinfo \
>                        xfslibs-dev \
>                        zlib1g-dev && \
>      eatmydata apt-get autoremove -y && \
> diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qem=
u.yml
> index c2af92348a..6467bcf08a 100644
> --- a/tests/lcitool/projects/qemu.yml
> +++ b/tests/lcitool/projects/qemu.yml
> @@ -109,7 +109,6 @@ packages:
>   - tar
>   - tesseract
>   - tesseract-eng
> - - texinfo
>   - usbredir
>   - virglrenderer
>   - vte


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

