Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04589387A6B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:52:40 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj09H-0004ja-3N
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj08R-00044s-7R
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:51:47 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj08P-0004mJ-Bg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:51:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c14so8534829wrx.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TWOWuO1tAQd2Q98LN/Ou+CeKejIRLoDp3eyp5EUcvco=;
 b=yDKDZv0tb7M4s7qAK/+NDeEAZQ8wjQIn4184uybnVJ8jmmpOoLjSxwrStbbe1Q8Kg6
 lK77CSs9FraBX2iZVGPbGlKI7zM0wk/onsfhyXQVMSWuiFeu101goT96op9hcg9t3JTF
 MNckgq7/ZDipLX2X49aJM7H1GxODelsB7wVxWEuHwRytg20snXOOe5nNZggXD18o4ZG0
 2Nc4J4WxjppM3HWDBdx87LUdZEW04cjRdoqDzidV1noFjzAovrPs3EERaWE11yZZqC7k
 5fnmPMV9pfK1FRNFxU7aYDQfgA1q8cXQjB6QhWlgYl/AeUMVrVOJTvZUz8UIJIipdH9O
 Rv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TWOWuO1tAQd2Q98LN/Ou+CeKejIRLoDp3eyp5EUcvco=;
 b=jCUBm9+KxgZZEaUJYCt4vTgguTTjIXWFcsPrGLMwtKHgSfKr8/YQfhSkYnz81XoZ3E
 CjiqsLNWireeNLiRSDrfBwwDAG8eSiKEuaqRvK7BWZhMkr9n7xNios76MP5DYV75DFMA
 vusP1NiLBUI1VVaGnZUE+QVCSDFLyN3tJdnt9C0ihTlS0Y3nLLo2zYeO0iGgNk+fx5QH
 HzcE0QlE9CKR8u9f9gT8h4VdckeRWcoHqc+DgU9RhnigtL/B6grl2cGzt4kpYGYm0Jll
 iByIbuGjOAW+cX2lXgGXe8WTZoR+KWfvaKleRK8VydxByfSRC0BCkOHYrxrjm91i7PP/
 8Xnw==
X-Gm-Message-State: AOAM530jfetObetQGHSUQg2UVSXQgLS1Mh+SmfXCkdVUJ2CK0EHexlsw
 r/02+QGw27KrPV6O9EnSo3icfbQHGtfMKA==
X-Google-Smtp-Source: ABdhPJzGyvEJUDTtrda6ED2MBBjaC8NQ2SrHAfF7sgWTkaNXDQsTd4vBTc1j4O8SwQLplrKhwvnswQ==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr7220530wrr.388.1621345901142; 
 Tue, 18 May 2021 06:51:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm12000973wrl.92.2021.05.18.06.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 06:51:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 581631FF7E;
 Tue, 18 May 2021 14:51:38 +0100 (BST)
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-2-pbonzini@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] cirrus-ci: test installation
Date: Tue, 18 May 2021 14:50:58 +0100
In-reply-to: <20210518084139.97957-2-pbonzini@redhat.com>
Message-ID: <87wnrwcfpx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Entitlements are applied via an install script that runs at installation
> time.  Test it in CI.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  .cirrus.yml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f4bf49b704..340fd395c0 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -37,6 +37,7 @@ macos_task:
>      - gmake check-qapi-schema V=3D1
>      - gmake check-softfloat V=3D1
>      - gmake check-qtest-x86_64 V=3D1
> +    - gmake install DESTDIR=3D$PWD/destdir
>=20=20
>  macos_xcode_task:
>    osx_instance:
> @@ -47,7 +48,7 @@ macos_xcode_task:
>    script:
>      - mkdir build
>      - cd build
> -    - ../configure --extra-cflags=3D'-Wno-error=3Ddeprecated-declaration=
s' --enable-modules
> +    - ../configure --extra-cflags=3D'-Wno-error=3Ddeprecated-declaration=
s' --enable-modules --disable-strip

So what's the --disable-strip about? Surely we don't rely on the
installer packaging to do that for us?

>                     --enable-werror --cc=3Dclang || { cat config.log meso=
n-logs/meson-log.txt; exit 1; }
>      - gmake -j$(sysctl -n hw.ncpu)
>      - gmake check-unit V=3D1
> @@ -55,6 +56,7 @@ macos_xcode_task:
>      - gmake check-qapi-schema V=3D1
>      - gmake check-softfloat V=3D1
>      - gmake check-qtest-x86_64 V=3D1
> +    - gmake install DESTDIR=3D$PWD/destdir
>=20=20
>  windows_msys2_task:
>    timeout_in: 90m


--=20
Alex Benn=C3=A9e

