Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1935F1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 13:09:57 +0200 (CEST)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWdPA-0004q1-3d
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 07:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWdNo-0004Q1-Oh
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:08:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWdNj-0002be-Vf
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 07:08:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id s7so19350088wru.6
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nizXa5FUo3LKsu4EORGUBmnhRXyPrbkIGx4sB7GC7Uw=;
 b=O96wIINXHRfcPrh3gB0hFcgpXmYP1nVPoKcPXqKeqtJUtQy1gp+YV/nay4wjI2+SWo
 axTZ3SK/wvMEZ80O5Z3WGWLMwuTI5GxFqNAPF/Rd4zowEuQg+uSf+BvI1pgrvBw1w3nc
 q2OOYedSiKxjwiGvT2VcDQHg6nEXb73lg/D9EMRtyBjYqlf+fF5t8hUe14jdSKTFKi69
 ++JwjrGnyCKpej06uB5Z1JQ7Ww6/VXlzsTqv06tqEd1rHdstes52QDk7bzghnoIKOXrk
 tt3Wa0W7htYE5SEid84SN+C5NOwEBMtdu1m2TFAFMbYWiGUPnt8Ce50O3yFU0YrblB3s
 IQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nizXa5FUo3LKsu4EORGUBmnhRXyPrbkIGx4sB7GC7Uw=;
 b=hostMkGirePPwFhO9fRwloKKXkBIiXA1Qg3SWJoan6I6APCiEedV2llrqmx7dcmxJs
 f/gMe//W+Wb9bsDNhp7pAPTM4+pI9XL9ioKw/m8d6ezsqFvat3p/v6EGFAfpnJ/S5qrO
 G3Waim491jJsZgSnQrR+vCJ5uKapfX4UVFrWdnbGY8xKLjt0HfnGUliP0SiZkKKsaZ6g
 mq3SAdMGtpWmw15phG9R84VCc0KAkpb7W/opdj/Lng/nWC+17VgBQM6asID8zSMZ8Ju/
 o7qdbuncZSFBvbTyFgC99kB42jfF4F6/sWc1q9S39ciZA3iUzYazzFJzOkn/LKZlOgox
 vL3Q==
X-Gm-Message-State: AOAM532iJOOVWt4RoknTmPOlMJQRdj63beuUyuVFG2zgRsC7G1iyx6sJ
 gRVSxkMqFynZdsZpuCdQBXTpnA==
X-Google-Smtp-Source: ABdhPJzqQ3BjV92uKYEhovoaRLHJH8lcBhu72qh10CvQMwUNkoKMU+yzmU+aa5wp50yzkNTTGxEDLg==
X-Received: by 2002:a5d:6ac6:: with SMTP id u6mr20384653wrw.290.1618398501753; 
 Wed, 14 Apr 2021 04:08:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x25sm5028504wmj.34.2021.04.14.04.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 04:08:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBB7F1FF7E;
 Wed, 14 Apr 2021 12:08:19 +0100 (BST)
References: <20210312152105.1836543-1-f4bug@amsat.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/tcg: Run tests on arch variants again
Date: Wed, 14 Apr 2021 12:02:55 +0100
In-reply-to: <20210312152105.1836543-1-f4bug@amsat.org>
Message-ID: <87zgy1ktss.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We used to run the TCG tests for various QEMU targets, but at
> some points it got restricted to base directories in tests/tcg/.
> For example, armeb/mipsel/mips64/... targets are currently skipped.
>
> The configuration Makefiles in default-configs/targets/ provide all
> the required information, in particular TARGET_BASE_ARCH.
>
> Source the target default-configs.mak and optionally process the
> TARGET_ARCH / TARGET_BASE_ARCH Makefiles (if these variables differ
> from TARGET_NAME).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/tcg/Makefile.target | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 24d75a5801f..677b247328f 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -85,6 +85,10 @@ TIMEOUT=3D15
>  endif
>=20=20
>  ifdef CONFIG_USER_ONLY
> +
> +# FIXME bsd-user?
> +include $(SRC_PATH)/default-configs/targets/$(TARGET_NAME)-linux-user.mak
> +
>  # The order we include is important. We include multiarch first and
>  # then the target. If there are common tests shared between
>  # sub-targets (e.g. ARM & AArch64) then it is up to
> @@ -92,6 +96,16 @@ ifdef CONFIG_USER_ONLY
>  # architecture in its VPATH.
>  -include $(SRC_PATH)/tests/tcg/multiarch/Makefile.target
>  -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
> +ifneq ($(TARGET_ARCH),)
> +ifneq ($(TARGET_ARCH),$(TARGET_NAME))
> +-include $(SRC_PATH)/tests/tcg/$(TARGET_ARCH)/Makefile.target
> +endif
> +endif
> +ifneq ($(TARGET_BASE_ARCH),)
> +ifneq ($(TARGET_BASE_ARCH),$(TARGET_ARCH))
> +-include $(SRC_PATH)/tests/tcg/$(TARGET_BASE_ARCH)/Makefile.target
> +endif
> +endif

This then breaks things like aarch64-linux-user semihosting tests
because we end up overriding semihosting CFLAGS:

  subprocess.CalledProcessError: Command '['docker', 'run', '--rm', '--labe=
l', 'com.qemu.instance.uuid=3D34c4dca59b4f4f368fcc75f25e6b79d8', '-u', '100=
0', '-w', '/home/alex/lsrc/qemu.git/builds/user.static/tests/tcg/aarch64-li=
nux-user', '-v', '/home/alex/lsrc/qemu.git/builds/user.static/tests/tcg/aar=
ch64-linux-user:/home/alex/lsrc/qemu.git/builds/user.static/tests/tcg/aarch=
64-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.git=
:ro,z', 'qemu/debian-arm64-test-cross', 'aarch64-linux-gnu-gcc-10', '-Wall'=
, '-Werror', '-O0', '-g', '-fno-strict-aliasing', '-I/home/alex/lsrc/qemu.g=
it/tests/tcg/aarch64', '-mthumb', '/home/alex/lsrc/qemu.git/tests/tcg/multi=
arch/arm-compat-semi/semihosting.c', '-o', 'semihosting', '-static']' retur=
ned non-zero exit status 1.
  filter=3D--filter=3Dlabel=3Dcom.qemu.instance.uuid=3D34c4dca59b4f4f368fcc=
75f25e6b79d8
  make[2]: *** [../Makefile.target:120: semihosting] Error 1
  make[1]: *** [/home/alex/lsrc/qemu.git/tests/tcg/Makefile.qemu:64: docker=
-build-guest-tests] Error 2
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:56: build-tcg-=
tests-aarch64-linux-user] Error 2

We should at least be able to run multiarch tests for all these other
arches if we have the right compilers for them.

I'm untangling configure.sh at the moment because I'm not quite sure
what the current "arches" variable in there is trying to achieve.

--=20
Alex Benn=C3=A9e

