Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777BF5A0924
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:51:04 +0200 (CEST)
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6hj-0003ta-12
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6bl-0001aw-HI
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:44:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6bj-0000OM-LP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:44:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id az27so3317714wrb.6
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=qGlnCp7F5pROvqK9rTMK9p3j7TxnlQGIBYi26Ximlqw=;
 b=ICmHpDpOXdRrf8d6ErJcbHp7BMlR5d746/FV2tNYQ62Nmik2DVW3Trz9LG6fxaZhYI
 dvX+06DPm9OGHgahnLh8gPFDm8XVtbuITtenRpFRJxZMPbbcK7M+LxgrH7vSzxcig9Ur
 5l6JcUtvpzsDXrzfVBbMkshyuQE3zd5Hqct8LtqP9tWZ6j0DA/N+8b0Fm069N8TDyXn9
 VmsZLqVBIr9gYciLgCueoejhEfGI3Bqv/FguMc5onJN4SuyHJSdBUa9RF2jFTPXnSBao
 gKSaBE9i+uIcveZdaeW9hbT0WBR58xVGBXmOT+CdkVqNWGinoZMo38dYeksylh6NVVAw
 n9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=qGlnCp7F5pROvqK9rTMK9p3j7TxnlQGIBYi26Ximlqw=;
 b=Ivd0bfxTglb98J8C7M4YTWClbzZBm3HkJ6VhmI5vP0khOfOxIO4wCyF4YhbgxZEIq+
 4BgDnAyWbDlCGz79CE7/mGo25I9Xstk1pFxIsS0b4At1C8ZxwY04fD3aERKT02+M3UVn
 Kk50lqadky8J+Lk+UHMIELazdcqudP7rNK6Abs5UuFhjqvLX7qGxrNooQPCpAoDIPs0p
 9abUPLkS4YDFyYEYDNP04sCfb0vzLHxDkeH3oqVLHXRRCqOjYz/+5r1Oo62WKW6jDNkK
 dgeXZlBaX1pBJQzyrWP42cGJV9duSGfsYLKxdE2auNs7ESiVkTmYS4xMD5jTovQb4BTW
 t3BA==
X-Gm-Message-State: ACgBeo3j6uzx0d7j1nyIMFuXPM0vOQohoODzoOYCVyOTxKnPQ3Rn5T9N
 yWP64sJlqTwjmmCuZbBpvlg=
X-Google-Smtp-Source: AA6agR7Xm4yGq7rGpdYWXNaBIIiXosvFd5rg1sXNRxn5w3DtAsNLYokqs+bIjCdr6K209ARKuszb+Q==
X-Received: by 2002:adf:ee50:0:b0:225:7508:9d88 with SMTP id
 w16-20020adfee50000000b0022575089d88mr1260048wro.320.1661409890054; 
 Wed, 24 Aug 2022 23:44:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020adfdd08000000b0022537d826f3sm16480287wrm.23.2022.08.24.23.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:44:49 -0700 (PDT)
Message-ID: <7590980f-8038-b504-4a22-401d2d806a18@redhat.com>
Date: Thu, 25 Aug 2022 08:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 03/17] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-4-pbonzini@redhat.com>
 <c2ee77f9-9c46-0b67-468a-85d13a58dd6a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c2ee77f9-9c46-0b67-468a-85d13a58dd6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 03:47, Richard Henderson wrote:
> On 8/24/22 10:31, Paolo Bonzini wrote:
>> diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
>> index 603642d6e1..fb86855501 100644
>> --- a/target/i386/tcg/decode-old.c.inc
>> +++ b/target/i386/tcg/decode-old.c.inc
>> @@ -1808,10 +1808,24 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>>    
>>        prefixes = 0;
>>    
>> +    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
>> +    bool use_new = true;
>>     next_byte:
>> +    s->prefix = prefixes;
>>        b = x86_ldub_code(env, s);
>>        /* Collect prefixes.  */
>>        switch (b) {
>> +    default:
>> +#ifdef CONFIG_USER_ONLY
>> +        use_new &= limit > 0;
>> +#else
>> +        use_new &= b <= limit;
>> +#endif
>> +        if (use_new && 0) {
>> +            return disas_insn_new(s, cpu, b);
>> +        }
> 
> Is this use_new/limit thing actually helpful?

Extremely so. :)  When debugging, it is very fast and satisfying to run 
a simple bisection script (see below) that tells you exactly which 
instruction is mistranslated.

In an actual series for commit I would add use_new/limit as a PATCH 
18/17, but for the RFC "how to debug this thing" seemed like an 
interesting topic of its own.

> I would have thought it would be helpful to block out adjusted opcodes
> in the old decoder switch, and remove old code.  E.g. below.  That would
> make it obvious what remains to be done.
> 
>>        case 0xc5: /* 2-byte VEX */
>>        case 0xc4: /* 3-byte VEX */
>> +        use_new = false;
> 
> Why?  You have support for By in the new decoder.

Because it doesn't pass down VEX.mmmmm as you point out below.  But 
really it's simpler to move all the VEX opcodes to the new decoder and 
remove all traces of it from the decoder.  I have already done that but 
I want to write a testcase first.

Paolo

#! /bin/bash
run() {
   "$@" > /dev/null
   if test $? = 0; then
     x=ok     # or "read x" sometimes
   else
     x=bad
   fi
}

high=1
while :; do
   low=$high
   high=$(($high * 2))
   echo $low..?, trying $high
   LIMIT=$high run "$@"
   if test "$x" != ok; then
       break
   fi
done
while test $low != $high; do
   mid=$(( ( $low + $high ) / 2 ))
   echo $low..$high, trying $mid
   LIMIT=$mid run "$@"
   if test "$x" = ok; then
       low=$(( $mid + 1 ))
   else
       high=$mid
   fi
done
echo reproducer: LIMIT=$low "$@"

> In the medium term, I wonder about passing in the vex.mmmmm argument,
> so you can start someplace other than root.  Long term, that would go
> away again when prefix processing is re-integrated with the new decoder.
> 
> 
> r~
> 
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 9b925c7ec8..04626fa086 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -2816,7 +2816,6 @@ static inline void gen_op_movq_env_0(DisasContext *s, int d_offset)
>       tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset);
>   }
>   
> -static bool first = true; static unsigned long limit;
>   #include "decode-new.c.inc"
>   #include "decode-old.c.inc"
>   
> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
> index b8726608bb..1195fea7c7 100644
> --- a/target/i386/tcg/decode-new.c.inc
> +++ b/target/i386/tcg/decode-new.c.inc
> @@ -819,9 +819,6 @@ static target_ulong disas_insn_new(DisasContext *s, CPUState *cpu, int b)
>       X86DecodedInsn decode;
>       X86DecodeFunc decode_func = decode_root;
>   
> -#ifdef CONFIG_USER_ONLY
> -    --limit;
> -#endif
>       s->has_modrm = false;
>   #if 0
>       s->pc_start = s->pc = s->base.pc_next;
> diff --git a/target/i386/tcg/decode-old.c.inc b/target/i386/tcg/decode-old.c.inc
> index c97289a3e4..b96c677915 100644
> --- a/target/i386/tcg/decode-old.c.inc
> +++ b/target/i386/tcg/decode-old.c.inc
> @@ -1808,24 +1808,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   
>       prefixes = 0;
>   
> -    if (first) first = false, limit = getenv("LIMIT") ? atol(getenv("LIMIT")) : -1;
> -    bool use_new = true;
>    next_byte:
>       s->prefix = prefixes;
>       b = x86_ldub_code(env, s);
>       /* Collect prefixes.  */
>       switch (b) {
> -    default:
> -#ifdef CONFIG_USER_ONLY
> -        use_new &= limit > 0;
> -#else
> -        use_new &= b <= limit;
> -#endif
> -        if (use_new && b <= 0x1f) {
> -            return disas_insn_new(s, cpu, b);
> -        }
> -    case 0x0f:
> -        break;
>       case 0xf3:
>           prefixes |= PREFIX_REPZ;
>           prefixes &= ~PREFIX_REPNZ;
> @@ -1876,7 +1863,6 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>   #endif
>       case 0xc5: /* 2-byte VEX */
>       case 0xc4: /* 3-byte VEX */
> -        use_new = false;
>           /* VEX prefixes cannot be used except in 32-bit mode.
>              Otherwise the instruction is LES or LDS.  */
>           if (CODE32(s) && !VM86(s)) {
> @@ -1969,12 +1955,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>           b = x86_ldub_code(env, s) | 0x100;
>           goto reswitch;
>   
> +    case 0x00 ... 0x0e:
> +    case 0x10 ... 0x1f:
> +        return disas_insn_new(s, cpu, b);
> +
>           /**************************/
>           /* arith & logic */
> -    case 0x00 ... 0x05:
> -    case 0x08 ... 0x0d:
> -    case 0x10 ... 0x15:
> -    case 0x18 ... 0x1d:
>       case 0x20 ... 0x25:
>       case 0x28 ... 0x2d:
>       case 0x30 ... 0x35:
> @@ -2764,40 +2750,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       case 0xc9: /* leave */
>           gen_leave(s);
>           break;
> -    case 0x06: /* push es */
> -    case 0x0e: /* push cs */
> -    case 0x16: /* push ss */
> -    case 0x1e: /* push ds */
> -        if (CODE64(s))
> -            goto illegal_op;
> -        gen_op_movl_T0_seg(s, b >> 3);
> -        gen_push_v(s, s->T0);
> -        break;
>       case 0x1a0: /* push fs */
>       case 0x1a8: /* push gs */
>           gen_op_movl_T0_seg(s, (b >> 3) & 7);
>           gen_push_v(s, s->T0);
>           break;
> -    case 0x07: /* pop es */
> -    case 0x17: /* pop ss */
> -    case 0x1f: /* pop ds */
> -        if (CODE64(s))
> -            goto illegal_op;
> -        reg = b >> 3;
> -        ot = gen_pop_T0(s);
> -        gen_movl_seg_T0(s, reg);
> -        gen_pop_update(s, ot);
> -        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
> -        if (s->base.is_jmp) {
> -            gen_jmp_im(s, s->pc - s->cs_base);
> -            if (reg == R_SS) {
> -                s->flags &= ~HF_TF_MASK;
> -                gen_eob_inhibit_irq(s, true);
> -            } else {
> -                gen_eob(s);
> -            }
> -        }
> -        break;
>       case 0x1a1: /* pop fs */
>       case 0x1a9: /* pop gs */
>           ot = gen_pop_T0(s);
> 
> 


