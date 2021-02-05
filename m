Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D413B310FD7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:26:50 +0100 (CET)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85of-0000ha-QW
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84V7-0000Bc-Qd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:02:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84V4-0004os-Gv
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:02:33 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q7so8400667wre.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LdWgyO2zPb/JEQszL1uIIoVUIJQDmtTT27aFUt/yx6k=;
 b=QBzTVAAw6+l50YOzIZC+p4thsKcbrTt+3giNVMc8WmDrOExAnsYnUN5O2f7Ukl+qdi
 syw7xBL1HROBB2lOD4dIzocyhvItkwI9qAp3eq7DD3mBhixJOLQJhDsqZb/vMopndTeB
 +3XCplCci5DqWw1b7bLO0P3YdWBJLNSoKgCQ7+t8uXb2LYtPIO/m8AlQC/Vl08mxv3cO
 dL/Pmmr58pwEqd25E4D8ZkLpjHYZwF11UDIvfJ1F+yANyErODiEZO8ZBi6m2blFCOVWl
 LSrAM0BgSfEUYE0A8++xGBhyAmOAsZHmd8cTOKjp72d6KIVdD7hGy6S2gdef0LnDojj5
 M0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LdWgyO2zPb/JEQszL1uIIoVUIJQDmtTT27aFUt/yx6k=;
 b=JnkhLgBMpDELOaDlyJ8RkxsYGTn6dvMZwCM/2xMikbRMdmUHimnEV4EedfzB2neMMq
 xqp1eoHW5ubQ65Slf6FfMyeXWh9p/sTxqOhU8b0f6AldxGU4lHyH13ENclblCJN3xgIB
 9S5hyvsauk7Vuzsasp1bHzKcqpP1vJ1ln3X3cLBzn4G3/uY0Eu7Ealov5mn/Es7MQ5nJ
 zrbMkjnIKVj0lXHUmhE5PogjKak8RRXGLx+4X078ak5+lYcMQNYnjImUZ1iEVuBPYvRJ
 qMLprWiL07U4ZFYYJIHt7o8BWzKsM/S8Qf4J9n3+ROd721qU8+EJIZ1TINPSpBpX/bbs
 iOvA==
X-Gm-Message-State: AOAM531Q/ASwGqLVMHMgtrLXae7bCwph9wcWRCPLGOGxaKVARfLl7qKH
 OgTnYuuiRsAHLxaBlI1SNYDmJYA2rda2ximF
X-Google-Smtp-Source: ABdhPJySJ/ScRmqN/pIebC9hYfjoBx/0m//72+HkA4rQeeMbEugklprOdJOtHSFesHaTN0dOehYqnQ==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr6051228wrm.90.1612544547736; 
 Fri, 05 Feb 2021 09:02:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w14sm13048740wro.86.2021.02.05.09.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:02:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB8DC1FF7E;
 Fri,  5 Feb 2021 17:02:25 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
 <20210205091857.845389-3-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 2/5] travis.yml: Move the -fsanitize=undefined test
 to the gitlab-CI
Date: Fri, 05 Feb 2021 16:59:50 +0000
In-reply-to: <20210205091857.845389-3-thuth@redhat.com>
Message-ID: <87k0rmo3by.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Add it to the existing Clang job and also add a job that covers the
> linux-user code with this compiler flag. To make sure that the detected
> problems are not simply ignored, let's also use "-fno-sanitize-recover=3D=
..."
> now instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 14 ++++++++++++--
>  .travis.yml    | 27 ---------------------------
>  2 files changed, 12 insertions(+), 29 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 1070efce3f..1419eb4825 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -433,13 +433,23 @@ build-some-softmmu-plugins:
>      TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
> -build-clang:
> +clang-system:
>    <<: *native_build_job_definition
>    variables:
>      IMAGE: fedora
>      CONFIGURE_ARGS: --cc=3Dclang --cxx=3Dclang++
> +      --extra-cflags=3D-fno-sanitize-recover=3Dundefined
>      TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
> -      ppc-softmmu s390x-softmmu arm-linux-user
> +      ppc-softmmu s390x-softmmu
> +    MAKE_CHECK_ARGS: check-qtest check-block check-tcg
> +
> +clang-user:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --cc=3Dclang --cxx=3Dclang++ --disable-system
> +      --target-list-exclude=3Dmicroblazeel-linux-user,aarch64-linux-user=
,armeb-linux-user,x86_64-linux-user,mipsn32el-linux-user,xtensa-linux-user
> +      --extra-cflags=3D-fno-sanitize-recover=3Dundefined
>      MAKE_CHECK_ARGS: check

Interesting choice of things to skip. I don't think we'll get much
coverage though as check-tcg is about the only thing that exercises
linux-user to any degree and you'll want to include arches the build
system can build binaries for (arguably we should also update check-tcg
to build for ^endian variants of the main targets).

>=20=20
>  # These targets are on the way out
> diff --git a/.travis.yml b/.travis.yml
> index 05fa1ca905..533a60c130 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -138,33 +138,6 @@ jobs:
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
>=20=20
>=20=20
> -    # Test with Clang for compile portability (Travis uses clang-5.0)
> -    - name: "Clang (user)"
> -      env:
> -        - CONFIG=3D"--disable-system --host-cc=3Dclang --cxx=3Dclang++"
> -        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
> -      compiler: clang
> -
> -
> -    - name: "Clang (main-softmmu)"
> -      env:
> -        - CONFIG=3D"--target-list=3D${MAIN_SOFTMMU_TARGETS}
> -                  --host-cc=3Dclang --cxx=3Dclang++"
> -        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-sanitize"
> -      compiler: clang
> -      before_script:
> -        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
> -        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags=3D"-fsanitize=3D=
undefined -Werror" || { cat config.log meson-logs/meson-log.txt && exit 1; }
> -
> -
> -    - name: "Clang (other-softmmu)"
> -      env:
> -        - CONFIG=3D"--disable-user --target-list-exclude=3D${MAIN_SOFTMM=
U_TARGETS}
> -                  --host-cc=3Dclang --cxx=3Dclang++"
> -        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-clang-default"
> -      compiler: clang
> -
> -
>      # Using newer GCC with sanitizers
>      - name: "GCC9 with sanitizers (softmmu)"
>        dist: bionic


--=20
Alex Benn=C3=A9e

