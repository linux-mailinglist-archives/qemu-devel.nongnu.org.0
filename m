Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB5495CCF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 10:27:05 +0100 (CET)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAqCG-0006xw-9E
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 04:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAp6s-0003Ps-Fk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:17:28 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:51311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAp6q-0000Cg-4B
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 03:17:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 777AD210B0;
 Fri, 21 Jan 2022 08:17:20 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 09:17:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00618a13001-214e-43b3-9666-ff328d9634b9,
 0868046A3D5FFD4A19DAA1F3199B5438DDC438D4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9717e63d-b72a-81f6-e9b9-052294f560f1@kaod.org>
Date: Fri, 21 Jan 2022 09:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc/mmu_common: Fix SRR1/MSR error code on Book-E
Content-Language: en-US
To: Vitaly Cheptsov <cheptsov@ispras.ru>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Greg
 Kurz <groug@kaod.org>
References: <BE5775C6-A54F-4443-9752-DBB6587E1F46@ispras.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <BE5775C6-A54F-4443-9752-DBB6587E1F46@ispras.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f602b1a6-5531-4c31-a62b-f6f027299dba
X-Ovh-Tracer-Id: 7786723758138755948
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudelgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeeihfdtueetlefhtedvieduteetgfelhffgffelteefgfektdeugeduhfetffelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpqhgvmhhurdhorhhgpdhngihprdgtohhmpdhophgvnhhpohifvghrfhhouhhnuggrthhiohhnrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kurban Mallachiev <mallachiev@ispras.ru>, qemu-ppc@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>, "mario@locati.it" <mario@locati.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Vitaly

On 1/21/22 01:02, Vitaly Cheptsov wrote:
> Hello,
> 
> PowerPC e500mc defines MSR bit 35 differently from most other PowerPC variants. In particular, for e500mc this is GS (Guest Supervisor) bit[1], while for others it is NOEXEC GUARD bit[2].
> QEMU ignores this architectural difference when handling the exceptions of attempting to run not executable code on e500mc, and mistakenly sets the GS bit[3][4].
> Setting this bit eventually leads to crashes, because although QEMU does not support Guest Supervisor mode on e500mc, it still requires it to be disabled[5].

This looks correct and even fixing an issue that Mario reported
on the TCG e6500 CPU with a kernel + KVM compiled in :

   https://lore.kernel.org/all/R5JFVM$911E343FF81933B99D53FD0992D8848F@locati.it/

KVM has some issues also with the e6500 but that's another problem
I think.


What is your environment ? Which QEMU machine ? Can you provide a
command line ?

Could you please resend the patch in a non attached way ?  See :

   https://www.qemu.org/docs/master/devel/submitting-a-patch.html

and copy qemu-devel.

Thanks,

C.


> Best regards,
> Vitaly
> 
> [1] https://www.nxp.com/docs/en/reference-manual/E500MCRM.pdf, 2.7.1 MSR
> [2] https://openpowerfoundation.org/?resource_lib=power-isa-version-3-0, 6.5.5 Instruction Storage Interrupt
> [3] https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_common.c#L1426
> [4] https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/excp_helper.c#L414-L416
> [5] https://github.com/qemu/qemu/blob/v6.2.0/target/ppc/mmu_helper.c#L1078-L1080
> 


