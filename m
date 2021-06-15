Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E1E3A7D51
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:35:34 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7Lw-0001cJ-Gs
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt7J9-0000bO-Sx; Tue, 15 Jun 2021 07:32:39 -0400
Received: from [201.28.113.2] (port=53513 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lt7J7-0006ax-5v; Tue, 15 Jun 2021 07:32:39 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 08:32:33 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 0FFDA800144;
 Tue, 15 Jun 2021 08:32:33 -0300 (-03)
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
 <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <1c27c473-be10-41cf-d633-bcd838fed78e@eldorado.org.br>
Date: Tue, 15 Jun 2021 08:32:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------786AE4A034BC2D76769D6CA8"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 11:32:33.0377 (UTC)
 FILETIME=[221C6510:01D761DA]
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------786AE4A034BC2D76769D6CA8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/06/2021 19:37, Richard Henderson wrote:
> On 6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
>> This patch changes ppc_cpu_get_phys_page_debug so that it is now
>> able to translate both, priviledged and real mode addresses
>> independently of whether the CPU executing it has those permissions
>>
>> This was mentioned by Fabiano as something that would be very useful to
>> help with debugging, but could possibly constitute a security issue if
>> that debug function can be called in some way by prodution code. the
>> solution was implemented such that it would be trivial to wrap it around
>> ifdefs for building only with --enable-debug, for instance, but we are
>> not sure this is the best approach, hence why it is an RFC.
>>
>> Suggested-by: Fabiano Rosas<farosas@linux.ibm.com>
>> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>
> I think the first part is unnecessary.  Either the cpu is in 
> supervisor mode or it isn't, and gdb should use the correct address 
> space.  If you really want to force supervisor lookup from a guest 
> that is paused in usermode, I suppose you could force MSR.PR=1 while 
> you're performing the access and set it back afterward.
I don't see why GDB should not be able to see supervisor level addresses 
just because the CPU can't. when debugging, we wanna see exactly what 
QEMU sees, not what the guest sees, right? Now, if this is changing more 
than just privilege level, I agree there is a problem, but I wouldn't 
think it is the case...
>
> I think the second part is actively wrong -- real-mode address lookup 
> will (for the most part) always succeed.  Moreover, the gdb user will 
> have no idea that you've silently changed addressing methods.

I disagree. Real-mode address will mostly fail, since during the boot 
process Linux kernels set the MMU to use only virtual addresses, so real 
mode addresses only work when debugging the firmware or the early setup 
of the kernel. After that, GDB can basically only see virtual addresses.

Maybe there is a better way to handle this by having GDB warn the user 
that the CPU can not decode the address in it's current state, but I do 
think it is a good tool to have, as it would've made debugging the first 
RFC on this topic a bit easier, and farosas was actively complaining 
that isn't a feature yet.

>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------786AE4A034BC2D76769D6CA8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14/06/2021 19:37, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org">On
      6/14/21 12:16 PM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">This patch changes
        ppc_cpu_get_phys_page_debug so that it is now
        <br>
        able to translate both, priviledged and real mode addresses
        <br>
        independently of whether the CPU executing it has those
        permissions
        <br>
        <br>
        This was mentioned by Fabiano as something that would be very
        useful to
        <br>
        help with debugging, but could possibly constitute a security
        issue if
        <br>
        that debug function can be called in some way by prodution code.
        the
        <br>
        solution was implemented such that it would be trivial to wrap
        it around
        <br>
        ifdefs for building only with --enable-debug, for instance, but
        we are
        <br>
        not sure this is the best approach, hence why it is an RFC.
        <br>
        <br>
        Suggested-by: Fabiano Rosas<a class="moz-txt-link-rfc2396E" href="mailto:farosas@linux.ibm.com">&lt;farosas@linux.ibm.com&gt;</a>
        <br>
        Signed-off-by: Bruno Larsen
        (billionai)<a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
          target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
        <br>
          1 file changed, 23 insertions(+)
        <br>
      </blockquote>
      <br>
      I think the first part is unnecessary.  Either the cpu is in
      supervisor mode or it isn't, and gdb should use the correct
      address space.  If you really want to force supervisor lookup from
      a guest that is paused in usermode, I suppose you could force
      MSR.PR=1 while you're performing the access and set it back
      afterward.
      <br>
    </blockquote>
    I don't see why GDB should not be able to see supervisor level
    addresses just because the CPU can't. when debugging, we wanna see
    exactly what QEMU sees, not what the guest sees, right? Now, if this
    is changing more than just privilege level, I agree there is a
    problem, but I wouldn't think it is the case...<br>
    <blockquote type="cite"
      cite="mid:c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org">
      <br>
      I think the second part is actively wrong -- real-mode address
      lookup will (for the most part) always succeed.  Moreover, the gdb
      user will have no idea that you've silently changed addressing
      methods.
      <br>
    </blockquote>
    <p>I disagree. Real-mode address will mostly fail, since during the
      boot process Linux kernels set the MMU to use only virtual
      addresses, so real mode addresses only work when debugging the
      firmware or the early setup of the kernel. After that, GDB can
      basically only see virtual addresses.<br>
    </p>
    <p>Maybe there is a better way to handle this by having GDB warn the
      user that the CPU can not decode the address in it's current
      state, but I do think it is a good tool to have, as it would've
      made debugging the first RFC on this topic a bit easier, and
      farosas was actively complaining that isn't a feature yet.<br>
    </p>
    <blockquote type="cite"
      cite="mid:c2ffffa6-2868-f7ab-78c6-1f29eaafc4e5@linaro.org">
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

--------------786AE4A034BC2D76769D6CA8--

