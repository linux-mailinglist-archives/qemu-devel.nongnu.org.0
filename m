Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F267396850
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 21:23:45 +0200 (CEST)
Received: from localhost ([::1]:32906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnnVo-00058d-1q
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 15:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lnnTV-0003Uk-32; Mon, 31 May 2021 15:21:21 -0400
Received: from [201.28.113.2] (port=25507 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1lnnTR-0004bS-PJ; Mon, 31 May 2021 15:21:20 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 31 May 2021 16:21:12 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 4A406801481;
 Mon, 31 May 2021 16:21:12 -0300 (-03)
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: [target/ppc] excp_helper.c and mmu_helper.c cleanup
Message-ID: <5f3cd63e-92d5-56a3-89bc-519998cfe7cc@eldorado.org.br>
Date: Mon, 31 May 2021 16:21:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------465171F157584BC02BBE8731"
Content-Language: en-US
X-OriginalArrivalTime: 31 May 2021 19:21:12.0868 (UTC)
 FILETIME=[1E6FF640:01D75652]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 matheus.ferst@eldorado.org.br, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------465171F157584BC02BBE8731
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I'm working on cleaning up some of the changes to enable the disable-tcg 
option on PPC, right now focusing on target/ppc/excp_helper.c and 
target/ppc/mmu_helper.c as these files have functions that are needed in 
a !TCG build but also contains code that doesn't compile in a !TCG 
build, and currently that is dealt with #ifdef.

For excp_helper.c I moved all exception handling functions to a new file 
(named target/ppc/excp_handler.c for now) and left only the helpers in 
it, and changed meson.build to always compile the new file and only 
compile the file with the helpers in a build with TCG.

For mmu_helper.c the idea is to move all the code inside #ifdef 
CONFIG_TCG to another file that shouldn't be compiled in a !TCG build. 
But these changes are based on Richard Henderson's patch, so it depends 
if they'll be applied as is or there will be another version.

Also I'm looking into the possibility of not compiling 
ppc_tlb_invalidate_all in mmu_helper.c, but that's only possible if this 
function is not used in a !TCG build, does anyone know if this function 
is used in some corner case when running with KVM?

Any opinion on these changes?

-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------465171F157584BC02BBE8731
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi everyone,</p>
    <p>I'm working on cleaning up some of the changes to enable the
      disable-tcg option on PPC, right now focusing on
      target/ppc/excp_helper.c and target/ppc/mmu_helper.c as these
      files have functions that are needed in a !TCG build but also
      contains code that doesn't compile in a !TCG build, and currently
      that is dealt with #ifdef.</p>
    <p>For excp_helper.c I moved all exception handling functions to a
      new file (named target/ppc/excp_handler.c for now) and left only
      the helpers in it, and changed meson.build to always compile the
      new file and only compile the file with the helpers in a build
      with TCG.</p>
    <p>For mmu_helper.c the idea is to move all the code inside #ifdef
      CONFIG_TCG to another file that shouldn't be compiled in a !TCG
      build. But these changes are based on Richard Henderson's patch,
      so it depends if they'll be applied as is or there will be another
      version.</p>
    <p>Also I'm looking into the possibility of not compiling
      ppc_tlb_invalidate_all in mmu_helper.c, but that's only possible
      if this function is not used in a !TCG build, does anyone know if
      this function is used in some corner case when running with KVM?</p>
    <p>Any opinion on these changes?<br>
    </p>
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

--------------465171F157584BC02BBE8731--

