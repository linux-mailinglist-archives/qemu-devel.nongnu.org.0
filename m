Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF7136FC9D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:41:22 +0200 (CEST)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcUKX-000676-Ms
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcUF5-00041d-Bo; Fri, 30 Apr 2021 10:35:43 -0400
Received: from [201.28.113.2] (port=3971 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lcUF2-0000YC-OF; Fri, 30 Apr 2021 10:35:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 30 Apr 2021 11:35:37 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id CCDCD8013C2;
 Fri, 30 Apr 2021 11:35:36 -0300 (-03)
Subject: Re: [PATCH v2 7/7] target/ppc: isolated cpu init from translation
 logic
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
 <27263531-91ed-b051-ca43-b105ec44d19e@linaro.org>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <35bc4efd-bc56-f726-b0dc-b99e35f7642d@eldorado.org.br>
Date: Fri, 30 Apr 2021 11:35:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <27263531-91ed-b051-ca43-b105ec44d19e@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------19A4CB66BF2F723D8F25B3BA"
Content-Language: en-US
X-OriginalArrivalTime: 30 Apr 2021 14:35:37.0113 (UTC)
 FILETIME=[15ED0090:01D73DCE]
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
--------------19A4CB66BF2F723D8F25B3BA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 30/04/2021 01:25, Richard Henderson wrote:
> On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
>> @@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, 
>> uint32_t val)
>>   {
>>       /* Altivec always uses round-to-nearest */
>>       set_float_rounding_mode(float_round_nearest_even, 
>> &env->vec_status);
>> -    helper_mtvscr(env, val);
>> +    /*
>> +     * This comment is here just so the project will build.
>> +     * The current solution is in another patch and will be
>> +     * added when we figure out an internal fork of qemu
>> +     */
>> +    /* helper_mtvscr(env, val); */
>>   }
>
> (1) this is a separate change to splitting out cpu_init.c.
Oh, yeah. I was going to remove this change for now, it was for building 
with disable-tcg, which is still not working
> (2) you can't even do this without introducing a regression.

The plan is to not just remove, but change with a common function. on a 
future series, though.

I'm just slightly concerned now that make check has not seen anything...

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

--------------19A4CB66BF2F723D8F25B3BA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30/04/2021 01:25, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:27263531-91ed-b051-ca43-b105ec44d19e@linaro.org">On
      4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
      <br>
      <blockquote type="cite">@@ -49,7 +54,12 @@ static inline void
        vscr_init(CPUPPCState *env, uint32_t val)
        <br>
          {
        <br>
              /* Altivec always uses round-to-nearest */
        <br>
              set_float_rounding_mode(float_round_nearest_even,
        &amp;env-&gt;vec_status);
        <br>
        -    helper_mtvscr(env, val);
        <br>
        +    /*
        <br>
        +     * This comment is here just so the project will build.
        <br>
        +     * The current solution is in another patch and will be
        <br>
        +     * added when we figure out an internal fork of qemu
        <br>
        +     */
        <br>
        +    /* helper_mtvscr(env, val); */
        <br>
          }
        <br>
      </blockquote>
      <br>
      (1) this is a separate change to splitting out cpu_init.c.
      <br>
    </blockquote>
    Oh, yeah. I was going to remove this change for now, it was for
    building with disable-tcg, which is still not working<br>
    <blockquote type="cite"
      cite="mid:27263531-91ed-b051-ca43-b105ec44d19e@linaro.org">(2) you
      can't even do this without introducing a regression.
      <br>
    </blockquote>
    <p>The plan is to not just remove, but change with a common
      function. on a future series, though.<br>
    </p>
    <p>I'm just slightly concerned now that make check has not seen
      anything...<br>
    </p>
    <blockquote type="cite"
      cite="mid:27263531-91ed-b051-ca43-b105ec44d19e@linaro.org">
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
      Departamento Computação Embarcada <br>
    </div>
    <div class="moz-signature">
      Analista de Software Trainee <br>
    </div>
    <div class="moz-signature">
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------19A4CB66BF2F723D8F25B3BA--

