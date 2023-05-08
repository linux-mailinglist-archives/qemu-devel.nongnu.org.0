Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D96FAF51
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 13:56:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvzSd-00033T-Jh; Mon, 08 May 2023 07:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1pvzSb-00033G-IQ
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:55:21 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1pvzSZ-0003SV-8H
 for qemu-devel@nongnu.org; Mon, 08 May 2023 07:55:21 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 8 May 2023 08:55:13 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 0E65B8001CA;
 Mon,  8 May 2023 08:55:10 -0300 (-03)
Message-ID: <4f8f9164-45a8-a07e-186f-fb3864615aed@eldorado.org.br>
Date: Mon, 8 May 2023 08:55:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/ppc: Fix fallback to MFSS for MFFSCRN, MFFSCRNI,
 MFFSCE and MFFSL
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230504110150.3044402-1-richard.purdie@linuxfoundation.org>
 <1f22eb31-7573-cbca-bc9a-6d4ef5d1b71d@eldorado.org.br>
 <bac2a436-c071-0716-c699-21a6a7b59d73@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <bac2a436-c071-0716-c699-21a6a7b59d73@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 May 2023 11:55:14.0042 (UTC)
 FILETIME=[F2FC65A0:01D981A3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05/05/2023 12:23, Richard Henderson wrote:
> On 5/4/23 18:17, Matheus K. Ferst wrote:
>> On 04/05/2023 08:01, Richard Purdie wrote:
>>> The following commits changed the code such that these instructions 
>>> became invalid
>>> on pre 3.0 ISAs:
>>>
>>>    bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move 
>>> mffscrn[i] to decodetree
>>>    394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce 
>>> to decodetree
>>>    3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl 
>>> to decodetree
>>>
>>> The hardware will handle them as a MFFS instruction as the code did 
>>> previously.
>>> Restore that behaviour. This means applications that were segfaulting 
>>> under qemu
>>> when encountering these instructions now operate correctly. The 
>>> instruction
>>> is used in glibc libm functions for example.
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>   target/ppc/translate/fp-impl.c.inc | 20 ++++++++++++++++----
>>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/ppc/translate/fp-impl.c.inc 
>>> b/target/ppc/translate/fp-impl.c.inc
>>> index 57d8437851..cb86381c3f 100644
>>> --- a/target/ppc/translate/fp-impl.c.inc
>>> +++ b/target/ppc/translate/fp-impl.c.inc
>>> @@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, 
>>> arg_X_t *a)
>>>   {
>>>       TCGv_i64 fpscr;
>>>
>>> -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>>> +    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
>>> +        return trans_MFFS(ctx, a);
>>> +    }
>>> +
>>
>> Hi Richard, nice catch!
>>
>> I believe this may be better addressed by decodetree pattern groups, 
>> e.g.:
>>
>> On insns32.decode:
>> {
>>    # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should 
>> be ignored
>>    MFFS_ISA207   111111 ..... ----- ----- 1001000111 .   @X_t_rc
>>    [
>>      MFFS        111111 ..... 00000 ----- 1001000111 .   @X_t_rc
>>      MFFSCE      111111 ..... 00001 ----- 1001000111 -   @X_t
>>      MFFSCRN     111111 ..... 10110 ..... 1001000111 -   @X_tb
>>      MFFSCDRN    111111 ..... 10100 ..... 1001000111 -   @X_tb
>>      MFFSCRNI    111111 ..... 10111 ---.. 1001000111 -   @X_imm2
>>      MFFSCDRNI   111111 ..... 10101 --... 1001000111 -   @X_imm3
>>      MFFSL       111111 ..... 11000 ----- 1001000111 -   @X_t
>>    ]
>> }
>>
>> And on fp-impl.c.inc:
>> static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
>> {
>>      if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>>          /*
>>           * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any 
>> instruction
>>           * with OPCD=63 and XO=583 should be decoded as MFFS.
>>           */
>>          return trans_MFFS(ctx, a);
>>      }
>>      /*
>>       * For Power ISA v3.0+, return false and let the pattern group
>>       * select the correct instruction.
>>       */
>>      return false;
>> }
> 
> Not quite.  Should be
> 
> {
>    [
>      MFFSCE  111111 ..... 00001 ----- 1001000111 -  @X_t
>      ...
>      MFFSL   111111 ..... 11000 ----- 1001000111 -  @X_t
>    ]
>    MFFS      111111 ..... ----- ----- 1001000111 .  @X_t_rc
> }
> 
> where all of the 3.0 insns do
> 
>      if (!(ctx->insns_flags2 & PPC2_ISA300)) {
>          return false;
>      }
> 
> I do not believe that v3.0 rejects bits [11:15] = 00010, for example, 
> which would have
> been accepted and ignored with v2.07.  It should simply treat it as the 
> full MFFS insn.

Hi Richard, sorry for the delayed response. Testing on a POWER9, it does 
reject opcodes with undefined values in [11:15]:

$ cat > mffs.c << EOF
#include <signal.h>

#include <unistd.h>


int main(void) {
         signal(SIGILL, _exit);
         asm(MFFS_OPCD);
         return 0;
}
EOF
$ for i in {0..15}; do
     opc="$(( 0xfc00048e | ($i << 14) ))"
     gcc -DMFFS_OPCD="\".long $opc\"" mffs.c -o mffs
     printf "%s " $(echo "obase=2; $opc" | bc)
     if ./mffs ; then
         echo "valid"
     else
         echo "invalid"
     fi
done
11111100000000000000010010001110 valid  # MFFS
11111100000000010000010010001110 valid  # MFFSCE
11111100000000100000010010001110 invalid
11111100000000110000010010001110 invalid
11111100000001000000010010001110 invalid
11111100000001010000010010001110 invalid
11111100000001100000010010001110 invalid
11111100000001110000010010001110 invalid
11111100000010000000010010001110 invalid
11111100000010010000010010001110 invalid
11111100000010100000010010001110 invalid
11111100000010110000010010001110 invalid
11111100000011000000010010001110 invalid
11111100000011010000010010001110 invalid
11111100000011100000010010001110 invalid
11111100000011110000010010001110 invalid
11111100000100000000010010001110 invalid
11111100000100010000010010001110 invalid
11111100000100100000010010001110 invalid
11111100000100110000010010001110 invalid
11111100000101000000010010001110 valid  # MFFSCDRN
11111100000101010000010010001110 valid  # MFFSCDRNI
11111100000101100000010010001110 valid  # MFFSCRN
11111100000101110000010010001110 valid  # MFFSCRNI
11111100000110000000010010001110 valid  # MFFSL
11111100000110010000010010001110 invalid
11111100000110100000010010001110 invalid
11111100000110110000010010001110 invalid
11111100000111000000010010001110 invalid
11111100000111010000010010001110 invalid
11111100000111100000010010001110 invalid
11111100000111110000010010001110 invalid

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


