Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDF6371451
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:33:52 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWpj-0005Jb-8U
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldWkl-0002lz-ED; Mon, 03 May 2021 07:28:43 -0400
Received: from [201.28.113.2] (port=6884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldWkj-0005BQ-8d; Mon, 03 May 2021 07:28:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 3 May 2021 08:28:34 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 907C780134C;
 Mon,  3 May 2021 08:28:34 -0300 (-03)
Subject: Re: [PATCH v3 4/7] target/ppc: turned SPR R/W callbacks not static
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-5-bruno.larsen@eldorado.org.br>
 <79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <ba205951-0286-25d8-c453-848e1d0123af@eldorado.org.br>
Date: Mon, 3 May 2021 08:28:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------7E04247D563C372F07D52556"
Content-Language: en-US
X-OriginalArrivalTime: 03 May 2021 11:28:34.0905 (UTC)
 FILETIME=[74353490:01D7400F]
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
--------------7E04247D563C372F07D52556
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/04/2021 22:05, Richard Henderson wrote:
> On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
>> +++ b/target/ppc/spr_tcg.c.inc
>> @@ -17,6 +17,8 @@
>>    * License along with this library; if not, see 
>> <http://www.gnu.org/licenses/>.
>>    */
>>   +#include "spr_tcg.h"
>
> ...
>
>> +++ b/target/ppc/translate_init.c.inc
>> @@ -42,6 +42,7 @@
>>   #include "fpu/softfloat.h"
>>   #include "qapi/qapi-commands-machine-target.h"
>>   +#include "spr_tcg.h"
>>   /* #define PPC_DEBUG_SPR */
>>   /* #define USE_APPLE_GDB */
>
> Including this header twice, in files that are themselves both 
> included in translate.c, is sketchy.  You really shouldn't add the one 
> to translate_init.c.inc until patch 7, when it becomes the standalone 
> cpu_init.c.
Good point, it might be a better idea if we end up going with spr_tcg.c.inc.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Note for future cleanup: Make spr_tcg.c be standalone as well. Just 
> need to move a few declarations to a translate.h.
it's not that easy, unfortunately. The readers and writers use a lot of 
global variables declared in translate.c, so we'd need to create getters 
and setters, or some better solution, before doing that.
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

--------------7E04247D563C372F07D52556
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/04/2021 22:05, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org">On
      4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">+++ b/target/ppc/spr_tcg.c.inc
        <br>
        @@ -17,6 +17,8 @@
        <br>
           * License along with this library; if not, see
        <a class="moz-txt-link-rfc2396E" href="http://www.gnu.org/licenses/">&lt;http://www.gnu.org/licenses/&gt;</a>.
        <br>
           */
        <br>
          +#include "spr_tcg.h"
        <br>
      </blockquote>
      <br>
      ...
      <br>
      <br>
      <blockquote type="cite">+++ b/target/ppc/translate_init.c.inc
        <br>
        @@ -42,6 +42,7 @@
        <br>
          #include "fpu/softfloat.h"
        <br>
          #include "qapi/qapi-commands-machine-target.h"
        <br>
          +#include "spr_tcg.h"
        <br>
          /* #define PPC_DEBUG_SPR */
        <br>
          /* #define USE_APPLE_GDB */
        <br>
      </blockquote>
      <br>
      Including this header twice, in files that are themselves both
      included in translate.c, is sketchy.  You really shouldn't add the
      one to translate_init.c.inc until patch 7, when it becomes the
      standalone cpu_init.c.
      <br>
    </blockquote>
    Good point, it might be a better idea if we end up going with
    spr_tcg.c.inc.<br>
    <blockquote type="cite"
      cite="mid:79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org">
      <br>
      Otherwise,
      <br>
      Reviewed-by: Richard Henderson
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
      <br>
      <br>
      Note for future cleanup: Make spr_tcg.c be standalone as well. 
      Just need to move a few declarations to a translate.h.
      <br>
    </blockquote>
    it's not that easy, unfortunately. The readers and writers use a lot
    of global variables declared in translate.c, so we'd need to create
    getters and setters, or some better solution, before doing that.<br>
    <blockquote type="cite"
      cite="mid:79cda095-9ba0-0ec6-c89d-77e2d6dbf312@linaro.org">
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
        de Pesquisas ELDORADO</a> <br>
    </div>
    <div class="moz-signature">
      Departamento Computação Embarcada<br>
    </div>
    <div class="moz-signature">
      Analista de Software Trainee</div>
    <div class="moz-signature"><a
        href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal -
        Disclaimer</a></div>
  </body>
</html>

--------------7E04247D563C372F07D52556--

