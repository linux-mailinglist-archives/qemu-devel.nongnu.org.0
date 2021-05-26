Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD60E391E79
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:55:07 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxkI-0002RE-Nv
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llxGs-0006Dg-AX; Wed, 26 May 2021 13:24:45 -0400
Received: from [201.28.113.2] (port=40208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llxGm-0005YN-SX; Wed, 26 May 2021 13:24:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 14:24:33 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id D45088013CA;
 Wed, 26 May 2021 14:24:32 -0300 (-03)
Subject: Re: [PATCH v5 2/4] target/ppc: added ifdefs around TCG-only code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
 <20210525115355.8254-3-bruno.larsen@eldorado.org.br>
 <8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <abf18c12-129f-b1a5-5d67-90fc6fa71afe@eldorado.org.br>
Date: Wed, 26 May 2021 14:24:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org>
Content-Type: multipart/alternative;
 boundary="------------A25696FB46D2F29A3CA10444"
Content-Language: en-US
X-OriginalArrivalTime: 26 May 2021 17:24:33.0201 (UTC)
 FILETIME=[FE3ECA10:01D75253]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A25696FB46D2F29A3CA10444
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 25/05/2021 10:02, Philippe Mathieu-Daudé wrote:
> On 5/25/21 1:53 PM, Bruno Larsen (billionai) wrote:
>> excp_helper.c, mmu-hash64.c and mmu_helper.c have some function
>> declarations that are TCG-only, and couldn't be easily moved to a
>> TCG only file, so ifdefs were added around them.
>>
>> We also needed ifdefs around some header files because helper-proto.h
>> includes trace/generated-helpers.h, which is never created when building
>> without TCG, and cpu_ldst.h includes tcg/tcg.h, whose containing folder
>> is not included as a -iquote. As future cleanup, we could change the
>> part of the configuration script to add those.
>>
>> cpu_init.c also had a callback definition that is TCG only and could be
>> removed as part of a future cleanup (all the dump_statistics part is
>> almost never used and will become obsolete as we transition to using
>> decodetree).
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/cpu_init.c    |  2 ++
>>   target/ppc/excp_helper.c | 21 ++++++++++++++++++---
>>   target/ppc/mmu-hash64.c  | 11 ++++++++++-
>>   target/ppc/mmu_helper.c  | 16 ++++++++++++++--
>>   4 files changed, 44 insertions(+), 6 deletions(-)
> Please have a look at commit range 0a31c16c9ce..a2b0a27d33e
> for the MIPS convertion.
>
>>   #if !defined(CONFIG_USER_ONLY)
>> +#ifdef CONFIG_TCG
>>   void helper_store_msr(CPUPPCState *env, target_ulong val)
>>   {
> For example this one is similar to commit d60146a9389, you
> could simply move this function to tcg/sysemu/msr_helpers.c
> and modify the meson file, then when TCG is not available,
> the file isn't built, without having to use #ifdef'ry.

I can see what you mean, but I think the point was to not create 
separate files solely based on the accelerator type.

It's up to dgibson if we use that approach, but I agree that it could 
make the code quite a bit cleaner.

The next question would then be: should we go the whole 9 yards and add 
tcg/sysemu/* and tcg/linux-user/*, or can we just use tcg/* and rely on 
devs reading and understanding the meson.build file? I believe 
tcg/sysemu/* is going to be very empty (for now, only what is in 
mmu-hash64.c and is TCG-only, IIRC), so it sounds like a bit of an 
overkill, but I also see the argument for future-proofing.

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------A25696FB46D2F29A3CA10444
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25/05/2021 10:02, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org">
      <pre class="moz-quote-pre" wrap="">On 5/25/21 1:53 PM, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">excp_helper.c, mmu-hash64.c and mmu_helper.c have some function
declarations that are TCG-only, and couldn't be easily moved to a
TCG only file, so ifdefs were added around them.

We also needed ifdefs around some header files because helper-proto.h
includes trace/generated-helpers.h, which is never created when building
without TCG, and cpu_ldst.h includes tcg/tcg.h, whose containing folder
is not included as a -iquote. As future cleanup, we could change the
part of the configuration script to add those.

cpu_init.c also had a callback definition that is TCG only and could be
removed as part of a future cleanup (all the dump_statistics part is
almost never used and will become obsolete as we transition to using
decodetree).

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/cpu_init.c    |  2 ++
 target/ppc/excp_helper.c | 21 ++++++++++++++++++---
 target/ppc/mmu-hash64.c  | 11 ++++++++++-
 target/ppc/mmu_helper.c  | 16 ++++++++++++++--
 4 files changed, 44 insertions(+), 6 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Please have a look at commit range 0a31c16c9ce..a2b0a27d33e
for the MIPS convertion.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #if !defined(CONFIG_USER_ONLY)
+#ifdef CONFIG_TCG
 void helper_store_msr(CPUPPCState *env, target_ulong val)
 {
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For example this one is similar to commit d60146a9389, you
could simply move this function to tcg/sysemu/msr_helpers.c
and modify the meson file, then when TCG is not available,
the file isn't built, without having to use #ifdef'ry.</pre>
    </blockquote>
    <p>I can see what you mean, but I think the point was to not create
      separate files solely based on the accelerator type.</p>
    <p>It's up to dgibson if we use that approach, but I agree that it
      could make the code quite a bit cleaner. <br>
    </p>
    <p>The next question would then be: should we go the whole 9 yards
      and add tcg/sysemu/* and tcg/linux-user/*, or can we just use
      tcg/* and rely on devs reading and understanding the meson.build
      file? I believe tcg/sysemu/* is going to be very empty (for now,
      only what is in mmu-hash64.c and is TCG-only, IIRC), so it sounds
      like a bit of an overkill, but I also see the argument for
      future-proofing.</p>
    <blockquote type="cite"
      cite="mid:8e66bba4-96d1-db9e-5f21-156c41ff38ea@amsat.org">
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

--------------A25696FB46D2F29A3CA10444--

