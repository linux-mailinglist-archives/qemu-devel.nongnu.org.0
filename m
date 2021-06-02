Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB0B39941C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 22:00:10 +0200 (CEST)
Received: from localhost ([::1]:53470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loX29-0006ka-8G
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 16:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loX0A-0005iI-Rh; Wed, 02 Jun 2021 15:58:06 -0400
Received: from [201.28.113.2] (port=14585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loX08-000660-Hv; Wed, 02 Jun 2021 15:58:06 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 16:58:01 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id AEF1C80148C;
 Wed,  2 Jun 2021 16:58:00 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
Date: Wed, 2 Jun 2021 16:58:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F203444E559899C6A3A29510"
Content-Language: en-US
X-OriginalArrivalTime: 02 Jun 2021 19:58:01.0051 (UTC)
 FILETIME=[977172B0:01D757E9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.613, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------F203444E559899C6A3A29510
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/06/2021 16:26, Richard Henderson wrote:
> On 6/2/21 12:18 PM, Bruno Larsen (billionai) wrote:
>> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
>>
>> This commit attempts to implement a first draft of a solution to the
>> first bug mentioned by Richard Henderson in this e-mail
>> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>> The second bug was not touched, which is basically implementing the
>> solution C
>>
>> To sumarize the first bug here, from my understanding, when an address
>> translation is asked of a 64bit mmu that uses hashtables, the code
>> attempts to check some permission bits, but checks them from the wrong
>> location.
>>
>> The solution implemented here is more complex than necessary on
>> purpose, to make it more readable (and make sure I understand what is
>> going on). If that would really fix the problem, I'll move to
>> implementing an actual solution, and to all affected functions.
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/mmu-hash64.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>> index c1b98a97e9..63f10f1be7 100644
>> --- a/target/ppc/mmu-hash64.c
>> +++ b/target/ppc/mmu-hash64.c
>> @@ -887,6 +887,14 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr 
>> eaddr, MMUAccessType access_type,
>>       int exec_prot, pp_prot, amr_prot, prot;
>>       int need_prot;
>>       hwaddr raddr;
>> +    unsigned immu_idx, dmmu_idx;
>> +    immu_idx = (env->hflags >> HFLAGS_IMMU_IDX) & 7;
>> +    dmmu_idx = (env->hflags >> HFLAGS_DMMU_IDX) & 7;
>
> This doesn't help at all with the reported bug. You're still reading 
> from env. You need the mmu_idx that was passed to ppc_cpu_tlb_fill.
Ah, I saw a macro for MMU_IDX and assumed they pointed to different 
locations. Ok, the fix for ppc_cpu_tlb_fill should be easy, then
>
> For the use from ppc_cpu_get_phys_page_debug, you'd pass in 
> cpu_mmu_index(env, false).

ppc_cpu_get_phys_page_debug has 2 calls to ppc_xlate, one using the data 
MMU, the other using the instruction MMU. I'm guessing I should pass 
both, right?

But here we have another bit that confuses me: cpu_mmu_index returns 0 
if in user mode, or uses the information stored in env to get it, so I 
don't see how that would be different from getting directly. Unless the 
point is to have ppc_*_xlate be generic and pc_*_debug knows the info in 
env is correct. Is that it?

>
>
>> +    const short HV = 1, IR = 2, DR = 3;
>> +    bool MSR[3];
>> +    MSR[HV] = dmmu_idx & 2,
>> +    MSR[IR] = immu_idx & 4,
>> +    MSR[DR] = dmmu_idx & 4;
>
> There's no point in the array.  Just use three different scalars 
> (real_mode, hv, and pr (note that pr is the major portion of the bug 
> as reported)). Additionally, you'll not be distinguishing immu_idx and 
> dmmu_idx, but using the single idx that's given.

Ah, yeah, that's the "more complex than necessary, but it was easy for 
me to read" part. Scalars are a good solution. In this function in 
specific, PR doesn't actually show up anywhere, so I would actually only 
need 2. Anyway, will start working on this.

>
>> -    if (access_type == MMU_INST_FETCH ? !msr_ir : !msr_dr) {
>> +    if (access_type == MMU_INST_FETCH ? !MSR[IR] : !MSR[DR]) {
>
> Which simplifies this condition to just a single test.
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

--------------F203444E559899C6A3A29510
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/06/2021 16:26, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org">On
      6/2/21 12:18 PM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">Based-on:
        <a class="moz-txt-link-rfc2396E" href="mailto:20210518201146.794854-1-richard.henderson@linaro.org">&lt;20210518201146.794854-1-richard.henderson@linaro.org&gt;</a>
        <br>
        <br>
        This commit attempts to implement a first draft of a solution to
        the
        <br>
        first bug mentioned by Richard Henderson in this e-mail
        <br>
<a class="moz-txt-link-freetext" href="https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html">https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html</a>
        <br>
        The second bug was not touched, which is basically implementing
        the
        <br>
        solution C
        <br>
        <br>
        To sumarize the first bug here, from my understanding, when an
        address
        <br>
        translation is asked of a 64bit mmu that uses hashtables, the
        code
        <br>
        attempts to check some permission bits, but checks them from the
        wrong
        <br>
        location.
        <br>
        <br>
        The solution implemented here is more complex than necessary on
        <br>
        purpose, to make it more readable (and make sure I understand
        what is
        <br>
        going on). If that would really fix the problem, I'll move to
        <br>
        implementing an actual solution, and to all affected functions.
        <br>
        <br>
        Signed-off-by: Bruno Larsen (billionai)
        <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
          target/ppc/mmu-hash64.c | 12 ++++++++++--
        <br>
          1 file changed, 10 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
        <br>
        index c1b98a97e9..63f10f1be7 100644
        <br>
        --- a/target/ppc/mmu-hash64.c
        <br>
        +++ b/target/ppc/mmu-hash64.c
        <br>
        @@ -887,6 +887,14 @@ bool ppc_hash64_xlate(PowerPCCPU *cpu,
        vaddr eaddr, MMUAccessType access_type,
        <br>
              int exec_prot, pp_prot, amr_prot, prot;
        <br>
              int need_prot;
        <br>
              hwaddr raddr;
        <br>
        +    unsigned immu_idx, dmmu_idx;
        <br>
        +    immu_idx = (env-&gt;hflags &gt;&gt; HFLAGS_IMMU_IDX) &amp;
        7;
        <br>
        +    dmmu_idx = (env-&gt;hflags &gt;&gt; HFLAGS_DMMU_IDX) &amp;
        7;
        <br>
      </blockquote>
      <br>
      This doesn't help at all with the reported bug. You're still
      reading from env. You need the mmu_idx that was passed to
      ppc_cpu_tlb_fill.
      <br>
    </blockquote>
    Ah, I saw a macro for MMU_IDX and assumed they pointed to different
    locations. Ok, the fix for ppc_cpu_tlb_fill should be easy, then<br>
    <blockquote type="cite"
      cite="mid:d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org">
      <br>
      For the use from ppc_cpu_get_phys_page_debug, you'd pass in
      cpu_mmu_index(env, false).
      <br>
    </blockquote>
    <p>ppc_cpu_get_phys_page_debug has 2 calls to ppc_xlate, one using
      the data MMU, the other using the instruction MMU. I'm guessing I
      should pass both, right?</p>
    <p>But here we have another bit that confuses me: cpu_mmu_index
      returns 0 if in user mode, or uses the information stored in env
      to get it, so I don't see how that would be different from getting
      directly. Unless the point is to have ppc_*_xlate be generic and
      pc_*_debug knows the info in env is correct. Is that it?<br>
    </p>
    <blockquote type="cite"
      cite="mid:d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org">
      <br>
      <br>
      <blockquote type="cite">+    const short HV = 1, IR = 2, DR = 3;
        <br>
        +    bool MSR[3];
        <br>
        +    MSR[HV] = dmmu_idx &amp; 2,
        <br>
        +    MSR[IR] = immu_idx &amp; 4,
        <br>
        +    MSR[DR] = dmmu_idx &amp; 4;
        <br>
      </blockquote>
      <br>
      There's no point in the array.  Just use three different scalars
      (real_mode, hv, and pr (note that pr is the major portion of the
      bug as reported)). Additionally, you'll not be distinguishing
      immu_idx and dmmu_idx, but using the single idx that's given.
      <br>
    </blockquote>
    <p>Ah, yeah, that's the "more complex than necessary, but it was
      easy for me to read" part. Scalars are a good solution. In this
      function in specific, PR doesn't actually show up anywhere, so I
      would actually only need 2. Anyway, will start working on this.<br>
    </p>
    <blockquote type="cite"
      cite="mid:d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org">
      <br>
      <blockquote type="cite">-    if (access_type == MMU_INST_FETCH ?
        !msr_ir : !msr_dr) {
        <br>
        +    if (access_type == MMU_INST_FETCH ? !MSR[IR] : !MSR[DR]) {
        <br>
      </blockquote>
      <br>
      Which simplifies this condition to just a single test.
      <br>
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

--------------F203444E559899C6A3A29510--

