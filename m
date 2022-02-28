Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3E4C64F9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:41:31 +0100 (CET)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObaz-0007XI-Qa
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:41:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nObZF-00060W-7O
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nObZA-0005ZG-PG
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646037575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=px12nRZc1W+gffWFl+sH54IvysCFad3DulaOdh+nro4=;
 b=Iwl3Fm7J6U/iW1gMyYMkuBYwSWFLh+AaRqEkvR51YB2lSSzARDDehotUff/fMpeTeE2ZSW
 VLNtCrxEc08Nv9uWLepGGZXg259MgpNGC17zXgC4p8C0zxvrSAUBdWbnQJZ7pEHtoQQRq5
 lAt1OIkP2sPgSX/81sPw41IZ9wr61Ic=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-OkUEoAFjPoGx7gaOhVXQCA-1; Mon, 28 Feb 2022 03:39:32 -0500
X-MC-Unique: OkUEoAFjPoGx7gaOhVXQCA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1751877wrg.19
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 00:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=px12nRZc1W+gffWFl+sH54IvysCFad3DulaOdh+nro4=;
 b=sYtnhhY8nLQ+wL15A3s2Y+Zd3++eXTZlMYOP2hOrlysuCEaFTDfaIJet/1ThG/6tCV
 M0kP3IJEVPNhRalpAlDZBcB39e0V3FbeF2Jen1ThWS93AvthiIAiEaY9tRmvG6hGC3Xp
 dXemJRH6PwHa9P//zEsE2HbQPSqOQv504/QqZAEGMGfMsyGcww1JPRn37hO7s3KVUQac
 nYXw6Y+xlJ3eOiFqJNkHZIXWFgJ8/mByVsxXxfUnn27//HbKJTQxaK1QvgyQHM3JwMS0
 iwTX/9zjA/R3EhBGigVP+D7kBvvu3Vwe/tKH6PvPa+XQpcAS81NdFdZhGyyVj1OFerIs
 HWCw==
X-Gm-Message-State: AOAM532rgLYPShVrB8gDEVQW6iAO11kyN4V4j2kVQ3RRhrgeT5JZp8Uj
 rqWkF7YYN48DKCz9EM0Psx2VmN+4SDQ8mBF9+/qJ5z/NgnwS1IAk96A2yyRWEiR7Lp7gPLYabtL
 IkuMMosNDnlIXmPY=
X-Received: by 2002:a5d:5302:0:b0:1ed:e1d2:f0fd with SMTP id
 e2-20020a5d5302000000b001ede1d2f0fdmr15207357wrv.585.1646037571332; 
 Mon, 28 Feb 2022 00:39:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXRm9xlCIoSNcb6Y91ldD+7kNwGcQWAzDEZtqxzqh+jVfYjPULXdUqw1mmBYu5XuXam/kvog==
X-Received: by 2002:a5d:5302:0:b0:1ed:e1d2:f0fd with SMTP id
 e2-20020a5d5302000000b001ede1d2f0fdmr15207334wrv.585.1646037571082; 
 Mon, 28 Feb 2022 00:39:31 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b00381614e5b60sm3618086wmq.34.2022.02.28.00.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 00:39:30 -0800 (PST)
Message-ID: <38a14acc-ffbe-e61a-3186-44a57273427a@redhat.com>
Date: Mon, 28 Feb 2022 09:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, berrange@redhat.com
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220225172021.3493923-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <dhildenb@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/2022 18.20, Alex Bennée wrote:
> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
> As a result we can drop debian-arm64-test-cross just for building
> tests.

Good idea!

One comment below...

[...]
> diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
> index 166e24df13..589510a7be 100644
> --- a/tests/docker/dockerfiles/debian-arm64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
> @@ -1,32 +1,166 @@
> +# THIS FILE WAS AUTO-GENERATED
>   #
> -# Docker arm64 cross-compiler target
> +#  $ lcitool dockerfile --layers all --cross aarch64 debian-11 qemu
>   #
> -# This docker target builds on the debian Buster base image.
> -#
> -FROM qemu/debian10
> +# https://gitlab.com/libvirt/libvirt-ci
>   
> -# Add the foreign architecture we want and install dependencies
> -RUN dpkg --add-architecture arm64
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> -        crossbuild-essential-arm64
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt build-dep -yy -a arm64 --arch-only qemu
> +FROM docker.io/library/debian:11-slim
>   
> -# Specify the cross prefix for this image (see tests/docker/common.rc)
> -ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> -ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    apt-get update && \
> +    apt-get install -y eatmydata && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            bash \
> +            bc \
> +            bsdextrautils \
> +            bzip2 \
> +            ca-certificates \
> +            ccache \
> +            dbus \
> +            debianutils \
> +            diffutils \
> +            exuberant-ctags \
> +            findutils \
> +            gcovr \
> +            genisoimage \
> +            gettext \
> +            git \
> +            hostname \
> +            libpcre2-dev \
> +            libspice-protocol-dev \
> +            libtest-harness-perl \
> +            llvm \
> +            locales \
> +            make \
> +            meson \
> +            ncat \
> +            ninja-build \
> +            openssh-client \
> +            perl-base \
> +            pkgconf \
> +            python3 \
> +            python3-numpy \
> +            python3-opencv \
> +            python3-pillow \
> +            python3-pip \
> +            python3-sphinx \
> +            python3-sphinx-rtd-theme \
> +            python3-venv \
> +            python3-yaml \
> +            rpm2cpio \
> +            sed \
> +            sparse \
> +            tar \
> +            tesseract-ocr \
> +            tesseract-ocr-eng \
> +            texinfo && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> +    dpkg-reconfigure locales
>   
> -RUN apt update && \
> -    DEBIAN_FRONTEND=noninteractive eatmydata \
> -    apt install -y --no-install-recommends \
> -        libbz2-dev:arm64 \
> -        liblzo2-dev:arm64 \
> -        librdmacm-dev:arm64 \
> -        libsnappy-dev:arm64 \
> -        libxen-dev:arm64
> +ENV LANG "en_US.UTF-8"
> +ENV MAKE "/usr/bin/make"
> +ENV NINJA "/usr/bin/ninja"
> +ENV PYTHON "/usr/bin/python3"
> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>   
> -# nettle
> -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
> +RUN export DEBIAN_FRONTEND=noninteractive && \
> +    dpkg --add-architecture arm64 && \
> +    eatmydata apt-get update && \
> +    eatmydata apt-get dist-upgrade -y && \
> +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
> +    eatmydata apt-get install --no-install-recommends -y \
> +            g++-aarch64-linux-gnu \
> +            gcc-aarch64-linux-gnu \
> +            libaio-dev:arm64 \
> +            libasan5:arm64 \
> +            libasound2-dev:arm64 \
> +            libattr1-dev:arm64 \
> +            libbpf-dev:arm64 \
> +            libbrlapi-dev:arm64 \
> +            libbz2-dev:arm64 \
> +            libc6-dev:arm64 \
> +            libcacard-dev:arm64 \
> +            libcap-ng-dev:arm64 \
> +            libcapstone-dev:arm64 \
> +            libcurl4-gnutls-dev:arm64 \
> +            libdaxctl-dev:arm64 \
> +            libdrm-dev:arm64 \
> +            libepoxy-dev:arm64 \
> +            libfdt-dev:arm64 \
> +            libffi-dev:arm64 \
> +            libfuse3-dev:arm64 \
> +            libgbm-dev:arm64 \
> +            libgcrypt20-dev:arm64 \
> +            libglib2.0-dev:arm64 \
> +            libglusterfs-dev:arm64 \
> +            libgnutls28-dev:arm64 \
> +            libgtk-3-dev:arm64 \
> +            libibumad-dev:arm64 \
> +            libibverbs-dev:arm64 \
> +            libiscsi-dev:arm64 \
> +            libjemalloc-dev:arm64 \
> +            libjpeg62-turbo-dev:arm64 \
> +            liblttng-ust-dev:arm64 \
> +            liblzo2-dev:arm64 \
> +            libncursesw5-dev:arm64 \
> +            libnfs-dev:arm64 \
> +            libnuma-dev:arm64 \
> +            libpam0g-dev:arm64 \
> +            libpixman-1-dev:arm64 \
> +            libpng-dev:arm64 \
> +            libpulse-dev:arm64 \
> +            librbd-dev:arm64 \
> +            librdmacm-dev:arm64 \
> +            libsasl2-dev:arm64 \
> +            libsdl2-dev:arm64 \
> +            libsdl2-image-dev:arm64 \
> +            libseccomp-dev:arm64 \
> +            libselinux1-dev:arm64 \
> +            libslirp-dev:arm64 \
> +            libsnappy-dev:arm64 \
> +            libspice-server-dev:arm64 \
> +            libssh-gcrypt-dev:arm64 \
> +            libsystemd-dev:arm64 \
> +            libtasn1-6-dev:arm64 \
> +            libubsan1:arm64 \
> +            libudev-dev:arm64 \
> +            liburing-dev:arm64 \
> +            libusb-1.0-0-dev:arm64 \
> +            libusbredirhost-dev:arm64 \
> +            libvdeplug-dev:arm64 \
> +            libvirglrenderer-dev:arm64 \
> +            libvte-2.91-dev:arm64 \
> +            libxen-dev:arm64 \
> +            libzstd-dev:arm64 \
> +            nettle-dev:arm64 \
> +            systemtap-sdt-dev:arm64 \
> +            xfslibs-dev:arm64 \
> +            zlib1g-dev:arm64 && \
> +    eatmydata apt-get autoremove -y && \
> +    eatmydata apt-get autoclean -y && \
> +    mkdir -p /usr/local/share/meson/cross && \
> +    echo "[binaries]\n\
> +c = '/usr/bin/aarch64-linux-gnu-gcc'\n\

Is it really just "c =" or should this be "cc =" ?

> +ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
> +strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
> +pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
> +\n\
> +[host_machine]\n\
> +system = 'linux'\n\
> +cpu_family = 'aarch64'\n\
> +cpu = 'aarch64'\n\
> +endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
> +    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
> +    mkdir -p /usr/libexec/ccache-wrappers && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-cc && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-g++ && \
> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-gcc
> +
> +ENV ABI "aarch64-linux-gnu"
> +ENV MESON_OPTS "--cross-file=aarch64-linux-gnu"
> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
> +ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user

  Thomas



