Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E441EA4E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:02:27 +0200 (CEST)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWFN4-0000Qs-Gg
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWFKd-0007BH-Pa
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:59:55 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mWFKb-0003iM-7M
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:59:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B66C2C18609C;
 Fri,  1 Oct 2021 11:59:48 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 1 Oct
 2021 11:59:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0051cb887d2-a034-4acd-8478-1a381950f989,
 4BD1923EFCE0A2D5FFEE921A78BF2E0F2CE6D79C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3e375254-1f6f-f630-77f0-a73d50d3b7df@kaod.org>
Date: Fri, 1 Oct 2021 11:59:45 +0200
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
 <6936294c-f236-2179-cd90-d45af74e7179@kaod.org>
 <20210924191313.36c9c8e9@bahia.huguette>
 <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
 <20210928091924.2b57bec4@bahia.huguette>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210928091924.2b57bec4@bahia.huguette>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 94259d7d-2851-496c-8ed0-dcc123ec985c
X-Ovh-Tracer-Id: 15858300188020083619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekiedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.127,
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

>>> Maybe it would be simpler to call xive_source_is_initialized() instead of
>>> xive_eas_is_valid() in cases like this, e.g. hcall code since it is shared
>>> between emulation and KVM ?
>>
>> Yes but we need a better check than :
>>
>>       if (lisn < SPAPR_XIRQ_BASE) {
>>           return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
>>       }
>>
>> This is more an heuristic than a precise test on the "validity" of
>> a source at the KVM level.
>>
> 
> I guess we should be able to get kvmppc_xive_irq_state::valid from
> KVM by making the KVM_DEV_XIVE_GRP_SOURCE attribute readable. Would
> that be enough ?

A bit slow may be. Or an extra bit in the XiveSource 'status' field
to reflect KVM initialization.

C.


