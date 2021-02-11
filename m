Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237E31878C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:59:17 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8km-0001lS-5e
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:59:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lA8jC-0001FV-T2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:57:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lA8j9-0007i0-BY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613037453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+U8v+/i55if/MDgWhO7Ni99HPp5bbCmU2m2Sf8BkW94=;
 b=iDF/+nojNjx5XgOR1dgPYRovew6moLmGQEfONO6nekiejGC3Lg3iN7kyvbYjBzXdLCZdN1
 SbD8a+QztHKP5lz8EkxkawNpC37bQER9GZ1r7avxZxyUcVIwYJNBHJUSZaikC6qnnLzzLG
 ff7X1czLRd8ZYhUL8VlB6uZtD7sITpk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-168uobdgPmGJFdleEiTArQ-1; Thu, 11 Feb 2021 04:57:32 -0500
X-MC-Unique: 168uobdgPmGJFdleEiTArQ-1
Received: by mail-wm1-f70.google.com with SMTP id z67so2947590wme.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+U8v+/i55if/MDgWhO7Ni99HPp5bbCmU2m2Sf8BkW94=;
 b=uAk99sTTbT5GBqVyGvGOKejB9URydNzt7KGYqHa8VGq1LfeKg9kn4s+obt3OaXasaf
 e4ND2QECsp+ka6nOYz4ol5z+QM07DDERrowBrKreN6iuBLN8+8X/YhSI6DdAOkLDy4Qb
 i7MKt+iO2aHMuyIxlQJ9Pzbet5RBqwed36dbgVZ7HJpQEBI9/hga1m4XOzXU91QPVjCy
 v1f+EA1Fdh1Y+tmsK5RFFkDuU0HfMtI/ywPvFj2ItY6aQrepqf3aHXw7TFbjqdbhmZy0
 VmGvz49NMaTYGa4+OW5RlHayeCp1mEHLiwZREHieQPUqOqC5Q5jZ6pO84zmysEGAZLVf
 43AA==
X-Gm-Message-State: AOAM530506G4S3I4WiUTy2fCxEmH6qMm29u/QNfHBKO73K0p8nkhB8nl
 53c64Wyl6wP/tnGmxvmEDKsN+5TE+m9UuPV8llHhjsXiorq6/3XXO4d2AQdQldryHfRl3GCATo0
 mGiNk53I8gw0IcFY=
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr4289545wmb.18.1613037450855; 
 Thu, 11 Feb 2021 01:57:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9S1ME2eeUemr1zqkcRihMUpcGwKhqNp4x/JNvyN71PVLLUME6/QxaLRotLSUFjE23SXM3ww==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr4289517wmb.18.1613037450550; 
 Thu, 11 Feb 2021 01:57:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w4sm8519883wmc.13.2021.02.11.01.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 01:57:30 -0800 (PST)
Subject: Re: [PATCH v3 5/5] travis.yml: Move the -fsanitize=thread testing to
 the gitlab-CI
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210211045455.456371-1-thuth@redhat.com>
 <20210211045455.456371-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <36576511-a1e5-ec8a-2f79-7250371fd428@redhat.com>
Date: Thu, 11 Feb 2021 10:57:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211045455.456371-6-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 5:54 AM, Thomas Huth wrote:
> Use clang-10, so we can also use the --enable-tsan configure
> option instead of only passing the flag via --extra-cflags.

Maybe worth commenting the new job is now restricted to a subset
of targets, but linux-user is also covered?

> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml |  9 +++++++++
>  .travis.yml    | 51 --------------------------------------------------
>  2 files changed, 9 insertions(+), 51 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index e878cc0847..7adb9a4cef 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -452,6 +452,15 @@ clang-user:
>        --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
>      MAKE_CHECK_ARGS: check-unit check-tcg
>  
> +tsan-build:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
> +                    --enable-fdt=system --enable-slirp=system
> +    TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
> +    MAKE_CHECK_ARGS: bench V=1
> +
>  # These targets are on the way out
>  build-deprecated:
>    <<: *native_build_job_definition
> diff --git a/.travis.yml b/.travis.yml
> index f0e2b1059c..0a4f38b9d8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -119,57 +119,6 @@ after_script:
>  jobs:
>    include:
>  
> -
> -    # Using newer GCC with sanitizers
> -    - name: "GCC9 with sanitizers (softmmu)"
> -      dist: bionic
> -      addons:
> -        apt:
> -          update: true
> -          sources:
> -            # PPAs for newer toolchains
> -            - ubuntu-toolchain-r-test
> -          packages:
> -            # Extra toolchains
> -            - gcc-9
> -            - g++-9
> -            # Build dependencies
> -            - libaio-dev
> -            - libattr1-dev
> -            - libbrlapi-dev
> -            - libcap-ng-dev
> -            - libgnutls28-dev
> -            - libgtk-3-dev
> -            - libiscsi-dev
> -            - liblttng-ust-dev
> -            - libnfs-dev
> -            - libncurses5-dev
> -            - libnss3-dev
> -            - libpixman-1-dev
> -            - libpng-dev
> -            - librados-dev
> -            - libsdl2-dev
> -            - libsdl2-image-dev
> -            - libseccomp-dev
> -            - libspice-protocol-dev
> -            - libspice-server-dev
> -            - liburcu-dev
> -            - libusb-1.0-0-dev
> -            - libvte-2.91-dev
> -            - ninja-build
> -            - sparse
> -            - uuid-dev
> -      language: generic
> -      compiler: none
> -      env:
> -        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
> -        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-linux-user"
> -        - TEST_CMD=""
> -      before_script:
> -        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
> -        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
> -
> -
>      - name: "[aarch64] GCC check-tcg"
>        arch: arm64
>        dist: focal
> 


