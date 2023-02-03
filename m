Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DB689E8C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyMy-00065d-7g; Fri, 03 Feb 2023 10:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNyMt-0005zX-A0
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:52:51 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNyMr-0005mT-I7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:52:51 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4175512wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 07:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tEdtLEmCgIs0Xj5cYDNl3iXHUFI0MRBu8gpRPpT0GAw=;
 b=cCyLew0hBDSQ3E8UoLWCmjxfH/0R7sxywn4cf5VInnPq7SvVGpMqU6R8ogBCm0g4xO
 9XhP2sdcvHa1JmiwQ/Uz17fcU437gkqNLlw//QdS8hj9NdwxQcwILrpfdHfWBoRIj8AB
 f5H+dScvsdVJliUu37qzX0WLJXvik2mzj+ibjKcTQhRzH8XQ7xjvDcMyZWNRjG8bveo7
 10MvnTo08H4bnYvqJreHX9RHYcR+vTruveiSCkygVRjBw9hzO7MBDvABXpeAJ8iVCm4s
 iVVAOlRhAtX4SbyTmT6e18cp/K0tIK95czthXVPQj5ebmjUKy2jd7UVz5qXubQrhREK5
 Fw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tEdtLEmCgIs0Xj5cYDNl3iXHUFI0MRBu8gpRPpT0GAw=;
 b=v5h9P4dxKueR5BU4jLA1cEFwuyLGiyirTWIYTkQuQFSC/dBzilyLDK2KHcMTyN5xps
 1sg/9kWoLLNLsgLNnm0y6Wa2IGAgSLzwwDNq/6tS3aQLSWMFvcX6cl6xlRbrl6qM2LFI
 Dz4RBMv+hqrWMAh11XjE3isQ9vuUtIdeKaRnwAVGh47oeViRLe1eLGF5WVOwmIhTwcUp
 LuxSECeKNIZaN1pE5BFyioRze0k6QT/T4qRLs4Qze6sH1oAqc8vWNuT7YJPU5SiF6O1j
 a9xQ8MrQWiDWEwamD+AN3iTO9vTqb5GAvhEUTCyunGtyFF6JFk3Cb2VhNdkI86V6VXbI
 zqnA==
X-Gm-Message-State: AO0yUKVhhFPveJRD9FnyM0IZAsgKMkVuBC9lS44KvWTvWJeHnfj/D2Kh
 HFc3HfUXt1xW2vDwqbFTSVZV7Q==
X-Google-Smtp-Source: AK7set+zXtRDe0QNFbe9hJeTsmiN1U9Ua2YH8GWqJR7jaurhSdcUdU1JkJ75fGeAdDZkR5it/Jd4rA==
X-Received: by 2002:a05:600c:3ac7:b0:3dc:557f:6123 with SMTP id
 d7-20020a05600c3ac700b003dc557f6123mr10055014wms.1.1675439567903; 
 Fri, 03 Feb 2023 07:52:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2749334wmf.42.2023.02.03.07.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 07:52:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 139551FFB7;
 Fri,  3 Feb 2023 15:52:47 +0000 (GMT)
References: <20230203145404.1043301-1-kbastian@mail.uni-paderborn.de>
 <c21d19e6-7e8a-a66e-0c65-f05954e429d7@linaro.org>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH] tests/docker: Use binaries for debian-tricore-cross
Date: Fri, 03 Feb 2023 15:52:00 +0000
In-reply-to: <c21d19e6-7e8a-a66e-0c65-f05954e429d7@linaro.org>
Message-ID: <87o7qakapc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Bastian,
>
> On 3/2/23 15:54, Bastian Koppelmann wrote:
>> since binutils is pretty old, it fails our CI repeatedly during the
>> compilation of tricore-binutils. We created a precompiled version using
>> the debian docker image and download it instead of building it ourself.
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> ---
>> Peter, I was having trouble with the new version of binutils, I mentione=
d. I
>> think this needs more time to sort out. So for now, let's just use a pre=
compiled
>> version of the current binutils.
>>   .../dockerfiles/debian-tricore-cross.docker    | 18
>> +++---------------
>>   1 file changed, 3 insertions(+), 15 deletions(-)
>> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker
>> b/tests/docker/dockerfiles/debian-tricore-cross.docker
>> index 5ae58efa09..4abcf07e68 100644
>> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
>> @@ -16,32 +16,20 @@ MAINTAINER Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
>>   RUN apt update && \
>>       DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
>>       DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
>> -       bison \
>> +       curl \
>>          bzip2 \
>>          ca-certificates \
>> -       ccache \
>
> You might not use ccache, but others do, so please let it:
>
> $ git grep DOCKER_CCACHE
> tests/docker/Makefile.include:203:DOCKER_CCACHE_DIR :=3D
> $$HOME/.cache/qemu-docker-ccache
> tests/docker/Makefile.include:212:      @mkdir -p "$(DOCKER_CCACHE_DIR)"
> tests/docker/Makefile.include:234:                              -v
> $(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \
>
>> -       flex \
>> -       g++ \
>> -       gcc \
>> -       git \
>>          libglib2.0-dev \
>>          libpixman-1-dev \
>>          locales \
>> -       make \
>
> Why remove gcc/(git)/make?

In retrospect 39ce923732 (gitlab: enable a very minimal build with the
tricore container) could have made the minimal qemu build requirements
clearer in the comment text at the top of the container.

>
>>          ninja-build \
>>          pkgconf \
>>          python3-pip \
>>          python3-setuptools \
>>          python3-wheel
>>   -RUN git clone --single-branch \
>> -        https://github.com/bkoppelmann/tricore-binutils.git \
>> -        /usr/src/binutils && \
>> -    cd /usr/src/binutils && chmod +x missing && \
>> -    CFLAGS=3D-w ./configure --prefix=3D/usr/local --disable-nls --targe=
t=3Dtricore && \
>> -    make && make install && \
>> -    rm -rf /usr/src/binutils
>> -
>> +RUN curl -#SL https://github.com/bkoppelmann/tricore-binutils/raw/maste=
r/release/tricore-binutils.2.13.tar.gz \
>> +    | tar -xzC /usr/local/
>>   # This image can only build a very minimal QEMU as well as the tests
>>   ENV DEF_TARGET_LIST tricore-softmmu
>>   ENV QEMU_CONFIGURE_OPTS --disable-user --disable-tools --disable-fdt


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

