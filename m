Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4C37A85A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:01:28 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSwv-0004V5-O9
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSuc-0001cq-18
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:59:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSua-00035S-Br
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:59:01 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so767077wmk.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XYzP2aO4QI6U5lSf/B43gl6fUfOWfsRfBE6fn4MnwY8=;
 b=HeOTBt0ASGj3cAf4IkpMQd6qWPGfIsNYg2qoPqBT/eD7nMQX5AJRNZITqf/Q1LOD7l
 GSJnp4u0gdNA92YiAf8+7FCbIkjNJvaZhhMWxe4SSgzlG2G2eifPevUxAKULJ/oYyfM8
 hO7YIVyQBm8j1/ZQ30lBRCwKAFnvoURz26zh2ICiFiCxE3wVAh15jqHh1XDjLtPqqPjr
 4v377eiF5vmKg/kc+Um/I9ITELB9s0wBsx52qlrrEaNnInG5x+r9qfcObyC20Paa+kXz
 XEVmoFLguhd/QRGoEt8c/Ed3KjrI+50Yi7G52INPJyISm2KbcIWeIOfVhC2pD13kjkOu
 3bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XYzP2aO4QI6U5lSf/B43gl6fUfOWfsRfBE6fn4MnwY8=;
 b=TUpPSTDhCwKSI4e71n++r5j0brPMq4r8jsBJzzfoRGe2hyhu4EPrFvkvjWfhtT9Ani
 7BMLi/EBXzT6/MzxLaG3vhUTCseyjC7hzAeQNlau5lcBwxDB/y/Xn6vJQVguvAl6mQJg
 tnlnFjFbuiY9KYObYwhJp5M1DLzW2pMMfbI7UDflxEGX0J2DVX4X9Q1Lwsi5xVzZ7vUI
 0CqrEjwOcK817/Q5cj3s5QuJNxhDqGnP18IAWJ2mvMq/0z4D2lNalFtEMHoGEmugkKkN
 bRJarbd40C5G9xp42R7jK0Tv2eqJiSI69H9guW7VKx+jER4+6fELYYqKC/KbzBXECtW9
 QuSg==
X-Gm-Message-State: AOAM530MWg7HifjlV9Bhr60SutxaQaDa1bIphLcpAU8lYKcA2+Nb5aZ7
 xy9OUvmMS0cptZLmJ4mEE6AcuA==
X-Google-Smtp-Source: ABdhPJz/DwhK5EvoujqgyT7r1UTvjRb0WxNd14F6cidwTj+OilOuxYoGVSZoKNhdGdO85ZjLIt2Xzg==
X-Received: by 2002:a1c:255:: with SMTP id 82mr5709370wmc.74.1620741533856;
 Tue, 11 May 2021 06:58:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g19sm22882054wme.48.2021.05.11.06.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 06:58:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EE411FF7E;
 Tue, 11 May 2021 14:58:52 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-26-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 25/72] softfloat: Rearrange FloatParts64
Date: Tue, 11 May 2021 14:57:55 +0100
In-reply-to: <20210508014802.892561-26-richard.henderson@linaro.org>
Message-ID: <87a6p1gyn7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

> Shuffle the fraction to the end, otherwise sort by size.
> Add frac_hi and frac_lo members to alias frac.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 2123453d40..2d6f61ee7a 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -511,10 +511,19 @@ static inline __attribute__((unused)) bool is_qnan(=
FloatClass c)
>   */
>=20=20
>  typedef struct {
> -    uint64_t frac;
> -    int32_t  exp;
>      FloatClass cls;
>      bool sign;
> +    int32_t exp;
> +    union {
> +        /* Routines that know the structure may reference the singular n=
ame. */
> +        uint64_t frac;
> +        /*
> +         * Routines expanded with multiple structures reference "hi" and=
 "lo".
> +         * In this structure, the one word is both highest and lowest.
> +         */
> +        uint64_t frac_hi;
> +        uint64_t frac_lo;

This confuses me. Is this because it could be frac_hi or frac_lo at the
"top" of the structure because of endian issues?

> +    };
>  } FloatParts64;
>=20=20
>  #define DECOMPOSED_BINARY_POINT    63


--=20
Alex Benn=C3=A9e

