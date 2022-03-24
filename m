Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B993B4E69E8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:38:08 +0100 (CET)
Received: from localhost ([::1]:35592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUDf-0003jh-Nx
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:38:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXUBi-0001e8-Nc
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:36:06 -0400
Received: from [2a00:1450:4864:20::62a] (port=38829
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXUBh-0004Vh-1S
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:36:06 -0400
Received: by mail-ej1-x62a.google.com with SMTP id r13so11519757ejd.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nGPO4jBgeP+CZKgeUlzXQTcaxdR//bSdmnlXMZVWT1w=;
 b=WUfEzWtz8QECE6mlLYWra6zXgIsDJF1X5hYT7TNTa/ZInqixPHmUwTgBascquTJvNh
 8pt4eBZ50zJ/ZM8+9TyJFkD+6QpoPwPB6gSJvKJ35qOWdaah7lWuoTM/aVArE1nRvnCd
 QqNnFU2vkDWT0cHBoGJVRRdZJF8TTGX7t/pN+ywL+mn9DaWI1a7LlvXfUJ6H+KNOR3nV
 oLuA0bKuGfs0Dd0MtPwTppJayXRtpTLKvz/kGx+KSVa+jPYCWG3YeqJmYSkufOZQzte/
 HQKHkPA2pCZ0G50isgOCaoovBf/d57E99+tpw+9btf809SR2a4QYY2JPPk/7IgWjdXTC
 O2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nGPO4jBgeP+CZKgeUlzXQTcaxdR//bSdmnlXMZVWT1w=;
 b=GdiP+N4J0DmYwFD1ERn4p6F8XDxhqkPJDltyqWErDMTI2fFI/32uedWBJnH3HBnMSj
 anB2D2yNvjUrBp4nMTl/vevlC6NTu5mV1b3EQU9ROGuYz9U+XLGg/X4stC171tuQMjR4
 gqyysLB0DXhOkaSvmXHNL2pn7e0CfUqGBvzOg/f8J1yMaNITbjPX8FgxO3pbQET17DpF
 1aYZrm2afr7AJAm2Eqwhzunr4RCJaeE/RzBeQl2S5qj5F+bcnnRCTx9hAapY1MiW7e58
 fRcqK/GBU3QwY57nnStSno1DcIWGpi+gVxtLNrIE1OZjiMmTXLp2F54wbSEeLD6/29Wq
 tyiA==
X-Gm-Message-State: AOAM532lOUcOd+uhj7y6mAQjpGrh4yRjnZ9qLWWSsTHypIxp5ltlW7B4
 eL+JzOu5a23A7Q5lVNU23pZK7Q==
X-Google-Smtp-Source: ABdhPJytcRJw7iHP+N2MoDdDsGUPUsExSn5UPPYLeXNHs32kp3LYrJ2ckxC79jK0RgIOtZ6LsZ57KQ==
X-Received: by 2002:a17:907:96ab:b0:6d7:1720:15d6 with SMTP id
 hd43-20020a17090796ab00b006d7172015d6mr7906244ejc.322.1648154162830; 
 Thu, 24 Mar 2022 13:36:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 gq12-20020a170906e24c00b006e067c93e1bsm1561471ejb.39.2022.03.24.13.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 13:36:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50ED81FFB7;
 Thu, 24 Mar 2022 20:36:00 +0000 (GMT)
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-5-leandro.lupori@eldorado.org.br>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [RFC PATCH 4/6] tests/tcg: add support for ppc64le softmmu tests
Date: Thu, 24 Mar 2022 20:34:59 +0000
In-reply-to: <20220324190854.156898-5-leandro.lupori@eldorado.org.br>
Message-ID: <87k0cj2imn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> Adding a new, "virtual" TCG test target, ppc64le-softmmu, seems to
> be the cleanest way to support both BE and LE tests for
> ppc64-softmmu.
>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>  tests/Makefile.include                    |  7 ++++---
>  tests/tcg/configure.sh                    | 11 ++++++++++-
>  tests/tcg/ppc64/Makefile.softmmu-target   |  2 ++
>  tests/tcg/ppc64le/Makefile.softmmu-target |  7 +++++++
>  4 files changed, 23 insertions(+), 4 deletions(-)
>  create mode 100644 tests/tcg/ppc64le/Makefile.softmmu-target
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index e7153c8e91..4001fedbc3 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -40,9 +40,10 @@ SPEED =3D quick
>  TARGETS=3D$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-tar=
gets)))
>=20=20
>  # Per guest TCG tests
> -BUILD_TCG_TARGET_RULES=3D$(patsubst %,build-tcg-tests-%, $(TARGETS))
> -CLEAN_TCG_TARGET_RULES=3D$(patsubst %,clean-tcg-tests-%, $(TARGETS))
> -RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, $(TARGETS))
> +TCG_TARGETS=3D$(patsubst tests/tcg/config-%.mak, %, $(wildcard tests/tcg=
/config-*.mak))
> +BUILD_TCG_TARGET_RULES=3D$(patsubst %,build-tcg-tests-%, $(TCG_TARGETS))
> +CLEAN_TCG_TARGET_RULES=3D$(patsubst %,clean-tcg-tests-%, $(TCG_TARGETS))
> +RUN_TCG_TARGET_RULES=3D$(patsubst %,run-tcg-tests-%, $(TCG_TARGETS))

I'm not following what is going on here. Are we creating a new target
type? Is this just to avoid duplication in tests/tcg subdirs?

>=20=20
>  # Probe for the Docker Builds needed for each build
>  $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index ed4b5ccb1f..a4ac7a4e44 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -80,6 +80,10 @@ fi
>  : ${cross_as_tricore=3D"tricore-as"}
>  : ${cross_ld_tricore=3D"tricore-ld"}
>=20=20
> +# If target ppc64-softmmu is configured, also include the virtual test t=
arget
> +# ppc64le-softmmu
> +target_list=3D`echo $target_list | sed 's/ppc64-softmmu/& ppc64le-softmm=
u/'`
> +
>  for target in $target_list; do
>    arch=3D${target%%-*}
>=20=20
> @@ -237,7 +241,12 @@ for target in $target_list; do
>        ;;
>      *-softmmu)
>        echo "CONFIG_SOFTMMU=3Dy" >> $config_target_mak
> -      echo "QEMU=3D$PWD/qemu-system-$arch" >> $config_target_mak
> +      if test $arch =3D "ppc64le"; then
> +        sys_arch=3Dppc64
> +      else
> +        sys_arch=3D$arch
> +      fi
> +      echo "QEMU=3D$PWD/qemu-system-$sys_arch" >> $config_target_mak
>        ;;
>    esac
>=20=20
> diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Ma=
kefile.softmmu-target
> index 8f9925ca5a..511b6322df 100644
> --- a/tests/tcg/ppc64/Makefile.softmmu-target
> +++ b/tests/tcg/ppc64/Makefile.softmmu-target
> @@ -2,6 +2,8 @@
>  # PowerPC64 system tests
>  #
>=20=20
> +BIG_ENDIAN ?=3D 1
> +
>  # For now, disable tests that are failing
>  DISABLED_TESTS :=3D memory
>  DISABLED_EXTRA_RUNS :=3D run-gdbstub-memory
> diff --git a/tests/tcg/ppc64le/Makefile.softmmu-target b/tests/tcg/ppc64l=
e/Makefile.softmmu-target
> new file mode 100644
> index 0000000000..d4162160ee
> --- /dev/null
> +++ b/tests/tcg/ppc64le/Makefile.softmmu-target
> @@ -0,0 +1,7 @@
> +#
> +# PowerPC64 LE system tests
> +#
> +
> +BIG_ENDIAN =3D 0
> +
> +include $(SRC_PATH)/tests/tcg/ppc64/Makefile.softmmu-target


--=20
Alex Benn=C3=A9e

