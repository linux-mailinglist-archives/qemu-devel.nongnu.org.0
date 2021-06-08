Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E244639F964
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:41:56 +0200 (CEST)
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcvT-0004oU-VL
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqct9-0003rQ-M8; Tue, 08 Jun 2021 10:39:31 -0400
Received: from [201.28.113.2] (port=23258 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqct7-0000CI-Kb; Tue, 08 Jun 2021 10:39:31 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 8 Jun 2021 11:39:25 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 03B9380148E;
 Tue,  8 Jun 2021 11:39:24 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
 <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
 <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
 <7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <b5834a1f-afaa-a36a-11d6-35a197ad74bc@eldorado.org.br>
Date: Tue, 8 Jun 2021 11:39:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------9CCB4E00AD8BAE17A874A234"
Content-Language: en-US
X-OriginalArrivalTime: 08 Jun 2021 14:39:25.0312 (UTC)
 FILETIME=[140DA800:01D75C74]
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
--------------9CCB4E00AD8BAE17A874A234
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 07/06/2021 18:06, Richard Henderson wrote:
> On 6/7/21 12:29 PM, Bruno Piazera Larsen wrote:
>> I just tried sending mmu_idx all the way down, but I ran into a very 
>> weird bug of gcc. If we have to add one more parameter that GCC can't 
>> just optimize away we get at least a slow down of 5x for the first 
>> test of check-acceptance (could be more, but the test times out after 
>> 900 seconds, so I'm not sure).
>
> That's odd.  We already have more arguments than the number of 
> argument registers...  A 5x slowdown is distinctly odd.
I did some more digging and the problem is not with 
ppc_radix64_check_prot, the problem is ppc_radix64_xlate, which 
currently has 7 arguments and we're increasing to 8. 7 feels like the 
correct number, but I couldn't find docs supporting it, so I could be 
wrong.
>
>
>> One way that I managed to get around that is saving the current MSR, 
>> setting it to 5, and restoring after the xlate call. The code ended 
>> up something like:
>>
>> int new_idx = (5<<HFLAGS_IMMU_IDX) | (5<<HFLAGS_DMMU_IDX);
>> int clr = (7<<HFLAGS_IMMU_IDX) | (7<<HFLAGS_DMMU_IDX);
>> int old_idx = env->msr & clr;
>> clr = ~clr;
>> /* set new msr so we don't need to send the mmu_idx */
>> env->msr = (env->msr & clr) | new_idx;
>> ret = ppc_radix64_partition_scoped_xlate(...);
>> /* restore old mmu_idx */
>> env->msr = (env->msr & clr) | old_idx;
>
> No, this is silly.
>
> We need to do one of two things:
>   - make sure everything is inlined,
>   - reduce the number of arguments.
>
> We're currently passing in 9 arguments, which really is too many 
> already.  We should be using something akin to mmu_ctx_t, but probably 
> specific to radix64 without the random stuff collected for random 
> other mmu models.

That means we'd have to define radix_ctx_t (or however we call it) in 
radix64.h, setup the struct on ppc_xlate, then pass it to ppc_radix64_xlate.

 From looking at the code, it seems the most useful bits to put in the 
struct are: eaddr, g_addr, h_addr, {h,g}_prot, {g,h}_page_size, mmu_idx 
and guest_visible. They all seem reasonable to me, but I might be 
missing something again.

>
>
> r~
Another question: I know hash mmus don't have this problem, but since 
ppc_jumbo_xlate also uses mmu_idx, should we make those xlate user 
mmu_idxs as well? I tested and it doesn't make a time difference.
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------9CCB4E00AD8BAE17A874A234
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07/06/2021 18:06, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org">On
      6/7/21 12:29 PM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">I just tried sending mmu_idx all the way
        down, but I ran into a very weird bug of gcc. If we have to add
        one more parameter that GCC can't just optimize away we get at
        least a slow down of 5x for the first test of check-acceptance
        (could be more, but the test times out after 900 seconds, so I'm
        not sure).
        <br>
      </blockquote>
      <br>
      That's odd.  We already have more arguments than the number of
      argument registers...  A 5x slowdown is distinctly odd.
      <br>
    </blockquote>
    I did some more digging and the problem is not with
    ppc_radix64_check_prot, the problem is ppc_radix64_xlate, which
    currently has 7 arguments and we're increasing to 8. 7 feels like
    the correct number, but I couldn't find docs supporting it, so I
    could be wrong.
    <blockquote type="cite"
      cite="mid:7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org">
      <br>
      <br>
      <blockquote type="cite">One way that I managed to get around that
        is saving the current MSR, setting it to 5, and restoring after
        the xlate call. The code ended up something like:
        <br>
        <br>
        int new_idx = (5&lt;&lt;HFLAGS_IMMU_IDX) |
        (5&lt;&lt;HFLAGS_DMMU_IDX);
        <br>
        int clr = (7&lt;&lt;HFLAGS_IMMU_IDX) |
        (7&lt;&lt;HFLAGS_DMMU_IDX);
        <br>
        int old_idx = env-&gt;msr &amp; clr;
        <br>
        clr = ~clr;
        <br>
        /* set new msr so we don't need to send the mmu_idx */
        <br>
        env-&gt;msr = (env-&gt;msr &amp; clr) | new_idx;
        <br>
        ret = ppc_radix64_partition_scoped_xlate(...);
        <br>
        /* restore old mmu_idx */
        <br>
        env-&gt;msr = (env-&gt;msr &amp; clr) | old_idx;
        <br>
      </blockquote>
      <br>
      No, this is silly.
      <br>
      <br>
      We need to do one of two things:
      <br>
        - make sure everything is inlined,
      <br>
        - reduce the number of arguments.
      <br>
      <br>
      We're currently passing in 9 arguments, which really is too many
      already.  We should be using something akin to mmu_ctx_t, but
      probably specific to radix64 without the random stuff collected
      for random other mmu models.
      <br>
    </blockquote>
    <p>That means we'd have to define radix_ctx_t (or however we call
      it) in radix64.h, setup the struct on ppc_xlate, then pass it to
      ppc_radix64_xlate.</p>
    <p>From looking at the code, it seems the most useful bits to put in
      the struct are: eaddr, g_addr, h_addr, {h,g}_prot,
      {g,h}_page_size, mmu_idx and guest_visible. They all seem
      reasonable to me, but I might be missing something again.<br>
    </p>
    <blockquote type="cite"
      cite="mid:7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
    Another question: I know hash mmus don't have this problem, but
    since ppc_jumbo_xlate also uses mmu_idx, should we make those xlate
    user mmu_idxs as well? I tested and it doesn't make a time
    difference.<br>
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

--------------9CCB4E00AD8BAE17A874A234--

