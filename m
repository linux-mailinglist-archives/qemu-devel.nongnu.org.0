Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD550E376
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:41:41 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizuH-0005g4-1E
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nizVf-0002eT-Dh; Mon, 25 Apr 2022 10:16:16 -0400
Received: from [187.72.171.209] (port=9417 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nizVc-0003AA-Jr; Mon, 25 Apr 2022 10:16:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 25 Apr 2022 11:16:02 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id EA3668000D6;
 Mon, 25 Apr 2022 11:16:01 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------0JtR0ifGqmgJFREZYoWwHNbo"
Message-ID: <4111fd84-5cb5-3837-7fee-243f5623ed7b@eldorado.org.br>
Date: Mon, 25 Apr 2022 11:16:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220421011729.1148727-1-bmeng.cn@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <20220421011729.1148727-1-bmeng.cn@gmail.com>
X-OriginalArrivalTime: 25 Apr 2022 14:16:02.0276 (UTC)
 FILETIME=[FE611A40:01D858AE]
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------0JtR0ifGqmgJFREZYoWwHNbo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/04/2022 22:17, Bin Meng wrote:
> From: Bin Meng<bin.meng@windriver.com>
>
> Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
> Event" and chapter 8.4.5 "Instruction Complete Debug Event":
>
>    "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
>    are set ... Branch taken debug events are not recognized if MSR[DE]
>    is cleared when the branch instruction executes."
>
>    "An instruction complete debug event occurs when any instruction
>    completes execution so long as MSR[DE] and DBCR0[ICMP] are both
>    set ... Instruction complete debug events are not recognized if
>    MSR[DE] is cleared at the time of the instruction execution."
>
> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> HFLAGS_BE flag, which would cause the immediate debug interrupt to
> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> and MSR.DE is not set.
>
> [1]https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf
>
> Signed-off-by: Bin Meng<bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - update commit message to use E500CORERM instead of PowerISA 2.07
>
>   target/ppc/helper_regs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..77bc57415c 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>
>       if (ppc_flags & POWERPC_FLAG_DE) {
>           target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
> -        if (dbcr0 & DBCR0_ICMP) {
> +        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
There was a discussion some time ago that was better to avoid hidden 
uses of *env, so it may be better to change msr_de to ((env->msr >> 
MSR_DE) & 1) or to (env->msr & BIT_ULL(MSR_DE))
>               hflags |= 1 << HFLAGS_SE;
>           }
> -        if (dbcr0 & DBCR0_BRT) {
> +        if ((dbcr0 & DBCR0_BRT) && msr_de) {
Here as well
>               hflags |= 1 << HFLAGS_BE;
>           }
>       } else {
> --
> 2.25.1
>
>
Apart from that,
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------0JtR0ifGqmgJFREZYoWwHNbo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20/04/2022 22:17, Bin Meng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220421011729.1148727-1-bmeng.cn@gmail.com">
      <pre class="moz-quote-pre" wrap="">
From: Bin Meng <a class="moz-txt-link-rfc2396E" href="mailto:bin.meng@windriver.com">&lt;bin.meng@windriver.com&gt;</a>

Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
Event" and chapter 8.4.5 "Instruction Complete Debug Event":

  "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
  are set ... Branch taken debug events are not recognized if MSR[DE]
  is cleared when the branch instruction executes."

  "An instruction complete debug event occurs when any instruction
  completes execution so long as MSR[DE] and DBCR0[ICMP] are both
  set ... Instruction complete debug events are not recognized if
  MSR[DE] is cleared at the time of the instruction execution."

Current codes do not check MSR.DE bit before setting HFLAGS_SE and
HFLAGS_BE flag, which would cause the immediate debug interrupt to
be generated, e.g.: when DBCR0.ICMP bit is set by guest software
and MSR.DE is not set.

[1] <a class="moz-txt-link-freetext" href="https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf">https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf</a>

Signed-off-by: Bin Meng <a class="moz-txt-link-rfc2396E" href="mailto:bin.meng@windriver.com">&lt;bin.meng@windriver.com&gt;</a>
---

Changes in v2:
- update commit message to use E500CORERM instead of PowerISA 2.07

 target/ppc/helper_regs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 9a691d6833..77bc57415c 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)

     if (ppc_flags &amp; POWERPC_FLAG_DE) {
         target_ulong dbcr0 = env-&gt;spr[SPR_BOOKE_DBCR0];
-        if (dbcr0 &amp; DBCR0_ICMP) {
+        if ((dbcr0 &amp; DBCR0_ICMP) &amp;&amp; msr_de) {</pre>
    </blockquote>
    There was a discussion some time ago that was better to avoid hidden
    uses of *env, so it may be better to change msr_de to ((env-&gt;msr
    &gt;&gt; MSR_DE) &amp; 1) or to (env-&gt;msr &amp; BIT_ULL(MSR_DE))<br>
    <blockquote type="cite"
      cite="mid:20220421011729.1148727-1-bmeng.cn@gmail.com">
      <pre class="moz-quote-pre" wrap="">
             hflags |= 1 &lt;&lt; HFLAGS_SE;
         }
-        if (dbcr0 &amp; DBCR0_BRT) {
+        if ((dbcr0 &amp; DBCR0_BRT) &amp;&amp; msr_de) {</pre>
    </blockquote>
    Here as well<br>
    <blockquote type="cite"
      cite="mid:20220421011729.1148727-1-bmeng.cn@gmail.com">
      <pre class="moz-quote-pre" wrap="">
             hflags |= 1 &lt;&lt; HFLAGS_BE;
         }
     } else {
--
2.25.1


</pre>
    </blockquote>
    <div class="moz-signature">Apart from that,</div>
    <div class="moz-signature">Reviewed-by: Lucas Mateus Castro
      <a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a><br>
    </div>
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

--------------0JtR0ifGqmgJFREZYoWwHNbo--

