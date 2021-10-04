Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFF420616
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 08:55:58 +0200 (CEST)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXHtD-0001kl-QO
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 02:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXHre-0000uj-RM
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:54:19 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:59603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXHra-00077E-MT
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:54:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D2EF422E40;
 Mon,  4 Oct 2021 06:54:10 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 08:54:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004d464d25d-a472-4839-b961-b63c4d640b1d,
 6052322A053A64D32F912485F446DEADD4740C2E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <89a230f0-44bd-96fb-212b-d0e0dd47908d@kaod.org>
Date: Mon, 4 Oct 2021 08:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 33/44] target/ppc: Fix 64-bit decrementer
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
 <20210930054426.357344-34-david@gibson.dropbear.id.au>
 <CAFEAcA8AxuMRRjxpya3_H+57SmrduD1dVqg7vjSOadV1pCQaSQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8AxuMRRjxpya3_H+57SmrduD1dVqg7vjSOadV1pCQaSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 856bdeb4-cdbc-44ed-bd8d-b4cca9ec8880
X-Ovh-Tracer-Id: 11894569569162660786
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeluddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 12:39, Peter Maydell wrote:
> On Thu, 30 Sept 2021 at 06:44, David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>> From: Cédric Le Goater <clg@kaod.org>
>>
>> The current way the mask is built can overflow with a 64-bit decrementer.
>> Use sextract64() to extract the signed values and remove the logic to
>> handle negative values which has become useless.
>>
>> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
>> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for TCG")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Message-Id: <20210920061203.989563-5-clg@kaod.org>
>> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Hi; Coverity complains about dead code here (CID 1464061):
> 
> 
> 
>>        * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
>>        * an edge interrupt, so raise it here too.
>>        */
>> -    if ((value < 3) ||
>> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && negative) ||
>> -        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && negative
>> -          && !(decr & (1ULL << (nr_bits - 1))))) {
>> +    if ((signed_value < 3) ||
>> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
>> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
>> +          && signed_decr >= 0)) {
>>           (*raise_excp)(cpu);
>>           return;
>>       }
> 
> If signed_value < 3 then the first clause of the || evaluates as true,
> and so we will definitely take the if() clause. So if we're evaluating
> the second operand to the || then we know that signed_value > 3,
> which means that 'signed_value < 0' is always false and in turn that
> neither of the other two '||' options can be true. The whole expression
> is equivalent to just "if (signed_value < 3)".
> 
> What was intended here? If this was supposed to be a no-behaviour-change
> commit (apart from fixing the 64-bit case) then the condition should
> have stayed as "(value < 3)", I think.

Yes. That was the intention. I will take a closer look.

Thanks,

C.

