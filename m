Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0410A65E0EE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 00:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDD8x-0006L5-Tk; Wed, 04 Jan 2023 18:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDD8j-0006KU-2S
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 18:25:45 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDD8h-0004xe-7i
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 18:25:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0C0D22160E;
 Wed,  4 Jan 2023 23:25:29 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 00:25:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0056090f206-c6bd-4e5a-bf84-ca6c62c26e5e,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <256731e8-1432-b8b5-2597-40e65e9b03f7@kaod.org>
Date: Thu, 5 Jan 2023 00:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko
 <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>, Havard Skinnemoen
 <hskinnemoen@google.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, <qemu-arm@nongnu.org>,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-2-philmd@linaro.org>
 <CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com>
 <8fa1d7b7-babc-eca8-bbd9-4707ada2f49f@kaod.org>
 <081e95c1-d601-4ed5-678a-e6a828d6ea46@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <081e95c1-d601-4ed5-678a-e6a828d6ea46@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 03b56a48-16fc-4109-bf7d-323d05f09e24
X-Ovh-Tracer-Id: 785878136346086389
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeejgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfdtteetfefgiefhfefgueduveefieehgfevvdetiedugeeghfehtdehvdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhirdhmihhtshihrghnkhhosehgmhgrihhlrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtg
 homhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/4/23 23:35, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 4/1/23 09:43, Cédric Le Goater wrote:
>> On 1/3/23 18:33, Peter Maydell wrote:
> 
>>> Can we use the write_bootloader() function, which handles the
>>> endianness question correctly and is how other boards do the
>>> "put a little lump of code into the guest" job ?
>>
>> Yes. See below.
>>
>> May be we could change write_bootloader a little to handle an empty
>> fixupcontext.
>>
>> Thanks,
>>
>> C.
>>
>>  From 671d43faa7e14b896855403feb0afd777350cb0a Mon Sep 17 00:00:00 2001
>> From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
>> Date: Wed, 4 Jan 2023 09:30:28 +0100
>> Subject: [PATCH] hw/arm/boot: Export write_bootloader for Aspeed machines
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> AST2600 Aspeed machines have an home made boot loader for secondaries.
>> Instead, use the internal ARM boot loader.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
>>   hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
>>   hw/arm/boot.c         | 34 +++++++---------------------------
>>   3 files changed, 53 insertions(+), 47 deletions(-)
> [...]
> 
> I'm getting:
> 
> Applying: hw/arm/boot: Export write_bootloader for Aspeed machines
> error: patch failed: include/hw/arm/boot.h:183
> error: include/hw/arm/boot.h: patch does not apply
> error: patch failed: hw/arm/aspeed.c:201
> error: hw/arm/aspeed.c: patch does not apply
> error: patch failed: hw/arm/boot.c:59
> error: hw/arm/boot.c: patch does not apply
> Patch failed at 0001 hw/arm/boot: Export write_bootloader for Aspeed machines
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> What is your base commit? 

It applies on 222059a0fc ("Merge tag 'pull-ppc-20221221' of
https://gitlab.com/danielhb/qemu into staging")

> Can you post a normal patch?

Sure.

C.

