Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3F4EE0B0
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:37:23 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzfe-0000hC-ND
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:37:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZzXb-00049v-1S; Thu, 31 Mar 2022 14:29:03 -0400
Received: from [187.72.171.209] (port=5506 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZzXY-00044C-47; Thu, 31 Mar 2022 14:29:02 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 15:28:54 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id A5BDB800013;
 Thu, 31 Mar 2022 15:28:53 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------bn8ybOrTIuHz2F9fs8Jf81Ps"
Message-ID: <1c97acad-23b9-9569-fa6c-4dddac79ddac@eldorado.org.br>
Date: Thu, 31 Mar 2022 15:28:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/10] target/ppc: Implemented vector divide instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
 <20220330202515.66554-4-lucas.araujo@eldorado.org.br>
 <cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org>
X-OriginalArrivalTime: 31 Mar 2022 18:28:54.0234 (UTC)
 FILETIME=[2D3E6BA0:01D8452D]
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
--------------bn8ybOrTIuHz2F9fs8Jf81Ps
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/03/2022 18:06, Richard Henderson wrote:
>
> On 3/30/22 14:25, Lucas Mateus Castro(alqotel) wrote:
>> +#define TRANS_VDIV_VMOD(FLAGS, NAME, VECE, FNI4_FUNC, 
>> FNI8_FUNC)        \
>> +static bool trans_##NAME(DisasContext *ctx, arg_VX 
>> *a)                  \
>> +{ \
>> +    static const GVecGen3 op[2] = 
>> {                                     \
>> + { \
>> +            .fni4 = 
>> FNI4_FUNC,                                          \
>> +            .fni8 = 
>> FNI8_FUNC,                                          \
>> +            .vece = 
>> MO_32                                               \
>> + }, \
>> + { \
>> +            .fni4 = 
>> FNI4_FUNC,                                          \
>> +            .fni8 = 
>> FNI8_FUNC,                                          \
>> +            .vece = 
>> MO_64                                               \
>> + }, \
>> + }; \
>
> There is zero point in having a two element array here:
> (1) VECE is a constant
> (2) The unused array element is actively wrong.
Ok, I'll set VECE based on which function is NULL
>
>> +#define DIV_VEC(NAME, SZ, 
>> DIV)                                          \
>> +static void do_vx_##NAME(TCGv_##SZ t, TCGv_##SZ a, TCGv_##SZ 
>> b)         \
>> +{ \
>> +    TCGv_##SZ zero = tcg_constant_##SZ(0), one = 
>> tcg_constant_##SZ(1);  \
>> + /* \
>> +     *  If N/0 the instruction used by the backend might 
>> deliver        \
>> +     *  a signal to the process and the hardware returns 0 
>> when         \
>> +     *  N/0, so if b = 0 return 
>> 0/1                                     \
>> + */ \
>> +    tcg_gen_movcond_##SZ(TCG_COND_EQ, a, b, zero, zero, 
>> a);             \
>> +    tcg_gen_movcond_##SZ(TCG_COND_EQ, b, b, zero, one, 
>> b);              \
>> +    DIV(t, a, 
>> b);                                                       \
>> +}
>
> The manual says N/0 = undefined.  I don't think it's important to 
> require 0.
My idea here was mostly to mimic the hardware behavior, testing on a 
Power9 both divw and divd result in 0 when N/0 and mambo results in 0 in 
vdiv* and vmod* when N/0, but yeah the PowerISA just said that it's 
undefined. I'll just set b = 1 if N/0 or int_min/-1 in v2 then.
>
> The signed versions still need to check for int_min / -1, which will 
> fault on x86.
> Compare vs gen_op_arith_div{w,d}.
My mistake, I'll add this check in v2
>
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------bn8ybOrTIuHz2F9fs8Jf81Ps
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/03/2022 18:06, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org"><br>
      On 3/30/22 14:25, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">+#define TRANS_VDIV_VMOD(FLAGS, NAME,
        VECE, FNI4_FUNC, FNI8_FUNC)        \
        <br>
        +static bool trans_##NAME(DisasContext *ctx, arg_VX
        *a)                  \
        <br>
+{                                                                      
        \
        <br>
        +    static const GVecGen3 op[2] =
        {                                     \
        <br>
        +       
        {                                                              
        \
        <br>
        +            .fni4 =
        FNI4_FUNC,                                          \
        <br>
        +            .fni8 =
        FNI8_FUNC,                                          \
        <br>
        +            .vece =
        MO_32                                               \
        <br>
        +       
        },                                                             
        \
        <br>
        +       
        {                                                              
        \
        <br>
        +            .fni4 =
        FNI4_FUNC,                                          \
        <br>
        +            .fni8 =
        FNI8_FUNC,                                          \
        <br>
        +            .vece =
        MO_64                                               \
        <br>
        +       
        },                                                             
        \
        <br>
        +   
        };                                                                 
        \
        <br>
      </blockquote>
      <br>
      There is zero point in having a two element array here:
      <br>
      (1) VECE is a constant
      <br>
      (2) The unused array element is actively wrong.
      <br>
    </blockquote>
    Ok, I'll set VECE based on which function is NULL<br>
    <blockquote type="cite"
      cite="mid:cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org">
      <br>
      <blockquote type="cite">+#define DIV_VEC(NAME, SZ,
        DIV)                                          \
        <br>
        +static void do_vx_##NAME(TCGv_##SZ t, TCGv_##SZ a, TCGv_##SZ
        b)         \
        <br>
+{                                                                      
        \
        <br>
        +    TCGv_##SZ zero = tcg_constant_##SZ(0), one =
        tcg_constant_##SZ(1);  \
        <br>
        +   
        /*                                                                 
        \
        <br>
        +     *  If N/0 the instruction used by the backend might
        deliver        \
        <br>
        +     *  a signal to the process and the hardware returns 0
        when         \
        <br>
        +     *  N/0, so if b = 0 return
        0/1                                     \
        <br>
        +    
        */                                                                
        \
        <br>
        +    tcg_gen_movcond_##SZ(TCG_COND_EQ, a, b, zero, zero,
        a);             \
        <br>
        +    tcg_gen_movcond_##SZ(TCG_COND_EQ, b, b, zero, one,
        b);              \
        <br>
        +    DIV(t, a,
        b);                                                       \
        <br>
        +}
        <br>
      </blockquote>
      <br>
      The manual says N/0 = undefined.  I don't think it's important to
      require 0.
      <br>
    </blockquote>
    My idea here was mostly to mimic the hardware behavior, testing on a
    Power9 both divw and divd result in 0 when N/0 and mambo results in
    0 in vdiv* and vmod* when N/0, but yeah the PowerISA just said that
    it's undefined. I'll just set b = 1 if N/0 or int_min/-1 in v2 then.<br>
    <blockquote type="cite"
      cite="mid:cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org">
      <br>
      The signed versions still need to check for int_min / -1, which
      will fault on x86.
      <br>
      Compare vs gen_op_arith_div{w,d}.
      <br>
    </blockquote>
    My mistake, I'll add this check in v2<br>
    <blockquote type="cite"
      cite="mid:cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org">
      <br>
      <br>
      r~
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

--------------bn8ybOrTIuHz2F9fs8Jf81Ps--

