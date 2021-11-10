Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102FD44C8A9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 20:12:05 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkt0t-0002MX-9w
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 14:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mksxC-0000ES-Vh; Wed, 10 Nov 2021 14:08:14 -0500
Received: from [201.28.113.2] (port=42070 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1mksx1-0002gs-Sf; Wed, 10 Nov 2021 14:08:14 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 10 Nov 2021 16:08:00 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id D18AD800AC7;
 Wed, 10 Nov 2021 16:07:59 -0300 (-03)
Subject: Re: [PATCH 2/2] target/ppc: ppc_store_fpscr doesn't update bit 52
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-3-lucas.araujo@eldorado.org.br>
 <a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Message-ID: <bc85171a-f92d-be91-7ce2-f9626c962755@eldorado.org.br>
Date: Wed, 10 Nov 2021 16:07:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E8E9265C43C6A1356918A6E3"
Content-Language: en-US
X-OriginalArrivalTime: 10 Nov 2021 19:08:00.0262 (UTC)
 FILETIME=[47572260:01D7D666]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.678, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------E8E9265C43C6A1356918A6E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/11/2021 13:44, Daniel Henrique Barboza wrote:
>
> On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>
>> This commit fixes the difference reported in the bug in the reserved
>> bit 52, it does this by adding this bit to the mask of bits to not be
>> directly altered in the ppc_store_fpscr function (the hardware used to
>> compare to QEMU was a Power9).
>
> IIUC, "bug" here is related to 
> https://gitlab.com/qemu-project/qemu/-/issues/266,
> the bug mentioned in the commit msg of the first patch. In that case, you
> should mention it again in this commit message explicitly.
>
> In fact, I also believe that the "Resolves:" tag from the first patch 
> should
> be moved to this patch instead, given that the bug is only fully fixed 
> after
> both patches are applied.
>
Ok I'll change that, originally I put it in the first patch as that 
patch resolved the part of the bug that could cause problem.
>
>>
>> Although this is a difference reported in the bug, since it's a reserved
>> bit it may be a "don't care" case, as put in the bug report. Looking at
>> the ISA it doesn't explicitly mentions this bit can't be set, like it
>> does for FEX and VX, so I'm unsure if this is necessary.
>>
>> Signed-off-by: Lucas Mateus Castro (alqotel) 
>> <lucas.castro@eldorado.org.br>
>> ---
>>   target/ppc/cpu.c | 2 +-
>>   target/ppc/cpu.h | 3 +++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
>> index 7ad9bd6044..5c411b32ff 100644
>> --- a/target/ppc/cpu.c
>> +++ b/target/ppc/cpu.c
>> @@ -112,7 +112,7 @@ static inline void 
>> fpscr_set_rounding_mode(CPUPPCState *env)
>>
>>   void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
>>   {
>> -    val &= ~(FP_VX | FP_FEX);
>> +    val &= FPSCR_MTFS_MASK;
>>       if (val & FPSCR_IX) {
>>           val |= FP_VX;
>>       }
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index baa4e7c34d..4b42b281ed 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -736,6 +736,9 @@ enum {
>>                             FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | 
>> FP_VXSOFT | \
>>                             FP_VXSQRT | FP_VXCVI)
>>
>> +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
>> +#define FPSCR_MTFS_MASK ~((1ull << 11) | FP_VX | FP_FEX)
>
>
> ./scripts/checkpatch.pl is not happy about this line:
>
>
> ERROR: Macros with complex values should be enclosed in parenthesis
> #44: FILE: target/ppc/cpu.h:763:
> +#define FPSCR_MTFS_MASK ~((1ull << 11) | FP_VX | FP_FEX)
>
> total: 1 errors, 0 warnings, 17 lines checked
>
Ok I'll put it in parenthesis and send a next version with this and the 
gen_helper_reset_fpstatus removed.
>
>
>
> Thanks,
>
>
>
> Daniel
>
>
>> +
>> /*****************************************************************************/
>>   /* Vector status and control register */
>>   #define VSCR_NJ         16 /* Vector non-java */
>>
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Estagiario
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------E8E9265C43C6A1356918A6E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09/11/2021 13:44, Daniel Henrique
      Barboza wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com"><br>
      On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
      <br>
      <blockquote type="cite">From: "Lucas Mateus Castro (alqotel)"
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.castro@eldorado.org.br">&lt;lucas.castro@eldorado.org.br&gt;</a>
        <br>
        <br>
        This commit fixes the difference reported in the bug in the
        reserved
        <br>
        bit 52, it does this by adding this bit to the mask of bits to
        not be
        <br>
        directly altered in the ppc_store_fpscr function (the hardware
        used to
        <br>
        compare to QEMU was a Power9).
        <br>
      </blockquote>
      <br>
      IIUC, "bug" here is related to
      <a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu/-/issues/266">https://gitlab.com/qemu-project/qemu/-/issues/266</a>,
      <br>
      the bug mentioned in the commit msg of the first patch. In that
      case, you
      <br>
      should mention it again in this commit message explicitly.
      <br>
      <br>
      In fact, I also believe that the "Resolves:" tag from the first
      patch should
      <br>
      be moved to this patch instead, given that the bug is only fully
      fixed after
      <br>
      both patches are applied.
      <br>
      <br>
    </blockquote>
    Ok I'll change that, originally I put it in the first patch as that
    patch resolved the part of the bug that could cause problem.<br>
    <blockquote type="cite"
      cite="mid:a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com">
      <br>
      <blockquote type="cite">
        <br>
        Although this is a difference reported in the bug, since it's a
        reserved
        <br>
        bit it may be a "don't care" case, as put in the bug report.
        Looking at
        <br>
        the ISA it doesn't explicitly mentions this bit can't be set,
        like it
        <br>
        does for FEX and VX, so I'm unsure if this is necessary.
        <br>
        <br>
        Signed-off-by: Lucas Mateus Castro (alqotel)
        <a class="moz-txt-link-rfc2396E" href="mailto:lucas.castro@eldorado.org.br">&lt;lucas.castro@eldorado.org.br&gt;</a>
        <br>
        ---
        <br>
          target/ppc/cpu.c | 2 +-
        <br>
          target/ppc/cpu.h | 3 +++
        <br>
          2 files changed, 4 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
        <br>
        index 7ad9bd6044..5c411b32ff 100644
        <br>
        --- a/target/ppc/cpu.c
        <br>
        +++ b/target/ppc/cpu.c
        <br>
        @@ -112,7 +112,7 @@ static inline void
        fpscr_set_rounding_mode(CPUPPCState *env)
        <br>
        <br>
          void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
        <br>
          {
        <br>
        -    val &amp;= ~(FP_VX | FP_FEX);
        <br>
        +    val &amp;= FPSCR_MTFS_MASK;
        <br>
              if (val &amp; FPSCR_IX) {
        <br>
                  val |= FP_VX;
        <br>
              }
        <br>
        diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
        <br>
        index baa4e7c34d..4b42b281ed 100644
        <br>
        --- a/target/ppc/cpu.h
        <br>
        +++ b/target/ppc/cpu.h
        <br>
        @@ -736,6 +736,9 @@ enum {
        <br>
                                    FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   |
        FP_VXSOFT | \
        <br>
                                    FP_VXSQRT | FP_VXCVI)
        <br>
        <br>
        +/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
        <br>
        +#define FPSCR_MTFS_MASK ~((1ull &lt;&lt; 11) | FP_VX | FP_FEX)
        <br>
      </blockquote>
      <br>
      <br>
      ./scripts/checkpatch.pl is not happy about this line:
      <br>
      <br>
      <br>
      ERROR: Macros with complex values should be enclosed in
      parenthesis
      <br>
      #44: FILE: target/ppc/cpu.h:763:
      <br>
      +#define FPSCR_MTFS_MASK ~((1ull &lt;&lt; 11) | FP_VX | FP_FEX)
      <br>
      <br>
      total: 1 errors, 0 warnings, 17 lines checked
      <br>
      <br>
    </blockquote>
    Ok I'll put it in parenthesis and send a next version with this and
    the gen_helper_reset_fpstatus removed.<br>
    <blockquote type="cite"
      cite="mid:a75244a5-207c-5e3c-95ee-7204bcf0629a@gmail.com">
      <br>
      <br>
      <br>
      Thanks,
      <br>
      <br>
      <br>
      <br>
      Daniel
      <br>
      <br>
      <br>
      <blockquote type="cite">+
        <br>
         
/*****************************************************************************/<br>
          /* Vector status and control register */
        <br>
          #define VSCR_NJ         16 /* Vector non-java */
        <br>
        <br>
      </blockquote>
    </blockquote>
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

--------------E8E9265C43C6A1356918A6E3--

