Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3765588C5D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:47:36 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDmh-0002DF-EU
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJDUD-0004TC-4z
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:28:30 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:50449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJDUA-00088O-Gd
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 08:28:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id ABAB711C6D1E9;
 Wed,  3 Aug 2022 14:28:22 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 14:28:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00486977f83-2593-47ff-9a72-b2242fdc07b2,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7fbbabb7-2a13-9719-1aca-084c032d9302@kaod.org>
Date: Wed, 3 Aug 2022 14:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/19] ppc/ppc405: Start QOMification of the SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-6-clg@kaod.org>
 <e437d81d-37e6-2a31-21e9-0cf7a8be73fd@gmail.com>
 <be98071c-ac88-d716-6e0a-e07699b5435c@kaod.org>
 <f9fa36ee-f57c-d377-64db-d7e66f334269@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f9fa36ee-f57c-d377-64db-d7e66f334269@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fd90b5c7-25e4-4bc6-9293-9de7c507a8eb
X-Ovh-Tracer-Id: 7630786618915720160
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudelkeffgfeuhfduvdfgvdetvdfgleekledtgedvgfeluedvueekkeffjeekgfenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 8/3/22 13:59, BALATON Zoltan wrote:
> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> On 8/2/22 21:18, Daniel Henrique Barboza wrote:
>>> On 8/1/22 10:10, Cédric Le Goater wrote:
>>>> This moves all the code previously done in the ppc405ep_init() routine
>>>> under ppc405_soc_realize().
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/ppc/ppc405.h        |  12 ++--
>>>>   hw/ppc/ppc405_boards.c |  12 ++--
>>>>   hw/ppc/ppc405_uc.c     | 151 ++++++++++++++++++++---------------------
>>>>   3 files changed, 84 insertions(+), 91 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>>> index c8cddb71733a..5e4e96d86ceb 100644
>>>> --- a/hw/ppc/ppc405.h
>>>> +++ b/hw/ppc/ppc405.h
>>>> @@ -74,9 +74,14 @@ struct Ppc405SoCState {
>>>>       MemoryRegion sram;
>>>>       MemoryRegion ram_memories[2];
>>>>       hwaddr ram_bases[2], ram_sizes[2];
>>>> +    bool do_dram_init;
>>>>       MemoryRegion *dram_mr;
>>>>       hwaddr ram_size;
>>>> +
>>>> +    uint32_t sysclk;
>>>> +    PowerPCCPU *cpu;
>>>> +    DeviceState *uic;
>>>>   };
>>>>   /* PowerPC 405 core */
>>>> @@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>>>>   void ppc4xx_plb_init(CPUPPCState *env);
>>>>   void ppc405_ebc_init(CPUPPCState *env);
>>>> -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>>> -                        MemoryRegion ram_memories[2],
>>>> -                        hwaddr ram_bases[2],
>>>> -                        hwaddr ram_sizes[2],
>>>> -                        uint32_t sysclk, DeviceState **uicdev,
>>>> -                        int do_init);
>>>> -
>>>>   #endif /* PPC405_H */
>>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>>> index 96db52c5a309..363cb0770506 100644
>>>> --- a/hw/ppc/ppc405_boards.c
>>>> +++ b/hw/ppc/ppc405_boards.c
>>>> @@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
>>>>       Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>>       const char *kernel_filename = machine->kernel_filename;
>>>> -    PowerPCCPU *cpu;
>>>>       MemoryRegion *sysmem = get_system_memory();
>>>> -    DeviceState *uicdev;
>>>>       if (machine->ram_size != mc->default_ram_size) {
>>>>           char *sz = size_to_str(mc->default_ram_size);
>>>> @@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
>>>>                                machine->ram_size, &error_fatal);
>>>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>>>                                OBJECT(machine->ram), &error_abort);
>>>> +    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>>>> +                             !(kernel_filename == NULL), &error_abort);
>>>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>>>> +                             &error_abort);
>>>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>>> -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
>>>> -                        ppc405->soc.ram_sizes,
>>>> -                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>>> -
>>>>       /* allocate and load BIOS */
>>>>       if (machine->firmware) {
>>>>           MemoryRegion *bios = g_new(MemoryRegion, 1);
>>>> @@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>>>       /* Load ELF kernel and rootfs.cpio */
>>>>       } else if (kernel_filename && !machine->firmware) {
>>>> -        boot_from_kernel(machine, cpu);
>>>> +        boot_from_kernel(machine, ppc405->soc.cpu);
>>>>       }
>>>>   }
>>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>>> index 156e839b8283..59612504bf3f 100644
>>>> --- a/hw/ppc/ppc405_uc.c
>>>> +++ b/hw/ppc/ppc405_uc.c
>>>> @@ -1432,134 +1432,131 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>>>>   #endif
>>>>   }
>>>> -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>>> -                        MemoryRegion ram_memories[2],
>>>> -                        hwaddr ram_bases[2],
>>>> -                        hwaddr ram_sizes[2],
>>>> -                        uint32_t sysclk, DeviceState **uicdevp,
>>>> -                        int do_init)
>>>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>>>   {
>>>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>>>>       clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>>>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>>>> -    PowerPCCPU *cpu;
>>>>       CPUPPCState *env;
>>>> -    DeviceState *uicdev;
>>>> -    SysBusDevice *uicsbd;
>>>> +    Error *err = NULL;
>>>> +
>>>> +    /* XXX: fix this ? */
>>>
>>> So, this comment, originally from ppc405_boards.c, was added by commit
>>> 1a6c088620368 and it seemed to make reference to something with the refering
>>> to the ram_* values:
>>>
>>>
>>>      /* XXX: fix this */
>>>      ram_bases[0] = 0x00000000;
>>>      ram_sizes[0] = 0x08000000;
>>>      ram_bases[1] = 0x00000000;
>>>      ram_sizes[1] = 0x00000000;
>>> (...)
>>>
>>>
>>> No more context is provided aside from a git-svn-id from savannah.nongnu.org.
>>>
>>> If no one can provide more context about what is to be fixed here, I'll
>>> remove the comment.
>>>
>>>
>>>
>>>> +    memory_region_init_alias(&s->ram_memories[0], OBJECT(s),
>>>> +                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
>>>
>>> As I mentioned in patch 2, ef405ep.ram.alias can be renamed to ppc405.ram.alias ...
>>
>> sure.
>>
>>>
>>>> +    s->ram_bases[0] = 0;
>>>> +    s->ram_sizes[0] = s->ram_size;
>>>> +    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);
>>>
>>> And this can be renamed to ef405ep.ram1. If you agree with the rename I
>>> can amend it in the tree.
>>
>>
>> I think we can do better and simply remove the second bank. it is unused ...
>>
>> I have patches QOMifying ppc4xx_sdram_init() but the current modelling
>> makes things a bit complex, specially ppc4xx_sdram_banks() which is only
>> used on the bamboo and sam460ex machines.
> 
> We need to model the SDRAM controller for the sam460ex firmware at least partially so it gets past the memory test and init. If you change it please test that sam460ex still boots with firmware. 

Sure.

QOM'ifying models reveals the implementation shortcuts. The ppc405 board was
quite messy and it's getting better with the removal of ppc405ep_init().
ppc4xx_sdram_init() is the next step but it is quite localized in the SoC.
No hurries.

Thanks,

C.


> I'm not sure 405 and 440 use the same sdram controller though or if the 460EX has a different one as these may have been updated in later SoCs to support newer RAM standards (I think the 460EX has DDR2) and the QEMU model is a bit messy sharing components between 405 and 440. When I've changed some of these for 460EX I've tried to name them so that 4xx means shared by all, 44x or 440 means 440 specific and 40x or similar for older SoCs only but this is probably not always correct. I could not find a clean way to separate these. QOMifying would make sense when cleaning this up otherwise it's just adding more boilerplate without any clear advantage IMO.
> 
> If you want change these maybe you should get the docs for the emulated chips and consult those for differences. Unfortunately the 460ex does not seem to have docs available but it's similar to earlier IBM parts like 440GP which generally have docs. That's what I've used but still couldn't find all parts like the PCIe conroller that I had to implement based on what the firmware and drivers do (and only did that partially so it boots as I did not fully understand how it works and how these are modelled in QEMU).
> 
> Regards,
> BALATON Zoltan


