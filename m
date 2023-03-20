Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFEE6C152E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peGkP-0005eZ-Je; Mon, 20 Mar 2023 10:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGkN-0005e3-Hz
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:44:27 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peGkL-0007ib-Ny
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 10:44:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i9so10607306wrp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679323464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mX9hcCpQzhFD7W9B8PzVpcMVOtdv56JWV0tv5D5CX8k=;
 b=CW2uoUEhQHwbK3FJfK6JccG34wcJHuee92Fo6tBswnH9xo+3Mvjrcod4r0oyfq4a34
 1611XrJ/pz/640r3LL3HI4fn8h1aQdzSj1N/yFhNUSuFevhoKJ+hNfxA1TwiMmllygKT
 iw17HifoDTyIgrGv4aqTOMWsJv5REFwvD4CIcEQsomuyzQQG4dWr84xYnHa2dPyS9v54
 5riCGElUH6xuv3j95rpR4Gve6eV/oReWgXxLD47/l3bdbJ/jjT2/oqYDZj8qt+V4WSML
 WNNyv7yzDDPjRERPwjvjpRPmdrvdG/oEaPCOBCEyH9MIJs2Zzf8NnMhoW+nAerknNtTk
 CzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323464;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mX9hcCpQzhFD7W9B8PzVpcMVOtdv56JWV0tv5D5CX8k=;
 b=Q/dwCj/6NFm3On7zZ2mtlSzDdlnZEvRggmNSwnrm5Wf7XP0YQ2tg3Yv86EaGI4rmNU
 YQr/GV09DH0IMhDF72fl2o2FG9k57U4UD4iViZcafczhdHuI2uWybsqis0kP8vPtT5A7
 J5QEoGuLXZg11xc3nrY4DoNGx2A9kygmnN33gdyA6ovD9YADyTRpMZei7Nm2/QLsb3Tt
 ID4P54OxL6k/dHHgQWaAoiNMuzfpQr0AUAZ3KiTw4mXR7wHGr6spoRZ9/m0WIYiYqVG3
 DRVobgHi9Zdh8Y0Pr/4J2oloOQftfjuabCIakKJuv0F6H7FWEwaY7fsymdMoyQcEFjNr
 61wQ==
X-Gm-Message-State: AO0yUKXAgzANImDRKMoXOm/fJekxLft663y1qCS3/65aVLg9rD8263Pr
 4MHbzdOUu5ws/oh/oI8/mb2S0Gm+kwAcDi5DUVc6pA==
X-Google-Smtp-Source: AK7set8RG3bMiRfbhBBMNxpJPYjIztLXXlnOexXYfDkArQO/dLndnBGsHosDCCXnRhOmiGe5gIYR1g==
X-Received: by 2002:a5d:4bd1:0:b0:2d2:e9d3:2b72 with SMTP id
 l17-20020a5d4bd1000000b002d2e9d32b72mr10181471wrt.35.1679323463918; 
 Mon, 20 Mar 2023 07:44:23 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b002d45575643esm7044699wrs.43.2023.03.20.07.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 07:44:23 -0700 (PDT)
Message-ID: <43cbcd1f-22f3-47f6-6c86-8f8a642b064c@linaro.org>
Date: Mon, 20 Mar 2023 15:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 05/31] gitlab: update centos-8-stream job
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
 <20230318114644.1340899-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230318114644.1340899-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/3/23 12:46, Alex Bennée wrote:
> A couple of clean-ups here:
> 
>    - inherit from the custom runners job for artefacts

"artifacts"

>    - call check-avocado directly
>    - add some comments to the top about setup
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230315174331.2959-6-alex.bennee@linaro.org>
> 
> diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
> index 068b0c4335..367424db78 100644
> --- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
> +++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
> @@ -1,4 +1,9 @@
> +# All centos-stream-8 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/stream/8/build-environment.yml task
> +# "Installation of extra packages to build QEMU"
> +
>   centos-stream-8-x86_64:
> + extends: .custom_runner_template
>    allow_failure: true
>    needs: []
>    stage: build
> @@ -8,15 +13,6 @@ centos-stream-8-x86_64:
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>    - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
> - artifacts:
> -   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> -   when: on_failure
> -   expire_in: 7 days
> -   paths:
> -     - build/tests/results/latest/results.xml
> -     - build/tests/results/latest/test-results
> -   reports:
> -     junit: build/tests/results/latest/results.xml
>    before_script:
>    - JOBS=$(expr $(nproc) + 1)
>    script:
> @@ -25,6 +21,4 @@ centos-stream-8-x86_64:
>    - ../scripts/ci/org.centos/stream/8/x86_64/configure
>      || { cat config.log meson-logs/meson-log.txt; exit 1; }
>    - make -j"$JOBS"
> - - make NINJA=":" check
> -   || { cat meson-logs/testlog.txt; exit 1; } ;
> - - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
> + - make NINJA=":" check check-avocado

Missing removing scripts/ci/org.centos/stream/8/x86_64/test-avocado
along with this patch.

