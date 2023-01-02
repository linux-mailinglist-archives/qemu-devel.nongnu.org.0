Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263E65B2F0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 14:55:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCLFx-0008Av-PP; Mon, 02 Jan 2023 08:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCLFl-000883-4y
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:53:25 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCLFj-0000ad-Ck
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 08:53:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C97C7150571B3;
 Mon,  2 Jan 2023 14:53:18 +0100 (CET)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 14:53:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00410fcb4e6-beea-4520-b99f-29b813c7188c,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
Date: Mon, 2 Jan 2023 14:53:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Ben Dooks <ben@fluff.org>
CC: Guenter Roeck <linux@roeck-us.net>, Alistair Francis
 <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>,
 Michael Walle <michael@walle.cc>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
 <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e6a0585d-6eb6-40fc-9f6f-af369728a73d
X-Ovh-Tracer-Id: 16270942507898342191
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -90
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddutddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdgsvghnsehflhhufhhfrdhorhhgpdhlihhnuhigsehrohgvtghkqdhushdrnhgvthdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhkfiholhhfsehrvgguhhgrthdrtghomhdphhhrvghithiisehrvgguhhgrthdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhhitghhrggvlhesfi
 grlhhlvgdrtggtpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.142,
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

On 12/27/22 07:31, Tudor Ambarus wrote:
> 
> 
> On 25.12.2022 14:18, Ben Dooks wrote:
>> On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
>>> On 12/21/22 13:22, Guenter Roeck wrote:
>>>> Generated from hardware using the following command and then padding
>>>> with 0xff to fill out a power-of-2:
>>>>     xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>>>>
>>>> Cc: Michael Walle <michael@walle.cc>
>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> If SFDP is a standard, couldn't we have an function to generate it from
>> the flash parameters?
>>
> 
> No, it's not practical as you have to specify all the flash parameters
> at flash declaration.

Indeed and the definition of flash models in QEMU is far to cover all the SFDP
features. The known_devices array of m25p80 would be huge ! However, we could
generate some of the SFDP tables if no raw data is provided. It could be useful
for testing drivers.

Thanks,

C.


