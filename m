Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E9387930
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:52:24 +0200 (CEST)
Received: from localhost ([::1]:52194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizCx-0002Ij-I4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liyzG-0001Lz-G7
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:38:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liyzC-00033n-AC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:38:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id o5so1940945edc.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3QOdQlWILkWnh99ps41PWVh/oeVlYiHxOpHjkNGMl3E=;
 b=zRXer3Tjdk6PWQlmzzXkkTWlTu0bQ6n5McsKKxDwqDXiexXxivWYwn4C8wezrEwwUS
 2Z7RsbyN2boom9q/NbMStI3eLZ73NA44t8VRor1S1DwOy0Y/z1SHcZCeY482A4PS7sPq
 peYrklJHARHCn6nyOYCI4NG8q4W6ovFljypInfzS36bKpZzrR8dPYUEHCkY7fjwoldBv
 K8SoPToAIL+mI//2wMG4gtGrcfe7a8xQZbOV+Na6tsKCe785Ct6jAgwep5g0QTDZHtcs
 mct1jqgW3ElaGrpgRNsfFc6Hv5/pcGaqGUF6BLJ6y+Lf7Lp23lESPlVZSINVYdddVcwv
 TOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3QOdQlWILkWnh99ps41PWVh/oeVlYiHxOpHjkNGMl3E=;
 b=B6JPBtY6cimIp+UMnyB3tPuR36qUMLQXqr5473uOWXEsjw2CcNFN5A7NkRL5o05jlB
 yp226LcY/voGdxT0t4v5yJGphkcWlNlpQux0geouUCaVqgwOGjUzZ/LqQRIZAb6NZbLs
 cZj0FeMO4qUVrYeswaPeXOkyAcoJlB5m5d9QeV8CshkfHjo9A7fi4/Eo8XI1ceC4DqPu
 8v9Uz8Gm9KlKqMEziAvriBWZogo6M/gNi2UQIOdPcu48X1bR+rWmI1vxLWjHaVdEjJ4B
 3HoW5fZWVUBD4KQbbke4kD81im9QaJyKdwOWwFj66cLmAur6B+WaVQg3srdI/y6lP6TG
 3saw==
X-Gm-Message-State: AOAM532TG1JXGtTvPotDGDTj3LbMHE+UaH5erZsIfdu3/5/aIl1BbIsW
 HwDAAGmYXJe4SmjUim8tVesQGpHtMuo+pQDp+X584w==
X-Google-Smtp-Source: ABdhPJzCp0ZFlF7UMkMZxHKSL8hJZxAzeGA8sC6RQJ7zMaOYjqXZi8JUY0a2rkwWxMZaIRLTVGmaoVsYwLbh24fg5Q8=
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr6778797edd.146.1621341488247; 
 Tue, 18 May 2021 05:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-9-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:37:51 +0100
Message-ID: <CAFEAcA_T9f47uZSEt9BRsThxLsvauTPMiDSNM8B5=Dk5xRQ+wg@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] target/arm: Implement bfloat16 matrix multiply
 accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMMLA for both AArch64 AdvSIMD and SVE,
> and VMMLA.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
> +{
> +    intptr_t s, opr_sz = simd_oprsz(desc);
> +    float32 *d = vd, *a = va;
> +    uint32_t *n = vn, *m = vm;
> +
> +    for (s = 0; s < opr_sz / 4; s += 4) {
> +        float32 sum00, sum01, sum10, sum11;
> +
> +        /*
> +         * Process the entire segment at once, writing back the
> +         * results only after we've consumed all of the inputs.
> +         *
> +         * Key to indicies by column:

"indices"

> +         *               i   j           i   k             j   k
> +         */
> +        sum00 = a[s + H4(0 + 0)];
> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)]);
> +        sum00 = bfdotadd(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)]);

I can't make these indices match up with the arm arm pseudocode ones,
which index by "4*i + 2*k + 0" and "4*i + 2*k + 1", not "2*i + k";
are we hiding a division by 2 somewhere?

> +
> +        sum01 = a[s + H4(0 + 1)];
> +        sum01 = bfdotadd(sum01, n[s + H4(0 + 0)], m[s + H4(2 + 0)]);
> +        sum01 = bfdotadd(sum01, n[s + H4(0 + 1)], m[s + H4(2 + 1)]);
> +
> +        sum10 = a[s + H4(2 + 0)];
> +        sum10 = bfdotadd(sum10, n[s + H4(2 + 0)], m[s + H4(0 + 0)]);
> +        sum10 = bfdotadd(sum10, n[s + H4(2 + 1)], m[s + H4(0 + 1)]);
> +
> +        sum11 = a[s + H4(2 + 1)];
> +        sum11 = bfdotadd(sum11, n[s + H4(2 + 0)], m[s + H4(2 + 0)]);
> +        sum11 = bfdotadd(sum11, n[s + H4(2 + 1)], m[s + H4(2 + 1)]);
> +
> +        d[s + H4(0 + 0)] = sum00;
> +        d[s + H4(0 + 1)] = sum01;
> +        d[s + H4(2 + 0)] = sum10;
> +        d[s + H4(2 + 1)] = sum11;
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

