Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87D0380E82
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:58:05 +0200 (CEST)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhb8W-0001IL-7V
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhaaX-0005mF-Qg; Fri, 14 May 2021 12:22:58 -0400
Received: from [201.28.113.2] (port=35159 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lhaaT-0006ot-CH; Fri, 14 May 2021 12:22:55 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 14 May 2021 13:22:49 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id AE94F8013D0;
 Fri, 14 May 2021 13:22:48 -0300 (-03)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
 <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
 <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <b32575a0-07b6-1819-1dec-525277c98cb1@eldorado.org.br>
Date: Fri, 14 May 2021 13:22:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------EC190262CD19EC0B8A766664"
Content-Language: en-US
X-OriginalArrivalTime: 14 May 2021 16:22:49.0095 (UTC)
 FILETIME=[61781170:01D748DD]
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
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------EC190262CD19EC0B8A766664
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/05/2021 11:44, Richard Henderson wrote:
> On 5/14/21 8:29 AM, Bruno Piazera Larsen wrote:
>>
>> On 12/05/2021 15:57, Bruno Piazera Larsen wrote:
>>> On 12/05/2021 15:33, Richard Henderson wrote:
>>>> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>>>>> diff --git a/include/exec/helper-proto.h 
>>>>> b/include/exec/helper-proto.h
>>>>> index ba100793a7..ce287222ee 100644
>>>>> --- a/include/exec/helper-proto.h
>>>>> +++ b/include/exec/helper-proto.h
>>>>> @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), 
>>>>> dh_ctype(t2), dh_ctype(t3), \
>>>>>   #define IN_HELPER_PROTO
>>>>>     #include "helper.h"
>>>>> +#ifdef CONFIG_TCG
>>>>>   #include "trace/generated-helpers.h"
>>>>> +#endif
>>>>>   #include "accel/tcg/tcg-runtime.h"
>>>>>   #include "accel/tcg/plugin-helpers.h"
>>>>
>>>> Um.. this file is exclusively TCG already.
>>>> Are you missing some use of helper_foo()?
>>> A lot of files that we are compiling (mainly mmu-*, excp_helper and 
>>> gdbstub IIRC). We could comb through all of them and remove all 
>>> declarations of helpers and wrap the inclusion of helper-proto 
>>> itself in ifdefs, but it felt unnecessarily long. If it is 
>>> preferable, we can do it.
>>>
>> So, I just looked and we'd need to change excp_helper.c and 
>> mmu-hash64.c, encasing 14 and 8 helper_foo() declarations. Is it 
>> better to work on those 2 files, or to change helper-proto?
>
> Let's work on excp_helper.c and mmu-hash64.c.
>
> For excp_helper.c, ideally everything in there would be tcg related.  
> Either explicitly as helper_foo() or by being one of the TCGCPUOps 
> functions like ppc_cpu_exec_interrupt.

Removing excp_helper.c gives linker errors for the functions:

* ppc_cpu_do_system_reset, on hw/ppc/pnv.c and hw/ppc/spapr.c

* ppc_do_cpu_interrupt, on hw/ppc/spapr_events.c and target/ppc/kvm.c, 
and from what was discussed on the IRC this should still be compiled

* ppc_cpu_do_fwnmi_machine_check, on hw/ppc/spapr_events.c


I think ppc_do_cpu_interrupt could go to cpu.c, but no clue where the 
others should go.

>
> For mmu-hash64.c... I guess the easiest thing in the short term is to 
> put big ifdefs around helper_slbi{a,e,eg}.  Or they could be moved to 
> mmu_helper.c, with slb_lookup declared in mmu-hash64.h.
>
The ifdefs are easy enough, and not compiling it gives way too many 
linker errors. Moving the helpers and static functions sounds the 
cleanest though, so I'll look into it while I wait for the excp_helper help
>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------EC190262CD19EC0B8A766664
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14/05/2021 11:44, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org">On
      5/14/21 8:29 AM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">
        <br>
        On 12/05/2021 15:57, Bruno Piazera Larsen wrote:
        <br>
        <blockquote type="cite">On 12/05/2021 15:33, Richard Henderson
          wrote:
          <br>
          <blockquote type="cite">On 5/12/21 9:08 AM, Bruno Larsen
            (billionai) wrote:
            <br>
            <blockquote type="cite">diff --git
              a/include/exec/helper-proto.h
              b/include/exec/helper-proto.h
              <br>
              index ba100793a7..ce287222ee 100644
              <br>
              --- a/include/exec/helper-proto.h
              <br>
              +++ b/include/exec/helper-proto.h
              <br>
              @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name)
              (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
              <br>
                #define IN_HELPER_PROTO
              <br>
                  #include "helper.h"
              <br>
              +#ifdef CONFIG_TCG
              <br>
                #include "trace/generated-helpers.h"
              <br>
              +#endif
              <br>
                #include "accel/tcg/tcg-runtime.h"
              <br>
                #include "accel/tcg/plugin-helpers.h"
              <br>
            </blockquote>
            <br>
            Um.. this file is exclusively TCG already.
            <br>
            Are you missing some use of helper_foo()?
            <br>
          </blockquote>
          A lot of files that we are compiling (mainly mmu-*,
          excp_helper and gdbstub IIRC). We could comb through all of
          them and remove all declarations of helpers and wrap the
          inclusion of helper-proto itself in ifdefs, but it felt
          unnecessarily long. If it is preferable, we can do it.
          <br>
          <br>
        </blockquote>
        So, I just looked and we'd need to change excp_helper.c and
        mmu-hash64.c, encasing 14 and 8 helper_foo() declarations. Is it
        better to work on those 2 files, or to change helper-proto?
        <br>
      </blockquote>
      <br>
      Let's work on excp_helper.c and mmu-hash64.c.
      <br>
      <br>
      For excp_helper.c, ideally everything in there would be tcg
      related.  Either explicitly as helper_foo() or by being one of the
      TCGCPUOps functions like ppc_cpu_exec_interrupt.
      <br>
    </blockquote>
    <p>Removing excp_helper.c gives linker errors for the functions:</p>
    <p>* ppc_cpu_do_system_reset, on hw/ppc/pnv.c and hw/ppc/spapr.c</p>
    <p>* ppc_do_cpu_interrupt, on hw/ppc/spapr_events.c and
      target/ppc/kvm.c, and from what was discussed on the IRC this
      should still be compiled</p>
    <p>* ppc_cpu_do_fwnmi_machine_check, on hw/ppc/spapr_events.c</p>
    <p><br>
    </p>
    <p>I think ppc_do_cpu_interrupt could go to cpu.c, but no clue where
      the others should go.<br>
    </p>
    <blockquote type="cite"
      cite="mid:81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org">
      <br>
      For mmu-hash64.c... I guess the easiest thing in the short term is
      to put big ifdefs around helper_slbi{a,e,eg}.  Or they could be
      moved to mmu_helper.c, with slb_lookup declared in mmu-hash64.h.
      <br>
      <br>
    </blockquote>
    The ifdefs are easy enough, and not compiling it gives way too many
    linker errors. Moving the helpers and static functions sounds the
    cleanest though, so I'll look into it while I wait for the
    excp_helper help<br>
    <blockquote type="cite"
      cite="mid:81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org">
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

--------------EC190262CD19EC0B8A766664--

