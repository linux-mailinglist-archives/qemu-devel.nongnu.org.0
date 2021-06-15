Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CB83A7E30
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 14:29:06 +0200 (CEST)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt8Bl-0005x5-Se
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 08:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt881-0002mW-2J; Tue, 15 Jun 2021 08:25:13 -0400
Received: from [201.28.113.2] (port=26024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt87y-0007IN-Qz; Tue, 15 Jun 2021 08:25:12 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 09:25:07 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 0B32D800144;
 Tue, 15 Jun 2021 09:25:07 -0300 (-03)
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
To: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <YMgFO37SzY1KkwQc@yekko> <61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <0b052edd-99fe-fd68-fb19-6d295c4119e9@eldorado.org.br>
Date: Tue, 15 Jun 2021 09:25:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------94E4C78DC20339011F7B3E9A"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 12:25:07.0399 (UTC)
 FILETIME=[7A0DF570:01D761E1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.095, PDS_HP_HELO_NORDNS=0.308, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------94E4C78DC20339011F7B3E9A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2021 00:20, Richard Henderson wrote:
> On 6/14/21 6:41 PM, David Gibson wrote:
>> I think move these to mmu-book3s-v3.h, since they're correct for both
>> the radix and hash sides of the modern book3s mmu.
>
> They're also correct for all non-booke mmus, e.g. hash32 and 6xx, 
> which is why I recommended internal.h (or some new mmu-internal.h).
>
> While neither hash32 nor 6xx have HV, and thus there is no second tlb 
> bug, it would still be More Correct to use mmu_idx instead of direct 
> references to msr_pr et al.
yeah, I agree that I should change the documentation. Before I send a 
new version with everything corrected, I wanna make sure if I should 
leave them in internal and use it for hash32 and 6xx MMUs, or do I put 
them in mmu-book3s-v3.h, since only radix64 has that the bug?
>
>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------94E4C78DC20339011F7B3E9A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15/06/2021 00:20, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org">On
      6/14/21 6:41 PM, David Gibson wrote:
      <br>
      <blockquote type="cite">I think move these to mmu-book3s-v3.h,
        since they're correct for both
        <br>
        the radix and hash sides of the modern book3s mmu.
        <br>
      </blockquote>
      <br>
      They're also correct for all non-booke mmus, e.g. hash32 and 6xx,
      which is why I recommended internal.h (or some new
      mmu-internal.h).
      <br>
      <br>
      While neither hash32 nor 6xx have HV, and thus there is no second
      tlb bug, it would still be More Correct to use mmu_idx instead of
      direct references to msr_pr et al.
      <br>
    </blockquote>
    yeah, I agree that I should change the documentation. Before I send
    a new version with everything corrected, I wanna make sure if I
    should leave them in internal and use it for hash32 and 6xx MMUs, or
    do I put them in mmu-book3s-v3.h, since only radix64 has that the
    bug?<br>
    <blockquote type="cite"
      cite="mid:61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org">
      <br>
      <br>
      r~
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

--------------94E4C78DC20339011F7B3E9A--

