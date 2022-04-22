Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4450BBBE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:34:18 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvIX-0000F2-K1
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvHL-0007Xp-Oa
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:33:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhvHJ-0004Ri-Vq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:33:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id m14so11593906wrb.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jRwdlGlz0rmV9XAT+yEtDXq/3ORzoVIrDdydHfyCOd0=;
 b=RiH0XBi/y51FQ6+Fz027hrkD5oTDX2TnVBq8ST+p0667S/rwYhJVsnmbg8AYYobQt1
 dTUDRWYEW0MBxFs4xMqodE8vg9S+W9rk4lM4cwJq2EARglbiD+06LqMvj20X4+rvylXS
 ldC4JVt5+vfNCOIu9ODzIJpR+YYh/rQb41GwBW+alS6XRxOwjZp24S0HhCvoM5pnrre2
 3BfHB3X/nxKwuqJFequzeIq4NcliMz5vaYUZLHhCpwFgvb9+KGtWb1vdS/UvmIe+R8tP
 rbmbJjP3RpkWdoy6/mVHMUhXG1Z6a9g9kQ+u2U+gYKyfp6loxv8pDiVH+sqB5ZWuut5S
 FKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jRwdlGlz0rmV9XAT+yEtDXq/3ORzoVIrDdydHfyCOd0=;
 b=AamuXEBq8yTOMqotwYFBexrRx+8VR/moKl2S19fpemHwrJzExTbpimn8hcF7gAUKzf
 X7LNaQe+WC9DZSBKlJq7BaTccsMY6VkkfKnxkyQpYBZnYbHfDe4dqDwwdOYaN9SXX9cZ
 WOdNlZpWPJ+hPJcqNgaufRm2ONyHmHO/m2X8x6DQvk9BEJWYv+HGue/y9l7685ptEgcQ
 Iq8/O2mQxr6/YAclrSG1wSKP+2R0HU9fuWDK+gkoW7C8kOlLffpvt1wrhUzmhiHXeAsV
 hXfOfLVgZyGXB55l4FhcdAmID9b+rKF9oAk5AJEIZMcciAobfdq4kV/oY/qqQPxcuyGK
 jm1A==
X-Gm-Message-State: AOAM531QY0PIIJ2Q1roSfglIqdJQS13eGBOz2UxhxqmTwgfajIbE6yD8
 pAh5UzomIgS3hqXp9gqtIDMXnQ==
X-Google-Smtp-Source: ABdhPJwGhrf9uGAzIi2/JDLRlO0IJ4gNv8gg/gb79v/YNHU2ZKZwUr/MKqe4a7VoA9r2CMAXrEZg7Q==
X-Received: by 2002:a5d:5144:0:b0:207:9a13:ca73 with SMTP id
 u4-20020a5d5144000000b002079a13ca73mr4299119wrt.268.1650641579896; 
 Fri, 22 Apr 2022 08:32:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d6c6e000000b0020a9f757708sm2436715wrz.33.2022.04.22.08.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:32:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 35F891FFB7;
 Fri, 22 Apr 2022 16:32:58 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-26-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
Date: Fri, 22 Apr 2022 16:31:53 +0100
In-reply-to: <20220417174426.711829-26-richard.henderson@linaro.org>
Message-ID: <87o80tt9p1.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rearrange the values of the enumerators of CPAccessResult
> so that we may directly extract the target el. For the two
> special cases in access_check_cp_reg, use CPAccessResult.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h    | 26 ++++++++++++--------
>  target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
>  2 files changed, 44 insertions(+), 38 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 005aa2d3a5..700fcc1478 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -167,26 +167,32 @@ static inline bool cptype_valid(int cptype)
>  typedef enum CPAccessResult {
>      /* Access is permitted */
>      CP_ACCESS_OK =3D 0,
> +
> +    /*
> +     * Combined with one of the following, the low 2 bits indicate the
> +     * target exception level.  If 0, the exception is taken to the usual
> +     * target EL (EL1 or PL1 if in EL0, otherwise to the current EL).
> +     */
> +    CP_ACCESS_EL_MASK =3D 3,
> +
>      /*
>       * Access fails due to a configurable trap or enable which would
>       * result in a categorized exception syndrome giving information abo=
ut
>       * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
> -     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 =
or
> -     * PL1 if in EL0, otherwise to the current EL).
> +     * 0xc or 0x18).
>       */
> -    CP_ACCESS_TRAP =3D 1,
> +    CP_ACCESS_TRAP =3D (1 << 2),
> +    CP_ACCESS_TRAP_EL2 =3D CP_ACCESS_TRAP | 2,
> +    CP_ACCESS_TRAP_EL3 =3D CP_ACCESS_TRAP | 3,
> +
>      /*
>       * Access fails and results in an exception syndrome 0x0 ("uncategor=
ized").
>       * Note that this is not a catch-all case -- the set of cases which =
may
>       * result in this failure is specifically defined by the architectur=
e.
>       */
> -    CP_ACCESS_TRAP_UNCATEGORIZED =3D 2,
> -    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
> -    CP_ACCESS_TRAP_EL2 =3D 3,
> -    CP_ACCESS_TRAP_EL3 =3D 4,
> -    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 =
*/
> -    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 =3D 5,
> -    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 =3D 6,
> +    CP_ACCESS_TRAP_UNCATEGORIZED =3D (2 << 2),
> +    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 =3D CP_ACCESS_TRAP_UNCATEGORIZED | =
2,
> +    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 =3D CP_ACCESS_TRAP_UNCATEGORIZED | =
3,
>  } CPAccessResult;

This does feel like we are moving from an enum to a bunch of #defines
for bitfields. I guess we keep type checking though....

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

