Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219B4B8BDC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:56:34 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLjN-0007J8-1N
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKLi6-0006Vs-95
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:55:15 -0500
Received: from [2a00:1450:4864:20::62f] (port=45600
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nKLhy-00011T-AD
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:55:08 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lw4so5118911ejb.12
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wUdc+2mA8pKCy0jMlItcXO03jldAuhzWi/FvpMLc670=;
 b=zAQRiAMaMgbt20MPkgMdOf5xkhNfCkxetElLjVVnNE5Nov398onfx3HfM4Ob8M5Dgd
 iptbPTtZnE4nTVj2jrqPImnaxCER7dKIncl0T4f9DeeZftVjZ9LxULwpTS1Ex8uuO1Zj
 UkO63uoars7XuXilUx0tuE5vgQUioaQ+Dpg9VTYL7wDqRgPO11+3rHjDQGkUy+K4mRm5
 9Q2/Ez+DsiMvUlY+w/KrhQnoECGdrGApxUOAyHsW1qVYXC/iPxEOfwIzk240T5qCqmwz
 9NmQ1ZwifKjHK5YnPJ56V77sr5sYtLZunvd6VaP3tlX2vSoI1Eds8ALbfPzwKTgzObIw
 sLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wUdc+2mA8pKCy0jMlItcXO03jldAuhzWi/FvpMLc670=;
 b=1qwXFCn6FHp5nG4QEYfLZefdgRrOWGE6/QPuza6aMkaRS5/OkDBrV4vCy0Ae2SX/H3
 jBNBqaM7Ee6eJphIl1DMiMDNjKPI4iNwyluRMPXGqGFp69NBFXPwKVtBzoOI6Bdq4CBE
 ak9HC3AqhJfatr2q4ZHB+eUe2wkXDA8MeoVMfg/9gNhrN4oK3b4CcEhW4Y/e9FMFSMFr
 wNh9s1aWOOOmV9IyG+pwJ7nfjG8jXu6X7zMqAMSsIfBpW9GqI0Tb2REbFIuj89yjgfJr
 QZhnI51yTNYfbYw//c2/2kHCJ/dehDdX8gZvB3NL48jKH0cB6yWJGaL2nz/G2no3UXrB
 NKig==
X-Gm-Message-State: AOAM5321DFD7iAVWPsiyaBNku8VyRCBroRyfy4jwoWh2ebxX9t2Lqgg8
 gHLKcJbgWJQ9inAaMuIfN6lEwg==
X-Google-Smtp-Source: ABdhPJw0J2XRRFZZzGFqlOHrbdJDqBMPkPiQHI6MGkhnETuNT3xgF+msn3UX0LCdtNDpec8K/ohmrw==
X-Received: by 2002:a17:906:c7cd:b0:6b7:a0ea:81f with SMTP id
 dc13-20020a170906c7cd00b006b7a0ea081fmr2638774ejb.502.1645023298406; 
 Wed, 16 Feb 2022 06:54:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm1738974edt.49.2022.02.16.06.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 06:54:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD88020329;
 Wed, 16 Feb 2022 14:54:55 +0000 (GMT)
References: <20220216115102.206129-1-david@redhat.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] tests/tcg/s390x: Build tests with debian11
Date: Wed, 16 Feb 2022 14:54:26 +0000
In-reply-to: <20220216115102.206129-1-david@redhat.com>
Message-ID: <87wnhuc14w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Hildenbrand <david@redhat.com> writes:

> We need a newer compiler to build upcoming tests that test for z15
> features with -march=3Dz15. So let's do it similar to arm64 and powerpc,
> using an environment based on debian11 to build tests only.
>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Cc: Beraldo Leal <bleal@redhat.com>
> Cc: David Miller <dmiller423@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

for now... I'll update the s390x image on my next posting.

> ---
>  .gitlab-ci.d/container-cross.yml                    |  7 +++++++
>  tests/docker/Makefile.include                       |  3 ++-
>  .../dockerfiles/debian-s390x-test-cross.docker      | 13 +++++++++++++
>  tests/tcg/configure.sh                              |  2 +-
>  4 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-s390x-test-cross.dock=
er
>
> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cr=
oss.yml
> index a3b5b90552..f8544750ea 100644
> --- a/.gitlab-ci.d/container-cross.yml
> +++ b/.gitlab-ci.d/container-cross.yml
> @@ -146,6 +146,13 @@ s390x-debian-cross-container:
>    variables:
>      NAME: debian-s390x-cross
>=20=20
> +s390x-test-debian-cross-container:
> +  extends: .container_job_template
> +  stage: containers-layer2
> +  needs: ['amd64-debian11-container']
> +  variables:
> +    NAME: debian-s390x-test-cross
> +
>  sh4-debian-cross-container:
>    extends: .container_job_template
>    stage: containers-layer2
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index f1a0c5db7a..b77f6088d9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -210,6 +210,7 @@ docker-image-debian-arm64-test-cross: docker-image-de=
bian11
>  docker-image-debian-microblaze-cross: docker-image-debian10
>  docker-image-debian-nios2-cross: docker-image-debian10
>  docker-image-debian-powerpc-test-cross: docker-image-debian11
> +docker-image-debian-s390x-test-cross: docker-image-debian11
>=20=20
>  # These images may be good enough for building tests but not for test bu=
ilds
>  DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
> @@ -219,7 +220,7 @@ DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-microblaze-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-nios2-cross
> -DOCKER_PARTIAL_IMAGES +=3D debian-sh4-cross debian-sparc64-cross
> +DOCKER_PARTIAL_IMAGES +=3D debian-s390x-test-cross debian-sh4-cross debi=
an-sparc64-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-tricore-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-xtensa-cross
>  DOCKER_PARTIAL_IMAGES +=3D fedora-cris-cross
> diff --git a/tests/docker/dockerfiles/debian-s390x-test-cross.docker b/te=
sts/docker/dockerfiles/debian-s390x-test-cross.docker
> new file mode 100644
> index 0000000000..26435287b6
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-s390x-test-cross.docker
> @@ -0,0 +1,13 @@
> +#
> +# Docker s390x cross-compiler target (tests only)
> +#
> +# This docker target builds on the debian Bullseye base image.
> +#
> +FROM qemu/debian11
> +
> +# Add the foreign architecture we want and install dependencies
> +RUN dpkg --add-architecture s390x
> +RUN apt update && \
> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +        apt install -y --no-install-recommends \
> +        crossbuild-essential-s390x gcc-10-s390x-linux-gnu
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 763e9b6ad8..3f00f9307f 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -185,7 +185,7 @@ for target in $target_list; do
>        ;;
>      s390x-*)
>        container_hosts=3Dx86_64
> -      container_image=3Ddebian-s390x-cross
> +      container_image=3Ddebian-s390x-test-cross
>        container_cross_cc=3Ds390x-linux-gnu-gcc
>        ;;
>      sh4-*)


--=20
Alex Benn=C3=A9e

