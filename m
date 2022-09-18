Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6165BBD75
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 12:36:52 +0200 (CEST)
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZrfO-0008CN-So
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 06:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZrdt-0006Yt-KI; Sun, 18 Sep 2022 06:35:17 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZrdp-00051d-Tv; Sun, 18 Sep 2022 06:35:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AB6C5759B50;
 Sun, 18 Sep 2022 12:35:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 486E974638A; Sun, 18 Sep 2022 12:35:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4658874633D;
 Sun, 18 Sep 2022 12:35:08 +0200 (CEST)
Date: Sun, 18 Sep 2022 12:35:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 03/20] ppc4xx_sdram: Get rid of the init RAM hack
In-Reply-To: <d2e5dc82-98c1-fe8e-a3fb-fee05601aa4@eik.bme.hu>
Message-ID: <eec2e544-c20-e9e9-353a-76bc37c74a57@eik.bme.hu>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <554b4cde6c026bb7ba4bfbaa6d3e1e6019b40409.1663097286.git.balaton@eik.bme.hu>
 <579fe2b8-0e1b-46e6-dc58-523c414744a4@kaod.org>
 <f21297c-4851-fe69-7438-7e4421a8a45@eik.bme.hu>
 <e29706b8-69e2-fa67-df56-c40ed6d510b2@kaod.org>
 <cb0921e-e265-4d47-e66f-77bb5970f3e4@eik.bme.hu>
 <d88f4a27-acfb-795-8443-f682bbcebde1@eik.bme.hu>
 <f08d32e6-e088-087e-77d6-97b6c619ad51@kaod.org>
 <d2e5dc82-98c1-fe8e-a3fb-fee05601aa4@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1820763866-1663497308=:53072"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1820763866-1663497308=:53072
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 18 Sep 2022, BALATON Zoltan wrote:
> On Sun, 18 Sep 2022, Cédric Le Goater wrote:
>> On 9/14/22 20:32, BALATON Zoltan wrote:
>>> On Wed, 14 Sep 2022, BALATON Zoltan wrote:
>>>> On Wed, 14 Sep 2022, Cédric Le Goater wrote:
>>>>> On 9/14/22 13:44, BALATON Zoltan wrote:
>>>>>> On Wed, 14 Sep 2022, Cédric Le Goater wrote:
>>>>>>> On 9/13/22 21:52, BALATON Zoltan wrote:
>>>>>>>> The do_init parameter of ppc4xx_sdram_init() is used to map memory
>>>>>>>> regions that is normally done by the firmware by programming the 
>>>>>>>> SDRAM
>>>>>>>> controller. This is needed when booting a kernel directly from 
>>>>>>>> -kernel
>>>>>>>> without a firmware. Do this from board code accesing normal SDRAM
>>>>>>> 
>>>>>>> accessing
>>>>>> 
>>>>>> Fixed, also two ofhers in another patch you haven't noticed.
>>>>>> 
>>>>>>>> controller registers the same way as firmware would do, so we can get
>>>>>>>> rid of this hack.
>>>>>>>> 
>>>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>>>> ---
>>>>>>>> v2: Fix ref405ep boot with -kernel and U-Boot
>>>>>>>> 
>>>>>>>>   hw/ppc/ppc405.h         |  1 -
>>>>>>>>   hw/ppc/ppc405_boards.c  | 12 ++++++++++--
>>>>>>>>   hw/ppc/ppc405_uc.c      |  4 +---
>>>>>>>>   hw/ppc/ppc440_bamboo.c  |  8 +++++++-
>>>>>>>>   hw/ppc/ppc440_uc.c      |  2 --
>>>>>>>>   hw/ppc/ppc4xx_devs.c    | 11 +----------
>>>>>>>>   include/hw/ppc/ppc4xx.h |  8 ++++++--
>>>>>>>>   7 files changed, 25 insertions(+), 21 deletions(-)
>>>>>>>> 
>>>>>>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>>>>>>> index 1e558c7831..756865621b 100644
>>>>>>>> --- a/hw/ppc/ppc405.h
>>>>>>>> +++ b/hw/ppc/ppc405.h
>>>>>>>> @@ -169,7 +169,6 @@ struct Ppc405SoCState {
>>>>>>>>       /* Public */
>>>>>>>>       MemoryRegion ram_banks[2];
>>>>>>>>       hwaddr ram_bases[2], ram_sizes[2];
>>>>>>>> -    bool do_dram_init;
>>>>>>>>         MemoryRegion *dram_mr;
>>>>>>>>       hwaddr ram_size;
>>>>>>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>>>>>>> index 083f12b23e..bf02a71c6d 100644
>>>>>>>> --- a/hw/ppc/ppc405_boards.c
>>>>>>>> +++ b/hw/ppc/ppc405_boards.c
>>>>>>>> @@ -274,6 +274,7 @@ static void ppc405_init(MachineState *machine)
>>>>>>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>>>>>>       const char *kernel_filename = machine->kernel_filename;
>>>>>>>>       MemoryRegion *sysmem = get_system_memory();
>>>>>>>> +    CPUPPCState *env;
>>>>>>>>         if (machine->ram_size != mc->default_ram_size) {
>>>>>>>>           char *sz = size_to_str(mc->default_ram_size);
>>>>>>>> @@ -288,12 +289,19 @@ static void ppc405_init(MachineState *machine)
>>>>>>>>                                machine->ram_size, &error_fatal);
>>>>>>>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>>>>>>>                                OBJECT(machine->ram), &error_abort);
>>>>>>>> -    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>>>>>>>> -                             kernel_filename != NULL, &error_abort);
>>>>>>>>       object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 
>>>>>>>> 33333333,
>>>>>>>>                                &error_abort);
>>>>>>>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
>>>>>>>>   +    /* Enable SDRAM memory regions */
>>>>>>>> +    /* FIXME This shouldn't be needed with firmware but we lack SPD 
>>>>>>>> data */
>>>>>>> 
>>>>>>> what do you mean ?
>>>>>> 
>>>>>> U-Boot detects the available RAM by reading the SPD info of the RAM 
>>>>>> modules but that probably also needs i2c emulation. See sam460ex.
>>>>>> 
>>>>>>>> +    env = &ppc405->soc.cpu.env;
>>>>>>>> +    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>>>>>>>> +        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
>>>>>>> 
>>>>>>> 
>>>>>>> I am not in favor of these ppc_drc_write calls and this is still a 
>>>>>>> hack.
>>>>>> 
>>>>>> It's not. Normally this is done by firmware to enable memory controller 
>>>>>> but the board code has to do it if not using firmware (e.g. booting 
>>>>>> with -kernel) the same way it provides bootinfo or device tree mods the 
>>>>>> firmware would normally do or in this case maybe the emulation is 
>>>>>> incomplete so the part of firmware that configures the SDRAM controller 
>>>>>> does not run.
>>>>> 
>>>>> Exactly, and what the above proposal does is mimicking execution of CPU
>>>>> instructions before the CPU is even fully initiated. Reset has not been
>>>>> called at that stage.
>>>> 
>>>> I don't get this. We're not calling any CPU instructions, ppc_dcr_write 
>>>> just calls the write callback the device has registered for the dcr so it 
>>>> just does the same as the hack did at the end just doing it the same way 
>>>> the firmware should do.
>>>> 
>>>>>>> The "dram-init" property is a cleaner solution. It takes care of doing 
>>>>>>> the
>>>>>>> pre-mapping of RAM banks in the realize routine of the sdram model 
>>>>>>> (when
>>>>>>> available).
>>>>>> 
>>>>>> I disagree, the hardware does not have such feature, it proviesd DCRs 
>>>>>> as the way to configure it. Adding a special property for it deviates 
>>>>>> from hardware and clutters qtree. 
>>>>> 
>>>>> 
>>>>> In this machine, running QEMU with -kernel deviates from HW. That's
>>>> 
>>>> In all machines booting with -kernel likely deviates and all machines 
>>>> probably have additinal code in this case to do some things normally done 
>>>> by the firmware. Look at pegasos2_machine_reset() for example. All that 
>>>> is not needed when we boot with firmware as then the firmware will do all 
>>>> that and provide the device tree, etc. bur we need to do these when 
>>>> booting without firmware. In thes case QEMU also emulates the firmware 
>>>> and has to do thinigs like enabling the memory controller.
>>>> 
>>>>> the whole purpose of this option. It assumes that the SDRAM device
>>>>> is pre-initialized (and much more should be done) by the QEMU machine
>>>>> and the simplest way to acheive this goal is to inform the SDRAM model
>>>>> to take care of the pre-initialization.
>>>> 
>>>> In my opinion the SDRAM controller model should model the hardware and if 
>>>> the board uses it differently then it should take care of that and not 
>>>> change the model.
>>>> 
>>>>> Another way would be to change the default reset values of the SDRAM
>>>>> registers (in the realize method using some property) and perform
>>>>> some actions (mapping the banks) in the reset handler of the SDRAM
>>>>> device model. That would be a deferred initialization but a property
>>>>> is still needed to change the default behavior of the SDRAM model.
>>>>> 
>>>>> Anyhow, this should be isolated under the SDRAM device model and
>>>>> not in the machine init by using the CPU state. That's clearly ugly.
>>> 
>>> Additionally, if you don't like the FIXME comment, 
>> 
>> I didn't understand it. That's different.
>> 
>>> it's there because this would really belong at the beginning of 
>>> boot_from_kernel() function before that calls ppc405_set_bootinfo which is 
>>> called when booting without firmware but I left it where it was in init 
>>> for now because you menfioned that firmware boot was also broken 
>> 
>> hmm ? but It's not anymore. v2 broke it I think.
>
> First I've put enabling SDRAM controller in boot_from_kernel at the end 
> before qemu_register_reset but this is wrong as the bootinfo is written in 
> RAM so it should be enabled before. So this should be done at the beginning 
> of boot_from_kernel but you said my first version not only broke -kernel but 
> also booting with firmware so that told me firmware also does not enable the 
> SDRAM conroller itself (as now seen below it's disabled) so I moved enabling

On second look, enabling the memory controller in line 195 is not 
#ifdef-ed out so maybe it would work with enable only at the beginning of 
boot_from_kernel, I'll try to test with the firmware. For removing the 
hack the register values would need to be checked but that's something I 
don't want to do. You could look at that later as a follow up.

Regards,
BALATON Zoltan

> back to where it was in init. Ideally it should be done by the firmware if 
> using that or QEMU at the beginning of boot_from_kernel when emulating 
> firmwere but that does not work yet so that's why we have the FIXME comment 
> to remind for this.
>
>>> when I had it at the end of boot_from_kernel so I suspect the board is not 
>>> providing the SPD data so the firmware cannot detect the RAM and this why 
>>> it's not enabling the SDRAM itself (or maybe that part is even compiled 
>>> out because of that) but then it's a limitation of the board emulation and 
>>> not the SDRAM controller so it should be handled in the board code.
>> 
>> Here is the U-boot tree that can be used :
>>
>>  https://gitlab.com/huth/u-boot/-/tree/taihu
>> 
>> and the SDRAM init hacks :
>>   https://gitlab.com/huth/u-boot/-/commit/296e0479a972fa57390f0f3a912650168dabe851
>> 
>> May be there is a way to fix the model to remove the U-boot hack.
>
> I don't know how that works for 405. For 440 used by Sam460ex u-boot reads 
> the SPD EEPROMs to detect memmory size and configures the SDRAM DDR2 
> controller according to that but that needs i2c and SPD data as in 
> sam460ex.c. The code you pointed to seems to try a fixed table of valid RAM 
> sizes in mb0cf[] that is either taken from CONFIG_SYS_SDRAM_TABLE value or 
> use default of 128, 64, 32, 16, 4 MB. Maybe the model can be changed to allow 
> this check to succeed so it does not have to be disabled but I don't know 
> what it really tries to do here. The SoC manual may also have some docs on 
> the register which you could check if you have it. This controller should be 
> the same as in some 440 with DDR SDRAM. I think there are three different 
> memory controllers in these SoCs: SDRAM, DDR and DDR2. The 460EX has DDR2, 
> the 440 in bamboo has DDR and I think this is backwards compatible with SDRAM 
> in 405 but the 440 DDR controller has some more regs for ECC. Therefore in 
> QEMU we mostly only model DDR2 and DDR and use DDR instead of SDRAM in 405 as 
> its common regs are likely the same but I don't have docs to prove it, I've 
> only seen docs on 440 DDR so it's just what I've found while doing this 
> series. Anyway you should keep this in mind when changing the DDR model and 
> also check bamboo firmware which I don't have.
>
> Regards,
> BALATON Zoltan
>
>> 
>> Thomas added a uboot.bin in the tree which is used by :
>>
>>  tests/avocado/ppc_405.py
>> 
>> Thanks,
>> 
>> C.
>> 
>
--3866299591-1820763866-1663497308=:53072--

