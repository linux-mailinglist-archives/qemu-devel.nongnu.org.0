Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B4D403442
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:28:56 +0200 (CEST)
Received: from localhost ([::1]:49948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNr4o-0006SG-Qk
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNr3H-0005mE-Ri
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:27:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNr3E-00063N-LF
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:27:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id jg16so1968630ejc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q3oPmjmoRMuyVtlfEkor+TvFU77F3Ph81moVzNLNPKs=;
 b=JpMekY6FPfi/CyyNLC+DfKax8FsCQ1ErMwL3Sqju3q3ZhdvH+CSa7RqqlIISaEnadi
 qAkzJR5+VEo9c9sCnjWepWUSPT93zrW5FOlWJb9rOsWKcaKGMC3MtiNRKVaZG8a2DPUY
 LlltltVv92Z03tPl/XR+i/L+QJL2XFThgm/C0AsChHD43JKHU7M33fZWaxf1+Y5rzBUu
 mtUQpveWZSvUYVyCtyGSMmIzNTCmbSGyctsnVs8h2UW0vszLAHaTn66dhiu1k/NpeF0K
 7NJWw18X7p26ht8adOLR58fpf6AY0Jb1fiZzj2vpGqXYGUv0JSprmwzZf3eaPHqgS1Xh
 Fmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3oPmjmoRMuyVtlfEkor+TvFU77F3Ph81moVzNLNPKs=;
 b=UiFL7vqhYGEANcglgiyz84CYt2PvZ3fwDs2BdnNYddUs5J2j3k8YGgZTPzaOKbvuzf
 aloIK+A+3ccx0i6g15A3sZVPTC/ME0KzM/x39sJHQctGzXlkOeaAyLvNiJXez7fj8WhW
 SwjvSDkGKn7b4pimm6dhaMHz6owRV/5D9Z7MRRjyHXauwyKLtUKo1xIY3N/IHqioXxqa
 VjBlLX6UUKuNqHl5x+hwSYMQf9/Q1smh+64SFHX/MtPF5Y2+lCP2/npCgRm/o15o1ZYQ
 DWEZiTvXTEX71pKHC+1oxzNT1RFss2JFXfYCL85wcmvUDBagHZtZGe2eA2tnxD2cXmSX
 Aq8g==
X-Gm-Message-State: AOAM532/xDLEWevKnZh5S3QEaXQhbutuI+QBlHQhwQB0cy58ly1AIMzd
 8qMZMmVb3rYiXHctX+gn9lAMdA==
X-Google-Smtp-Source: ABdhPJzunV4NVDhU7oAX9Hd8WjmRJSm5dwzR6ruoKzhiNeVr9UPn6syr7PqqSlyhlDR3ovhTGOQcPw==
X-Received: by 2002:a17:906:bc4b:: with SMTP id
 s11mr2399872ejv.246.1631082433868; 
 Tue, 07 Sep 2021 23:27:13 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.138.20])
 by smtp.gmail.com with ESMTPSA id ly7sm438432ejb.109.2021.09.07.23.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:27:12 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee61fe15-5851-c896-f7f6-10b33bbf5d2a@linaro.org>
Date: Wed, 8 Sep 2021 08:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2540484d3fb928600d403182529bf345b2b1f915.1631076834.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 6:54 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/translate.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e356fc6c46..25670be435 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -485,20 +485,20 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   /* Include the auto-generated decoder for 16 bit insn */
>   #include "decode-insn16.c.inc"
>   
> -static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> +static void decode_opc(CPURISCVState *env, DisasContext *ctx)
>   {
>       /* check for compressed insn */
> -    if (extract16(opcode, 0, 2) != 3) {
> +    if (extract16(ctx->opcode, 0, 2) != 3) {
>           if (!has_ext(ctx, RVC)) {
>               gen_exception_illegal(ctx);
>           } else {
>               ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            if (!decode_insn16(ctx, opcode)) {
> +            if (!decode_insn16(ctx, ctx->opcode)) {
>                   gen_exception_illegal(ctx);
>               }
>           }
>       } else {
> -        uint32_t opcode32 = opcode;
> +        uint32_t opcode32 = ctx->opcode;
>           opcode32 = deposit32(opcode32, 16, 16,
>                                translator_lduw(env, ctx->base.pc_next + 2));

You needed to write back to ctx->opcode here.

I think that all of the other changes are less than ideal -- let the value stay in a 
register as long as possible and drop them to memory immediately before calling 
decode_insn{16,32}, just before the write to pc_succ_insn in both cases.


r~


>           ctx->pc_succ_insn = ctx->base.pc_next + 4;
> @@ -561,9 +561,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>   {
>       DisasContext *ctx = container_of(dcbase, DisasContext, base);
>       CPURISCVState *env = cpu->env_ptr;
> -    uint16_t opcode16 = translator_lduw(env, ctx->base.pc_next);
> +    ctx->opcode = translator_lduw(env, ctx->base.pc_next);
>   
> -    decode_opc(env, ctx, opcode16);
> +    decode_opc(env, ctx);
>       ctx->base.pc_next = ctx->pc_succ_insn;
>       ctx->w = false;
>   
> 


