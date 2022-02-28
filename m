Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDFE4C70D4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:37:18 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOi5N-0006fY-Bk
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOi47-0005Bc-0v
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:35:59 -0500
Received: from [2a00:1450:4864:20::533] (port=40670
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOi45-0002gB-5N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 10:35:58 -0500
Received: by mail-ed1-x533.google.com with SMTP id h15so18147571edv.7
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=64elefcnAKdABhLXuzN2JjaR3VlCQbOwBgyj91hp5y0=;
 b=Q63EMDaXPGSwSAOxoJGXw0xg3SbvkhZxk4YHt6sr0ig/llB43nkGABkP9aZX6brqhW
 ue4tXQFoEjjf8BN5ilZLn8GppFAumUswzmYVI9AyDudoL0i3PSsQaTJCE18+InMVFkbq
 QsCoNk16eMJV+hkVCIaZ0fT864XjNgQ883YNV8PKdwKpxxkenbG3Om592IQK2BLDeOxy
 8/2VMFsSiG2qhXJEIbCZRTWFgbp9Tv6HEnb7q9kVEArCzXWMjq3zPxo2xaUxnaSHw8lR
 sWVeiIIO0MV8fUee+w9JYt+ZNVdicQoj0W3x2YAU+UCQOTKAJ91ol4pSr93kHwQ/Sap+
 VG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=64elefcnAKdABhLXuzN2JjaR3VlCQbOwBgyj91hp5y0=;
 b=MzHjREINqeNZOc//HztvKvLB/mK9AnkE1OrdLKbnEZrzf2zRQaUJcJQJWzkeWlSPb/
 OxwwfGu9gQVLGFg7Ukm3Wcl31padhsFv1hg5gbNzJHpyeASYZuzokQ5jlImFkbAWKQ8h
 r7uFI7+3G+Wy5FWYdzNgNQsV5ffHINTD8rwZELn4lTcpZ58/ckeVE68MiEEJbXsMv+GT
 dH5yK0pjORM1ep24mRJBcgVKmigd89c5O9VhiIJTtXoxAhB0yyJjS4iOycyKgxQj7lX4
 mNk4N8fZnKw9292a2XhRoJgLHP2xE+bG5H3lSEWRdzH46Ec0JheToBDcJ0uqWfzgJT6O
 6bcQ==
X-Gm-Message-State: AOAM5317VNL5YR+F0HTmU6L8GDyoJNwtiIZTjfvsoDQc9jFVwm8e1OEi
 qcqhyvbNXQa9rCRwlZGu57QdPw==
X-Google-Smtp-Source: ABdhPJzZhlGIl98jPFBPEPpDzu+cfa3ZwMs0ZUfADGQBNuQXueWf0rarGafjC8rGUex6X7Kam5B5dg==
X-Received: by 2002:aa7:dc0c:0:b0:413:c9ab:381c with SMTP id
 b12-20020aa7dc0c000000b00413c9ab381cmr3062756edu.275.1646062555570; 
 Mon, 28 Feb 2022 07:35:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a17090640c500b006ce06d9b4f3sm4441876ejk.73.2022.02.28.07.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 07:35:54 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF5811FFB7;
 Mon, 28 Feb 2022 15:35:53 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-5-alex.bennee@linaro.org>
 <YhyVvAv0M8WwiK2A@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH  v2 04/18] tests/docker: update debian-arm64-cross with
 lci-tool
Date: Mon, 28 Feb 2022 14:39:17 +0000
In-reply-to: <YhyVvAv0M8WwiK2A@redhat.com>
Message-ID: <87r17nm2au.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> $SUBJECT  =3D~ s/lci-tool/lcitool/
>
> On Fri, Feb 25, 2022 at 05:20:07PM +0000, Alex Benn=C3=A9e wrote:
>> Using lci-tool update debian-arm64-cross to a Debian 11 based system.
>
> Likewise
>
>> As a result we can drop debian-arm64-test-cross just for building
>> tests.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220211160309.335014-5-alex.bennee@linaro.org>
>> ---
>>  .gitlab-ci.d/container-cross.yml              |  10 +-
>>  tests/docker/Makefile.include                 |   3 -
>>  .../dockerfiles/debian-arm64-cross.docker     | 186 +++++++++++++++---
>>  .../debian-arm64-test-cross.docker            |  13 --
>>  tests/lcitool/refresh                         |  11 ++
>>  tests/tcg/configure.sh                        |   2 +-
>>  6 files changed, 173 insertions(+), 52 deletions(-)
>>  delete mode 100644 tests/docker/dockerfiles/debian-arm64-test-cross.doc=
ker
>>=20
>
>
>
>> +RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>> +    apt-get update && \
>> +    apt-get install -y eatmydata && \
>> +    eatmydata apt-get dist-upgrade -y && \
>> +    eatmydata apt-get install --no-install-recommends -y \
>> +            bash \
>
>     ...snip native packages...
>
>> +            texinfo && \
>> +    eatmydata apt-get autoremove -y && \
>> +    eatmydata apt-get autoclean -y && \
>> +    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
>> +    dpkg-reconfigure locales
>>=20=20
>> -RUN apt update && \
>> -    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>> -    apt install -y --no-install-recommends \
>> -        libbz2-dev:arm64 \
>> -        liblzo2-dev:arm64 \
>> -        librdmacm-dev:arm64 \
>> -        libsnappy-dev:arm64 \
>> -        libxen-dev:arm64
>> +ENV LANG "en_US.UTF-8"
>> +ENV MAKE "/usr/bin/make"
>> +ENV NINJA "/usr/bin/ninja"
>> +ENV PYTHON "/usr/bin/python3"
>> +ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>>=20=20
>> -# nettle
>> -ENV QEMU_CONFIGURE_OPTS $QEMU_CONFIGURE_OPTS --enable-nettle
>> +RUN export DEBIAN_FRONTEND=3Dnoninteractive && \
>> +    dpkg --add-architecture arm64 && \
>> +    eatmydata apt-get update && \
>> +    eatmydata apt-get dist-upgrade -y && \
>> +    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
>> +    eatmydata apt-get install --no-install-recommends -y \
>> +            g++-aarch64-linux-gnu \
>
>   ...snip cross packages...
>
>> +            zlib1g-dev:arm64 && \
>> +    eatmydata apt-get autoremove -y && \
>> +    eatmydata apt-get autoclean -y && \
>> +    mkdir -p /usr/local/share/meson/cross && \
>> +    echo "[binaries]\n\
>> +c =3D '/usr/bin/aarch64-linux-gnu-gcc'\n\
>> +ar =3D '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
>> +strip =3D '/usr/bin/aarch64-linux-gnu-strip'\n\
>> +pkgconfig =3D '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
>> +\n\
>> +[host_machine]\n\
>> +system =3D 'linux'\n\
>> +cpu_family =3D 'aarch64'\n\
>> +cpu =3D 'aarch64'\n\
>> +endian =3D 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu &=
& \
>> +    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' -=
-show > /packages.txt && \
>> +    mkdir -p /usr/libexec/ccache-wrappers && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-c++ && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-cc && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-g++ && \
>> +    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gn=
u-gcc
>> +
>> +ENV ABI "aarch64-linux-gnu"
>> +ENV MESON_OPTS "--cross-file=3Daarch64-linux-gnu"
>> +ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Daarch64-linux-gnu-
>> +ENV DEF_TARGET_LIST aarch64-softmmu,aarch64-linux-user
>
> This cross dockerfile is a fully self-contained image.
>
> Traditionally QEMU has had a split image for Debian cross targets,
> where there is a base with common native packages, and then a
> layer for the cross packages.
>
> lcitool is capable of generating the image in this split format
> using the arg
>
>    --layers {all,native,foreign}
>
> Personally I think it is simpler to just use the fully self
> contained image, as it would simplify our gitlab pipeline
> to only need 1 build stage for containers.  The cost is that
> we'll not be sharing layers for native packages and more wall
> clock time building since we're installing the same native
> packages over & over.
>
> I'm not saying to change your patch, I just wanted to point
> out the possibility in case someone cares strongly about
> keeping a split layer model for cross containers.

My thinking on our layered approach has evolved over the years. One of
the problems is when the two layers get out of sync and you run into
build issues due to different states of cached layers.

I think now for full cross-builds I'm fine with just going for the full
single recipe. For cross-test building there may be more argument for
having a base layer (although in the end we also ended up with
all-test-cross because we can't have containers running containers in
GitLab).

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

