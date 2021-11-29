Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713F46147C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:04:53 +0100 (CET)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrfOu-0005Du-D6
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrfKc-0002d9-5S
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:00:27 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:50363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mrfKZ-00083p-P3
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:00:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9CCF621464;
 Mon, 29 Nov 2021 12:00:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 13:00:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0018a47a5e7-0a79-4e99-be84-e242fd9efec9,
 5832CB413B33430C7B7B1B9ECA0BD44D35E8DE25) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b79be7dc-ebb6-2a41-967b-388eef8f7e05@kaod.org>
Date: Mon, 29 Nov 2021 13:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
 <YaGfX6iiNqtO8qb4@yekko> <8ca89779-3af1-8761-3062-5bf3b4d150ec@kaod.org>
 <YaIoMlbVms+6awwL@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YaIoMlbVms+6awwL@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72a4f919-afc2-48e0-8255-8ed6a758f2b3
X-Ovh-Tracer-Id: 13892197477359455014
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgdefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.317,
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index 163c90388a..8ebf85bad8 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>>>            kvmppc_write_hpte(ptex, pte0, pte1);
>>>>        } else {
>>>>            if (pte0 & HPTE64_V_VALID) {
>>>> -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
>>>> +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
>>>
>>> Urgh.. so, initially I thought this was wrong because I was confusing
>>> HPTE64_R_BYTE_OFFSET with HPTE64_R_R_BYTE_OFFSET.  I doubt I'd be the
>>> only one.
>>>
>>> Calling something a BYTE_OFFSET then doing an stq to it is pretty
>>> misleading I think.  WORD1_OFFSET or R_WORD_OFFSET might be better?
>>
>> How about (inspired from XIVE) :
>>
>>   #define HPTE64_W1    (HASH_PTE_SIZE_64 / 2)
>>   #define HPTE64_W1_R  14 // or HPTE64_W1 + 6
>>   #define HPTE64_W1_C  15 // or HPTE64_W1 + 7
> 
> Good enough.

But a word is 32bits in Power. Let's use DW1 to be consistent with the
architecture. I think this is less confusing than using W2.

Thanks,

C.

