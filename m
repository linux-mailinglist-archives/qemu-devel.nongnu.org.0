Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D3553BF44
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 22:03:12 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwr2F-0003AW-ID
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 16:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nwqzP-0008JQ-55; Thu, 02 Jun 2022 16:00:26 -0400
Received: from [187.72.171.209] (port=52778 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nwqzJ-00083R-IT; Thu, 02 Jun 2022 16:00:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 2 Jun 2022 17:00:04 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 4D7518012F1;
 Thu,  2 Jun 2022 17:00:04 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------TFjiyNrOhCpfIiycr0OWFCzZ"
Message-ID: <9ccd5d3f-59ac-1df3-0020-f5a6bcaaa6d2@eldorado.org.br>
Date: Thu, 2 Jun 2022 17:00:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc: fix unreachable code in fpu_helper.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220602191048.137511-1-danielhb413@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220602191048.137511-1-danielhb413@gmail.com>
X-OriginalArrivalTime: 02 Jun 2022 20:00:04.0604 (UTC)
 FILETIME=[59DCE3C0:01D876BB]
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
--------------TFjiyNrOhCpfIiycr0OWFCzZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/06/2022 16:10, Daniel Henrique Barboza wrote:
> Commit c29018cc7395 added an env->fpscr OR operation using a ternary
> that checks if 'error' is not zero:
>
>      env->fpscr |= error ? FP_FEX : 0;
>
> However, in the current body of do_fpscr_check_status(), 'error' is
> granted to be always non-zero at that point. The result is that Coverity
> is less than pleased:
>
>    Control flow issues  (DEADCODE)
> Execution cannot reach the expression "0ULL" inside this statement:
> "env->fpscr |= (error ? 1073...".
>
> Remove the ternary and always make env->fpscr |= FP_FEX.
>
> Cc: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Fixes: Coverity CID 1489442
> Fixes: c29018cc7395 ("target/ppc: Implemented xvf*ger*")
> Signed-off-by: Daniel Henrique Barboza<danielhb413@gmail.com>
> ---
>
Reviewed-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------TFjiyNrOhCpfIiycr0OWFCzZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/06/2022 16:10, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220602191048.137511-1-danielhb413@gmail.com">
      <pre class="moz-quote-pre" wrap="">
Commit c29018cc7395 added an env-&gt;fpscr OR operation using a ternary
that checks if 'error' is not zero:

    env-&gt;fpscr |= error ? FP_FEX : 0;

However, in the current body of do_fpscr_check_status(), 'error' is
granted to be always non-zero at that point. The result is that Coverity
is less than pleased:

  Control flow issues  (DEADCODE)
Execution cannot reach the expression "0ULL" inside this statement:
"env-&gt;fpscr |= (error ? 1073...".

Remove the ternary and always make env-&gt;fpscr |= FP_FEX.

Cc: Lucas Mateus Castro (alqotel) <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>
Cc: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Fixes: Coverity CID 1489442
Fixes: c29018cc7395 ("target/ppc: Implemented xvf*ger*")
Signed-off-by: Daniel Henrique Barboza <a class="moz-txt-link-rfc2396E" href="mailto:danielhb413@gmail.com">&lt;danielhb413@gmail.com&gt;</a>
---

</pre>
    </blockquote>
    Reviewed-by: Lucas Mateus Castro (alqotel) <a
      class="moz-txt-link-rfc2396E"
      href="mailto:lucas.araujo@eldorado.org.br">
      &lt;lucas.araujo@eldorado.org.br&gt;</a>
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

--------------TFjiyNrOhCpfIiycr0OWFCzZ--

