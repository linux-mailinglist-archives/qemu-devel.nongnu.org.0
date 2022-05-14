Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B0526F97
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 09:34:40 +0200 (CEST)
Received: from localhost ([::1]:39164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npmIQ-0002sr-C1
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 03:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npmEW-0001bW-7B
 for qemu-devel@nongnu.org; Sat, 14 May 2022 03:30:36 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:38313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npmET-0005y9-H3
 for qemu-devel@nongnu.org; Sat, 14 May 2022 03:30:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7F1EC2348E;
 Sat, 14 May 2022 07:30:29 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Sat, 14 May
 2022 09:30:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00520789420-35f2-4651-93e0-02bfd5341618,
 E18F6C3BC2EC4AF86CA0BD7024908CDDB092B269) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bcc23f78-e81c-f4b7-3dae-17c216eb9afd@kaod.org>
Date: Sat, 14 May 2022 09:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: Iris Chen <irischenlj@fb.com>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 qemu-arm <qemu-arm@nongnu.org>, Cameron Esfahani via <qemu-devel@nongnu.org>, 
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>, OpenBMC List
 <openbmc@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57e97edc-71ff-4a63-bf08-061c88653e66
X-Ovh-Tracer-Id: 6527123237723933618
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrhedtgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
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

On 5/13/22 23:08, Peter Delevoryas wrote:
> 
> 
>> On May 12, 2022, at 10:31 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/13/22 06:02, Peter Delevoryas wrote:
>>> Usually, QEMU users just provide one serial device on the command line,
>>> either through "-nographic" or "-serial stdio -display none", or just using
>>> VNC and popping up a window. We try to match what the user expects, which is
>>> to connect the first (and usually only) serial device to the UART a board is
>>> using as serial0.
>>> Most Aspeed machines in hw/arm/aspeed.c use UART5 for serial0 in their
>>> device tree, so we connect UART5 to the first serial device. Some machines
>>> use UART1 though, or UART3, so the uart_default property lets us specify
>>> that in a board definition.
>>> In order to specify a nonstandard serial0 UART, a user basically *must* add
>>> a new board definition in hw/arm/aspeed.c. There's no way to do this without
>>> recompiling QEMU, besides constructing the machine completely from scratch
>>> on the command line.
>>> To provide more flexibility, we can also support the user specifying more
>>> serial devices, and connect them to the UART memory regions if possible.
>>> Even if a user doesn't specify any extra serial devices, it's useful to
>>> initialize these memory regions as UART's, so that they respond to the guest
>>> OS more naturally. At the moment, they will just always return zero's for
>>> everything, and some UART registers have a default non-zero state.
>>> With this change, if a new OpenBMC image uses UART3 or some other
>>> nonstandard UART for serial0, you can still use it with the EVB without
>>> recompiling QEMU, even though uart-default=UART5 for the EVB.
>>> For example, Facebook's Wedge100 BMC uses UART3: you can fetch an image from
>>> Github[1] and get the serial console output even while running the palmetto
>>> machine type, because we explicitly specify that we want UART3 to be
>>> connected to stdio.
>>> qemu-system-arm -machine palmetto-bmc \
>>> -drive file=wedge100.mtd,format=raw,if=mtd \
>>> -serial null -serial null -serial null -serial stdio -display none
>>> Similarly, you can boot a Fuji BMC image[2], which uses UART1, using the
>>> AST2600 EVB machine:
>>> qemu-system-arm -machine ast2600-evb \
>>> -drive file=fuji.mtd,format=raw,if=mtd \
>>> -serial null -serial stdio -display none
>>> This is kind of complicated, of course: it might be more natural to get rid
>>> of the uart_default attribute completely, and initialize UART's
>>> sequentially. But, keeping backward compatibility and the way most users
>>> know how to use QEMU in mind, this seems to make the most sense.
>>> [1] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
>>> [2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>> ---
>>> hw/arm/aspeed_ast10x0.c | 14 +++++++++++---
>>> hw/arm/aspeed_ast2600.c | 10 +++++++++-
>>> hw/arm/aspeed_soc.c | 10 +++++++++-
>>> 3 files changed, 29 insertions(+), 5 deletions(-)
>>> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
>>> index f65dc139da..5e6f3a8fed 100644
>>> --- a/hw/arm/aspeed_ast10x0.c
>>> +++ b/hw/arm/aspeed_ast10x0.c
>>> @@ -215,10 +215,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>>> qdev_get_gpio_in(DEVICE(&s->armv7m),
>>> sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
>>> - /* UART5 - attach an 8250 to the IO space as our UART */
>>> - serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>>> - aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>>> + /* UART - attach 8250's to the IO space for each UART */
>>> + serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
>>> + aspeed_soc_get_irq(s, s->uart_default),
>>
>> That's a fix for aspeed_ast10x0 that should come first.
> 
> Good point, I’ll separate this into another patch in the series instead
> of doing it right here.
> 
>>
>>> 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>>> + for (int i = 1, uart = ASPEED_DEV_UART1; i < 13; i++, uart++) {
>>
>> '13' should be a AspeecSoCClass attribute. The number of uarts varies
>> depending on the SoC model and we might want to model that one day.
> 
> True, I’ll add a patch to the series that includes that.
> 
>>
>>> + if (uart == s->uart_default) {
>>> + uart++;
>>> + }
>>
>> Shouldn't we test serial_hd(i) validity ?
> 
> I was actually intentionally skipping that. If serial_hd(i)
> doesn’t exist, the function will return NULL.
> 
> Chardev *serial_hd(int i)
> {
>      assert(i >= 0);
>      if (i < num_serial_hds) {
>          return serial_hds[i];
>      }
>      return NULL;
> }
> 
> So then, the serial device’s CharBackend’s “Chardev *chr”
> will be initialized as NULL. Looking at all of the
> usage of this attribute in “hw/char/serial.c”, I think
> that’s ok, the read/write functions will just be no-ops.
> They all have guards for “chr == NULL”. Take this one
> as an example:
> 
> int qemu_chr_fe_write(CharBackend *be, const uint8_t *buf, int len)
> {
>      Chardev *s = be->chr;
> 
>      if (!s) {
>          return 0;
>      }
> 
>      return qemu_chr_write(s, buf, len, false);
> }
> 
> On the other hand, most of the rest of the serial device
> code will run, include setting and clearing the line
> status register and stuff like that. In some FB code[1] using
> UART’s, processes will actually go to 100% CPU usage in QEMU
> polling the line status register if it doesn’t have the
> transmitter-empty bit set, mostly because the author didn’t write
> fault-tolerant code, but also because it doesn’t align with how
> the hardware behaves by default (I think). So, that was my
> motivation for initializing serial devices, but not always
> connecting a chardev backend. But I’m open to other
> interpretations of how things should be setup too.
> 
> If you’d like me to only initialize a UART if a chardev backend
> is provided for it, then to satisfy my use case, I would
> just always make sure our test infrastructure runs QEMU
> with all serial devices connected to chardevs. So, either way,
> this change is still useful, and will satisfy my requirements.

The problem is that it is breaking compatibility with previous QEMUs.
We can not change the command line to :

     qemu-system-arm -machine palmetto-bmc \
         -drive file=wedge100.mtd,format=raw,if=mtd \
         -serial null -serial null -serial null -serial stdio -display none

What about adding a machine "uart" option ? like we did for the fmc/spi
models

Thanks,

C.

