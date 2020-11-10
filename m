Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D82ADFF7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:43:45 +0100 (CET)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZYO-0000CA-Lr
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZQ0-0002Aw-Hc
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:35:04 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZPu-0000Pk-SX
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:35:01 -0500
Received: by mail-wr1-x443.google.com with SMTP id b8so14019636wrn.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xKsmZxpUiOLSdJc2k4uQibWw4hwHq7IgcOmSYvuCCGU=;
 b=Yqxl4qOpWtSFtT+gMveY7/ndQOTj7VYn+BAjwj9efpc/W3Li/o5JV2cv+s3xZCiE8Q
 GcNFhP8MLulchfQttYMnJU6bWuvyEAiCb2Ty6IC8RExoeTfD+xEfi6PPiw8zNsoiqlnm
 KewBipKYn2ypEKA0Kx7RN6E6RA+33pRi+YKYtiNoU6TbTX0D2kxR2jmPg4QRmI7xMiio
 R9pP6uuf//x3FEH0qkh7QTJtvMvUaOVaLCys9o+/tToswKUFQowV95ve6eP8b20UpHud
 pxB1XDabciedjATPRgvupVY4r+uwRGA+KJc4bwZZDvzTNDrgsEEmGOPmoG0vTipBOf9y
 RIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=xKsmZxpUiOLSdJc2k4uQibWw4hwHq7IgcOmSYvuCCGU=;
 b=frLIqP/5wn2feD5ihd6e6GrOGfgi9rAHQKsEZCJQgFSTeA3v9lmnPHVka+8+nAdMzv
 DQQCRhUTIWVqCaMwzSsmiLYxLZuKmiaj71sqiVbHtYJwZKQ+qwziZCHEXWueLSvI/bp4
 Ax46rvSf2kSV/zLZYUuHqDPJgHw70u+eZBisM2uWZEHZrytf/5h4ZoZj2YFMKxFi8nRy
 akCbQcpwp7pZGvQLWve4gTFlN3KBrKgzKPzDgDGd3Yctf8dj6FZ9jK5L7XGkYWgP9mwZ
 8tS5M1LuPB1Ng+YsNyxI+xjdunsv+Mbk5OtAOsNJxNylQGEFemsQ7pbVA338tB/lq5Xl
 XcSA==
X-Gm-Message-State: AOAM531pct4IIkLgrkoxVH3aEQALRlcBD3zDJHOH5eG5MVY+HBcDuqfe
 4KpifuqFX+5Fb5uzPhH1UEQMMA==
X-Google-Smtp-Source: ABdhPJwAhqSYz5r5MlG3Jnx+QaKo7Q6K9ym/CEnC0APOdAFxLHrDaSY88CHpkYRJhHaovW9vvneW5g==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr24597785wrv.69.1605036895369; 
 Tue, 10 Nov 2020 11:34:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c64sm3842098wmd.41.2020.11.10.11.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:34:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E91BC1FF7E;
 Tue, 10 Nov 2020 19:34:52 +0000 (GMT)
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-9-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.0 v4 08/17] gitlab-ci: Move linux-user debug-tcg
 test across to gitlab
In-reply-to: <20201108204535.2319870-9-philmd@redhat.com>
Date: Tue, 10 Nov 2020 19:34:52 +0000
Message-ID: <87wnyt6m5f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Similarly to commit 8cdb2cef3f1, move the linux-user (debug-tcg)
> test to GitLab.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>  .gitlab-ci.yml | 7 +++++++
>  .travis.yml    | 9 ---------
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3fc3d0568c6..80082a602b8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -304,6 +304,13 @@ build-user:
>      CONFIGURE_ARGS: --disable-tools --disable-system
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
> +build-user-debug:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-system --enable-debug-tcg
> +    MAKE_CHECK_ARGS: check-tcg
> +
>  # Run check-tcg against linux-user (with plugins)
>  # we skip sparc64-linux-user until it has been fixed somewhat
>  # we skip cris-linux-user as it doesn't use the common run loop
> diff --git a/.travis.yml b/.travis.yml
> index 15d92291358..bee6197290d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -293,15 +293,6 @@ jobs:
>          - ${SRC_DIR}/configure ${CONFIG} --extra-cflags=3D"-g3 -O0 -fsan=
itize=3Dthread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
>=20=20
>=20=20
> -    # Run check-tcg against linux-user
> -    - name: "GCC check-tcg (user)"
> -      env:
> -        - CONFIG=3D"--disable-system --enable-debug-tcg"
> -        - TEST_BUILD_CMD=3D"make build-tcg"
> -        - TEST_CMD=3D"make check-tcg"
> -        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> -
> -
>      # Run check-tcg against softmmu targets
>      - name: "GCC check-tcg (some-softmmu)"
>        env:

I just realised I replicated this is a slightly different way - by
dropping --debug-tcg and moving the rest in one commit. I skipped over
the for 6.0 stuff when looking over your series but it's certainly worth
moving the check-tcg ones now given the stability issues.

--=20
Alex Benn=C3=A9e

