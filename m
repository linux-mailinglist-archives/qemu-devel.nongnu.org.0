Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B47537212B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:15:30 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldeyX-0006Xs-2L
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lderp-0002XQ-QI; Mon, 03 May 2021 16:08:33 -0400
Received: from [201.28.113.2] (port=34860 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lderm-00037I-Sl; Mon, 03 May 2021 16:08:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 3 May 2021 17:08:28 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 5640680134C;
 Mon,  3 May 2021 17:08:28 -0300 (-03)
Subject: Re: [PATCH v3 4/7] target/ppc: turned SPR R/W callbacks not static
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-5-bruno.larsen@eldorado.org.br>
 <79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org>
 <ba205951-0286-25d8-c453-848e1d0123af@eldorado.org.br>
 <923b7fd2-122a-316b-adbe-fb9a2655ab61@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <1e284704-e46a-8af3-7dee-670e274c99c4@eldorado.org.br>
Date: Mon, 3 May 2021 17:08:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <923b7fd2-122a-316b-adbe-fb9a2655ab61@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------1A0BA943646C86CE71E46815"
Content-Language: en-US
X-OriginalArrivalTime: 03 May 2021 20:08:28.0714 (UTC)
 FILETIME=[152AB8A0:01D74058]
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
--------------1A0BA943646C86CE71E46815
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03/05/2021 12:25, Richard Henderson wrote:
> On 5/3/21 4:28 AM, Bruno Piazera Larsen wrote:
>>> Note for future cleanup: Make spr_tcg.c be standalone as well. Just 
>>> need to move a few declarations to a translate.h.
>> it's not that easy, unfortunately. The readers and writers use a lot 
>> of global variables declared in translate.c, so we'd need to create 
>> getters and setters, or some better solution, before doing that.
>
> No need for getters, and certainly not for setters (all of the globals 
> are write-once at startup).  Just move the declarations into a shared 
> translate.h.  That's what we've done for target/arm/.
Ah, I can take a look later, but this would be pretty low priority 
compared to what is being requested of us right now. And that's if we 
separate it like that anyway
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

--------------1A0BA943646C86CE71E46815
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03/05/2021 12:25, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:923b7fd2-122a-316b-adbe-fb9a2655ab61@linaro.org">On
      5/3/21 4:28 AM, Bruno Piazera Larsen wrote:
      <br>
      <blockquote type="cite">
        <blockquote type="cite">Note for future cleanup: Make spr_tcg.c
          be standalone as well. Just need to move a few declarations to
          a translate.h.
          <br>
        </blockquote>
        it's not that easy, unfortunately. The readers and writers use a
        lot of global variables declared in translate.c, so we'd need to
        create getters and setters, or some better solution, before
        doing that.
        <br>
      </blockquote>
      <br>
      No need for getters, and certainly not for setters (all of the
      globals are write-once at startup).  Just move the declarations
      into a shared translate.h.  That's what we've done for
      target/arm/.
      <br>
    </blockquote>
    Ah, I can take a look later, but this would be pretty low priority
    compared to what is being requested of us right now. And that's if
    we separate it like that anyway<br>
    <blockquote type="cite"
      cite="mid:923b7fd2-122a-316b-adbe-fb9a2655ab61@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen</div>
    <div class="moz-signature">
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a></div>
    <div class="moz-signature">Departamento Computação Embarcada</div>
    <div class="moz-signature">Analista de Software Trainee</div>
    <div class="moz-signature">
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------1A0BA943646C86CE71E46815--

