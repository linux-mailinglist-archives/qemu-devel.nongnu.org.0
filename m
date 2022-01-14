Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2248EC06
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:52:22 +0100 (CET)
Received: from localhost ([::1]:40828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NwD-0006F2-HL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:52:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n8NJU-0004NS-Iz; Fri, 14 Jan 2022 09:12:21 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n8NJR-0003rT-GE; Fri, 14 Jan 2022 09:12:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 70F5DD7C68C9;
 Fri, 14 Jan 2022 15:12:13 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 15:12:12 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0062654c1c3-7363-42d3-a298-46a3c946fe77,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
Date: Fri, 14 Jan 2022 15:12:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>, David
 Gibson <david@gibson.dropbear.id.au>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 41d15c10-b63c-4975-a640-9da9c6648288
X-Ovh-Tracer-Id: 9564801186510965609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkedvgfduveekfeekledtjeetkedvgeffgeduteegtedtffejfeehkeeflefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 03:52, Alexey Kardashevskiy wrote:
> 
> 
> On 08/01/2022 00:39, Greg Kurz wrote:
>> On Fri, 7 Jan 2022 23:19:03 +1100
>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>
>>> On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
>>>> On Fri, 7 Jan 2022 18:24:23 +1100
>>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>>
>>>>> "PowerPC Processor binding to IEEE 1275" says in
>>>>> "8.2.1. Initial Register Values" that the initial state is defined as
>>>>> 32bit so do it for both SLOF and VOF.
>>>>>
>>>>> This should not cause behavioral change as SLOF switches to 64bit very
>>>>> early anyway.
>>>>
>>>> Only one CPU goes through SLOF. What about the other ones, including
>>>> hot plugged CPUs ?
>>>
>>> Those will be started by the start-cpu RTAS call which has its own
>>> semantics.
>>>
>>
>> Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
>> secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
>> which is called earlier sets MSR_SF but the changelog of commit 8b9f2118ca40
>> doesn't provide much details on the motivation. Any idea ?
> 
> https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/
> 
> this is probably it:
> 
> ===
> Reset is properly defined as an exception (0x100). For exceptions, the
> 970MP user manual for example says:
> 
> 4.5 Exception Definitions
> When an exception/interrupt is taken, all bits in the MSR are set to
> ‘0’, with the following exceptions:
> • Exceptions always set MSR[SF] to ‘1’.
> ===
> 
> but it looks like the above is about emulation bare metal 970 rather than pseries VCPU so that quote does not apply to spapr.

Yes, more info here :

   https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/

mac99+970 only boots with a 64bit kernel. 32bit are not supported because
of the use of the rfi instruction which was removed in v2.01. 32bit user
space is supported though.

However I was not able to build a disk with a compatible boot partition
for OpenBIOS. The above support only applies for kernel loaded in memory.
May be Mark knows how to do this ?

Anyhow, I didn't see any regression on PAPR with this patch, TCG or KVM.

Thanks,

C.

