Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFF49BDE1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 22:30:59 +0100 (CET)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTP0-0003eA-16
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 16:30:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTNG-0002qw-PX
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:29:10 -0500
Received: from [2607:f8b0:4864:20::532] (port=40914
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCTNE-0005fj-Qn
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:29:10 -0500
Received: by mail-pg1-x532.google.com with SMTP id t32so19341757pgm.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 13:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p6QxOBBoehsHvuIMymY7X+IU/5J7rQ7Ji1uG58YXztY=;
 b=JzS4wm8MG7+BZBIM4wqekVesDUKuYGwsTjactRpgXTXGpkRya2If1nK3wMBvKitIyW
 qMLSEbU6XwFtnJ5aNWa3tW2FfPsvKq7fRZAEUnfNj7jJkf/DSxDyohHvh7/Li2+rUJTs
 lKWDpzoMvWDLDmxX0nsaC1DGsnDYuvE/u8y1qLtWMp24lo8p3uAbfTpOtGb7n05hrl2u
 f+jrSExpzFKw+Rx6VbuL/5Wn7x6ZltZk+k0CcrzngUT42gStC61ZgFK9m+s8Qpozed/z
 oUVK5Io/aIUznotUNE+s5Lx5NLdRXCHQSMtpfk59pe/I0kDzJC/RrCdn/UhrzyqMhOpn
 DqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6QxOBBoehsHvuIMymY7X+IU/5J7rQ7Ji1uG58YXztY=;
 b=hlxAjQs7DQDUPOly51fduBEj59TTN7h8hlnPBYc1Urzt59ql0lrWPmlbTuct12RcDO
 eXUT4vC328+9zZPuqtCj4GrQlSLV9UW1xmjlPP7Y4UgRCZgettw/SHJ5Y3eqYgxDQlfO
 EXuGbaICrU9WbKuNrKNoRBQFIdK0+cH7KSedSYKpx/UMbp/AnRBibAUbB+l0oJh4c0mU
 kgT8Zr5ZKdH50fQP0nnRDtr54CLstMQ3sYJYZ/y04o8O1fOzTKW6xdYfJkNUB9+VRGsr
 /iYLkPaLL2qUrG4dr/lFpY2xj8qGsqy1Koa0x+AEOewEggJN0kGmT/sD9KwI3aP9dIVS
 HluQ==
X-Gm-Message-State: AOAM530K6z1+3CEriQ6noEd81aDRy6MMhnzJXdHvqKqd9VWhGZYW9h8L
 K3pmyQvtsh/3JsVn6UZCnmkjJg==
X-Google-Smtp-Source: ABdhPJwaol/W9YlCNaYBsMSVPv0momiaGDpZGrBapgSYf6GKEEWMasdCfBMaUyquaiD2jT8uV3NhQg==
X-Received: by 2002:a62:5211:0:b0:4bc:c949:ae8d with SMTP id
 g17-20020a625211000000b004bcc949ae8dmr20369119pfb.26.1643146146604; 
 Tue, 25 Jan 2022 13:29:06 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id mu13sm1312958pjb.28.2022.01.25.13.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 13:29:06 -0800 (PST)
Subject: Re: [PATCH v2 1/2] target/riscv: iterate over a table of decoders
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d93c61fc-03a7-5968-e97b-3430d703d671@linaro.org>
Date: Wed, 26 Jan 2022 08:28:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113202033.3320854-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Greg Favor <gfavor@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 7:20 AM, Philipp Tomsich wrote:
> +static inline bool always_true_p(CPURISCVState *env  __attribute__((__unused__)),
> +                                 DisasContext *ctx  __attribute__((__unused__)))
> +{
> +    return true;
> +}

Drop the inline; the function will be instantiated so that it can be put in the table.
Drop the env pointer.  Everything this hook should examine must be in DisasContext.

>  static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>  {
> -    /* check for compressed insn */
> +    /* If not handled, we'll raise an illegal instruction exception */
> +    bool handled = false;
> +
> +    /*
> +     * A table with predicate (i.e., guard) functions and decoder functions
> +     * that are tested in-order until a decoder matches onto the opcode.
> +     */
> +    const struct {

static const.

> +        bool (*guard_func)(CPURISCVState *, DisasContext *);
> +        bool (*decode_func)(DisasContext *, uint32_t);
> +    } decoders[] = {
> +        { always_true_p,  decode_insn32 },
> +    };
> +
> +    /* Check for compressed insn */
>      if (extract16(opcode, 0, 2) != 3) {
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
>              ctx->opcode = opcode;
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> -                gen_exception_illegal(ctx);
> -            }
> +            handled = decode_insn16(ctx, opcode);
>          }
>      } else {
>          uint32_t opcode32 = opcode;
> @@ -862,10 +880,18 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>                                               ctx->base.pc_next + 2));
>          ctx->opcode = opcode32;
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
> -        if (!decode_insn32(ctx, opcode32)) {
> -            gen_exception_illegal(ctx);
> +
> +        for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> +            if (!decoders[i].guard_func(env, ctx))
> +                continue;
> +
> +            if ((handled = decoders[i].decode_func(ctx, opcode32)))

Never put an assignment in an if like this.

I think it would be cleaner to just do

     if (decode()) {
         return;
     }

and drop the handled variable entirely.


r~

