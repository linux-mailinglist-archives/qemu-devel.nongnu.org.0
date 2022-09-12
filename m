Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B75B5D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 17:35:22 +0200 (CEST)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXlSx-0001oj-PD
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 11:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXlRK-0000Fk-CY
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:33:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXlRI-0004h1-IC
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:33:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bz13so15995098wrb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 08:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JP8OTRLHjjXikH5h0BJxX4b4TV7fcZMaFqhQuNLlC/Y=;
 b=aXffLp4Q1cxfYwfqq5qKXITxxOkmFRMAR+bdxefEmjwjSE8F/B2wwrwmctPPM2fNPc
 ByA5VJxfggBCqv6gncLbsm97G1FuFSMy4E7RsdIVlWZjNhOr6JBBuwe6YIzsY6Va67Xo
 csTqT8N00W3I8oiWf+LNRbBfirRI/I+tZkIpKAtg7J90uSJYYObCrg7S//iLwi0maaAz
 xHRqZ+EGn4ROcEsFeWA9qW25NfJNvZSLxNaDk656PvNJ3S0GfsJR9zt3+eLOvxF3Oyvd
 4WIyJNcEz9A0eUz1d31h4LzEWuF7zisoeUvToUlR4H0gM/lA37SoAOO3LN6KAOldXD8X
 da+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JP8OTRLHjjXikH5h0BJxX4b4TV7fcZMaFqhQuNLlC/Y=;
 b=g6txwMNCqfSftcIyKZQyF/7htTiylpIIsse3nfWDaAgwJzKkC35zSUza0WcPyR+9RO
 Pq3VEOjkBQ1UaCmwHnPoq2k3Bm3xzx8Mc4tx75mC59lFDCC4KYGsWgujPYKEC3OzRVeo
 WvBX6h29N5yyYrSiH15BnwuCmai9uHgKpOgnB2FrxhniqS6ADkVxZTGyASblHnz1IeC8
 W8IS0gEqWCBMJUU0MmIryPyxUaUZ6kN/ArbEQAidJL1JM3UMS0N+55HNFX5CavjdZBUJ
 zGO7dS1BX9eUxkTiddKRkgGZIIwqb8MVOySG3jC90t0opJ5+KTP/IJ0Tm80EHuPGoaep
 wf7w==
X-Gm-Message-State: ACgBeo242RcwsMLjfOjeuL+broEO++GvUbIYtB2S2K52M5YCnARBgJth
 h2jbmE1NlQTgf35ml2emxHda3Q==
X-Google-Smtp-Source: AA6agR43T8ryshPDhTgU9SwKe+N6tlw7/1zuRVutkPQyfAUa1AoZKf5iE0lVnfkGIo6NTYqlnnFQyg==
X-Received: by 2002:a5d:47ac:0:b0:22a:9d95:c3d with SMTP id
 12-20020a5d47ac000000b0022a9d950c3dmr2372996wrb.35.1662996814688; 
 Mon, 12 Sep 2022 08:33:34 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c35d300b003a83fda1dc5sm11067560wmq.44.2022.09.12.08.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 08:33:33 -0700 (PDT)
Message-ID: <176dac2e-16b1-6845-5341-0164b1ad0d68@linaro.org>
Date: Mon, 12 Sep 2022 16:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 26/37] target/i386: reimplement 0x0f 0x3a, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-27-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-27-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> @@ -839,6 +910,10 @@ static bool decode_insn(DisasContext *s, CPUX86State *env, X86DecodeFunc decode_
>           }
>       }
>       if (e->op3 != X86_TYPE_None) {
> +        /*
> +         * A couple instructions actually use the extra immediate byte for an Lx
> +         * register operand; those are handled in the gen_* functions as one off.
> +         */
>           assert(e->op3 == X86_TYPE_I && e->s3 == X86_SIZE_b);
>           s->rip_offset += 1;
>       }

Comment should be squashed back with the code.

> +static inline void gen_binary_imm_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                                      SSEFunc_0_epppi xmm, SSEFunc_0_epppi ymm)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

tcg_constant_i32.

> +static inline void gen_unary_imm_fp_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                                        SSEFunc_0_eppi xmm, SSEFunc_0_eppi ymm)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

Likewise.

> +static void gen_PALIGNR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

Likewise, but could simply be implemented with inline with extract2.

> +static void gen_PCMPESTRI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

tcg_constant_i32.

> +static void gen_PCMPESTRM(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    TCGv_i32 imm = tcg_const_i32(decode->immediate);

Likewise.

>   static void gen_PCMPGTB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
>   {
>       int vec_len = sse_vec_len(s, decode);
>         tcg_gen_ld8u_tl(s->T0, s->ptr1, offsetof(ZMMReg, ZMM_B(val)));
> +        break;
> +    case MO_16:
> +        tcg_gen_ld16u_tl(s->T0, s->ptr1, offsetof(ZMMReg, ZMM_W(val)));
> +        break;

Mailer breakage?

> +    if (new_mask != 15) {
> +        if ((val >> 0) & 1)
> +            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(0)));
> +        if ((val >> 1) & 1)
> +            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(1)));
> +        if ((val >> 2) & 1)
> +            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(2)));
> +        if ((val >> 3) & 1)
> +            tcg_gen_st_i32(zero, s->ptr0, offsetof(ZMMReg, ZMM_L(3)));
> +    }

Missing braces.


r~

