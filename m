Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41CA5FF674
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 00:54:26 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojTZR-0005f3-IB
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 18:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ojTXQ-0003I2-05; Fri, 14 Oct 2022 18:52:20 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ojTXN-0001mq-4Q; Fri, 14 Oct 2022 18:52:19 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 38B3D75A150;
 Sat, 15 Oct 2022 00:52:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DAB1D746324; Sat, 15 Oct 2022 00:52:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D8F9574633E;
 Sat, 15 Oct 2022 00:52:12 +0200 (CEST)
Date: Sat, 15 Oct 2022 00:52:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 14/25] ppc440_sdram: Move RAM size check to
 ppc440_sdram_init
In-Reply-To: <d6be8094-3ab9-58e5-c4ac-a767f552e8e3@gmail.com>
Message-ID: <81d25c94-ebd5-8a1-37d7-8e82b1523fa@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <41da3797392acaacc7963b79512c8af8005fa4b0.1664021647.git.balaton@eik.bme.hu>
 <d6be8094-3ab9-58e5-c4ac-a767f552e8e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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

On Fri, 14 Oct 2022, Daniel Henrique Barboza wrote:
> Zoltan,
>
> Gitlab didn't like this patch. It broke all 32 bits builds due to an overflow
> down there:
>
> On 9/24/22 09:28, BALATON Zoltan wrote:
>> Move the check for valid memory sizes from board to sdram controller
>> init. This adds the missing valid memory sizes of 4 GiB, 16 and 8 MiB
>> to the DoC and the board now only checks for additional restrictions
>> imposed by its firmware then sdram init checks for valid sizes for SoC.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/ppc440.h    |  4 ++--
>>   hw/ppc/ppc440_uc.c | 15 +++++++--------
>>   hw/ppc/sam460ex.c  | 32 +++++++++++++++++---------------
>>   3 files changed, 26 insertions(+), 25 deletions(-)
>> 
>> diff --git a/hw/ppc/ppc440.h b/hw/ppc/ppc440.h
>> index 01d76b8000..29f6f14ed7 100644
>> --- a/hw/ppc/ppc440.h
>> +++ b/hw/ppc/ppc440.h
>> @@ -11,13 +11,13 @@
>>   #ifndef PPC440_H
>>   #define PPC440_H
>>   -#include "hw/ppc/ppc4xx.h"
>> +#include "hw/ppc/ppc.h"
>>     void ppc4xx_l2sram_init(CPUPPCState *env);
>>   void ppc4xx_cpr_init(CPUPPCState *env);
>>   void ppc4xx_sdr_init(CPUPPCState *env);
>>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>> -                       Ppc4xxSdramBank *ram_banks);
>> +                       MemoryRegion *ram);
>>   void ppc4xx_ahb_init(CPUPPCState *env);
>>   void ppc4xx_dma_init(CPUPPCState *env, int dcr_base);
>>   void ppc460ex_pcie_init(CPUPPCState *env);
>> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
>> index edd0781eb7..2b9d666b71 100644
>> --- a/hw/ppc/ppc440_uc.c
>> +++ b/hw/ppc/ppc440_uc.c
>> @@ -487,7 +487,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>>   typedef struct ppc440_sdram_t {
>>       uint32_t addr;
>>       uint32_t mcopt2;
>> -    int nbanks;
>> +    int nbanks; /* Banks to use from the 4, e.g. when board has less slots 
>> */
>>       Ppc4xxSdramBank bank[4];
>>   } ppc440_sdram_t;
>>   @@ -733,18 +733,17 @@ static void sdram_ddr2_reset(void *opaque)
>>   }
>>     void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>> -                       Ppc4xxSdramBank *ram_banks)
>> +                       MemoryRegion *ram)
>>   {
>>       ppc440_sdram_t *s;
>> -    int i;
>> +    const ram_addr_t valid_bank_sizes[] = {
>> +        4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * 
>> MiB,
>
>
> ^ here. ram_addr_t will be a 32 bit var in a 32 bit host, and assigning 4 * 
> GiB will
> overflow it back to zero.
>
> Here's the Gitlab error from the 'cross-win32-system' runner:
>
> FAILED: libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj
> 2725i686-w64-mingw32-gcc -m32 -Ilibqemu-ppc64-softmmu.fa.p -I. -I.. 
> -Itarget/ppc -I../target/ppc -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1 
> -I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0 
> -I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include 
> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g 
> -iquote . -iquote /builds/danielhb/qemu -iquote /builds/danielhb/qemu/include 
> -iquote /builds/danielhb/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE 
> -D_FORTIFY_SOURCE=2 -fno-pie -no-pie -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv 
> -Wold-style-declaration -Wold-style-definition -Wtype-limits 
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body 
> -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value 
> -Wno-psabi -fstack-protector-strong -DNEED_CPU_H 
> '-DCONFIG_TARGET="ppc64-softmmu-config-target.h"' 
> '-DCONFIG_DEVICES="ppc64-softmmu-config-devices.h"' -MD -MQ 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj -MF 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj.d -o 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_ppc440_uc.c.obj -c ../hw/ppc/ppc440_uc.c
> 2726../hw/ppc/ppc440_uc.c: In function 'ppc4xx_sdram_ddr2_realize':
> 2727../hw/ppc/ppc440_uc.c:729:9: error: unsigned conversion from 'long long 
> int' to 'unsigned int' changes value from '4294967296' to '0' 
> [-Werror=overflow]
> 2728  729 |         4 * GiB, 2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * 
> MiB, 64 * MiB,
> 2729      |         ^
> 2730cc1: all warnings being treated as errors
> 2731
>
> A quick fix that I can make in-tree is to avoid the overflow by doing (4 * 
> GiB) - 1.
> But since this might affect some logic in the model I figured I should ask 
> you
> first.

I think in that case we can just drop the 4*GiB value from the 
valid_bank_sizes[] array for now because while it's valid for the SoC the 
sam460ex firmware also has problems with it so having 2 GiB as largest 
value is OK. Can you change the patch accordingly or should I send an 
updated version with this change?

Regards,
BALATON Zoltan

> Let me know if this is OK with you. Otherwise feel free to propose another
> workaround. I appreciate if you can answer quickly because I can't make a 
> ppc-next
> PR until this is sorted out.
>
>
>
> Thanks,
>
>
> Daniel
>
>
>
>> +        32 * MiB, 16 * MiB, 8 * MiB, 0
>> +    };
>>         s = g_malloc0(sizeof(*s));
>>       s->nbanks = nbanks;
>> -    for (i = 0; i < nbanks; i++) {
>> -        s->bank[i].ram = ram_banks[i].ram;
>> -        s->bank[i].base = ram_banks[i].base;
>> -        s->bank[i].size = ram_banks[i].size;
>> -    }
>> +    ppc4xx_sdram_banks(ram, s->nbanks, s->bank, valid_bank_sizes);
>>       qemu_register_reset(&sdram_ddr2_reset, s);
>>       ppc_dcr_register(env, SDRAM0_CFGADDR,
>>                        s, &sdram_ddr2_dcr_read, &sdram_ddr2_dcr_write);
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index b318521b01..13055a8916 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -74,13 +74,6 @@
>>   #define EBC_FREQ 115000000
>>   #define UART_FREQ 11059200
>>   -/* The SoC could also handle 4 GiB but firmware does not work with that. 
>> */
>> -/* Maybe it overflows a signed 32 bit number somewhere? */
>> -static const ram_addr_t ppc460ex_sdram_bank_sizes[] = {
>> -    2 * GiB, 1 * GiB, 512 * MiB, 256 * MiB, 128 * MiB, 64 * MiB,
>> -    32 * MiB, 0
>> -};
>> -
>>   struct boot_info {
>>       uint32_t dt_base;
>>       uint32_t dt_size;
>> @@ -273,7 +266,6 @@ static void sam460ex_init(MachineState *machine)
>>   {
>>       MemoryRegion *address_space_mem = get_system_memory();
>>       MemoryRegion *isa = g_new(MemoryRegion, 1);
>> -    Ppc4xxSdramBank *ram_banks = g_new0(Ppc4xxSdramBank, 1);
>>       MemoryRegion *l2cache_ram = g_new(MemoryRegion, 1);
>>       DeviceState *uic[4];
>>       int i;
>> @@ -340,12 +332,22 @@ static void sam460ex_init(MachineState *machine)
>>       }
>>         /* SDRAM controller */
>> -    /* put all RAM on first bank because board has one slot
>> -     * and firmware only checks that */
>> -    ppc4xx_sdram_banks(machine->ram, 1, ram_banks, 
>> ppc460ex_sdram_bank_sizes);
>> -
>> +    /* The SoC could also handle 4 GiB but firmware does not work with 
>> that. */
>> +    if (machine->ram_size > 2 * GiB) {
>> +        error_report("Memory over 2 GiB is not supported");
>> +        exit(1);
>> +    }
>> +    /* Firmware needs at least 64 MiB */
>> +    if (machine->ram_size < 64 * MiB) {
>> +        error_report("Memory below 64 MiB is not supported");
>> +        exit(1);
>> +    }
>> +    /*
>> +     * Put all RAM on first bank because board has one slot
>> +     * and firmware only checks that
>> +     */
>> +    ppc440_sdram_init(env, 1, machine->ram);
>>       /* FIXME: does 460EX have ECC interrupts? */
>> -    ppc440_sdram_init(env, 1, ram_banks);
>>       /* Enable SDRAM memory regions as we may boot without firmware */
>>       ppc4xx_sdram_ddr2_enable(env);
>>   @@ -354,8 +356,8 @@ static void sam460ex_init(MachineState *machine)
>>                                  qdev_get_gpio_in(uic[0], 2));
>>       i2c = PPC4xx_I2C(dev)->bus;
>>       /* SPD EEPROM on RAM module */
>> -    spd_data = spd_data_generate(ram_banks->size < 128 * MiB ? DDR : DDR2,
>> -                                 ram_banks->size);
>> +    spd_data = spd_data_generate(machine->ram_size < 128 * MiB ? DDR : 
>> DDR2,
>> +                                 machine->ram_size);
>>       spd_data[20] = 4; /* SO-DIMM module */
>>       smbus_eeprom_init_one(i2c, 0x50, spd_data);
>>       /* RTC */
>

