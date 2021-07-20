Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE93CF728
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:46:25 +0200 (CEST)
Received: from localhost ([::1]:33294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mKV-00041G-UQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5mIw-0003D0-U4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:44:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5mIu-0000bl-Su
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:44:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so1116142wms.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=L3yRzSkRANDdtWQeNIrkHUyhcCFauotbcPBNV76aYEY=;
 b=mDf7l1VnBqCgipoHzbD8Mmk8HWxIlou8X9Eur96wLlt3yINnZFREmZIXzGgHNg4j30
 apRcZxrYWqFmI3/Xuk/jH2krkvrqKpwDJSdZ4/diTITduVoTPLF/bg9U4aK3D4fjzhnY
 DTRcFamS/odI1Uo8NnH7r0wYpvG7U/hRnyuEV4rpqklnEauqkmD0AxfC5VD4IFRqZ8FU
 Fb+U47ea3CjQjLBWAaf5V4HO8sQimpAcemmOpHuTrjRS0Fiven64iNf6DScZFeCZr1It
 U7At4vCGwdujJOjQz/ngrZNudprzLX8FGHsaQCDDCrZu3pbEyg+WxEjR+hxalza7Zttw
 ikeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=L3yRzSkRANDdtWQeNIrkHUyhcCFauotbcPBNV76aYEY=;
 b=XlxlZwjypI68KX8QM7MjUNviZAdH/mOF8NviNRRZ5XkPshtmQxbN4m0yyHmJITSRFi
 0cu7i8D7gkvjg33RG7EkIQLrXG1FNuZ1SjGEQili0CpqbOqurrZoZT32dd0hvLUKqiwn
 ojRDHIXdEE0uuDZDSEirolOni0pm6Fm2bPRq1zRLJkgqzc6shXIIczRsBh6+Lj13Iv9G
 FiyGp6tF/5gjEZp4QTOVFOc5ttkT8LuCHvan1EuVjk/k9YPmDLs7sGX9FPC0fJY+mz+U
 dQL8IO1p1nT8HWf0MPAQkau943zTS8wegYCbEywA94SQh3+UchSnq06J5JYDGozf3NtJ
 4jKQ==
X-Gm-Message-State: AOAM531uskxcDXDdjVZ3Fsb06R8Zq96V4NM8vh1rAqiOl1npN7IEfAft
 uREl/jVAaylGm4Cs1vBMyXKuOQ==
X-Google-Smtp-Source: ABdhPJyPaDyTi5Y/g7OgIqAqq4dUkIx2ZnMRV9GNXEcemUhPOxlPE8X0dCK5ZJATWWPRDCVzYfdMMA==
X-Received: by 2002:a7b:c1cd:: with SMTP id a13mr29723817wmj.94.1626774282383; 
 Tue, 20 Jul 2021 02:44:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm1973771wmj.8.2021.07.20.02.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 02:44:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA1F01FF7E;
 Tue, 20 Jul 2021 10:44:40 +0100 (BST)
References: <20210719214825.2264-1-alex.bennee@linaro.org>
 <20210719214825.2264-3-alex.bennee@linaro.org>
 <5bed073e-0fae-2153-e4fe-8cecb7b10998@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/2] gitlab: enable a very minimal build with the
 tricore container
Date: Tue, 20 Jul 2021 10:14:05 +0100
In-reply-to: <5bed073e-0fae-2153-e4fe-8cecb7b10998@linaro.org>
Message-ID: <8735s9nwtz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/19/21 11:48 AM, Alex Benn=C3=A9e wrote:
>> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/test=
s/docker/dockerfiles/debian-tricore-cross.docker
>> index 985925134c..4ea9112289 100644
>> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
>> @@ -15,9 +15,39 @@ RUN git clone --single-branch \
>>           https://github.com/bkoppelmann/tricore-binutils.git \
>>           /usr/src/binutils && \
>>       cd /usr/src/binutils && chmod +x missing && \
>> -    CFLAGS=3D-w ./configure --prefix=3D/usr --disable-nls --target=3Dtr=
icore && \
>> -    make && make install && \
>> -    rm -rf /usr/src/binutils
>> +    CFLAGS=3D-w ./configure --prefix=3D/usr/local --disable-nls --targe=
t=3Dtricore && \
>> +    make && make install
>>   -# This image isn't designed for building QEMU but building tests
>> -ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
>> +FROM debian:buster-slim
>> +# Duplicate deb line as deb-src
>> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/so=
urces.list
>> +# Install very minimal QEMU build deps for use in CI
>> +# $ lcitool variables debian-10 qemu+minimal
>> +RUN apt update && \
>
> Is there really an advantage here above basing this on debian-amd64?

It's mostly about reducing size. The current qemu/debian10 based image
takes:

  794Mb

and can't even build a simple qemu because of missing dev libraries.
Where as the split build approach results in an image that is:

  604Mb

However if I build the whole thing as one I can get it down to:

  580MB

#
# Docker TriCore cross-compiler target
#
# This docker target builds on the Debian Buster base image but
# doesn't inherit from the common one to avoid bringing in unneeded
# dependencies.
#
# Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
FROM docker.io/library/debian:buster-slim

MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

RUN apt update && \
    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
       bzip2 \
       ca-certificates \
       ccache \
       g++ \
       gcc \
       git \
       libglib2.0-dev \
       libpixman-1-dev \
       libtest-harness-perl \
       locales \
       make \
       ninja-build \
       perl-base \
       pkgconf \
       python3-pip \
       python3-setuptools \
       python3-wheel

RUN git clone --single-branch \
        https://github.com/bkoppelmann/tricore-binutils.git \
        /usr/src/binutils && \
    cd /usr/src/binutils && chmod +x missing && \
    CFLAGS=3D-w ./configure --prefix=3D/usr/local --disable-nls --target=3D=
tricore && \
    make && make install && \
    rm -rf /usr/src/binutils

# This image can only build a very minimal QEMU as well as the tests
ENV DEF_TARGET_LIST tricore-softmmu
ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt


>
>
> r~


--=20
Alex Benn=C3=A9e

