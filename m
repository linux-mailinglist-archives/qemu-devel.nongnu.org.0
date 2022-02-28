Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D924C71EF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:48:50 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjCb-0006gJ-M2
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOjAB-0004WB-Vj
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:46:20 -0500
Received: from [2a00:1450:4864:20::630] (port=44696
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOjAA-0005p4-Im
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:46:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id p14so25968700ejf.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7qbkXR+cUfAjbilG4AhLazVNFMVJzoXKO8CDF3QbXFM=;
 b=p8c91yfZahKomaovyFLhJd+jPYOPl2b696GWSL3L8WJ0LjubqM27Y80aZ8kRQDaKRa
 TZRPVSsGQFOHk8PpuS1K9hRkipj9YqA30g0SbuJ7dizkUad3ckLPI7Gp1mFZtwgXrQNv
 wLXde6ppvBt3kyAZn9ETR4JVkV27jDlCrThUUuGPE3YzK/1cySLrN6+veQzw9tmqgPa9
 RzI8QEXVqjY8/yctTaGRH10wIvtB+XKlXB2RbzS25nRLo2OfHBz1llfEtjlF8yCosUcr
 YvSZzenRZKxp32VXVtLbiIgRTdjko62rgdFDjldnZKjUnTQxANJPUu7ZEt+vcCKgvP9l
 y0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7qbkXR+cUfAjbilG4AhLazVNFMVJzoXKO8CDF3QbXFM=;
 b=ENKSR/iJyNUf3fTeJwbDvmJADHtGFU4IWvU0HWVmo1v1NJrXT9l2V59RIFB3uV8xPT
 Vmnm+46y+EePTNQBjSNiWnQwLVLPuzZka7+qP5Mt3i2TAKh02+VkrKRRKafd55MSvt8C
 GrXxgaugfBQErVfkOQlQAaA50WHnI6fhtnA84avx6gbmVtaBkKrUvKe/Q3etxnJeR3VB
 MxsReOcmiCEejPdW9l/AsaYLn0Te4iP3Ho3Odhetc2/8nTe62KHdMD4tDqtpwceeI516
 ZIj0unQtGt2T7kk8F2TGhCj+ZXEU2+xE1lSlQffK+RciyC5tULXpgobSnnXcZDmIoyCi
 3Wrw==
X-Gm-Message-State: AOAM533JOp6s80lyQ1SfrLKpFxXlsqanbkK8Y3kFWC/ea1SUX+1HAkpe
 S3EfVqK7oi2Bh6EOC10P0cjhhQ==
X-Google-Smtp-Source: ABdhPJyST89K+DnLYPeJctrtG6SoGRIsj191ia+PK7mpDDMMUYbgGTCcWBaFonnbjT3GyCrEP/xRZQ==
X-Received: by 2002:a17:907:3f95:b0:6d3:feb2:ef88 with SMTP id
 hr21-20020a1709073f9500b006d3feb2ef88mr15756723ejc.480.1646066777133; 
 Mon, 28 Feb 2022 08:46:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ee21-20020a056402291500b00410d4261313sm6150000edb.24.2022.02.28.08.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 08:46:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C3291FFB7;
 Mon, 28 Feb 2022 16:46:15 +0000 (GMT)
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-4-alex.bennee@linaro.org>
 <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
Date: Mon, 28 Feb 2022 16:44:19 +0000
In-reply-to: <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
Message-ID: <87ee3nlz1k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We will need an update shortly for some new images.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
>> ---
>>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
>>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
>>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
>>  tests/lcitool/libvirt-ci                      | 2 +-
>>  4 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docke=
r/dockerfiles/opensuse-leap.docker
>> index 1b78d8369a..e1ad9434a3 100644
>> --- a/tests/docker/dockerfiles/opensuse-leap.docker
>> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
>> @@ -127,8 +127,7 @@ RUN zypper update -y && \
>>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
>>
>> -RUN pip3 install \
>> -         meson=3D=3D0.56.0
>> +RUN pip3 install meson=3D=3D0.56.0
>
> Why are these formatting changes to the dockerfiles in this commit ?

The latest lcitool I assume didn't see the need for the continuation
line. I ran:

  make lcitool-refresh

when I updated.

--=20
Alex Benn=C3=A9e

