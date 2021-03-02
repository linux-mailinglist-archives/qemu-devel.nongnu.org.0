Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EC33296BD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:02:04 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzyl-0004uv-7v
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzwm-0003Xk-AG; Tue, 02 Mar 2021 03:00:00 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGzwk-0000m0-H2; Tue, 02 Mar 2021 03:00:00 -0500
Received: by mail-ej1-x62d.google.com with SMTP id hs11so33449618ejc.1;
 Mon, 01 Mar 2021 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jm/7+MyB22l8NN0cguFJZb6BBfoCHKCy2Ec8+rYPRBE=;
 b=AikATxkFg7ENTdR8qGsHwgMnHW+uYCKxmm+O17DTmKHLpMh+RcvdKqJt40tz2XocY6
 t5FJtZtEoQ8u8tKBK1PRbo6CddyWvw+hoy3nnKxtgzpWOWeZk0RXYrTrexFDk8ie51Cv
 dfAO5SGqtOp0+LtmgMnkWgAOz1ufsbGaCq8NVlGdsnjlm8dQLckHI8FuIk+iYFv/IZJa
 XFfhAQTFhuvXStxcpXfXFlcutd2DdI9P47MQd+/Q4YUGqm60rO8NywL3kQKOBa0od6oJ
 fG8Gz5WRk2OeoRumYGfJA2qzNINyxqCd6+H2CCZR/w+y0kbtkZUHPzTubJkp48TEwr2R
 jYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jm/7+MyB22l8NN0cguFJZb6BBfoCHKCy2Ec8+rYPRBE=;
 b=rBQdK2H0qSRtopEMYCsktcUEjN4vWevYs4Ce0Sm5M1oAPmRBlfvP6xVrLa2Bb1Zuzs
 wnAQfIKrWK4jiemk9Z3QS0ISflFmquY542EPK4Q0dO0fWDcNI158XVQlKfX06PZTdWhq
 9Kh7ZIuvlubNMYaUU6FEL//PuFXHlbzjZL7pbjCVqA3Qpje0oh52Jo7p/EuMUbNMq5+Y
 cRZWZ1NoVqqOLjTbvn+e4Rko27Cb6joIJHO+pXax3HrvtnegFvnqBjNq2dWvj0TR0lWy
 yRAqNdQk1h61t4ZS5Bb4Ho5Auc80r4zrzR0iqsNuXlvYlORIT4v9rVGYsR5o+dSmzrHA
 jZvA==
X-Gm-Message-State: AOAM532kHJNdUw5pdgGCNGcMPDygcRdncn7hENu3THw/mTCOvO9bB2+w
 XPMuwTRaRoX5kIhjoQ8pGx8UCwrvX3A=
X-Google-Smtp-Source: ABdhPJwtuk/A7lhCT7TtkKup5xGzRHUoM3qp3YbtrGJMQoMiElhxW5u58phhBts6T/0zW1g3jEPygA==
X-Received: by 2002:a17:906:f912:: with SMTP id
 lc18mr18366547ejb.159.1614671996934; 
 Mon, 01 Mar 2021 23:59:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q22sm17301356ejy.5.2021.03.01.23.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:59:56 -0800 (PST)
Subject: Re: [PATCH v4 6/6] hw/ppc: Add emulation of Genesi/bPlan Pegasos II
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97399e18-3217-40db-5021-702371d196bc@amsat.org>
Date: Tue, 2 Mar 2021 08:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <848089b1c91e0c28eb7c52ccdc55dc870eb49dc0.1614282457.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 8:47 PM, BALATON Zoltan wrote:
> Add new machine called pegasos2 emulating the Genesi/bPlan Pegasos II,
> a PowerPC board based on the Marvell MV64361 system controller and the
> VIA VT8231 integrated south bridge/superio chips. It can run Linux,
> AmigaOS and a wide range of MorphOS versions. Currently a firmware ROM
> image is needed to boot and only MorphOS has a video driver to produce
> graphics output. Linux could work too but distros that supported this
> machine don't include usual video drivers so those only run with
> serial console for now.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  MAINTAINERS                             |  10 ++
>  default-configs/devices/ppc-softmmu.mak |   2 +
>  hw/ppc/Kconfig                          |  10 ++
>  hw/ppc/meson.build                      |   2 +
>  hw/ppc/pegasos2.c                       | 144 ++++++++++++++++++++++++
>  5 files changed, 168 insertions(+)
>  create mode 100644 hw/ppc/pegasos2.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..a023217702 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1345,6 +1345,16 @@ F: pc-bios/canyonlands.dt[sb]
>  F: pc-bios/u-boot-sam460ex-20100605.bin
>  F: roms/u-boot-sam460ex
>  
> +pegasos2
> +M: BALATON Zoltan <balaton@eik.bme.hu>
> +R: David Gibson <david@gibson.dropbear.id.au>

:)

> +L: qemu-ppc@nongnu.org
> +S: Maintained
> +F: hw/ppc/pegasos2.c
> +F: hw/pci-host/mv64361.c
> +F: hw/pci-host/mv643xx.h
> +F: include/hw/pci-host/mv64361.h
> +
>  RISC-V Machines
>  ---------------
>  OpenTitan
> diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
> index 61b78b844d..4535993d8d 100644
> --- a/default-configs/devices/ppc-softmmu.mak
> +++ b/default-configs/devices/ppc-softmmu.mak
> @@ -14,5 +14,7 @@ CONFIG_SAM460EX=y
>  CONFIG_MAC_OLDWORLD=y
>  CONFIG_MAC_NEWWORLD=y
>  
> +CONFIG_PEGASOS2=y
> +
>  # For PReP
>  CONFIG_PREP=y
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index d11dc30509..98d8dd1a84 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -68,6 +68,16 @@ config SAM460EX
>      select USB_OHCI
>      select FDT_PPC
>  
> +config PEGASOS2
> +    bool
> +    select MV64361
> +    select VT82C686
> +    select IDE_VIA
> +    select SMBUS_EEPROM
> +# These should come with VT82C686
> +    select APM
> +    select ACPI_X86
> +
>  config PREP
>      bool
>      imply PCI_DEVICES
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 218631c883..86d6f379d1 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -78,5 +78,7 @@ ppc_ss.add(when: 'CONFIG_E500', if_true: files(
>  ))
>  # PowerPC 440 Xilinx ML507 reference board.
>  ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
> +# Pegasos2
> +ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
>  
>  hw_arch += {'ppc': ppc_ss}
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> new file mode 100644
> index 0000000000..427e884fbf
> --- /dev/null
> +++ b/hw/ppc/pegasos2.c
> @@ -0,0 +1,144 @@
> +/*
> + * QEMU PowerPC CHRP (Genesi/bPlan Pegasos II) hardware System Emulator
> + *
> + * Copyright (c) 2018-2020 BALATON Zoltan

2018-2021

> + *
> + * This work is licensed under the GNU GPL license version 2 or later.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/units.h"
> +#include "qapi/error.h"
> +#include "hw/hw.h"
> +#include "hw/ppc/ppc.h"
> +#include "hw/sysbus.h"
> +#include "hw/pci/pci_host.h"
> +#include "hw/irq.h"
> +#include "hw/pci-host/mv64361.h"
> +#include "hw/isa/vt82c686.h"
> +#include "hw/ide/pci.h"
> +#include "hw/i2c/smbus_eeprom.h"
> +#include "hw/qdev-properties.h"
> +#include "sysemu/reset.h"
> +#include "hw/boards.h"
> +#include "hw/loader.h"
> +#include "hw/fw-path-provider.h"
> +#include "elf.h"
> +#include "qemu/log.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_ppc.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +#include "qemu/datadir.h"
> +#include "sysemu/device_tree.h"
> +
> +#define PROM_FILENAME "pegasos2.rom"
> +#define PROM_ADDR     0xfff00000
> +#define PROM_SIZE     0x80000
> +
> +#define BUS_FREQ 133333333

Can you rename as BUS_FREQ_HZ?

> +
> +static void pegasos2_cpu_reset(void *opaque)
> +{
> +    PowerPCCPU *cpu = opaque;
> +
> +    cpu_reset(CPU(cpu));
> +    cpu->env.spr[SPR_HID1] = 7ULL << 28;
> +}
> +
> +static void pegasos2_init(MachineState *machine)
> +{
> +    PowerPCCPU *cpu = NULL;
> +    MemoryRegion *rom = g_new(MemoryRegion, 1);
> +    DeviceState *mv;
> +    PCIBus *pci_bus;
> +    PCIDevice *dev;
> +    I2CBus *i2c_bus;
> +    const char *fwname = machine->firmware ?: PROM_FILENAME;
> +    char *filename;
> +    int sz;
> +    uint8_t *spd_data;
> +
> +    /* init CPU */
> +    cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> +    if (PPC_INPUT(&cpu->env) != PPC_FLAGS_INPUT_6xx) {
> +        error_report("Incompatible CPU, only 6xx bus supported");
> +        exit(1);
> +    }
> +
> +    /* Set time-base frequency */
> +    cpu_ppc_tb_init(&cpu->env, BUS_FREQ / 4);
> +    qemu_register_reset(pegasos2_cpu_reset, cpu);
> +
> +    /* RAM */
> +    memory_region_add_subregion(get_system_memory(), 0, machine->ram);
> +
> +    /* allocate and load firmware */
> +    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, fwname);
> +    if (!filename) {
> +        error_report("Could not find firmware '%s'", fwname);
> +        exit(1);
> +    }
> +    memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
> +    sz = load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1,
> +                  PPC_ELF_MACHINE, 0, 0);
> +    if (sz <= 0) {
> +        sz = load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
> +    }
> +    if (sz <= 0 || sz > PROM_SIZE) {
> +        error_report("Could not load firmware '%s'", filename);
> +        exit(1);
> +    }
> +    g_free(filename);
> +
> +    /* Marvell Discovery II system controller */
> +    mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> +                        ((qemu_irq *)cpu->env.irq_inputs)[PPC6xx_INPUT_INT]));

Indent off.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

