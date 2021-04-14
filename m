Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24735F78A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:28:12 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWhR4-0006I8-Vp
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWhPj-0005RT-Gg
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:26:48 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lWhPg-0008BF-SG
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:26:47 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d8so10296920plh.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aSuEG2+t6HFLp4jtAjxISZwY7TC6s3eu2M/n0YUovRQ=;
 b=xzW4yA4y86+MSyzjjKRUKodiBq8gJoXXgaia68VPWJvPqSmhjv4dHJekSSFo7bRvUt
 IBfPeAMSMyS5dp44hVQ4LAtOZ4V5Ifv9PZ3ORQmUNX4qFBHud+uuxDl7vLf7XAHHANz4
 IcyxyWbbOC7fjQCpPeCmBCKCDXKX3vy1NIkCjFa9OxUMOLN3k0j8QoTBrmB4fzYOX2Hd
 jtJZrYQ/CZ5eP94cO7x/+WC7oi16W1xvAGcuwIp+OpCCJYCppKaIuqRPyHxhVpUJaYrZ
 BqNoxRCoU3CjBirYd90X3vMEGNm+HIvNMFVWZbBLXMTkDc4ClVU7kD684sU3Hhq4Q/B9
 b49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aSuEG2+t6HFLp4jtAjxISZwY7TC6s3eu2M/n0YUovRQ=;
 b=Ni8EoVupzXOXGIuO/zpODAZnt5qyVPjreHFe7LwSKQ6xWPvB9M71W0HJyFVEdsRkn3
 23NR0tr7f7FX1lbtKeO+necqK3GjCHzEpxCcmcu4QkImRXWfSr7lDtL/RJUdxgvr65Rj
 uxqd/uhI7R3PyiT0iQHRediPiV5z2WqNUIKPDG2CZem7vDxbaS3kBBBFfNQqQgaXC5d9
 4LdZnY05NP0J4iWl/dgAIbSkx11zcX2o5/YkxPW1Jhn9OtxQ2jAVtxcItlazBLsP9Zxf
 4CXFBctYesksVvGMzbvxln/mehcYM8k8Xwc+pJEVDOYm79kQgXbOlu5gNHC8uQqTOWw+
 l5PQ==
X-Gm-Message-State: AOAM531QYOreZXKBVDDYfC36ty6NvQQsO8yB4NKGfPnTN+xIGLWvJhxG
 KH1OB+/n6VdNs9pPxLUznovtKA==
X-Google-Smtp-Source: ABdhPJyFGyGZrCi8KKcuAqUboRX/erOu3VRvzPzgV5LI604PqejHcvuN26s0QFqEQfBj3VPIn6rQpg==
X-Received: by 2002:a17:902:e8d5:b029:e6:cabb:d07 with SMTP id
 v21-20020a170902e8d5b02900e6cabb0d07mr37980060plg.3.1618414003229; 
 Wed, 14 Apr 2021 08:26:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h1sm623587pgv.88.2021.04.14.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 08:26:42 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/ppc: Base changes to allow 32/64-bit insns
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
 <20210413211129.457272-5-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d8e90027-f238-2561-8a7b-f9b95df51d6d@linaro.org>
Date: Wed, 14 Apr 2021 08:26:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413211129.457272-5-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 2:11 PM, Luis Pires wrote:
>       if (ctx->exception == POWERPC_EXCP_NONE) {
> -        gen_update_nip(ctx, ctx->base.pc_next - 4);
> +        gen_update_nip(ctx, ctx->base.pc_next - ctx->insn_size);

It appears as if the major (only?) use of insn_size is this subtraction?  It 
looks like it would be better to simply save the address of the current pc 
before we begin decoding.

This change should be done as a separate patch.

> +static uint64_t ppc_load_insn(DisasContext *ctx)
> +{
> +    uint64_t insn;
> +    uint32_t insn_part;
> +
> +    /* read 4 bytes */
> +    insn_part = translator_ldl_swap(ctx->env, ctx->base.pc_next,
> +                                    need_byteswap(ctx));
> +    insn = ((uint64_t)insn_part) << 32;
> +    ctx->base.pc_next += 4;
> +    ctx->insn_size = 4;
> +
> +    if (is_insn_prefix(insn_part)) {
> +        /* read 4 more bytes */
> +        insn_part = translator_ldl_swap(ctx->env, ctx->base.pc_next,
> +                                        need_byteswap(ctx));
> +        insn |= insn_part;
> +
> +        ctx->base.pc_next += 4;
> +        ctx->insn_size += 4;
> +    }
> +
> +    return insn;
> +}

> @@ -7979,37 +8049,31 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>   
> +    target_ulong insn_size = ppc_peek_next_insn_size(ctx);
> +
>       gen_debug_exception(ctx);
>       dcbase->is_jmp = DISAS_NORETURN;
>       /*
>        * The address covered by the breakpoint must be included in
>        * [tb->pc, tb->pc + tb->size) in order to for it to be properly
> -     * cleared -- thus we increment the PC here so that the logic
> -     * setting tb->size below does the right thing.
> +     * cleared -- thus we increment the PC here.
>        */
> -    ctx->base.pc_next += 4;
> +    ctx->base.pc_next += insn_size;

Here in breakpoint_check, we merely need a non-zero number.  No point in a 
change here.

> +    /* load the next insn, keeping track of the insn size */
> +    insn = ppc_load_insn(ctx);
> +
> +    if (unlikely(ctx->insn_size == 8 &&
> +                 (ctx->base.pc_next & 0x3f) == 0x04)) {
> +        /*
> +         * Raise alignment exception when a 64-bit insn crosses a
> +         * 64-byte boundary
> +         */
> +        gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);

This is incorrect.

In 1.10.2 Instruction Fetches, it states that all instructions are word 
aligned, and gives an example of a prefixed instruction not aligned on a 
double-word boundrary.


r~

