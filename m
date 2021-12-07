Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E439E46B33B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 07:54:42 +0100 (CET)
Received: from localhost ([::1]:56622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUN8-0004ox-0u
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 01:54:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muULN-0003Qu-NF
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:52:53 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:56435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muULL-00043i-Cw
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:52:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B27B4D041D82;
 Tue,  7 Dec 2021 07:52:48 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 07:52:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a84698a0-8149-48f6-99e8-354273087ef3,
 EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a9f12ccd-e6f4-aa04-3c35-8f71ca5e41be@kaod.org>
Date: Tue, 7 Dec 2021 07:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/15] ppc/ppc405: Fix boot from kernel
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-12-clg@kaod.org>
 <9c3d5314-f2de-6d6d-913b-bef82d6e5af6@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9c3d5314-f2de-6d6d-913b-bef82d6e5af6@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6046fbe2-38fc-44ee-bfb7-1d5b727406d1
X-Ovh-Tracer-Id: 342273573577853804
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 16:16, BALATON Zoltan wrote:
> On Mon, 6 Dec 2021, Cédric Le Goater wrote:
>> The machine can already boot with kernel and initrd U-boot images if a
>> firmware is loaded first. Adapt and improve the load sequence to let
>> the machine boot directly from a Linux kernel ELF image and a usual
>> initrd image if a firmware image is not provided. For that, install a
>> custom CPU reset handler to setup the registers and to start the CPU
>> from the Linux kernel entry point.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 145 +++++++++++++++++++++++++++++------------
>> 1 file changed, 102 insertions(+), 43 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 71a652e2d846..3ae2b36373a5 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -41,6 +41,7 @@
>> #include "qemu/error-report.h"
>> #include "hw/loader.h"
>> #include "qemu/cutils.h"
>> +#include "elf.h"
>>
>> #define BIOS_FILENAME "ppc405_rom.bin"
>> #define BIOS_SIZE (2 * MiB)
>> @@ -136,25 +137,101 @@ static void ref405ep_fpga_init(MemoryRegion *sysmem, uint32_t base)
>>     qemu_register_reset(&ref405ep_fpga_reset, fpga);
>> }
>>
>> +/*
>> + * CPU reset handler when booting directly from a loaded kernel
>> + */
>> +static struct boot_info {
>> +    uint32_t entry;
>> +    uint32_t bdloc;
>> +    uint32_t initrd_base;
>> +    uint32_t initrd_size;
>> +    uint32_t cmdline_base;
>> +    uint32_t cmdline_size;
>> +} boot_info;
>> +
>> +static void main_cpu_reset(void *opaque)
>> +{
>> +    PowerPCCPU *cpu = opaque;
>> +    CPUPPCState *env = &cpu->env;
>> +    struct boot_info *bi = env->load_info;
>> +
>> +    cpu_reset(CPU(cpu));
>> +
>> +    /* stack: top of sram */
>> +    env->gpr[1] = PPC405EP_SRAM_BASE + PPC405EP_SRAM_SIZE - 8;
>> +
>> +    /* Tune our boot state */
>> +    env->gpr[3] = bi->bdloc;
>> +    env->gpr[4] = bi->initrd_base;
>> +    env->gpr[5] = bi->initrd_base + bi->initrd_size;
>> +    env->gpr[6] = bi->cmdline_base;
>> +    env->gpr[7] = bi->cmdline_size;
>> +
>> +    env->nip = bi->entry;
>> +}
>> +
>> +static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>> +{
>> +    CPUPPCState *env = &cpu->env;
>> +    hwaddr boot_entry;
>> +    hwaddr kernel_base;
>> +    int kernel_size;
>> +    hwaddr initrd_base;
>> +    int initrd_size;
>> +    ram_addr_t bdloc;
>> +    int len;
>> +
>> +    bdloc = ppc405_set_bootinfo(env, machine->ram_size);
>> +    boot_info.bdloc = bdloc;
>> +
>> +    kernel_size = load_elf(machine->kernel_filename, NULL, NULL, NULL,
>> +                           &boot_entry, &kernel_base, NULL, NULL,
>> +                           1, PPC_ELF_MACHINE, 0, 0);
>> +    if (kernel_size < 0) {
>> +        error_report("Could not load kernel '%s' : %s",
>> +                     machine->kernel_filename, load_elf_strerror(kernel_size));
>> +        exit(1);
>> +    }
>> +    boot_info.entry = boot_entry;
>> +
>> +    /* load initrd */
>> +    if (machine->initrd_filename) {
>> +        initrd_base = INITRD_LOAD_ADDR;
>> +        initrd_size = load_image_targphys(machine->initrd_filename, initrd_base,
>> +                                          machine->ram_size - initrd_base);
>> +        if (initrd_size < 0) {
>> +            error_report("could not load initial ram disk '%s'",
>> +                         machine->initrd_filename);
>> +            exit(1);
>> +        }
>> +
>> +        boot_info.initrd_base = initrd_base;
>> +        boot_info.initrd_size = initrd_size;
>> +    }
>> +
>> +    if (machine->kernel_cmdline) {
>> +        len = strlen(machine->kernel_cmdline);
>> +        bdloc -= ((len + 255) & ~255);
>> +        cpu_physical_memory_write(bdloc, machine->kernel_cmdline, len + 1);
>> +        boot_info.cmdline_base = bdloc;
>> +        boot_info.cmdline_size = bdloc + len;
>> +    }
>> +
>> +    /* Install our custom reset handler to start from Linux */
>> +    qemu_register_reset(main_cpu_reset, cpu);
>> +    env->load_info = &boot_info;
>> +}
>> +
>> static void ref405ep_init(MachineState *machine)
>> {
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
> 
> You could also get rid of kernel_filename and use machine->kernel_filename instead like for the others below. It does not help readability especially if only this one is aliased in a local variable but not the others. (Getting rid of these variables could be a separate patch in case that simpifies the actual change in this patch for easier review.)

Yes. I did reshuffle the patchset a few times to make it clearer.
I agree that part is still a bit fuzzy. I will add your suggestion
in a v2.

Thanks,

C.


> 
> Regards,
> BALATON Zoltan
> 
>> -    const char *kernel_cmdline = machine->kernel_cmdline;
>> -    const char *initrd_filename = machine->initrd_filename;
>>     PowerPCCPU *cpu;
>> -    CPUPPCState *env;
>>     DeviceState *dev;
>>     SysBusDevice *s;
>>     MemoryRegion *sram = g_new(MemoryRegion, 1);
>> -    ram_addr_t bdloc;
>>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>>     hwaddr ram_bases[2], ram_sizes[2];
>> -    long bios_size = -1;
>> -    target_ulong kernel_base, initrd_base;
>> -    long kernel_size, initrd_size;
>> -    int linux_boot;
>> -    int len;
>>     MemoryRegion *sysmem = get_system_memory();
>>     DeviceState *uicdev;
>>
>> @@ -176,7 +253,6 @@ static void ref405ep_init(MachineState *machine)
>>
>>     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
>>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>> -    env = &cpu->env;
>>
>>     /* allocate SRAM */
>>     memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
>> @@ -187,6 +263,7 @@ static void ref405ep_init(MachineState *machine)
>>     if (machine->firmware) {
>>         MemoryRegion *bios = g_new(MemoryRegion, 1);
>>         g_autofree char *filename;
>> +        long bios_size;
>>
>>         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
>>                                &error_fatal);
>> @@ -217,54 +294,36 @@ static void ref405ep_init(MachineState *machine)
>>     s = SYS_BUS_DEVICE(dev);
>>     sysbus_realize_and_unref(s, &error_fatal);
>>     sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
>> -    /* Load kernel */
>> -    linux_boot = (kernel_filename != NULL);
>> -    if (linux_boot) {
>> -        bdloc = ppc405_set_bootinfo(env, machine->ram_size);
>> -        env->gpr[3] = bdloc;
>> +
>> +    /* Load kernel and initrd using U-Boot images */
>> +    if (kernel_filename && machine->firmware) {
>> +        target_ulong kernel_base, initrd_base;
>> +        long kernel_size, initrd_size;
>> +
>>         kernel_base = KERNEL_LOAD_ADDR;
>> -        /* now we can load the kernel */
>>         kernel_size = load_image_targphys(kernel_filename, kernel_base,
>>                                           machine->ram_size - kernel_base);
>>         if (kernel_size < 0) {
>>             error_report("could not load kernel '%s'", kernel_filename);
>>             exit(1);
>>         }
>> -        printf("Load kernel size %ld at " TARGET_FMT_lx,
>> -               kernel_size, kernel_base);
>> +
>>         /* load initrd */
>> -        if (initrd_filename) {
>> +        if (machine->initrd_filename) {
>>             initrd_base = INITRD_LOAD_ADDR;
>> -            initrd_size = load_image_targphys(initrd_filename, initrd_base,
>> +            initrd_size = load_image_targphys(machine->initrd_filename,
>> +                                              initrd_base,
>>                                               machine->ram_size - initrd_base);
>>             if (initrd_size < 0) {
>>                 error_report("could not load initial ram disk '%s'",
>> -                             initrd_filename);
>> +                             machine->initrd_filename);
>>                 exit(1);
>>             }
>> -        } else {
>> -            initrd_base = 0;
>> -            initrd_size = 0;
>> -        }
>> -        env->gpr[4] = initrd_base;
>> -        env->gpr[5] = initrd_size;
>> -        if (kernel_cmdline != NULL) {
>> -            len = strlen(kernel_cmdline);
>> -            bdloc -= ((len + 255) & ~255);
>> -            cpu_physical_memory_write(bdloc, kernel_cmdline, len + 1);
>> -            env->gpr[6] = bdloc;
>> -            env->gpr[7] = bdloc + len;
>> -        } else {
>> -            env->gpr[6] = 0;
>> -            env->gpr[7] = 0;
>>         }
>> -        env->nip = KERNEL_LOAD_ADDR;
>> -    } else {
>> -        kernel_base = 0;
>> -        kernel_size = 0;
>> -        initrd_base = 0;
>> -        initrd_size = 0;
>> -        bdloc = 0;
>> +
>> +    /* Load ELF kernel and rootfs.cpio */
>> +    } else if (kernel_filename && !machine->firmware) {
>> +        boot_from_kernel(machine, cpu);
>>     }
>> }
>>
>>


