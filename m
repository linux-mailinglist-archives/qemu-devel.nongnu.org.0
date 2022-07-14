Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF65755D5
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 21:34:42 +0200 (CEST)
Received: from localhost ([::1]:54516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC4bh-000584-2w
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 15:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oC4Z9-0002Ns-Sh; Thu, 14 Jul 2022 15:32:03 -0400
Received: from [200.168.210.66] (port=33604 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oC4Z7-0007MZ-TH; Thu, 14 Jul 2022 15:32:03 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 14 Jul 2022 16:31:55 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 37CA6800186;
 Thu, 14 Jul 2022 16:31:55 -0300 (-03)
Message-ID: <bc0a64be-d187-d087-2a3d-cf66b1945c24@eldorado.org.br>
Date: Thu, 14 Jul 2022 16:31:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] target/ppc: Move tlbie[l] to decode tree
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, richard.henderson@linaro.org
References: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
 <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
 <5bef219f-cfdd-f2bb-d2e9-f2ea6b4df213@gmail.com>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <5bef219f-cfdd-f2bb-d2e9-f2ea6b4df213@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Jul 2022 19:31:55.0599 (UTC)
 FILETIME=[607CADF0:01D897B8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 7/14/22 15:45, Daniel Henrique Barboza wrote:
> On 7/12/22 16:37, Leandro Lupori wrote:
>> Also decode RIC, PRS and R operands.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/cpu_init.c                        |  4 +-
>>   target/ppc/insn32.decode                     |  8 ++
>>   target/ppc/translate.c                       | 64 +-------------
>>   target/ppc/translate/storage-ctrl-impl.c.inc | 87 ++++++++++++++++++++
>>   4 files changed, 99 insertions(+), 64 deletions(-)
>>   create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc
>>
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index c16cb8dbe7..8d7e77f778 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -6368,7 +6368,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>>                          PPC_FLOAT_EXT |
>>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>> -                       PPC_MEM_TLBSYNC |
>> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>>                          PPC_SEGMENT_64B | PPC_SLBI |
>>                          PPC_POPCNTB | PPC_POPCNTWD |
>> @@ -6585,7 +6585,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void 
>> *data)
>>                          PPC_FLOAT_EXT |
>>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>> -                       PPC_MEM_TLBSYNC |
>> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>>                          PPC_SEGMENT_64B | PPC_SLBI |
>>                          PPC_POPCNTB | PPC_POPCNTWD |
>> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
>> index 6ea48d5163..2b985249b8 100644
>> --- a/target/ppc/insn32.decode
>> +++ b/target/ppc/insn32.decode
>> @@ -809,3 +809,11 @@ VMODSD          000100 ..... ..... ..... 
>> 11111001011    @VX
>>   VMODUD          000100 ..... ..... ..... 11011001011    @VX
>>   VMODSQ          000100 ..... ..... ..... 11100001011    @VX
>>   VMODUQ          000100 ..... ..... ..... 11000001011    @VX
>> +
>> +## TLB Management Instructions
>> +
>> +&X_tlbie        rb rs ric prs:bool r:bool
>> +@X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... .     
>> &X_tlbie
> 
> You're marking bit 11 as ignored but you're not marking 31 as ignored. 
> The way
> the argument patterns are made in this file seems to be either not mark the
> ignored bits (e.g. most of args from the start of the file) or mark all 
> ignore
> bits (e.g. @XL_S from RFEBB).
> 
> I am being petty, yes. This makes no functional change in the 
> instruction, but
> I'd rather mark bit 31 as ignored in @X_tlbie as well.
> 
> I did that in my tree and it seems to work fine. If you're ok with this 
> change,
> 
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 

Right, the @X_tlbie pattern ended up inconsistent with regard to ignored 
bits. I'm ok with changing bit 31 of it to ignored.

Talking with the guys here, they've explained me that it is usually 
better to use '.' with format definitions ('@'), to make it easier to 
reuse them for more instructions, some of which may ignore a given bit 
while others may not. But for @X_tlbie it's ok to use dots or dashes for 
bits 11 and 31, as it's used only by TLBIE and TLBIEL.

Thanks,
Leandro

> 
> 
>> +
>> +TLBIE           011111 ..... - .. . . ..... 0100110010 -            
>> @X_tlbie
>> +TLBIEL          011111 ..... - .. . . ..... 0100010010 -            
>> @X_tlbie

