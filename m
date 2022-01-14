Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F4048EB25
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 14:58:44 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8N6J-0002Xc-Oi
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 08:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8MzH-0002Ot-PK
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:51:28 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n8MzF-00005E-7S
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:51:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9ECD422474;
 Fri, 14 Jan 2022 13:51:22 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 14 Jan
 2022 14:51:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003ec5562ba-4b25-41da-90b8-ad526ad12525,
 CC0F12677928C812C874D314DD24F058DC39716A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1dcc6ac2-f72d-58b4-d1bb-f2e3a395daff@kaod.org>
Date: Fri, 14 Jan 2022 14:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220107143910.4443af02@bahia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ad88972d-7f59-46ed-ac1b-32cad83bfabd
X-Ovh-Tracer-Id: 9212675988479904617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeufeeguddvtdfhfedtgfdvieefgefgtdffheffhfdvveevgeetgfduleffveetveenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 14:39, Greg Kurz wrote:
> On Fri, 7 Jan 2022 23:19:03 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
>>> On Fri, 7 Jan 2022 18:24:23 +1100
>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>>> "PowerPC Processor binding to IEEE 1275" says in
>>>> "8.2.1. Initial Register Values" that the initial state is defined as
>>>> 32bit so do it for both SLOF and VOF.
>>>>
>>>> This should not cause behavioral change as SLOF switches to 64bit very
>>>> early anyway.
>>>
>>> Only one CPU goes through SLOF. What about the other ones, including
>>> hot plugged CPUs ?
>>
>> Those will be started by the start-cpu RTAS call which has its own
>> semantics.
>>
> 
> Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
> secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
> which is called earlier sets MSR_SF but the changelog of commit 8b9f2118ca40
> doesn't provide much details on the motivation. Any idea ?

I found some reference to the commit here but it doesn't seem
to be the root cause :

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1723914

Thanks,

C.

