Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47067D2EB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 18:20:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL5uO-0003vU-QI; Thu, 26 Jan 2023 12:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pL5uN-0003vB-Ch
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:19:31 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pL5uL-0003hy-9C
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 12:19:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0E1042A89F;
 Thu, 26 Jan 2023 17:19:23 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 26 Jan
 2023 18:19:23 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00472370a7e-1979-4741-b022-507efe347144,
 D2382EF7A35E17367A39C02A673735B22A7404C6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <33448f9b-3a99-a15b-1176-229435a2d182@kaod.org>
Date: Thu, 26 Jan 2023 18:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Content-Language: en-US
To: Ninad S Palsule <ninadpalsule@us.ibm.com>, "peter@pjd.dev" <peter@pjd.dev>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "hskinnemoen@google.com"
 <hskinnemoen@google.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "kfting@nuvoton.com" <kfting@nuvoton.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
References: <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
 <60a7ed30-b9f7-4943-5afe-fcd826ee6783@kaod.org>
 <5ADC51CD-F3D7-4F51-B125-9480C7FE86B0@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5ADC51CD-F3D7-4F51-B125-9480C7FE86B0@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ceb97123-e6a6-4f05-ae7b-84e51c1b6a22
X-Ovh-Tracer-Id: 13122081941515570098
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefgeduueevheelkeefffeukeehleegffdugeeghfeutdeghfdtgfejffdvfeekhfenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhinhgrughprghlshhulhgvsehushdrihgsmhdrtghomhdpphgvthgvrhesphhjugdruggvvhdprghnughrvgifsegrjhdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrh
 hmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

On 1/26/23 17:23, Ninad S Palsule wrote:
> Hi Cedric,
> 
> Good suggestion but we will not be able to share those EEPROM image files yet.
> We are trying to figure out how to sanitize them.

For eeprom tests, they could contain any data with some well know pattern
to check. It could/should be generated. No need to use real data.

Real eeprom data would be for testing the rainier-bmc machine with a real
firmware image, such as OpenBMC :

https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/

This is useful too but these are system level tests.

Thanks,

C.


> 
> ﻿On 1/26/23, 1:09 AM, "Cédric Le Goater" <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
> 
> Hello Ninad,
> 
> 
> On 1/25/23 17:53, Ninad S Palsule wrote:
>> Signed-off-by: Peter Delevoryas peter@pjd.dev <mailto:peter@pjd.dev> <mailto:peter@pjd.dev <mailto:peter@pjd.dev>>
>>
>> Reviewed-by: Joel Stanley joel@jms.id.au <mailto:joel@jms.id.au> <mailto:joel@jms.id.au <mailto:joel@jms.id.au>>
>>
>> Tested-by: Ninad Palsule ninadpalsule@us.ibm.com <mailto:ninadpalsule@us.ibm.com> <mailto:ninadpalsule@us.ibm.com <mailto:ninadpalsule@us.ibm.com>>
>>
>> Hi Peter,
>>
>> I applied your patches and made sure that different EEPROM images can be loaded from
>>
>> appropriate image files and it is working as expected.
> 
> 
> May be you could contribute an eeprom qtest ? I would put the data under
> tests/data/eeprom.
> 
> 
> Thanks,
> 
> 
> C.
> 
> 
> 
> 
>>
>> # Used following command to invoke the qemu.
>>
>> qemu-system-arm -M rainier-bmc -nographic \
>>
>> -kernel fitImage-linux.bin \
>>
>> -dtb aspeed-bmc-ibm-rainier.dtb \
>>
>> -initrd obmc-phosphor-initramfs.rootfs.cpio.xz \
>>
>> -drive file=obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>>
>> -append "rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a" \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.0,address=0x51,drive=a,rom-size=32768 -drive file=tpm.eeprom.bin,format=raw,if=none,id=a \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.7,address=0x50,drive=b,rom-size=65536 -drive file=oppanel.eeprom.bin,format=raw,if=none,id=b \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.7,address=0x51,drive=c,rom-size=65536 -drive file=lcd.eeprom.bin,format=raw,if=none,id=c \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.8,address=0x50,drive=d,rom-size=65536 -drive file=baseboard.eeprom.bin,format=raw,if=none,id=d \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.8,address=0x51,drive=e,rom-size=65536 -drive file=bmc.eeprom.bin,format=raw,if=none,id=e \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.9,address=0x50,drive=f,rom-size=131072 -drive file=vrm.eeprom.bin,format=raw,if=none,id=f \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.10,address=0x50,drive=g,rom-size=131072 -drive file=vrm.eeprom.bin,format=raw,if=none,id=g \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.13,address=0x50,drive=h,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=h \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.14,address=0x50,drive=i,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=i \
>>
>> -device at24c-eeprom,bus=aspeed.i2c.bus.15,address=0x50,drive=j,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=j
>>
> 
> 
> 
> 
> 


