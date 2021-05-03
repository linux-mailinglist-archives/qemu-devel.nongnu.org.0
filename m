Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D3372134
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:20:07 +0200 (CEST)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldf30-0001Rp-2O
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldeyn-00078j-0c; Mon, 03 May 2021 16:15:46 -0400
Received: from [201.28.113.2] (port=49322 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldeyk-0007Q1-Qi; Mon, 03 May 2021 16:15:44 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 3 May 2021 17:15:38 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id A4FE280134C;
 Mon,  3 May 2021 17:15:38 -0300 (-03)
Subject: Re: [PATCH v3 2/7] target/ppc: Isolated SPR read/write callbacks
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
 <YI+B9mQTcU4YJHBt@yekko>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <a2fab0c6-7612-d6c0-9d71-0410d1b80a31@eldorado.org.br>
Date: Mon, 3 May 2021 17:15:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YI+B9mQTcU4YJHBt@yekko>
Content-Type: multipart/alternative;
 boundary="------------B57CF0789EE4C5A0EB867DF8"
Content-Language: en-US
X-OriginalArrivalTime: 03 May 2021 20:15:39.0012 (UTC)
 FILETIME=[15A4FC40:01D74059]
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
--------------B57CF0789EE4C5A0EB867DF8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 03/05/2021 01:54, David Gibson wrote:
> On Fri, Apr 30, 2021 at 04:35:28PM -0300, Bruno Larsen (billionai) wrote:
>> Moved all SPR read/write callback, and some related functions, to a
>> new file specific for it. These callbacks are TCG only, so separating
>> them is required to support the build flag disable-tcg.
>>
>> Making the spr_noaccess function not static, and moving the define to
>> internal.h is required, otherwise the project doesn't build
>>
>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/internal.h           |    3 +
>>   target/ppc/spr_tcg.c.inc        | 1052 +++++++++++++++++++++++++++++++
>>   target/ppc/translate.c          |   47 +-
>>   target/ppc/translate_init.c.inc |  981 ----------------------------
>>   4 files changed, 1056 insertions(+), 1027 deletions(-)
>>   create mode 100644 target/ppc/spr_tcg.c.inc
> Hmm.  So, I'm still pretty ambivalent about the creation of
> spr_tcg.c.inc.  The separation between it and translate.c just seems
> rather arbitrary to me.
>
> Yes, translate.c is overly huge, but I'm not sure going from
> overly-huge to overly-huger really makes anything worse, and would
> avoid some of the dancing around to handle the new file.
>
> So for now, I'm inclined to suggest just moving the spr callbacks from
> translate_init.c.inc to translate.c.  And some day, I hope someone has
> time to split up translate.c based on CPU family, which I think is a
> more useful way to make it less huge.

Ok. I agree that the improved is pretty minor, I was just thinking it 
was probably better than nothing... I'll work on that tomorrow and will 
have a new version.

When I do, should I put the many e-mail IDs that hold required patches 
as "Based-on" tags, or should I just say ppc-for-6.1? I'm still a bit 
lost when dealing with patchew and these things...

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------B57CF0789EE4C5A0EB867DF8
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
    <div class="moz-cite-prefix">On 03/05/2021 01:54, David Gibson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YI+B9mQTcU4YJHBt@yekko">
      <pre class="moz-quote-pre" wrap="">On Fri, Apr 30, 2021 at 04:35:28PM -0300, Bruno Larsen (billionai) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Moved all SPR read/write callback, and some related functions, to a
new file specific for it. These callbacks are TCG only, so separating
them is required to support the build flag disable-tcg.

Making the spr_noaccess function not static, and moving the define to
internal.h is required, otherwise the project doesn't build

Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 target/ppc/internal.h           |    3 +
 target/ppc/spr_tcg.c.inc        | 1052 +++++++++++++++++++++++++++++++
 target/ppc/translate.c          |   47 +-
 target/ppc/translate_init.c.inc |  981 ----------------------------
 4 files changed, 1056 insertions(+), 1027 deletions(-)
 create mode 100644 target/ppc/spr_tcg.c.inc
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hmm.  So, I'm still pretty ambivalent about the creation of
spr_tcg.c.inc.  The separation between it and translate.c just seems
rather arbitrary to me.

Yes, translate.c is overly huge, but I'm not sure going from
overly-huge to overly-huger really makes anything worse, and would
avoid some of the dancing around to handle the new file.

So for now, I'm inclined to suggest just moving the spr callbacks from
translate_init.c.inc to translate.c.  And some day, I hope someone has
time to split up translate.c based on CPU family, which I think is a
more useful way to make it less huge.
</pre>
    </blockquote>
    <p>Ok. I agree that the improved is pretty minor, I was just
      thinking it was probably better than nothing... I'll work on that
      tomorrow and will have a new version.</p>
    <p>When I do, should I put the many e-mail IDs that hold required
      patches as "Based-on" tags, or should I just say ppc-for-6.1? I'm
      still a bit lost when dealing with patchew and these things...<br>
    </p>
    -- <br>
    <div class="moz-signature">Bruno Piazera Larsen</div>
    <div class="moz-signature">
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
    </div>
    <div class="moz-signature">
      Departamento Computação Embarcada</div>
    <div class="moz-signature">
      Analista de Software Trainee</div>
    <div class="moz-signature">
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------B57CF0789EE4C5A0EB867DF8--

