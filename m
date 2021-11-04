Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13D4458F9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:51:09 +0100 (CET)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migtI-0005kp-KT
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1migqS-0002h5-1B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:48:12 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1migqP-0007ss-SC
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:48:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id d5so9895569wrc.1
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZpH8wPY78dojvCfW5y3YWLzfljc1f0ZI9Glqv83M+KE=;
 b=FWSvXxCC4q6vVIPzutCfgt4a6/Z87jXNXR8sJqCwQm9FXQNITp/LBgsHRMAB4wz6RF
 1ATAYCLl8BJKFSiukCSJtVDf2RUW2zonMFsZakeTMdLMQaBBH/BccPJVcx6yVASlZCk7
 9aCkNnV12SdgBzpu3GOy+Fm0XkvZy9s5AYXDY7MWIbw7VNcs7c/7/qko3Jibw9dnnNAA
 MLs4EgxqQCSNhydm9ZGKhEEexDDdtZIEKJuewjmNm78cy8sVuL9Q2Qlw8uMwZAq8K/gK
 owwlT0K+JCJHeKsToLecCmVSV1yldb9MXFbOQu5XpU27LKCwCiAcS/CFJdyl85ZOsA/X
 Kg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZpH8wPY78dojvCfW5y3YWLzfljc1f0ZI9Glqv83M+KE=;
 b=XHf7eN84FrWkib3rqbvmo81Z94CfFX4VQpOUJGPsk3dbAAemUx7iu6Mr/ZKb3iLJgj
 2DjAqfcUOpA+3apG4Nx9rzp2snKnPojnuW5/MdGlytuDNRnjh6YmAym/T53wQ7ehddry
 2sEjsNTGJTv8JC5y18m8vEzohxYpEqAdfNtJzz82Q9ZXM0P7UehlEwEy7L70ZaxwcG0m
 gunZqNE8doLnXGxvtPok6gl0USNQ29QnmXD7xcgJH4GHYue9bd6BqgxXhrB7olgnzuuf
 hCglt1AjDG9VgfPIyK7++B0vFc5rxX//zbe95gVZYsdmPhtFF3N4qtNvQ4YAnNRwl2Z9
 kXHg==
X-Gm-Message-State: AOAM530kKA8LeXTKhPbQ4Vd+miQFPf1buw2piynmOtb39i5leCufhu+Q
 XXKoU2n1pkU8ztbxpkLPHJT7XA==
X-Google-Smtp-Source: ABdhPJxvbI3wh4VfGBxFVTns4DnKk4ltG3eYx5Aww8B/mxH6BDKfSjSoB2i62U8PPZZ0DGtGliQQlQ==
X-Received: by 2002:adf:ee4b:: with SMTP id w11mr63832778wro.115.1636048087385; 
 Thu, 04 Nov 2021 10:48:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x21sm9029691wmc.14.2021.11.04.10.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 10:48:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 960C61FF96;
 Thu,  4 Nov 2021 17:48:05 +0000 (GMT)
References: <20211103171339.721910-1-alex.bennee@linaro.org>
 <122de229-1451-71a2-0c0b-fd8c85c8666d@amsat.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] tests/docker: force NOUSER=1 for base images
Date: Thu, 04 Nov 2021 17:44:49 +0000
In-reply-to: <122de229-1451-71a2-0c0b-fd8c85c8666d@amsat.org>
Message-ID: <878ry3izhm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 11/3/21 18:13, Alex Benn=C3=A9e wrote:
>> As base images are often used to build further images like toolchains
>> ensure we don't add the local user by accident. The local user should
>> only exist on local images and not anything that gets pushed up to the
>> public registry.
>>=20
>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/docker/Makefile.include | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.inclu=
de
>> index 5bbbaceed1..462a3758d7 100644
>> --- a/tests/docker/Makefile.include
>> +++ b/tests/docker/Makefile.include
>> @@ -150,6 +150,10 @@ docker-image-debian-sparc64-cross: docker-image-deb=
ian10
>>  # The native build should never use the registry
>>  docker-image-debian-native: DOCKER_REGISTRY=3D
>>=20=20
>> +# base images should not add a local user
>> +docker-image-debian10: NOUSER=3D1
>> +docker-image-debian11: NOUSER=3D1
>
> What about covering all DOCKER_PARTIAL_IMAGES:

Hmm maybe - to be honest the naming is at variance with what it actually
indicates. They are perfectly usable images (they are used for cross
compiling tests) but they are not usable for building QEMU itself hence
use the DOCKER_PARTIAL_IMAGES field to stop them being expanded in the
test runs.

If I had my time again....

>
> -- >8 --
> @@ -188,6 +188,9 @@ DOCKER_PARTIAL_IMAGES +=3D debian-tricore-cross
>  DOCKER_PARTIAL_IMAGES +=3D debian-xtensa-cross
>  DOCKER_PARTIAL_IMAGES +=3D fedora-cris-cross
>
> +# base images should not add a local user
> +$(foreach image,$(DOCKER_PARTIAL_IMAGES),docker-image-$(image)): NOUSER=
=3D1
> +
>  # Rules for building linux-user powered images
>  #
>  # These are slower than using native cross compiler setups but can
> ---


--=20
Alex Benn=C3=A9e

