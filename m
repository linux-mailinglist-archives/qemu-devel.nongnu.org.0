Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C1562AEA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 07:40:30 +0200 (CEST)
Received: from localhost ([::1]:47194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o79OG-0006z0-2x
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 01:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o79Jd-0005P4-Gh
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 01:35:41 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:58361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o79Ja-0005wx-Sk
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 01:35:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 40ABC248FE;
 Fri,  1 Jul 2022 05:35:34 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 1 Jul 2022
 07:35:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0065802b08f-bfa4-4c0b-9568-dcbcb27c4f45,
 4AFA7A5FE9B5479AF1021A557A7101AB3AA64E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <86c577b1-7b6d-6556-12ab-1fe2f43b8924@kaod.org>
Date: Fri, 1 Jul 2022 07:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>
CC: Peter Delevoryas <me@pjd.dev>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <cminyard@mvista.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhdaniel@fb.com>,
 <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
 <293da11c-dde2-e646-c754-820720c410de@kaod.org>
 <CAMvPwGpZZgAd2RHXmvmxfgyTyVGd6Rx+avj=E24NWc0masdc=A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAMvPwGpZZgAd2RHXmvmxfgyTyVGd6Rx+avj=E24NWc0masdc=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a1abf7ee-ef95-4d25-b2bf-555f31fe3a65
X-Ovh-Tracer-Id: 9774500041832565682
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehvddguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphguvghlsehfsgdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/30/22 21:16, Titus Rwantare wrote:
> On Wed, 29 Jun 2022 at 23:30, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 6/30/22 06:51, Peter Delevoryas wrote:
>>> From: Peter Delevoryas <pdel@fb.com>
>>>
>>> This adds the ISL69259, using all the same functionality as the existing
>>> ISL69260 but overriding the IC_DEVICE_ID.
>>>
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>> ---
>>>    hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
>>>    1 file changed, 28 insertions(+)
>>>
>>> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
>>> index 799ea9d89e..853d70536f 100644
>>> --- a/hw/sensor/isl_pmbus_vr.c
>>> +++ b/hw/sensor/isl_pmbus_vr.c
>>> @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
>>>        pmdev->pages[0].read_temperature_3 = 0;
>>>    }
>>>
>>> +static void isl69259_exit_reset(Object *obj)
>>> +{
>>> +    ISLState *s = ISL69260(obj);
>>> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};
>>
>> This looks like an ISLClass attribute to me. In which case, you wouldn't need the
>> reset handler nor the 'ic_device_id_len' field.
>>
>> Thanks,
>>
>> C.
> 
> I asked for this because, so far, I've been doing all the register
> defaults in reset handlers, including read-only registers.
> I don't mind either way, but it seemed preferable to have the devices
> consistent.

Sure. Fine for me.

Thanks,

C.


