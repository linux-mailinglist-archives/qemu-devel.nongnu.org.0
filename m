Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4D2CD2EF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:53:15 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklIX-0007jY-Kc
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kklGi-0006VX-IF; Thu, 03 Dec 2020 04:51:21 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kklGf-0004i6-8i; Thu, 03 Dec 2020 04:51:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 2C5E2777C682;
 Thu,  3 Dec 2020 10:51:11 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 3 Dec 2020
 10:51:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046f4f6680-9186-4946-b608-c5400be5a9e1,
 0AEFB2D7F5962DFD3E3C34A3E300797F3FBF43FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and
 number of claimed IPIs
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-3-groug@kaod.org>
 <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
Message-ID: <b3292b6e-f1a4-40d1-ff8b-f43be8748dd6@kaod.org>
Date: Thu, 3 Dec 2020 10:51:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 11789dcc-8ab5-4324-af2a-a615c56c61bd
X-Ovh-Tracer-Id: 13046646646277376992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeehueejveevkefhveeftdekudeghfetfeekkeekvedugedtteduhfefveejieehnecuffhomhgrihhnpehlrghunhgthhhprggurdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 7:07 PM, Cédric Le Goater wrote:
> On 11/30/20 5:52 PM, Greg Kurz wrote:
>> The sPAPR XIVE device has an internal ENDT table the size of
>> which is configurable by the machine. This table is supposed
>> to contain END structures for all possible vCPUs that may
>> enter the guest. The machine must also claim IPIs for all
>> possible vCPUs since this is expected by the guest.
>>
>> spapr_irq_init() takes care of that under the assumption that
>> spapr_max_vcpu_ids() returns the number of possible vCPUs.
>> This happens to be the case when the VSMT mode is set to match
>> the number of threads per core in the guest (default behavior).
>> With non-default VSMT settings, this limit is > to the number
>> of vCPUs. In the worst case, we can end up allocating an 8 times
>> bigger ENDT and claiming 8 times more IPIs than needed. But more
>> importantly, this creates a confusion between number of vCPUs and
>> vCPU ids, which can lead to subtle bugs like [1].
>>
>> Use smp.max_cpus instead of spapr_max_vcpu_ids() in
>> spapr_irq_init() for the latest machine type. Older machine
>> types continue to use spapr_max_vcpu_ids() since the size of
>> the ENDT is migration visible.
>>
>> [1] https://bugs.launchpad.net/qemu/+bug/1900241
>>
>> Signed-off-by: Greg Kurz <groug@kaod.org>
> 
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>


I gave patch 2 and 3 a little more thinking. 

I don't think we need much more than patch 1 which clarifies the 
nature of the values being manipulated, quantities vs. numbering.

The last 2 patches are adding complexity to try to optimize the 
XIVE VP space in a case scenario which is not very common (vSMT). 
May be it's not worth it. 

Today, we can start 4K (-2) KVM guests with 16 vCPUs each on 
a witherspoon (2 socket P9) and we are far from reaching the 
limits of the VP space. Available RAM is more a problem. 

VP space is even bigger on P10. The width was increased to 24bit 
per chip.

C.

