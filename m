Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAB57B307
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:34:14 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE59o-0003tC-HE
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE57b-0001GQ-Kc
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE57Z-0004tG-Q7
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658305913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9oMAwBHa9Cflxn9lwlKUtzpnW9c2QuBdaShxdHJYQ8=;
 b=NA5ONjkg/5Hr+sWuM1acJjCzKk74HVk8Poa9S4/6T0+bA3TgDiqyBgS2jS2RFW1PCN7haN
 VR+ntvt1QffFFKuwz5ap7kgyawo7cim13G63NrkkRkf3RG09SLE1mqy0BfjW+kFSa2MZ5p
 7wn+KUs42Vjs0SVVfeuMtIKqdPC9uf0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-uDORjBnoPTKu5DW4OSX2OQ-1; Wed, 20 Jul 2022 04:31:50 -0400
X-MC-Unique: uDORjBnoPTKu5DW4OSX2OQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c126-20020a1c3584000000b003a02fa133ceso8059105wma.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 01:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G9oMAwBHa9Cflxn9lwlKUtzpnW9c2QuBdaShxdHJYQ8=;
 b=BU8vfwq4M/Uy5HuX0aAxIvEph5jyE0VqT0DXjWV3CTHY0FTnO32/A6A7uMU1x9ISAr
 jTcZypetKqceI6VagPtBLULsTfYJN1OwR89MXW33d3Z/V2bDYUJqd9dWs99eHSBx68gw
 6uMqpkfborPHUjSwCSM/6ooxagx5vrxlOBkXSW5WrrLdbeQaXZ4rfVKRDMkUOUL2QtM9
 LbERB/qrSsrKZ4qZh6M5y26OFrBH/WArpVOJzgbamagL/nJKnh4KZgWFbWdZkXRHOIqx
 7bjlYRXq2MOzMCfs2EwmCXRekaGwfDoe0oR2E7GrVQFFDvDAZc2gM9MGNINra2dSUNb2
 CoqA==
X-Gm-Message-State: AJIora95RSFMrzwT9FEqnkFtzqIOl0IXPLrRR0pT3gbCsDf32NE1g2IS
 pv4TFsYduzCB75+H6ApAXuXu5j23snp+Npp5S9uk6cfDfYo7pdlgKG0WO4Qtb9ZnwQG/4m6kxNE
 yAev7I6/RapVosXI=
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr29454065wrb.531.1658305909742; 
 Wed, 20 Jul 2022 01:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZrGffa7Kkj+xC8lCcKRa3Ri2wsxwhG/jMBv4SWSVXaqLEkVhUAn8f5wMHTlGF2TpEEwrcPg==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr29454049wrb.531.1658305909522; 
 Wed, 20 Jul 2022 01:31:49 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c28cc00b003a325bd8517sm1928059wmd.5.2022.07.20.01.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 01:31:49 -0700 (PDT)
Message-ID: <090d09d2-bca0-5354-e552-66459121ac13@redhat.com>
Date: Wed, 20 Jul 2022 10:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Revert "gitlab: disable accelerated zlib for s390x"
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org,
 iii@linux.ibm.com, peter.maydell@linaro.org
References: <20220720082844.6700-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720082844.6700-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 10.28, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> This reverts commit 309df6acb29346f89e1ee542b1986f60cab12b87.
> With Ilya's 'multifd: Copy pages before compressing them with zlib'
> in the latest migration series, this shouldn't be a problem any more.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ------------
>   .travis.yml                                        |  6 ++----
>   2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> index 9f1fe9e7dc..03e74c97db 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
> @@ -8,8 +8,6 @@ ubuntu-20.04-s390x-all-linux-static:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>    - if: "$S390X_RUNNER_AVAILABLE"
> @@ -29,8 +27,6 @@ ubuntu-20.04-s390x-all:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    timeout: 75m
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
> @@ -48,8 +44,6 @@ ubuntu-20.04-s390x-alldbg:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -71,8 +65,6 @@ ubuntu-20.04-s390x-clang:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -93,8 +85,6 @@ ubuntu-20.04-s390x-tci:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> @@ -114,8 +104,6 @@ ubuntu-20.04-s390x-notcg:
>    tags:
>    - ubuntu_20.04
>    - s390x
> - variables:
> -    DFLTCC: 0
>    rules:
>    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>      when: manual
> diff --git a/.travis.yml b/.travis.yml
> index 4fdc9a6785..fb3baabca9 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -218,7 +218,6 @@ jobs:
>           - TEST_CMD="make check check-tcg V=1"
>           - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
>           - UNRELIABLE=true
> -        - DFLTCC=0
>         script:
>           - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
>           - |
> @@ -258,7 +257,7 @@ jobs:
>         env:
>           - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
>                     --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
> -        - DFLTCC=0
> +
>       - name: "[s390x] GCC (user)"
>         arch: s390x
>         dist: focal
> @@ -270,7 +269,7 @@ jobs:
>             - ninja-build
>         env:
>           - CONFIG="--disable-containers --disable-system"
> -        - DFLTCC=0
> +
>       - name: "[s390x] Clang (disable-tcg)"
>         arch: s390x
>         dist: focal
> @@ -304,4 +303,3 @@ jobs:
>           - CONFIG="--disable-containers --disable-tcg --enable-kvm
>                     --disable-tools --host-cc=clang --cxx=clang++"
>           - UNRELIABLE=true
> -        - DFLTCC=0

Reviewed-by: Thomas Huth <thuth@redhat.com>


