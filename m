Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7390391B90
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 17:21:25 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llvLY-0003Aq-Mz
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 11:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1llvIF-0000cS-9q; Wed, 26 May 2021 11:18:00 -0400
Received: from [201.28.113.2] (port=46573 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1llvIC-0003Wb-Pz; Wed, 26 May 2021 11:17:58 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 12:17:51 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 829AF8013CA;
 Wed, 26 May 2021 12:17:48 -0300 (-03)
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
 <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
 <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
 <720be115-3aad-f4bd-e636-5dab76478806@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <fc7fde45-a8ae-7249-7cac-b9f7fbfbee0f@eldorado.org.br>
Date: Wed, 26 May 2021 12:17:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <720be115-3aad-f4bd-e636-5dab76478806@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 May 2021 15:17:51.0145 (UTC)
 FILETIME=[4B111990:01D75242]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: lagarcia@br.ibm.com, luis.pires@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/05/2021 15:51, Richard Henderson wrote:
> On 5/21/21 10:25 AM, Matheus K. Ferst wrote:
>> On 18/05/2021 07:12, Richard Henderson wrote:
>>> On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
>>>> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
>>>
>>> Space after IF.
>>> > If I look back to the 6xx manual, I see
>>>
>>>    NOTE: If L = 1, the instruction form is invalid.
>>>
>>> The fact that we're allowing L=1 for ppc32 is an existing bug, 
>>> afaics. We should fix that.
>>>
>>>
>>> r~
>>
>> The previous commit on this line in translate.c says that "on most 
>> 32bit CPUs we should always treat the compare as 32bit compare, as the 
>> CPU will ignore the L bit", so maybe it was intentional. Should we 
>> change it anyway?
> 
> The actual change of 36f48d9c78c is about NARROW_MODE, which is about 
> the MSR.SF bit, and is correct.
> 
> The commit message mentions the e500mc specifically does check the L 
> bit, and then hand-waves about the others not checking.  But the text I 
> found in the 6xx manual says that one checks too.
> 
> I wonder if the IBM folk can shed any further light on this?
> 
> 
> r~

I was pointed to the 601 manual, which says:

"While the PowerPC architecture specifies that the value in the L field 
determines whether the operands are treated as 32- or 64-bit values, the 
601 ignores the value in the L field and treats the operands as 32-bit 
values."

There is also a section in Appendix B called "Reserved Bits in 
Instructions", which says:

"These are shown with '/'s in the instruction opcode definitions. In the 
POWER architecture such bits are ignored by the processor. In PowerPC 
architecture they must be 0 or the instruction form is invalid. In 
several cases the PowerPC architecture assumes that such bits in POWER 
instructions are indeed 0. The cases include the following:
- cmpi, cmp, cmpli, and cmpl assume that bit 10 in the POWER 
instructions is 0.
- mtspr and mfspr assume that bits 16–20 in the POWER instructions are 0."

Searching the manuals for other processors, I identified that the 
manuals for 405, 440, e500, and e500mc explicit says that the L bit 
should always be 0, and manuals for 603e, 604, 604e, 740/745/750/755, 
750CX, 750CL, 750FX, 7400/7410, 7447/7447A/7448/7450/7455, e300, and 
e600 list the bit L in operand syntax but do not mention any 
restrictions on its value.

Alfredo Dal Ava Junior (adalva) did some tests for us on his G4 MacBook, 
confirming that the bit is ignored in PowerPC 7447A v1.2, one of which 
the manual does not specify the behavior, but I don't know if can assume 
the same for other processors.

If we do bother to emulate the specific behavior for each CPU, what 
would be the default for those whose manual is not explicit and we 
cannot test? Also, I not sure how to check for it, do we need a new 
POWERPC_FLAG in pcc->flags?

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

