Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9666E697A72
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFfl-0003qg-79; Wed, 15 Feb 2023 06:10:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSFfj-0003qH-HE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:09:59 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSFfg-00041q-B3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:09:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 733472B114;
 Wed, 15 Feb 2023 11:09:51 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 12:09:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e4979293-5ed1-4691-b380-76b2d6df81e3,
 38A6E00C82B2D95FDD0C44CB66D888AEA19A4E6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
Date: Wed, 15 Feb 2023 12:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/8] hw/misc: add a toy i2c echo device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-4-clg@kaod.org>
 <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2c4e1501-cf0e-43ff-8767-52e9e0df804f
X-Ovh-Tracer-Id: 13654632598264777519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhteegffdvieegleelvddtffehveevgedtudeujeduueekieeivdefteeileeileenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhivdgtqdgvtghhohdrtghsnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrh
 hordhorhhgpdhkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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

On 2/15/23 11:55, Philippe Mathieu-Daudé wrote:
> On 14/2/23 18:18, Cédric Le Goater wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Add an example I2C device to demonstrate how a slave may master the bus
>> and send data asynchronously to another slave.
> 
> What a rebellion...
> 
>> The device will echo whatever it is sent to the device identified by the
>> first byte received.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>>           on such SoCs
>>         - folded in these fixes :
>>              https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
>> ]
>> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>>   hw/misc/meson.build |   2 +
>>   2 files changed, 158 insertions(+)
>>   create mode 100644 hw/misc/i2c-echo.c
> 
> 
>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>> index 448e14b531..3eb1bda710 100644
>> --- a/hw/misc/meson.build
>> +++ b/hw/misc/meson.build
>> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))
> 
> s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.

even if only supported by the Aspeed SoC ? I am OK with both.


> 
>>   specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>>   specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
> 


