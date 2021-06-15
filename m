Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF183A7DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 14:03:48 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7nH-00017v-1n
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 08:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt7kQ-0007hL-8f; Tue, 15 Jun 2021 08:00:50 -0400
Received: from [201.28.113.2] (port=39278 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt7kN-0000Hp-FL; Tue, 15 Jun 2021 08:00:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 08:59:29 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 853BF800144;
 Tue, 15 Jun 2021 08:59:29 -0300 (-03)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <87o8c8uoio.fsf@linux.ibm.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <48dc679b-796c-68fc-b0fd-a73173dbc3cc@eldorado.org.br>
Date: Tue, 15 Jun 2021 08:59:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8c8uoio.fsf@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------B957025BAB96E9D08F59FDAC"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 11:59:29.0868 (UTC)
 FILETIME=[E59D58C0:01D761DD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
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
Cc: richard.henderson@linaro.org, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B957025BAB96E9D08F59FDAC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/06/2021 18:25, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>
>> This patch changes ppc_cpu_get_phys_page_debug so that it is now
>> able to translate both, priviledged and real mode addresses
>> independently of whether the CPU executing it has those permissions
>>
>> This was mentioned by Fabiano as something that would be very useful to
>> help with debugging, but could possibly constitute a security issue if
>> that debug function can be called in some way by prodution code.
> Thinking a bit more about this, I think we just need to make sure that
> this is not called during the regular operation of the virtual
> machine. So not as much a security issue, more of a correctness one.
yeah, but it's an issue of correctness that can lead to a security 
issue, so I think it's worth documenting at the very least
>
>> the
>> solution was implemented such that it would be trivial to wrap it around
>> ifdefs for building only with --enable-debug, for instance, but we are
>> not sure this is the best approach, hence why it is an RFC.
>>
>> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
>> index 9dcdf88597..41c727c690 100644
>> --- a/target/ppc/mmu_helper.c
>> +++ b/target/ppc/mmu_helper.c
>> @@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>>                     cpu_mmu_index(&cpu->env, true), false)) {
>>           return raddr & TARGET_PAGE_MASK;
>>       }
>> +
>> +    /*
>> +     * This is a fallback, in case we're asking for priviledged memory to
>> +     * be printed, but the PCU is not executing in a priviledged manner.
>> +     *
>> +     * The code could be considered a security vulnerability if
>> +     * this function can be called in a scenario that does not involve
>> +     * debugging.
>> +     * Given the name and how useful using real addresses may be for
>> +     * actually debugging, however, we decided to include it anyway and
>> +     * discuss how to best avoid the possible security concerns.
>> +     * The current plan is that, if there is a chance this code is called in
>> +     * a production environment, we can surround it with ifdefs so that it
>> +     * is only compiled with --enable-debug
>> +     */
>> +        /* attempt to translate first with virtual addresses */
>> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 1, false) ||
>> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 1, false) ||
>> +        /* if didn't work, attempt to translate with real addresses */
>> +        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 3, false) ||
>> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 3, false)) {
>> +        return raddr & TARGET_PAGE_MASK;
>> +    }
> If this is only used during debug we could just give it the highest
> mmu_idx, no need for a fallback.
we actually don't want to set the HV bit, because gdb is using the 
virtual hypervisor, so it'd trigger an assert that both HV and vhyp are 
set.
>
> Now, it might be possible that people use GDB to debug some aspect of
> the MMU emulation, in which case it would be more useful to have the GDB
> access fail just as the CPU would. But from my perspective it would be
> better to have GDB access all of the guest memory without restriction.
Yeah, could also be a thing. I really don't know, though, because before 
the mmu_idx was 0, so it wouldn't work even before this patch. Some more 
discussion is appreciated for the people who implement MMUs :)
>
>>       return -1;
>>   }
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------B957025BAB96E9D08F59FDAC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14/06/2021 18:25, Fabiano Rosas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87o8c8uoio.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch changes ppc_cpu_get_phys_page_debug so that it is now
able to translate both, priviledged and real mode addresses
independently of whether the CPU executing it has those permissions

This was mentioned by Fabiano as something that would be very useful to
help with debugging, but could possibly constitute a security issue if
that debug function can be called in some way by prodution code.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thinking a bit more about this, I think we just need to make sure that
this is not called during the regular operation of the virtual
machine. So not as much a security issue, more of a correctness one.</pre>
    </blockquote>
    yeah, but it's an issue of correctness that can lead to a security
    issue, so I think it's worth documenting at the very least<br>
    <blockquote type="cite" cite="mid:87o8c8uoio.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">the
solution was implemented such that it would be trivial to wrap it around
ifdefs for building only with --enable-debug, for instance, but we are
not sure this is the best approach, hence why it is an RFC.

Suggested-by: Fabiano Rosas <a class="moz-txt-link-rfc2396E" href="mailto:farosas@linux.ibm.com">&lt;farosas@linux.ibm.com&gt;</a>
Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9dcdf88597..41c727c690 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
                   cpu_mmu_index(&amp;cpu-&gt;env, true), false)) {
         return raddr &amp; TARGET_PAGE_MASK;
     }
+
+    /*
+     * This is a fallback, in case we're asking for priviledged memory to
+     * be printed, but the PCU is not executing in a priviledged manner.
+     *
+     * The code could be considered a security vulnerability if
+     * this function can be called in a scenario that does not involve
+     * debugging.
+     * Given the name and how useful using real addresses may be for
+     * actually debugging, however, we decided to include it anyway and
+     * discuss how to best avoid the possible security concerns.
+     * The current plan is that, if there is a chance this code is called in
+     * a production environment, we can surround it with ifdefs so that it
+     * is only compiled with --enable-debug
+     */
+        /* attempt to translate first with virtual addresses */
+    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 1, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 1, false) ||
+        /* if didn't work, attempt to translate with real addresses */
+        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &amp;raddr, &amp;s, &amp;p, 3, false) ||
+        ppc_xlate(cpu, addr, MMU_INST_FETCH, &amp;raddr, &amp;s, &amp;p, 3, false)) {
+        return raddr &amp; TARGET_PAGE_MASK;
+    }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If this is only used during debug we could just give it the highest
mmu_idx, no need for a fallback.</pre>
    </blockquote>
    we actually don't want to set the HV bit, because gdb is using the
    virtual hypervisor, so it'd trigger an assert that both HV and vhyp
    are set. <br>
    <blockquote type="cite" cite="mid:87o8c8uoio.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

Now, it might be possible that people use GDB to debug some aspect of
the MMU emulation, in which case it would be more useful to have the GDB
access fail just as the CPU would. But from my perspective it would be
better to have GDB access all of the guest memory without restriction.</pre>
    </blockquote>
    Yeah, could also be a thing. I really don't know, though, because
    before the mmu_idx was 0, so it wouldn't work even before this
    patch. Some more discussion is appreciated for the people who
    implement MMUs :)<br>
    <blockquote type="cite" cite="mid:87o8c8uoio.fsf@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">     return -1;
 }
</pre>
      </blockquote>
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

--------------B957025BAB96E9D08F59FDAC--

