Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222075BBC50
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 09:38:27 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZosj-0001QE-Lw
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 03:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oZopM-0006gd-BW; Sun, 18 Sep 2022 03:34:57 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:43497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oZopJ-0004NQ-QB; Sun, 18 Sep 2022 03:34:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 123A2129E2DDC;
 Sun, 18 Sep 2022 09:34:41 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sun, 18 Sep
 2022 09:34:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0068fb1bcef-2db6-42e1-af84-aed0f59cbf71,
 E2539BBE2CBB8BC61C982421C48FA5A1DAEC139A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.121.154
Message-ID: <f08d32e6-e088-087e-77d6-97b6c619ad51@kaod.org>
Date: Sun, 18 Sep 2022 09:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 03/20] ppc4xx_sdram: Get rid of the init RAM hack
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <554b4cde6c026bb7ba4bfbaa6d3e1e6019b40409.1663097286.git.balaton@eik.bme.hu>
 <579fe2b8-0e1b-46e6-dc58-523c414744a4@kaod.org>
 <f21297c-4851-fe69-7438-7e4421a8a45@eik.bme.hu>
 <e29706b8-69e2-fa67-df56-c40ed6d510b2@kaod.org>
 <cb0921e-e265-4d47-e66f-77bb5970f3e4@eik.bme.hu>
 <d88f4a27-acfb-795-8443-f682bbcebde1@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d88f4a27-acfb-795-8443-f682bbcebde1@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 41d26d9d-a985-4e4e-b74f-ad5e38b6bb3f
X-Ovh-Tracer-Id: 14560419070972169123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvgedgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeljefhieetffeltdefteeutdekhfefuedttdevteffffffgedttdekieeftdetkeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 20:32, BALATON Zoltan wrote:
> On Wed, 14 Sep 2022, BALATON Zoltan wrote:
>> On Wed, 14 Sep 2022, Cédric Le Goater wrote:
>>> On 9/14/22 13:44, BALATON Zoltan wrote:
>>>> On Wed, 14 Sep 2022, Cédric Le Goater wrote:
>>>>> On 9/13/22 21:52, BALATON Zoltan wrote:
>>>>>> The do_init parameter of ppc4xx_sdram_init() is used to map memory
>>>>>> regions that is normally done by the firmware by programming the SDRAM
>>>>>> controller. This is needed when booting a kernel directly from -kernel
>>>>>> without a firmware. Do this from board code accesing normal SDRAM
>>>>>
>>>>> accessing
>>>>
>>>> Fixed, also two ofhers in another patch you haven't noticed.
>>>>
>>>>>> controller registers the same way as firmware would do, so we can get
>>>>>> rid of this hack.
>>>>>>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>> v2: Fix ref405ep boot with -kernel and U-Boot
>>>>>>
>>>>>>   hw/ppc/ppc405.h         |  1 -
>>>>>>   hw/ppc/ppc405_boards.c  | 12 ++++++++++--
>>>>>>   hw/ppc/ppc405_uc.c      |  4 +---
>>>>>>   hw/ppc/ppc440_bamboo.c  |  8 +++++++-
>>>>>>   hw/ppc/ppc440_uc.c      |  2 --
>>>>>>   hw/ppc/ppc4xx_devs.c    | 11 +----------
>>>>>>   include/hw/ppc/ppc4xx.h |  8 ++++++--
>>>>>>   7 files changed, 25 insertions(+), 21 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>>>>> index 1e558c7831..756865621b 100644
>>>>>> --- a/hw/ppc/ppc405.h
>>>>>> +++ b/hw/ppc/ppc405.h
>>>>>> @@ -169,7 +169,6 @@ struct Ppc405SoCState {
>>>>>>       /* Public */
>>>>>>       MemoryRegion ram_banks[2];
>>>>>>       hwaddr ram_bases[2], ram_sizes[2];
>>>>>> -    bool do_dram_init;
>>>>>>         MemoryRegion *dram_mr;
>>>>>>       hwaddr ram_size;
>>>>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>>>>> index 083f12b23e..bf02a71c6d 100644
>>>>>> --- a/hw/ppc/ppc405_boards.c
>>>>>> +++ b/hw/ppc/ppc405_boards.c
>>>>>> @@ -274,6 +274,7 @@ static void ppc405_init(MachineState *machine)
>>>>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>>>>       const char *kernel_filename = machine->kernel_filename;
>>>>>>       MemoryRegion *sysmem = get_system_memory();
>>>>>> +    CPUPPCState *env;
>>>>>>         if (machine->ram_size != mc->default_ram_size) {
>>>>>>           char *sz = size_to_str(mc->default_ram_size);
>>>>>> @@ -288,12 +289,19 @@ static void ppc405_init(MachineState *machine)
>>>>>>                                machine->ram_size, &error_fatal);
>>>>>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>>>>>                                OBJECT(machine->ram), &error_abort);
>>>>>> -    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>>>>>> -                             kernel_filename != NULL, &error_abort);
>>>>>>       object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>>>>>>                                &error_abort);
>>>>>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
>>>>>>   +    /* Enable SDRAM memory regions */
>>>>>> +    /* FIXME This shouldn't be needed with firmware but we lack SPD data */
>>>>>
>>>>> what do you mean ?
>>>>
>>>> U-Boot detects the available RAM by reading the SPD info of the RAM modules but that probably also needs i2c emulation. See sam460ex.
>>>>
>>>>>> +    env = &ppc405->soc.cpu.env;
>>>>>> +    if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>>>>>> +        ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
>>>>>
>>>>>
>>>>> I am not in favor of these ppc_drc_write calls and this is still a hack.
>>>>
>>>> It's not. Normally this is done by firmware to enable memory controller but the board code has to do it if not using firmware (e.g. booting with -kernel) the same way it provides bootinfo or device tree mods the firmware would normally do or in this case maybe the emulation is incomplete so the part of firmware that configures the SDRAM controller does not run.
>>>
>>> Exactly, and what the above proposal does is mimicking execution of CPU
>>> instructions before the CPU is even fully initiated. Reset has not been
>>> called at that stage.
>>
>> I don't get this. We're not calling any CPU instructions, ppc_dcr_write just calls the write callback the device has registered for the dcr so it just does the same as the hack did at the end just doing it the same way the firmware should do.
>>
>>>>> The "dram-init" property is a cleaner solution. It takes care of doing the
>>>>> pre-mapping of RAM banks in the realize routine of the sdram model (when
>>>>> available).
>>>>
>>>> I disagree, the hardware does not have such feature, it proviesd DCRs as the way to configure it. Adding a special property for it deviates from hardware and clutters qtree. 
>>>
>>>
>>> In this machine, running QEMU with -kernel deviates from HW. That's
>>
>> In all machines booting with -kernel likely deviates and all machines probably have additinal code in this case to do some things normally done by the firmware. Look at pegasos2_machine_reset() for example. All that is not needed when we boot with firmware as then the firmware will do all that and provide the device tree, etc. bur we need to do these when booting without firmware. In thes case QEMU also emulates the firmware and has to do thinigs like enabling the memory controller.
>>
>>> the whole purpose of this option. It assumes that the SDRAM device
>>> is pre-initialized (and much more should be done) by the QEMU machine
>>> and the simplest way to acheive this goal is to inform the SDRAM model
>>> to take care of the pre-initialization.
>>
>> In my opinion the SDRAM controller model should model the hardware and if the board uses it differently then it should take care of that and not change the model.
>>
>>> Another way would be to change the default reset values of the SDRAM
>>> registers (in the realize method using some property) and perform
>>> some actions (mapping the banks) in the reset handler of the SDRAM
>>> device model. That would be a deferred initialization but a property
>>> is still needed to change the default behavior of the SDRAM model.
>>>
>>> Anyhow, this should be isolated under the SDRAM device model and
>>> not in the machine init by using the CPU state. That's clearly ugly.
> 
> Additionally, if you don't like the FIXME comment, 

I didn't understand it. That's different.

> it's there because this would really belong at the beginning of boot_from_kernel() function before that calls ppc405_set_bootinfo which is called when booting without firmware but I left it where it was in init for now because you menfioned that firmware boot was also broken 

hmm ? but It's not anymore. v2 broke it I think.

> when I had it at the end of boot_from_kernel so I suspect the board is not providing the SPD data so the firmware cannot detect the RAM and this why it's not enabling the SDRAM itself (or maybe that part is even compiled out because of that) but then it's a limitation of the board emulation and not the SDRAM controller so it should be handled in the board code.

Here is the U-boot tree that can be used :

   https://gitlab.com/huth/u-boot/-/tree/taihu

and the SDRAM init hacks :
  
   https://gitlab.com/huth/u-boot/-/commit/296e0479a972fa57390f0f3a912650168dabe851

May be there is a way to fix the model to remove the U-boot hack.


Thomas added a uboot.bin in the tree which is used by :

   tests/avocado/ppc_405.py

Thanks,

C.

