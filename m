Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C952417730
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:59:24 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmfb-0007dJ-BF
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTmeM-0006Oe-KU
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:58:06 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mTmeK-00062H-NV
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:58:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BAD39BFED1B5;
 Fri, 24 Sep 2021 16:58:01 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 24 Sep
 2021 16:58:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00270a0a8fa-595e-450e-9af9-9a6de2e75839,
 EA4874C54EC1FB151381C7D8681494D1EB26EF60) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
Date: Fri, 24 Sep 2021 16:58:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
 <20210924154906.59da27f7@bahia.huguette>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924154906.59da27f7@bahia.huguette>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c9ab9ccd-203f-4332-95c3-79dd1fa97599
X-Ovh-Tracer-Id: 16679362699018013603
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ ... ]

>> The changes only impact KVM support since we are deferring the IRQ
>> initialization at the KVM level. What we have to be careful about is not
>> accessing an ESB page of an interrupt that would not have been initiliazed
>> in the KVM device, else QEMU gets a sigbus.
>>
> 
> Ok, so this is just needed on a path that leads to xive_esb_rw() or
> kvmppc_xive_esb_trigger(), right ?
> 
> It seems that
> 
> h_int_esb()
>   kvmppc_xive_esb_rw()
> 
> can get there with an lisn provided by the guest, and I don't see any
> such check on the way : h_int_esb() only checks xive_eas_is_valid().

This call is for LSI interrupts (device only) and not vCPU IPIs. see hcall
h_int_get_source_info(). I agree a hcall fuzzer could reach it.

An alternative solution would be to claim the vCPU IPIs on demand, like
we do for the MSIs, and not in spapr_irq_init(). It's a much bigger change
tough, because the H_INT hcalls consider that the interrupt numbers have
been claimed.

C.

