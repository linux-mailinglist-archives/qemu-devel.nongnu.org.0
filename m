Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EB697C65
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHKM-0001LP-3B; Wed, 15 Feb 2023 07:56:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHKF-0001L6-UQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:55:55 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHKB-0006Jv-W6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:55:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 f18-20020a7bcd12000000b003e206711347so504305wmj.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Voo8HY6sH6MD6QO1b1bli0kfAbILEXbGphgVnFL/dW4=;
 b=VWqZ0wpNgiz5K2gmV3KpdVxPyJDNZ+aLPJYFX2qILNrP8l6QpCcHgDBJC/XswvGEdF
 1pGUo1ldrV17TAYZRhUCeeyR/o/Hu6T/si9vFYgpyqmi/j4xGvPk+GBwcnG40flvWtN1
 cFb+BZiWM1h1cD49PcGx4ZB08OGs3fVqM5wHNJfZ+Csy1PjbQ2Af+exyzSG3JnjJsSNi
 7K7zk68uo0eDBb4XGcv9hm9nN6L6hqwUZIlZeCJ9FR5YKJwMINERB6TjT/fABIR+GxPT
 oOOqBlCQkv+E5LXvzFi/+jWdpEwSDQyVIyLaghXiM/2Jb5ao07DWE+YfFribF6VnXMJc
 bS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Voo8HY6sH6MD6QO1b1bli0kfAbILEXbGphgVnFL/dW4=;
 b=HjgTUrP90S545+K+sKcwKk8kuC2xkDUHxGxlQG8tEwhojXCr82/jOH6xnGmV7toknx
 N9rBfQBvXmVaRJK1Uqrg76czcoLcPYtTIo3uRdScbHsYx0QhvJaug+8D94G20Gh/toyO
 4wsug1hmBr7p8O1hBVKWqcXW3PJb+24h2NDs/mrGQkVGnL/j09umLX81Ia8XDi2wqr6T
 RuFnfg9DVXW8OYFreid1jG/TPqxtq/FHXzbXRcbGsx05l/U7mG8VCz/DLz5gMBgKFXjq
 s2NbJQ2jZxaKFXuIzS+ba+Fnd2vGOe4aSsXOBdXiZ6dSdebsmseGriQN6wzMOV8bUl3b
 ysnw==
X-Gm-Message-State: AO0yUKW3aV1Lg5UQ/uu0jd/ErdNwdfywnUPUbTHQcQPkpufrwu945h/h
 MFin1EiW7wrPE7XDkT48YTGVAg==
X-Google-Smtp-Source: AK7set8VwaGAXV1WJG0BEGlerberEADl20Ci0MoJCBbm/g4SN0DzOh4R1l+8rLlAFRiZupDEp4EtMw==
X-Received: by 2002:a05:600c:444b:b0:3e1:bfc:d16e with SMTP id
 v11-20020a05600c444b00b003e10bfcd16emr2383339wmn.39.1676465748835; 
 Wed, 15 Feb 2023 04:55:48 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b002c54a2037d1sm13390500wrq.75.2023.02.15.04.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:55:48 -0800 (PST)
Date: Wed, 15 Feb 2023 13:55:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <20230215125547.m375jzjlltb63mzk@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-5-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 08:10:32PM +0530, Sunil V L wrote:
> Add few basic ACPI tables and DSDT with few devices in a
> new file virt-acpi-build.c.
> 
> These are mostly leveraged from arm64.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 285 +++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h    |   1 +
>  2 files changed, 286 insertions(+)
>  create mode 100644 hw/riscv/virt-acpi-build.c
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> new file mode 100644
> index 0000000000..3c4da6c385
> --- /dev/null
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -0,0 +1,285 @@
> +/*
> + * Support for generating ACPI tables and passing them to Guests
> + *
> + * RISC-V virt ACPI generation
> + *
> + * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
> + * Copyright (C) 2006 Fabrice Bellard
> + * Copyright (C) 2013 Red Hat Inc
> + * Copyright (c) 2015 HUAWEI TECHNOLOGIES CO.,LTD.
> + * Copyright (C) 2021-2023 Ventana Micro Systems Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi-defs.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/riscv/virt.h"
> +#include "hw/riscv/numa.h"
> +#include "hw/acpi/pci.h"
> +#include "hw/acpi/utils.h"
> +#include "sysemu/reset.h"
> +#include "hw/pci-host/gpex.h"

We should only bring in includes as needed. Several of these are currently
unused.

> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +
> +#define ACPI_BUILD_TABLE_SIZE             0x20000
> +
> +typedef struct AcpiBuildState {
> +    /* Copy of table in RAM (for patching) */
> +    MemoryRegion *table_mr;
> +    MemoryRegion *rsdp_mr;
> +    MemoryRegion *linker_mr;
> +    /* Is table patched? */
> +    bool patched;
> +} AcpiBuildState;
> +
> +static void acpi_align_size(GArray *blob, unsigned align)
> +{
> +    /*
> +     * Align size to multiple of given size. This reduces the chance
> +     * we need to change size in the future (breaking cross version migration).
> +     */
> +    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
> +}
> +
> +static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> +{
> +    MachineState *ms = MACHINE(s);
> +    uint16_t i;
> +
> +    for (i = 0; i < ms->smp.cpus; i++) {
> +        Aml *dev = aml_device("C%.03X", i);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(scope, dev);
> +    }
> +}
> +
> +static void
> +acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)

Please avoid the use of this style. It's better to wrap parameters, e.g.

static void +acpi_dsdt_add_fw_cfg(Aml *scope,
                                  const MemMapEntry *fw_cfg_memmap)

> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
> +/* FADT */
> +static void
> +build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
> +                RISCVVirtState *s, unsigned dsdt_tbl_offset)
> +{
> +    /* ACPI v5.1 */
> +    AcpiFadtData fadt = {
> +        .rev = 6,
> +        .minor_ver = 0,

Comment above says ACPI v5.1, but here it uses 6.0. I'd just drop the
comment.

> +        .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
> +        .xdsdt_tbl_offset = &dsdt_tbl_offset,
> +    };
> +
> +    build_fadt(table_data, linker, &fadt, s->oem_id, s->oem_table_id);
> +}
> +
> +/* DSDT */
> +static void
> +build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
> +{
> +    Aml *scope, *dsdt;
> +    const MemMapEntry *memmap = s->memmap;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
> +                        .oem_table_id = s->oem_table_id };
> +
> +
> +    acpi_table_begin(&table, table_data);
> +    dsdt = init_aml_allocator();
> +
> +    /*
> +     * When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> +     * While UEFI can use libfdt to disable the RTC device node in the DTB that
> +     * it passes to the OS, it cannot modify AML. Therefore, we won't generate
> +     * the RTC ACPI device at all when using UEFI.
> +     */
> +    scope = aml_scope("\\_SB");
> +    acpi_dsdt_add_cpus(scope, s);
> +
> +    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +
> +    aml_append(dsdt, scope);
> +
> +    /* copy AML table into ACPI tables blob and patch header there */
> +    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> +
> +    acpi_table_end(linker, &table);
> +    free_aml_allocator();
> +}
> +
> +static void
> +virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
> +{
> +    GArray *table_offsets;
> +    unsigned dsdt, xsdt;
> +    GArray *tables_blob = tables->table_data;
> +
> +    table_offsets = g_array_new(false, true,
> +                                sizeof(uint32_t));
> +
> +    bios_linker_loader_alloc(tables->linker,
> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
> +                             64, false);
> +
> +    /* DSDT is pointed to by FADT */
> +    dsdt = tables_blob->len;
> +    build_dsdt(tables_blob, tables->linker, s);
> +
> +    /* FADT and others pointed to by RSDT */
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, s);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_rhct(tables_blob, tables->linker, s);
> +
> +    /* XSDT is pointed to by RSDP */
> +    xsdt = tables_blob->len;
> +    build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> +                s->oem_table_id);
> +
> +    /* RSDP is in FSEG memory, so allocate it separately */
> +    {
> +        AcpiRsdpData rsdp_data = {
> +            .revision = 2,
> +            .oem_id = s->oem_id,
> +            .xsdt_tbl_offset = &xsdt,
> +            .rsdt_tbl_offset = NULL,
> +        };
> +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
> +    }
> +
> +    /*
> +     * The align size is 128, warn if 64k is not enough therefore
> +     * the align size could be resized.
> +     */
> +    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
> +        warn_report("ACPI table size %u exceeds %d bytes,"
> +                    " migration may not work",
> +                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
> +        error_printf("Try removing CPUs, NUMA nodes, memory slots"
> +                     " or PCI bridges.");

This error mentions things for which we don't currently generate tables.

> +    }
> +    acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> +
> +
> +    /* Clean up memory that's no longer used */
> +    g_array_free(table_offsets, true);
> +}
> +
> +static void acpi_ram_update(MemoryRegion *mr, GArray *data)
> +{
> +    uint32_t size = acpi_data_len(data);
> +
> +    /*
> +     * Make sure RAM size is correct - in case it got changed
> +     * e.g. by migration
> +     */
> +    memory_region_ram_resize(mr, size, &error_abort);
> +
> +    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
> +    memory_region_set_dirty(mr, 0, size);
> +}
> +
> +static void virt_acpi_build_update(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    AcpiBuildTables tables;
> +
> +    /* No state to update or already patched? Nothing to do. */
> +    if (!build_state || build_state->patched) {
> +        return;
> +    }
> +    build_state->patched = true;
> +
> +    acpi_build_tables_init(&tables);
> +
> +    virt_acpi_build(RISCV_VIRT_MACHINE(qdev_get_machine()), &tables);
> +
> +    acpi_ram_update(build_state->table_mr, tables.table_data);
> +    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> +    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
> +
> +    acpi_build_tables_cleanup(&tables, true);
> +}
> +
> +static void virt_acpi_build_reset(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    build_state->patched = false;
> +}
> +
> +static const VMStateDescription vmstate_virt_acpi_build = {
> +    .name = "virt_acpi_build",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(patched, AcpiBuildState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +void virt_acpi_setup(RISCVVirtState *s)
> +{
> +    AcpiBuildTables tables;
> +    AcpiBuildState *build_state;
> +
> +    build_state = g_malloc0(sizeof *build_state);
> +
> +    acpi_build_tables_init(&tables);
> +    virt_acpi_build(s, &tables);
> +
> +    /* Now expose it all to Guest */
> +    build_state->table_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE);
> +    assert(build_state->table_mr != NULL);
> +
> +    build_state->linker_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                               build_state,
> +                                               tables.linker->cmd_blob,
> +                                               ACPI_BUILD_LOADER_FILE);
> +
> +    build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> +                                             build_state, tables.rsdp,
> +                                             ACPI_BUILD_RSDP_FILE);
> +
> +    qemu_register_reset(virt_acpi_build_reset, build_state);
> +    virt_acpi_build_reset(build_state);
> +    vmstate_register(NULL, 0, &vmstate_virt_acpi_build, build_state);
> +
> +    /*
> +     * Clean up tables but don't free the memory: we track it
> +     * in build_state.
> +     */
> +    acpi_build_tables_cleanup(&tables, false);
> +}
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 379501edcc..e5c474b26e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -126,4 +126,5 @@ enum {
>                                   1 + FDT_APLIC_INT_CELLS)
>  
>  bool virt_is_acpi_enabled(RISCVVirtState *s);
> +void virt_acpi_setup(RISCVVirtState *vms);
>  #endif
> -- 
> 2.34.1
>

Thanks,
drew

