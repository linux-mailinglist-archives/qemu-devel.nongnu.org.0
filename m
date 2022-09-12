Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EC5B57EC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:10:55 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgP0-0000JP-7Q
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgK1-000325-IH
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:05:57 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgJx-0004fA-MZ
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:05:44 -0400
Received: by mail-wm1-x32e.google.com with SMTP id d5so6809591wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=BpUYZuuco4QdD0vHxw3/lTHn5fSVhZRAf5i5BymaI6c=;
 b=QKEOsY4n6k3og/o4dQzcO9cCylPd6YyN5kyqJ4yV/FslQ25P/0axU1FBsyJHTlPPMt
 IK4g8yKAso73u8i6AiIs4gCMxFctSedc7wSSZ0i1IzcXwutTIMibRmlhuM9z3/lEWnpl
 nkPQ+nJAC0/nSwJ8eWPiYAEMWrwhA8iIvckKX33yYlIGLjPYuzAQCI6yfGbxnl6PYPw+
 mGO4yjqAkcpGE1wmu7sbA2ko5CXrGY3fHf4BvO+kLeHmfwKdc7X5b0ZWKXUwwt/PJd4j
 fm61Tm83mJQjJAWUxtuiZ2c5Bl7tsD2wizUUCv1VSwDxweHixvnjgM4sp9cKud7D/6SU
 s+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BpUYZuuco4QdD0vHxw3/lTHn5fSVhZRAf5i5BymaI6c=;
 b=Fs+NVBK751grHAX5eAx8qbJRFPO8ME+YxsK+6E192LWf6SsvqV099ah+s5eltadJJN
 4f8Fe5MJsz7OVBJwWn0meUDY4Zj+RT4nIYsjPLICIbZGCjVOucNo5Wmfu3daOxjp4fCi
 uo1TWKV4a54eA+5HE3pI2V3SBrjvaQkLeFAvAQKjDpx9tn7QByO/b8eNv8xX67LdVuoC
 xd+vztf0fpCiGYuwF9IE/xuxTCVZw6XYMcFwxO0np1Zcw0bxf0corS7UCuaFYaG7dxUy
 BCUtdXISWXK+X8q79vF+UWws/KonFdZQn/5wa8vRw7zQxM69cVg+gyc/sFPc5D9gXCis
 m13g==
X-Gm-Message-State: ACgBeo25xSvnlBm2KbzeSWgFzgFQ0c6qQPWnkTvSiC7q+PLBCqgF+oPo
 GjuWpSWoB34RpoI2NRiE9W76dw==
X-Google-Smtp-Source: AA6agR47f4ihidIqY6bcGMZ3vz3bvUj/XpZbrwMWRmiviN6tnKrkO5hTiswSjQAKPBPoTNussCzaSA==
X-Received: by 2002:a05:600c:c7:b0:3b4:88ec:f980 with SMTP id
 u7-20020a05600c00c700b003b488ecf980mr1931508wmm.92.1662977140243; 
 Mon, 12 Sep 2022 03:05:40 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a5d6a06000000b0021badf3cb26sm8274566wru.63.2022.09.12.03.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:05:39 -0700 (PDT)
Message-ID: <e6ba4a39-17b9-b4e8-a86d-edbcf971fb59@linaro.org>
Date: Mon, 12 Sep 2022 11:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/37] target/i386: add CPUID feature checks to new decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 51 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/decode-new.h     | 20 +++++++++++++
>   2 files changed, 71 insertions(+)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index 7f76051b2d..a9b8b6c05f 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -83,6 +83,7 @@
>   #define X86_OP_ENTRY0(op, ...)                                    \
>       X86_OP_ENTRY3(op, None, None, None, None, None, None, ## __VA_ARGS__)
>   
> +#define cpuid(feat) .cpuid = X86_FEAT_##feat,
>   #define i64 .special = X86_SPECIAL_i64,
>   #define o64 .special = X86_SPECIAL_o64,
>   #define xchg .special = X86_SPECIAL_Locked,
> @@ -506,6 +507,52 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
>       return true;
>   }
>   
> +static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
> +{
> +    switch (cpuid) {
> +    case X86_FEAT_None:
> +        return true;
> +    case X86_FEAT_MOVBE:
> +        return (s->cpuid_ext_features & CPUID_EXT_MOVBE);
> +    case X86_FEAT_PCLMULQDQ:
> +        return (s->cpuid_ext_features & CPUID_EXT_PCLMULQDQ);
> +    case X86_FEAT_SSE:
> +        return (s->cpuid_ext_features & CPUID_SSE);
> +    case X86_FEAT_SSE2:
> +        return (s->cpuid_ext_features & CPUID_SSE2);
> +    case X86_FEAT_SSE3:
> +        return (s->cpuid_ext_features & CPUID_EXT_SSE3);
> +    case X86_FEAT_SSSE3:
> +        return (s->cpuid_ext_features & CPUID_EXT_SSSE3);
> +    case X86_FEAT_SSE41:
> +        return (s->cpuid_ext_features & CPUID_EXT_SSE41);
> +    case X86_FEAT_SSE42:
> +        return (s->cpuid_ext_features & CPUID_EXT_SSE42);
> +    case X86_FEAT_AES:
> +        if (s->vex_l) {
> +            return (s->cpuid_7_0_ecx_features & CPUID_7_0_ECX_VAES);
> +        } else {
> +            return (s->cpuid_ext_features & CPUID_EXT_AES);
> +        }
> +    case X86_FEAT_AVX:
> +        return (s->cpuid_ext_features & CPUID_EXT_AVX);
> +
> +    case X86_FEAT_SSE4A:
> +        return (s->cpuid_ext3_features & CPUID_EXT3_SSE4A);
> +
> +    case X86_FEAT_ADX:
> +        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_ADX);
> +    case X86_FEAT_BMI1:
> +        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI1);
> +    case X86_FEAT_BMI2:
> +        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_BMI2);
> +    case X86_FEAT_AVX2:
> +        return (s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_AVX2);
> +    default:
> +        abort();
> +    }

g_assert_not_reached().

I'll also note that for cases like this, where every case returns, and is intended to be 
present, it can be better to leave the default case outside the switch, so that the 
compiler can Werror early for missing enumerator entries instead of aborting at runtime.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

