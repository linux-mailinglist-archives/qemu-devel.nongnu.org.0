Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8AC6E44DE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 12:12:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poLou-0001sT-Rp; Mon, 17 Apr 2023 06:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1poLot-0001sL-7I
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:10:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1poLor-00046Z-Fe
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:10:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 26E1E20616;
 Mon, 17 Apr 2023 10:10:35 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 17 Apr
 2023 12:10:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00413f5fcfa-6a3a-408a-8526-524954c70362,
 C0C1884EDF68BA6869BC199430A098AA1204E091) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <334c1e08-c308-3eb4-39a0-b3dfcf353ae6@kaod.org>
Date: Mon, 17 Apr 2023 12:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
Content-Language: en-US
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas
 <farosas@suse.de>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, <danielhb413@gmail.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <87mt3aisaz.fsf@suse.de> <a8219d9f-a212-b29e-7e83-2415f20e3144@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a8219d9f-a212-b29e-7e83-2415f20e3144@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 70969eb8-e017-4077-8d23-c2f6d91afcd7
X-Ovh-Tracer-Id: 1953154866313333667
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeffffgleevgfduveefjeehheetgfefveeluedvjeekieelleettdeivdekleeiveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehhrghrshhhphgssehlihhnuhigrdhisghmrdgtohhmpdhfrghrohhsrghssehsuhhsvgdruggvpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.976,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/23 09:21, Harsh Prateek Bora wrote:
> 
> 
> On 4/14/23 17:34, Fabiano Rosas wrote:
>> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
>>
>>> This patchset introduces helper routines to enable (and does) cleaning
>>> up of h_enter_nested() and spapr_exit_nested() routines in existing api
>>> for nested virtualization on Power/SPAPR for better code readability /
>>> maintenance. No functional changes intended with this patchset.
>>
>> Do we have tests for this nested virtual hypervisor code? It would be
>> good to have at least a smoke test. I remember someone started adding
>> support to qemu-ppc-boot, probably Murilo. I suggest you take a look
>> around and maybe see what it takes to add it.
>>
>> Just a L0 TCG with a small-ish qemu inside of it and a script to start
>> an L2.
>>
> 
> This is something I already have in my to-do list, taking a note of your suggestions.

When developing KVM support under the emulated PowerNV QEMU machines,
I was using this buildroot target :

   https://github.com/legoater/buildroot/commit/307ecbf7409e6fb060d7bbcc41201fdcacf0b0ca

I then used the same image to test the L2 support.

C.

