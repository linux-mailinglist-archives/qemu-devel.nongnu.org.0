Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44434199C7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:57:00 +0200 (CEST)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtw3-0002Eh-BA
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUtq8-0001du-6e
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:50:52 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:48209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mUtq1-00013E-Qz
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:50:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 02F6B21AB6;
 Mon, 27 Sep 2021 16:50:42 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 27 Sep
 2021 18:50:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028e5e1c60-8247-4a52-bee6-dd4799586da1,
 7A1C2730502A6E1581EB46D208322E62E5328AE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <90e2ef32-8151-e65c-d64b-de58bb5337f1@kaod.org>
Date: Mon, 27 Sep 2021 18:50:40 +0200
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210924191313.36c9c8e9@bahia.huguette>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 38cd527a-3da0-4e93-ac9a-58ecb18c245d
X-Ovh-Tracer-Id: 17753752682221702051
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.136,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/24/21 19:13, Greg Kurz wrote:
> On Fri, 24 Sep 2021 16:58:00 +0200
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> [ ... ]
>>
>>>> The changes only impact KVM support since we are deferring the IRQ
>>>> initialization at the KVM level. What we have to be careful about is not
>>>> accessing an ESB page of an interrupt that would not have been initiliazed
>>>> in the KVM device, else QEMU gets a sigbus.
>>>>
>>>
>>> Ok, so this is just needed on a path that leads to xive_esb_rw() or
>>> kvmppc_xive_esb_trigger(), right ?
>>>
>>> It seems that
>>>
>>> h_int_esb()
>>>    kvmppc_xive_esb_rw()
>>>
>>> can get there with an lisn provided by the guest, and I don't see any
>>> such check on the way : h_int_esb() only checks xive_eas_is_valid().
>>
>> This call is for LSI interrupts (device only) and not vCPU IPIs. see hcall
>> h_int_get_source_info(). I agree a hcall fuzzer could reach it.
>>
> 
> Yes we tell the guest to use H_INT_ESB for LSIs only but I don't have
> the impression that it is forbidden for the guest to call H_INT_ESB
> for arbitrary interrupts.
> 
>> An alternative solution would be to claim the vCPU IPIs on demand, like
>> we do for the MSIs, and not in spapr_irq_init(). It's a much bigger change
>> tough, because the H_INT hcalls consider that the interrupt numbers have
>> been claimed.
>>
> 
> Maybe it would be simpler to call xive_source_is_initialized() instead of
> xive_eas_is_valid() in cases like this, e.g. hcall code since it is shared
> between emulation and KVM ?

Yes but we need a better check than :

     if (lisn < SPAPR_XIRQ_BASE) {
         return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
     }

This is more an heuristic than a precise test on the "validity" of
a source at the KVM level.


Thanks,

C.

