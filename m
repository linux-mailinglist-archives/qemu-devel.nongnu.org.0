Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA7A45E978
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 09:36:54 +0100 (CET)
Received: from localhost ([::1]:42404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqWiz-0002rm-4g
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 03:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqWh9-0001In-IS
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:34:59 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:55291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqWh7-00062a-7h
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:34:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 238FD1FF88;
 Fri, 26 Nov 2021 08:34:45 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 09:34:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0028040e714-b67a-40ca-8fb9-30be8a4b519d,
 E91118460BEBCC383607BF3F5B3B6EB0430A1632) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
Date: Fri, 26 Nov 2021 09:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>, BALATON Zoltan
 <balaton@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <20211125093801.GM614@gate.crashing.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211125093801.GM614@gate.crashing.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a4ddfc62-e9e6-4838-88bd-3e1b03a47b4f
X-Ovh-Tracer-Id: 11251399244102994796
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedugdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 11/25/21 10:38, Segher Boessenkool wrote:
> Hi!
> 
> On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
>> As for guests, those running on the said PowerMac G4 should have support
>> for these CPUs so maybe you can try some Mac OS X versions (or maybe
> 
> OSX uses hardware pagetables.
> 
>> MorphOS but that is not the best for debugging as there's no source
>> available nor any help from its owners but just to see if it boots it may
>> be sufficient, it should work on real PowerMac G4).
> 
> I have no idea what MorphOS uses, but I bet HPT as well.  That is
> because HPT is fastest in general.  Software TLB reloads are good in
> special cases only; the most common is real-time OSes, which can use its
> lower guaranteed latency for some special address spaces (and can have a
> simpler address map in general).

The support was added to QEMU knowing that Linux didn't handle soft TLBs.
And the commit says that it was kept disabled initially. I guess that was
broken these last years.

C.


$ git show 7dbe11acd807
commit 7dbe11acd807
Author: Jocelyn Mayer <l_indien@magic.fr>
Date:   Mon Oct 1 05:16:57 2007 +0000

     Handle all MMU models in switches, even if it's just to abort because of lack
       of supporting code.
     Implement 74xx software TLB model.
     Keep 74xx with software TLB disabled, as Linux is not able to handle TLB miss
       on those processors.

C.

