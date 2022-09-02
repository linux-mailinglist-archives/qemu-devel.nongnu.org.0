Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC15AB5AC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 17:50:32 +0200 (CEST)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU8wA-000373-L3
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 11:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oU8uA-0001dp-AJ; Fri, 02 Sep 2022 11:48:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oU8u7-0007FT-Ij; Fri, 02 Sep 2022 11:48:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 25E4F746324;
 Fri,  2 Sep 2022 17:48:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF465746307; Fri,  2 Sep 2022 17:48:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CDDFC7461AE;
 Fri,  2 Sep 2022 17:48:17 +0200 (CEST)
Date: Fri, 2 Sep 2022 17:48:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/20] ppc4xx_sdram: Get rid of the init RAM hack
In-Reply-To: <c5df589a-2784-f11e-6981-14caa53adccc@kaod.org>
Message-ID: <a5dbc8da-f859-726c-28a2-28119bbcf0d1@eik.bme.hu>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <a6996dfd677fe3557032efdab65ae8fbf9654391.1660926381.git.balaton@eik.bme.hu>
 <c5df589a-2784-f11e-6981-14caa53adccc@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1162984363-1662133697=:59779"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1162984363-1662133697=:59779
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 2 Sep 2022, Cédric Le Goater wrote:
> On 8/19/22 18:55, BALATON Zoltan wrote:
>> The do_init parameter of ppc4xx_sdram_init() is used to map memory
>> regions that is normally done by the firmware by programming the SDRAM
>> controller. This is needed when booting a kernel directly from -kernel
>> without a firmware. Do this from board code accesing normal SDRAM
>> controller registers the same way as firmware would do, so we can get
>> rid of this hack.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> This patch is breaking Linux and U-boot boot on the 405 machine.

OK got this one we ought to enable memory controller *before* writing 
bootingo into memory. I'm looking at the other one then will send a v2 
unless you say to wait a bit more as you might have more comments I could 
address in v2.

Regards,
BALATON Zoltan

> C.
>
> 
>> ---
>>   hw/ppc/ppc405.h         |  1 -
>>   hw/ppc/ppc405_boards.c  |  9 +++++++--
>>   hw/ppc/ppc405_uc.c      |  4 +---
>>   hw/ppc/ppc440_bamboo.c  |  8 +++++++-
>>   hw/ppc/ppc440_uc.c      |  2 --
>>   hw/ppc/ppc4xx_devs.c    | 11 +----------
>>   include/hw/ppc/ppc4xx.h |  8 ++++++--
>>   7 files changed, 22 insertions(+), 21 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 1e558c7831..756865621b 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -169,7 +169,6 @@ struct Ppc405SoCState {
>>       /* Public */
>>       MemoryRegion ram_banks[2];
>>       hwaddr ram_bases[2], ram_sizes[2];
>> -    bool do_dram_init;
>>         MemoryRegion *dram_mr;
>>       hwaddr ram_size;
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 083f12b23e..0a29ad97c7 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -263,6 +263,13 @@ static void boot_from_kernel(MachineState *machine, 
>> PowerPCCPU *cpu)
>>           boot_info.cmdline_size = bdloc + len;
>>       }
>>   +    /* Enable SDRAM memory regions */
>> +    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>> +        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
>> +        error_report("Could not enable memory regions");
>> +        exit(1);
>> +    }
>> +
>>       /* Install our custom reset handler to start from Linux */
>>       qemu_register_reset(main_cpu_reset, cpu);
>>       env->load_info = &boot_info;
>> @@ -288,8 +295,6 @@ static void ppc405_init(MachineState *machine)
>>                                machine->ram_size, &error_fatal);
>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>                                OBJECT(machine->ram), &error_abort);
>> -    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>> -                             kernel_filename != NULL, &error_abort);
>>       object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>>                                &error_abort);
>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 6296130936..2833d0d538 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1078,8 +1078,7 @@ static void ppc405_soc_realize(DeviceState *dev, 
>> Error **errp)
>>                                s->ram_bases[0], s->ram_sizes[0]);
>>         ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
>> -                      s->ram_banks, s->ram_bases, s->ram_sizes,
>> -                      s->do_dram_init);
>> +                      s->ram_banks, s->ram_bases, s->ram_sizes);
>>         /* External bus controller */
>>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
>> @@ -1157,7 +1156,6 @@ static void ppc405_soc_realize(DeviceState *dev, 
>> Error **errp)
>>   static Property ppc405_soc_properties[] = {
>>       DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>>                        MemoryRegion *),
>> -    DEFINE_PROP_BOOL("dram-init", Ppc405SoCState, do_dram_init, 0),
>>       DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
>> index 5ec82fa8c2..e3412c4fcd 100644
>> --- a/hw/ppc/ppc440_bamboo.c
>> +++ b/hw/ppc/ppc440_bamboo.c
>> @@ -211,7 +211,13 @@ static void bamboo_init(MachineState *machine)
>>       ppc4xx_sdram_init(env,
>>                         qdev_get_gpio_in(uicdev, 14),
>>                         PPC440EP_SDRAM_NR_BANKS, ram_memories,
>> -                      ram_bases, ram_sizes, 1);
>> +                      ram_bases, ram_sizes);
>> +    /* Enable SDRAM memory regions, this should be done by the firmware */
>> +    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>> +        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
>> +        error_report("couldn't enable memory regions");
>> +        exit(1);
>> +    }
>>         /* PCI */
>>       dev = sysbus_create_varargs(TYPE_PPC4xx_PCI_HOST_BRIDGE,
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index db33334e29..6ab0ad7985 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -489,8 +489,6 @@ typedef struct ppc440_sdram_t {
>>   } ppc440_sdram_t;
>>     enum {
>> -    SDRAM0_CFGADDR = 0x10,
>> -    SDRAM0_CFGDATA,
>>       SDRAM_R0BAS = 0x40,
>>       SDRAM_R1BAS,
>>       SDRAM_R2BAS,
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 1226ec4aa9..936d6f77fe 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -56,11 +56,6 @@ struct ppc4xx_sdram_t {
>>       qemu_irq irq;
>>   };
>>   -enum {
>> -    SDRAM0_CFGADDR = 0x010,
>> -    SDRAM0_CFGDATA = 0x011,
>> -};
>> -
>>   /*
>>    * XXX: TOFIX: some patches have made this code become inconsistent:
>>    *      there are type inconsistencies, mixing hwaddr, target_ulong
>> @@ -350,8 +345,7 @@ static void sdram_reset(void *opaque)
>>   void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
>>                          MemoryRegion *ram_memories,
>>                          hwaddr *ram_bases,
>> -                       hwaddr *ram_sizes,
>> -                       int do_init)
>> +                       hwaddr *ram_sizes)
>>   {
>>       ppc4xx_sdram_t *sdram;
>>       int i;
>> @@ -369,9 +363,6 @@ void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, 
>> int nbanks,
>>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>>       ppc_dcr_register(env, SDRAM0_CFGDATA,
>>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
>> -    if (do_init) {
>> -        sdram_map_bcr(sdram);
>> -    }
>>   }
>>     /*
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index 2af0d60577..a5e6c185af 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -37,6 +37,11 @@ typedef struct {
>>       uint32_t bcr;
>>   } Ppc4xxSdramBank;
>>   +enum {
>> +    SDRAM0_CFGADDR = 0x010,
>> +    SDRAM0_CFGDATA = 0x011,
>> +};
>> +
>>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>                           MemoryRegion ram_memories[],
>>                           hwaddr ram_bases[], hwaddr ram_sizes[],
>> @@ -45,8 +50,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>   void ppc4xx_sdram_init (CPUPPCState *env, qemu_irq irq, int nbanks,
>>                           MemoryRegion ram_memories[],
>>                           hwaddr *ram_bases,
>> -                        hwaddr *ram_sizes,
>> -                        int do_init);
>> +                        hwaddr *ram_sizes);
>>     #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>> 
>
>
>
--3866299591-1162984363-1662133697=:59779--

