Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC615B0518
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:27:14 +0200 (CEST)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVv5F-0007QA-Dm
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVv33-0003Qx-Nq
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:24:57 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVv31-0004xz-G4
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:24:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 52A5A27942;
 Wed,  7 Sep 2022 13:24:51 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:24:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028c780dc2-c333-49a7-af86-1b5cc3818de9,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <5d5ab9c0-f42a-b6b1-bf7b-5a68e5cd5662@kaod.org>
Date: Wed, 7 Sep 2022 15:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 06/20] ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <42df35dedc92dd296351146417cb439390b54b9c.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <42df35dedc92dd296351146417cb439390b54b9c.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 05ae3adb-2415-4348-9320-21b9bbac8fae
X-Ovh-Tracer-Id: 11214807500238326691
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> Instead of checking if memory size is valid in board code move this
> check to ppc4xx_sdram_init() as this is a restriction imposed by the
> SDRAM controller.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

It looks like a good clean up. At some point, I think we will need to
pass "MemoryRegion *sysmem" to the SDRAM model.  Let's start with this
change and see how it evolves.

One small comment below
  
Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,


C.

> ---
>   hw/ppc/ppc405.h         |  2 --
>   hw/ppc/ppc405_boards.c  | 10 ----------
>   hw/ppc/ppc405_uc.c      | 11 ++---------
>   hw/ppc/ppc440_bamboo.c  | 10 +---------
>   hw/ppc/ppc4xx_devs.c    | 14 ++++++--------
>   include/hw/ppc/ppc4xx.h |  2 +-
>   6 files changed, 10 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
> index ca0972b88b..ad54dff542 100644
> --- a/hw/ppc/ppc405.h
> +++ b/hw/ppc/ppc405.h
> @@ -167,9 +167,7 @@ struct Ppc405SoCState {
>       DeviceState parent_obj;
>   
>       /* Public */
> -    Ppc4xxSdramBank ram_banks[2];
>       MemoryRegion *dram_mr;
> -    hwaddr ram_size;
>   
>       PowerPCCPU cpu;
>       PPCUIC uic;
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 0a29ad97c7..a82b6c5c83 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -278,21 +278,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>   static void ppc405_init(MachineState *machine)
>   {
>       Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>       const char *kernel_filename = machine->kernel_filename;
>       MemoryRegion *sysmem = get_system_memory();
>   
> -    if (machine->ram_size != mc->default_ram_size) {
> -        char *sz = size_to_str(mc->default_ram_size);
> -        error_report("Invalid RAM size, should be %s", sz);
> -        g_free(sz);
> -        exit(EXIT_FAILURE);
> -    }
> -
>       object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
>                               TYPE_PPC405_SOC);
> -    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
> -                             machine->ram_size, &error_fatal);
>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>                                OBJECT(machine->ram), &error_abort);
>       object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
> index 461d18c8a5..4049fb98dc 100644
> --- a/hw/ppc/ppc405_uc.c
> +++ b/hw/ppc/ppc405_uc.c
> @@ -1070,15 +1070,9 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>                          qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
> -        /* XXX 405EP has no ECC interrupt */
> -    s->ram_banks[0].base = 0;
> -    s->ram_banks[0].size = s->ram_size;
> -    memory_region_init_alias(&s->ram_banks[0].ram, OBJECT(s),
> -                             "ppc405.sdram0", s->dram_mr,
> -                             s->ram_banks[0].base, s->ram_banks[0].size);
> -
> +    /* XXX 405EP has no ECC interrupt */
>       ppc4xx_sdram_init(env, qdev_get_gpio_in(DEVICE(&s->uic), 17), 1,
> -                      s->ram_banks);
> +                      s->dram_mr);
>   
>       /* External bus controller */
>       if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->ebc), &s->cpu, errp)) {
> @@ -1156,7 +1150,6 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>   static Property ppc405_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>                        MemoryRegion *),
> -    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 2bd5e41140..9b456f1819 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -50,10 +50,6 @@
>   
>   #define PPC440EP_SDRAM_NR_BANKS 4
>   
> -static const ram_addr_t ppc440ep_sdram_bank_sizes[] = {
> -    256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
> -};
> -
>   static hwaddr entry;
>   
>   static int bamboo_load_device_tree(hwaddr addr,
> @@ -168,8 +164,6 @@ static void bamboo_init(MachineState *machine)
>       unsigned int pci_irq_nrs[4] = { 28, 27, 26, 25 };
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
> -    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank,
> -                                        PPC440EP_SDRAM_NR_BANKS);
>       PCIBus *pcibus;
>       PowerPCCPU *cpu;
>       CPUPPCState *env;
> @@ -204,11 +198,9 @@ static void bamboo_init(MachineState *machine)
>                          qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
>   
>       /* SDRAM controller */
> -    ppc4xx_sdram_banks(machine->ram, PPC440EP_SDRAM_NR_BANKS, ram_banks,
> -                       ppc440ep_sdram_bank_sizes);
>       /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
>       ppc4xx_sdram_init(env, qdev_get_gpio_in(uicdev, 14),
> -                      PPC440EP_SDRAM_NR_BANKS, ram_banks);
> +                      PPC440EP_SDRAM_NR_BANKS, machine->ram);
>       /* Enable SDRAM memory regions, this should be done by the firmware */
>       if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x20) ||
>           ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x80000000)) {
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index e0b5931c04..eb3aa97b16 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -41,7 +41,7 @@
>   typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
>   struct ppc4xx_sdram_t {
>       uint32_t addr;
> -    int nbanks;
> +    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
>       Ppc4xxSdramBank bank[4];
>       uint32_t besr0;
>       uint32_t besr1;
> @@ -343,19 +343,17 @@ static void sdram_reset(void *opaque)
>   }
>   
>   void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
> -                       Ppc4xxSdramBank ram_banks[])
> +                       MemoryRegion *ram)
>   {
>       ppc4xx_sdram_t *sdram;
> -    int i;
> +    const ram_addr_t valid_bank_sizes[] = {
> +        256 * MiB, 128 * MiB, 64 * MiB, 32 * MiB, 16 * MiB, 8 * MiB, 4 * MiB, 0
> +    };

These sizes are specific to the SDRAM controller model and the array should
become a SDRAM class attribute.

>       sdram = g_new0(ppc4xx_sdram_t, 1);
>       sdram->irq = irq;
>       sdram->nbanks = nbanks;
> -    for (i = 0; i < nbanks; i++) {
> -        sdram->bank[i].ram = ram_banks[i].ram;
> -        sdram->bank[i].base = ram_banks[i].base;
> -        sdram->bank[i].size = ram_banks[i].size;
> -    }
> +    ppc4xx_sdram_banks(ram, sdram->nbanks, sdram->bank, valid_bank_sizes);
>       qemu_register_reset(&sdram_reset, sdram);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
>                        sdram, &dcr_read_sdram, &dcr_write_sdram);
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 0a9781bfaf..6007a8dd04 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -47,7 +47,7 @@ void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                           const ram_addr_t sdram_bank_sizes[]);
>   
>   void ppc4xx_sdram_init(CPUPPCState *env, qemu_irq irq, int nbanks,
> -                       Ppc4xxSdramBank ram_banks[]);
> +                       MemoryRegion *ram);
>   
>   #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>   


