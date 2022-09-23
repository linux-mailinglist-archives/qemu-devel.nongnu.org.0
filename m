Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605F85E801C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 18:44:14 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oblme-0000cq-Ql
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 12:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblTO-0006gp-GT
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:24:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oblTL-0007If-Ig
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 12:24:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id r7so806443wrm.2
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=lsrcvWqRSRQskmCxjiKST4CWRHLk0Q+EvTt+1jat0EI=;
 b=h06/pgQAG1vvC148pitwACAKPphe0z+ld89sFU0dSrM7AqKJn1Q65AuS5tnVCyviM6
 tIXZXBHJgKfidwhYaGXpSYFhDCYEHQkCcjg70IExDkK//Fh3vsjojGXJQNDshdwvGzMF
 rh8q3tTJRyqAKtJi6h4jEVuak2wh/rkYhVlRAs5Wlv0aRAl8U8XW0Vci0B3QhOFyiO5G
 MpQ00P8HbPX+9No+aIfMCWl5iNPohSvR20RbEJSaEbJVBzp02vWurkiu/fRWZ5ndmC2C
 gCdif4dGm0OE9AFDUSK/nCwadqpeJWwV5tJl5oFsF5vajvoHyhV/jGo2BVbrKGSqIO54
 Q8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=lsrcvWqRSRQskmCxjiKST4CWRHLk0Q+EvTt+1jat0EI=;
 b=oIGefW3s7Eg01lew9B6dmBpwY65/uszr7r6G9JyXKHHtoFin1kY5BYfiFY42XON9mr
 Qunj/P5mBPT8bwpN6ry5zgOWC4tMRM7VLNX3PFuEC+6V1EY8LFa+oTNnGPEDP5rSBMg9
 HLkKT1HkUb6N51Ba6HrL6584Abx5tf7tuceatHz3E6a2McHQrrJXCFx+Jb3VZKgf7QHW
 o5Tw4ElWB2tFfH1BVV/K61QlUR2KUHCaH3VUVjCgggjfM4TgMWHcFcUibF27Ltw7kj1h
 DL88tfghPbDPAUEUYbL0x5wrehJHb13WhmiOUZNiV8knqSjvD+0AMkyF05KSYZEMnR4Z
 Q6rw==
X-Gm-Message-State: ACrzQf2x/CyReVyom9N0Iu7r/lqudk2neVIQlqMr21Jngj31gn6B9lmX
 R1cuJ3LvZEEHUj3KAKUaOijlSw==
X-Google-Smtp-Source: AMsMyM6RFurBF5YCCPUJ3tW0I48jd0fP5HwCIIxkvmeL6+jo8xZwf+/KLhi1mbqYm7QRN7NIEV1N+Q==
X-Received: by 2002:adf:f691:0:b0:22a:f348:7d13 with SMTP id
 v17-20020adff691000000b0022af3487d13mr5859170wrp.306.1663950253949; 
 Fri, 23 Sep 2022 09:24:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c9-20020adffb09000000b0022a3517d3besm8033675wrr.5.2022.09.23.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:24:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1C761FFB7;
 Fri, 23 Sep 2022 17:24:12 +0100 (BST)
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-37-bmeng.cn@gmail.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 36/39] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
Date: Fri, 23 Sep 2022 17:22:18 +0100
In-reply-to: <20220920103159.1865256-37-bmeng.cn@gmail.com>
Message-ID: <87pmfmukib.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --=
without-default-devices"
> changed to compile QEMU with the --without-default-devices switch for
> the msys2-64bit job, due to the build could not complete within the
> project timeout (1h), and also mentioned that a bigger timeout was
> getting ignored on the shared Gitlab-CI Windows runners.
>
> However as of today it seems the shared Gitlab-CI Windows runners does
> honor the job timeout, and the runner has the timeout limit of 2h, so
> let's increase the timeout to 90 minutes and drop the configure switch
> "--without-default-devices" to get a larger build coverage.

I'd like to push back lightly against increasing the time because it
lengthens the total run time before we can merge a branch. Ideally we
could come up with a combination of build and tests that exercises all
the Windows code without exhaustively testing code paths that are tested
elsewhere. For device emulation are there any host specific things we
are testing?


>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - Change the timeout limit to 90 minutes
>
>  .gitlab-ci.d/windows.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index da6013904a..818676662a 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>        - ${CI_PROJECT_DIR}/msys64/var/cache
>    needs: []
>    stage: build
> -  timeout: 70m
> +  timeout: 90m
>    before_script:
>    - If ( !(Test-Path -Path msys64\var\cache ) ) {
>        mkdir msys64\var\cache
> @@ -59,7 +59,7 @@ msys2-64bit:
>    - $env:MSYSTEM =3D 'MINGW64'     # Start a 64 bit Mingw environment
>    - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmmu
> -      --enable-capstone --without-default-devices'
> +      --enable-capstone'
>    - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=3D/d' build/config-host.ma=
k"
>    - .\msys64\usr\bin\bash -lc 'make'
>    - .\msys64\usr\bin\bash -lc 'make check'


--=20
Alex Benn=C3=A9e

