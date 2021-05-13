Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F737F846
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:57:49 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAuS-0001zF-IT
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAj2-0004jx-VR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:46:00 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAj0-00071Q-BG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:46:00 -0400
Received: by mail-ed1-x532.google.com with SMTP id c22so30803981edn.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnAZ/nP9V5EdBdZL2ikFX+lherf5ZQMWDV1UogZdwlA=;
 b=N5Vbp3+oB6c0I71oAVyd56O1FLmXwT2wjugLon9FeuOYEly1bwNmKuhPY05qF2rDX/
 GQE6cJEpsI0ifuOeLrmtGB7HU8Gq8z3MShJkkOaKxYmgN1KCUIuNtnK6DJW885D5/hBZ
 55cH0yXy9mjkhayqMaDzV/dEWZcW3Lw7iq3kMIRzaQYaCfURNKXPL6nnixxbSF7SgaQD
 IA0Vj6vhAoYJnGOFrrAMp+Uv4fo8DsWsfWi2Jj5igadJM6OxtZm/gwtd5i41D6zfHxzb
 Tpk56ThFWk1W2F6mC63AXt9dcxNV4hRCMXt9ItS/uqKbWwGoX94FcQ9niBo09tfMDGn8
 peZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnAZ/nP9V5EdBdZL2ikFX+lherf5ZQMWDV1UogZdwlA=;
 b=O6XyWkl5lPezqae3ffOJf/KaZ1apu3puO9M2cuA4M+dUm8vyo8/3nGAPuaziOh9CfI
 pAxESLSz37EKFJLfJVB9ogtV618UfK+Rbiy38V2GZrP3ZWfx17JapNowCxYNVQaKPcHU
 gLjvPpOPdNXVUyla7ZDdNS7lbypNTUzD/b+02Edie0+h+JiNkXu+SeMYaKp4HReSGVwF
 NgS2vdzjh8oiDMLEPjFUhtwzKDtfJ3iECMmBrS6t5aQFe6GNyNg/l2sBZf8yB8Vt45ji
 UGR1lxsSeYhn84ux7pecOHNnjYEqKiEECTJjypyAeFAqD6RrAIdIeEGYlZBvS1ngD27N
 Am1w==
X-Gm-Message-State: AOAM530GwwXS/Zlm/AtbwEBNWci7fc4A+BWROdT3oJHfR/I2AYxpY52u
 xgsDp9auSbqPP+rkKRClSUecS620meXt3pziBpDA3Q==
X-Google-Smtp-Source: ABdhPJxvbyJ6QV3UyLwLybW3/VEybayc+G2B/4NxY8/7/JDS1poMqRoNqAvYHLksUFWLGGhjiWUKLmL1j7rZfpgZc9E=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr49520272edd.251.1620909956858; 
 Thu, 13 May 2021 05:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-57-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:45:45 +0100
Message-ID: <CAFEAcA8aXj7SVVA72oa9wPAMwoKHoCMrV8hC4b7zq26XMN8rag@mail.gmail.com>
Subject: Re: [PATCH v6 56/82] target/arm: Implement SVE2 saturating multiply
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Fri, 30 Apr 2021 at 22:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      | 12 ++++++++++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 19 +++++++++++++++----
>  4 files changed, 52 insertions(+), 4 deletions(-)
>

> +#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
> +{                                                                         \
> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
> +    for (i = 0; i < oprsz; i += 16) {                                     \
> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \

Again, not sure why we don't need an H macro here.

> +        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
> +            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
> +            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
> +        }                                                                 \
> +    }                                                                     \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

