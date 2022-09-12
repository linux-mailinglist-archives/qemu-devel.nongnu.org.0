Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE0D5B5B8E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:49:32 +0200 (CEST)
Received: from localhost ([::1]:55156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjoZ-0003Pm-G5
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjlS-0000w9-Sz
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:46:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjlQ-0002nI-JS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:46:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h8so8468962wrf.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 06:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=fXxoQz7cdjjsE79XBynfS3bVwx5O5L9BZvEBjiNVScQ=;
 b=uQcTKYS15btMNHiil3jM0AXLhLG3XIqb5bBOn+fRpJ3cMDbeY1gJwI3mRP3M9NwTLd
 Xk7AeXmJNvlJBmgb4y594o9dPxVaH0oNWEp7BkN2LhRMxojQGtEF+RF5pkRgCjUR+Dfw
 o3NQiTzzOvY07GVXgUbn0O6DhFwkPTTEMzf+o8bKV/dEcoOy71wo9khTieDQiJ1NolXS
 l1jPicoNPkBuYN0zh+RKBpzD39TtXyP1mUwNU0TVZYqLBMq3KCP3nv+Qi4Ruu4OVsX+w
 pb7ZJr8HedJ/c4EXiZsfbm17ve11kmelkudWIIxnycgwgbrXdzlQ8uh00gydy5CtYTJX
 4UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fXxoQz7cdjjsE79XBynfS3bVwx5O5L9BZvEBjiNVScQ=;
 b=a3ytlFl1XrodVGbnEZlHAEoWcNKk1J8I1nuFHYroOSz545vXudqpGf0IJjInlu5BM0
 auoWKOkrX1Js21aFhXYY1wPjvqJ1gIZ7ygGLJAKoA3xY9sfrHU8zzfErEhrXQtDrqAff
 s1Jj/FcRw7SDCe7a0aBu3aFCVFnA5svENggPdJf3xlQOUXLEn9oY+xDOjwsXq2/1aI8+
 bTG+rq8P2Sis8WZY4RIVYKZGv5QssfBrBwgdq4wCaAx3QUiptxKTe/cVA3upCyUwYjSV
 jqScX8gTSljn/8YvUVeZ2Fe1i/BnLmZ6xS5eSkWaYIFUgBbfaJJXHNNbYN1Oc0VryE1t
 wn1A==
X-Gm-Message-State: ACgBeo2WbLncWvgocfFU/XYa9mkda95pZZn2AENlCEHAmEM4A8yji+Le
 KLLL6hgWn8fdiPKt0/cz44V4hw==
X-Google-Smtp-Source: AA6agR6mFl7n54Rr0jO8QA71LNpIT67o6Nx+YKlEdZi0G27gF9m5P6VGySAadiCNUmb3quJLkOuc1Q==
X-Received: by 2002:a05:6000:144e:b0:22a:4e88:ee3d with SMTP id
 v14-20020a056000144e00b0022a4e88ee3dmr5466908wrx.49.1662990375021; 
 Mon, 12 Sep 2022 06:46:15 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b00228fa832b7asm7547056wrt.52.2022.09.12.06.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 06:46:14 -0700 (PDT)
Message-ID: <0e1f4af2-bd50-d437-be6e-269f69017f1b@linaro.org>
Date: Mon, 12 Sep 2022 14:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 22/37] target/i386: reimplement 0x0f 0x50-0x5f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-23-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-23-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
> These are mostly floating-point SSE operations.  The odd ones out
> are MOVMSK and CVTxx2yy, the others are straightforward.
> 
> Unary operations are a bit special in AVX because they have 2 operands
> for PD/PS operands (VEX.vvvv must be 1111b), and 3 operands for SD/SS.
> They are handled using X86_OP_GROUP3 for compactness.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  32 ++++++
>   target/i386/tcg/emit.c.inc       | 175 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |   2 +-
>   3 files changed, 208 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index 59f5637583..5a94e05d71 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -243,7 +243,30 @@ static void decode_0F3A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
>       *entry = opcodes_0F3A[*b];
>   }
>   
> +static void decode_sse_unary(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    if (!(s->prefix & (PREFIX_REPZ | PREFIX_REPNZ))) {
> +        entry->op1 = X86_TYPE_None;
> +        entry->s1 = X86_SIZE_None;
> +    }
> +    switch (*b) {
> +    case 0x51: entry->gen = gen_VSQRT; break;
> +    case 0x52: entry->gen = gen_VRSQRT; break;
> +    case 0x53: entry->gen = gen_VRCP; break;
> +    case 0x5A: entry->gen = gen_VCVTfp2fp; break;
> +    }
> +}

I wonder if a .special would be cleaner here, but I guess this isn't horrible.

> +    [0x54] = X86_OP_ENTRY3(VAND,       V,x, H,x, W,x,  vex4 p_00_66),
> +    [0x55] = X86_OP_ENTRY3(VANDN,      V,x, H,x, W,x,  vex4 p_00_66),
> +    [0x56] = X86_OP_ENTRY3(VOR,        V,x, H,x, W,x,  vex4 p_00_66),
> +    [0x57] = X86_OP_ENTRY3(VXOR,       V,x, H,x, W,x,  vex4 p_00_66),

Just reuse PAND et al with a comment?  I see there's a define later, but why?

> +static void gen_VCVTfp2fp(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    gen_unary_fp_sse(s, env, decode,
> +                     gen_helper_cvtpd2ps_xmm, gen_helper_cvtps2pd_xmm,
> +                     gen_helper_cvtpd2ps_ymm, gen_helper_cvtps2pd_ymm,
> +                     gen_helper_cvtsd2ss, gen_helper_cvtss2sd);
> +}
> +
> +static void gen_VCVTps_dq(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    SSEFunc_0_epp fn = NULL;
> +    switch (sse_prefix(s)) {
> +    case 0x00:
> +        fn = s->vex_l ? gen_helper_cvtdq2ps_ymm : gen_helper_cvtdq2ps_xmm;
> +        break;
> +    case 0x66:
> +        fn = s->vex_l ? gen_helper_cvtps2dq_ymm : gen_helper_cvtps2dq_xmm;
> +        break;
> +    case 0xf3:
> +        fn = s->vex_l ? gen_helper_cvttps2dq_ymm : gen_helper_cvttps2dq_xmm;
> +        break;
> +    }
> +    fn(cpu_env, s->ptr0, s->ptr2);
> +}

Only use of sse_prefix?  We directly look at prefix bits elsewhere...

Also, while these are all coverts, it doesn't seem conceptually different from 
decode_group_twobyte_6F.  Why are we waiting until generation in this case?


r~

