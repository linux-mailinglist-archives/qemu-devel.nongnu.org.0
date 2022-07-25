Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42B58003C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:55:21 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyYJ-00082c-Re
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyRn-0000YR-Nv
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:48:36 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyRk-0005hl-9i
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:48:33 -0400
Received: by mail-ej1-x62b.google.com with SMTP id fy29so20591135ejc.12
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7u6TkkmpJQu41A+WayvVhyqF6DgkbZd4/ZL106Owl7k=;
 b=noxofZyz55NrA8jTIPzBn7kQmz/F7+K2n69m/cViU5CwkA7kxpuai048imIj/hv0Oi
 gnwwfSZQ29BdK/sPNybNi+UAlX0ffo4k4LR/b7HY1+ISIA+v8eOULwIghVYvekeXdmtW
 aRmZr+KX/tv4b/q4WW8VXcOchmHl9J/ctqcQWHFESkRJRBb3dHJaUf/nmuUPbtVn0CIQ
 gEGrCaHGdHweTyolKfOBFnThepbjTFT4q6qJ2iASnhVCgpQdeWTO+dXTDcIOSutU5Dgo
 lrljkU2mjqjLJm7/Kbm6vAt6mEOhI1MSZL62iJwXdZGefxtA0Gi6Ia0ipgKhltHwimbD
 REow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7u6TkkmpJQu41A+WayvVhyqF6DgkbZd4/ZL106Owl7k=;
 b=Euh7BUY40AsQtHxsb+cj/PkJCsHTFavXlCAEG0AkrLhg8ZIREQrsbmkDcydghxYlWL
 aUnmhIDyLPG/1n4C2vyPYuzdcysRh6WcYjrXxpBmpoHorDqhsHTIwrHM1eXHzShcNShb
 kXB47Bn14i6Hi3q7V1Cj0ClR+hNyrTvDEezBn5XKVs3EI8W9cF8s6JUBNjR5H00qQsJh
 L+A1nhYKovM9DBoe8XV7llR/ylmWBotKbQg8bBM3+bA82f6bhjUUWFeHFuVhPAbkfBw2
 yLIxskBSR6Pus5sLmLRxk8udp8virAIjSTAVXhL0Bv5b9dXc5EBnHo9uZsqjXeiTWyLs
 VWmQ==
X-Gm-Message-State: AJIora/UymWA1dQSvyMeqmJnXBnjTRA/18LJU+Ftfr2TrrXnx2ZZVibM
 8jSqHn913AltuFQiv+/B8auq4w==
X-Google-Smtp-Source: AGRyM1u2eUKWsQo9feUu14WX1SYFHH+AhTLHvX99gQSYponYhII+B5+uinQCyGagkTQG8FajdS0nig==
X-Received: by 2002:a17:906:5a51:b0:72b:5cdf:ed77 with SMTP id
 my17-20020a1709065a5100b0072b5cdfed77mr10022423ejc.505.1658756910426; 
 Mon, 25 Jul 2022 06:48:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 jz15-20020a170906bb0f00b0072637b9c8c0sm5358206ejb.219.2022.07.25.06.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 06:48:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A96221FFB7;
 Mon, 25 Jul 2022 14:48:28 +0100 (BST)
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Beraldo Leal <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, Bin Meng
 <bin.meng@windriver.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Date: Mon, 25 Jul 2022 14:47:55 +0100
In-reply-to: <20220725123000.807608-1-bmeng.cn@gmail.com>
Message-ID: <874jz5i9qr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> The following error message was seen during the configure:
>
>   "ln: failed to create symbolic link
>   'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"
>
> By default the MSYS environment variable is not defined, so the runtime
> behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
> At the configure phase, the qemu-system-x86_64.exe has not been built
> so creation of the symbolic link fails hence the error message.
>
> Set winsymlinks to 'native' whose behavior is most similar to the
> behavior of 'ln -s' on *nix, that is:
>
>   a) if native symlinks are enabled, and whether <target> exists
>      or not, creates <destination> as a native Windows symlink;
>   b) else if native symlinks are not enabled, and whether <target>
>      exists or not, 'ln -s' creates as a Windows shortcut file.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

I'm still seeing Windows build failures such as:

  https://gitlab.com/stsquad/qemu/-/jobs/2765579269

and

  https://gitlab.com/stsquad/qemu/-/jobs/2765579267

Any idea what's falling over?

> ---
>
>  .gitlab-ci.d/windows.yml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 1b2ede49e1..0b9572a8a3 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -57,6 +57,7 @@ msys2-64bit:
>        mingw-w64-x86_64-zstd "
>    - $env:CHERE_INVOKING =3D 'yes'  # Preserve the current working direct=
ory
>    - $env:MSYSTEM =3D 'MINGW64'     # Start a 64 bit Mingw environment
> +  - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmmu
>        --enable-capstone --without-default-devices'
>    - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=3D/d' build/config-host.ma=
k"
> @@ -89,6 +90,7 @@ msys2-32bit:
>        mingw-w64-i686-usbredir "
>    - $env:CHERE_INVOKING =3D 'yes'  # Preserve the current working direct=
ory
>    - $env:MSYSTEM =3D 'MINGW32'     # Start a 32-bit MinG environment
> +  - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - mkdir output
>    - cd output
>    - ..\msys64\usr\bin\bash -lc "../configure --target-list=3Dppc64-softm=
mu"


--=20
Alex Benn=C3=A9e

