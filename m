Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A0F399D9E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:21:28 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojXb-0000qe-LQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojWb-0008Cg-72
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:20:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojWZ-0003eR-0z
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:20:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n4so5101819wrw.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mxt8a59i8ZsXxGP28jsWPZtp0eQypdlI3Fy3jtdixyA=;
 b=bRq331OSNoKid9Mnbg+ydb/1KyL6EKoe6lbE2+J+zE9D6sjTA1GJFD70//OmWJC9gm
 oKxeQJBgpUPpdCGSeSTOLaKfVy5q8BNdoytfRSkLERE/p0iCYmbN/8RtGuI6/+NPq8mP
 Ygn/USrr13q+Isv90ZkgsWzFk7qtNAtVCplROgSm6IPnLe0Ar4+L5Uxr4TpsR2IsyWf9
 w/s/BVlWLyQxc9i8uaqAsklLlGVVWrX5Z7f9C8pyIYltk/gk4MVs0lmkhfRSxzB5hW/e
 WMFw4C2w0mt2s9LyhydbOC+vhA07ahFFWQvWTg9/unKN4XXvwE4Q4eEPG809q+2JS3qn
 Tpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mxt8a59i8ZsXxGP28jsWPZtp0eQypdlI3Fy3jtdixyA=;
 b=kyExvNvuCQezl5jXCd/WZFzgD2u5nLeR9CUHV8YMKQcZzGJVew/+ISc51FI4q9vdx6
 05mxBRylQoB397B+WTWnPsKI5Dzi6Za+ljWi+f1Z+6tu6WLNSEvVze/0DV/L9hKz+Nlq
 qNhMxLuHCDE9mMb5Xs+sexdl0mOJGeq9m5b3tga6tnsZiUZDSfdN9BfFLA7uOox75ADx
 INNvO9rfuO+CZFA0Ap3iUYkd0xnIeUL9xNwHiyhj9YfYWqc2DDyK9F+ZSRWN3Xm0oCQq
 jkjTUmxe+b6PmheUYhW0sep1W7v7q1htSNzdw+GaieNpDStJO0w0+leDplGFpWoCKvl5
 yNrQ==
X-Gm-Message-State: AOAM531ANsDpG3GjdP3x0BKjznQxx8A9S1qiNeI7gSJ/uikWGbJEIC/d
 hHyXw+OZmS99aNk9KR78z4g0LQ==
X-Google-Smtp-Source: ABdhPJz6m2AYWitVAUs+3G5YsXSUdFPfxIT4dmY50Qb6+eWJXgLPkdmojhaXdaSc6880PVBHyRTlzA==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr22868859wrq.111.1622712021123; 
 Thu, 03 Jun 2021 02:20:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm3333132wrf.45.2021.06.03.02.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:20:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F6A91FF7E;
 Thu,  3 Jun 2021 10:20:19 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/28] softfloat: Move sqrt_float to
 softfloat-parts.c.inc
Date: Thu, 03 Jun 2021 10:17:37 +0100
In-reply-to: <20210525150706.294968-8-richard.henderson@linaro.org>
Message-ID: <87o8cn9uek.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_sqrt.
> Reimplement float128_sqrt with FloatParts128.
>
> Reimplement with the inverse sqrt newton-raphson algorithm from musl.
> This is significantly faster than even the berkeley sqrt n-r algorithm,
> because it does not use division instructions, only multiplication.
>
> Ordinarily, changing algorithms at the same time as migrating code is
> a bad idea, but this is the only way I found that didn't break one of
> the routines at the same time.

I can't pretend to follow the details of the method as well as I could
the original but that's why we have tests so if they are happy I'm
happy:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

<snip>
> +
> +    if (N =3D=3D 64) {
> +        /* float64 or smaller */
> +
> +        r32 =3D ((uint64_t)r32 * u32) >> 31;
> +        /* |r*sqrt(m) - 1| < 0x1.7Bp-16 */
> +
> +        s32 =3D ((uint64_t)m32 * r32) >> 32;
> +        d32 =3D ((uint64_t)s32 * r32) >> 32;
> +        u32 =3D three32 - d32;
> +
> +        if (fmt->frac_size <=3D 23) {
> +            /* float32 or smaller */
> +
> +            s32 =3D ((uint64_t)s32 * u32) >> 32;  /* 3.29 */
> +            s32 =3D (s32 - 1) >> 6;               /* 9.23 */
> +            /* s < sqrt(m) < s + 0x1.08p-23 */
> +
> +            /* compute nearest rounded result to 2.23 bits */
> +            uint32_t d0 =3D (m32 << 16) - s32 * s32;
> +            uint32_t d1 =3D s32 - d0;
> +            uint32_t d2 =3D d1 + s32 + 1;
> +            s32 +=3D d1 >> 31;
> +            a->frac_hi =3D (uint64_t)s32 << (64 - 25);
> +
> +            /* increment or decrement for inexact */
> +            if (d2 !=3D 0) {
> +                a->frac_hi +=3D ((int32_t)(d1 ^ d2) < 0 ? -1 : 1);
> +            }
> +            goto done;
> +        }
> +
> +        /* float64 */
> +
> +        r64 =3D (uint64_t)r32 * u32 * 2;
> +        /* |r*sqrt(m) - 1| < 0x1.37-p29; convert to 64-bit arithmetic */
> +        mul64To128(m64, r64, &s64, &discard);
> +        mul64To128(s64, r64, &d64, &discard);
> +        u64 =3D three64 - d64;
> +
> +        mul64To128(s64, u64, &s64, &discard);  /* 3.61 */
> +        s64 =3D (s64 - 2) >> 9;                  /* 12.52 */
> +
> +        /* Compute nearest rounded result */
> +        uint64_t d0 =3D (m64 << 42) - s64 * s64;
> +        uint64_t d1 =3D s64 - d0;
> +        uint64_t d2 =3D d1 + s64 + 1;
> +        s64 +=3D d1 >> 63;
> +        a->frac_hi =3D s64 << (64 - 54);
> +
> +        /* increment or decrement for inexact */
> +        if (d2 !=3D 0) {
> +            a->frac_hi +=3D ((int64_t)(d1 ^ d2) < 0 ? -1 : 1);
> +        }
> +        goto done;
> +    }

I usually take more convincing about gotos but I can't see a way of
doing it more neatly so have a:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

as well :-)

--=20
Alex Benn=C3=A9e

