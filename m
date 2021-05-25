Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E438FFC6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:10:27 +0200 (CEST)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUx8-0003BG-Jg
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llUvl-000235-Mp; Tue, 25 May 2021 07:09:01 -0400
Received: from [201.28.113.2] (port=38742 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1llUvj-000129-Mv; Tue, 25 May 2021 07:09:01 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 25 May 2021 08:08:55 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 4C9CD80144E;
 Tue, 25 May 2021 08:08:55 -0300 (-03)
Subject: Re: [PATCH v4 1/5] target/ppc: moved ppc_cpu_do_interrupt to cpu.c
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210524135908.47505-1-bruno.larsen@eldorado.org.br>
 <20210524135908.47505-2-bruno.larsen@eldorado.org.br>
 <YKyGjNzW1A+7RXsd@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <7b1d746f-cdbc-76a1-382d-6efc383c9e2c@eldorado.org.br>
Date: Tue, 25 May 2021 08:08:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKyGjNzW1A+7RXsd@yekko>
Content-Type: multipart/alternative;
 boundary="------------72D8A6B081F746F7203E77F6"
Content-Language: en-US
X-OriginalArrivalTime: 25 May 2021 11:08:55.0642 (UTC)
 FILETIME=[5A6673A0:01D75156]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------72D8A6B081F746F7203E77F6
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 25/05/2021 02:09, David Gibson wrote:
> On Mon, May 24, 2021 at 10:59:04AM -0300, Bruno Larsen (billionai) wrote:
>> Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
>> more sense, and turned powerpc_excp not static, as it now needs to be
>> accessed from outside of excp_helper.c
>>
>> Signed-off-by: Bruno Larsen (billionai)
>> <bruno.larsen@eldorado.org.br>
> Looking at this again, I'm inclined to agree with Richard: I don't see
> a lot of point to this.  It's not really clear to me that these belong
> more in cpu.c than in excp_helper.c, and I believe we're already
> expecting to need excp_helper.c (or at least parts of it) for !TCG
> builds.

yeah, now that I look at it, I agree too. This was in my mind (or code, 
can't remember) before we agreed that excp_helper needed to be compiled, 
so I went ahead and posted it because it was here all along.

While we compile excp_helper, there isn't really a point. I think there 
was a plan to remove or improve excp_helper, so could be something we 
come back to later, but for now I'll remove from the patch series

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------72D8A6B081F746F7203E77F6
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
    <div class="moz-cite-prefix">On 25/05/2021 02:09, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YKyGjNzW1A+7RXsd@yekko">
      <pre class="moz-quote-pre" wrap="">On Mon, May 24, 2021 at 10:59:04AM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved the ppc_cpu_do_interrupt function to cpu.c file, where it makes
more sense, and turned powerpc_excp not static, as it now needs to be
accessed from outside of excp_helper.c

Signed-off-by: Bruno Larsen (billionai)
<a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Looking at this again, I'm inclined to agree with Richard: I don't see
a lot of point to this.  It's not really clear to me that these belong
more in cpu.c than in excp_helper.c, and I believe we're already
expecting to need excp_helper.c (or at least parts of it) for !TCG
builds.</pre>
    </blockquote>
    <p>yeah, now that I look at it, I agree too. This was in my mind (or
      code, can't remember) before we agreed that excp_helper needed to
      be compiled, so I went ahead and posted it because it was here all
      along.</p>
    <p>While we compile excp_helper, there isn't really a point. I think
      there was a plan to remove or improve excp_helper, so could be
      something we come back to later, but for now I'll remove from the
      patch series<br>
    </p>
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

--------------72D8A6B081F746F7203E77F6--

