Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6F45FD7D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 10:06:28 +0100 (CET)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqtf9-00015y-Fb
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 04:06:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqteF-0000Hn-RK
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 04:05:31 -0500
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqteD-0004pJ-QP
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 04:05:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 72E9C225B3;
 Sat, 27 Nov 2021 09:05:19 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 27 Nov
 2021 10:05:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002f1601f4d-bacc-47ae-a1e8-dbf0d16d6827,
 23F0445A5176931D62B90D96737809E45416768A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8ca89779-3af1-8761-3062-5bf3b4d150ec@kaod.org>
Date: Sat, 27 Nov 2021 10:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
References: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
 <YaGfX6iiNqtO8qb4@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YaGfX6iiNqtO8qb4@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4c60d923-2516-45ea-87c6-05818208c82a
X-Ovh-Tracer-Id: 17640036791085271846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheefgdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/21 04:00, David Gibson wrote:
> On Fri, Nov 26, 2021 at 04:39:40PM -0300, Leandro Lupori wrote:
>> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>> offset, causing the first byte of the adjacent PTE to be corrupted.
>> This caused a panic when booting FreeBSD, using the Hash MMU.
>>
>> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>> Changes from v2:
>> - Add new defines for the byte offset of PTE bit C and
>>    HASH_PTE_SIZE_64 / 2 (pte1)
>> - Use new defines in hash64 and spapr code
>> ---
>>   hw/ppc/spapr.c          | 8 ++++----
>>   hw/ppc/spapr_softmmu.c  | 2 +-
>>   target/ppc/mmu-hash64.c | 4 ++--
>>   target/ppc/mmu-hash64.h | 5 +++++
>>   4 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 163c90388a..8ebf85bad8 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>           kvmppc_write_hpte(ptex, pte0, pte1);
>>       } else {
>>           if (pte0 & HPTE64_V_VALID) {
>> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
>> +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
> 
> Urgh.. so, initially I thought this was wrong because I was confusing
> HPTE64_R_BYTE_OFFSET with HPTE64_R_R_BYTE_OFFSET.  I doubt I'd be the
> only one.
> 
> Calling something a BYTE_OFFSET then doing an stq to it is pretty
> misleading I think.  WORD1_OFFSET or R_WORD_OFFSET might be better?

How about (inspired from XIVE) :

  #define HPTE64_W1    (HASH_PTE_SIZE_64 / 2)
  #define HPTE64_W1_R  14 // or HPTE64_W1 + 6
  #define HPTE64_W1_C  15 // or HPTE64_W1 + 7


Really these should be bitfields describing both words like we have
for XIVE. See include/hw/ppc/xive_regs.h. Is there a reason why ?
  
> Or you could change these writebacks to byte writes, as powernv has
> already been changed.  

That's a bigger change. It depends if we want this fix for 6.2 or 7.0.

Thanks,

C.


> I'm not sure if that's necessary in the case of
> pseries - since in that case the HPT doesn't exist within the guest's
> address space.
> 
>>               /*
>>                * When setting valid, we write PTE1 first. This ensures
>>                * proper synchronization with the reading code in
>> @@ -1430,7 +1430,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>                * ppc_hash64_pteg_search()
>>                */
>>               smp_wmb();
>> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
>> +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
>>           }
>>       }
>>   }
>> @@ -1438,7 +1438,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>   static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>>                                uint64_t pte1)
>>   {
>> -    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 15;
>> +    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OFFSET;
>>       SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
>>   
>>       if (!spapr->htab) {
>> @@ -1454,7 +1454,7 @@ static void spapr_hpte_set_c(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>>   static void spapr_hpte_set_r(PPCVirtualHypervisor *vhyp, hwaddr ptex,
>>                                uint64_t pte1)
>>   {
>> -    hwaddr offset = ptex * HASH_PTE_SIZE_64 + 14;
>> +    hwaddr offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
>>       SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
>>   
>>       if (!spapr->htab) {
>> diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
>> index f8924270ef..03676c4448 100644
>> --- a/hw/ppc/spapr_softmmu.c
>> +++ b/hw/ppc/spapr_softmmu.c
>> @@ -426,7 +426,7 @@ static void new_hpte_store(void *htab, uint64_t pteg, int slot,
>>       addr += slot * HASH_PTE_SIZE_64;
>>   
>>       stq_p(addr, pte0);
>> -    stq_p(addr + HASH_PTE_SIZE_64 / 2, pte1);
>> +    stq_p(addr + HPTE64_R_BYTE_OFFSET, pte1);
>>   }
>>   
>>   static int rehash_hpte(PowerPCCPU *cpu,
>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>> index 19832c4b46..168d397c26 100644
>> --- a/target/ppc/mmu-hash64.c
>> +++ b/target/ppc/mmu-hash64.c
>> @@ -786,7 +786,7 @@ static void ppc_hash64_set_dsi(CPUState *cs, int mmu_idx, uint64_t dar, uint64_t
>>   
>>   static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>   {
>> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 16;
>> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_R_BYTE_OFFSET;
>>   
>>       if (cpu->vhyp) {
>>           PPCVirtualHypervisorClass *vhc =
>> @@ -803,7 +803,7 @@ static void ppc_hash64_set_r(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>   
>>   static void ppc_hash64_set_c(PowerPCCPU *cpu, hwaddr ptex, uint64_t pte1)
>>   {
>> -    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + 15;
>> +    hwaddr base, offset = ptex * HASH_PTE_SIZE_64 + HPTE64_R_C_BYTE_OFFSET;
>>   
>>       if (cpu->vhyp) {
>>           PPCVirtualHypervisorClass *vhc =
>> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
>> index c5b2f97ff7..2a46763f70 100644
>> --- a/target/ppc/mmu-hash64.h
>> +++ b/target/ppc/mmu-hash64.h
>> @@ -97,6 +97,11 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>>   #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>>   #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
>>   
>> +/* PTE byte offsets */
>> +#define HPTE64_R_R_BYTE_OFFSET  14
>> +#define HPTE64_R_C_BYTE_OFFSET  15
>> +#define HPTE64_R_BYTE_OFFSET    (HASH_PTE_SIZE_64 / 2)
>> +
>>   /* Format changes for ARCH v3 */
>>   #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>>   #define HPTE64_R_3_0_SSIZE_SHIFT 58
> 


