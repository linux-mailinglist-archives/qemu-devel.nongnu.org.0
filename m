Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B502E03B7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 02:15:07 +0100 (CET)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krWGX-0000W8-PU
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 20:15:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krWFL-00004t-2c
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 20:13:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krWFI-0006X3-Tg
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 20:13:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A18222BE9
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 01:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608599627;
 bh=MD41xuAh9g3Du+c+u16B1LVZ8FvVmyJLIOgkY7jmkds=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i5cKTK/MNq04vlntPAwknrNz3DiKvKxmL2z8EJnNdCb64wy4gLQu3iXZGaD6/Eepi
 CGDTrHd4jbnsE+4oxInJj9Ht2eaqtP61ip1sm1RLkC9edKwGpn+szfAj2s4dBZPYdJ
 7wRavE583V5vXmhUN38FWLJ9yUXELSLgcAJRk0pWgbBmyOp8JQgQGhAWgFSQUbd79Q
 dO2V1HczylGBUmPuXbpY/q+xUWAZ1bTR7/76j42zaUYgmcmNPS4/S7asdUYo0tRlVg
 rV0VUK4Msy70M4wjQvXNZoyVeiNDHws4QkspZjnUS5027EeO+31lyoOESCGgGT7YBT
 BZLGWi8YK52dw==
Received: by mail-il1-f176.google.com with SMTP id q1so10588519ilt.6
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 17:13:47 -0800 (PST)
X-Gm-Message-State: AOAM530sL8O+RTszVaG8iwZuf2wanQe4evi8vQVGKcrlrbRMQWjX+vtK
 fkbULVKcCE3GAMlDSyXY9mtQ/1ndZrwOUD5yuRU=
X-Google-Smtp-Source: ABdhPJwMZ6asBIuZjLSRfM4326ihTDk48Ej6OWbiB2VLcRfchFv3xAfhq56ykKyYR5Gg/UwGsASPI6+U3EoyPCS21as=
X-Received: by 2002:a05:6e02:1187:: with SMTP id
 y7mr18948664ili.143.1608599626551; 
 Mon, 21 Dec 2020 17:13:46 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-1-jiaxun.yang@flygoat.com>
 <b8418bf5-e7c5-0ae0-9470-7715642bb100@amsat.org>
In-Reply-To: <b8418bf5-e7c5-0ae0-9470-7715642bb100@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 09:13:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7WTs2inBYK1g4hFwPLBkpGAMs1+JnhnRE8uAjXU0ZpTA@mail.gmail.com>
Message-ID: <CAAhV-H7WTs2inBYK1g4hFwPLBkpGAMs1+JnhnRE8uAjXU0ZpTA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/mips/fuloong2e: Add highmem support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Dec 22, 2020 at 4:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/19/20 8:23 AM, Jiaxun Yang wrote:
> > highmem started from 0x20000000.
>
> "started from" -> "starts at"?
>
> > Now we can have up to 2G RAM.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> > v2: Handle SPD for dual DIMM correctly.
> > ---
> >  hw/mips/fuloong2e.c | 61 ++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 49 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> > index 2744b211fd..8a4bebe066 100644
> > --- a/hw/mips/fuloong2e.c
> > +++ b/hw/mips/fuloong2e.c
> > @@ -56,6 +56,7 @@
> >  /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
> >  #define BIOS_SIZE               (512 * KiB)
> >  #define MAX_IDE_BUS             2
> > +#define HIGHMEM_START           0x20000000
> >
> >  /*
> >   * PMON is not part of qemu and released with BSD license, anyone
> > @@ -71,7 +72,8 @@
> >  #define FULOONG2E_RTL8139_SLOT    7
> >
> >  static struct _loaderparams {
> > -    int ram_size;
> > +    int ram_low_size;
> > +    int ram_high_size;
> >      const char *kernel_filename;
> >      const char *kernel_cmdline;
> >      const char *initrd_filename;
> > @@ -128,14 +130,14 @@ static uint64_t load_kernel(MIPSCPU *cpu)
> >          initrd_size =3D get_image_size(loaderparams.initrd_filename);
> >          if (initrd_size > 0) {
> >              initrd_offset =3D ROUND_UP(kernel_high, INITRD_PAGE_SIZE);
> > -            if (initrd_offset + initrd_size > loaderparams.ram_size) {
> > +            if (initrd_offset + initrd_size > loaderparams.ram_low_siz=
e) {
> >                  error_report("memory too small for initial ram disk '%=
s'",
> >                               loaderparams.initrd_filename);
> >                  exit(1);
> >              }
> >              initrd_size =3D load_image_targphys(loaderparams.initrd_fi=
lename,
> >                                                initrd_offset,
> > -                                              loaderparams.ram_size - =
initrd_offset);
> > +                                              loaderparams.ram_low_siz=
e - initrd_offset);
> >          }
> >          if (initrd_size =3D=3D (target_ulong) -1) {
> >              error_report("could not load initial ram disk '%s'",
> > @@ -160,7 +162,11 @@ static uint64_t load_kernel(MIPSCPU *cpu)
> >
> >      /* Setup minimum environment variables */
> >      prom_set(prom_buf, index++, "cpuclock=3D%u", clock_get_hz(cpu->clo=
ck));
> > -    prom_set(prom_buf, index++, "memsize=3D%"PRIi64, loaderparams.ram_=
size / MiB);
> > +    prom_set(prom_buf, index++, "memsize=3D%"PRIi64, loaderparams.ram_=
low_size / MiB);
> > +    if (loaderparams.ram_high_size > 0) {
> > +            prom_set(prom_buf, index++, "highmemsize=3D%"PRIi64,
> > +                    loaderparams.ram_high_size / MiB);
> > +    }
> >      prom_set(prom_buf, index++, NULL);
> >
> >      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> > @@ -186,7 +192,7 @@ static void write_bootloader(CPUMIPSState *env, uin=
t8_t *base,
> >      p =3D (uint32_t *)(base + 0x040);
> >
> >      bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR,
> > -                       ENVP_VADDR + 8, loaderparams.ram_size,
> > +                       ENVP_VADDR + 8, loaderparams.ram_low_size,
> >                         kernel_addr);
> >  }
> >
> > @@ -258,8 +264,11 @@ static void mips_fuloong2e_init(MachineState *mach=
ine)
> >      const char *kernel_filename =3D machine->kernel_filename;
> >      const char *kernel_cmdline =3D machine->kernel_cmdline;
> >      const char *initrd_filename =3D machine->initrd_filename;
> > +    ram_addr_t ram_low_size, ram_high_size =3D 0;
> >      char *filename;
> >      MemoryRegion *address_space_mem =3D get_system_memory();
> > +    MemoryRegion *ram_low_alias =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *ram_high_alias;
> >      MemoryRegion *bios =3D g_new(MemoryRegion, 1);
> >      long bios_size;
> >      uint8_t *spd_data;
> > @@ -282,12 +291,31 @@ static void mips_fuloong2e_init(MachineState *mac=
hine)
> >
> >      qemu_register_reset(main_cpu_reset, cpu);
> >
> > -    /* TODO: support more than 256M RAM as highmem */
> > -    if (machine->ram_size !=3D 256 * MiB) {
> > -        error_report("Invalid RAM size, should be 256MB");
> > +    if (machine->ram_size > 2 * GiB) {
> > +        error_report("Too much memory for this machine: %" PRId64 "MB,=
"
> > +                     " maximum 2048MB", machine->ram_size / MiB);
> >          exit(EXIT_FAILURE);
> >      }
> > -    memory_region_add_subregion(address_space_mem, 0, machine->ram);
> > +
> > +    ram_low_size =3D MIN(machine->ram_size, 256 * MiB);
> > +
> > +    memory_region_init_alias(ram_low_alias, NULL,
> > +                            "ram_low_alias",
> > +                            machine->ram, 0,
> > +                            ram_low_size);
> > +    memory_region_add_subregion(address_space_mem, 0,
> > +                                ram_low_alias);
> > +
> > +    if (machine->ram_size > 256 * MiB) {
> > +        ram_high_alias =3D g_new(MemoryRegion, 1);
> > +        ram_high_size =3D machine->ram_size - ram_low_size;
> > +        memory_region_init_alias(ram_high_alias, NULL,
> > +                                "ram_high_alias",
> > +                                machine->ram, ram_low_size,
> > +                                ram_high_size);
> > +        memory_region_add_subregion(address_space_mem, HIGHMEM_START,
> > +                                    ram_high_alias);
>
> Cool, I've been using the same patch for one year. It works fine with
> a Linux kernel which doesn't change the northbridge mapping. As there
> is no plan for using another bootloader than PMON with this machine,
> that is fine.
>
> > +    }
> >
> >      /* Boot ROM */
> >      memory_region_init_rom(bios, NULL, "fuloong2e.bios", BIOS_SIZE,
> > @@ -300,7 +328,8 @@ static void mips_fuloong2e_init(MachineState *machi=
ne)
> >       */
> >
> >      if (kernel_filename) {
> > -        loaderparams.ram_size =3D machine->ram_size;
> > +        loaderparams.ram_low_size =3D ram_low_size;
> > +        loaderparams.ram_high_size =3D ram_high_size;
> >          loaderparams.kernel_filename =3D kernel_filename;
> >          loaderparams.kernel_cmdline =3D kernel_cmdline;
> >          loaderparams.initrd_filename =3D initrd_filename;
> > @@ -345,8 +374,16 @@ static void mips_fuloong2e_init(MachineState *mach=
ine)
> >      }
> >
> >      /* Populate SPD eeprom data */
> > -    spd_data =3D spd_data_generate(DDR, machine->ram_size);
> > -    smbus_eeprom_init_one(smbus, 0x50, spd_data);
> > +    if (machine->ram_size <=3D 1 * GiB) {
> > +        /* It supports maxium of 1 GiB per DIMM */
>
> Typo "maximum".
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > +        spd_data =3D spd_data_generate(DDR, machine->ram_size);
> > +        smbus_eeprom_init_one(smbus, 0x50, spd_data);
> > +    } else {
> > +        /* Split to dual DIMM for more than 1 GiB  */
> > +        spd_data =3D spd_data_generate(DDR, machine->ram_size / 2);
> > +        smbus_eeprom_init_one(smbus, 0x50, spd_data);
> > +        smbus_eeprom_init_one(smbus, 0x51, spd_data);
> > +    }
> >
> >      mc146818_rtc_init(isa_bus, 2000, NULL);
> >
> >

