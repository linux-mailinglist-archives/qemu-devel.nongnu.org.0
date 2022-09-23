Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D285E7C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:54:50 +0200 (CEST)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obj8j-0004QT-Jm
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obiyO-0003PK-I8
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obiyG-0001ZR-Bh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 09:44:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y5so95316wrh.3
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=D3f7BtO/lOGvlIXEhHLAueiv9eX07SC3sSWG4Oh/aR0=;
 b=l7zabubhkj3c5V9funWHS3KfR0DE0XYh2bmFNklkBwZ2XC96qZIzvoK8Qx6fmia7Sk
 w5XiVASlZa+ymCfoNH76bwJwrGE944SBkg9ZEDeCt78AznZXi0vO/21PA/qEAm7owsIA
 Dv19kx4TIrT1HInoa4HI+HK7v2nHz60rBA7Ae+SU6OiyijHvxHRj8QL4RotfGfN3FPgU
 mZJy94YWBsx58kIcGWM1ZayrtkjtoQDoh7ZMrOezGclpOf/nYBBJqJAdh9bXQN0KQRiL
 budvHII+9cneED6DQTDxdyeIRHWnCS70qOqAXBxmuaSDk888vBXVYqg1PNa5OCPovyja
 dqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=D3f7BtO/lOGvlIXEhHLAueiv9eX07SC3sSWG4Oh/aR0=;
 b=xaAI5bZgOuubuTs82RMoZumoqHYxiowkvH7TqBMcQsj1stJuSHW95X1pgnk9S5uWDl
 j3J7iwB9YbO/YPuMexV1s0W/zsqDgYBg/9oW4cpYegYW+YJelvcQ3yUSTDF+iql07+Ay
 wngRMixHDxktTUaCzJxhGXsFuezSWVfcknOfIg9C+Th4UWh7WasiU/046bATnjU0RZ44
 Of8gjS+TpxJVSxhmdAoDLlRhMURpgJZxx5OMMcXGZREFxe7OyLrOsgVKSlokKXCvkrpI
 /+NrIb9nnlwXz4liFdELtBaH90QuFfaD3ucJg5veLyxH3p+8lP1D6WDgA13Lrd5f42vf
 m8wg==
X-Gm-Message-State: ACrzQf109lH3dh5XGAssBjtwXSEidJYl7epTmK+h5wsC9N367jj99KBt
 yYmomouiMWEqe8OK0DMaSsL8mQ==
X-Google-Smtp-Source: AMsMyM4/9jhYCqExru872JhfZQvm+1vzOK1YESEGcQUOoTJWlsx5mgAgm1Ygsd/z/ZA81DihQFt5dA==
X-Received: by 2002:a5d:59c7:0:b0:229:b76f:e2bf with SMTP id
 v7-20020a5d59c7000000b00229b76fe2bfmr5018761wry.128.1663940638805; 
 Fri, 23 Sep 2022 06:43:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h2-20020adffa82000000b0022584c82c80sm7284373wrr.19.2022.09.23.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 06:43:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6ED731FFB7;
 Fri, 23 Sep 2022 14:43:57 +0100 (BST)
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-11-anjo@rev.ng>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, ale@rev.ng, babush@rev.ng, nizzo@rev.ng,
 tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH v11 10/15] target/hexagon: manually add flex/bison/glib2
 to remaining containers
Date: Fri, 23 Sep 2022 14:42:45 +0100
In-reply-to: <20220804115548.13024-11-anjo@rev.ng>
Message-ID: <87bkr6w6hu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Anton Johansson <anjo@rev.ng> writes:

> Adds our build-time dependencies to containers which build qemu-hexagon,
> but aren't covered by libvirt-ci.
>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  .gitlab-ci.d/windows.yml                             | 6 ++++--
>  tests/docker/dockerfiles/debian-riscv64-cross.docker | 3 +++
>  tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
>  tests/docker/dockerfiles/debian10.docker             | 3 +++

tricore doesn't build QEMU and debian10 went away in the last PR. To
avoid confusion as the rest of the patch set makes its way through I've
pulled 8, 9, and 10 into testing/next for my next PR.

>  tests/docker/dockerfiles/fedora-i386-cross.docker    | 2 ++
>  tests/docker/dockerfiles/fedora-win32-cross.docker   | 3 +++
>  tests/docker/dockerfiles/fedora-win64-cross.docker   | 3 +++
>  7 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index c4bde758be..17dbd35725 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -33,7 +33,8 @@ msys2-64bit:
>    extends: .shared_msys2_builder
>    script:
>    - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
> -      diffutils git grep make sed
> +      bison diffutils flex
> +      git grep make sed
>        mingw-w64-x86_64-capstone
>        mingw-w64-x86_64-curl
>        mingw-w64-x86_64-cyrus-sasl
> @@ -68,7 +69,8 @@ msys2-32bit:
>    extends: .shared_msys2_builder
>    script:
>    - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
> -      diffutils git grep make sed
> +      bison diffutils flex
> +      git grep make sed
>        mingw-w64-i686-capstone
>        mingw-w64-i686-curl
>        mingw-w64-i686-cyrus-sasl
> diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests=
/docker/dockerfiles/debian-riscv64-cross.docker
> index 594d97982c..9715791e0b 100644
> --- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
> @@ -16,13 +16,16 @@ RUN apt update && \
>=20=20
>  # Install common build utilities
>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
> +    bison \
>      bc \
>      build-essential \
>      ca-certificates \
>      debian-ports-archive-keyring \
>      dpkg-dev \
> +    flex \
>      gettext \
>      git \
> +    libglib2.0-dev \
>      ninja-build \
>      pkg-config \
>      python3
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests=
/docker/dockerfiles/debian-tricore-cross.docker
> index b573b9ded2..63f977066c 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -19,6 +19,7 @@ RUN apt update && \
>         bison \
>         bzip2 \
>         ca-certificates \
> +       flex \
>         ccache \
>         g++ \
>         gcc \
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
> index 03be923066..1fc2fc1ddb 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -18,15 +18,18 @@ RUN apt update && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt install -y --no-install-recommends \
>          bc \
> +        bison \
>          build-essential \
>          ca-certificates \
>          ccache \
>          clang \
>          dbus \
> +        flex \
>          gdb-multiarch \
>          gettext \
>          git \
>          libffi-dev \
> +        libglib2.0-dev \
>          libncurses5-dev \
>          ninja-build \
>          pkg-config \
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/do=
cker/dockerfiles/fedora-i386-cross.docker
> index 0a3ec346e6..7eec648d2d 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,9 +1,11 @@
>  FROM registry.fedoraproject.org/fedora:34
>=20=20
>  ENV PACKAGES \
> +    bison \
>      bzip2 \
>      ccache \
>      diffutils \
> +    flex \
>      findutils \
>      gcc \
>      git \
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win32-cross.docker
> index a06bd29e8e..aca37aabc4 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
>      bc \
> +    bison \
>      bzip2 \
>      ccache \
>      diffutils \
>      findutils \
> +    flex \
>      gcc \
>      gettext \
>      git \
> +    glib2-devel \
>      hostname \
>      make \
>      meson \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win64-cross.docker
> index b71624330f..3642766479 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -3,13 +3,16 @@ FROM registry.fedoraproject.org/fedora:35
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
>      bc \
> +    bison \
>      bzip2 \
>      ccache \
>      diffutils \
>      findutils \
> +    flex \
>      gcc \
>      gettext \
>      git \
> +    glib2-devel \
>      hostname \
>      make \
>      meson \


--=20
Alex Benn=C3=A9e

