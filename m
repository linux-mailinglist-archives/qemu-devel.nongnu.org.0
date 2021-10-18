Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6284316A2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:57:03 +0200 (CEST)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQKE-0001tM-MC
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQI7-0008AH-3O
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:54:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQI5-0007pX-Ki
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:54:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so9917550wma.4
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OZsGVT1j+NeEZZ+Ri8RrsESU7Rj39FIh5ZpWsnDJck4=;
 b=QGgN2OzGUw8V/byhZcJ+rswzuSXoFUgntJZuhb1lIJ1NpiwXyHYa+FkdZ6V79AApN/
 ynEIs7/672DfFdsg+tIvCfG9Cn3fpkAirSfHu8/pwwVknVGfW/nF9blQBGauTd0Ofqfu
 QpnWxIFGUYhBqlhfLIm+yPurvB9Tq+xsHA/Q6cK6aQ6GBYH+Zx+WIM4XOIGTH0MavxB8
 BYvbF+7BFlgEfEk5HHzRWU4qJlpoTlcbQYHIu2kvBvGM1thTHofJsOACJMPb2K4l+ok4
 FLtnOenTI8Hemz9NwhcXHNDDBWJ4d6SrPJmoil3VigIvHwM9XapYioUtxaroKhqUXHe7
 A0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OZsGVT1j+NeEZZ+Ri8RrsESU7Rj39FIh5ZpWsnDJck4=;
 b=YsjXykyAI7CjgQEclbWv8e9YzwqO9b/zr2vp451cn9slUjaqkPGFOgG0WQn8EylLIB
 nG7QOZQdTRgxLcziA3M69TYAiau9JWV20eJ6PCre/aA/gb/tKLkKB8RQ7Nsabsai6Ils
 I/2RZfe7iD3TzA4z2DYmOW4cCdRitMcLGlGcEb7hXOpJHbDEiPINP4TNUtKZGNiPlA/W
 U25BdsYXgdAJDpQQ8J6tfNtHdXsjNyrzNbTKXZG06XiJhKMpbyoI5qfa5H7enC5TUwKe
 Vjifa08TGbMqCRL1dNV0vMoY3nTjF0CXsvWoQhvIZxe+/2rv79Yds7xeDh63Pc2uNaAT
 FFnA==
X-Gm-Message-State: AOAM530kdSG8hzQE+pgp3zH9nZaQmXiX9EiuTtE1aHB6mFrFnzPfj6eh
 QysUg7qGB+ujUaLQV4JUvlb0ow==
X-Google-Smtp-Source: ABdhPJymRadv1rrhnodv36speJrB2d9BWzhzDLqS4vCNLAyC/jCU22SgLFjAqQH5Hpixh97XCT8taQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr29437314wmp.52.1634554488239; 
 Mon, 18 Oct 2021 03:54:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm12403814wms.16.2021.10.18.03.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:54:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9564F1FF96;
 Mon, 18 Oct 2021 11:54:46 +0100 (BST)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Date: Mon, 18 Oct 2021 11:54:42 +0100
In-reply-to: <20211014224435.2539547-3-richard.henderson@linaro.org>
Message-ID: <87ee8i1u2x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> The base debian10 image contains enough to build qemu;
> we do not need to repeat that within the new image.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/test=
s/docker/dockerfiles/debian-all-test-cross.docker
> index dedcea58b4..b185b7c15a 100644
> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> @@ -8,11 +8,6 @@
>  #
>  FROM qemu/debian10
>=20=20
> -# What we need to build QEMU itself
> -RUN apt update && \
> -    DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> -    apt build-dep -yy qemu
> -
>  # Add the foreign architecture we want and install dependencies
>  RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>          apt install -y --no-install-recommends \

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

