Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A39508AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:27:08 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBIR-0006QR-8i
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhAd8-0001st-QX; Wed, 20 Apr 2022 09:44:27 -0400
Received: from [187.72.171.209] (port=19505 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhAd6-0007md-4Z; Wed, 20 Apr 2022 09:44:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 10:43:15 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 3CA89800059;
 Wed, 20 Apr 2022 10:43:15 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------7xAbUzNWJ9aPoSudQg9ho04c"
Message-ID: <07834a8e-0170-02d3-b62c-28fe2ab93baa@eldorado.org.br>
Date: Wed, 20 Apr 2022 10:43:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/9] target/ppc: Implemented vector divide instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-3-lucas.araujo@eldorado.org.br>
 <f8f924b4-3cfb-0946-4e54-247453880925@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <f8f924b4-3cfb-0946-4e54-247453880925@linaro.org>
X-OriginalArrivalTime: 20 Apr 2022 13:43:15.0492 (UTC)
 FILETIME=[9604EE40:01D854BC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------7xAbUzNWJ9aPoSudQg9ho04c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/04/2022 22:51, Richard Henderson wrote:
>
> On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
>
>> +
>> +#define DO_VDIV_VMOD(NAME, SZ, DIV, 
>> SIGNED)                             \
>> +static void NAME(TCGv_i##SZ t, TCGv_i##SZ a, TCGv_i##SZ 
>> b)              \
>> +{ \
>> + /* \
>> +     *  If N/0 the instruction used by the backend might 
>> deliver        \
>> +     *  an invalid division signal to the process, so if b = 0 
>> return   \
>> +     *  N/1 and if signed instruction, the same for a = int_min, b = 
>> -1 \
>> + */ \
>> +    if (SIGNED) 
>> {                                                       \
>> +        TCGv_i##SZ t0 = 
>> tcg_temp_new_i##SZ();                           \
>> +        TCGv_i##SZ t1 = 
>> tcg_temp_new_i##SZ();                           \
>> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t0, a, 
>> INT##SZ##_MIN);      \
>> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, 
>> -1);                 \
>> +        tcg_gen_and_i##SZ(t0, t0, 
>> t1);                                  \
>> +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b, 
>> 0);                  \
>> +        tcg_gen_or_i##SZ(t0, t0, 
>> t1);                                   \
>> +        tcg_gen_movi_i##SZ(t1, 
>> 0);                                      \
>> +        tcg_gen_movcond_i##SZ(TCG_COND_NE, b, t0, t1, t0, 
>> b);           \
>> +        DIV(t, a, 
>> b);                                                   \
>> + tcg_temp_free_i##SZ(t0); \
>> + tcg_temp_free_i##SZ(t1); \
>> +    } else 
>> {                                                            \
>> +        TCGv_i##SZ zero = 
>> tcg_constant_i##SZ(0);                        \
>> +        TCGv_i##SZ one = 
>> tcg_constant_i##SZ(1);                         \
>> +        tcg_gen_movcond_i##SZ(TCG_COND_EQ, b, b, zero, one, 
>> b);         \
>> +        DIV(t, a, 
>> b);                                                   \
>> + } \
>> +}
>
> This is overkill.  Even if you keep some macros, passing in SIGNED and 
> using it in the
> outermost if is a sign you should split the macro in two.
>
> However, only tcg_gen_div_i64 really requires the full signed 
> treatment; tcg_gen_div_i32
> can be better handled by extending to i64, because INT32_MIN / -1ULL 
> does not trap.
>
> I think this would be much easier to read as 4 separate functions.
>
>
Ok, I'll change it to 4 different macros, move clz128 to int128.h and 
turn TRANS_VDIV_VMOD into do_vdiv_vmod function and call it with TRANS() 
in v3
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------7xAbUzNWJ9aPoSudQg9ho04c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/04/2022 22:51, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f8f924b4-3cfb-0946-4e54-247453880925@linaro.org"><br>
      On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        +#define DO_VDIV_VMOD(NAME, SZ, DIV,
        SIGNED)                             \
        <br>
        +static void NAME(TCGv_i##SZ t, TCGv_i##SZ a, TCGv_i##SZ
        b)              \
        <br>
+{                                                                      
        \
        <br>
        +   
        /*                                                                 
        \
        <br>
        +     *  If N/0 the instruction used by the backend might
        deliver        \
        <br>
        +     *  an invalid division signal to the process, so if b = 0
        return   \
        <br>
        +     *  N/1 and if signed instruction, the same for a =
        int_min, b = -1 \
        <br>
        +    
        */                                                                
        \
        <br>
        +    if (SIGNED)
        {                                                       \
        <br>
        +        TCGv_i##SZ t0 =
        tcg_temp_new_i##SZ();                           \
        <br>
        +        TCGv_i##SZ t1 =
        tcg_temp_new_i##SZ();                           \
        <br>
        +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t0, a,
        INT##SZ##_MIN);      \
        <br>
        +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b,
        -1);                 \
        <br>
        +        tcg_gen_and_i##SZ(t0, t0,
        t1);                                  \
        <br>
        +        tcg_gen_setcondi_i##SZ(TCG_COND_EQ, t1, b,
        0);                  \
        <br>
        +        tcg_gen_or_i##SZ(t0, t0,
        t1);                                   \
        <br>
        +        tcg_gen_movi_i##SZ(t1,
        0);                                      \
        <br>
        +        tcg_gen_movcond_i##SZ(TCG_COND_NE, b, t0, t1, t0,
        b);           \
        <br>
        +        DIV(t, a,
        b);                                                   \
        <br>
        +       
        tcg_temp_free_i##SZ(t0);                                       
        \
        <br>
        +       
        tcg_temp_free_i##SZ(t1);                                       
        \
        <br>
        +    } else
        {                                                            \
        <br>
        +        TCGv_i##SZ zero =
        tcg_constant_i##SZ(0);                        \
        <br>
        +        TCGv_i##SZ one =
        tcg_constant_i##SZ(1);                         \
        <br>
        +        tcg_gen_movcond_i##SZ(TCG_COND_EQ, b, b, zero, one,
        b);         \
        <br>
        +        DIV(t, a,
        b);                                                   \
        <br>
        +   
        }                                                                  
        \
        <br>
        +}
        <br>
      </blockquote>
      <br>
      This is overkill.  Even if you keep some macros, passing in SIGNED
      and using it in the
      <br>
      outermost if is a sign you should split the macro in two.
      <br>
      <br>
      However, only tcg_gen_div_i64 really requires the full signed
      treatment; tcg_gen_div_i32
      <br>
      can be better handled by extending to i64, because INT32_MIN /
      -1ULL does not trap.
      <br>
      <br>
      I think this would be much easier to read as 4 separate functions.
      <br>
      <br>
      <br>
    </blockquote>
    Ok, I'll change it to 4 different macros, move clz128 to int128.h
    and turn TRANS_VDIV_VMOD into do_vdiv_vmod function and call it with
    TRANS() in v3 <br>
    <blockquote type="cite"
      cite="mid:f8f924b4-3cfb-0946-4e54-247453880925@linaro.org">r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------7xAbUzNWJ9aPoSudQg9ho04c--

