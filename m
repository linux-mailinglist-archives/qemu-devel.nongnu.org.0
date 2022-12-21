Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B16533C2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 17:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p81Zg-0001Zx-72; Wed, 21 Dec 2022 11:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p81Za-0001Z1-Lm; Wed, 21 Dec 2022 11:04:05 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p81ZY-0006As-VO; Wed, 21 Dec 2022 11:04:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 00A7F14E0516D;
 Wed, 21 Dec 2022 17:03:54 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 21 Dec
 2022 17:03:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00263c2dcef-50e1-4f61-99bd-b8a90ba0fce9,
 78B451B26E434E63100236457A08FF51A4610C03) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7ababaf9-9c00-37e8-a2d0-565b8de57010@kaod.org>
Date: Wed, 21 Dec 2022 17:03:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Alistair Francis
 <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, Greg Kurz
 <groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
 <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
 <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
 <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7b888b27-5647-4c99-90f3-b7d95290d9c2
X-Ovh-Tracer-Id: 3344485675587046331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgeekgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpjhgrsh
 hofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/21/22 13:33, Peter Maydell wrote:
> On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au> wrote:
>> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
>>> OK. I still think we should consistently change all the places that are
>>> accessing this data structure, though, not just half of them.
>>
>> Yes, that makes sense.  Although what exactly constitutes "this data
>> structure" is a bit complex here.  If we mean just the spapr specific
>> "external HPT", then there are only a few more references to it.  If
>> we mean all instances of a powerpc hashed page table, then there are a
>> bunch more in the cpu target code.
> 
> I had in mind "places where we write this specific array of bytes
> spapr->htab".


spapr_store_hpte() seems to be the most annoying part. It is used
by hcalls h_enter, h_remove, h_protect. Reworking the interface
to present pte0/pte1 as BE variables means reworking the whole
hw/ppc/spapr_softmmu.c file. That's feasible but not a small task
since the changes will root down in the target hash mmu code which
is shared by all platforms ... :/

spapr_hpte_set_c() are spapr_hpte_set_r() are of a different kind.

C.

