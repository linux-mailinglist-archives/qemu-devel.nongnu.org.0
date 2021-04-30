Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F1370020
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:04:02 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXUe-0005dE-0b
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcWuH-0006th-Fh; Fri, 30 Apr 2021 13:26:25 -0400
Received: from [201.28.113.2] (port=37315 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcWuE-00031M-TC; Fri, 30 Apr 2021 13:26:24 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 14:26:19 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id BA5EA8013C2;
 Fri, 30 Apr 2021 14:26:18 -0300 (-03)
Subject: Re: [PATCH v2 4/7] target/ppc: turned SPR R/W callbacks not static
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
 <00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <383cae11-61d0-22d6-7cc7-6f37bfe945f4@eldorado.org.br>
Date: Fri, 30 Apr 2021 14:26:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------713BB5057F71FF59F653F9DB"
Content-Language: en-US
X-OriginalArrivalTime: 30 Apr 2021 17:26:19.0056 (UTC)
 FILETIME=[EE997B00:01D73DE5]
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------713BB5057F71FF59F653F9DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/04/2021 00:40, Richard Henderson wrote:
> On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
>> @@ -234,19 +235,19 @@ static void spr_read_tbu(DisasContext *ctx, int 
>> gprn, int sprn)
>>   }
>>     ATTRIBUTE_UNUSED
>> -static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
>> +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
>>   {
>
> You can drop the ATTRIBUTE_UNUSED at the same time.
>
> It was only there to stop the static symbol from being signaled as 
> unused; for a non-static symbol, the compiler obviously can't tell.
ah, that makes sense. Dropped it, thanks!
>> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
>> new file mode 100644
>> index 0000000000..b573a23e7b
>> --- /dev/null
>> +++ b/target/ppc/spr_tcg.h
>> @@ -0,0 +1,121 @@
>> +#ifndef SPR_TCG_H
>> +#define SPR_TCG_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "exec/translator.h"
>> +#include "tcg/tcg.h"
>
> All new files get copyright headers.  No headers include osdep.h. It 
> doesn't appear that you need any headers for this file; just add
>
> typedef struct DisasContext DisasContext;
>
> to the top of the file.

Apparently, I don't even need to do that. I'm not sure what I've 
changed, but now I don't need neither the cpu.h nor the typedef. I can 
just not include anything, so I dropped them all.

>
>
> r~
-- 
Bruno Piazera Larsen Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station> 
Departamento Computação Embarcada Analista de Software Trainee Aviso 
Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------713BB5057F71FF59F653F9DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/04/2021 00:40, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org">On
      4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">@@ -234,19 +235,19 @@ static void
        spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
        <br>
          }
        <br>
            ATTRIBUTE_UNUSED
        <br>
        -static void spr_read_atbl(DisasContext *ctx, int gprn, int
        sprn)
        <br>
        +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
        <br>
          {
        <br>
      </blockquote>
      <br>
      You can drop the ATTRIBUTE_UNUSED at the same time.
      <br>
      <br>
      It was only there to stop the static symbol from being signaled as
      unused; for a non-static symbol, the compiler obviously can't
      tell.
      <br>
    </blockquote>
    ah, that makes sense. Dropped it, thanks!<br>
    <blockquote type="cite"
      cite="mid:00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org">
      <blockquote type="cite">diff --git a/target/ppc/spr_tcg.h
        b/target/ppc/spr_tcg.h
        <br>
        new file mode 100644
        <br>
        index 0000000000..b573a23e7b
        <br>
        --- /dev/null
        <br>
        +++ b/target/ppc/spr_tcg.h
        <br>
        @@ -0,0 +1,121 @@
        <br>
        +#ifndef SPR_TCG_H
        <br>
        +#define SPR_TCG_H
        <br>
        +
        <br>
        +#include "qemu/osdep.h"
        <br>
        +#include "cpu.h"
        <br>
        +#include "exec/translator.h"
        <br>
        +#include "tcg/tcg.h"
        <br>
      </blockquote>
      <br>
      All new files get copyright headers.  No headers include osdep.h. 
      It doesn't appear that you need any headers for this file; just
      add
      <br>
      <br>
      typedef struct DisasContext DisasContext;
      <br>
      <br>
      to the top of the file.
      <br>
    </blockquote>
    <p>Apparently, I don't even need to do that. I'm not sure what I've
      changed, but now I don't need neither the cpu.h nor the typedef. I
      can just not include anything, so I dropped them all.<br>
    </p>
    <blockquote type="cite"
      cite="mid:00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org">
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a>
      Departamento Computação Embarcada
      Analista de Software Trainee
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------713BB5057F71FF59F653F9DB--

