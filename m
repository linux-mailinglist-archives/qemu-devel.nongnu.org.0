Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F7645EA36
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 10:19:34 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqXOG-0001rJ-BW
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 04:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqXNC-0000yc-J9
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:18:26 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:57173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqXNA-0003kx-Bz
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 04:18:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E217ECE1AC83;
 Fri, 26 Nov 2021 10:18:21 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 10:18:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003906d8683-c0da-4438-a9f8-653f5c17d4b8,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <96b6e427-e9e6-5f09-2858-a203bf6b44be@kaod.org>
Date: Fri, 26 Nov 2021 10:18:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
References: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
 <YaA0nkWqcGdZ7jM2@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YaA0nkWqcGdZ7jM2@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 51cccd4a-c15d-43b5-a6fc-2c7c2e55b467
X-Ovh-Tracer-Id: 11987737786106088230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedvgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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

Hello,

Curiously, I didn't get the v2 email.

On 11/26/21 02:13, David Gibson wrote:
> On Thu, Nov 25, 2021 at 03:33:22PM -0300, Leandro Lupori wrote:
>> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>> offset, causing the first byte of the adjacent PTE to be corrupted.
>> This caused a panic when booting FreeBSD, using the Hash MMU.
>>
>> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> 
> If you're introducing the constant, it would make sense to also use it
> in spapr_hpte_set_r().

I agree and please add one for the C bit also since it's the same
kind of twiddling.

Thanks,

C.


>> ---
>> Changes from v1:
>> - Add and use a new define for the byte offset of PTE bit R
>> ---
>>   target/ppc/mmu-hash64.c | 2 +-
>>   target/ppc/mmu-hash64.h | 3 +++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
>> index 19832c4b46..0968927744 100644
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
>> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
>> index c5b2f97ff7..40bb901262 100644
>> --- a/target/ppc/mmu-hash64.h
>> +++ b/target/ppc/mmu-hash64.h
>> @@ -97,6 +97,9 @@ void ppc_hash64_finalize(PowerPCCPU *cpu);
>>   #define HPTE64_V_1TB_SEG        0x4000000000000000ULL
>>   #define HPTE64_V_VRMA_MASK      0x4001ffffff000000ULL
>>   
>> +/* PTE byte offsets */
>> +#define HPTE64_R_R_BYTE_OFFSET  14>> +
>>   /* Format changes for ARCH v3 */
>>   #define HPTE64_V_COMMON_BITS    0x000fffffffffffffULL
>>   #define HPTE64_R_3_0_SSIZE_SHIFT 58
> 


