Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672445222B5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 19:30:21 +0200 (CEST)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noTgg-0005Rg-IY
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 13:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTex-0004av-L2; Tue, 10 May 2022 13:28:32 -0400
Received: from [187.72.171.209] (port=46471 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1noTev-0003MW-Ko; Tue, 10 May 2022 13:28:31 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 10 May 2022 14:28:25 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id B78A680046B;
 Tue, 10 May 2022 14:28:25 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------gZUEssj9z2xtx0dYCprLY9VL"
Message-ID: <0300306b-4176-4e8f-66d3-25dcc6e8c461@eldorado.org.br>
Date: Tue, 10 May 2022 14:28:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v2 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-3-lucas.araujo@eldorado.org.br>
 <c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org>
X-OriginalArrivalTime: 10 May 2022 17:28:26.0016 (UTC)
 FILETIME=[5B2E4A00:01D86493]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------gZUEssj9z2xtx0dYCprLY9VL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/05/2022 00:41, Richard Henderson wrote:
> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index 10c6d7ae43..348a898950 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -238,6 +238,7 @@ typedef union _ppc_vsr_t {
>>
>>   typedef ppc_vsr_t ppc_avr_t;
>>   typedef ppc_vsr_t ppc_fprp_t;
>> +typedef ppc_vsr_t ppc_acc_t;
>>
>>   #if !defined(CONFIG_USER_ONLY)
>>   /* Software TLB cache */
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index aa6773c4a5..61217e0a10 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -537,6 +537,15 @@ DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, 
>> vsr, i32)
>>   DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
>>   DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
>>   DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI4GER8, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI4GER8PP, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI8GER4, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI8GER4PP, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI8GER4SPP, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, vsr, i32)
>> +DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, vsr, i32)
>
> Did you intend to use "acc" here, for documentation purposes?
> It's just a couple of #defines above.

Yes, I'll change that in the next version, do you want me to keep the 
Reviewed-by or do I sent without them so you can review the changes?

It'll be just adding

     #define dh_alias_acc ptr
     #define dh_ctype_acc ppc_acc_t *
     #define dh_typecode_acc dh_typecode_ptr

and changing DEF_HELPER_5 to have acc instead of the third vsr

>
> Either way, much cleaner.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------gZUEssj9z2xtx0dYCprLY9VL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08/05/2022 00:41, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org">On
      5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
      <br>
      <blockquote type="cite">diff --git a/target/ppc/cpu.h
        b/target/ppc/cpu.h
        <br>
        index 10c6d7ae43..348a898950 100644
        <br>
        --- a/target/ppc/cpu.h
        <br>
        +++ b/target/ppc/cpu.h
        <br>
        @@ -238,6 +238,7 @@ typedef union _ppc_vsr_t {
        <br>
        <br>
          typedef ppc_vsr_t ppc_avr_t;
        <br>
          typedef ppc_vsr_t ppc_fprp_t;
        <br>
        +typedef ppc_vsr_t ppc_acc_t;
        <br>
        <br>
          #if !defined(CONFIG_USER_ONLY)
        <br>
          /* Software TLB cache */
        <br>
        diff --git a/target/ppc/helper.h b/target/ppc/helper.h
        <br>
        index aa6773c4a5..61217e0a10 100644
        <br>
        --- a/target/ppc/helper.h
        <br>
        +++ b/target/ppc/helper.h
        <br>
        @@ -537,6 +537,15 @@ DEF_HELPER_5(XXBLENDVB, void, vsr, vsr,
        vsr, vsr, i32)
        <br>
          DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
        <br>
          DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
        <br>
          DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI4GER8, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI4GER8PP, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI8GER4, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI8GER4PP, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI8GER4SPP, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, vsr, i32)
        <br>
        +DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, vsr, i32)
        <br>
      </blockquote>
      <br>
      Did you intend to use "acc" here, for documentation purposes?
      <br>
      It's just a couple of #defines above.
      <br>
    </blockquote>
    <p>Yes, I'll change that in the next version, do you want me to keep
      the Reviewed-by or do I sent without them so you can review the
      changes?</p>
    <p>It'll be just adding</p>
    <p>    #define dh_alias_acc ptr<br>
          #define dh_ctype_acc ppc_acc_t *<br>
          #define dh_typecode_acc dh_typecode_ptr</p>
    <p>and changing DEF_HELPER_5 to have acc instead of the third vsr<br>
    </p>
    <blockquote type="cite"
      cite="mid:c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org">
      <br>
      Either way, much cleaner.
      <br>
      Reviewed-by: Richard Henderson
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
      <br>
      <br>
      <br>
      r~
      <br>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------gZUEssj9z2xtx0dYCprLY9VL--

