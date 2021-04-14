Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C835F149
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:12:05 +0200 (CEST)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcVA-0003hc-Tb
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcTy-0003H1-J2
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:10:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcTw-0002xV-SA
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:10:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id e7so10325768wrs.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VLwbaz5tywsrdiQWw0zwAoUfVo4kNQ/C503WSB6d/Xc=;
 b=TsYWmIjkSQ9kiSlowut8u/mZU3Qa9mQ43Qxi/frEGdinQ1oA48s04uhickGTBF5OeT
 K5DyJNhmX4jFpLX+BO/RnR7RvM9bkrhGmwC6uP3T2Fu1iXLtEloIRJ7F9Pe0lbxwZO5i
 Kl1PGNhVWcuzb+xUtBmDQBRNuCTRfKFXglEvHljxMHU+HXXovP8O4AKSC91kY33FvKeS
 P800A9IAF4fyYilgiuRiZZesGwx+bsljc1t+vCQywJzE95MBW5+kuK7ZrdVnDxzC9gYK
 oUzMuKjYcWw3fAXBJQsPVLKE7kwNjz/ZYX/DhZESEay6u1x/pOyCtkVnYbCxdisg27Z2
 xWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VLwbaz5tywsrdiQWw0zwAoUfVo4kNQ/C503WSB6d/Xc=;
 b=VJqqYXM3cB6vyMO2bzvdI9BrWizEgxQgzUiRX2KQFfuvx8mOY9UImMvf1KO4h7jKuE
 uhfMAHzqbYZUCwenfR0jMEqequSG/3gip7HPKixGOg756tnslUow1HC/V7XuEeMY/sQ1
 IzNRqyLB8ATpFc1UYlGMutixIs5WNEXxpZfJpvjHfVn+Xj03BDmKNjg3buC8ZFIXvWBa
 yeiYb4Sf/JEoBqEYqq0Lj75Rr7T4O2ffCe0jBwUoUyrDM3BTk1KH/jCPBWIzN69/W8co
 FdAC+8C8MO2nYFkpYrwxOnCBuZztpPTj62+eTKbD0pfv9CHEHKS+VFwgQuh0Tpqu3+ra
 glXQ==
X-Gm-Message-State: AOAM532ubI3YkI1bMnknkcwgGuHxROP4MqlR78sLqchiSzxWzxyuKTD+
 Y5OmAYEOlHDInDMkto0Ml9E=
X-Google-Smtp-Source: ABdhPJwyq1cN8tFdyU8CT+l5ZRgtzA/BUGQUxRblXh9h4j6u4pDix1NavufhW1K2iqYCvw9Z5x/uSQ==
X-Received: by 2002:a5d:590d:: with SMTP id v13mr9563871wrd.85.1618395046659; 
 Wed, 14 Apr 2021 03:10:46 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c2sm4774050wmr.22.2021.04.14.03.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:10:45 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Restrict jobs using Docker to runners having
 'docker' tag
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210319004300.3800583-1-f4bug@amsat.org>
 <9cdb9c79-2466-93fa-a01a-f38532f2bd6f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a4147360-9cb4-1e8a-570d-e41dbe6ddf5c@amsat.org>
Date: Wed, 14 Apr 2021 12:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9cdb9c79-2466-93fa-a01a-f38532f2bd6f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 6:40 AM, Thomas Huth wrote:
> On 19/03/2021 01.43, Philippe Mathieu-Daudé wrote:
>> When a job is based on a Docker image [1], or is using a Docker
>> service, it requires a runner with Docker installed.
>>
>> Gitlab shared runners provide the 'docker' tag when they have it
>> installed.
>>
>> Are Gitlab shared runners are limited resources, we'd like to
> 
> s/Are/As/
> 
>> add more runners to QEMU repositories hosted on Gitlab. If a
>> runner doesn't provide Docker, our jobs requiring it will fail.
>>
>> Use the standard 'docker' tag to mark the jobs requiring Docker
>> on the runner.
>>
>> [1] https://docs.gitlab.com/ee/ci/yaml/#image
>> [2] https://docs.gitlab.com/ee/ci/yaml/#services
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [...]
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index f65cb11c4d3..d4511cf7dea 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -14,6 +14,8 @@ include:
>>     - local: '/.gitlab-ci.d/crossbuilds.yml'
>>     .native_build_job_template: &native_build_job_definition
>> +  tags:
>> +  - docker
>>     stage: build
>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>     before_script:
>> @@ -38,6 +40,8 @@ include:
>>         fi
>>     .native_test_job_template: &native_test_job_definition
>> +  tags:
>> +  - docker
>>     stage: test
>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>     script:
> 
> If you add it to the templates ... won't this disable most of the jobs
> on the dedicated runners that don't have docker? Wouldn't it be better
> to add the tag only to the jobs that run "make check-tcg" ?

But this is the point, if a runner doesn't have Docker, it can not
run the job...

