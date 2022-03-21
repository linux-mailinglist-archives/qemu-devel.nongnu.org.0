Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92294E2DB6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:19:34 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKkn-00044Z-OZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:19:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWKhs-0001p5-6E
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWKhq-0000Q7-L3
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsVcX2L7+9faR3P5XHdEyXMGTlUzZt2iMvML0nhHw+c=;
 b=GooiT7gEkWfNFYAB0sgj+b/H68EMOrdMbuafn8nUiN5j5our57e6qaAYIsfusaVqqtRIjs
 M2Ysyqf/KXj4fzZQG0/X+IUUUJTMMTf7INQyP+c0bIwY6xo2IthdzM33jF+BCS5Kc3qn6n
 0+quM1B0yj2OINBsu649c3HJ2w22TuU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-ElwBrNThOAKRYPD0KdGBig-1; Mon, 21 Mar 2022 12:16:28 -0400
X-MC-Unique: ElwBrNThOAKRYPD0KdGBig-1
Received: by mail-wr1-f71.google.com with SMTP id
 88-20020adf8161000000b0020410a1bd93so604736wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QsVcX2L7+9faR3P5XHdEyXMGTlUzZt2iMvML0nhHw+c=;
 b=swEjQWaC6EO926aw70pp4/+e7aDKmAt4BcCKCzwLoI5q8pt08uP3E+GbjKJPCdqiam
 X0bgCLHEvSxEkSBfWMOJwd/msht0/pxjxJJmtMvPQbA9jnshkIKg62dullTq0dzcnbx0
 IfoYfS5na+74YVG+bAe9zcWC3djAOc6pZJvhF/B2g28kQe3NpZsj60q5oSKgHjYOwt/X
 i2bvqDtXlTxJNIwHNr0dsVc6H9j4onwMaCZIevRSUqMq56OLHWN9S8S4wK/LmXi8tWNf
 ZX6us+RLyvOxONOq25teDGR0lNfWzXRtUMCqAxa/cTC8djWik0yW8bFRVNEqdtsxOz0K
 ZKKQ==
X-Gm-Message-State: AOAM532reXo4JjrKuwVYC/Z2fjiOjNj0Mdy+0wvDzdws38QGHoBXv4ec
 pWTuiNrA3klOZ5WiCnf2AMF/J7np+D1mVjAV4oBOnAElrxldUu2qIKCsk5i19Etz5khmaiqIwRD
 d6FBEvv52R4/MWIM=
X-Received: by 2002:a05:600c:4e8b:b0:38c:90cf:1158 with SMTP id
 f11-20020a05600c4e8b00b0038c90cf1158mr12665593wmq.107.1647879387317; 
 Mon, 21 Mar 2022 09:16:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeFJCuV10A4eh6a5EddJQAfzYVGAKnMjLwlSH0rSmOe1waxPr3H0PlVtfcl8nu5r/ngTqrLw==
X-Received: by 2002:a05:600c:4e8b:b0:38c:90cf:1158 with SMTP id
 f11-20020a05600c4e8b00b0038c90cf1158mr12665563wmq.107.1647879387013; 
 Mon, 21 Mar 2022 09:16:27 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d6648000000b00203e64e3637sm11637140wrw.89.2022.03.21.09.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 09:16:26 -0700 (PDT)
Message-ID: <262a80f9-88d5-c831-a299-a77f7f500958@redhat.com>
Date: Mon, 21 Mar 2022 17:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] gitlab: disable accelerated zlib for s390x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321161151.3654386-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220321161151.3654386-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/03/2022 17.11, Alex Bennée wrote:
> There appears to be a bug in the s390 hardware-accelerated version of
> zlib distributed with Ubuntu 20.04, which makes our test
> /i386/migration/multifd/tcp/zlib hit an assertion perhaps one time in
> 10. Fortunately zlib provides an escape hatch where we can disable the
> hardware-acceleration entirely by setting the environment variable
> DFLTCC to 0. Do this on all our CI which runs on s390 hosts, both our
> custom gitlab runner and also the Travis hosts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>    - more complete commit wording from Peter
>    - also tweak travis rules
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ++++++++++++
>   .travis.yml                                        |  6 ++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index 0333872113..4f292a8a5b 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -8,6 +8,8 @@ ubuntu-20.04-s390x-all-linux-static:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>    - if: "$S390X_RUNNER_AVAILABLE"
> @@ -27,6 +29,8 @@ ubuntu-20.04-s390x-all:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>    - if: "$S390X_RUNNER_AVAILABLE"
> @@ -43,6 +47,8 @@ ubuntu-20.04-s390x-alldbg:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -64,6 +70,8 @@ ubuntu-20.04-s390x-clang:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -84,6 +92,8 @@ ubuntu-20.04-s390x-tci:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -103,6 +113,8 @@ ubuntu-20.04-s390x-notcg:
>    tags:
>    - ubuntu_20.04
>    - s390x
> + variables:
> +    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> diff --git a/.travis.yml b/.travis.yml
> index c3c8048842..9afc4a54b8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,6 +218,7 @@ jobs:
>           - TEST_CMD="make check check-tcg V=1"
>           - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
>           - UNRELIABLE=true
> +        - DFLTCC=0
>         script:
>           - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
>           - |
> @@ -257,7 +258,7 @@ jobs:
>         env:
>           - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
>                     --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
> -
> +        - DFLTCC=0
>       - name: "[s390x] GCC (user)"
>         arch: s390x
>         dist: focal
> @@ -269,7 +270,7 @@ jobs:
>             - ninja-build
>         env:
>           - CONFIG="--disable-containers --disable-system"
> -
> +        - DFLTCC=0
>       - name: "[s390x] Clang (disable-tcg)"
>         arch: s390x
>         dist: focal
> @@ -303,3 +304,4 @@ jobs:
>           - CONFIG="--disable-containers --disable-tcg --enable-kvm
>                     --disable-tools --host-cc=clang --cxx=clang++"
>           - UNRELIABLE=true
> +        - DFLTCC=0

Reviewed-by: Thomas Huth <thuth@redhat.com>


