Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44C39E785
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:33:11 +0200 (CEST)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKzm-00027x-03
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqKw7-0000C7-FS; Mon, 07 Jun 2021 15:29:23 -0400
Received: from [201.28.113.2] (port=41930 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqKw5-00008j-2I; Mon, 07 Jun 2021 15:29:23 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 7 Jun 2021 16:29:15 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 67CD1801387;
 Mon,  7 Jun 2021 16:29:15 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
 <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
Date: Mon, 7 Jun 2021 16:29:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------61C86F1951D8AD48B965B624"
Content-Language: en-US
X-OriginalArrivalTime: 07 Jun 2021 19:29:15.0773 (UTC)
 FILETIME=[6729AAD0:01D75BD3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------61C86F1951D8AD48B965B624
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/06/2021 19:19, Richard Henderson wrote:
> On 6/2/21 12:58 PM, Bruno Piazera Larsen wrote:
>>> For the use from ppc_cpu_get_phys_page_debug, you'd pass in 
>>> cpu_mmu_index(env, false).
>>
>> ppc_cpu_get_phys_page_debug has 2 calls to ppc_xlate, one using the 
>> data MMU, the other using the instruction MMU. I'm guessing I should 
>> pass both, right?
>
> Yes.
>
>> But here we have another bit that confuses me: cpu_mmu_index returns 
>> 0 if in user mode, or uses the information stored in env to get it, 
>> so I don't see how that would be different from getting directly. 
>> Unless the point is to have ppc_*_xlate be generic and pc_*_debug 
>> knows the info in env is correct. Is that it?
>
> The issue is that
>
> (1) ppc_*_xlate should perform the lookup requested, and mmu_idx
>     does not *necessarily* correspond to the current contents of
>     env->msr et al.  See (2).
>
> (2) There is a secondary call to ppc_radix64_partition_scoped_xlate
>     for which the second stage page table should be read
>     with hypervisor permissions, and not the permissions of the
>     original memory access.
>
>     Note that ppc_radix64_check_prot checks msr_pr directly.
>
>     Thus the second stage lookup should use mmu_idx = 5
>     (HV kernel virtual mode).  If I understand things correctly...
>
>>
>>>
>>>
>>>> +    const short HV = 1, IR = 2, DR = 3;
>>>> +    bool MSR[3];
>>>> +    MSR[HV] = dmmu_idx & 2,
>>>> +    MSR[IR] = immu_idx & 4,
>>>> +    MSR[DR] = dmmu_idx & 4;
>>>
>>> There's no point in the array.  Just use three different scalars 
>>> (real_mode, hv, and pr (note that pr is the major portion of the bug 
>>> as reported)). Additionally, you'll not be distinguishing immu_idx 
>>> and dmmu_idx, but using the single idx that's given.
>>
>> Ah, yeah, that's the "more complex than necessary, but it was easy 
>> for me to read" part. Scalars are a good solution. In this function 
>> in specific, PR doesn't actually show up anywhere, so I would 
>> actually only need 2. Anyway, will start working on this.
>
> Oh, I'll note that your constants above are wrong.  I think that you 
> should have some common routines in (mmu-)internal.h:
>
> /*
>  * These correspond to the mmu_idx values computed in
>  * hreg_compute_hflags_value.  See the tables therein.
>  */
> static inline bool mmuidx_pr(int idx) { return idx & 1; }
> static inline bool mmuidx_real(int idx) { return idx & 2; }
> static inline bool mmuidx_hv(int idx) { return idx & 4; }
>
> because you'll want to use these past mmu-radix64.c.
>
> Then you also have a single place to adjust if the mmu_idx are 
> reordered at a later date.
>
>
> r~

I just tried sending mmu_idx all the way down, but I ran into a very 
weird bug of gcc. If we have to add one more parameter that GCC can't 
just optimize away we get at least a slow down of 5x for the first test 
of check-acceptance (could be more, but the test times out after 900 
seconds, so I'm not sure). One way that I managed to get around that is 
saving the current MSR, setting it to 5, and restoring after the xlate 
call. The code ended up something like:

int new_idx = (5<<HFLAGS_IMMU_IDX) | (5<<HFLAGS_DMMU_IDX);
int clr = (7<<HFLAGS_IMMU_IDX) | (7<<HFLAGS_DMMU_IDX);
int old_idx = env->msr & clr;
clr = ~clr;
/* set new msr so we don't need to send the mmu_idx */
env->msr = (env->msr & clr) | new_idx;
ret = ppc_radix64_partition_scoped_xlate(...);
/* restore old mmu_idx */
env->msr = (env->msr & clr) | old_idx;

That way we continue to use the env as the way to send the variable and 
avoid what I think is a problem with the compiler's optimization.

Would this be acceptable (with proper documentation in the form of 
comments, ofc) or do we have to find a better solution that doesn't 
touch the values of env? I personally don't like it, but I couldn't find 
a better solution. If you're fine with it, we can use it, otherwise I'll 
keep looking.

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer If
<https://www.eldorado.org.br/disclaimer.html>

--------------61C86F1951D8AD48B965B624
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02/06/2021 19:19, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org">On
      6/2/21 12:58 PM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">
        <blockquote type="cite">For the use from
          ppc_cpu_get_phys_page_debug, you'd pass in cpu_mmu_index(env,
          false).
          <br>
        </blockquote>
        <br>
        ppc_cpu_get_phys_page_debug has 2 calls to ppc_xlate, one using
        the data MMU, the other using the instruction MMU. I'm guessing
        I should pass both, right?
        <br>
      </blockquote>
      <br>
      Yes.
      <br>
      <br>
      <blockquote type="cite">But here we have another bit that confuses
        me: cpu_mmu_index returns 0 if in user mode, or uses the
        information stored in env to get it, so I don't see how that
        would be different from getting directly. Unless the point is to
        have ppc_*_xlate be generic and pc_*_debug knows the info in env
        is correct. Is that it?
        <br>
      </blockquote>
      <br>
      The issue is that
      <br>
      <br>
      (1) ppc_*_xlate should perform the lookup requested, and mmu_idx
      <br>
          does not *necessarily* correspond to the current contents of
      <br>
          env-&gt;msr et al.  See (2).
      <br>
      <br>
      (2) There is a secondary call to
      ppc_radix64_partition_scoped_xlate
      <br>
          for which the second stage page table should be read
      <br>
          with hypervisor permissions, and not the permissions of the
      <br>
          original memory access.
      <br>
      <br>
          Note that ppc_radix64_check_prot checks msr_pr directly.
      <br>
      <br>
          Thus the second stage lookup should use mmu_idx = 5
      <br>
          (HV kernel virtual mode).  If I understand things correctly...
      <br>
      <br>
      <blockquote type="cite">
        <br>
        <blockquote type="cite">
          <br>
          <br>
          <blockquote type="cite">+    const short HV = 1, IR = 2, DR =
            3;
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
          There's no point in the array.  Just use three different
          scalars (real_mode, hv, and pr (note that pr is the major
          portion of the bug as reported)). Additionally, you'll not be
          distinguishing immu_idx and dmmu_idx, but using the single idx
          that's given.
          <br>
        </blockquote>
        <br>
        Ah, yeah, that's the "more complex than necessary, but it was
        easy for me to read" part. Scalars are a good solution. In this
        function in specific, PR doesn't actually show up anywhere, so I
        would actually only need 2. Anyway, will start working on this.
        <br>
      </blockquote>
      <br>
      Oh, I'll note that your constants above are wrong.  I think that
      you should have some common routines in (mmu-)internal.h:
      <br>
      <br>
      /*
      <br>
       * These correspond to the mmu_idx values computed in
      <br>
       * hreg_compute_hflags_value.  See the tables therein.
      <br>
       */
      <br>
      static inline bool mmuidx_pr(int idx) { return idx &amp; 1; }
      <br>
      static inline bool mmuidx_real(int idx) { return idx &amp; 2; }
      <br>
      static inline bool mmuidx_hv(int idx) { return idx &amp; 4; }
      <br>
      <br>
      because you'll want to use these past mmu-radix64.c.
      <br>
      <br>
      Then you also have a single place to adjust if the mmu_idx are
      reordered at a later date.
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <p>I just tried sending mmu_idx all the way down, but I ran into a
      very weird bug of gcc. If we have to add one more parameter that
      GCC can't just optimize away we get at least a slow down of 5x for
      the first test of check-acceptance (could be more, but the test
      times out after 900 seconds, so I'm not sure). One way that I
      managed to get around that is saving the current MSR, setting it
      to 5, and restoring after the xlate call. The code ended up
      something like:</p>
    <p>int new_idx = (5&lt;&lt;HFLAGS_IMMU_IDX) |
      (5&lt;&lt;HFLAGS_DMMU_IDX);<br>
      int clr = (7&lt;&lt;HFLAGS_IMMU_IDX) | (7&lt;&lt;HFLAGS_DMMU_IDX);<br>
      int old_idx = env-&gt;msr &amp; clr;<br>
      clr = ~clr;<br>
      /* set new msr so we don't need to send the mmu_idx */<br>
      env-&gt;msr = (env-&gt;msr &amp; clr) | new_idx;<br>
      ret = ppc_radix64_partition_scoped_xlate(...);<br>
      /* restore old mmu_idx */<br>
      env-&gt;msr = (env-&gt;msr &amp; clr) | old_idx;</p>
    <p>That way we continue to use the env as the way to send the
      variable and avoid what I think is a problem with the compiler's
      optimization.</p>
    <p>Would this be acceptable (with proper documentation in the form
      of comments, ofc) or do we have to find a better solution that
      doesn't touch the values of env? I personally don't like it, but I
      couldn't find a better solution. If you're fine with it, we can
      use it, otherwise I'll keep looking.<br>
    </p>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer If <br>
      </a></div>
  </body>
</html>

--------------61C86F1951D8AD48B965B624--

