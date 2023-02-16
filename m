Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C005699BFB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSinO-0002vZ-GU; Thu, 16 Feb 2023 13:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSinM-0002vJ-Ll
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pSinJ-000302-6O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676571344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjJwynRfvNz7g9of3OCkXWEXMKlAcX5hWWmY2P+c+DE=;
 b=BLgjmmCFunVRVP3UcO6TRV1mK4nMP+ZRYlJeVwU8ggQYmyoTMq8mgdW5nQEpjIhEHd5tQb
 YD9gr1HCsoOiRU+nDF6XfmCu+zv8Fhahk0il9nhDCmQZN2IFJB6YcnHmEx0khmFLnKEuxO
 CNKGbkrSzdtNjVTnmtcGDKJmL23JNtI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-w_9xAd3bOSu94APhXzMbUQ-1; Thu, 16 Feb 2023 13:15:42 -0500
X-MC-Unique: w_9xAd3bOSu94APhXzMbUQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 i3-20020a170902cf0300b00198bc9ba4edso1438961plg.21
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 10:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjJwynRfvNz7g9of3OCkXWEXMKlAcX5hWWmY2P+c+DE=;
 b=BJ/N9dwvoXKwWtR3ohSM5pe0NvJSFBLRSN0Q0v+vE493mICEV110bwBhXtPoOcfvfP
 O7rYPDmxJPRpHMSRUZDu4fNZ/5WW4z9hXcF6MXuTQ3IxfedDgRFKhjzhRG8uQYPmXt4R
 KOkGkp1TikMA3KSBLTT9urFGnLSD6L95YQYkYEW3w6miemskWJNzI7PlFkJm1eXCaRiT
 kVW0rrUOSWhvwNq3YcIH73CG7c3g9xIrqMmOR0Me4J7Q1IRTgoJtXdFO7YN598ejk0VA
 2VBosOHj04Ox0okribaUkPjRX+dGT/cV7T/p3sOfF33oCsKzQm06ludpBN1YxsOVlrUP
 NCmw==
X-Gm-Message-State: AO0yUKVv97JAvPBWXN6pHmI0ugcuv5CblmVIWNhRvHY7frGhZq7IKOfe
 mqDiKBFZ378C7swpcYTnFtNgIM+z9XPEpBbAKNK5JqHF0h2l6HUFGRL23tZSzOMNgTBZYBkEVfA
 W0cvvf2Dgbdff6TaYBnjTqJgwa5Cvc6M=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr702151pjb.131.1676571341838; 
 Thu, 16 Feb 2023 10:15:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9cozfStBUta7zrK7vYnca1nK8jS0lo7KHqFQPMdUrUBFJzHThc68OusQnCyvVhr1tSoqoItIfKZJdF/DMZwrQ=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr702122pjb.131.1676571341490; Thu, 16
 Feb 2023 10:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
In-Reply-To: <20230215192530.299263-8-alex.bennee@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Feb 2023 13:15:30 -0500
Message-ID: <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
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

On Wed, Feb 15, 2023 at 2:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.

We still support Ubuntu 20.04 until 2024 though, don't we? Is it safe
to not test this platform?

I've long been uncertain about what our policy actually is for docker
tests, if we want to test every platform we support or only some of
them; and if it's only some of them, when do we choose the older and
when do we choose the newer?



>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/testing.rst                        |  4 ++--
>  .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
>  .gitlab-ci.d/containers.yml                   |  4 ++--
>  .../{ubuntu2004.docker =3D> ubuntu2204.docker}  | 16 +++++---------
>  tests/docker/test-tsan                        |  2 +-
>  tests/lcitool/refresh                         | 10 +--------
>  6 files changed, 23 insertions(+), 35 deletions(-)
>  rename tests/docker/dockerfiles/{ubuntu2004.docker =3D> ubuntu2204.docke=
r} (91%)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index e10c47b5a7..309a575abe 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -574,13 +574,13 @@ https://github.com/google/sanitizers/wiki/ThreadSan=
itizerCppManual
>
>  Thread Sanitizer in Docker
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> -TSan is currently supported in the ubuntu2004 docker.
> +TSan is currently supported in the ubuntu2204 docker.
>
>  The test-tsan test will build using TSan and then run make check.
>
>  .. code::
>
> -  make docker-test-tsan@ubuntu2004
> +  make docker-test-tsan@ubuntu2204
>
>  TSan warnings under docker are placed in files located at build/tsan/.
>
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 8f332fc36f..be319ab2d0 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -38,9 +38,9 @@ avocado-system-alpine:
>  build-system-ubuntu:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --enable-docs --enable-fdt=3Dsystem --enable-capston=
e
>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
>        microblazeel-softmmu mips64el-softmmu
> @@ -56,7 +56,7 @@ check-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      MAKE_CHECK_ARGS: check
>
>  avocado-system-ubuntu:
> @@ -65,7 +65,7 @@ avocado-system-ubuntu:
>      - job: build-system-ubuntu
>        artifacts: true
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      MAKE_CHECK_ARGS: check-avocado
>
>  build-system-debian:
> @@ -459,10 +459,10 @@ avocado-cfi-x86_64:
>  tsan-build:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang-10 --cxx=3Dclang++-10
> +    IMAGE: ubuntu2204
> +    CONFIGURE_ARGS: --enable-tsan --cc=3Dclang --cxx=3Dclang++
>            --enable-trace-backends=3Dust --enable-fdt=3Dsystem --disable-=
slirp
>      TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-u=
ser
>      MAKE_CHECK_ARGS: bench V=3D1
> @@ -471,10 +471,10 @@ tsan-build:
>  gcov:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    timeout: 80m
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --enable-gcov
>      TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
>      MAKE_CHECK_ARGS: check
> @@ -539,9 +539,9 @@ build-tci:
>  build-coroutine-sigaltstack:
>    extends: .native_build_job_template
>    needs:
> -    job: amd64-ubuntu2004-container
> +    job: amd64-ubuntu2204-container
>    variables:
> -    IMAGE: ubuntu2004
> +    IMAGE: ubuntu2204
>      CONFIGURE_ARGS: --with-coroutine=3Dsigaltstack --disable-tcg
>                      --enable-trace-backends=3Dftrace
>      MAKE_CHECK_ARGS: check-unit
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 96d2a3b58b..8637a13d86 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -13,10 +13,10 @@ amd64-debian-container:
>    variables:
>      NAME: debian-amd64
>
> -amd64-ubuntu2004-container:
> +amd64-ubuntu2204-container:
>    extends: .container_job_template
>    variables:
> -    NAME: ubuntu2004
> +    NAME: ubuntu2204
>
>  amd64-opensuse-leap-container:
>    extends: .container_job_template
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/do=
ckerfiles/ubuntu2204.docker
> similarity index 91%
> rename from tests/docker/dockerfiles/ubuntu2004.docker
> rename to tests/docker/dockerfiles/ubuntu2204.docker
> index f34d88d33d..30b9e56793 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2204.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile --layers all ubuntu-2004 qemu
> +#  $ lcitool dockerfile --layers all ubuntu-2204 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>
> -FROM docker.io/library/ubuntu:20.04
> +FROM docker.io/library/ubuntu:22.04
>
>  RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>      apt-get update && \
> @@ -14,7 +14,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        bash \
>                        bc \
>                        bison \
> -                      bsdmainutils \
> +                      bsdextrautils \
>                        bzip2 \
>                        ca-certificates \
>                        ccache \
> @@ -36,6 +36,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        libasan5 \
>                        libasound2-dev \
>                        libattr1-dev \
> +                      libbpf-dev \
>                        libbrlapi-dev \
>                        libbz2-dev \
>                        libc6-dev \
> @@ -90,6 +91,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        libtasn1-6-dev \
>                        libubsan1 \
>                        libudev-dev \
> +                      liburing-dev \
>                        libusb-1.0-0-dev \
>                        libusbredirhost-dev \
>                        libvdeplug-dev \
> @@ -100,6 +102,7 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        llvm \
>                        locales \
>                        make \
> +                      meson \
>                        multipath-tools \
>                        ncat \
>                        nettle-dev \
> @@ -111,11 +114,9 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>                        python3-opencv \
>                        python3-pillow \
>                        python3-pip \
> -                      python3-setuptools \
>                        python3-sphinx \
>                        python3-sphinx-rtd-theme \
>                        python3-venv \
> -                      python3-wheel \
>                        python3-yaml \
>                        rpm2cpio \
>                        sed \
> @@ -139,13 +140,8 @@ RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>
> -RUN /usr/bin/pip3 install meson=3D=3D0.56.0
> -
>  ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>  ENV LANG "en_US.UTF-8"
>  ENV MAKE "/usr/bin/make"
>  ENV NINJA "/usr/bin/ninja"
>  ENV PYTHON "/usr/bin/python3"
> -# Apply patch https://reviews.llvm.org/D75820
> -# This is required for TSan in clang-10 to compile with QEMU.
> -RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/i=
nclude/sanitizer/tsan_interface.h
> diff --git a/tests/docker/test-tsan b/tests/docker/test-tsan
> index 53d90d2f79..f6d6590e39 100755
> --- a/tests/docker/test-tsan
> +++ b/tests/docker/test-tsan
> @@ -21,7 +21,7 @@ setup_tsan()
>      tsan_log_dir=3D"/tmp/qemu-test/build/tsan"
>      mkdir -p $tsan_log_dir > /dev/null || true
>      EXTRA_CONFIGURE_OPTS=3D"${EXTRA_CONFIGURE_OPTS} --enable-tsan \
> -                          --cc=3Dclang-10 --cxx=3Dclang++-10 \
> +                          --cc=3Dclang --cxx=3Dclang++ \
>                            --disable-werror --extra-cflags=3D-O0"
>      # detect deadlocks is false currently simply because
>      # TSan crashes immediately with deadlock detector enabled.
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index a5ea0efc3b..eeee9a7b34 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -69,13 +69,6 @@ def generate_cirrus(target, trailer=3DNone):
>      generate(filename, cmd, trailer)
>
>
> -ubuntu2004_tsanhack =3D [
> -    "# Apply patch https://reviews.llvm.org/D75820\n",
> -    "# This is required for TSan in clang-10 to compile with QEMU.\n",
> -    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.=
0.0/include/sanitizer/tsan_interface.h\n"
> -]
> -
> -
>  # Netmap still needs to be manually built as it is yet to be packaged
>  # into a distro. We also add cscope and gtags which are used in the CI
>  # test
> @@ -113,8 +106,7 @@ try:
>                          trailer=3D"".join(debian11_extras))
>      generate_dockerfile("fedora", "fedora-37")
>      generate_dockerfile("opensuse-leap", "opensuse-leap-153")
> -    generate_dockerfile("ubuntu2004", "ubuntu-2004",
> -                        trailer=3D"".join(ubuntu2004_tsanhack))
> +    generate_dockerfile("ubuntu2204", "ubuntu-2204")
>
>      #
>      # Cross compiling builds
> --
> 2.39.1
>


