Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DF449393F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:08:45 +0100 (CET)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8pY-0008QR-9U
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA8n8-0006wd-6a
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:06:14 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA8n5-0005qj-W8
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:06:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id EE059D8AEBD4;
 Wed, 19 Jan 2022 12:05:57 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 12:05:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034a3c066e-66a6-48f4-8b91-d99d47761973,
 D7DF39B65A0956CFE557F682C3487E629228C0D9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <423c655a-b87f-9d08-208a-2e73196adfbc@kaod.org>
Date: Wed, 19 Jan 2022 12:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexey Kardashevskiy
 <aik@ozlabs.ru>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c481db28-2687-4a31-b728-0a5e8c3af1bb
X-Ovh-Tracer-Id: 17335762342024612713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/22 17:45, Peter Maydell wrote:
> On Fri, 7 Jan 2022 at 07:29, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> "PowerPC Processor binding to IEEE 1275" says in
>> "8.2.1. Initial Register Values" that the initial state is defined as
>> 32bit so do it for both SLOF and VOF.
>>
>> This should not cause behavioral change as SLOF switches to 64bit very
>> early anyway. As nothing enforces LE anywhere, this drops it for VOF.
>>
>> The goal is to make VOF work with TCG as otherwise it barfs with
>> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)
> 
> If you get this assert it means that something is changing
> the CPU state and not calling the function to recalculate
> the hflags (which are basically caching part of the CPU state).
> So I don't know whether this patch is correct or not in updating
> MSR bits, but in any case I think it is only masking the
> missing-hflags-update that is causing the assertion...


yes. Currently, spapr_vof_reset() is called from the pseries
machine reset handler and modifies brutally the MSR without
calling hreg_compute_hflags()to update the hflags. Hence
the warning.

The proposal moves the MSR update under the pseries CPU reset
handler: spapr_reset_vcpu() where it should be. spapr_reset_vcpu()
also updates the LPCR register and calls hreg_compute_hflags()
when done.

The question we all had was why it was set to 64bit initially
by commit 8b9f2118ca40 which seems to be in contradiction with
the PAPR specs saying the CPUs should start in 32bit mode.
It is not clear but I didn't see any regression on pseries or
on the macbook machine using 970 CPUs. I think we are fine.


Thanks,

C.

