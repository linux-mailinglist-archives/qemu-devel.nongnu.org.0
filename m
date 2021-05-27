Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5295D3930E6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:27:30 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGyv-0000RK-AF
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmGvX-0004yD-C6; Thu, 27 May 2021 10:23:59 -0400
Received: from [201.28.113.2] (port=22005 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmGvV-00043x-4r; Thu, 27 May 2021 10:23:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 11:23:52 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id AB6238013E1;
 Thu, 27 May 2021 11:23:52 -0300 (-03)
Subject: Re: [PATCH 0/5] stop collection of instruction usage statistics
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <87v9741djt.fsf@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <7561689d-022d-1981-329f-e843fb4bbc4b@eldorado.org.br>
Date: Thu, 27 May 2021 11:23:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87v9741djt.fsf@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------C14663A8074BB8813DB55803"
Content-Language: en-US
X-OriginalArrivalTime: 27 May 2021 14:23:53.0031 (UTC)
 FILETIME=[EB69DD70:01D75303]
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
 lucas.araujo@eldorado.org.br, qemu-devel@nongnu.org,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------C14663A8074BB8813DB55803
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/05/2021 10:57, Alex Bennée wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>
>> Based-on: <20210525115355.8254-1-bruno.larsen@eldorado.org.br>
>>
>> The functionality of counting how many instructions were being executed and
>> being able to show it through the monitor, although neat, was only
>> supported by ppc, and now that it is migrating to use decodetree (at
>> least partially), those statistics won't be used anymore. Therefore,
>> this patch removes that functinality completely.
> I have no particular comment to make about the PPC stuff but with the
> common translator loop we have hooks across all converted front ends to
> identify the start of each instruction. It's needed for the TCG plugin
> instrumentation and we could in theory use it for more integrated stats
> across the board.
>
> Out of interest what was the main aim of this code - a view of total
> executed instructions or something more detailed like a breakdown of
> types and ops?

I'm pretty new to qemu, so I'm not sure what the original intent was, 
but what it did was count how many times the handler of the instruction 
was called, so you knew how many times each individual opcode was used. 
At least, that's what I think it should do, since the code doesn't even 
compile anymore for me to check

>
>> This series was suggested by Richard Henderson
>>
>> Bruno Larsen (billionai) (5):
>>    target/ppc: fixed GEN_OPCODE behavior when PPC_DUMP_CPU is set
>>    target/ppc: remove ppc_cpu_dump_statistics
>>    target/ppc: removed mentions to DO_PPC_STATISTICS
>>    monitor: removed cpustats command
>>    hw/core/cpu: removed cpu_dump_statistics function
>>
>>   hmp-commands-info.hx   | 13 --------
>>   hw/core/cpu.c          |  9 ------
>>   include/hw/core/cpu.h  | 12 --------
>>   monitor/misc.c         | 11 -------
>>   target/ppc/cpu.h       |  1 -
>>   target/ppc/cpu_init.c  |  3 --
>>   target/ppc/translate.c | 69 +++---------------------------------------
>>   7 files changed, 5 insertions(+), 113 deletions(-)
>
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------C14663A8074BB8813DB55803
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27/05/2021 10:57, Alex Bennée wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87v9741djt.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">
"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Based-on: <a class="moz-txt-link-rfc2396E" href="mailto:20210525115355.8254-1-bruno.larsen@eldorado.org.br">&lt;20210525115355.8254-1-bruno.larsen@eldorado.org.br&gt;</a>

The functionality of counting how many instructions were being executed and
being able to show it through the monitor, although neat, was only
supported by ppc, and now that it is migrating to use decodetree (at
least partially), those statistics won't be used anymore. Therefore,
this patch removes that functinality completely.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I have no particular comment to make about the PPC stuff but with the
common translator loop we have hooks across all converted front ends to
identify the start of each instruction. It's needed for the TCG plugin
instrumentation and we could in theory use it for more integrated stats
across the board.

Out of interest what was the main aim of this code - a view of total
executed instructions or something more detailed like a breakdown of
types and ops?</pre>
    </blockquote>
    <p>I'm pretty new to qemu, so I'm not sure what the original intent
      was, but what it did was count how many times the handler of the
      instruction was called, so you knew how many times each individual
      opcode was used. At least, that's what I think it should do, since
      the code doesn't even compile anymore for me to check</p>
    <blockquote type="cite" cite="mid:87v9741djt.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This series was suggested by Richard Henderson

Bruno Larsen (billionai) (5):
  target/ppc: fixed GEN_OPCODE behavior when PPC_DUMP_CPU is set
  target/ppc: remove ppc_cpu_dump_statistics
  target/ppc: removed mentions to DO_PPC_STATISTICS
  monitor: removed cpustats command
  hw/core/cpu: removed cpu_dump_statistics function

 hmp-commands-info.hx   | 13 --------
 hw/core/cpu.c          |  9 ------
 include/hw/core/cpu.h  | 12 --------
 monitor/misc.c         | 11 -------
 target/ppc/cpu.h       |  1 -
 target/ppc/cpu_init.c  |  3 --
 target/ppc/translate.c | 69 +++---------------------------------------
 7 files changed, 5 insertions(+), 113 deletions(-)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
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

--------------C14663A8074BB8813DB55803--

