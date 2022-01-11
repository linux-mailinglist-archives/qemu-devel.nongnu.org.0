Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C948B429
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:40:59 +0100 (CET)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7L8j-0001Re-8T
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:40:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7KwO-0002ts-Pg
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:28:12 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:37975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7KwM-0001Tv-Dz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:28:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 21681D70FCD7;
 Tue, 11 Jan 2022 18:28:06 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 11 Jan
 2022 18:28:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005215c82d5-37c6-4f46-a9a7-efdc518e0f4b,
 5383433EA887FCAE918FFCB03530F9AACAE8953B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6dc27f45-3a8a-407a-6bf2-cb6eb1d3510c@kaod.org>
Date: Tue, 11 Jan 2022 18:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 06/26] target/ppc: Improve logging in Radix MMU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220104073121.3784280-1-clg@kaod.org>
 <20220104073121.3784280-7-clg@kaod.org>
 <CAFEAcA_N0dfFO6UXopDCmN2C6qukR5bgpTBPqJBbyfE2okxhCA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_N0dfFO6UXopDCmN2C6qukR5bgpTBPqJBbyfE2okxhCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b7fe04fa-c0bc-4a7b-9836-29ce8b7f2dea
X-Ovh-Tracer-Id: 13701638919640812512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehfedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/22 17:51, Peter Maydell wrote:
> On Tue, 4 Jan 2022 at 07:31, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20211222071002.1568894-1-clg@kaod.org>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   target/ppc/mmu-radix64.c | 55 +++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 52 insertions(+), 3 deletions(-)
> 
> Hi; Coverity reports that this change introduces a use of
> an uninitialized variable:
> 
>> @@ -306,6 +321,15 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>>       hwaddr pte_addr;
>>       uint64_t pte;
>>
>> +    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
>> +                  " mmu_idx %u (prot %c%c%c) 0x%"HWADDR_PRIx"\n",
>> +                  __func__, access_str(access_type),
>> +                  eaddr, mmu_idx,
>> +                  *h_prot & PAGE_READ ? 'r' : '-',
>> +                  *h_prot & PAGE_WRITE ? 'w' : '-',
>> +                  *h_prot & PAGE_EXEC ? 'x' : '-',
>> +                  g_raddr);
> 
> At the top of this function we now read the value at h_prot to
> do this logging, but all the callsites pass in an uninitialized
> value:
>> 
>     int h_prot;
>     ...
>             ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
>                                                   pate, &h_raddr, &h_prot, etc);
> 
> 
> Are the callsites wrong (should be initializing h_prot), or is the
> logging wrong (and it's this function itself which is supposed to
> initialize *h_prot as an extra return value) ?>
> This is CID 1468942.

h_prot is initialized after the logging, in ppc_radix64_check_prot().
Logging is wrong.

Thanks,

C.



