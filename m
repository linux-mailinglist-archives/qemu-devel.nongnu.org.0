Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4E32991F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:07:05 +0100 (CET)
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1vk-0000yi-OW
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH1uW-0000QF-JD; Tue, 02 Mar 2021 05:05:49 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH1uT-0003UH-8s; Tue, 02 Mar 2021 05:05:48 -0500
Received: by mail-ed1-x534.google.com with SMTP id w9so8286869edt.13;
 Tue, 02 Mar 2021 02:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lEWk1srvHS1oXCo38cJnH/tpsg5T3yxShygwoawiSR0=;
 b=KzuMLFRGB5kAGU1x7bGrOKNVqesYZ1WXs3nNtipV/aeBhJK9kJApHuUuwpe6skevjr
 2lAWkhETNUSlvKgypB2JAYh7lrAvz7+7TwcxLZCRbuRqwf9QdOaPG4Psb/E1Igijcc27
 VyGbEPsF6U/AQ0a/cd7ZB7LvgyNF/7s4QiJ/J/J1eW8QV2szSC/aTwoIsR+xfDpVWAxQ
 m+kl2cxu+Luyc3m9dgA9TVcJvnkN5PfbIpjxcCHjEhfTGMSCqREF5wsOMkPpfrZegYN6
 sctx4KFiLepGzBbYlVkjHZuXMuhoeYybAKKjzh5pf5J34x7pm+ibQHCCRwJXEryyiGue
 yafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEWk1srvHS1oXCo38cJnH/tpsg5T3yxShygwoawiSR0=;
 b=JeFsjLrbfZ6GG4sjQ6vQ2LarTJX7sBoDD7+07oiyoI6ONahJdbUHqNdnh8AmE/IzXX
 FQwbHABRMMqKC/rQbsLmfYSzbwH4EILn9YzZElWvddKxVVPwENGhN3KypPYWaSOh8IIF
 WlIzslpO40WPwpMpdZzriNFcsaRehzr6bTJmJgsAdQdn4GrPEv7sb6PwAc9I5SJn80b6
 oGvmDxQzCdVDxqeVds9Jlqp4zufmlfSNL1nt53RvsAX7pubbOGSEv66DlZmwrQr6gOlU
 IwqUrpsv5ArcA7we9Nkp5zoCAoS+ddyXOB25zRHBKaqvznzfnq5XmLCCcHN3V9IJdz44
 wLVQ==
X-Gm-Message-State: AOAM530S9f3NCkOJiu+zSxso9zMcr6HfiIxhfVk0Xg/jCVMBGx0qmAO5
 1nrcqO/FZAivW4J2MZwXuAc=
X-Google-Smtp-Source: ABdhPJw0bzN91uVaF9iG1gMEuxQ/gWJ3ZDZSG3TK/cF/iz8PyDH9C+/RIZxrgCWKsmQJhyr1tUUHBg==
X-Received: by 2002:a05:6402:b21:: with SMTP id
 bo1mr19687026edb.368.1614679541561; 
 Tue, 02 Mar 2021 02:05:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id mc2sm14016549ejb.115.2021.03.02.02.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:05:40 -0800 (PST)
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
 <97399e18-3217-40db-5021-702371d196bc@amsat.org>
 <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6143f271-7c42-6db5-26f3-a9754a191cb9@amsat.org>
Date: Tue, 2 Mar 2021 11:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c0403b8b-fee1-11e2-a8d0-2af36f66c9@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:13 AM, BALATON Zoltan wrote:
> On Tue, 2 Mar 2021, Philippe Mathieu-Daudé wrote:
>> On 2/25/21 8:47 PM, BALATON Zoltan wrote:
>>> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
>>> a PowerPC board based on the Marvell MV64361 system controller and the
>>> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
>>> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
>>> image is needed to boot and only MorphOS has a video driver to produce
>>> graphics output. Linux could work too but distros that supported this
>>> machine don't include usual video drivers so those only run with
>>> serial console for now.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  MAINTAINERS                             |  10 ++
>>>  default-configs/devices/ppc-softmmu.mak |   2 +
>>>  hw/ppc/Kconfig                          |  10 ++
>>>  hw/ppc/meson.build                      |   2 +
>>>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>>>  5 files changed, 168 insertions(+)
>>>  create mode 100644 hw/ppc/pegasos2.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 9b2aa18e1f..a023217702 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1345,6 +1345,16 @@ F: pc-bios/canyonlands.dt[sb]
>>>  F: pc-bios/u-boot-sam460ex-20100605.bin
>>>  F: roms/u-boot-sam460ex
>>>
>>> +pegasos2
>>> +M: BALATON Zoltan <balaton@eik.bme.hu>
>>> +R: David Gibson <david@gibson.dropbear.id.au>
>>
>> :)
> 
> He's also listed as reviewer for the sam460ex and I think as the PPC
> maintainer probably should be notified about changes that's why this is
> here. I guess he can complain or submit a patch later if he wants to be
> removed.

To clarify the confusion with this simple smiley, I meant I'm glad
you found someone interested in being reviewer with your board, it
was not a mockery...

> 
>>> +L: qemu-ppc@nongnu.org
>>> +S: Maintained
>>> +F: hw/ppc/pegasos2.c
>>> +F: hw/pci-host/mv64361.c
>>> +F: hw/pci-host/mv643xx.h
>>> +F: include/hw/pci-host/mv64361.h
>>> +
>>>  RISC-V Machines
>>>  ---------------
>>>  OpenTitan
>>> diff --git a/default-configs/devices/ppc-softmmu.mak
>>> b/default-configs/devices/ppc-softmmu.mak
>>> index 61b78b844d..4535993d8d 100644
>>> --- a/default-configs/devices/ppc-softmmu.mak
>>> +++ b/default-configs/devices/ppc-softmmu.mak
>>> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
>>>  CONFIG_MAC_OLDWORLD=y
>>>  CONFIG_MAC_NEWWORLD=y
>>>
>>> +CONFIG_PEGASOS2=y
>>> +
>>>  # For PReP
>>>  CONFIG_PREP=y
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index d11dc30509..98d8dd1a84 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -68,6 +68,16 @@ config SAM460EX
>>>      select USB_OHCI
>>>      select FDT_PPC
>>>
>>> +config PEGASOS2
>>> +    bool
>>> +    select MV64361
>>> +    select VT82C686
>>> +    select IDE_VIA
>>> +    select SMBUS_EEPROM
>>> +# These should come with VT82C686
>>> +    select APM

You might get ride of this one by rebasing/including
https://www.mail-archive.com/qemu-devel@nongnu.org/msg786878.html

>>> +    select ACPI_X86
>>> +
>>>  config PREP
>>>      bool
>>>      imply PCI_DEVICES
>>> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
>>> index 218631c883..86d6f379d1 100644
>>> --- a/hw/ppc/meson.build
>>> +++ b/hw/ppc/meson.build
>>> @@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>>>  ))
>>>  # PowerPC 440 Xilinx ML507 reference board.
>>>  ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
>>> +# Pegasos2
>>> +ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
>>>
>>>  hw_arch += {'ppc': ppc_ss}
>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> new file mode 100644
>>> index 0000000000..427e884fbf
>>> --- /dev/null
>>> +++ b/hw/ppc/pegasos2.c
>>> @@ -0,0 +1,144 @@
>>> +/*
>>> + * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
>>> + *
>>> + * Copyright (c) 2018-2020 BALATON Zoltan
>>
>> 2018-2021
> 
> Not really. I've done this between Christmas of 2018 and 2020. This year
> were only changes for upstreaming and review comments so I preserved the
> dates to record when the actual code was written.
> 
>>> + *
>>> + * This work is licensed under the GNU GPL license version 2 or later.
>>> + *
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu-common.h"
>>> +#include "qemu/units.h"
>>> +#include "qapi/error.h"
>>> +#include "hw/hw.h"
>>> +#include "hw/ppc/ppc.h"
>>> +#include "hw/sysbus.h"
>>> +#include "hw/pci/pci_host.h"
>>> +#include "hw/irq.h"
>>> +#include "hw/pci-host/mv64361.h"
>>> +#include "hw/isa/vt82c686.h"
>>> +#include "hw/ide/pci.h"
>>> +#include "hw/i2c/smbus_eeprom.h"
>>> +#include "hw/qdev-properties.h"
>>> +#include "sysemu/reset.h"
>>> +#include "hw/boards.h"
>>> +#include "hw/loader.h"
>>> +#include "hw/fw-path-provider.h"
>>> +#include "elf.h"
>>> +#include "qemu/log.h"
>>> +#include "qemu/error-report.h"
>>> +#include "sysemu/kvm.h"
>>> +#include "kvm_ppc.h"
>>> +#include "exec/address-spaces.h"
>>> +#include "trace.h"
>>> +#include "qemu/datadir.h"
>>> +#include "sysemu/device_tree.h"
>>> +
>>> +#define PROM_FILENAME "pegasos2.rom"
>>> +#define PROM_ADDR     0xfff00000
>>> +#define PROM_SIZE     0x80000
>>> +
>>> +#define BUS_FREQ 133333333
>>
>> Can you rename as BUS_FREQ_HZ?
>>
>>> +
>>> +static void pegasos2_cpu_reset(void *opaque)
>>> +{
>>> +    PowerPCCPU *cpu = opaque;
>>> +
>>> +    cpu_reset(CPU(cpu));
>>> +    cpu->env.spr[SPR_HID1] = 7ULL << 28;
>>> +}
>>> +
>>> +static void pegasos2_init(MachineState *machine)
>>> +{
>>> +    PowerPCCPU *cpu = NULL;
>>> +    MemoryRegion *rom = g_new(MemoryRegion, 1);
>>> +    DeviceState *mv;
>>> +    PCIBus *pci_bus;
>>> +    PCIDevice *dev;
>>> +    I2CBus *i2c_bus;
>>> +    const char *fwname = machine->firmware ?: PROM_FILENAME;
>>> +    char *filename;
>>> +    int sz;
>>> +    uint8_t *spd_data;
>>> +
>>> +    /* init CPU */
>>> +    cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>>> +    if (PPC_INPUT(&cpu->env) != PPC_FLAGS_INPUT_6xx) {
>>> +        error_report("Incompatible CPU, only 6xx bus supported");
>>> +        exit(1);
>>> +    }
>>> +
>>> +    /* Set time-base frequency */
>>> +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ / 4);
>>> +    qemu_register_reset(pegasos2_cpu_reset, cpu);
>>> +
>>> +    /* RAM */
>>> +    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>>> +
>>> +    /* allocate and load firmware */
>>> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
>>> +    if (!filename) {
>>> +        error_report("Could not find firmware '%s'", fwname);
>>> +        exit(1);
>>> +    }
>>> +    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE,
>>> &error_fatal);
>>> +    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
>>> +    sz = load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL,
>>> NULL, 1,
>>> +                  PPC_ELF_MACHINE, 0, 0);
>>> +    if (sz <= 0) {
>>> +        sz = load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
>>> +    }
>>> +    if (sz <= 0 || sz > PROM_SIZE) {
>>> +        error_report("Could not load firmware '%s'", filename);
>>> +        exit(1);
>>> +    }
>>> +    g_free(filename);
>>> +
>>> +    /* Marvell Discovery II system controller */
>>> +    mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
>>> +                        ((qemu_irq
>>> *)cpu->env.irq_inputs)[PPC6xx_INPUT_INT]));
>>
>> Indent off.
> 
> There's no other way to fit in the 80 chars line length limit in a
> sensible way. (Aligning to DEVICE( would be confusing as last arg
> belongs to sysbus_create_simple().)

You are right, I got confused by sysbus_create_simple() indeed.

> 
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Thanks, I'll do the other changes you've recommended.
> 
> Regards,
> BALATON Zoltan

