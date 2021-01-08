Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6280C2EF3D2
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 15:17:14 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxsZi-0003X7-UO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 09:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsYD-0002u5-Io
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:15:37 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsYA-0007w4-3Q
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:15:36 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so14594812ejf.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PC4MWs3iyKPd4utj/FSXQHOmAjGulN6flg4XLteTLLo=;
 b=FHuFjJr+BwzpJITJIrGrGxI8BY2S4IfQl7xq1BJmwjTTnBRN/xAyhrfVTv3uQw80II
 FtC/eFPQvw/yvHw0LeMNcSi0vS35y5R2rg5Oq6WVyIL0DNfpgY8FyN3fy4xzg4wuBGeI
 bEkiGQIipLvjr5yPE9aB1m4rTHGPPo6oPSTN7b/3Ln96xP6sxG7LY92O2dnaYUBHgi7a
 83HGexGi/hmmgWewFXVOvDp+1/VUcmcDtYRKEGWr7+Q7UhMBfKMzuDFKAalCkHkqxboW
 grrBK8yfSWp9G/iarLmGwwo33SKacIDep9M6FNepQ/BUzTXceTzLHSlkNlViwe877cn6
 mOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PC4MWs3iyKPd4utj/FSXQHOmAjGulN6flg4XLteTLLo=;
 b=rPlJ+YP7G0qloFi4k80C03VEfoSCfara4tvEI1mlzMbIFKFJk+8sybhaMRRSURjY1L
 +t2L130Xk0irQfQVxQ9/PSDaJZjCgZDGae0DLOqJoYUkv6EyZJQnhPBbIyGGj4fqnwFR
 eX/gSKrIDPX7uobqWqJ0UU0xA+jMeFyRb9INibkUIp5jG79NhHulYpjS7H13TPCKlf8j
 su8enD9Nxh4mj+74XB9lJvwvHK7WzofxKtxYBv8LvbLhpQIHJmwg/h3IyNcmbr5Ktduz
 MPA44wQUGLKmukVfSHUWbujE9zCleWiZlPnZFbmFpdkvToB+ALxEwguAk2gvDXAA67HN
 4gbA==
X-Gm-Message-State: AOAM531VHPcluuUUpOq7fnd90uNg+IaQsJNlQXJaPBoNc9dnWy6OiZbR
 lyq4F81HxFsubkYrB6KpopSW/smvU9/5UQT4NPrQPQ==
X-Google-Smtp-Source: ABdhPJyFjorwfdYHSknCJq0vVyVPD5KLt+QKGwRcBN2YMgqNBR3Glkv5cZB/o9N3018/FNn0Y7es75SyjW62SnnHBic=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr2793914ejf.85.1610115331730; 
 Fri, 08 Jan 2021 06:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20201216221247.522686-1-richard.henderson@linaro.org>
 <20201216221247.522686-2-richard.henderson@linaro.org>
In-Reply-To: <20201216221247.522686-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:15:20 +0000
Message-ID: <CAFEAcA8zz2ApaqE7h7LEhPML2KZLysQ9i2e7msDB0nhdJKkDnw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/arm: Implement an IMPDEF pauth algorithm
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Without hardware acceleration, a cryptographically strong
> algorithm is too expensive for pauth_computepac.
>
> Even with hardware accel, we are not currently expecting
> to link the linux-user binaries to any crypto libraries,
> and doing so would generally make the --static build fail.
>
> So choose XXH64 as a reasonably quick and decent hash.
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Move the XXH64 bits to xxhash.h (ajb).
>     Create isar_feature_aa64_pauth_arch and fixup a comment
>     in isar_feature_aa64_pauth that no longer applies.
> ---

> +static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
> +                                        ARMPACKey key)
> +{
> +    /*
> +     * The XXH64 algorithmm, simplified for size 32.
> +     * See the description of the algorithm in xxhash.h.
> +     */
> +    uint64_t v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
> +    uint64_t v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
> +    uint64_t v3 = QEMU_XXHASH_SEED + 0;
> +    uint64_t v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
> +
> +    v1 = XXH64_round(v1, data);
> +    v2 = XXH64_round(v2, modifier);
> +    v3 = XXH64_round(v3, key.lo);
> +    v4 = XXH64_round(v4, key.hi);
> +
> +    return XXH64_avalanche(XXH64_mergerounds(v1, v2, v3, v4));

Since the only use of xxh64 we make is "feed in 4 64 bit inputs
and get a 64 bit result", why provide all the components and
stitch them together here rather than following the existing
pattern we have for qemu_xxhash* (the xxh32 algorithm) and
providing a function
 static inline uint64_t qemu_xxhash64_4(uint64_t a, uint64_t b,
                                        uint64_t c, uint64_t d)
in xxhash.h ?

thanks
-- PMM

