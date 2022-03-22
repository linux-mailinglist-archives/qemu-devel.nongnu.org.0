Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E557F4E4148
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:28:57 +0100 (CET)
Received: from localhost ([::1]:36790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfVI-0006Vu-Ph
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:28:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfTi-0005XC-M1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:27:18 -0400
Received: from [2607:f8b0:4864:20::102f] (port=34012
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfTg-0003p4-P7
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:27:18 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so1830343pjo.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ftjt5vXWkLl1r7QN4QByvx0cIhYHSGPZde/5cznEmZw=;
 b=Khx+ky60zZ3gi8W8kTM8OiEv7uDvO6x3O06xQrLtihBv8akFIHr/aGsVyrT7djO728
 yDKMoiy04OqFh1dgoa78vhcJ0TQ30yyVYH/uRFMdmzKuzGa7bZf1KaXtrSjp9D+3Rz6i
 bjr6IdJDXUzPDBQqM66f3ySV1eoeU5lkzzo1eLYBRILNgCABP9+KqF7up73OYXlUilYF
 RUAw+eq0L4g8y+jvCerGNVNHd1yejqFz66whe6f9QGrDOfP4YmQsLe36LfEfzu03soJ5
 PjeVNDYVLmNg0gHVmVnvQ1pH4fZ6deFGoHPf2yUvDlRCFEaG4vecx7tI+8dAZw/4c7r8
 767Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ftjt5vXWkLl1r7QN4QByvx0cIhYHSGPZde/5cznEmZw=;
 b=6HGo1PQKg5QVMHoPRotJyy+IQ7mXw1dosxLgN3dSQTNTs8q3T92s+kv0hp22yWNjnF
 1K1wZZD0eB8CWClFiiTQ0AFuDp2Ogwd+fHNEwTiCnVC/Falb8ijbs9+0iQlhTN6vem1I
 4Rjo2WK2rj/bXROo9fWeyQlmZAGeznpYwpz8UiC0aimn+tuLfIj8jlrg9ImDk/bhiwy5
 QHNA2/9yAWpGWIOL2OPKITdOJQUWEQ8tCvMctaZQINdPPI2cMm+Y8DVuoMxbrBLc/wtr
 UHiYM06mkBji2qcew42plviKigcIknDMnN1sdBsBx3/wpsFlD3qOxvsJfG9gHJOdx/by
 MSsw==
X-Gm-Message-State: AOAM533y0pG73FhBjD33cFY8QDB5V4WBCZEhoxUj20F3bNJlsFLwTCj6
 pvbsGWMdYseswWMxD7X2GOP95A==
X-Google-Smtp-Source: ABdhPJzakESrY6Q4Z0JPv3VQ8FSPfN4KSeVGHEBzuZZgtcKzaR5PHtbi8x3ngI/je8nStQAUQ3Ia+Q==
X-Received: by 2002:a17:903:124a:b0:151:99fe:1a10 with SMTP id
 u10-20020a170903124a00b0015199fe1a10mr18262973plh.87.1647959235054; 
 Tue, 22 Mar 2022 07:27:15 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a056a00179400b004f709998d13sm24471161pfg.10.2022.03.22.07.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:27:14 -0700 (PDT)
Message-ID: <b2ceef95-eacc-cc41-5a00-2f2adfee6e64@linaro.org>
Date: Tue, 22 Mar 2022 07:27:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/1] fix cmpxchg and lock cmpxchg instruction
Content-Language: en-US
To: Wei Li <lw945lw945@yahoo.com>, pbonzini@redhat.com, eduardo@habkost.net
References: <20220322042008.399857-1-lw945lw945@yahoo.com>
 <20220322042008.399857-2-lw945lw945@yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322042008.399857-2-lw945lw945@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 21:20, Wei Li wrote:
> One question is that we can reduce more code duplication if we use
> 
> ---------
> if(foo){
>      ....
>      tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>                                s->mem_index, ot | MO_LE);
>      gen_extu(ot, oldv);
>      gen_extu(ot, cmpv);
> }else{
>      ....
>      tcg_gen_movcond_tl(TCG_COND_EQ, newv, old, cmpv, newv, oldv);
>      gen_op_mov_reg_v(s, ot, rm, newv);
> }
> gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
>                      temp, cpu_regs[R_EAX]);
> --------
> 
> The problem is gen_op_mov_reg_v(s, ot, rm, newv) will happen before
> gen_op_mov_reg_v(s, ot, R_EAX, oldv). According to SDM, write to R_EAX
> should happen before write to rm. I am not sure about its side effects.

There are no side effects beyond the store into RM.
I do prefer the structure above.


r~

> 
> All in all, if there is no side effect, we can use the code above to
> reduce more code duplication. Or we use the code below to ensure
> correctness.
> 
> Signed-off-by: Wei Li <lw945lw945@yahoo.com>
> ---
>   target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 2a94d33742..6633d8ece6 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5339,7 +5339,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0x1b0:
>       case 0x1b1: /* cmpxchg Ev, Gv */
>           {
> -            TCGv oldv, newv, cmpv;
> +            TCGv oldv, newv, cmpv, temp;
>   
>               ot = mo_b_d(b, dflag);
>               modrm = x86_ldub_code(env, s);
> @@ -5348,41 +5348,42 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               oldv = tcg_temp_new();
>               newv = tcg_temp_new();
>               cmpv = tcg_temp_new();
> +            temp = tcg_temp_new();
>               gen_op_mov_v_reg(s, ot, newv, reg);
>               tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
> +            tcg_gen_mov_tl(temp, cpu_regs[R_EAX]);
>   
> -            if (s->prefix & PREFIX_LOCK) {
> +            if ((s->prefix & PREFIX_LOCK) ||
> +                (mod != 3)) {
> +                /* Use the tcg_gen_atomic_cmpxchg_tl path whenever mod != 3.
> +                   While an unlocked cmpxchg need not be atomic, it is not
> +                   required to be non-atomic either. */
>                   if (mod == 3) {
>                       goto illegal_op;
>                   }
>                   gen_lea_modrm(env, s, modrm);
>                   tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>                                             s->mem_index, ot | MO_LE);
> +                gen_extu(ot, oldv);
> +                gen_extu(ot, cmpv);
> +                /* Perform the merge into %al or %ax as required by ot. */
>                   gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> +                /* Undo the entire modification to %rax if comparison equal. */
> +                tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
> +                                    temp, cpu_regs[R_EAX]);
>               } else {
> -                if (mod == 3) {
> -                    rm = (modrm & 7) | REX_B(s);
> -                    gen_op_mov_v_reg(s, ot, oldv, rm);
> -                } else {
> -                    gen_lea_modrm(env, s, modrm);
> -                    gen_op_ld_v(s, ot, oldv, s->A0);
> -                    rm = 0; /* avoid warning */
> -                }
> +                rm = (modrm & 7) | REX_B(s);
> +                gen_op_mov_v_reg(s, ot, oldv, rm);
>                   gen_extu(ot, oldv);
>                   gen_extu(ot, cmpv);
>                   /* store value = (old == cmp ? new : old);  */
>                   tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
> -                if (mod == 3) {
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> -                    gen_op_mov_reg_v(s, ot, rm, newv);
> -                } else {
> -                    /* Perform an unconditional store cycle like physical cpu;
> -                       must be before changing accumulator to ensure
> -                       idempotency if the store faults and the instruction
> -                       is restarted */
> -                    gen_op_st_v(s, ot, newv, s->A0);
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> -                }
> +                /* Perform the merge into %al or %ax as required by ot. */
> +                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> +                /* Undo the entire modification to %rax if comparison equal. */
> +                tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
> +                                    temp, cpu_regs[R_EAX]);
> +                gen_op_mov_reg_v(s, ot, rm, newv);
>               }
>               tcg_gen_mov_tl(cpu_cc_src, oldv);
>               tcg_gen_mov_tl(s->cc_srcT, cmpv);
> @@ -5391,6 +5392,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               tcg_temp_free(oldv);
>               tcg_temp_free(newv);
>               tcg_temp_free(cmpv);
> +            tcg_temp_free(temp);
>           }
>           break;
>       case 0x1c7: /* cmpxchg8b */


