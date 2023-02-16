Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B0698D66
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 07:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSY6K-0004E8-IM; Thu, 16 Feb 2023 01:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY68-0004DO-VJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:50:30 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSY66-0007xT-HZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 01:50:28 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso5528381pju.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 22:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2SvpPc3aqs3icaOQoav4ldZ1sVhHX1oLFka7S/B+ZUY=;
 b=r9a8GVDf6vARIojz8vpSfF4I0ivYpjHNXRrj2X/Np7d20M9kDeWSFACKozrrETUira
 l1egbc1a32fxkZTjDO+m372cm6w6XgL1UvvJ8RFY+/8vEG2f1TfSa3YaGkNdeL3OgMRd
 imutoOdxgLRfhuZwx/tMDQXOsHpJLp3LCD9XKU3ebbs8QoYLeJLuysU34W8T34yblnQ2
 jqJrD+FRu3NIuNdbU15B+xpEBlocghKvhRnKSUpQ+QnyGoBz3Uah6eCxWli7yVWhwpn6
 2ECvYHv2IUAHoTozYLL2tbQhtjJFqMr/lGO7ZZm4pPdDa0q+UTstY2eYYGpsnR0tdIwL
 Gi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2SvpPc3aqs3icaOQoav4ldZ1sVhHX1oLFka7S/B+ZUY=;
 b=jiVRfRDRVG+/w0mp4CBxhLhKdgzuv4bbUs+cjlK+FQH82HH54lfm4rs8xmRXxQdgBI
 IlJchs01fQKvm638hccbhYbA6+i1NyjG1YnN258yfIawr7CzQrmmN37hVM8p2p1oMzP8
 j3jg+SNd8MWCWda3MpCrmpKCPKlvq+kY/87OYIWi7LyBRch+0l5wRhBrynmMIzu7iQIJ
 7XRR4nGPgHhbBtRfjMIDixSlQfY2Nd2g+LLLhaHGlMZhXVeXKOEZ/TdC2eihhzDE8zej
 RkUTIjPj1JuyP77CNJboqaN2+g8bBbewcbZMQ/aw+Rfoi8ReF3+zPO+Pl3rXk2QmrCqw
 jLSQ==
X-Gm-Message-State: AO0yUKVnyx4sZdQI6pBjIUrsgwjpOXj7g4b0fgT3XqrK5vqwLoPuRT3e
 qMtnpwbog/SbbTAq3Nli4xnxc+DFtDCRH2NNFF/Huw==
X-Google-Smtp-Source: AK7set/bsV7/H14eQG/AZsUrFtxzOD8XfW7thA9tFMrW1tFc5OF4Lx1Y16TriYYVVe4vGWD8Bym5DA==
X-Received: by 2002:a17:902:c950:b0:19a:aea3:8a92 with SMTP id
 i16-20020a170902c95000b0019aaea38a92mr5751936pla.16.1676530224618; 
 Wed, 15 Feb 2023 22:50:24 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 u12-20020a17090282cc00b0019a9637b2d3sm453465plz.279.2023.02.15.22.50.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:50:24 -0800 (PST)
Message-ID: <028cae76-5b52-76e0-9294-6477cbb89a28@linaro.org>
Date: Wed, 15 Feb 2023 20:50:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/i386: Fix BZHI instruction
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230114233206.3118472-1-richard.henderson@linaro.org>
In-Reply-To: <20230114233206.3118472-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

r~

On 1/14/23 13:32, Richard Henderson wrote:
> We did not correctly handle N >= operand size.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1374
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/i386/test-i386-bmi2.c |  3 +++
>   target/i386/tcg/emit.c.inc      | 14 +++++++-------
>   2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/tcg/i386/test-i386-bmi2.c b/tests/tcg/i386/test-i386-bmi2.c
> index 982d4abda4..0244df7987 100644
> --- a/tests/tcg/i386/test-i386-bmi2.c
> +++ b/tests/tcg/i386/test-i386-bmi2.c
> @@ -123,6 +123,9 @@ int main(int argc, char *argv[]) {
>       result = bzhiq(mask, 0x1f);
>       assert(result == (mask & ~(-1 << 30)));
>   
> +    result = bzhiq(mask, 0x40);
> +    assert(result == mask);
> +
>       result = rorxq(0x2132435465768798, 8);
>       assert(result == 0x9821324354657687);
>   
> diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
> index 4d7702c106..1eace1231a 100644
> --- a/target/i386/tcg/emit.c.inc
> +++ b/target/i386/tcg/emit.c.inc
> @@ -1143,20 +1143,20 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
>   static void gen_BZHI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
>   {
>       MemOp ot = decode->op[0].ot;
> -    TCGv bound;
> +    TCGv bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
> +    TCGv zero = tcg_constant_tl(0);
> +    TCGv mone = tcg_constant_tl(-1);
>   
> -    tcg_gen_ext8u_tl(s->T1, cpu_regs[s->vex_v]);
> -    bound = tcg_constant_tl(ot == MO_64 ? 63 : 31);
> +    tcg_gen_ext8u_tl(s->T1, s->T1);
>   
>       /*
>        * Note that since we're using BMILG (in order to get O
>        * cleared) we need to store the inverse into C.
>        */
> -    tcg_gen_setcond_tl(TCG_COND_LT, cpu_cc_src, s->T1, bound);
> -    tcg_gen_movcond_tl(TCG_COND_GT, s->T1, s->T1, bound, bound, s->T1);
> +    tcg_gen_setcond_tl(TCG_COND_LEU, cpu_cc_src, s->T1, bound);
>   
> -    tcg_gen_movi_tl(s->A0, -1);
> -    tcg_gen_shl_tl(s->A0, s->A0, s->T1);
> +    tcg_gen_shl_tl(s->A0, mone, s->T1);
> +    tcg_gen_movcond_tl(TCG_COND_LEU, s->A0, s->T1, bound, s->A0, zero);
>       tcg_gen_andc_tl(s->T0, s->T0, s->A0);
>   
>       gen_op_update1_cc(s);


