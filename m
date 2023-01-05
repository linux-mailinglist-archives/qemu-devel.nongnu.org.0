Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7C165F2E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTjo-0001gC-G6; Thu, 05 Jan 2023 12:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTjf-0001co-90
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:09:01 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTjc-00072v-Gh
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:08:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0148B1512E47E;
 Thu,  5 Jan 2023 18:08:52 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 18:08:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005d6536e9f-f428-473d-be39-9d4df627c58b,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0ad1b1d3-d67e-416c-bfc7-65909eb9a559@kaod.org>
Date: Thu, 5 Jan 2023 18:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net: Fix read of uninitialized memory in imx_fec.
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Stephen Longfield <slongfield@google.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <venture@google.com>, <wuhaotsh@google.com>
References: <20221221183202.3788132-1-slongfield@google.com>
 <CAFEAcA-zv_ny28MJGf4s9T1+3PwK8WRurVgiQnA+8UWbkRawkQ@mail.gmail.com>
 <88f5cc21-69bb-18a3-718d-90d2c43e787f@kaod.org>
 <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_ez-_WHW25HCW36Vewa0rKDvUjvGCHCkX_Z0M2igW9tw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: aaaa4fab-650e-415b-8232-23aebdbd41e9
X-Ovh-Tracer-Id: 298363477798062886
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdfffeevuddthfdthfelvefhgfevffefuddvvdetteekgeffjedtjeevffffvddunecuffhomhgrihhnpehtrghrghgvthdqrghrmhdrnhgvgihtpdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhslhhonhhgfhhivghlugesghhoohhglhgvrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhvvghnthhurhgvsehgohhoghhlvgdrtghomhdpfihuhhgrohhtshhhsehgohhoghhlvgdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpe
 hsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/23 17:50, Peter Maydell wrote:
> On Thu, 5 Jan 2023 at 16:46, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 1/5/23 16:33, Peter Maydell wrote:
>>> On Wed, 21 Dec 2022 at 18:32, Stephen Longfield <slongfield@google.com> wrote:
>>>>
>>>> Size is used at lines 1088/1188 for the loop, which reads the last 4
>>>> bytes from the crc_ptr so it does need to get increased, however it
>>>> shouldn't be increased before the buffer is passed to CRC computation,
>>>> or the crc32 function will access uninitialized memory.
>>>>
>>>> This was pointed out to me by clg@kaod.org during the code review of
>>>> a similar patch to hw/net/ftgmac100.c
>>>>
>>>> Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
>>>> Signed-off-by: Stephen Longfield <slongfield@google.com>
>>>> Reviewed-by: Patrick Venture <venture@google.com>
>>>
>>> Applied to target-arm.next, thanks.
>>
>> Did you take the ftgmac100 also ?
> 
> No, I missed that one (patches arriving over a holiday
> period are more likely to get lost). ftgmac100 is aspeed,
> can you remind me, are you handling those patches at the moment
> or would you rather I took it through target-arm.next ?

The flow is low. I can handle them.


Here is what I have gathered of interest for the 8.0 cycle [*] :

ba1f0f30e6 tests/avocado/machine_aspeed.py: Update SDK images
394467a569 tests/avocado/machine_aspeed.py: Add shutdown to the SDK tests
f2941822a5 tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board
beb01f33da hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
126f0870ff hw/arm/aspeed_ast10x0: Map HACE peripheral
4251463a5d hw/arm/aspeed_ast10x0: Map the secure SRAM
d8ab4e2235 hw/arm/aspeed_ast10x0: Map I3C peripheral
47ae570bcc hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
b361c08ed3 hw/misc/aspeed_hace: Do not crash if address_space_map() failed
68e35c6359 hw/arm/aspeed: Use the IEC binary prefix definitions
83008870c8 hw/watchdog/wdt_aspeed: Log unimplemented registers as UNIMP level
7bc127b231 hw/watchdog/wdt_aspeed: Extend MMIO range to cover more registers
6b2a6a8b67 hw/watchdog/wdt_aspeed: Rename MMIO region size as 'iosize'
186cd4db58 tests/avocado/machine_aspeed.py: Mask systemd services to speed up SDK boot
7e37fc7efa tests/avocado/machine_aspeed.py: update buildroot tests
0411291f96 m25p80: Add the is25wp256 SFPD table
5c6cd67647 avocado/boot_linux_console.py: Update ast2600 test
8d965c9276 hw/net: Fix read of uninitialized memory in imx_fec.
e4e4a89ea3 hw/net: Fix read of uninitialized memory in ftgmac100
6b0eef46c7 aspeed: Add Supermicro X11 SPI machine type
5386d8eec8 target/arm: Allow users to set the number of VFP registers
c83bd61b34 m25p80: Improve error when the backend file size does not match the device

Not all are ready or reviewed yet.

I also hope to get some cycles of Philippe to merge eMMC support in 8.0.

C.

[*] https://github.com/legoater/qemu/commits/aspeed-8.0



