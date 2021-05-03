Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAF937211C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:11:34 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldeuj-0003az-6A
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldeqc-0001xH-M8; Mon, 03 May 2021 16:07:18 -0400
Received: from [201.28.113.2] (port=48878 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1ldeqY-0002OU-53; Mon, 03 May 2021 16:07:17 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 3 May 2021 17:07:08 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id B247380134C;
 Mon,  3 May 2021 17:07:07 -0300 (-03)
Subject: Re: [PATCH v3 2/7] target/ppc: Isolated SPR read/write callbacks
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
 <f6f4a150-b64d-db68-ca8c-533b7ea7c7bc@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <37ce51b1-df0c-6848-ba53-34f47954c7c2@eldorado.org.br>
Date: Mon, 3 May 2021 17:07:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f6f4a150-b64d-db68-ca8c-533b7ea7c7bc@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------D9592B947D17DFDD73769C74"
Content-Language: en-US
X-OriginalArrivalTime: 03 May 2021 20:07:08.0093 (UTC)
 FILETIME=[E51CEED0:01D74057]
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
--------------D9592B947D17DFDD73769C74
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/04/2021 21:55, Richard Henderson wrote:
> On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
>> Moved all SPR read/write callback, and some related functions, to a
>> new file specific for it. These callbacks are TCG only, so separating
>> them is required to support the build flag disable-tcg.
>>
>> Making the spr_noaccess function not static, and moving the define to
>> internal.h is required, otherwise the project doesn't build
>
> Why is that?  You're moving the code to a different file, but then 
> including that file back into the same translation unit.  There should 
> be no change in which symbols appear in which object file.
>
> I think that the spr_noaccess move might be required by patch 7, but 
> that's something different.
>
ah, yes, forgot to specify why. gen_op_mfspr uses SPR_NOACCESS on line 
4284. At some point I thought I tried to include spr_tcg.c.inc before 
that function and the compilation failed, so I decided to include it 
where translate_init.c.inc was included. I think it was another function 
that was declared later, but can't remember which

Testing now I verified that I can include it there, so I will do it and 
delay the move to patch 7, no problem

>
> r~
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------D9592B947D17DFDD73769C74
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/04/2021 21:55, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f6f4a150-b64d-db68-ca8c-533b7ea7c7bc@linaro.org">On
      4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">Moved all SPR read/write callback, and
        some related functions, to a
        <br>
        new file specific for it. These callbacks are TCG only, so
        separating
        <br>
        them is required to support the build flag disable-tcg.
        <br>
        <br>
        Making the spr_noaccess function not static, and moving the
        define to
        <br>
        internal.h is required, otherwise the project doesn't build
        <br>
      </blockquote>
      <br>
      Why is that?  You're moving the code to a different file, but then
      including that file back into the same translation unit.  There
      should be no change in which symbols appear in which object file.
      <br>
      <br>
      I think that the spr_noaccess move might be required by patch 7,
      but that's something different.
      <br>
      <br>
    </blockquote>
    <p>ah, yes, forgot to specify why. gen_op_mfspr uses SPR_NOACCESS on
      line 4284. At some point I thought I tried to include
      spr_tcg.c.inc before that function and the compilation failed, so
      I decided to include it where translate_init.c.inc was included. I
      think it was another function that was declared later, but can't
      remember which<br>
    </p>
    <p> Testing now I verified that I can include it there, so I will do
      it and delay the move to patch 7, no problem</p>
    <blockquote type="cite"
      cite="mid:f6f4a150-b64d-db68-ca8c-533b7ea7c7bc@linaro.org">
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen</div>
    <div class="moz-signature">
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
    </div>
    <div class="moz-signature">
      Departamento Computação Embarcada<br>
    </div>
    <div class="moz-signature">Analista de Software Trainee</div>
    <div class="moz-signature"><a
        href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal -
        Disclaimer</a></div>
  </body>
</html>

--------------D9592B947D17DFDD73769C74--

