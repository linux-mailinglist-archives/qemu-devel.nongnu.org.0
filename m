Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8554C4F6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:46:14 +0200 (CEST)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PbI-00064V-JL
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o1PXB-0005LU-OE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:41:57 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:49707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o1PX9-0003u9-FE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:41:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 93128246AD;
 Wed, 15 Jun 2022 09:41:44 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 15 Jun
 2022 11:41:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0022b2de988-b6db-476f-b2e5-fe5387573a50,
 3604600A7A17CF82FBB88DE7BC2BB74EF19CEDFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 80.215.207.109
Message-ID: <20992f15-dd7f-f089-57e0-e934fb121d4a@kaod.org>
Date: Wed, 15 Jun 2022 11:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] target/ppc: cpu_init: Clean up stop state on cpu reset
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220614082912.378355-1-fbarrat@linux.ibm.com>
 <64d1330c-1996-622c-fc1a-ed81fd56cdda@kaod.org>
 <3da1094b-b200-49ad-3a7c-dae31a7e7658@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3da1094b-b200-49ad-3a7c-dae31a7e7658@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0cea1cb5-25f0-4374-a567-d1de8f048430
X-Ovh-Tracer-Id: 12202503194341575648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 09:17, Frederic Barrat wrote:
> 
> 
> On 15/06/2022 07:23, Cédric Le Goater wrote:
>> On 6/14/22 10:29, Frederic Barrat wrote:
>>> The 'resume_as_sreset' attribute of a cpu can be set when a thread is
>>> entering a stop state on ppc books. It causes the thread to be
>>> re-routed to vector 0x100 when woken up by an exception. So it must be
>>> cleaned on reset or a thread might be re-routed unexpectedly after a
>>> reset, when it was not in a stop state and/or when the appropriate
>>> exception handler isn't set up yet.
>>
>> What is the test scenario ? and what are the symptoms ?
> 
> 
> I was hitting it because of another bug in skiboot: if you have many chips, we spend way too much time in add_opal_interrupts(), especially on powernv10 (I'm working on a separate patch in skiboot to fix that). Sufficiently so that the watchdog timer resets the system. When it happens, all the secondary threads are in stopped state, only the main thread is working. That's how I was reproducing.
> 
> What happens after the reset can vary a bit due to timing, but the most likely scenario is that we go through another primary thread election in skiboot. If the primary thread is the same as before, then there's no problem. If it's a different primary, then it will enter main_cpu_entry() while the other threads wait as secondaries. At some point, the primary thread (which still carries the wrong resume_as_sreset value from before reset) will enable the decrementer interrupt. The vector for the decrementer exception 0x900 is defined, so that shouldn't be a problem. However, because of the wrong resume_as_sreset value, it is re-routed to vector 0x100, which is still defined as the default boot-time handler, which is the entry point for BML. So the thread restarts as new, but this time it will be elected secondary. And we end up with all threads waiting as secondaries and a system stuck. All that happen before we've init the uart, so there's not a single trace on the console. 
> Fun :-)

Great analysis !

I think this deserve a v2 just to put in the commit log what you
just wrote :)

Thanks,

C.

