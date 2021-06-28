Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B13B66B4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:25:48 +0200 (CEST)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxu4x-0004Ht-Bz
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxu1o-0007sQ-Qi; Mon, 28 Jun 2021 12:22:32 -0400
Received: from [201.28.113.2] (port=40874 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lxu1m-0001O4-R1; Mon, 28 Jun 2021 12:22:32 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 28 Jun 2021 13:22:26 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 10420800976;
 Mon, 28 Jun 2021 13:22:26 -0300 (-03)
Subject: Re: [PATCH v3 12/29] tcg/ppc: Use power10 byte-reverse instructions
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-13-richard.henderson@linaro.org>
 <CAFEAcA9njnXqgx=wmfizZEpW5j4kzxJhKC5MExmqOXeN28ig=w@mail.gmail.com>
 <46f4bff7-9022-4708-d16e-06a383e0b97d@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <e8f1e4fc-30bf-000d-3289-8b9e37736f7c@eldorado.org.br>
Date: Mon, 28 Jun 2021 13:22:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <46f4bff7-9022-4708-d16e-06a383e0b97d@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------84A06F5E84C109CD5DBCFCC2"
Content-Language: en-US
X-OriginalArrivalTime: 28 Jun 2021 16:22:26.0310 (UTC)
 FILETIME=[C87A1A60:01D76C39]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 16
X-Spam_score: 1.6
X-Spam_bar: +
X-Spam_report: (1.6 / 5.0 requ) BAYES_50=0.8, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------84A06F5E84C109CD5DBCFCC2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28/06/2021 11:45, Richard Henderson wrote:
> On 6/28/21 7:33 AM, Peter Maydell wrote:
>>> +    if (have_isa_3_10) {
>>
>> Side note, why do we call this have_isa_3_10 when it's checking
>> for ISA 3.1, not 3.10 ?
>
> I think it's just because it made the columns line up:
>
> #define have_isa_2_06  (have_isa >= tcg_isa_2_06)
> #define have_isa_2_07  (have_isa >= tcg_isa_2_07)
> #define have_isa_3_00  (have_isa >= tcg_isa_3_00)
> #define have_isa_3_10  (have_isa >= tcg_isa_3_10)
>
> though I think there's also a missing . or _ there -- should have been 
> 2.0.6 and 2.0.7.

No. The specifications in the Open Power foundation's websites call the 
versions

2.07: 
https://openpowerfoundation.org/?resource_lib=ibm-power-isa-version-2-07-b

and 2.06: http://kib.kiev.ua/x86docs/POWER/PowerISA_V2.06B_V2_PUBLIC.pdf


Unless the PDFs also lost a . somewhere, which isn't impossible, but I 
find more unlikely.

>
>
> r~
>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------84A06F5E84C109CD5DBCFCC2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28/06/2021 11:45, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:46f4bff7-9022-4708-d16e-06a383e0b97d@linaro.org">On
      6/28/21 7:33 AM, Peter Maydell wrote:
      <br>
      <blockquote type="cite">
        <blockquote type="cite">+    if (have_isa_3_10) {
          <br>
        </blockquote>
        <br>
        Side note, why do we call this have_isa_3_10 when it's checking
        <br>
        for ISA 3.1, not 3.10 ?
        <br>
      </blockquote>
      <br>
      I think it's just because it made the columns line up:
      <br>
      <br>
      #define have_isa_2_06  (have_isa &gt;= tcg_isa_2_06)
      <br>
      #define have_isa_2_07  (have_isa &gt;= tcg_isa_2_07)
      <br>
      #define have_isa_3_00  (have_isa &gt;= tcg_isa_3_00)
      <br>
      #define have_isa_3_10  (have_isa &gt;= tcg_isa_3_10)
      <br>
      <br>
      though I think there's also a missing . or _ there -- should have
      been 2.0.6 and 2.0.7.
      <br>
    </blockquote>
    <p>No. The specifications in the Open Power foundation's websites
      call the versions <br>
    </p>
    <p>2.07:
<a class="moz-txt-link-freetext" href="https://openpowerfoundation.org/?resource_lib=ibm-power-isa-version-2-07-b">https://openpowerfoundation.org/?resource_lib=ibm-power-isa-version-2-07-b</a></p>
    <p>and 2.06:
      <a class="moz-txt-link-freetext" href="http://kib.kiev.ua/x86docs/POWER/PowerISA_V2.06B_V2_PUBLIC.pdf">http://kib.kiev.ua/x86docs/POWER/PowerISA_V2.06B_V2_PUBLIC.pdf</a></p>
    <p><br>
    </p>
    <p>Unless the PDFs also lost a . somewhere, which isn't impossible,
      but I find more unlikely.<br>
    </p>
    <blockquote type="cite"
      cite="mid:46f4bff7-9022-4708-d16e-06a383e0b97d@linaro.org">
      <br>
      <br>
      r~
      <br>
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------84A06F5E84C109CD5DBCFCC2--

