Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F45B05CF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:56:10 +0200 (CEST)
Received: from localhost ([::1]:53114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvXF-00049W-HP
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvSo-0006z5-FS
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:51:36 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:59275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvSm-0001Qz-HF
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:51:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D35AB125D975B;
 Wed,  7 Sep 2022 15:51:29 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:51:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0020ae9bc43-5616-4494-b4e3-21441fa8eb21,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <96307308-4188-1840-b3cf-68e95fcb8054@kaod.org>
Date: Wed, 7 Sep 2022 15:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 14/20] ppc440_sdram: Move RAM size check to
 ppc440_sdram_init
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <01f562a28cc9959cdc71b3d1e48b4f50b595df53.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <01f562a28cc9959cdc71b3d1e48b4f50b595df53.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6f939fc0-0436-4447-ac96-d6568a9fa259
X-Ovh-Tracer-Id: 11664604513684917155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
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
> Move the check for valid memory sizes from board to sdram contrller

controller

> init. Board now only checks for additinal restrictions imposed by

additional

> firmware then sdram init checks for valid sizes for SoC.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440.h    |  4 ++--
>   hw/ppc/ppc440_uc.c | 15 +++++++--------
>   hw/ppc/sam460ex.c  | 32 +++++++++++++++++---------------
>   3 files changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
> index 7bd5cca1ab..29f6f14ed7 100644
> --- a/hw/ppc/ppc440.h
> +++ b/hw/ppc/ppc440.h
> @@ -11,13 +11,13 @@
>   #ifndef PPC440_H
>   #define PPC440_H
>   
> -#include "hw/ppc/ppc4xx.h"
> +#include "hw/ppc/ppc.h"
>   
>   void ppc4xx_l2sram_init(CPUPPCState *env);
>   void ppc4xx_cpr_init(CPUPPCState *env);
>   void ppc4xx_sdr_init(CPUPPCState *env);
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank ram_banks[]);
> +                       MemoryRegion *ram);
>   void ppc4xx_ahb_init(CPUPPCState *env);
>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>   void ppc460ex_pcie_init(CPUPPCState *env);
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index b39c6dbbd2..e77d56225d 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -486,7 +486,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   typedef struct ppc440_sdram_t {
>       uint32_t addr;
>       uint32_t mcopt2;
> -    int nbanks;
> +    int nbanks; /* Banks to use from the 4, e.g. when board has less slots */
>       Ppc4xxSdramBank bank[4];
>   } ppc440_sdram_t;
>   
> @@ -728,18 +728,17 @@ static void sdram_ddr2_reset(void *opaque)
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
> -                       Ppc4xxSdramBank ram_banks[])
> +                       MemoryRegion *ram)
>   {
>       ppc440_sdram_t *s;
> -    int i;
> +    const ram_addr_t valid_bank_sizes[] = {
> +        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
> +        32 * MiB, 16 * MiB, 8 * MiB, 0
> +    };
>   
>       s = g_malloc0(sizeof(*s));
>       s->nbanks = nbanks;
> -    for (i = 0; i < nbanks; i++) {
> -        s->bank[i].ram = ram_banks[i].ram;
> -        s->bank[i].base = ram_banks[i].base;
> -        s->bank[i].size = ram_banks[i].size;
> -    }
> +    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
>       qemu_register_reset(&sdram_ddr2_reset, s);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
>                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index dac329d482..9b850808a3 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -74,13 +74,6 @@
>   #define EBC_FREQ 115000000
>   #define UART_FREQ 11059200
>   
> -/* The SoC could also handle 4 GiB but firmware does not work with that. */
> -/* Maybe it overflows a signed 32 bit number somewhere? */
> -static const ram_addr_t ppc460ex_sdram_bank_sizes[] = {
> -    2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
> -    32 * MiB, 0
> -};
> -
>   struct boot_info {
>       uint32_t dt_base;
>       uint32_t dt_size;
> @@ -273,7 +266,6 @@ static void sam460ex_init(MachineState *machine)
>   {
>       MemoryRegion *address_space_mem = get_system_memory();
>       MemoryRegion *isa = g_new(MemoryRegion, 1);
> -    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
>       MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
>       DeviceState *uic[4];
>       int i;
> @@ -340,12 +332,22 @@ static void sam460ex_init(MachineState *machine)
>       }
>   
>       /* SDRAM controller */
> -    /* put all RAM on first bank because board has one slot
> -     * and firmware only checks that */
> -    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, ppc460ex_sdram_bank_sizes);
> -
> +    /* The SoC could also handle 4 GiB but firmware does not work with that. */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("Memory over 2 GiB is not supported");
> +        exit(1);
> +    }
> +    /* Firmware needs at least 64 MiB */
> +    if (machine->ram_size < 64 * MiB) {
> +        error_report("Memory below 64 MiB is not supported");
> +        exit(1);
> +    }


These checks on the RAM size should be done by the SDRAM model.

May be it is addressed later in the patchset ?

C.



> +    /*
> +     * Put all RAM on first bank because board has one slot
> +     * and firmware only checks that
> +     */
> +    ppc440_sdram_init(env, 1, machine->ram);
>       /* FIXME: does 460EX have ECC interrupts? */
> -    ppc440_sdram_init(env, 1, ram_banks);
>       /* Enable SDRAM memory regions as we may boot without firmware */
>       if (ppc_dcr_write(env->dcr_env, SDRAM0_CFGADDR, 0x21) ||
>           ppc_dcr_write(env->dcr_env, SDRAM0_CFGDATA, 0x08000000)) {
> @@ -358,8 +360,8 @@ static void sam460ex_init(MachineState *machine)
>                                  qdev_get_gpio_in(uic[0], 2));
>       i2c = PPC4xx_I2C(dev)->bus;
>       /* SPD EEPROM on RAM module */
> -    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
> -                                 ram_banks->size);
> +    spd_data = spd_data_generate(machine->ram_size < 128 * MiB ? DDR : DDR2,
> +                                 machine->ram_size);
>       spd_data[20] = 4; /* SO-DIMM module */
>       smbus_eeprom_init_one(i2c, 0x50, spd_data);
>       /* RTC */


