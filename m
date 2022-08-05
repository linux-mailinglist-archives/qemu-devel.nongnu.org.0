Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618EC58A6CF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:14:38 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrXZ-0004Dd-FO
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJrQx-0008LD-F6
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:07:47 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:38943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJrQu-0002Ak-Co
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:07:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7FB0A20084;
 Fri,  5 Aug 2022 07:07:40 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 5 Aug 2022
 09:07:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003aa50708d-86b7-4b38-862f-5dade21837cd,
 A7EB86F94AB5C79C028CF19227CAA8D9174C0E26) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
Date: Fri, 5 Aug 2022 09:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Peter Maydell
 <peter.maydell@linaro.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, "list@suse.de:PowerPC"
 <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7195752d-c914-488c-a047-133c1f2e0298
X-Ovh-Tracer-Id: 13960032945790159779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeftddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 21:26, BALATON Zoltan wrote:
> On Thu, 4 Aug 2022, Peter Maydell wrote:
>> On Thu, 4 Aug 2022 at 19:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> I was trying to find out how to do it but I don't understand QOM enough to
>>> answer the simple question of how to get the cpu object from QOM. My
>>> guesses are:
>>>
>>> object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL)
> 
> Out of curiosity would this work though to get the cpu or if not why not and what would be a preferred way? I could not find this out from reading the object.h comments, the docs/deve/qom.rst, nor searching the code.

You could scan the object topology using object_child_foreach_recursive()
and use object_dynamic_cast() to find a POWERPC CPU object. A link is
much faster !

> 
>>> or maybe
>>>
>>> object_resolve_path_at(OBJECT(dev)->parent, "cpu")
>>>
>>> or how do these functions work and what is the preferred way to retrieve
>>> an object from the QOM tree? This is what I hoped someone with more
>>> understanding of QOM could answer.
>>
>> The standard approach that we use elsewhere in the tree for handling
>> "this device needs to have a pointer to a CPU object or whatever"
>> is "the device has a QOM link property, and the SoC sets that
>> property when it creates the device".
>>
>> There are other ways it could in theory be done, but there is
>> benefit in consistency, and "define and set the property" is
> 
> If this is the preferred way then so be it, I just don't like it because I think this is too many boilerplate code that could be avoided. This series:
> 
>   9 files changed, 894 insertions(+), 652 deletions(-)
> 
>   and that's including removing all of the taihu machine; the file where the QOMification is done:
> 
>   hw/ppc/ppc405_uc.c              | 799 +++++++++++++++++++-------------

Yes. You should consider also that this code is > 15 years old and
serious shortcuts have been taken to "make things work". I think QOM
clarifies the models and represents better the HW topology. There is
a price in being explicit.

> 
> Ideally introducing QOM should make it simpler not more complex. Four of the QOMified devices only have a property defined at all because of this cpu link that's only used once in the realize method to register DCRs. This is about 10 lines of code each. If there was a simple way to get the cpu object from these realize methods then we could get rid of all these properties and save about 40-50 lines and make these simpler.

I tried several approaches and found this one was the simplest and not
too verbose really.

The DCRs are accessed by software through the use of the mtdcr and mfdcr
instructions. These are converted in transactions on a side band bus,
the DCR bus, which connects the on-SoC devices to the CPU. The "cpu" link
should be considered as modeling this little piece of HW logic connecting
the device to the DCR bus.

Thanks,

C.


>> straightforward. It also means the device object doesn't have
>> to know anything about the way the SoC container is laid out.
> 
> We only need the cpu object so we don't need to know the soc container if there's a way to get it otherwise I just don't know how QOM works and was trying to find a way to get to the cpu object. Maybe it's simpler than that.
> 
> If there's no simple way or you and Cédric think it isn't worth the effort then I'm also OK with it but if there's a way to make this simpler I'd be happy to get rid of things that make it harder to read and understand code or allow making mistakes more easily. I take whatever decision you make so won't say this again, I think I've explained my point now.
> 
> Regards,
> BALATON Zoltan
> 
>> (It's usually worth looking at whether there are cleanups
>> that could mean the device doesn't have to have a pointer to
>> that other object at all -- but that isn't always the case,
>> or the cleanups would be a big job in their own right that
>> are better not tangled up with QOMification.)
>>
>> thanks
>> -- PMM
>>
>>


