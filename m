Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6CC3A88CF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 20:48:28 +0200 (CEST)
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltE6s-0004zq-S7
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 14:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ltE4G-0003z6-GA; Tue, 15 Jun 2021 14:45:44 -0400
Received: from [201.28.113.2] (port=20971 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ltE4E-0001ST-OG; Tue, 15 Jun 2021 14:45:44 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 15 Jun 2021 15:44:34 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id D4CFC800144;
 Tue, 15 Jun 2021 15:44:33 -0300 (-03)
Subject: Re: [PATCH v2 2/3] target/ppc: divided mmu_helper.c in 2 files
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210610164648.83878-1-lucas.araujo@eldorado.org.br>
 <20210610164648.83878-3-lucas.araujo@eldorado.org.br>
 <YMg9qx4ddgDchtgS@yekko>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <13694281-b11c-4617-4a43-507395d8076f@eldorado.org.br>
Date: Tue, 15 Jun 2021 15:44:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMg9qx4ddgDchtgS@yekko>
Content-Type: multipart/alternative;
 boundary="------------A829851DA8C7EEBC62B9F825"
Content-Language: en-US
X-OriginalArrivalTime: 15 Jun 2021 18:44:34.0269 (UTC)
 FILETIME=[7C2AA0D0:01D76216]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------A829851DA8C7EEBC62B9F825
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 15/06/2021 02:42, David Gibson wrote:
> On Thu, Jun 10, 2021 at 01:46:47PM -0300, Lucas Mateus Castro (alqotel) wrote:
>> Moved functions in mmu_helper.c that should be compiled in build to
> "should be compiled in build" is not very clear to me.  What's the
> distinction between both the files.
Looking back now the description is really confusing, so let me rephrase 
that: mmu_helper.c is being split in 2 files, mmu_helper.c (which 
contains TCG-only code) and mmu_common.c (which contains code needed in 
!TCG)
>> mmu_common.c, moved declaration of functions that both files use to
>> cpu.h and moved struct declarations and inline functions needed by
>> both to target/ppc/internal.h. Updated meson.build to compile the
>> new file. ppc6xx_tlb_getnum is not an inline function anymore.
> Overall this looks reasonable.  I think there's quite a lot you put
> into mmu_common.c that can TCG-only, but it's reasonable to delay the
> cleanups that will allow that to happen until further down the track.
For this patch I've put the helpers and static functions only called by 
them in mmu_helper.c and other functions in mmu_common.c, but looking 
now there's some more code motion I could add to this patch series, so 
I'll add them to the end of the patch series to not interfere with the 
previews patches.

-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------A829851DA8C7EEBC62B9F825
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15/06/2021 02:42, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YMg9qx4ddgDchtgS@yekko">
      <pre class="moz-quote-pre" wrap="">On Thu, Jun 10, 2021 at 01:46:47PM -0300, Lucas Mateus Castro (alqotel) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved functions in mmu_helper.c that should be compiled in build to
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
"should be compiled in build" is not very clear to me.  What's the
distinction between both the files.
</pre>
    </blockquote>
    Looking back now the description is really confusing, so let me
    rephrase that: mmu_helper.c is being split in 2 files, mmu_helper.c
    (which contains TCG-only code) and mmu_common.c (which contains code
    needed in !TCG)<br>
    <blockquote type="cite" cite="mid:YMg9qx4ddgDchtgS@yekko">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">mmu_common.c, moved declaration of functions that both files use to
cpu.h and moved struct declarations and inline functions needed by
both to target/ppc/internal.h. Updated meson.build to compile the
new file. ppc6xx_tlb_getnum is not an inline function anymore.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Overall this looks reasonable.  I think there's quite a lot you put
into mmu_common.c that can TCG-only, but it's reasonable to delay the
cleanups that will allow that to happen until further down the track.
</pre>
    </blockquote>
    For this patch I've put the helpers and static functions only called
    by them in mmu_helper.c and other functions in mmu_common.c, but
    looking now there's some more code motion I could add to this patch
    series, so I'll add them to the end of the patch series to not
    interfere with the previews patches.<br>
    <br>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Estagiario<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------A829851DA8C7EEBC62B9F825--

