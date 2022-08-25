Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73645A0528
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:25:29 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0ga-0003dj-GF
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0f0-0002EI-MR
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:23:50 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0ey-0006qW-UT
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:23:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id io24so3817857plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=pD4NBynf3/lKw5R7sUMha9EaWpNWI1RCn/vL06JDto0=;
 b=V4qHpGBovKggQ50jlCv6l/JUdmrDOxQ1ePX/n6DUOTqI0NyZ3qNgjkpZ3XAKWk7axr
 tu3EHaYx/s09Vf9lHCG5YqJYlk/k+u5FPgg4RaNtBwccJRtmnf4JaBPgLy+l0FtnW8i1
 DPgdZQBo5+OT0Axi7dmAW5wwpiC2XD1AnWa3FIEJB/3Nu+TJ8KsHRnexIFZIN9iw9Gbd
 Tcvxpgi/5zg9wbZfd2ttTrjcooIlxCe+rqgeXtbKed6AP5Xo6oS1kW0QqeGUzVc8jsj3
 nsb8QfzClKFu1qoY4MtGu6xzOgEFq8WRQmVgDbNB76r5S05TaFpzuZFs23OvqXup/iXD
 1X/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=pD4NBynf3/lKw5R7sUMha9EaWpNWI1RCn/vL06JDto0=;
 b=AX/xh2hD1kkx/I9ZZoTuAS4CS51G+N2LTQCFn0lm8XrTJxeU2bMJpRNigtDf7wq2gQ
 a0VcGJ0XQfKS/dsBQM6QgfGdiXnrqUW5jNj1CuVYgmtslCrndNPma5x312yveQKGKye2
 ZwYIbU1lU09SThtT+TlGdFcjcSLV5OHiIupYUA1aV23oN/vRSkrfxzz6ReuHsDWCufvK
 kjJSh1JDduSMhF5qmvOS3ctJUy/0aFFdyzcoGxWjlTK44ZtKTqcVC8q0qhBWmwmURKPJ
 bFiTfRqcAIhzvp7YR3rw62dWOQPpPucNm9Jkhz1lJ7tPbsCW6txiLwL9n9sHed+kW/2A
 od8A==
X-Gm-Message-State: ACgBeo2C9/z7vcV/s3s/yDOdxXFhwv5VvcVflTbxMOO4ZlHgilCi4uK9
 ixxrXtmUlCzR9w1wrGE5nzuLiA==
X-Google-Smtp-Source: AA6agR46GWXdZYUPC8e+39JdHbM/ATe8BFeAKHdl56fzcuVTawm7zfx4GwLd3atJ28nO2t+LMP6YQw==
X-Received: by 2002:a17:902:d2d1:b0:172:e5f6:24b with SMTP id
 n17-20020a170902d2d100b00172e5f6024bmr1345676plc.45.1661387027186; 
 Wed, 24 Aug 2022 17:23:47 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902d2cc00b0016c29dcf1f7sm13281112plc.122.2022.08.24.17.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:23:46 -0700 (PDT)
Message-ID: <7b4759db-6592-2bc2-25f6-a762e8a83c26@linaro.org>
Date: Wed, 24 Aug 2022 17:23:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/17] target/i386: add ALU load/writeback core
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173123.232018-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/24/22 10:31, Paolo Bonzini wrote:
> Add generic code generation that takes care of preparing operands
> around calls to decode.e.gen in a table-driven manner, so that ALU
> operations need not take care of that.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 14 +++++++-
>   target/i386/tcg/emit.c.inc       | 62 ++++++++++++++++++++++++++++++++
>   2 files changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index d661f1f6f0..b53afea9c8 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -133,6 +133,7 @@ typedef struct X86DecodedOp {
>       MemOp ot;     /* For b/c/d/p/s/q/v/w/y/z */
>       X86ALUOpType alu_op_type;
>       bool has_ea;
> +    TCGv v;
>   } X86DecodedOp;
>   
>   struct X86DecodedInsn {
> @@ -987,7 +988,18 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
>       if (decode.op[0].has_ea || decode.op[1].has_ea || decode.op[2].has_ea) {
>           gen_load_ea(s, &decode.mem);
>       }
> -    decode.e.gen(s, env, &decode);
> +    if (s->prefix & PREFIX_LOCK) {
> +        if (decode.op[0].alu_op_type != X86_ALU_MEM) {
> +            goto illegal_op;
> +        }
> +        gen_load(s, s->T1, &decode.op[2], decode.immediate);
> +        decode.e.gen(s, env, &decode);
> +    } else {
> +        gen_load(s, s->T0, &decode.op[1], decode.immediate);
> +        gen_load(s, s->T1, &decode.op[2], decode.immediate);
> +        decode.e.gen(s, env, &decode);
> +        gen_writeback(s, &decode.op[0]);
> +    }

While I can see that you don't want to mix decoding changes with temp lifetime changes...

> +static void gen_load(DisasContext *s, TCGv v, X86DecodedOp *op, uint64_t imm)
> +{
...
> +    op->v = v;
> +}

Surely this assignment...

> +static void gen_writeback(DisasContext *s, X86DecodedOp *op)
> +{
...
> +    case X86_ALU_GPR:
> +        gen_op_mov_reg_v(s, op->ot, op->n, s->T0);

... can be used here instead of hard-coding T0.  It should be easy enough to create *_v 
editions of all *_T0, such as gen_movl_seg_T0.



r~

