Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB105136B0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:18:39 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4yc-0002aB-IQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nk4lv-0004kA-B1; Thu, 28 Apr 2022 10:05:31 -0400
Received: from [187.72.171.209] (port=19792 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nk4lt-0008EY-3Y; Thu, 28 Apr 2022 10:05:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 28 Apr 2022 11:05:22 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 87889800013;
 Thu, 28 Apr 2022 11:05:22 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------cpuXc0gItmXed74mGRSnpjzZ"
Message-ID: <4e088b75-a532-de95-5760-dbb9bfa2923d@eldorado.org.br>
Date: Thu, 28 Apr 2022 11:05:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/7] VSX MMA Implementation
Content-Language: en-US
To: qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 28 Apr 2022 14:05:22.0908 (UTC)
 FILETIME=[008689C0:01D85B09]
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, victor.colombo@eldorado.org.br,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------cpuXc0gItmXed74mGRSnpjzZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Something I forgot to mention in the cover letter, the XVFGER 
instructions accumulate the exception status and at the end set the 
FPSCR and take a Program interrupt on a trap-enabled exception, but as 
the exception functions are currently set up in target/ppc/fpu_helper.c 
a call to set a FPSCR bit could raise an exception before all bits could 
be set.

Victor (CCing him) is working on a patch series to fix the FPSCR.FI bit 
that will reorganize do_float_check_status (that would solve the 
aforementioned problem), so for now I sent without trying to solve that 
problem

In v2 I'll remember to mention this in the cover letter

On 26/04/2022 09:50, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
>
> This patch series is an RFC of the Matrix-Multiply Assist (MMA)
> instructions implementation from the PowerISA 3.1
>
> These and the VDIV/VMOD implementation are the last new PowerISA 3.1
> instructions left to be implemented.
>
> Thanks
> Lucas Mateus Castro (alqotel) (7):
>    target/ppc: Implement xxm[tf]acc and xxsetaccz
>    target/ppc: Implemented xvi*ger* instructions
>    target/ppc: Implemented pmxvi*ger* instructions
>    target/ppc: Implemented xvf*ger*
>    target/ppc: Implemented xvf16ger*
>    target/ppc: Implemented pmxvf*ger*
>    target/ppc: Implemented [pm]xvbf16ger2*
>
>   include/fpu/softfloat.h             |   9 ++
>   target/ppc/cpu.h                    |  15 +++
>   target/ppc/fpu_helper.c             | 130 ++++++++++++++++++
>   target/ppc/helper.h                 |   7 +
>   target/ppc/insn32.decode            |  49 +++++++
>   target/ppc/insn64.decode            |  80 +++++++++++
>   target/ppc/int_helper.c             |  85 ++++++++++++
>   target/ppc/internal.h               |  28 ++++
>   target/ppc/translate/vsx-impl.c.inc | 200 ++++++++++++++++++++++++++++
>   9 files changed, 603 insertions(+)
>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------cpuXc0gItmXed74mGRSnpjzZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Something I forgot to mention in the cover letter, the XVFGER
      instructions accumulate the exception status and at the end set
      the FPSCR and take a Program interrupt on a trap-enabled
      exception, but as the exception functions are currently set up in
      target/ppc/fpu_helper.c a call to set a FPSCR bit could raise an
      exception before all bits could be set.</p>
    <p>Victor (CCing him) is working on a patch series to fix the
      FPSCR.FI bit that will reorganize do_float_check_status (that
      would solve the aforementioned problem), so for now I sent without
      trying to solve that problem</p>
    <p>In v2 I'll remember to mention this in the cover letter<br>
    </p>
    On 26/04/2022 09:50, Lucas Mateus Castro(alqotel) wrote:<br>
    <blockquote type="cite"
      cite="mid:20220426125028.18844-1-lucas.araujo@eldorado.org.br">
      <pre class="moz-quote-pre" wrap="">From: "Lucas Mateus Castro (alqotel)" <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a>

This patch series is an RFC of the Matrix-Multiply Assist (MMA)
instructions implementation from the PowerISA 3.1 

These and the VDIV/VMOD implementation are the last new PowerISA 3.1
instructions left to be implemented.

Thanks
Lucas Mateus Castro (alqotel) (7):
  target/ppc: Implement xxm[tf]acc and xxsetaccz
  target/ppc: Implemented xvi*ger* instructions
  target/ppc: Implemented pmxvi*ger* instructions
  target/ppc: Implemented xvf*ger*
  target/ppc: Implemented xvf16ger*
  target/ppc: Implemented pmxvf*ger*
  target/ppc: Implemented [pm]xvbf16ger2*

 include/fpu/softfloat.h             |   9 ++
 target/ppc/cpu.h                    |  15 +++
 target/ppc/fpu_helper.c             | 130 ++++++++++++++++++
 target/ppc/helper.h                 |   7 +
 target/ppc/insn32.decode            |  49 +++++++
 target/ppc/insn64.decode            |  80 +++++++++++
 target/ppc/int_helper.c             |  85 ++++++++++++
 target/ppc/internal.h               |  28 ++++
 target/ppc/translate/vsx-impl.c.inc | 200 ++++++++++++++++++++++++++++
 9 files changed, 603 insertions(+)

</pre>
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

--------------cpuXc0gItmXed74mGRSnpjzZ--

