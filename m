Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C538B518
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:20:50 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmLp-0007j7-Ks
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljmF8-0008RW-LA; Thu, 20 May 2021 13:13:54 -0400
Received: from [201.28.113.2] (port=37895 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ljmF6-0000yX-FI; Thu, 20 May 2021 13:13:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 20 May 2021 14:13:47 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id CD4068013E1;
 Thu, 20 May 2021 14:13:46 -0300 (-03)
Subject: Re: [PATCH 24/24] target/ppc: Restrict ppc_cpu_tlb_fill to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-25-richard.henderson@linaro.org>
 <c50f336a-37bc-2d16-0c7f-87562cb017c3@eldorado.org.br>
 <a363c75c-5b50-5119-f67b-9b860def2151@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <4bf4ca80-e550-d839-86df-0537a0c905d5@eldorado.org.br>
Date: Thu, 20 May 2021 14:13:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a363c75c-5b50-5119-f67b-9b860def2151@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------6C1CBB8503EAA187DD8C106A"
Content-Language: en-US
X-OriginalArrivalTime: 20 May 2021 17:13:47.0094 (UTC)
 FILETIME=[7EA82F60:01D74D9B]
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
Cc: lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------6C1CBB8503EAA187DD8C106A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/05/2021 11:52, Richard Henderson wrote:
> On 5/20/21 8:18 AM, Bruno Piazera Larsen wrote:
>>> +#ifdef CONFIG_TCG
>>>   bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
>>>                         MMUAccessType access_type, int mmu_idx,
>>>                         bool probe, uintptr_t retaddr)
>>> @@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs, vaddr 
>>> eaddr, int size,
>>>       raise_exception_err_ra(&cpu->env, cs->exception_index,
>>>                              cpu->env.error_code, retaddr);
>>>   }
>>> +#endif
>>
>> This patch makes it look like we would compile mmu_helper.c after 
>> all. Is that it? That looks like the simplest solution (ifdef'ing 
>> away all helpers) but I thought mmu_helper was supposed to have all 
>> TCG-only code relating to MMU.
>
> Yes, we will always compile mmu_helper.c. -- it was always going to 
> have the stuff for gdbstub.
>
> It was exc_helper which I was hoping for tcg-only (but then we decided 
> that ifdefs were going to be the short-term solution).
>
Ah, it was just me misremembering then. Well, with this patch and the 
final bits that I hadn't sent with v2 (I didn't want to change 
meson.build without fully supporting disable-tcg) everything is 
compiling, but tests are... spotty, at best

The check-acceptance group of tests only had one test that was passed, 
the tests/acceptance/machine_ppc.py:PpcMachine.test_ppc64_pseries, all 
the others either timed out or failed, and make check got up to 
prom-env-test, which failed and left the whole thing hanging. The fail 
was: ../../tests/qtest/prom-env-test.c:43:check_guest_memory: assertion 
failed (signature == MAGIC): (0x00000000 == 0xcafec0de)

I bring this up because I don't know how much shoul dbe working and how 
much is TCG-only testing which shouldn't be running and we should 
disable for the final patch

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------6C1CBB8503EAA187DD8C106A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20/05/2021 11:52, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a363c75c-5b50-5119-f67b-9b860def2151@linaro.org">On
      5/20/21 8:18 AM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">
        <blockquote type="cite">+#ifdef CONFIG_TCG
          <br>
            bool ppc_cpu_tlb_fill(CPUState *cs, vaddr eaddr, int size,
          <br>
                                  MMUAccessType access_type, int
          mmu_idx,
          <br>
                                  bool probe, uintptr_t retaddr)
          <br>
          @@ -2984,3 +2985,4 @@ bool ppc_cpu_tlb_fill(CPUState *cs,
          vaddr eaddr, int size,
          <br>
                raise_exception_err_ra(&amp;cpu-&gt;env,
          cs-&gt;exception_index,
          <br>
                                       cpu-&gt;env.error_code, retaddr);
          <br>
            }
          <br>
          +#endif
          <br>
        </blockquote>
        <br>
        This patch makes it look like we would compile mmu_helper.c
        after all. Is that it? That looks like the simplest solution
        (ifdef'ing away all helpers) but I thought mmu_helper was
        supposed to have all TCG-only code relating to MMU.
        <br>
      </blockquote>
      <br>
      Yes, we will always compile mmu_helper.c. -- it was always going
      to have the stuff for gdbstub.
      <br>
      <br>
      It was exc_helper which I was hoping for tcg-only (but then we
      decided that ifdefs were going to be the short-term solution).
      <br>
      <br>
    </blockquote>
    <p>Ah, it was just me misremembering then. Well, with this patch and
      the final bits that I hadn't sent with v2 (I didn't want to change
      meson.build without fully supporting disable-tcg) everything is
      compiling, but tests are... spotty, at best</p>
    <p>The check-acceptance group of tests only had one test that was
      passed, the
      tests/acceptance/machine_ppc.py:PpcMachine.test_ppc64_pseries, all
      the others either timed out or failed, and make check got up to
      prom-env-test, which failed and left the whole thing hanging. The
      fail was: ../../tests/qtest/prom-env-test.c:43:check_guest_memory:
      assertion failed (signature == MAGIC): (0x00000000 == 0xcafec0de)<br>
    </p>
    <p>I bring this up because I don't know how much shoul dbe working
      and how much is TCG-only testing which shouldn't be running and we
      should disable for the final patch<br>
    </p>
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

--------------6C1CBB8503EAA187DD8C106A--

