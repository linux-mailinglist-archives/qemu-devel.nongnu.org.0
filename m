Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070E5587E19
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:27:03 +0200 (CEST)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsrN-0007H4-Mn
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oIspu-0005eE-TC; Tue, 02 Aug 2022 10:25:30 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oIspr-0001GK-PI; Tue, 02 Aug 2022 10:25:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1691611C3A612;
 Tue,  2 Aug 2022 16:25:15 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 2 Aug 2022
 16:25:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a67fcf03-59ba-4f24-bc5c-1d845736a101,
 2E83F348A6A75C54EB16E73D725C8CB72A31113C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2f7f05aa-6aa2-970e-b4ab-bfbed80b381b@kaod.org>
Date: Tue, 2 Aug 2022 16:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: Iris Chen <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>,
 <dz4list@gmail.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuQZP4xkkU2R9VmO@pdel-mbp.dhcp.thefacebook.com>
 <6d4a3912-a386-a784-8db4-7743bb1f1063@kaod.org>
 <YuWrbJglNYdGOmUh@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YuWrbJglNYdGOmUh@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ba2d6968-dc0d-49a0-b3d5-50dcd87c9e45
X-Ovh-Tracer-Id: 3732076719603026759
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/31/22 00:06, Peter Delevoryas wrote:
> On Sat, Jul 30, 2022 at 11:18:33PM +0200, Cédric Le Goater wrote:
>> On 7/29/22 19:30, Peter Delevoryas wrote:
>>> On Fri, Jul 29, 2022 at 03:25:55PM +0200, Cédric Le Goater wrote:
>>>> Hello Iris,
>>>>
>>>> On 7/29/22 01:23, Iris Chen wrote:
>>>>> Hey everyone,
>>>>>
>>>>> I have been working on a project to add support for SPI-based TPMs in QEMU.
>>>>> Currently, most of our vboot platforms using a SPI-based TPM use the Linux
>>>>> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed
>>>>> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation
>>>>> deficiency that prevents bi-directional operations.
>>>> aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
>>>> HW interface. Your model proposal adds support for a new SPI controller
>>>> using bitbang GPIOs. These are really two differents models. I don't see
>>>> how you could reuse aspeed_smc for this purpose.
>>>>
>>>> or you mean that Linux is using the SPI-GPIO driver because the Linux
>>>> Aspeed SMC driver doesn't match the need ? It is true that the Linux
>>>> driver is not generic, it deals with flash devices only. But that's
>>>> another problem.
>>>>
>>>>> Thus, in order to connect
>>>>> a TPM to this bus, my patch implements a QEMU SPI-GPIO driver (as the QEMU
>>>>> counterpart of the Linux SPI-GPIO driver).
>>>>>
>>>>> As we use SPI-based TPMs on many of our BMCs for the secure-boot implementation,
>>>>> I have already tested this implementation locally with our Yosemite-v3.5 platform
>>>>> and Facebook-OpenBMC. This model was tested by connecting a generic SPI-NOR (m25p80
>>>>> for example) to the Yosemite-v3.5 SPI bus containing the TPM.
>>>>>
>>>>> This patch is an RFC because I have several questions about design. Although the
>>>>> model is working, I understand there are many areas where the design decision
>>>>> is not deal (ie. abstracting hard coded GPIO values). Below are some details of the
>>>>> patch and specific areas where I would appreciate feedback on how to make this better:
>>>>> hw/arm/aspeed.c:
>>>>> I am not sure where the best place is to instantiate the spi_gpio besides the
>>>>> aspeed_machine_init.
>>>>
>>>> The SPI GPIO device would be a platform device and not a SoC device.
>>>> Hence, it should be instantiated at the machine level, like the I2C
>>>> device are, using properties to let the model know about the GPIOs
>>>> that should be driven to implement the SPI protocol.
>>>
>>> Agreed, should be like an I2C device.
>>>
>>>>
>>>> Ideally, the state of the GPIO controller pins and the SPI GPIO state
>>>> should be shared. I think that's what you are trying to do that with
>>>> attribute 'controller_state' in your patch ? But, the way it is done
>>>> today, is too tightly coupled (names) with the Aspeed GPIO model to
>>>> be generic.
>>>>
>>>> I think we need an intermediate QOM interface, or a base class, to
>>>> implement an abstract SPI GPIO model and an Aspeed SPI GPIO model
>>>> on top which would be linked to the Aspeed GPIO model of the SoC
>>>> in use.
>>>
>>> Disagree, I feel like we can accomplish this without inheritance.
>>>
>>>>
>>>> Or we could introduce some kind of generic GPIO controller that
>>>> we would link the SPI GPIO model with (using a property). The
>>>> Aspeed GPIO model would be of that kind and the SPI GPIO model
>>>> would be able to drive the pins using a common interface.
>>>> That's another way to do it.
>>>
>>> Agree, I would like to go in this direction if at all possible.
>> Let's give it a try then. I would introduce a new QOM interface,
>> something like  :
>>
>>      #define TYPE_GPIO_INTERFACE "gpio-interface"
>>      #define GPIO_INTERFACE(obj)                                     \
>>          INTERFACE_CHECK(GpioInterface, (obj), TYPE_GPIO_INTERFACE)
>>      typedef struct GpioInterfaceClass GpioInterfaceClass;
>>      DECLARE_CLASS_CHECKERS(GpioInterfaceClass, GPIO_INTERFACE,
>>                             TYPE_GPIO_INTERFACE)
>>      struct GpioInterfaceClass {
>>          InterfaceClass parent;
>>          int (*get)(GpioInterface *gi, ...);
>>          int (*set)(GpioInterface *gi, ...);
>>          ...
>>      };
>>
>> and implement the interface handlers under the AspeedGPIO model.
>> The SPI GPIO model would have a link to such an interface to drive
>> the GPIO pins.
>>
>> See IPMI and XIVE for some more complete models.
> 
> This sounds good, but I just want to clarify first:
> 
> Is it necessary to introduce a GPIO interface?

Well, my feeling is that we need an abstract layer to interface the
SPI GPIO model with any model of GPIO controller.
  
> Or, could we connect the IRQ's just using the existing
> QOM/sysbus/object/IRQ infrastructure?

and we would use the QOM canonical path to identify the GPIO pins
and QOM routines to get and set the values ? It looks feasible.
That's how I would do it in a script but not in model.
  
> I'll investigate if we can connect the IRQ's without introducing a new
> interface. We can continue with this design for now though.

OK. Let's see.

>>>>> Could we add the ability to instantiate it on the command line?
>>>>
>>>> It might be complex to identify the QOM object to use as the GPIO
>>>> controller from the command line since it is on the SoC and not
>>>> a platform device. In that case, an Aspeed SPI GPIO model would
>>>> be a better approach. we  would have to peek in the machine/soc to
>>>> get a link on the Aspeed GPIO model in the realize routine of the
>>>> Aspeed SPI GPIO model.
>>>
>>> Hrrrm perhaps, I feel like it shouldn't be that hard though.
>>>
>>> - Get a pointer to the QOM object that holds the GPIO's using object
>>>     path or ID. Something similar to '-device ftgmac100,netdev=<id>'
>>>     right?
>>
>> yes. something like that.
> 
> +1
> 
>>
>>> - Get the GPIO's by name from the QOM object.
>>
>> yes.
> 
> +1
> 
>>
>>> In this situation, I think we should be able to get the GPIO controller
>>> object, and then get the IRQ's by the "sysbus-irq[126]"/etc name.
>>>
>>> We could refactor the aspeed_gpio.c model to name the IRQ's like the
>>> properties,.  to use "gpioX4" instead of "sysbus-irq[*]".
>>
>> we could use qdev_init_gpio_out_named() instead of sysbus_init_irq()
>> to name them.
>>
> 
> +1, I actually suggested to Iris offline that this change might be
> useful regardless.

yes. This change can come as a preliminary.

> 
>>
>>>>> m25p80_transfer8_ex in hw/block/m25p80.c:
>>>>> Existing SPI model assumed that the output byte is fully formed, can be passed to
>>>>> the SPI device, and the input byte can be returned, all in one operation. With
>>>>> SPI-GPIO we don't have the input byte until all 8 bits of the output have been
>>>>> shifted out, so we have to prime the MISO with bogus values (0xFF).
>>>>
>>>> That's fine I think. We do something similar for dummies.
>>>>
>>>>> MOSI pin in spi_gpio: the mosi pin is not included and we poll the realtime value
>>>>> of the gpio for input bits to prevent bugs with caching the mosi value. It was discovered
>>>>> during testing that when using the mosi pin as the input pin, the mosi value was not
>>>>> being updated due to a kernel and aspeed_gpio model optimization.
>>>>
>>>> ah. We need help from Andrew ! the model should have a mosi pin .
>>>
>>> Not sure if this was clear, but Iris is just saying that she used object
>>> properties to read and write the mosi, miso, and clk pins, rather than
>>> the IRQ's.
>>
>> The IRQ line is not raised ?
> 
> Something like that, yes. She was having trouble following the IRQ level
> purely through edge changes. Perhaps this is due to a bug in
> aspeed_gpio.c.

That could be it. The HW logic is quite complex. Adding more tests as
suggested by Andrew would help.


Thanks,

C.

  

> 
>>
>>> Certainly we'd like to use IRQ's instead, but she ran into correctness
>>> problems. Maybe we can investigate that further and fix it.
>>
>> So much is happening in that mode. We need more trace events in the Aspeed
>> GPIO model at least an extra in aspeed_gpio_update()
> 
> +1
> 
>>
>> Thanks,
>>
>> C.
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> C.
>>>>
>>>>> Thus, here we are
>>>>> reading the value directly from the gpio controller instead of waiting for the push.
>>>>>
>>>>> I realize there are Aspeed specifics in the spi_gpio model. To make this extensible,
>>>>> is it preferred to make this into a base class and have our Aspeed SPI GPIO extend
>>>>> this or we could set up params to pass in the constructor?
>>>>>
>>>>> Thanks for your review and any direction here would be helpful :)
>>>>>
>>>>> Iris Chen (3):
>>>>>      hw: m25p80: add prereading ability in transfer8
>>>>>      hw: spi_gpio: add spi gpio model
>>>>>      hw: aspeed: hook up the spi gpio model
>>>>>
>>>>>     hw/arm/Kconfig            |   1 +
>>>>>     hw/arm/aspeed.c           |   5 ++
>>>>>     hw/block/m25p80.c         |  29 ++++++-
>>>>>     hw/ssi/Kconfig            |   4 +
>>>>>     hw/ssi/meson.build        |   1 +
>>>>>     hw/ssi/spi_gpio.c         | 166 ++++++++++++++++++++++++++++++++++++++
>>>>>     hw/ssi/ssi.c              |   4 -
>>>>>     include/hw/ssi/spi_gpio.h |  38 +++++++++
>>>>>     include/hw/ssi/ssi.h      |   5 ++
>>>>>     9 files changed, 248 insertions(+), 5 deletions(-)
>>>>>     create mode 100644 hw/ssi/spi_gpio.c
>>>>>     create mode 100644 include/hw/ssi/spi_gpio.h
>>>>>
>>>>
>>


