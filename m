Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B844C600
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:33:15 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkrTF-0002TK-M6
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:33:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mkrQY-0001QL-NN; Wed, 10 Nov 2021 12:30:26 -0500
Received: from [201.28.113.2] (port=26727 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mkrQW-0005eJ-81; Wed, 10 Nov 2021 12:30:26 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 10 Nov 2021 14:29:02 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id F0BC1800AC7;
 Wed, 10 Nov 2021 14:29:01 -0300 (-03)
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <2458d27b-75eb-e4f8-c588-efd8c50df5fc@gmail.com>
 <db132b26-0025-f573-1006-8a8c7aa2a656@kaod.org>
Message-ID: <1686a574-311f-90e5-1420-bba529be89fe@eldorado.org.br>
Date: Wed, 10 Nov 2021 14:29:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <db132b26-0025-f573-1006-8a8c7aa2a656@kaod.org>
Content-Type: multipart/alternative;
 boundary="------------354769E83A5A3D669A798EC1"
Content-Language: en-US
X-OriginalArrivalTime: 10 Nov 2021 17:29:02.0444 (UTC)
 FILETIME=[742002C0:01D7D658]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.678, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------354769E83A5A3D669A798EC1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/11/2021 03:56, Cédric Le Goater wrote:
> On 11/9/21 17:37, Daniel Henrique Barboza wrote:
>>
>>
>> On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
>>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>>
>>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>>> after updating the value of FPSCR, but helper_float_check_status
>>> checks fp_status and fp_status isn't updated based on FPSCR and
>>> since the value of fp_status is reset earlier in the instruction,
>>> it's always 0.
>>>
>>> Because of this helper_float_check_status would change the FI bit to 0
>>> as this bit checks if the last operation was inexact and
>>> float_flag_inexact is always 0.
>>>
>>> These instructions also don't throw exceptions correctly since
>>> helper_float_check_status throw exceptions based on fp_status.
>>>
>>> This commit created a new helper, helper_fpscr_check_status that checks
>>> FPSCR value instead of fp_status and checks for a larger variety of
>>> exceptions than do_float_check_status.
>>>
>>> The hardware used to compare QEMU's behavior to, was a Power9.
>
> Do you have a test case for this ? If so, are you collecting them
> on some repo ?
>
> Thanks,
>
> C.

Just created a test, currently on the branch 
https://github.com/PPC64/qemu/tree/alqotel_bug_mtfsf commit 
c8a852bcdf7bdc239711679f00af2450c51d57c6

This test if FI is being set correctly and if the deferred exception is 
being called correctly (by enabling VE and VXSOFT bits)

-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------354769E83A5A3D669A798EC1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/11/2021 03:56, Cédric Le Goater
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:db132b26-0025-f573-1006-8a8c7aa2a656@kaod.org">On
      11/9/21 17:37, Daniel Henrique Barboza wrote: <br>
      <blockquote type="cite"> <br>
        <br>
        On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote: <br>
        <blockquote type="cite">From: "Lucas Mateus Castro (alqotel)" <a
            class="moz-txt-link-rfc2396E"
            href="mailto:lucas.castro@eldorado.org.br">&lt;lucas.castro@eldorado.org.br&gt;</a>
          <br>
          <br>
          mtfsf, mtfsfi and mtfsb1 instructions call
          helper_float_check_status <br>
          after updating the value of FPSCR, but
          helper_float_check_status <br>
          checks fp_status and fp_status isn't updated based on FPSCR
          and <br>
          since the value of fp_status is reset earlier in the
          instruction, <br>
          it's always 0. <br>
          <br>
          Because of this helper_float_check_status would change the FI
          bit to 0 <br>
          as this bit checks if the last operation was inexact and <br>
          float_flag_inexact is always 0. <br>
          <br>
          These instructions also don't throw exceptions correctly since
          <br>
          helper_float_check_status throw exceptions based on fp_status.
          <br>
          <br>
          This commit created a new helper, helper_fpscr_check_status
          that checks <br>
          FPSCR value instead of fp_status and checks for a larger
          variety of <br>
          exceptions than do_float_check_status. <br>
          <br>
          The hardware used to compare QEMU's behavior to, was a Power9.
          <br>
        </blockquote>
      </blockquote>
      <br>
      Do you have a test case for this ? If so, are you collecting them
      <br>
      on some repo ? <br>
      <br>
      Thanks, <br>
      <br>
      C. <br>
    </blockquote>
    <p>Just created a test, currently on the branch <a
        class="moz-txt-link-freetext"
        href="https://github.com/PPC64/qemu/tree/alqotel_bug_mtfsf">https://github.com/PPC64/qemu/tree/alqotel_bug_mtfsf</a>
      commit c8a852bcdf7bdc239711679f00af2450c51d57c6</p>
    <p>This test if FI is being set correctly and if the deferred
      exception is being called correctly (by enabling VE and VXSOFT
      bits)<br>
    </p>
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

--------------354769E83A5A3D669A798EC1--

