Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1645754E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:19:13 +0100 (CET)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7Xc-0004RC-SI
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mo7MQ-0001CV-G4; Fri, 19 Nov 2021 12:07:38 -0500
Received: from [201.28.113.2] (port=21595 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mo7MN-0004Su-Hq; Fri, 19 Nov 2021 12:07:37 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 19 Nov 2021 14:06:28 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id C2EF1800A92;
 Fri, 19 Nov 2021 14:06:27 -0300 (-03)
Subject: Re: [PATCH v2 1/3] target/ppc: Fixed call to deferred exception
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-2-lucas.araujo@eldorado.org.br>
 <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <a148b614-73a6-e586-4bef-2924b2468e69@eldorado.org.br>
Date: Fri, 19 Nov 2021 14:06:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------86175DC077FD0980CCDAC67C"
Content-Language: en-US
X-OriginalArrivalTime: 19 Nov 2021 17:06:28.0323 (UTC)
 FILETIME=[CAB94B30:01D7DD67]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.727, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------86175DC077FD0980CCDAC67C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 19/11/2021 06:18, Richard Henderson wrote:
> On 11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
>> +    if ((fpscr & FP_VXSOFT) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSOFT;
>> +    } else if ((fpscr & FP_OX) && (fpscr & FP_OE)) {
>> +        error = POWERPC_EXCP_FP_OX;
>> +    } else if ((fpscr & FP_UX) && (fpscr & FP_UE)) {
>> +        error = POWERPC_EXCP_FP_UX;
>> +    } else if ((fpscr & FP_XX) && (fpscr & FP_XE)) {
>> +        error = POWERPC_EXCP_FP_XX;
>> +    } else if ((fpscr & FP_ZX) && (fpscr & FP_ZE)) {
>> +        error = POWERPC_EXCP_FP_ZX;
>> +    } else if ((fpscr & FP_VXSNAN) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXSNAN;
>> +    } else if ((fpscr & FP_VXISI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXISI;
>> +    } else if ((fpscr & FP_VXIDI) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIDI;
>> +    } else if ((fpscr & FP_VXZDZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXZDZ;
>> +    } else if ((fpscr & FP_VXIMZ) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXIMZ;
>> +    } else if ((fpscr & FP_VXVC) && (fpscr_ve != 0)) {
>> +        error = POWERPC_EXCP_FP_VXVC;
>> +    }
>
> Is there a defined order for these in the manual?  I couldn't find it 
> quickly if so.  If
> there is no defined order, I think you should test VE only once.
I also couldn't find a defined order, so I chose to prioritize VXSOFT 
then go by ascending order of the bit number. In the v3 I'll move VXSOFT 
with the others invalid operation bits to check VE once then.
>
> Drop the use of fpscr_ve and use fpscr & FP_VE instead. (I think these 
> hidden uses of *env
> are evil and should be banished, but that's a bit of a job.)
>
> You could say
>
>     } else {
>         return;
>     }
>
>> +
>> +    if (error) {
>
> and then remove this test.
Ok, I'll do these in v3.
>
> The rest of it looks good.
>
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------86175DC077FD0980CCDAC67C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 19/11/2021 06:18, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org">On
      11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
      <br>
      <blockquote type="cite">+    if ((fpscr &amp; FP_VXSOFT)
        &amp;&amp; (fpscr_ve != 0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXSOFT;
        <br>
        +    } else if ((fpscr &amp; FP_OX) &amp;&amp; (fpscr &amp;
        FP_OE)) {
        <br>
        +        error = POWERPC_EXCP_FP_OX;
        <br>
        +    } else if ((fpscr &amp; FP_UX) &amp;&amp; (fpscr &amp;
        FP_UE)) {
        <br>
        +        error = POWERPC_EXCP_FP_UX;
        <br>
        +    } else if ((fpscr &amp; FP_XX) &amp;&amp; (fpscr &amp;
        FP_XE)) {
        <br>
        +        error = POWERPC_EXCP_FP_XX;
        <br>
        +    } else if ((fpscr &amp; FP_ZX) &amp;&amp; (fpscr &amp;
        FP_ZE)) {
        <br>
        +        error = POWERPC_EXCP_FP_ZX;
        <br>
        +    } else if ((fpscr &amp; FP_VXSNAN) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXSNAN;
        <br>
        +    } else if ((fpscr &amp; FP_VXISI) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXISI;
        <br>
        +    } else if ((fpscr &amp; FP_VXIDI) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXIDI;
        <br>
        +    } else if ((fpscr &amp; FP_VXZDZ) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXZDZ;
        <br>
        +    } else if ((fpscr &amp; FP_VXIMZ) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXIMZ;
        <br>
        +    } else if ((fpscr &amp; FP_VXVC) &amp;&amp; (fpscr_ve !=
        0)) {
        <br>
        +        error = POWERPC_EXCP_FP_VXVC;
        <br>
        +    }
        <br>
      </blockquote>
      <br>
      Is there a defined order for these in the manual?  I couldn't find
      it quickly if so.  If
      <br>
      there is no defined order, I think you should test VE only once.
      <br>
    </blockquote>
    I also couldn't find a defined order, so I chose to prioritize
    VXSOFT then go by ascending order of the bit number. In the v3 I'll
    move VXSOFT with the others invalid operation bits to check VE once
    then.<br>
    <blockquote type="cite"
      cite="mid:5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org">
      <br>
      Drop the use of fpscr_ve and use fpscr &amp; FP_VE instead. (I
      think these hidden uses of *env
      <br>
      are evil and should be banished, but that's a bit of a job.)
      <br>
      <br>
      You could say
      <br>
      <br>
          } else {
      <br>
              return;
      <br>
          }
      <br>
      <br>
      <blockquote type="cite">+
        <br>
        +    if (error) {
        <br>
      </blockquote>
      <br>
      and then remove this test.
      <br>
    </blockquote>
    Ok, I'll do these in v3.<br>
    <blockquote type="cite"
      cite="mid:5e723955-68fc-a77c-b131-ca9e29f23423@linaro.org">
      <br>
      The rest of it looks good.
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
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------86175DC077FD0980CCDAC67C--

