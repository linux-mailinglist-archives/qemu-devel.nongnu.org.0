Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FA620CDD8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 12:16:27 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpqpu-00084J-JS
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqor-0007Ce-28
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:15:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58911
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jpqop-0006Xn-2p
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 06:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593425718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5u7oTgDylesoDgTShP6RlhYMqQqkJfYcV/03oqNgIkc=;
 b=KBYvEbd9mie6WxmuYReN9MSakzSMrGawnWb+8nDua5OBN9rETQABWTzk6zLJ7Ux2t2aV/i
 hJpvF3782svHwzPSqVEw5lWt+HR3xekk3QwkPCMakDqJAuGrpbbmU+Ez+9p4fK576EcXwi
 sCuyB4+SHTyRw7gmco77cL2rZkzSzy4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-C5KZyzNsO0GDo4fv-3yEFQ-1; Mon, 29 Jun 2020 06:15:16 -0400
X-MC-Unique: C5KZyzNsO0GDo4fv-3yEFQ-1
Received: by mail-wr1-f69.google.com with SMTP id o12so16279771wrj.23
 for <qemu-devel@nongnu.org>; Mon, 29 Jun 2020 03:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5u7oTgDylesoDgTShP6RlhYMqQqkJfYcV/03oqNgIkc=;
 b=UGQbTz/VuzJ3ukyVrD6TcVS1YIeDlsE6R9nZvnqi7Cd9BbZzckg65tyVyPyQhZ1tP7
 8THnBO8LldUGnVl3zTZ8IzZPgbwYLJJSJW7vbVu7yyIBbhclzzcBGrJiFttjWykwxfu+
 I5pBaoEkzwiuyl/jzlGrK7V92Tc/a1rxaZa12lQLjCbOVP762LwYVAcLyIs4WaRPxvC8
 dwOoT6gjxKGmXWs1hhhIvK6P6ic26wivSOs+OXKw3qA/CpLnbXYG1gaoctm9ym+6goqh
 FMquCEqwmcnluQGyc9jqhIz0zQzSXoj/XJaofMfvLKi66Q4XVwPnfF17kNyfpirJL7cF
 1wTg==
X-Gm-Message-State: AOAM530jTYoabS7KrnHbiLvMk/uzYrTjg3XgZiBeAdGND341hQwpFIGl
 wIbIp//5q7XQ8Pd9bjlfHo2lNFlCBABg6XbuO3FX843LYoBu2lGXFULjOuyZYumncJeCws9Z4CJ
 nmpooy3X1XGOjOyM=
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr16584238wmb.61.1593425715398; 
 Mon, 29 Jun 2020 03:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQthFMAUF3Vpks9KYe4i0ri/UgKX82JwZKJbWBXRlrKbP755l4lMnMuJAsHqvoBylDIhF4Pg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr16584218wmb.61.1593425715124; 
 Mon, 29 Jun 2020 03:15:15 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e5sm49611816wrs.33.2020.06.29.03.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 03:15:14 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] gitlab: add acceptance testing to system builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-25-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <f1bdd585-3a66-2002-5984-1d18bb768e08@redhat.com>
Date: Mon, 29 Jun 2020 12:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200626181357.26211-25-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Wainer

On 6/26/20 8:13 PM, Alex Bennée wrote:
> As part of migrating things from Travis to GitLab add the acceptance
> tests. To do this:
> 
>   - rename system1 to system-ubuntu-main
>   - rename system2 to system-fedora-misc
>   - split into build/check/acceptance
>   - remove -j from check stages
>   - use artifacts to save build stage
>   - add post acceptance template and use
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20200622143204.12921-16-alex.bennee@linaro.org>
> 
> ---
> v2
>   - updated with danp's docker changes
>   - use needs instead of dependancies
>   - touch all the build files to prevent rebuild
> ---
>  .gitlab-ci.yml | 66 +++++++++++++++++++++++++++++++++++++++++++++++---
>  .travis.yml    | 23 ------------------
>  2 files changed, 63 insertions(+), 26 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a7abc55a5c6..5ae8130bd1a 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -1,8 +1,12 @@
> +# Currently we have two build stages after our containers are built:
> +#  - build (for traditional build and test or first stage build)
> +#  - test (for test stages, using build artefacts from a build stage)
>  stages:
>    - containers
>    - containers-layer2
>    - containers-layer3
>    - build
> +  - test
>  
>  include:
>    - local: '/.gitlab-ci.d/edk2.yml'
> @@ -24,26 +28,82 @@ include:
>          ../configure --enable-werror $CONFIGURE_ARGS ;
>        fi
>      - make -j"$JOBS"
> -    - make -j"$JOBS" $MAKE_CHECK_ARGS
> +    - if test -n "$MAKE_CHECK_ARGS";
> +      then
> +        make $MAKE_CHECK_ARGS ;
> +      fi
> +
> +.native_test_job_template: &native_test_job_definition
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  script:
> +    - cd build
> +    - find . -type f -exec touch {} +
> +    - make $MAKE_CHECK_ARGS
> +
> +.post_acceptance_template: &post_acceptance
> +  after_script:
> +    - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat

Wainer, I guess remember you said you'd send a script to do that
instead, right?

> +    - du -chs $HOME/avocado/data/cache
>  
> -build-system1:
> +build:system-ubuntu-main:
>    <<: *native_build_job_definition
>    variables:
>      IMAGE: ubuntu2004
>      TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu lm32-softmmu
>        moxie-softmmu microblazeel-softmmu mips64el-softmmu m68k-softmmu ppc-softmmu
>        riscv64-softmmu sparc-softmmu
> +  artifacts:
> +    paths:
> +      - build
> +
> +check:system-ubuntu-main:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build:system-ubuntu-main
> +      artifacts: true
> +  variables:
> +    IMAGE: ubuntu2004
>      MAKE_CHECK_ARGS: check
>  
> -build-system2:
> +acceptance:system-ubuntu-main:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build:system-ubuntu-main
> +      artifacts: true
> +  variables:
> +    IMAGE: ubuntu2004

(here I'd use ubuntu2004:acceptance)

> +    MAKE_CHECK_ARGS: check-acceptance
> +
> +build:system-fedora-alt:
>    <<: *native_build_job_definition
>    variables:
>      IMAGE: fedora
>      TARGETS: tricore-softmmu unicore32-softmmu microblaze-softmmu mips-softmmu
>        riscv32-softmmu s390x-softmmu sh4-softmmu sparc64-softmmu x86_64-softmmu
>        xtensa-softmmu nios2-softmmu or1k-softmmu
> +  artifacts:
> +    paths:
> +      - build
> +
> +check:system-fedora-alt:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build:system-fedora-alt
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora
>      MAKE_CHECK_ARGS: check
>  
> +check:system-fedora-alt:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build:system-fedora-alt
> +      artifacts: true
> +  variables:
> +    IMAGE: fedora

(here I'd use fedora:acceptance)

> +    MAKE_CHECK_ARGS: check-acceptance
> +
>  build-disabled:
>    <<: *native_build_job_definition
>    variables:
> diff --git a/.travis.yml b/.travis.yml
> index 74158f741b1..c24dfbe377f 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -289,29 +289,6 @@ jobs:
>        python: 3.6
>  
>  
> -    # Acceptance (Functional) tests
> -    - name: "GCC check-acceptance"
> -      dist: bionic
> -      env:
> -        - CONFIG="--enable-tools --target-list=aarch64-softmmu,alpha-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sh4-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
> -        - TEST_CMD="make check-acceptance"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-acceptance"
> -      after_script:
> -        - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat
> -        - du -chs $HOME/avocado/data/cache
> -      addons:
> -        apt:
> -          packages:
> -            - python3-pil
> -            - python3-pip
> -            - python3-numpy
> -            - python3-opencv
> -            - python3-venv
> -            - rpm2cpio
> -            - tesseract-ocr
> -            - tesseract-ocr-eng
> -
> -
>      # Using newer GCC with sanitizers
>      - name: "GCC9 with sanitizers (softmmu)"
>        addons:
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


