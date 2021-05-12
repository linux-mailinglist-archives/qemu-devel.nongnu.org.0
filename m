Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932EA37B8AF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:55:24 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkeJ-0004Jo-7m
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkd3-00033a-Ir
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:54:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkd0-0001eN-9X
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:54:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id t4so33899100ejo.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vU5vYZr3Im3v3yBjS51n/PtbLwd0EcQ4+ApVA0RZprY=;
 b=ghpnbk9+69FSwtIcHOEzVtzVRevDDqRjlO06JlFLDXBnG15bxiFps+2yksPJn2QJ+4
 heq1zPAaiS9/mFgrWtfJORHJHYafAEcG0odnfxVeJLptQEVbxBb61L4SGCCCFnUc8vSm
 evoXjzO9bpJczlcN+9l/jRsrSUtQEvD6YwZW4zMoqPbmbYlbzWwKf15VVhYYVqYazmeO
 +uHPXDkbefgXW0ukXEtlpJt5qIjbl64xQqnRJ8spxwdX3KXtTIOcgVmfQp0YkU0uYMXW
 TtAloq0CUceyvZ4O0CZA6M3LrOf23V3voq6hZDhGY3K3wMlVWfxCNM5tlX7hCAmWUoCw
 52QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vU5vYZr3Im3v3yBjS51n/PtbLwd0EcQ4+ApVA0RZprY=;
 b=uV0JmMk5Sf9cTXtDzLgtezCSTjrvLm+92YM+Ie62uzoBoOIvu4GoupzKJaajfSEMCx
 FdFCyoYIM3WIcghIKj5aRpS9G1QmYG1KHPm47rNCJPHytengX1mZEfyG8FXiM8u4illw
 VXyKvLqTuZOiQrC3qXleKjtmVUQcQw9sVHGswlHNKbcozNyjAAKw9EyoxRBElSkCzP7x
 ALuba170ccnhxngCsBpYHTyzXkqHNXMv8refzbUltKkXhvxCPW7SRXYOBR/vPiHSw7ja
 +t1IfC84uOtCmxGKp8g91xzjyD3fHMbxyQlc/QHgLqsNrqSQVOKfoQcJ0N+k/rbg6vNT
 K4qA==
X-Gm-Message-State: AOAM532CgfLVcplS7aOugAiYi9Me6mL9xnisVUqOTEOH0n+93tABsys2
 AzcB1fMCozfH41U8ukuq+fNz1dthxhKN0m4tlQcMrg==
X-Google-Smtp-Source: ABdhPJyKnh+eAjuMGJsHF3HZVX4YgOOo2MxYw12csTynRtqbqPNyTlt44vigIqRKtEDQ7nfCgDMynGzQWERbK1aTwSU=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr36062349ejb.407.1620809639189; 
 Wed, 12 May 2021 01:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-27-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:52:45 +0100
Message-ID: <CAFEAcA_OknopgKOtwAoiLrKEXmtNDYpQ5EycnkzBuNbc7WLWag@mail.gmail.com>
Subject: Re: [PATCH v6 26/82] target/arm: Implement SVE2 SHRN, RSHRN
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

On Fri, 30 Apr 2021 at 21:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix typo in gen_shrnb_vec (laurent desnogues)
> v3: Replace DO_RSHR with an inline function
> ---
>  target/arm/helper-sve.h    |  16 ++++
>  target/arm/sve.decode      |   8 ++
>  target/arm/sve_helper.c    |  54 ++++++++++++-
>  target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 236 insertions(+), 2 deletions(-)

> -#undef DO_SHR
> -#undef DO_SHL

Did we want to move the #undef DO_SHR/DO_SHL rather than just deleting them ?
(I have to admit I'm not sure to what extent undeffing all of these macros is
worth the effort -- I ran into similar minor awkwardness in the MVE
helper .c file.)

>  #undef DO_ASRD
>  #undef DO_ZPZI
>  #undef DO_ZPZI_D
>
> +#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
> +{                                                            \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                   \
> +    int shift = simd_data(desc);                             \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
> +        TYPEW nn = *(TYPEW *)(vn + i);                       \
> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
> +    }                                                        \
> +}

Doesn't this need some H() macros, the way the T version does ?

> +#define DO_SHRNT(NAME, TYPEW, TYPEN, HW, HN, OP)                  \
> +void HELPER(NAME)(void *vd, void *vn, uint32_t desc)              \
> +{                                                                 \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                        \
> +    int shift = simd_data(desc);                                  \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                 \
> +        TYPEW nn = *(TYPEW *)(vn + HW(i));                        \
> +        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, shift);   \
> +    }                                                             \
> +}
> +
> +DO_SHRNB(sve2_shrnb_h, uint16_t, uint8_t, DO_SHR)
> +DO_SHRNB(sve2_shrnb_s, uint32_t, uint16_t, DO_SHR)
> +DO_SHRNB(sve2_shrnb_d, uint64_t, uint32_t, DO_SHR)
> +
> +DO_SHRNT(sve2_shrnt_h, uint16_t, uint8_t, H1_2, H1, DO_SHR)
> +DO_SHRNT(sve2_shrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_SHR)
> +DO_SHRNT(sve2_shrnt_d, uint64_t, uint32_t,     , H1_4, DO_SHR)
> +
> +DO_SHRNB(sve2_rshrnb_h, uint16_t, uint8_t, do_urshr)
> +DO_SHRNB(sve2_rshrnb_s, uint32_t, uint16_t, do_urshr)
> +DO_SHRNB(sve2_rshrnb_d, uint64_t, uint32_t, do_urshr)
> +
> +DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
> +DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
> +DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
> +
> +#undef DO_SHRNB
> +#undef DO_SHRNT

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

