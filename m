Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943A201C83
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 22:36:13 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmNkC-0002ng-5l
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 16:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jmNiO-0002JR-J6
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 16:34:20 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1jmNiL-0005Ve-II
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 16:34:20 -0400
Received: by mail-wm1-x341.google.com with SMTP id x16so440348wmj.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atX4GcyBsxPsCBx6uD7/gdUJoTBXJqpSzHLj2rWdkUo=;
 b=OJ6OK/lF3z0kKhTGWp/fpCWOFUxVOyL+YeB25SdAJqLWRupzZtUA8RchLoLdbcF6nQ
 ZJ/FPmpH48ps2RDWQNH0gsjsMdbuNlY0MfBsqoDmRqZdCLipQEyOKUUrpuWPSGMMbI+H
 FKGaj7OeTsOTLzTHf8ZAxRtdQ4YBcPCK4zU4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atX4GcyBsxPsCBx6uD7/gdUJoTBXJqpSzHLj2rWdkUo=;
 b=OCrY4862Ny0iftG3nM2ovSf3IOjZY+zESV8MbJ9Y0ZDcc28+kwMgiRFxaedo1JRDwY
 VdzFPYWI8h5POex4jJhlAtbt1/z3hwPiaZeRFeCjCPcT2jmizEIPRTGIKip26VOVrNpK
 qY3rhSgDLguGwClgMfiG9JKoErOnSSvHCyVWQ4N9z2oqgCKYfYVGyBDLxsd2nhngVTBq
 2xG7Ukje/BaKBXeXrPRddxsjKlbhR5NVPIij32/RuHV7PyYRMVLuvJaC4opLcmQ/Tl9P
 qHKNXCvoAuJuogipC8M9hFLcLtYgBft5iwsTzanUx2uyybLVkTstGqwTqZEx+sBXN8L9
 0qVw==
X-Gm-Message-State: AOAM531E152TviGpgNCSIkS7h+sTiyjJSf7GAc+a2ohg5RabVoXbGZ8q
 cabhkfNWt1QwcQIq0CjPdZ4OQGw3rrPPLPtovnIZ
X-Google-Smtp-Source: ABdhPJw9zUP8vMR2dNRxqBeWwSekQ5xgi9Iv/GNEIPbbbhTWA/uLG9Y6i9ivNrHLHRXkJG+JkKlyL+XpLQHp3Y6gb1g=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr5406692wmj.186.1592598854561; 
 Fri, 19 Jun 2020 13:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200616192700.1900260-1-atish.patra@wdc.com>
 <20200616192700.1900260-2-atish.patra@wdc.com>
 <CAEeofcjkjBHwQx_pRPG1GSfkg5KHc6UqfEEmu_14sJmgVfqG7w@mail.gmail.com>
In-Reply-To: <CAEeofcjkjBHwQx_pRPG1GSfkg5KHc6UqfEEmu_14sJmgVfqG7w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 19 Jun 2020 13:34:03 -0700
Message-ID: <CAOnJCUKHXrK2LPu996UcG8Hc2o-DDARtzsqUrK0QodWgjgCqLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: Unify Qemu's reset vector code path
To: Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=atishp@atishpatra.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 10:11 AM Alexander Richardson
<Alexander.Richardson@cl.cam.ac.uk> wrote:
>
> On Tue, 16 Jun 2020 at 20:30, Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Currently, all riscv machines have identical reset vector code
> > implementations with memory addresses being different for all machines.
> > They can be easily combined into a single function in common code.
> >
> > Move it to common function and let all the machines use the common function.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  hw/riscv/boot.c         | 46 +++++++++++++++++++++++++++++++++++++++++
> >  hw/riscv/sifive_u.c     | 38 +++-------------------------------
> >  hw/riscv/spike.c        | 38 +++-------------------------------
> >  hw/riscv/virt.c         | 37 +++------------------------------
> >  include/hw/riscv/boot.h |  2 ++
> >  5 files changed, 57 insertions(+), 104 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index adb421b91b68..8ed96da600c9 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -22,12 +22,16 @@
> >  #include "qemu/units.h"
> >  #include "qemu/error-report.h"
> >  #include "exec/cpu-defs.h"
> > +#include "exec/address-spaces.h"
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> >  #include "hw/riscv/boot.h"
> >  #include "elf.h"
> > +#include "sysemu/device_tree.h"
> >  #include "sysemu/qtest.h"
> >
> > +#include <libfdt.h>
> > +
> >  #if defined(TARGET_RISCV32)
> >  # define KERNEL_BOOT_ADDRESS 0x80400000
> >  #else
> > @@ -155,3 +159,45 @@ hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
> >
> >      return *start + size;
> >  }
> > +
> > +void riscv_setup_rom_reset_vec(hwaddr start_addr, hwaddr rom_base,
> > +                               hwaddr rom_size, void *fdt)
> > +{
> > +    int i;
> > +    /* reset vector */
> > +    uint32_t reset_vec[8] = {
> > +        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
> > +        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
> > +        0xf1402573,                  /*     csrr   a0, mhartid  */
> > +#if defined(TARGET_RISCV32)
> > +        0x0182a283,                  /*     lw     t0, 24(t0) */
> > +#elif defined(TARGET_RISCV64)
> > +        0x0182b283,                  /*     ld     t0, 24(t0) */
> > +#endif
> > +        0x00028067,                  /*     jr     t0 */
> > +        0x00000000,
> > +        start_addr,                  /* start: .dword */
> > +        0x00000000,
> > +                                     /* dtb: */
> > +    };
> > +
> > +    /* copy in the reset vector in little_endian byte order */
> > +    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > +        reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > +    }
> Maybe use ARRAY_SIZE(reset_vec) instead of sizeof(reset_vec) >> 2 ?
>

Yeah. That's better. Thanks.

> > +    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
> > +                          rom_base, &address_space_memory);
> > +
> > +    /* copy in the device tree */
> > +    if (fdt_pack(fdt) || fdt_totalsize(fdt) >
> > +        rom_size - sizeof(reset_vec)) {
> > +        error_report("not enough space to store device-tree");
> > +        exit(1);
> > +    }
> > +    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> > +    rom_add_blob_fixed_as("mrom.fdt", fdt, fdt_totalsize(fdt),
> > +                           rom_base + sizeof(reset_vec),
> > +                           &address_space_memory);
> > +
> > +    return;
> > +}
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index f9fef2be9170..c2712570e0d9 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -325,7 +325,6 @@ static void sifive_u_machine_init(MachineState *machine)
> >      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> >      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
> >      target_ulong start_addr = memmap[SIFIVE_U_DRAM].base;
> > -    int i;
> >
> >      /* Initialize SoC */
> >      object_initialize_child(OBJECT(machine), "soc", &s->soc,
> > @@ -374,40 +373,9 @@ static void sifive_u_machine_init(MachineState *machine)
> >          start_addr = memmap[SIFIVE_U_FLASH0].base;
> >      }
> >
> > -    /* reset vector */
> > -    uint32_t reset_vec[8] = {
> > -        0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(dtb) */
> > -        0x02028593,                    /*     addi   a1, t0, %pcrel_lo(1b) */
> > -        0xf1402573,                    /*     csrr   a0, mhartid  */
> > -#if defined(TARGET_RISCV32)
> > -        0x0182a283,                    /*     lw     t0, 24(t0) */
> > -#elif defined(TARGET_RISCV64)
> > -        0x0182b283,                    /*     ld     t0, 24(t0) */
> > -#endif
> > -        0x00028067,                    /*     jr     t0 */
> > -        0x00000000,
> > -        start_addr,                    /* start: .dword */
> > -        0x00000000,
> > -                                       /* dtb: */
> > -    };
> > -
> > -    /* copy in the reset vector in little_endian byte order */
> > -    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > -        reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > -    }
> > -    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
> > -                          memmap[SIFIVE_U_MROM].base, &address_space_memory);
> > -
> > -    /* copy in the device tree */
> > -    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
> > -            memmap[SIFIVE_U_MROM].size - sizeof(reset_vec)) {
> > -        error_report("not enough space to store device-tree");
> > -        exit(1);
> > -    }
> > -    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
> > -    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
> > -                          memmap[SIFIVE_U_MROM].base + sizeof(reset_vec),
> > -                          &address_space_memory);
> > +    /* load the reset vector */
> > +    riscv_setup_rom_reset_vec(start_addr, memmap[SIFIVE_U_MROM].base,
> > +                              memmap[SIFIVE_U_MROM].size, s->fdt);
> >  }
> >
> >  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
> > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > index 7bbbdb50363d..238eae48716a 100644
> > --- a/hw/riscv/spike.c
> > +++ b/hw/riscv/spike.c
> > @@ -165,7 +165,6 @@ static void spike_board_init(MachineState *machine)
> >      MemoryRegion *system_memory = get_system_memory();
> >      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> >      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
> > -    int i;
> >      unsigned int smp_cpus = machine->smp.cpus;
> >
> >      /* Initialize SOC */
> > @@ -213,40 +212,9 @@ static void spike_board_init(MachineState *machine)
> >          }
> >      }
> >
> > -    /* reset vector */
> > -    uint32_t reset_vec[8] = {
> > -        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
> > -        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
> > -        0xf1402573,                  /*     csrr   a0, mhartid  */
> > -#if defined(TARGET_RISCV32)
> > -        0x0182a283,                  /*     lw     t0, 24(t0) */
> > -#elif defined(TARGET_RISCV64)
> > -        0x0182b283,                  /*     ld     t0, 24(t0) */
> > -#endif
> > -        0x00028067,                  /*     jr     t0 */
> > -        0x00000000,
> > -        memmap[SPIKE_DRAM].base,     /* start: .dword DRAM_BASE */
> > -        0x00000000,
> > -                                     /* dtb: */
> > -    };
> > -
> > -    /* copy in the reset vector in little_endian byte order */
> > -    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > -        reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > -    }
> > -    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
> > -                          memmap[SPIKE_MROM].base, &address_space_memory);
> > -
> > -    /* copy in the device tree */
> > -    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
> > -            memmap[SPIKE_MROM].size - sizeof(reset_vec)) {
> > -        error_report("not enough space to store device-tree");
> > -        exit(1);
> > -    }
> > -    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
> > -    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
> > -                          memmap[SPIKE_MROM].base + sizeof(reset_vec),
> > -                          &address_space_memory);
> > +    /* load the reset vector */
> > +    riscv_setup_rom_reset_vec(memmap[SPIKE_DRAM].base, memmap[SPIKE_MROM].base,
> > +                              memmap[SPIKE_MROM].size, s->fdt);
> >
> >      /* initialize HTIF using symbols found in load_kernel */
> >      htif_mm_init(system_memory, mask_rom, &s->soc.harts[0].env, serial_hd(0));
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4e4c494a7050..a8e2d58cc067 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -536,40 +536,9 @@ static void virt_machine_init(MachineState *machine)
> >          start_addr = virt_memmap[VIRT_FLASH].base;
> >      }
> >
> > -    /* reset vector */
> > -    uint32_t reset_vec[8] = {
> > -        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) */
> > -        0x02028593,                  /*     addi   a1, t0, %pcrel_lo(1b) */
> > -        0xf1402573,                  /*     csrr   a0, mhartid  */
> > -#if defined(TARGET_RISCV32)
> > -        0x0182a283,                  /*     lw     t0, 24(t0) */
> > -#elif defined(TARGET_RISCV64)
> > -        0x0182b283,                  /*     ld     t0, 24(t0) */
> > -#endif
> > -        0x00028067,                  /*     jr     t0 */
> > -        0x00000000,
> > -        start_addr,                  /* start: .dword */
> > -        0x00000000,
> > -                                     /* dtb: */
> > -    };
> > -
> > -    /* copy in the reset vector in little_endian byte order */
> > -    for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
> > -        reset_vec[i] = cpu_to_le32(reset_vec[i]);
> > -    }
> > -    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
> > -                          memmap[VIRT_MROM].base, &address_space_memory);
> > -
> > -    /* copy in the device tree */
> > -    if (fdt_pack(s->fdt) || fdt_totalsize(s->fdt) >
> > -            memmap[VIRT_MROM].size - sizeof(reset_vec)) {
> > -        error_report("not enough space to store device-tree");
> > -        exit(1);
> > -    }
> > -    qemu_fdt_dumpdtb(s->fdt, fdt_totalsize(s->fdt));
> > -    rom_add_blob_fixed_as("mrom.fdt", s->fdt, fdt_totalsize(s->fdt),
> > -                          memmap[VIRT_MROM].base + sizeof(reset_vec),
> > -                          &address_space_memory);
> > +    /* load the reset vector */
> > +    riscv_setup_rom_reset_vec(start_addr, virt_memmap[VIRT_MROM].base,
> > +                              virt_memmap[VIRT_MROM].size, s->fdt);
> >
> >      /* create PLIC hart topology configuration string */
> >      plic_hart_config_len = (strlen(VIRT_PLIC_HART_CONFIG) + 1) * smp_cpus;
> > diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> > index 9daa98da08d7..3e9759c89aa2 100644
> > --- a/include/hw/riscv/boot.h
> > +++ b/include/hw/riscv/boot.h
> > @@ -35,5 +35,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
> >                                 symbol_fn_t sym_cb);
> >  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
> >                           uint64_t kernel_entry, hwaddr *start);
> > +void riscv_setup_rom_reset_vec(hwaddr saddr, hwaddr rom_base,
> > +                               hwaddr rom_size, void *fdt);
> >
> >  #endif /* RISCV_BOOT_H */
> > --
> > 2.26.2
> >
> >
>


-- 
Regards,
Atish

