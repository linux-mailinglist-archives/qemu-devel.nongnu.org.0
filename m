Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABE44BBD9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:57:46 +0100 (CET)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkhYH-0002mW-IR
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkhXB-0001Rw-M5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:56:37 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:49113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkhX9-0002oO-7Z
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:56:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 78DFE20AFF;
 Wed, 10 Nov 2021 06:56:32 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 10 Nov
 2021 07:56:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002763a7d36-7055-4d7b-a3cc-652016661005,
 931C15AB0B82782E0F6D9848116383441E516CC9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <db132b26-0025-f573-1006-8a8c7aa2a656@kaod.org>
Date: Wed, 10 Nov 2021 07:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] target/ppc: Fixed call to deferred exception
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, "Lucas Mateus Castro
 (alqotel)" <lucas.araujo@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20211020125724.78028-1-lucas.araujo@eldorado.org.br>
 <20211020125724.78028-2-lucas.araujo@eldorado.org.br>
 <2458d27b-75eb-e4f8-c588-efd8c50df5fc@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2458d27b-75eb-e4f8-c588-efd8c50df5fc@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9f207fee-f292-4504-99c4-dc3c2cf83a07
X-Ovh-Tracer-Id: 7863284951109503849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgdeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 richard.henderson@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 17:37, Daniel Henrique Barboza wrote:
> 
> 
> On 10/20/21 09:57, Lucas Mateus Castro (alqotel) wrote:
>> From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>
>>
>> mtfsf, mtfsfi and mtfsb1 instructions call helper_float_check_status
>> after updating the value of FPSCR, but helper_float_check_status
>> checks fp_status and fp_status isn't updated based on FPSCR and
>> since the value of fp_status is reset earlier in the instruction,
>> it's always 0.
>>
>> Because of this helper_float_check_status would change the FI bit to 0
>> as this bit checks if the last operation was inexact and
>> float_flag_inexact is always 0.
>>
>> These instructions also don't throw exceptions correctly since
>> helper_float_check_status throw exceptions based on fp_status.
>>
>> This commit created a new helper, helper_fpscr_check_status that checks
>> FPSCR value instead of fp_status and checks for a larger variety of
>> exceptions than do_float_check_status.
>>
>> The hardware used to compare QEMU's behavior to, was a Power9.

Do you have a test case for this ? If so, are you collecting them
on some repo ?
  
Thanks,

C.

