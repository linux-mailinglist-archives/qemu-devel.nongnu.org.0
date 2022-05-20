Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52652F0F4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 18:45:53 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns5lA-0002PE-Db
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 12:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ns5j0-0001P7-Af; Fri, 20 May 2022 12:43:38 -0400
Received: from [187.72.171.209] (port=21590 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ns5iy-0000cW-5G; Fri, 20 May 2022 12:43:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 20 May 2022 13:42:31 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EFAA18000A0;
 Fri, 20 May 2022 13:42:30 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------0cOpxycAtNOoO70Kju7oxVv7"
Message-ID: <d791d9b8-6a77-c2ec-67af-d9e208fa2e22@eldorado.org.br>
Date: Fri, 20 May 2022 13:42:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 5/8] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220520135129.63664-1-lucas.araujo@eldorado.org.br>
 <20220520135129.63664-6-lucas.araujo@eldorado.org.br>
 <299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org>
X-OriginalArrivalTime: 20 May 2022 16:42:31.0167 (UTC)
 FILETIME=[994B30F0:01D86C68]
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
--------------0cOpxycAtNOoO70Kju7oxVv7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/05/2022 12:47, Richard Henderson wrote:
>
> On 5/20/22 06:51, Lucas Mateus Castro(alqotel) wrote:
>> +                if (acc) {
>> +                    aux_acc = at[i].VsrSF(j);
>> +                    if (!neg_mul && !neg_acc) {
>> +                        r = float32_add(r, aux_acc, excp_ptr);
>> +                    } else if (!neg_mul) {
>> +                        r = float32_add(r, bfp32_neg(aux_acc), 
>> excp_ptr);
>> +                    } else if (!neg_acc) {
>> +                        r = float32_add(bfp32_neg(r), aux_acc, 
>> excp_ptr);
>> +                    } else {
>> +                        r = float32_add(bfp32_neg(r), 
>> bfp32_neg(aux_acc), excp_ptr);
>> +                    }
>
> There's no point in the 3 if's when using bfp32_neg.
> Just use
>
>   if (neg_mul) {
>   }
>   if (neg_acc) {
>   }
>   float32_add(...);

You mean negate separately? Like:

     if (neg_mul) {
         r = bfp32_neg(r);
     }
     if (neg_acc) {
         aux_acc = bfp32_neg(aux_acc);
     }
     r = float32_add(r, aux_acc, excp_ptr);

If so I'll send a new version with this change later today

>
> With that,
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
--------------0cOpxycAtNOoO70Kju7oxVv7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20/05/2022 12:47, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org"><br>
      On 5/20/22 06:51, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">+                if (acc) {
        <br>
        +                    aux_acc = at[i].VsrSF(j);
        <br>
        +                    if (!neg_mul &amp;&amp; !neg_acc) {
        <br>
        +                        r = float32_add(r, aux_acc, excp_ptr);
        <br>
        +                    } else if (!neg_mul) {
        <br>
        +                        r = float32_add(r, bfp32_neg(aux_acc),
        excp_ptr);
        <br>
        +                    } else if (!neg_acc) {
        <br>
        +                        r = float32_add(bfp32_neg(r), aux_acc,
        excp_ptr);
        <br>
        +                    } else {
        <br>
        +                        r = float32_add(bfp32_neg(r),
        bfp32_neg(aux_acc), excp_ptr);
        <br>
        +                    }
        <br>
      </blockquote>
      <br>
      There's no point in the 3 if's when using bfp32_neg.
      <br>
      Just use
      <br>
      <br>
        if (neg_mul) {
      <br>
        }
      <br>
        if (neg_acc) {
      <br>
        }
      <br>
        float32_add(...);
      <br>
    </blockquote>
    <p>You mean negate separately? Like:<br>
    </p>
    <p>    if (neg_mul) {<br>
              r = bfp32_neg(r);<br>
          }<br>
          if (neg_acc) {<br>
              aux_acc = bfp32_neg(aux_acc);<br>
          }<br>
          r = float32_add(r, aux_acc, excp_ptr);</p>
    <p>If so I'll send a new version with this change later today<br>
    </p>
    <blockquote type="cite"
      cite="mid:299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org">
      <br>
      With that,
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

--------------0cOpxycAtNOoO70Kju7oxVv7--

