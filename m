Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3503A8670
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:26:53 +0200 (CEST)
Received: from localhost ([::1]:40986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBts-0007hb-5U
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ltBrv-0005Fo-1N; Tue, 15 Jun 2021 12:24:51 -0400
Received: from [201.28.113.2] (port=32976 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ltBrs-0004HP-Pu; Tue, 15 Jun 2021 12:24:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 13:24:44 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id DCB43800144;
 Tue, 15 Jun 2021 13:24:43 -0300 (-03)
Subject: Re: [PATCH v2 1/3] target/ppc: Turn ppc_tlb_invalid_all in a noop
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
 <20210610164648.83878-2-lucas.araujo@eldorado.org.br>
 <YMg815tpe++WuRuR@yekko>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <9cdab6f0-b1dc-8bd6-45d3-62422239621f@eldorado.org.br>
Date: Tue, 15 Jun 2021 13:24:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMg815tpe++WuRuR@yekko>
Content-Type: multipart/alternative;
 boundary="------------95F68D8E357FC59F802F60A9"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 16:24:44.0278 (UTC)
 FILETIME=[F3579960:01D76202]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_05=-0.5, HTML_MESSAGE=0.001,
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------95F68D8E357FC59F802F60A9
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2021 02:38, David Gibson wrote:
> On Thu, Jun 10, 2021 at 01:46:46PM -0300, Lucas Mateus Castro (alqotel) wrote:
>> The function ppc_tlb_invalid_all is now a no op when compiling without TCG.
>>
>> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
>
> Hm, I think I suggested making ppc_tlb_invalidate_all() a stub, rather
> than removing the call from !TCG code.  But looking at this again, I
> think that was a mistake.  I think it makes more sense to suppress
> this on the caller side, and make this a TCG only function.
Ok, I'll add the if in ppc_cpu_reset that calls ppc_tlb_invalidate_all 
to an #ifdef CONFIG_TCG block, as Fabiano suggested last patch.
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------95F68D8E357FC59F802F60A9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15/06/2021 02:38, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YMg815tpe++WuRuR@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, Jun 10, 2021 at 01:46:46PM -0300, Lucas Mateus Castro (alqotel) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The function ppc_tlb_invalid_all is now a no op when compiling without TCG.

Signed-off-by: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

Hm, I think I suggested making ppc_tlb_invalidate_all() a stub, rather
than removing the call from !TCG code.  But looking at this again, I
think that was a mistake.  I think it makes more sense to suppress
this on the caller side, and make this a TCG only function.</pre>
    </blockquote>
    Ok, I'll add the if in ppc_cpu_reset that calls
    ppc_tlb_invalidate_all to an #ifdef CONFIG_TCG block, as Fabiano
    suggested last patch.<br>
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

--------------95F68D8E357FC59F802F60A9--

