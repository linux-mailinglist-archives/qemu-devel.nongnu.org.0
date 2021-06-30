Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE93B8A62
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 00:20:47 +0200 (CEST)
Received: from localhost ([::1]:53680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyiZa-0001XF-Ge
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 18:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyiYY-0000ne-66
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lyiYU-000729-5p
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 18:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625091576;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETPT6OU50YKeAJQ1o5m2XL7j4McQmLOOdDbFDtUk6ac=;
 b=ZrsWBGn9Ale2Rbi5bI9RITTWZANPtXdhODAIwdn6GRZJLGF1X0ATC2wId13UYX8/QXSeKa
 2IW6Co5ppqZgtOT4nuRgV/XC2gp9pEH3H6o58orCMN6IGt1pUN/EDY9KLuL7y9X4CamyNU
 K2BIE/+kxEi5xo7rXMLKI2oIjP8YaAo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-7ABTS4KNN56htrgYRh28ew-1; Wed, 30 Jun 2021 18:19:33 -0400
X-MC-Unique: 7ABTS4KNN56htrgYRh28ew-1
Received: by mail-pj1-f72.google.com with SMTP id
 br8-20020a17090b0f08b02901706e80711dso2105181pjb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 15:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ETPT6OU50YKeAJQ1o5m2XL7j4McQmLOOdDbFDtUk6ac=;
 b=EGuBQ3f40O7WGT1/G6EfSgYOA8azw03TEfXfNCfnTM0OEXnISEr8F4pAlx0drp52NZ
 VTBFIrA/JMtRDUQd1LtfDqbnHCnNHBQfznaggd+S2RToOfMdO/lm03ltRt9l4hVX4F2x
 WDexbfnTo7tTfHXmzyC6JNh9ZdNy36khiFfM2R5337Gsorvhte5YHlAgWxkzttKEdZKS
 MDVAbf6l0izXGKf5IEbcmXiI1ODRWSaq8JFhDpOjJIdqPuCsEjXCULBbBNc0aF9rypbv
 OEozH/yELWi0x6XXxqc0wyR3knkqkMBBUoTTr2o37qKuTiMLozeAgUVszH72DvkVrqxN
 I0BQ==
X-Gm-Message-State: AOAM533NI5VI//q6VTCIAHQGZIyW0m5O3+wg6RsWfMjl14d/KnaBkbOD
 Z9WWcsAanivbOiPOiO8l1PHgVI6/8F2709XqPRdUXfhoDNW6ZvrYFsYbgR4cbDlYYoNGWdXEOe5
 QwQndf5fqUvo/VkY=
X-Received: by 2002:aa7:9147:0:b029:30f:7bf3:64ed with SMTP id
 7-20020aa791470000b029030f7bf364edmr6892347pfi.51.1625091572446; 
 Wed, 30 Jun 2021 15:19:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIsuLVqUUFG3GhpfVInL2YC5/V/I0B5mTGg0t2ZAnQZ+McATom/Us1M+xwvkBGCLI/gyYiIQ==
X-Received: by 2002:aa7:9147:0:b029:30f:7bf3:64ed with SMTP id
 7-20020aa791470000b029030f7bf364edmr6892295pfi.51.1625091572007; 
 Wed, 30 Jun 2021 15:19:32 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id 18sm7440790pje.22.2021.06.30.15.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 15:19:31 -0700 (PDT)
Subject: Re: [PATCH v7 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-5-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <79f58e5b-3fa1-919f-6cda-5150ef2b7a43@redhat.com>
Date: Wed, 30 Jun 2021 19:19:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210630012619.115262-5-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: wainersm@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/29/21 10:26 PM, Cleber Rosa wrote:
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>   1 file changed, 208 insertions(+)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
> index a07b27384c..061d3cdfed 100644
> --- a/.gitlab-ci.d/custom-runners.yml
> +++ b/.gitlab-ci.d/custom-runners.yml
> @@ -12,3 +12,211 @@
>   # guarantees a fresh repository on each job run.
>   variables:
>     GIT_STRATEGY: clone
> +
> +# All ubuntu-18.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-18.04-s390x-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1
> +
> +ubuntu-18.04-s390x-all:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-18.04-s390x-alldbg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-18.04-s390x-clang:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-18.04-s390x-tci:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
> +
> +ubuntu-18.04-s390x-notcg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_18.04
> + - s390x
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +# All ubuntu-20.04 jobs should run successfully in an environment
> +# setup by the scripts/ci/setup/qemu/build-environment.yml task
> +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +ubuntu-20.04-aarch64-all-linux-static:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
> + # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> + - make --output-sync -j`nproc` check-tcg V=1
> +
> +ubuntu-20.04-aarch64-all:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-alldbg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --enable-debug --disable-libssh
> + - make clean
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-clang:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1
> +
> +ubuntu-20.04-aarch64-tci:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --enable-tcg-interpreter
> + - make --output-sync -j`nproc`
> +
> +ubuntu-20.04-aarch64-notcg:
> + allow_failure: true
> + needs: []
> + stage: build
> + tags:
> + - ubuntu_20.04
> + - aarch64
> + rules:
> + - if: '$CI_COMMIT_BRANCH =~ /^staging/'
> +   when: manual
> + script:
> + - mkdir build
> + - cd build
> + - ../configure --disable-libssh --disable-tcg
> + - make --output-sync -j`nproc`
> + - make --output-sync -j`nproc` check V=1


