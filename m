Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB3532EDF
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:22:14 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntXIU-0002v8-1J
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWo5-0000e5-BK
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:50:52 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWo2-00070X-Hd
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:50:48 -0400
Received: by mail-ej1-x635.google.com with SMTP id ck4so31940297ejb.8
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I7aa+ZtFOAEqTAWs0VCJtgsbM3HKPxNmeHuvpwCnHzE=;
 b=vB3N7kPzXJowqKIb7Lo0dioBjrpbeNkSTtqMHkIfEVLgDdj1oeGCh3JR+DMTgtv6ff
 LnKlt6lEcfaUsPJowRbDLDM7HO09C7oSf8ZRGZpJ0lXomPE3zX3avt7FGCiF44v7l6b+
 C3hW7H9z9mORZlh9CtYEw4ieCRtLBLA0uzqZ3jRajY63oa+lLnGiZx9hzJPhLUI31+nk
 xD8c9JkeMjWVqJbLsG8Ep4NOcUd7knpP85jsDKrNmqd0bNWM41BLmLRKKkrj47sL6R0J
 i6alzCHsFU2znQQUC126JOPemzjmH+SrRCFmZV5W5xuF/cjyqe0SgHON8pgylaKKZiT3
 AjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I7aa+ZtFOAEqTAWs0VCJtgsbM3HKPxNmeHuvpwCnHzE=;
 b=2LGnCy0a+rvbWR7d6YckqLgFRL0Rq94fuGPil4B5MYokgHhnRwMvLDRT6Pkye8GE6T
 IjIlyjAhKCbxCYQ9xm1deia4jPYNgSqT7m8wOhZRGaK+qlQLUmAMLRi83IHJjmGe1zSB
 DN/iqmUcAkqEtTFZoB2V2gnJ9xQA8Ks9uV8ggCDGvHWCieT2F/iaBGy1EQecjt5fDYfH
 yaapVJ7VQzbb3KOffvP/y/5zMAkY6a/yJQU6DYJHIxb1jKnDoZjPaU3WQ3tB2KjtAbew
 FA3vywKaezKvToWqPU/lyZu8ZFyo01rNvffVLsy/AHx0hN8XKWUNvvuEFrxNowoqnKdN
 aXKw==
X-Gm-Message-State: AOAM530VePCBk20QYuMeA0S5mBFR8XGG5XKkWgvEICe1YhxZcZ9kWptU
 4/JO04IbVG2WbkQYnqLNejfahQ==
X-Google-Smtp-Source: ABdhPJyyZRTEbjZ8Bbh6xleygC5TaHj3Hr89rhsZNxn5hfhIJhz/ZAvbKubqRtrosJ8ghOMhNZAIqw==
X-Received: by 2002:a17:906:d54b:b0:6f4:cea3:843b with SMTP id
 cr11-20020a170906d54b00b006f4cea3843bmr24142962ejc.40.1653407444899; 
 Tue, 24 May 2022 08:50:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 oq17-20020a170906cc9100b006fec4ee28d0sm3313335ejb.189.2022.05.24.08.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:50:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 724441FFB7;
 Tue, 24 May 2022 16:50:43 +0100 (BST)
References: <20220510195612.677494-1-thuth@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, berrange@redhat.com
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
Date: Tue, 24 May 2022 16:48:49 +0100
In-reply-to: <20220510195612.677494-1-thuth@redhat.com>
Message-ID: <874k1f6ib0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> According to our "Supported build platforms" policy, we now do not support
> Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
>  very long time, so I assume these are not used anymore and can completely
>  be removed now.
>
>  .gitlab-ci.d/containers.yml                   |   5 -
>  .../custom-runners/ubuntu-20.04-aarch32.yml   |   2 +-
>  .../custom-runners/ubuntu-20.04-aarch64.yml   |   2 +-
>  scripts/ci/setup/build-environment.yml        |  14 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    | 144 ------------------
>  tests/lcitool/refresh                         |   7 -
>  tests/vm/ubuntu.aarch64                       |  68 ---------
>  tests/vm/ubuntu.i386                          |  40 -----
>  tests/vm/ubuntuvm.py                          |  60 --------

FWIW the ubuntu.aarch64 job was added to make it easier to test system
emulation with a full system. I guess it replicates what you can get out
of avocado but with a more direct interface.

I'd prefer if the tests/vms where updated to the latest stable releases
rather than totally dropped.

>  9 files changed, 4 insertions(+), 338 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
>  delete mode 100755 tests/vm/ubuntu.aarch64
>  delete mode 100755 tests/vm/ubuntu.i386
>  delete mode 100644 tests/vm/ubuntuvm.py
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index b9b675fdcb..e9df90bbdd 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -19,11 +19,6 @@ amd64-debian-container:
>    variables:
>      NAME: debian-amd64
>=20=20
> -amd64-ubuntu1804-container:
> -  extends: .container_job_template
> -  variables:
> -    NAME: ubuntu1804
> -
>  amd64-ubuntu2004-container:
>    extends: .container_job_template
>    variables:
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> index 9c589bc4cf..47856ac53c 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> @@ -1,6 +1,6 @@
>  # All ubuntu-20.04 jobs should run successfully in an environment
>  # setup by the scripts/ci/setup/qemu/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +# "Install basic packages to build QEMU on Ubuntu 20.04"
>=20=20
>  ubuntu-20.04-aarch32-all:
>   needs: []
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> index 920e388bd0..951e490db1 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -1,6 +1,6 @@
>  # All ubuntu-20.04 jobs should run successfully in an environment
>  # setup by the scripts/ci/setup/qemu/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +# "Install basic packages to build QEMU on Ubuntu 20.04"
>=20=20
>  ubuntu-20.04-aarch64-all-linux-static:
>   needs: []
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/bu=
ild-environment.yml
> index 9182e0c253..232525b91d 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -33,10 +33,9 @@
>        when:
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>=20=20
> -    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> +    - name: Install basic packages to build QEMU on Ubuntu 20.04
>        package:
>          name:
> -        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
>            - ccache
>            - gcc
>            - gettext
> @@ -90,7 +89,7 @@
>        when:
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>=20=20
> -    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-=
s390x
> +    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
>        package:
>          name:
>            - libspice-server-dev
> @@ -100,15 +99,6 @@
>          - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>          - ansible_facts['architecture'] !=3D 's390x'
>=20=20
> -    - name: Install basic packages to build QEMU on Ubuntu 18.04
> -      package:
> -        name:
> -        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> -          - clang
> -      when:
> -        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> -        - ansible_facts['distribution_version'] =3D=3D '18.04'
> -
>      - name: Install basic packages to build QEMU on Ubuntu 20.04
>        package:
>          name:
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/do=
ckerfiles/ubuntu1804.docker
> deleted file mode 100644
> index b3f2156580..0000000000
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -# THIS FILE WAS AUTO-GENERATED
> -#
> -#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
> -#
> -# https://gitlab.com/libvirt/libvirt-ci
> -
> -FROM docker.io/library/ubuntu:18.04
> -
> -RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
> -    apt-get update && \
> -    apt-get install -y eatmydata && \
> -    eatmydata apt-get dist-upgrade -y && \
> -    eatmydata apt-get install --no-install-recommends -y \
> -            bash \
> -            bc \
> -            bsdmainutils \
> -            bzip2 \
> -            ca-certificates \
> -            ccache \
> -            clang \
> -            dbus \
> -            debianutils \
> -            diffutils \
> -            exuberant-ctags \
> -            findutils \
> -            g++ \
> -            gcc \
> -            gcovr \
> -            genisoimage \
> -            gettext \
> -            git \
> -            glusterfs-common \
> -            hostname \
> -            libaio-dev \
> -            libasan5 \
> -            libasound2-dev \
> -            libattr1-dev \
> -            libbrlapi-dev \
> -            libbz2-dev \
> -            libc6-dev \
> -            libcacard-dev \
> -            libcap-ng-dev \
> -            libcapstone-dev \
> -            libcurl4-gnutls-dev \
> -            libdaxctl-dev \
> -            libdrm-dev \
> -            libepoxy-dev \
> -            libfdt-dev \
> -            libffi-dev \
> -            libgbm-dev \
> -            libgcrypt20-dev \
> -            libglib2.0-dev \
> -            libgnutls28-dev \
> -            libgtk-3-dev \
> -            libibumad-dev \
> -            libibverbs-dev \
> -            libiscsi-dev \
> -            libjemalloc-dev \
> -            libjpeg-turbo8-dev \
> -            liblttng-ust-dev \
> -            liblzo2-dev \
> -            libncursesw5-dev \
> -            libnfs-dev \
> -            libnuma-dev \
> -            libpam0g-dev \
> -            libpcre2-dev \
> -            libpixman-1-dev \
> -            libpmem-dev \
> -            libpng-dev \
> -            libpulse-dev \
> -            librbd-dev \
> -            librdmacm-dev \
> -            libsasl2-dev \
> -            libsdl2-dev \
> -            libsdl2-image-dev \
> -            libseccomp-dev \
> -            libselinux1-dev \
> -            libsnappy-dev \
> -            libspice-protocol-dev \
> -            libspice-server-dev \
> -            libssh-dev \
> -            libsystemd-dev \
> -            libtasn1-6-dev \
> -            libubsan1 \
> -            libudev-dev \
> -            libusb-1.0-0-dev \
> -            libusbredirhost-dev \
> -            libvdeplug-dev \
> -            libvirglrenderer-dev \
> -            libvte-2.91-dev \
> -            libxen-dev \
> -            libzstd-dev \
> -            llvm \
> -            locales \
> -            make \
> -            multipath-tools \
> -            netcat-openbsd \
> -            nettle-dev \
> -            ninja-build \
> -            openssh-client \
> -            perl-base \
> -            pkgconf \
> -            python3 \
> -            python3-numpy \
> -            python3-opencv \
> -            python3-pillow \
> -            python3-pip \
> -            python3-setuptools \
> -            python3-sphinx \
> -            python3-sphinx-rtd-theme \
> -            python3-venv \
> -            python3-wheel \
> -            python3-yaml \
> -            rpm2cpio \
> -            sed \
> -            sparse \
> -            systemtap-sdt-dev \
> -            tar \
> -            tesseract-ocr \
> -            tesseract-ocr-eng \
> -            texinfo \
> -            xfslibs-dev \
> -            zlib1g-dev && \
> -    eatmydata apt-get autoremove -y && \
> -    eatmydata apt-get autoclean -y && \
> -    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> -    dpkg-reconfigure locales && \
> -    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --=
show > /packages.txt && \
> -    mkdir -p /usr/libexec/ccache-wrappers && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> -
> -RUN pip3 install meson=3D=3D0.56.0
> -
> -ENV LANG "en_US.UTF-8"
> -ENV MAKE "/usr/bin/make"
> -ENV NINJA "/usr/bin/ninja"
> -ENV PYTHON "/usr/bin/python3"
> -ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
> -# https://bugs.launchpad.net/qemu/+bug/1838763
> -ENV QEMU_CONFIGURE_OPTS --disable-libssh
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 2d198ad281..fb49bbc441 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -65,11 +65,6 @@ def generate_cirrus(target, trailer=3DNone):
>     cmd =3D lcitool_cmd + ["variables", target, "qemu"]
>     generate(filename, cmd, trailer)
>=20=20
> -ubuntu1804_skipssh =3D [
> -   "# https://bugs.launchpad.net/qemu/+bug/1838763\n",
> -   "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"
> -]
> -
>  ubuntu2004_tsanhack =3D [
>     "# Apply patch https://reviews.llvm.org/D75820\n",
>     "# This is required for TSan in clang-10 to compile with QEMU.\n",
> @@ -85,8 +80,6 @@ def debian_cross_build(prefix, targets):
>  try:
>     generate_dockerfile("centos8", "centos-stream-8")
>     generate_dockerfile("fedora", "fedora-35")
> -   generate_dockerfile("ubuntu1804", "ubuntu-1804",
> -                       trailer=3D"".join(ubuntu1804_skipssh))
>     generate_dockerfile("ubuntu2004", "ubuntu-2004",
>                         trailer=3D"".join(ubuntu2004_tsanhack))
>     generate_dockerfile("opensuse-leap", "opensuse-leap-152")
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> deleted file mode 100755
> index b291945a7e..0000000000
> --- a/tests/vm/ubuntu.aarch64
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu aarch64 image
> -#
> -# Copyright 2020 Linaro
> -#
> -# Authors:
> -#  Robert Foley <robert.foley@linaro.org>
> -#  Originally based on ubuntu.i386 Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -#
> -
> -import sys
> -import basevm
> -import aarch64vm
> -import ubuntuvm
> -
> -DEFAULT_CONFIG =3D {
> -    'cpu'          : "cortex-a57",
> -    'machine'      : "virt,gic-version=3D3",
> -    'install_cmds' : "apt-get update,"\
> -                     "apt-get build-dep -y --arch-only qemu,"\
> -                     "apt-get install -y libfdt-dev pkg-config language-=
pack-en ninja-build",
> -    # We increase beyond the default time since during boot
> -    # it can take some time (many seconds) to log into the VM
> -    # especially using softmmu.
> -    'ssh_timeout'  : 60,
> -}
> -
> -class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
> -    name =3D "ubuntu.aarch64"
> -    arch =3D "aarch64"
> -    image_name =3D "ubuntu-18.04-server-cloudimg-arm64.img"
> -    image_link =3D "https://cloud-images.ubuntu.com/releases/18.04/relea=
se/" + image_name
> -    image_sha256=3D"0fdcba761965735a8a903d8b88df8e47f156f48715c00508e431=
5c506d7d3cb1"
> -    BUILD_SCRIPT =3D """
> -        set -e;
> -        cd $(mktemp -d);
> -        sudo chmod a+r /dev/vdb;
> -        tar --checkpoint=3D.10 -xf /dev/vdb;
> -        ./configure {configure_opts};
> -        make --output-sync {target} -j{jobs} {verbose};
> -    """
> -    def boot(self, img, extra_args=3DNone):
> -        aarch64vm.create_flash_images(self._tmpdir, self._efi_aarch64)
> -        default_args =3D aarch64vm.get_pflash_args(self._tmpdir)
> -        if extra_args:
> -            extra_args.extend(default_args)
> -        else:
> -            extra_args =3D default_args
> -        # We always add these performance tweaks
> -        # because without them, we boot so slowly that we
> -        # can time out finding the boot efi device.
> -        if '-smp' not in extra_args and \
> -           '-smp' not in self._config['extra_args'] and \
> -           '-smp' not in self._args:
> -            # Only add if not already there to give caller option to cha=
nge it.
> -            extra_args.extend(["-smp", "8"])
> -
> -        # We have overridden boot() since aarch64 has additional paramet=
ers.
> -        # Call down to the base class method.
> -        super(UbuntuAarch64VM, self).boot(img, extra_args=3Dextra_args)
> -
> -if __name__ =3D=3D "__main__":
> -    defaults =3D aarch64vm.get_config_defaults(UbuntuAarch64VM, DEFAULT_=
CONFIG)
> -    sys.exit(basevm.main(UbuntuAarch64VM, defaults))
> diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
> deleted file mode 100755
> index 47681b6f87..0000000000
> --- a/tests/vm/ubuntu.i386
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu i386 image
> -#
> -# Copyright 2017 Red Hat Inc.
> -#
> -# Authors:
> -#  Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -#
> -
> -import sys
> -import basevm
> -import ubuntuvm
> -
> -DEFAULT_CONFIG =3D {
> -    'install_cmds' : "apt-get update,"\
> -                     "apt-get build-dep -y qemu,"\
> -                     "apt-get install -y libfdt-dev language-pack-en nin=
ja-build",
> -}
> -
> -class UbuntuX86VM(ubuntuvm.UbuntuVM):
> -    name =3D "ubuntu.i386"
> -    arch =3D "i386"
> -    image_link=3D"https://cloud-images.ubuntu.com/releases/bionic/"\
> -               "release-20191114/ubuntu-18.04-server-cloudimg-i386.img"
> -    image_sha256=3D"28969840626d1ea80bb249c08eef1a4533e8904aa51a327b40f3=
7ac4b4ff04ef"
> -    BUILD_SCRIPT =3D """
> -        set -e;
> -        cd $(mktemp -d);
> -        sudo chmod a+r /dev/vdb;
> -        tar -xf /dev/vdb;
> -        ./configure {configure_opts};
> -        make --output-sync {target} -j{jobs} {verbose};
> -    """
> -
> -if __name__ =3D=3D "__main__":
> -    sys.exit(basevm.main(UbuntuX86VM, DEFAULT_CONFIG))
> diff --git a/tests/vm/ubuntuvm.py b/tests/vm/ubuntuvm.py
> deleted file mode 100644
> index 6689ad87aa..0000000000
> --- a/tests/vm/ubuntuvm.py
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu VM testing library
> -#
> -# Copyright 2017 Red Hat Inc.
> -# Copyright 2020 Linaro
> -#
> -# Authors:
> -#  Robert Foley <robert.foley@linaro.org>
> -#  Originally based on ubuntu.i386 Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -
> -import os
> -import subprocess
> -import basevm
> -
> -class UbuntuVM(basevm.BaseVM):
> -
> -    def __init__(self, args, config=3DNone):
> -        self.login_prompt =3D "ubuntu-{}-guest login:".format(self.arch)
> -        basevm.BaseVM.__init__(self, args, config)
> -
> -    def build_image(self, img):
> -        """Build an Ubuntu VM image.  The child class will
> -           define the install_cmds to init the VM."""
> -        os_img =3D self._download_with_cache(self.image_link,
> -                                           sha256sum=3Dself.image_sha256)
> -        img_tmp =3D img + ".tmp"
> -        subprocess.check_call(["cp", "-f", os_img, img_tmp])
> -        self.exec_qemu_img("resize", img_tmp, "+50G")
> -        ci_img =3D self.gen_cloud_init_iso()
> -
> -        self.boot(img_tmp, extra_args =3D [ "-device", "VGA", "-cdrom", =
ci_img, ])
> -
> -        # First command we issue is fix for slow ssh login.
> -        self.wait_ssh(wait_root=3DTrue,
> -                      cmd=3D"chmod -x /etc/update-motd.d/*")
> -        # Wait for cloud init to finish
> -        self.wait_ssh(wait_root=3DTrue,
> -                      cmd=3D"ls /var/lib/cloud/instance/boot-finished")
> -        self.ssh_root("touch /etc/cloud/cloud-init.disabled")
> -        # Disable auto upgrades.
> -        # We want to keep the VM system state stable.
> -        self.ssh_root('sed -ie \'s/"1"/"0"/g\' '\
> -                      '/etc/apt/apt.conf.d/20auto-upgrades')
> -        self.ssh_root("sed -ie s/^#\ deb-src/deb-src/g /etc/apt/sources.=
list")
> -
> -        # If the user chooses not to do the install phase,
> -        # then we will jump right to the graceful shutdown
> -        if self._config['install_cmds'] !=3D "":
> -            # Issue the install commands.
> -            # This can be overriden by the user in the config .yml.
> -            install_cmds =3D self._config['install_cmds'].split(',')
> -            for cmd in install_cmds:
> -                self.ssh_root(cmd)
> -        self.graceful_shutdown()
> -        os.rename(img_tmp, img)
> -        return 0


--=20
Alex Benn=C3=A9e

