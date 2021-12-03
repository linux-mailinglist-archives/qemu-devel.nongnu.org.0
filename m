Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8846786E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:34:05 +0100 (CET)
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8hQ-0004Qx-KA
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt8VE-0000U7-OP
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 08:21:30 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41774
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mt8VC-0005Vj-TM
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 08:21:28 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2523381pjb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 05:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NNFDlkZ0Pc2zqhYZJS1IKFUdfHbrOpQzxWN0ZOjztf4=;
 b=PSnwq1WzA1A2Q4fd+UnHskS1Ik4ob14dHScfJXITVfHhdkGHzv1ikfqMKFQVMwwPH5
 noR1U5d2lDBSIa4AS2btQ9dAGNlSKaHB/5HGjY2gO/R79V1t+pArEA5EQ5C0+Rx6e7Hc
 Z40XWz97+OcHzUmZ5zx5etP6OfZjuox7xtnP/Hf08UDs572eShgt675WCKA4hAAEAd/P
 urq9B8pA1cYupGmoAkH5cN0/KBBptlquN3in9epvi6Ay3pdOr/MNKDSHtOnFynd3LQ3E
 xqPCN/Y28uXWxvmpFPbH4lYguTQnHvZh5Vipw7z3dnrBYllRicsiOpD2Xq+GUcc3wb6F
 Dedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNFDlkZ0Pc2zqhYZJS1IKFUdfHbrOpQzxWN0ZOjztf4=;
 b=L98p0vk9EUD58HT9YEz0Fni16iWDcn2OLKNFVeYgZnGAa2cLUiXORTIZ/dcjSGEybc
 7W6PdrDCqbmyfH9Bt6wSqDci3XZwzCY8Yhf0L/VCWNY9EWPDwWq5jMQMr0qkcpa45rcl
 4aXc28JYwrRUSGvRx+bJuYoonOWn/qJk0HGAUI0jLgFAXhNAKPO+zD2ANPqFhXl7KU5I
 wK6aeb6uiZtejYZTYjbuqusdBz++0B0k8DNAuopylUvwLJulrIj/EjE3bXt7kTHolCwl
 ZETQMdWpyFEowjNi3cFTTazD20OOrH79PZpFaBAlgQ46/4w5ObDGieK0YYjHDK7wqSnl
 dqRA==
X-Gm-Message-State: AOAM531lHiIlg41X24Xb1DLlWIroLTYJbiOlOMU/zxTcAsyQUI5LqoWd
 Nac6An8MIPESJxM5cjo6Huimww==
X-Google-Smtp-Source: ABdhPJzwqIyZlqk6LrdnVUrRPABMI/m7dfGdaE8kArLsvTkLzfzjKqeIe4loKP5ZwgUBYhHhthfkYA==
X-Received: by 2002:a17:903:30cd:b0:141:c6dd:4d03 with SMTP id
 s13-20020a17090330cd00b00141c6dd4d03mr22915354plc.16.1638537685026; 
 Fri, 03 Dec 2021 05:21:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id j20sm672541pjl.3.2021.12.03.05.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 05:21:24 -0800 (PST)
Subject: Re: [PATCH v2 2/3] target/ppc: Implement Vector Extract Mask
From: Richard Henderson <richard.henderson@linaro.org>
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211112141430.631732-1-matheus.ferst@eldorado.org.br>
 <20211112141430.631732-3-matheus.ferst@eldorado.org.br>
 <8b929a58-efaa-08af-2183-de4fe1a8389d@linaro.org>
Message-ID: <21871d3f-b1d6-8ac2-ddda-c8c356726785@linaro.org>
Date: Fri, 3 Dec 2021 05:21:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8b929a58-efaa-08af-2183-de4fe1a8389d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 5:00 AM, Richard Henderson wrote:
> On 11/12/21 6:14 AM, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Implement the following PowerISA v3.1 instructions:
>> vextractbm: Vector Extract Byte Mask
>> vextracthm: Vector Extract Halfword Mask
>> vextractwm: Vector Extract Word Mask
>> vextractdm: Vector Extract Doubleword Mask
>> vextractqm: Vector Extract Quadword Mask
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> v2:
>> - Applied rth suggestion to do_vextractm
>> ---
>>   target/ppc/insn32.decode            |  6 +++
>>   target/ppc/translate/vmx-impl.c.inc | 60 +++++++++++++++++++++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index 9a28f1d266..639ac22bf0 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -419,6 +419,12 @@ VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
>>   VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
>>   VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
>> +VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
>> +VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
>> +VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
>> +VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
>> +VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
>> +
>>   # VSX Load/Store Instructions
>>   LXV             111101 ..... ..... ............ . 001   @DQ_TSX
>> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
>> index 58aca58f0f..dd7337c2f2 100644
>> --- a/target/ppc/translate/vmx-impl.c.inc
>> +++ b/target/ppc/translate/vmx-impl.c.inc
>> @@ -1539,6 +1539,66 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
>>       return true;
>>   }
>> +static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>> +{
>> +    const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece;
>> +    TCGv_i64 t, b, tmp;
>> +
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
>> +    REQUIRE_VECTOR(ctx);
>> +
>> +    t = tcg_const_i64(0);
>> +    b = tcg_temp_new_i64();
>> +    tmp = tcg_temp_new_i64();
>> +
>> +    for (int w = 0; w < 2; w++) {
>> +        get_avr64(b, a->vrb, w);
>> +
>> +        for (int i = 0; i < elem_count_half; i++) {
>> +            int in_bit = (i + 1) * elem_width - 1;
>> +            int out_bit = w * elem_count_half + i;
>> +
>> +            if (in_bit > out_bit) {
>> +                tcg_gen_shri_i64(tmp, b, in_bit - out_bit);
>> +            } else {
>> +                tcg_gen_shli_i64(tmp, b, out_bit - in_bit);
>> +            }
>> +            tcg_gen_andi_i64(tmp, tmp, 1 << out_bit);
>> +            tcg_gen_or_i64(t, t, tmp);
>> +        }
>> +    }
>> +    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], t);
> 
> Pardon me.  I realized after the fact that we can run the same algorithm as for mtvsrm (in 
> the next patch) in reverse.
> 
>    & dup(1)
> .......a.......b.......c.......d.......e.......f.......g.......h
>    >> 32 - 4
> ...................................a.......b.......c.......d....
>    |
> .......a.......b.......c.......d...a...e...b...f...c...g...d...h
>    >> 16 - 2
> .....................a.......b.......c.......d...a...e...b...f..
>    |
> .......a.......b.....a.c.....b.d...a.c.e...b.d.f.a.c.e.g.b.d.f.h
>    >> 8 - 1
> ..............a.......b.....a.c.....b.d...a.c.e...b.d.f.a.c.e.g.
>    |
> .......a......ab.....abc....abcd...abcde..abcdef.abcdefgabcdefgh
>    & 0xff
> ........................................................abcdefgh
> 
> where one of the two final masks can be done via deposit:
> 
>      tcg_gen_andi_i64(hi, hi, 0xff);
>      tcg_gen_deposit_i64(lo, lo, hi, 8, 56);
> 
> Which will reduce the instruction count of this implementation by half.

Oops, ENOCOFFEE.  Of course the input bit comes from the msb of the element, not the lsb. 
  Three different options:

(1) Begin with a shift of elem_count_half - 1, then do the above,

(2) Change the initial mask to the msb, then extract from elem_count_half - 1.

(3) Do left shifts so that we collect the bits at the msb of
     the word.  This probably results in the easiest concatenation
     in the end:

     tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
     tcg_gen_extract2_i64(lo, lo, hi, 64 - 2 * elem_count_half);


r~

