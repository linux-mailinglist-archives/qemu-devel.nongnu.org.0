Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF9039FCB3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 18:41:17 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqemx-0002t6-EK
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 12:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqejm-0001L7-2f; Tue, 08 Jun 2021 12:37:58 -0400
Received: from [201.28.113.2] (port=47770 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lqejj-0006VG-VN; Tue, 08 Jun 2021 12:37:57 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 8 Jun 2021 13:37:51 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id A2C8280148E;
 Tue,  8 Jun 2021 13:37:51 -0300 (-03)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
 <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
 <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
 <7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org>
 <b5834a1f-afaa-a36a-11d6-35a197ad74bc@eldorado.org.br>
 <cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <258682ee-0ae6-cf59-e7bf-42879abcde5b@eldorado.org.br>
Date: Tue, 8 Jun 2021 13:37:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------DE99067D7BB468240F4947BD"
Content-Language: en-US
X-OriginalArrivalTime: 08 Jun 2021 16:37:51.0965 (UTC)
 FILETIME=[9FF2D8D0:01D75C84]
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
--------------DE99067D7BB468240F4947BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/06/2021 12:35, Richard Henderson wrote:
> On 6/8/21 7:39 AM, Bruno Piazera Larsen wrote:
>>> That's odd.  We already have more arguments than the number of 
>>> argument registers...  A 5x slowdown is distinctly odd.
>> I did some more digging and the problem is not with 
>> ppc_radix64_check_prot, the problem is ppc_radix64_xlate, which 
>> currently has 7 arguments and we're increasing to 8. 7 feels like the 
>> correct number, but I couldn't find docs supporting it, so I could be 
>> wrong.
>
> According to tcg/ppc/tcg-target.c.inc, there are 8 argument registers 
> for ppc hosts.  But now I see you didn't actually say on which host 
> you observed the problem...  It's 6 argument registers for x86_64 host.

Oh, yes, sorry. I'm experiencing it in a POWER9 machine (ppc64le 
architecture). According to tcg this shouldn't be the issue, then, so 
idk if that's the real reason or not. All I know is that as soon as gcc 
can't optimize an argument away it happens (fprintf in radix64_xlate, 
using one of the mmuidx_* functions, defining those as macros).

I'll test it in my x86_64 machine and see if such a slowdown happens. 
It's not conclusive evidence, but the function is too complex for me to 
follow the disassembly if I can avoid it...

>
>> That means we'd have to define radix_ctx_t (or however we call it) in 
>> radix64.h, setup the struct on ppc_xlate, then pass it to 
>> ppc_radix64_xlate.
>
> Well, if you're going to change the xlate interface, you want to do 
> that across all of them.  So, not call it radix_ctx_t.
I wouldn't change ppc_xlate's interface, I'd set up the struct in that 
function and call ppc_radix64_xlate using the struct
>
>>  From looking at the code, it seems the most useful bits to put in 
>> the struct are: eaddr, g_addr, h_addr, {h,g}_prot, {g,h}_page_size, 
>> mmu_idx and guest_visible. They all seem reasonable to me, but I 
>> might be missing something again.
>
> I don't think h/g should be in this struct.  I think h/g should use 
> different struct instances, because they are different accesses.
Ok, makes sense
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

--------------DE99067D7BB468240F4947BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/06/2021 12:35, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org">On
      6/8/21 7:39 AM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">
        <blockquote type="cite">That's odd.  We already have more
          arguments than the number of argument registers...  A 5x
          slowdown is distinctly odd.
          <br>
        </blockquote>
        I did some more digging and the problem is not with
        ppc_radix64_check_prot, the problem is ppc_radix64_xlate, which
        currently has 7 arguments and we're increasing to 8. 7 feels
        like the correct number, but I couldn't find docs supporting it,
        so I could be wrong.
        <br>
      </blockquote>
      <br>
      According to tcg/ppc/tcg-target.c.inc, there are 8 argument
      registers for ppc hosts.  But now I see you didn't actually say on
      which host you observed the problem...  It's 6 argument registers
      for x86_64 host.
      <br>
    </blockquote>
    <p>Oh, yes, sorry. I'm experiencing it in a POWER9 machine (ppc64le
      architecture). According to tcg this shouldn't be the issue, then,
      so idk if that's the real reason or not. All I know is that as
      soon as gcc can't optimize an argument away it happens (fprintf in
      radix64_xlate, using one of the mmuidx_* functions, defining those
      as macros).<br>
    </p>
    <p>I'll test it in my x86_64 machine and see if such a slowdown
      happens. It's not conclusive evidence, but the function is too
      complex for me to follow the disassembly if I can avoid it...<br>
    </p>
    <blockquote type="cite"
      cite="mid:cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org">
      <br>
      <blockquote type="cite">That means we'd have to define radix_ctx_t
        (or however we call it) in radix64.h, setup the struct on
        ppc_xlate, then pass it to ppc_radix64_xlate.
        <br>
      </blockquote>
      <br>
      Well, if you're going to change the xlate interface, you want to
      do that across all of them.  So, not call it radix_ctx_t.
      <br>
    </blockquote>
    I wouldn't change ppc_xlate's interface, I'd set up the struct in
    that function and call ppc_radix64_xlate using the struct<br>
    <blockquote type="cite"
      cite="mid:cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org">
      <br>
      <blockquote type="cite"> From looking at the code, it seems the
        most useful bits to put in the struct are: eaddr, g_addr,
        h_addr, {h,g}_prot, {g,h}_page_size, mmu_idx and guest_visible.
        They all seem reasonable to me, but I might be missing something
        again.
        <br>
      </blockquote>
      <br>
      I don't think h/g should be in this struct.  I think h/g should
      use different struct instances, because they are different
      accesses.
      <br>
    </blockquote>
    Ok, makes sense<br>
    <blockquote type="cite"
      cite="mid:cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org">
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

--------------DE99067D7BB468240F4947BD--

