Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A64B37C3C1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:25:37 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqjw-0003P3-JK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqiw-0001yT-Jm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:24:34 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqiu-00041L-Uu
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:24:34 -0400
Received: by mail-ed1-x534.google.com with SMTP id bf4so27553217edb.11
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nGLchLqBy6yHQU2LDAscJHZXvGXltmDFsFu+Tjj2s+Y=;
 b=dn4PID25Cpg6ewI2cfcT3S6r5+VkH9bQeVpfCMMKR1Ead9Vu4mi8dm++Hb1/b41Cj3
 U1OPjcSXwyhaxzVww6hB/TndI2nhk+FG+nJMyU9yDmJ9/saV6WD3VE3d7cSQXCqyHcTG
 M+MBmm44BIxJiyvhELrLc2pVfxu47Dn9dKUnFlHPU1pJ0l9CHSj5UKQLOmHKCkJMuLZk
 eGbn1dl4A+iWcybwNC5aaOfU/6mgKHAEN0j2sqhNrwnDhKXrptfrOsRoI4aa7PBN7U3n
 Q3ojcpwjd3/au4phwvOKBKFq33CG1RIDO30xOaH7WiULPxVZL0IZZJuuSdWbC+W87W/W
 hViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGLchLqBy6yHQU2LDAscJHZXvGXltmDFsFu+Tjj2s+Y=;
 b=NbqdTxwqYj0Kpm5aSbnbpXuqGbebVXK8GkRXBBcVriyL6DFNvViVyqj6JaCuP9ofD6
 VhCRVyhyze00TON9nslRE2qPtHVogeB4HbVkWI4Cp1jsh6bMY7n5XILPDoGU9KRB6tiv
 u7rgLLTFcb7L6i1qwJd4lTwmTIIRz3GUhWyZNEijY2pxaIRwD2qjUTHTx8IP5rRGAZWw
 0YYshiXV1Qlt010ZA5kvVNiJqzIiw+rXXB0TG/KYj6A9/V1/udu9LviD7BdIznoMGgS3
 YlZhx3sh5Bfe2WAOUxwDqb2R0K22E0XjfGxO226KD1C34C9p3vyzi6siClAvy4RayMmU
 fGLw==
X-Gm-Message-State: AOAM533dm1gujGgKA4vjydbQvesQW4dbYrAG8Z+YcIRX7LTCAolEXycj
 BEMcVGxDKLqE+ZBrbo9/JlcGZR+o5uRy5JdXiOMGmND3724=
X-Google-Smtp-Source: ABdhPJwS57jXViqfxHrWfLbM2ZR17QOLgbLmeMjq2iPnpOx6liAwW7cnyc2DwWvrHMJanc0SL+8TUsLtttEPxmLSps4=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr44146976edv.204.1620833071492; 
 Wed, 12 May 2021 08:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-39-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:23:17 +0100
Message-ID: <CAFEAcA9fwtJsQJcQQMF2VBVBWJDJgLCU1Eaq13-8PVSsTy4tUg@mail.gmail.com>
Subject: Re: [PATCH v6 38/82] target/arm: Implement SVE2 ADDHNB, ADDHNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 572d41a26c..2dead1f056 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2112,6 +2112,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
>  #undef DO_SHRNB
>  #undef DO_SHRNT
>
> +#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
> +{                                                                           \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
> +        TYPEW nn = *(TYPEW *)(vn + i);                                      \
> +        TYPEW mm = *(TYPEW *)(vm + i);                                      \
> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
> +    }                                                                       \
> +}

Doesn't this need H macros like the 'T' version ?

> +
> +#define DO_BINOPNT(NAME, TYPEW, TYPEN, SHIFT, HW, HN, OP)                   \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
> +{                                                                           \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
> +        TYPEW nn = *(TYPEW *)(vn + HW(i));                                  \
> +        TYPEW mm = *(TYPEW *)(vm + HW(i));                                  \
> +        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, mm, SHIFT);         \
> +    }                                                                       \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

