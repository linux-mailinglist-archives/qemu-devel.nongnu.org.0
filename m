Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EC2FBD54
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:18:27 +0100 (CET)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ue9-0005nd-TG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uQY-0001yB-9O
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:04:22 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uQK-0003WV-TZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:04:21 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so29490311ejf.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nYcrjI7Zodna8WKQcC7mBl2yfQhUtgvneKR3bEJRrCY=;
 b=tL158EHd5uPPZVDUf//PyoQwapEB3TME6Ea+mtUE6slXW735PNjSpuYd7AFeMtWpqx
 SB1BlSx8Tl1o6mSR5ZBN5J0O+RqvGUf2gHSDjgxznuH/20KhZHkZ5EOOvS8HtrEhgkd1
 YRG71bw5E5aUejf8q0S846a8g4iqyEIZu22u92/phWX3i8ByAgwqocqD3WzXEntxPx4q
 41beMzR+r4/uo0z/IaXrSNvhOm/8Mhex7i8qXRNz+cschU676CU3u0yCtaDAOXYeNJG1
 TTDSivK2EBMqPBFXLAE55k90VWt9Lpa1+VulguzqRzda12wl42q1Nz5OFbIYttDsqPWh
 EYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYcrjI7Zodna8WKQcC7mBl2yfQhUtgvneKR3bEJRrCY=;
 b=owCJUTnfEwc56pKwiNvsAnGv7YTl9LpZ8iele02OOgUIgrwmyPjeQpUUsbmhYc1+mY
 tdL4EKmgH3DOhPaJkPlo9AJMm8VsFVbMByv6Apcp1g7glJIwwlFysuQFknzWu3QYpI9E
 9PN5uYW+soiyG5zFGxO3mB11Mh7ilhleMxBucFZvvUgbLe4638mw3PPOicpqzYRyBDbk
 XKTqPWBlTGVs8velMCE/+MyzrLEq6Hfo4khvN9RfUkG6MzN4Tg/QQQlhA59AO4wP7Inp
 R6drYOwdzUObEJf2BcMHMyIL4xsmOWrXTbze52qCkUC6wMPqoX979v1AUu9FS7rerQuN
 3Hmw==
X-Gm-Message-State: AOAM532lWRVvPk650AR1sJuGjkQN8EodYsTqX3+99oAGuI+8Xm8v5YFp
 zgW2t8Rym3tXBOr4mmx1inTTItIjElfGLJQSDaLv7g==
X-Google-Smtp-Source: ABdhPJw7FDKs57GkcqV8Vq/S7hNre57Of9edLDCowAFXW+4p/7VVGuux9bi1ngDfMZbL2ndhwgKAQgOMJoN83kOJi+w=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3702048ejd.250.1611075844753; 
 Tue, 19 Jan 2021 09:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-11-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:03:53 +0000
Message-ID: <CAFEAcA_O6FMNCLZ=rzEkehbrnwmyF3X_qgFYSNobi=EqKL5-WQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/21] linux-user: Fix guest_addr_valid vs reserved_va
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
> use -R <reserved_va> to restrict the memory address of the guest.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 4e6ef3d542..e62f4fba00 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
>  /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
>  #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
>
> -#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
> -#define guest_addr_valid(x) (1)
> -#else
> -#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
> -#endif
> +static inline bool guest_addr_valid(abi_ulong x)
> +{
> +    return x <= GUEST_ADDR_MAX;
> +}

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Looking back at patch 9 -- if we always check against
GUEST_ADDR_MAX here, should we also do that for h2g_valid(),
or are the two uses different ?
(The v2->v3 changes list for patch 9 suggests we may have
had this discussion previously, but I forget the details...)

thanks
-- PMM

