Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD194A86F5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:49:45 +0100 (CET)
Received: from localhost ([::1]:40532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdQf-00019y-19
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFdMe-00064R-KY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:45:46 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nFdMX-0005Ks-Jn
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:45:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 291C9222D8;
 Thu,  3 Feb 2022 14:45:24 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 15:45:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00264204111-e4bc-49f7-a881-9c1dea0d4dd5,
 2D6D7E980BA81B9DB12FBF68048091B4B0706485) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9ce80a2b-621e-8a5d-faae-c0c0b3e95ea3@kaod.org>
Date: Thu, 3 Feb 2022 15:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix radix logging
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20220203142145.1301749-1-clg@kaod.org>
 <20220203153943.5f017621@bahia>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220203153943.5f017621@bahia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 95f896f6-6dee-4437-b09c-053c7ef4a854
X-Ovh-Tracer-Id: 16898631704915184547
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 15:39, Greg Kurz wrote:
> On Thu, 3 Feb 2022 15:21:45 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> ppc_radix64_partition_scoped_xlate() logs the host page protection
>> bits variable but it is uninitialized since it is set later in
>> ppc_radix64_check_prot(). Remove the
>>
> 
> Remove the what ?

Arg ...

Changed to :

   ppc_radix64_partition_scoped_xlate() logs the host page protection
   bits variable but it is uninitialized. The value is set later on in
   ppc_radix64_check_prot(). Remove the output.


Thanks,

C.


> 
>> Fixes: Coverity CID 1468942
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> 
> LGTM apart from that.
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>>   target/ppc/mmu-radix64.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
>> index 040c055bff65..d4e16bd7db50 100644
>> --- a/target/ppc/mmu-radix64.c
>> +++ b/target/ppc/mmu-radix64.c
>> @@ -327,13 +327,9 @@ static int ppc_radix64_partition_scoped_xlate(PowerPCCPU *cpu,
>>       uint64_t pte;
>>   
>>       qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
>> -                  " mmu_idx %u (prot %c%c%c) 0x%"HWADDR_PRIx"\n",
>> +                  " mmu_idx %u 0x%"HWADDR_PRIx"\n",
>>                     __func__, access_str(access_type),
>> -                  eaddr, mmu_idx,
>> -                  *h_prot & PAGE_READ ? 'r' : '-',
>> -                  *h_prot & PAGE_WRITE ? 'w' : '-',
>> -                  *h_prot & PAGE_EXEC ? 'x' : '-',
>> -                  g_raddr);
>> +                  eaddr, mmu_idx, g_raddr);
>>   
>>       *h_page_size = PRTBE_R_GET_RTS(pate.dw0);
>>       /* No valid pte or access denied due to protection */
> 


