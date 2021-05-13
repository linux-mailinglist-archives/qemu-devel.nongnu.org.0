Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4337F81C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:46:17 +0200 (CEST)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAjH-0003JP-BH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAfr-00011r-RH
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:42:47 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAfn-0005Hl-BJ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:42:43 -0400
Received: by mail-ed1-x533.google.com with SMTP id g14so30831797edy.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EomQNbVtlc8M5NkNZlu+i3CqWnYgcN9RPDZo+xVNp8g=;
 b=R4T8N4sZhjAZUWeXNriqSW0cyc4cz7Q5rO38UZ5bpuSHJTQs2EKte6MMvX0bziqHnL
 zuM+hOl4Vc5RYO3Wzu/D66Xp/4ZbFJ9J+2tdY/VBPJKC1wVqpd/AsgUsYEoaVy1PxQyj
 IVlZmez90ZvxubxpeumGGLoEoruw1asnBeO+dSBb8vP1OTEqrtgyczFgY0OXlzIQSC7Z
 xA5bpUdSQZpBQEB33BpHDXbObsB+HTT56hBgplR1LmWWFJ0/IkfJiPROCf6ZbpLHYQuP
 FGGa0Dcqo8/iz9hNI88F3ilATcebBe158oWT4lCDF6ZSfbj6tK+nOMqBf6RU+tP9oBmz
 bHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EomQNbVtlc8M5NkNZlu+i3CqWnYgcN9RPDZo+xVNp8g=;
 b=La609eA2nIXeLJYqNVe00esIpEMy/tupU+fjO2IXhCfSAWcm+vBKjBT1FBlKmWfJJT
 oE2WvTz2PojnBL6xZ1HDteLszZEPIl+tuzp23T8GsdlHIvHnts8o0M4Js8MZK8Xo7CtO
 a4IcN1h8ak8xJWk0IiZ/4dFkPnSRamZVFGM3epAcGmcNbyzDsfu+5ZRXOvz6iSh592/k
 kyQSutwKtDKgAt9SQuwlctewkvb1NCZyMo54RZdDzTS4HN3l+ZO3cb/4inyiYuGMGDZV
 i+v5ApIfsmlw0KovrrSLHMyj6E88xbNBHwxN4kbqN7xV8OBFy1IuKsTPN8JbJI7S1VJB
 egBQ==
X-Gm-Message-State: AOAM531UaBMUqywAbP2VTYHSHRwkPOvPqASGbY4nT27K6AULnN2bmxVg
 qza172grsKFqnxy0QaZm0t7c9SsCfVKcg0iE8nbUeQ==
X-Google-Smtp-Source: ABdhPJwVmi72mQW4+KR6fMWwjdjnDlnBL2lo2CBgT2aKrustFpmk1iqkxzTPATFd1NYuS5nH1EZtDCj1AmoZ9bageZc=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr49600260edx.52.1620909757395; 
 Thu, 13 May 2021 05:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-56-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:42:26 +0100
Message-ID: <CAFEAcA8SrNTpUCzJtx0ejEjFcURk43BJ+8Sa3XvqNSAuQCPjLw@mail.gmail.com>
Subject: Re: [PATCH v6 55/82] target/arm: Implement SVE2 saturating
 multiply-add (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Fri, 30 Apr 2021 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  9 +++++++++
>  target/arm/sve.decode      | 18 ++++++++++++++++++
>  target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
>  4 files changed, 81 insertions(+), 8 deletions(-)
>
> +#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
> +{                                                                         \
> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
> +    for (i = 0; i < oprsz; i += 16) {                                     \
> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \

Doesn't this need an H macro ?

> +        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
> +            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
> +            TYPEW aa = *(TYPEW *)(va + HW(i + j));                        \
> +            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm, aa);                  \
> +        }                                                                 \
> +    }                                                                     \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

