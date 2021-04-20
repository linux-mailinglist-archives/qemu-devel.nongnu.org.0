Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D43658E9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:26:39 +0200 (CEST)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpSg-0005nl-6t
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYpQA-0004qD-JF
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:24:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYpQ7-0007in-0f
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:24:02 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so10230586wmh.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bz4Ivl26W/43kJwR+gexX+gIka6Tqh42SO2BM3SNQYs=;
 b=hP+HcmyPLeKxiV4l0PnkAxcTpZWcClW7YWsLQgwxkQSu95Hffho6dnsckOh0L/Aocy
 jT+MiermEJzWmfBY0qmPgfEdWm2l0PegHm6zr4NzkToExCoQ3wlgYdRGW69pT0qPcy9B
 QHhESH9xLAahEFzm4+bi/8L45iU/tM2XbOOFdkjdDxV2k8gphVpLKdf+ezXBX9mhgq1r
 dNy3uMMiEUuBfm0XL+KIX9RNYNfioftTdXcMj+JdK3DaAcAfSwWPEGtnYfda1UA1Pbyc
 RUKTt4eQEi88hDnyZ+Iu3gfH4r4rxCPXkL4Hrjojl+0c/Acn7Dqdva9dmoa9miUQ85gZ
 N2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bz4Ivl26W/43kJwR+gexX+gIka6Tqh42SO2BM3SNQYs=;
 b=JLHKONT/1twRY8+lHrjG5imVsNzjedp/O5yyl2qYYDICb6z4++yFxBf4EXuca21dpd
 4DdcKnATXRgSqdO1uMY3rJLqrZGVx8Z+Y4glMgUFvGrwN0Nu5ZvPO2QkfiDsX8s9cmq6
 dRnc584tSNWhrPpOgwK9nQM9VL4su21Qorz74WV9cKPKYMCzlMqjoxBNJtAQ9/zuh8Ra
 trSWDC44O7RhXCh7SlQVtyURxAGLffvumjAa0dxvCWQG9jK6BSQegGts+bO+RUkBdcyA
 XwW7wH4eqnTUhteHGbeNYY4CC+3vfyzy8uqBfqOIAe2ikHbnhyMerzfQiA9EDgfvUjcW
 Fpzg==
X-Gm-Message-State: AOAM533hEYOpWUR1Sv4/kkoZRgIG46oEFXFuq7aMExpTSUtD/UTCnK9n
 rrE6uUA9V64rfAPG3TAeiKN/HQ==
X-Google-Smtp-Source: ABdhPJyJW/f3LVCUCVBmBf9h4vC6wxKyjqqjNXeDA8qm6drIsSGYXszZZ1BK/P982T5mf6AqgjtkPw==
X-Received: by 2002:a7b:c40d:: with SMTP id k13mr4266248wmi.116.1618921437383; 
 Tue, 20 Apr 2021 05:23:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm3124768wmj.46.2021.04.20.05.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 05:23:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E1B91FF7E;
 Tue, 20 Apr 2021 13:23:55 +0100 (BST)
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
 <YH5RkjCx2Bk4mbop@yekko.fritz.box>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{,
 le} tests
Date: Tue, 20 Apr 2021 13:20:26 +0100
In-reply-to: <YH5RkjCx2Bk4mbop@yekko.fritz.box>
Message-ID: <87eef587qc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gustavo.romero@protonmail.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 qemu-ppc@nongnu.org, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br w=
rote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>=20
>> A newer compiler is needed to build tests for Power10 instructions. As
>> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>> is added to verify that the toolchain in use has '-mpower10'.
>>=20
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>  tests/docker/Makefile.include                   |  2 ++
>>  .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
>>  tests/tcg/configure.sh                          | 12 ++++++++----
>>  3 files changed, 27 insertions(+), 4 deletions(-)
>>  create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.d=
ocker
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 9f464cb92c..f1dbcc639f 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-de=
bian10
>>  docker-image-debian-tricore-cross: docker-image-debian10
>>  docker-image-debian-all-test-cross: docker-image-debian10
>>  docker-image-debian-arm64-test-cross: docker-image-debian11
>> +docker-image-debian-power-test-cross: docker-image-debian11
>>=20=20
>>  # These images may be good enough for building tests but not for test b=
uilds
>>  DOCKER_PARTIAL_IMAGES +=3D debian-alpha-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-arm64-test-cross
>> +DOCKER_PARTIAL_IMAGES +=3D debian-power-test-cross
>
> You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
> images here, but they don't seem to be referenced anywhere else.
>
>>  DOCKER_PARTIAL_IMAGES +=3D debian-hppa-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-m68k-cross debian-mips64-cross
>>  DOCKER_PARTIAL_IMAGES +=3D debian-powerpc-cross debian-ppc64-cross

I was expecting the new debian-power-test-cross to replace both
debian-powerpc-cross and debian-ppc64-cross.

>> diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b=
/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>> new file mode 100644
>> index 0000000000..36b336f709
>> --- /dev/null
>> +++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>> @@ -0,0 +1,17 @@
>> +#
>> +# Docker powerpc/ppc64/ppc64le cross-compiler target
>> +#
>> +# This docker target builds on the debian Bullseye base image.
>> +#
>> +FROM qemu/debian11
>> +
>> +RUN apt update && \
>> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>> +    apt install -y --no-install-recommends \
>> +        gcc-powerpc-linux-gnu \
>> +        libc6-dev-powerpc-cross \
>> +        gcc-10-powerpc64-linux-gnu \
>> +        libc6-dev-ppc64-cross \
>> +        gcc-10-powerpc64le-linux-gnu \
>> +        libc6-dev-ppc64el-cross
>
> I'm not really clear on what distinguishes a -cross.docker image and a
> -test-cross.docker image.

The normal cross image (debian-ppc64le-cross) can cross build QEMU. The
-test-cross images are just used for building check-tcg test cases.

>
>> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
>> index fa1a4261a4..a0be066499 100755
>> --- a/tests/tcg/configure.sh
>> +++ b/tests/tcg/configure.sh
>> @@ -170,13 +170,13 @@ for target in $target_list; do
>>        ;;
>>      ppc64-*)
>>        container_hosts=3Dx86_64
>> -      container_image=3Ddebian-ppc64-cross
>> -      container_cross_cc=3Dpowerpc64-linux-gnu-gcc
>> +      container_image=3Ddebian-powerpc-test-cross
>> +      container_cross_cc=3Dpowerpc64-linux-gnu-gcc-10
>>        ;;
>>      ppc64le-*)
>>        container_hosts=3Dx86_64
>> -      container_image=3Ddebian-ppc64el-cross
>> -      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc
>> +      container_image=3Ddebian-powerpc-test-cross
>> +      container_cross_cc=3Dpowerpc64le-linux-gnu-gcc-10
>
> Doesn't this remove all uses of the debian-pp64-cross and

Yes this should be removed.

> debian-ppc64el-cross images, in which case you could remove the
> matching docker files and so forth too, no?

Well I assume you still want to check cross building of QEMU. Arguably
we could still use that for the test cases as well.

>
>>        ;;
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

