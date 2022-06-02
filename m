Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDD53BBE8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:54:51 +0200 (CEST)
Received: from localhost ([::1]:36792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwn9u-00029f-6G
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nwn5d-0007UX-8A; Thu, 02 Jun 2022 11:50:25 -0400
Received: from [187.72.171.209] (port=12413 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nwn5a-0006ER-SA; Thu, 02 Jun 2022 11:50:24 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 2 Jun 2022 12:49:18 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 3AD39800491;
 Thu,  2 Jun 2022 12:49:18 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------30gmPeziKKJAWn3D4BW0yzGd"
Message-ID: <1b7846ac-2e87-ee27-3bbf-c6e5a4912f5b@eldorado.org.br>
Date: Thu, 2 Jun 2022 12:49:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc: avoid int32 multiply overflow in int_helper.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220602141449.118173-1-danielhb413@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220602141449.118173-1-danielhb413@gmail.com>
X-OriginalArrivalTime: 02 Jun 2022 15:49:18.0454 (UTC)
 FILETIME=[51A89960:01D87698]
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
--------------30gmPeziKKJAWn3D4BW0yzGd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/06/2022 11:14, Daniel Henrique Barboza wrote:
> Coverity is not thrilled about the multiply operations being done in
> ger_rank8() and ger_rank2(), giving an error like the following:
>
> Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>      Potentially overflowing expression "sextract32(a, 4 * i, 4) *
> sextract32(b, 4 * i, 4)" with type "int" (32 bits, signed) is evaluated
> using 32-bit arithmetic, and then used in a context that expects an
> expression of type "int64_t" (64 bits, signed).
>
> Fix both instances where this occur by adding an int64_t cast in the
> first operand, forcing the result to be 64 bit.
>
> Fixes: Coverity CID 1489444, 1489443
> Fixes: 345531533f26 ("target/ppc: Implemented xvi*ger* instructions")
> Cc: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza<danielhb413@gmail.com>
> ---
Reviewed-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------30gmPeziKKJAWn3D4BW0yzGd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/06/2022 11:14, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220602141449.118173-1-danielhb413@gmail.com">
      <pre class="moz-quote-pre" wrap="">
Coverity is not thrilled about the multiply operations being done in
ger_rank8() and ger_rank2(), giving an error like the following:

Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
    Potentially overflowing expression "sextract32(a, 4 * i, 4) *
sextract32(b, 4 * i, 4)" with type "int" (32 bits, signed) is evaluated
using 32-bit arithmetic, and then used in a context that expects an
expression of type "int64_t" (64 bits, signed).

Fix both instances where this occur by adding an int64_t cast in the
first operand, forcing the result to be 64 bit.

Fixes: Coverity CID 1489444, 1489443
Fixes: 345531533f26 ("target/ppc: Implemented xvi*ger* instructions")
Cc: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
Cc: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:danielhb413@gmail.com">&lt;danielhb413@gmail.com&gt;</a>
---
</pre>
    </blockquote>
    Reviewed-by: Lucas Mateus Castro (alqotel)
    <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a><br>
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

--------------30gmPeziKKJAWn3D4BW0yzGd--

