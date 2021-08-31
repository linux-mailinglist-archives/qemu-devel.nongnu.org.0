Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843403FC5C0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 12:41:27 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1Cn-0000BS-Sa
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL1BU-0007bX-Vw; Tue, 31 Aug 2021 06:40:05 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:34565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mL1BS-0003JQ-6P; Tue, 31 Aug 2021 06:40:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 300FF13B127;
 Tue, 31 Aug 2021 10:39:57 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 31 Aug
 2021 12:39:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0025c238559-eb94-444d-843b-b939751d30ed,
 3D02C4E7E229260F021FFF691A6C377EE278DEFF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
To: Peter Delevoryas <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
Date: Tue, 31 Aug 2021 12:39:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 942e986e-d1e2-4c3d-88a2-5109db00e18a
X-Ovh-Tracer-Id: 503558733826526115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgfeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefhtdegueeffffghffhhefgleejjedvveetvdfggfefjedvueffvedttdduueffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/21 5:58 PM, Peter Delevoryas wrote:
> I think I’m a little confused on this part. What I meant by “most machines just use UART5” was that most DTS’s use “stdout-path=&uart5”, but fuji uses “stdout-path=&uart1”. I /do/ see that SCU510 includes a bit related to UART, but it’s for disabling booting from UART1 and UART5. I just care about the console aspect, not booting.

The UART can be switched with SCU70[29] on the AST2500, btw.

>
> 
> This is the commit that changed the serial console from UART5 to UART1 in fuji’s DTS: https://github.com/facebook/openbmc-uboot/commit/afeddd6e27b5f094bbc4805dc8c1c22b3b7fb203 <https://github.com/facebook/openbmc-uboot/commit/afeddd6e27b5f094bbc4805dc8c1c22b3b7fb203>

That's an AST2620-A1. May be we should also introduce a new SoC then. I will try
to get the datasheet.
  
> I don’t know what the platform.S AST_SCU_MFP_CTRL7 changes do (maybe setting some GPIO for UART1?),

Yes. The patch above enables the UART1 RX function. 

Is TX always enabled ? Something to check on real HW.

>  but as far as I understand, I don’t think using UART1 should require any extra registers from the datasheet.
>  
> 
> An alternate design I considered was UART5=serial_hd(0) and UART1=serial_hd(1), maybe that would be more appropriate? I don’t think anybody uses both UART’s simultaneously though, so I didn’t pursue that design.

An other simple idea would be activate both UART5 and UART1 on the AST2600 
SoC if this is how the HW works. Or add a bool "enable-uart1" at the SoC 
level and set it from the machine. 

In any case, we will need a serial backend for both.


Thanks,

C.

>  
> 
> Some link references:
> 
> Elbert DTS uses “stdout-path=&uart5” https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-elbert.dts#L17
> 
> Fuji DTS uses “stdout-path=&uart1” https://github.com/facebook/openbmc-uboot/blob/openbmc/helium/v2019.04/arch/arm/dts/aspeed-bmc-facebook-fuji.dts#L17
> 
>  
> 
> *From: *Cédric Le Goater <clg@kaod.org>
> *Date: *Saturday, August 28, 2021 at 1:26 AM
> *To: *Peter Delevoryas <pdel@fb.com>
> *Cc: *joel@jms.id.au <joel@jms.id.au>, qemu-devel@nongnu.org <qemu-devel@nongnu.org>, qemu-arm@nongnu.org <qemu-arm@nongnu.org>
> *Subject: *Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
> 
> On 8/27/21 11:04 PM, pdel@fb.com wrote:
>> From: Peter Delevoryas <pdel@fb.com>
>>
>> This change replaces the UART serial device initialization code with machine
>> configuration data, making it so that we have a single code path for console
>> UART initialization, but allowing different machines to use different
>> UART's. This is relevant because the Aspeed chips have 2 debug UART's, UART5
>> and UART1, and while most machines just use UART5, some use UART1.
> 
> I think this is controlled by SCU510. If so, we should have a different HW
> strapping for the new machine and check the configuration at the SoC level,
> in aspeed_ast2600.c, to change the serial initialization.
> 
> 
> Thanks,
> 
> C.
>  
>>
>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>> ---
>>  hw/arm/aspeed.c         | 7 +++++++
>>  hw/arm/aspeed_ast2600.c | 5 -----
>>  hw/arm/aspeed_soc.c     | 5 -----
>>  include/hw/arm/aspeed.h | 1 +
>>  4 files changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 9d43e26c51..ff53d12395 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -14,6 +14,7 @@
>>  #include "hw/arm/boot.h"
>>  #include "hw/arm/aspeed.h"
>>  #include "hw/arm/aspeed_soc.h"
>> +#include "hw/char/serial.h"
>>  #include "hw/i2c/i2c_mux_pca954x.h"
>>  #include "hw/i2c/smbus_eeprom.h"
>>  #include "hw/misc/pca9552.h"
>> @@ -21,6 +22,7 @@
>>  #include "hw/misc/led.h"
>>  #include "hw/qdev-properties.h"
>>  #include "sysemu/block-backend.h"
>> +#include "sysemu/sysemu.h"
>>  #include "hw/loader.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/units.h"
>> @@ -352,6 +354,10 @@ static void aspeed_machine_init(MachineState *machine)
>>      }
>>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>> 
>> +    serial_mm_init(get_system_memory(), sc->memmap[amc->serial_dev], 2,
>> +                   sc->get_irq(&bmc->soc, amc->serial_dev), 38400,
>> +                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> +
>>      memory_region_add_subregion(get_system_memory(),
>>                                  sc->memmap[ASPEED_DEV_SDRAM],
>>                                  &bmc->ram_container);
>> @@ -804,6 +810,7 @@ static void aspeed_machine_class_init(ObjectClass *oc, void *data)
>>      mc->no_parallel = 1;
>>      mc->default_ram_id = "ram";
>>      amc->macs_mask = ASPEED_MAC0_ON;
>> +    amc->serial_dev = ASPEED_DEV_UART5;
>> 
>>      aspeed_machine_class_props_init(oc);
>>  }
>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>> index 56e1adb343..a27b0de482 100644
>> --- a/hw/arm/aspeed_ast2600.c
>> +++ b/hw/arm/aspeed_ast2600.c
>> @@ -322,11 +322,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>>      }
>> 
>> -    /* UART - attach an 8250 to the IO space as our UART5 */
>> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
>> -                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> -
>>      /* I2C */
>>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>>                               &error_abort);
>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>> index c373182299..0c09d1e5b4 100644
>> --- a/hw/arm/aspeed_soc.c
>> +++ b/hw/arm/aspeed_soc.c
>> @@ -287,11 +287,6 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>          sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
>>      }
>> 
>> -    /* UART - attach an 8250 to the IO space as our UART5 */
>> -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
>> -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
>> -                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> -
>>      /* I2C */
>>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
>>                               &error_abort);
>> diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
>> index c9747b15fc..9f5b9f04d6 100644
>> --- a/include/hw/arm/aspeed.h
>> +++ b/include/hw/arm/aspeed.h
>> @@ -38,6 +38,7 @@ struct AspeedMachineClass {
>>      uint32_t num_cs;
>>      uint32_t macs_mask;
>>      void (*i2c_init)(AspeedMachineState *bmc);
>> +    uint32_t serial_dev;
>>  };
>> 
>> 
>>
> 


