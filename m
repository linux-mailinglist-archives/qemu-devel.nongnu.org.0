Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050F4316A1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:56:56 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQK4-0001cb-R1
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQHw-0007xO-NO
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:54:40 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQHu-0007fL-Tz
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:54:40 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so1088488wmq.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TJ9sPNAki0S2W5FFbs3Kn3ZOhnGbm42G8gPx+l27Ezw=;
 b=Q/Js0zWVSjvSxzlSBH2br3lzqdjqIRWrVFQ7uLpOcsakGIkiNHBfFbIelcwXWEhKdj
 G9zZGDuTsB6mxcUWvSY6XkCMc09g0uGQh104KBmvvzfixHSqElrKcN+hLdc/HwB9d+CL
 pA0FxdOEB3sJSauSDGEWvo9AroDA40kujCT4T1YVdEZmmJEXyvUpQ8XUme+XGhz4xc+O
 ihdc/9Wd8Z3F1v1/DsMEXrOG05Fo351ZLHGeJt9iPwuPaoVDu0pqjsLmBscjvM6zwKva
 LyejkqTqvZzHNGNfhY+PPnBCwV7aYxpO2MNiXNrnf4BGqsc91nV6enEB+i3gCs/BTOuJ
 t75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TJ9sPNAki0S2W5FFbs3Kn3ZOhnGbm42G8gPx+l27Ezw=;
 b=p55LsJ/LQWJMbSg5AEdb+t9BcomXSLKeR1WYsyxjmiFvJWvrKfFaVSlDVmyeFsfwKd
 yvny6r5iOpp1L1nkjlcBvaVB6JcfRw0PFnkorRn9mgHW0ho+7C41aTxeVax+mVJQqrbU
 9RzyWbOifu1MQLYFxdRpG1rajosMuHfUGmClXzRD+YMEzfyI6BswalLxXLc2ayWYIy+h
 ewZSZy5jj3jPCUP4rm5yW5XuBp/V+l160jSJoZ/XC7o1HTvHgtlGy2dQhgW5L5pjBeEp
 /3jO8MXOr9SnttMBcVGxIXS3tuZFl3rE+jBDcZ6VO1TBOdTKzh7yK04Gq6Jy1B/yupd/
 Krhg==
X-Gm-Message-State: AOAM532EFvjWXgEuZBQDylMq6VECiHlt43yV0ehXqenZ7QM2LZX4bC0X
 +XNHwLTgC191r/ADBgdR3nGn5Q==
X-Google-Smtp-Source: ABdhPJyduuSdS8DZJdPdHqOhhNFwPJ6Ja9s8lzVdYeQfHCwijmrU6pR8EZZ4PLxQeJXmiHAiocoDzQ==
X-Received: by 2002:a05:600c:2303:: with SMTP id
 3mr43761422wmo.123.1634554475697; 
 Mon, 18 Oct 2021 03:54:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm11973151wrq.69.2021.10.18.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:54:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84B201FF96;
 Mon, 18 Oct 2021 11:54:33 +0100 (BST)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/7] tests/docker: Use apt build-dep in debian10
Date: Mon, 18 Oct 2021 11:53:20 +0100
In-reply-to: <20211014224435.2539547-2-richard.henderson@linaro.org>
Message-ID: <87ilxu1u3a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

> Replace the complex apt-get subshell with apt build-dep.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/docker/dockerfiles/debian10.docker | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dock=
erfiles/debian10.docker
> index b414af1b9f..d3bbb90c64 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -14,7 +14,8 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /=
" >> /etc/apt/sources.lis
>=20=20
>  # Install common build utilities
>  RUN apt update && \
> -    DEBIAN_FRONTEND=3Dnoninteractive apt install -yy eatmydata && \
> +    DEBIAN_FRONTEND=3Dnoninteractive \
> +    apt install -yy eatmydata && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt install -y --no-install-recommends \
>          bc \
> @@ -33,5 +34,7 @@ RUN apt update && \
>          psmisc \
>          python3 \
>          python3-sphinx \
> -        python3-sphinx-rtd-theme \
> -        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[=
all]' | cut -d\  -f2)
> +        python3-sphinx-rtd-theme
> +
> +RUN DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> +    apt build-dep -yy qemu

I'd rather preserve the --arch-only while moving it. Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

