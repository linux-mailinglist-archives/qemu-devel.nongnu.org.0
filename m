Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6A7522292
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:27:28 +0200 (CEST)
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTdv-0003CV-0g
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTbm-00029q-GG; Tue, 10 May 2022 13:25:14 -0400
Received: from [187.72.171.209] (port=14924 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTbk-0002t1-88; Tue, 10 May 2022 13:25:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 10 May 2022 14:25:05 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 1AD5780046B;
 Tue, 10 May 2022 14:25:05 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------x7AmFG2VKNQsiWcQEkKTyR5M"
Message-ID: <f2b58c8a-ead7-326d-db0f-a706fe09c992@eldorado.org.br>
Date: Tue, 10 May 2022 14:25:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 7/7] target/ppc: Implemented [pm]xvbf16ger2*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-8-lucas.araujo@eldorado.org.br>
 <461a810f-6ca0-98cc-4144-18062b165ad7@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <461a810f-6ca0-98cc-4144-18062b165ad7@linaro.org>
X-OriginalArrivalTime: 10 May 2022 17:25:05.0356 (UTC)
 FILETIME=[E39400C0:01D86492]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------x7AmFG2VKNQsiWcQEkKTyR5M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/05/2022 01:27, Richard Henderson wrote:
> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>>
>> There's a discrepancy between this implementation and mambo/the
>> hardware where implementing it with float64_mul then float64r32_muladd
>> sometimes results in an incorrect result after an underflow, but
>> implementing with float32_mul then float32_muladd results in incorrect
>> signal in some 0 or infinite results. I've not been able to solve this
>
> I did suggest that the float64_mul needs to be done in round-to-odd.

 From what I understood, you meant:

     rmode = get_float_rounding_mode(&status);
     set_float_rounding_mode(float_round_to_odd, &status);
     psum = float64_mul(va, vb, &status);
     set_float_rounding_mode(rmode, &status);
     psum = float64r32_muladd(vc, vd, psum, 0, &status);

Which doesn't solve the problem, I tried other solutions but overall I 
found 3 test cases that no solution could pass all, those being:

xa = 0x 000923da 28c31f00 00018540 XXXXXXXX
xb = 0x 9d080000 000f97ac b7092f00 XXXXXXXX
xvbf16ger2 at, xa, xb
at = 0x 80000000 XXXXXXXX XXXXXXXX XXXXXXXX
         0xXXXXXXXX 80000016 XXXXXXXX XXXXXXXX
         0xXXXXXXXX XXXXXXXX 80000001 XXXXXXXX
         0xXXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX

Doing the operation either with float64 (with and without round_to_odd) 
or with a new softfloat operation that uses FloatParts64 results in 
0x80000015 instead of 0x80000016, but doing it with float32 results in 
0x00000000 instead of 0x80000000 and 0x80000002 instead of 0x80000001

Between those choices I'd go with float64 as to keep the result 
numerically close tho the actual value if the next operation treat those 
as an integer (with float32 you can end up having 0 instead of 
INT32_MIN) and the results are close if they're treated as floating-point.

>
> Anyway, for this patch,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
--------------x7AmFG2VKNQsiWcQEkKTyR5M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/05/2022 01:27, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:461a810f-6ca0-98cc-4144-18062b165ad7@linaro.org">On
      5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite"><br>
        There's a discrepancy between this implementation and mambo/the
        <br>
        hardware where implementing it with float64_mul then
        float64r32_muladd
        <br>
        sometimes results in an incorrect result after an underflow, but
        <br>
        implementing with float32_mul then float32_muladd results in
        incorrect
        <br>
        signal in some 0 or infinite results. I've not been able to
        solve this
        <br>
      </blockquote>
      <br>
      I did suggest that the float64_mul needs to be done in
      round-to-odd.
      <br>
    </blockquote>
    <p>From what I understood, you meant:<br>
    </p>
        rmode = get_float_rounding_mode(&amp;status);<br>
        set_float_rounding_mode(float_round_to_odd, &amp;status);<br>
        psum = float64_mul(va, vb, &amp;status);<br>
        set_float_rounding_mode(rmode, &amp;status);<br>
        psum = float64r32_muladd(vc, vd, psum, 0, &amp;status);<br>
    <p>Which doesn't solve the problem, I tried other solutions but
      overall I found 3 test cases that no solution could pass all,
      those being:</p>
    <p>xa = 0x 000923da 28c31f00 00018540 XXXXXXXX<br>
      xb = 0x 9d080000 000f97ac b7092f00 XXXXXXXX<br>
      xvbf16ger2 at, xa, xb<br>
      at = 0x 80000000 XXXXXXXX XXXXXXXX XXXXXXXX<br>
              0xXXXXXXXX 80000016 XXXXXXXX XXXXXXXX<br>
              0xXXXXXXXX XXXXXXXX 80000001 XXXXXXXX<br>
              0xXXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX</p>
    <p>Doing the operation either with float64 (with and without
      round_to_odd) or with a new softfloat operation that uses
      FloatParts64 results in 0x80000015 instead of 0x80000016, but
      doing it with float32 results in 0x00000000 instead of 0x80000000
      and 0x80000002 instead of 0x80000001</p>
    <p>Between those choices I'd go with float64 as to keep the result
      numerically close tho the actual value if the next operation treat
      those as an integer (with float32 you can end up having 0 instead
      of INT32_MIN) and the results are close if they're treated as
      floating-point.<br>
    </p>
    <blockquote type="cite"
      cite="mid:461a810f-6ca0-98cc-4144-18062b165ad7@linaro.org">
      <br>
      Anyway, for this patch,
      <br>
      Reviewed-by: Richard Henderson
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
      <br>
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

--------------x7AmFG2VKNQsiWcQEkKTyR5M--

