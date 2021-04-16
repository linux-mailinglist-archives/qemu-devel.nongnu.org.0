Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD293621F5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:17:00 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPHH-00030R-Mt
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXPFG-0001ea-BJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:14:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXPFC-0007nc-On
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:14:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so16626604wma.3
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Suoh6drSA2r2AHm83yRACjwmRqy2lLqKn7aRv2oVNN0=;
 b=gDcieit4paJbBUhcCBywpWtEkKcIM+oUEAYXTdXz3spLRsTMlcQfiE4HsKhbljxBMP
 /6cTGxTnvKzzdNAs1pz7yJLV9FR7ieebxtIayoLH1uqNilyAP0Ngd3aJNGySu2mcLsAN
 1n0KKpl6p5yOuydOksq/Xd0wGxuYssiZuo9Y26ymxC5/kwAf9aounnhagzFfh0OP7LSo
 PXbXo2jfwQt+vFNWlHqhhqr2Hn3K7tc74gFN/k4u8pqYD3UKCrnT+5pRd7fTkSWH7My0
 TJ9vooGYIhMJtX2Zpmwn8UHNdFn0g7QbSYYkzxMTEy/eET6GUETeBl8IlixpKf3ywuV/
 A+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Suoh6drSA2r2AHm83yRACjwmRqy2lLqKn7aRv2oVNN0=;
 b=nC10NSH8sT3J+rCjo8ZowmMGSoao2yKVq79iWSlwhRhN8w5ZOy/gXturwmYwIR6JKu
 momCMNijbqxrIl9uwsPOpSAbS4pAxDlvO4qFq1GuhOn42c+kjXsyLhm3Ewrtl5Dkbapr
 2Q/jNEg2M3TY9XY4G4k8JC0seafRYcV1cJaHxhw+hVt623x5VYs4FylHgncTQOSDNP4t
 +nbO75an6DU9GJ9DhwLpdG5CUAnhQPt07WQ/tVpQuzG+PxVJWi6379MKzBDnYJe/i5K0
 afSlZFUAOJqr9ozE7mAuxi0pQYAca92SY7ZXzEW5k1D8ICG2SHmrOHmYZ8jcIh3CFGvg
 wBrw==
X-Gm-Message-State: AOAM531Ur4EL1ptVPrZVzKl1yRJAmgMczBoscdd+V7Ai0+Jem7XTcfqk
 LwB/UShZJ8mLhmuCG0E8+RRumA==
X-Google-Smtp-Source: ABdhPJwgVjGj1QFt+xYXQZ49KOsdbUGNMR4P7Mb9go15esnytMIuXKikQPpy/W2EGvQsgE3+yqt10Q==
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr8608290wmh.154.1618582488375; 
 Fri, 16 Apr 2021 07:14:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm10924748wrp.46.2021.04.16.07.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:14:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADDCA1FF7E;
 Fri, 16 Apr 2021 15:14:46 +0100 (BST)
References: <20210415214138.563795-1-matheus.ferst@eldorado.org.br>
 <20210415214138.563795-2-matheus.ferst@eldorado.org.br>
 <YHkLU6rlVOl2v6Al@yekko.fritz.box>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 1/3] tests/docker: gcc-10 based images for
 ppc64{,le} tests
Date: Fri, 16 Apr 2021 15:07:28 +0100
In-reply-to: <YHkLU6rlVOl2v6Al@yekko.fritz.box>
Message-ID: <87tuo6joyx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, gustavo.romero@protonmail.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Apr 15, 2021 at 06:41:36PM -0300, matheus.ferst@eldorado.org.br w=
rote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>=20
>> A newer compiler is needed to build tests for Power10 instructions. As
>> done for arm64 on c729a99d2701, new '-test-cross' images are created for
>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>> is added to verify that the toolchain in use has '-mpower10'.
>>=20
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>  tests/docker/Makefile.include                   |  4 ++++
>>  .../dockerfiles/debian-ppc64-test-cross.docker  | 13 +++++++++++++
>>  .../debian-ppc64el-test-cross.docker            | 17 +++++++++++++++++
>>  tests/tcg/configure.sh                          | 12 ++++++++----
>>  4 files changed, 42 insertions(+), 4 deletions(-)
>>  create mode 100644 tests/docker/dockerfiles/debian-ppc64-test-cross.doc=
ker
>>  create mode 100644 tests/docker/dockerfiles/debian-ppc64el-test-cross.d=
ocker
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 9f464cb92c..1f8941d290 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -152,10 +152,14 @@ docker-image-debian-sparc64-cross: docker-image-de=
bian10
>>  docker-image-debian-tricore-cross: docker-image-debian10
>>  docker-image-debian-all-test-cross: docker-image-debian10
>>  docker-image-debian-arm64-test-cross: docker-image-debian11
>> +docker-image-debian-ppc64-test-cross: docker-image-debian11
>> +docker-image-debian-ppc64el-test-cross: docker-image-debian11
>>=20=20
>>  # These images may be good enough for building tests but not for test b=
uilds
>>  DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
>> +DOCKER_PARTIAL_IMAGES +=3D debian-ppc64-test-cross
>> +DOCKER_PARTIAL_IMAGES +=3D debian-ppc64el-test-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-cross debian-ppc64-cross
>
> Why are you adding new images, rather than updating the existing
> debian-powerpc-cross image?

Right - we could consider renaming the image to debian-power-test-cross
just to make it clear it's just for building tests.

The final image would essentially be:

RUN apt update && \
    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
    apt install -y --no-install-recommends \
        gcc-powerpc-linux-gnu \
        libc6-dev-powerpc-cross \
        gcc-10-powerpc64-linux-gnu \
        libc6-dev-ppc64-cross \
        gcc-10-powerpc64le-linux-gnu \
        libc6-dev-ppc64le-cross=20

> I don't think you should need separate
> ppc64 and ppc64el images, a single image with a gcc that can target
> both should suffice.  (Also, it's typically ppc64le, not ppc64el,
> which, yes, is different from what the mips and arm people do for no
> particularly good reason).
>
>> diff --git a/tests/docker/dockerfiles/debian-ppc64-test-cross.docker b/t=
ests/docker/dockerfiles/debian-ppc64-test-cross.docker
>> new file mode 100644
>> index 0000000000..66abfdeb47
>> --- /dev/null
>> +++ b/tests/docker/dockerfiles/debian-ppc64-test-cross.docker
>> @@ -0,0 +1,13 @@
>> +#
>> +# Docker ppc64 cross-compiler target (tests only)
>> +#
>> +# This docker target builds on the debian Bullseye base image.
>> +#
>> +FROM qemu/debian11
>> +
>> +# Add the foreign architecture we want and install dependencies
>> +RUN dpkg --add-architecture ppc64

Adding a foreign architecture is only really required for getting cross
libraries for more complex things like QEMU, for tcg tests directly
including the libc is enough.
>> +
>> +# Add the foreign architecture we want and install dependencies
>> +RUN dpkg --add-architecture ppc64el
>> +RUN apt update && \
>> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>> +        apt install -y --no-install-recommends \
>> +        crossbuild-essential-ppc64el gcc-10-powerpc64le-linux-gnu

include the libc instead of crossbuild which brings in a lot more than
we need for tests.

>> +
>> +# Specify the cross prefix for this image (see tests/docker/common.rc)
>> +#ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Dpowerpc64le-linux-gnu-
>> +#ENV DEF_TARGET_LIST ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-us=
er
>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>> index fa1a4261a4..5f5db91a01 100755
>> --- a/tests/tcg/configure.sh
>> +++ b/tests/tcg/configure.sh
>> @@ -170,13 +170,13 @@ for target in $target_list; do
>>        ;;
>>      ppc64-*)
>>        container_hosts=3Dx86_64
>> -      container_image=3Ddebian-ppc64-cross
>> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
>> +      container_image=3Ddebian-ppc64-test-cross
>> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>>        ;;
>>      ppc64le-*)
>>        container_hosts=3Dx86_64
>> -      container_image=3Ddebian-ppc64el-cross
>> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
>> +      container_image=3Ddebian-ppc64el-test-cross
>> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10
>>        ;;

I don't know if it's possible to nest the cases but if it's not too
ugly bringing all the cases into one place and just differentiating the
container_cross_cc would be nice.

>>      riscv64-*)
>>        container_hosts=3Dx86_64
>> @@ -280,6 +280,10 @@ for target in $target_list; do
>>                 -mpower8-vector -o $TMPE $TMPC; then
>>                  echo "CROSS_CC_HAS_POWER8_VECTOR=3Dy" >> $config_target=
_mak
>>              fi
>> +            if do_compiler "$target_compiler" $target_compiler_cflags \
>> +               -mpower10 -o $TMPE $TMPC; then
>> +                echo "CROSS_CC_HAS_POWER10=3Dy" >> $config_target_mak
>> +            fi
>>          ;;
>>          i386-linux-user)
>>              if do_compiler "$target_compiler" $target_compiler_cflags \


--=20
Alex Benn=C3=A9e

