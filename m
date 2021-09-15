Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AA640C195
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:21:42 +0200 (CEST)
Received: from localhost ([::1]:57586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQAn-0005HC-F5
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQQ8l-0000kc-MO
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:19:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mQQ8j-0000Uf-MW
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:19:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso1343480wmd.5
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Csf/vIh3nFuylQoDFT6F3WNIA3LBo9HxUhHt1hZ7gqU=;
 b=o/y6etIfiYAgg49CV7KqC6/Vs4yYnmfb5hkn/k0BO/N38ADEMAu+cGVu/xHgXFo+T6
 KANROBjHYSl5BKePnI1HMMaulG3QdaHFNXQAxfQ30wTy/V+7sh0DzniPHcRb3XCS8xNE
 4AhKUQ16Dns9REV0HBKpLfjUPdbudEbiQb5jNJecZ6x78NZ8CY5kWL4nwgcufCKufNMW
 ueWfR4u6T751RcgZRtxMWPSsJCKo/C4T7TLdDvI/g+4XV0Ip07iT1lc2uUdTbY7KOKBm
 Y+aOgdygdTOP5SzqSGwu4scVWdzyb9Vw8cJj2Pm2SoWwtdSAEchg+pmEFFvXHonlHwle
 lZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Csf/vIh3nFuylQoDFT6F3WNIA3LBo9HxUhHt1hZ7gqU=;
 b=1/Wlork1qAMkT8GGJLG/vkGdUrRUhIBijTZ0//y4lNFhg5wqYXWxZ9aNF9f3aPb5BA
 Ywue6f6K+YZxcy2trNjSIK5BokaRyhlxPSOXLZlzeRuUSsNliCOm4jr6Uqi5o9chPiLC
 Y17QBYRjuipOd5dOMCpquN83Qes+54hoAuIlpox5uWDOAYzXSfxVot7ZTP95Fc2ZOsVA
 4HKOtGRQaaowQg8g+SlbIeRYbabkZXV3D7EhOk/5TZRcI9tx50ci/PWY1NNafLeCJVts
 8AU+l0wXZ4uXlAGulL1M4vs0CD01fmL9pwcQ14gRYrJmKWn+Kbpo0eUCznK7HdL4HKS4
 Zqyw==
X-Gm-Message-State: AOAM533x9eF7WKh6B0fLQrEz3XIhK5oUaV//ajtTwK5/IFmyWDTDdQWN
 YxdUSv6Z1Vaxl26jpV7ZJl+Qbg==
X-Google-Smtp-Source: ABdhPJzpr68XUrx8UAaH9U8pg0iYpcPhUy2Bz7DuhUEQSVHxedd6T0mVIXEjXtoPkAUjz+cPEsV2ag==
X-Received: by 2002:a1c:3b41:: with SMTP id i62mr3187600wma.38.1631693971348; 
 Wed, 15 Sep 2021 01:19:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm3669792wmj.9.2021.09.15.01.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 01:19:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 654DB1FF96;
 Wed, 15 Sep 2021 09:19:29 +0100 (BST)
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-2-richard.henderson@linaro.org>
 <14f98dad-fb1c-7b1b-4194-484973a53c90@amsat.org>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/2] tests/docker: promote debian-riscv64-cross to a
 full image
Date: Wed, 15 Sep 2021 09:15:32 +0100
In-reply-to: <14f98dad-fb1c-7b1b-4194-484973a53c90@amsat.org>
Message-ID: <87v932tfn2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: thuth@redhat.com,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 wainersm@redhat.com, willianr@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 9/14/21 8:58 PM, Richard Henderson wrote:
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> To be able to cross build QEMU itself we need to include a few more
>> libraries. These are only available in Debian's unstable ports repo
>> for now so we need to base the riscv64 image on sid with the the
>> minimal libs needed to build QEMU (glib/pixman).
>>=20
>> The result works but is not as clean as using build-dep to bring in
>> more dependencies. However sid is by definition a shifting pile of
>> sand and by keeping the list of libs minimal we reduce the chance of
>> having an image we can't build. It's good enough for a basic cross
>> build testing of TCG.
>>=20
<snip>
>> diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/test=
s/docker/dockerfiles/debian-riscv64-cross.docker
>> index 2bbff19772..594d97982c 100644
>> --- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
>> @@ -1,12 +1,48 @@
>>  #
>> -# Docker cross-compiler target
>> +# Docker cross-compiler target for riscv64
>>  #
>> -# This docker target builds on the debian Buster base image.
>> +# Currently the only distro that gets close to cross compiling riscv64
>> +# images is Debian Sid (with unofficial ports). As this is a moving
>> +# target we keep the library list minimal and are aiming to migrate
>> +# from this hack as soon as we are able.
>>  #
>> -FROM qemu/debian10
>> +FROM docker.io/library/debian:sid-slim
>> +
>> +# Add ports
>> +RUN apt update && \
>> +    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
>> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt update -yy && \
>> +    DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt upgrade -yy
>> +
>> +# Install common build utilities
>> +RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata apt install -yy \
>> +    bc \
>> +    build-essential \
>> +    ca-certificates \
>> +    debian-ports-archive-keyring \
>> +    dpkg-dev \
>> +    gettext \
>> +    git \
>> +    ninja-build \
>> +    pkg-config \
>> +    python3
>
> Alex, why not using a debian-sid intermediate image?

Well we removed the original debian-sid image a while ago having excised
images that used it. Basing things on sid does cause problems given it's
such a moving feast. Rather than encouraging others to build sid based
images we decided it made more sense to make this a pure standalone
image which we can migrate away from at the first opportunity.

--=20
Alex Benn=C3=A9e

