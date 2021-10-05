Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F54421DEF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 07:28:08 +0200 (CEST)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXczn-0004x4-58
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 01:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXcyI-00043Z-1f
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 01:26:34 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:56947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXcyF-0007zZ-0w
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 01:26:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C271521713;
 Tue,  5 Oct 2021 05:26:26 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 5 Oct
 2021 07:26:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c28cb920-3b1e-46a3-9450-e9e5d2ee6ee5,
 C56B09F7ACDDDC2AE9D52F72C0F42EB3CB79DF66) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <77dc2a75-5f86-0d62-8c8a-96411b4c9977@kaod.org>
Date: Tue, 5 Oct 2021 07:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/ppc: Fix test the decrementer exception
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211004212027.432553-1-clg@kaod.org>
 <f99b328a-9f96-aac2-52ee-24aa8d344e96@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f99b328a-9f96-aac2-52ee-24aa8d344e96@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d53f8afb-430d-4f7e-8e73-c1865ab1d518
X-Ovh-Tracer-Id: 16285579205204347686
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelfedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in Subject: s/test//

On 10/4/21 23:45, BALATON Zoltan wrote:
> On Mon, 4 Oct 2021, Cédric Le Goater wrote:
>> Commit 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer") introduced
>> new int64t variables and broke the test triggering the decrementer
>> exception. Revert partially the change to evaluate both clause of the
>> if statement.
>>
>> Fixes: Coverity CID 1464061
> 
> Shouldn't this be:
> 
> Reported-by: Coverity CID 1464061
> Fixes: 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer")
> 
> or something similar?

I went through the commit logs before sending and that seemed to be
the latest practice.

Not an issue. I can resend.

C.

> 
> Regards,
> BALATON Zoltan
> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index f5d012f860af..a724b0bb5ecb 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -848,7 +848,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
>>      * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
>>      * an edge interrupt, so raise it here too.
>>      */
>> -    if ((signed_value < 3) ||
>> +    if ((value < 3) ||
>>         ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
>>         ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
>>           && signed_decr >= 0)) {
>>


