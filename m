Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03D58837B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 23:26:34 +0200 (CEST)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIzPN-00050I-11
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 17:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oIzNl-00033f-0L; Tue, 02 Aug 2022 17:24:53 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oIzNi-0003Cf-2L; Tue, 02 Aug 2022 17:24:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DB9D4746396;
 Tue,  2 Aug 2022 23:24:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 91258746397; Tue,  2 Aug 2022 23:24:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8F574746381;
 Tue,  2 Aug 2022 23:24:42 +0200 (CEST)
Date: Tue, 2 Aug 2022 23:24:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH 05/19] ppc/ppc405: Start QOMification of the SoC
In-Reply-To: <e437d81d-37e6-2a31-21e9-0cf7a8be73fd@gmail.com>
Message-ID: <7abaf022-b2ef-ed5a-be3a-a04c915eb736@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-6-clg@kaod.org>
 <e437d81d-37e6-2a31-21e9-0cf7a8be73fd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-414620594-1659475482=:52653"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-414620594-1659475482=:52653
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 2 Aug 2022, Daniel Henrique Barboza wrote:
> On 8/1/22 10:10, Cédric Le Goater wrote:
>> This moves all the code previously done in the ppc405ep_init() routine
>> under ppc405_soc_realize().
>> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/ppc/ppc405.h        |  12 ++--
>>   hw/ppc/ppc405_boards.c |  12 ++--
>>   hw/ppc/ppc405_uc.c     | 151 ++++++++++++++++++++---------------------
>>   3 files changed, 84 insertions(+), 91 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index c8cddb71733a..5e4e96d86ceb 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -74,9 +74,14 @@ struct Ppc405SoCState {
>>       MemoryRegion sram;
>>       MemoryRegion ram_memories[2];
>>       hwaddr ram_bases[2], ram_sizes[2];
>> +    bool do_dram_init;
>>         MemoryRegion *dram_mr;
>>       hwaddr ram_size;
>> +
>> +    uint32_t sysclk;
>> +    PowerPCCPU *cpu;
>> +    DeviceState *uic;
>>   };
>>     /* PowerPC 405 core */
>> @@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, 
>> ram_addr_t ram_size);
>>   void ppc4xx_plb_init(CPUPPCState *env);
>>   void ppc405_ebc_init(CPUPPCState *env);
>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>> -                        MemoryRegion ram_memories[2],
>> -                        hwaddr ram_bases[2],
>> -                        hwaddr ram_sizes[2],
>> -                        uint32_t sysclk, DeviceState **uicdev,
>> -                        int do_init);
>> -
>>   #endif /* PPC405_H */
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 96db52c5a309..363cb0770506 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
>>       Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>       const char *kernel_filename = machine->kernel_filename;
>> -    PowerPCCPU *cpu;
>>       MemoryRegion *sysmem = get_system_memory();
>> -    DeviceState *uicdev;
>>         if (machine->ram_size != mc->default_ram_size) {
>>           char *sz = size_to_str(mc->default_ram_size);
>> @@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
>>                                machine->ram_size, &error_fatal);
>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>                                OBJECT(machine->ram), &error_abort);
>> +    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>> +                             !(kernel_filename == NULL), &error_abort);
>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>> +                             &error_abort);
>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>   -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, 
>> ppc405->soc.ram_bases,
>> -                        ppc405->soc.ram_sizes,
>> -                        33333333, &uicdev, kernel_filename == NULL ? 0 : 
>> 1);
>> -
>>       /* allocate and load BIOS */
>>       if (machine->firmware) {
>>           MemoryRegion *bios = g_new(MemoryRegion, 1);
>> @@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>         /* Load ELF kernel and rootfs.cpio */
>>       } else if (kernel_filename && !machine->firmware) {
>> -        boot_from_kernel(machine, cpu);
>> +        boot_from_kernel(machine, ppc405->soc.cpu);
>>       }
>>   }
>>   diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index 156e839b8283..59612504bf3f 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -1432,134 +1432,131 @@ static void ppc405ep_cpc_init (CPUPPCState *env, 
>> clk_setup_t clk_setup[8],
>>   #endif
>>   }
>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>> -                        MemoryRegion ram_memories[2],
>> -                        hwaddr ram_bases[2],
>> -                        hwaddr ram_sizes[2],
>> -                        uint32_t sysclk, DeviceState **uicdevp,
>> -                        int do_init)
>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>   {
>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>>       clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>> -    PowerPCCPU *cpu;
>>       CPUPPCState *env;
>> -    DeviceState *uicdev;
>> -    SysBusDevice *uicsbd;
>> +    Error *err = NULL;
>> +
>> +    /* XXX: fix this ? */
>
> So, this comment, originally from ppc405_boards.c, was added by commit
> 1a6c088620368 and it seemed to make reference to something with the refering
> to the ram_* values:
>
>
>    /* XXX: fix this */
>    ram_bases[0] = 0x00000000;
>    ram_sizes[0] = 0x08000000;
>    ram_bases[1] = 0x00000000;
>    ram_sizes[1] = 0x00000000;
> (...)
>
>
> No more context is provided aside from a git-svn-id from savannah.nongnu.org.
>
> If no one can provide more context about what is to be fixed here, I'll
> remove the comment.

I'm not sure about it because I don't know 405 and only vaguely remember 
how this was on 440/460EX but I think it might be that the memory 
controller can be programmed to map RAM to different places but we don't 
fully emulate that nor the different chunks/DIMM sockets that could be 
possible and just map all system RAM to address 0 which is what most guest 
firmware or OS does anyway. Maybe I'm wrong and don't remember this 
correctly, the SDRAM controller model in ppc4xx_devs.c seems to do some 
mapping but I think this is what the comment might refer to or something 
similar. If so, I don't think it's worth emulating this more precisely 
unless we know about a guest which needs this.

Regards,
BALATON Zoltan
--3866299591-414620594-1659475482=:52653--

