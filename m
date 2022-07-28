Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDE58415F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:34:10 +0200 (CEST)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4aW-0006YX-71
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH46f-0003NX-GS
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH46a-0005XD-Sb
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659016991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bp9MI9TKd+Ng568dne52yZ2870kOeeZ21RNHjNYdSfM=;
 b=SJvPVD/uT0ogaIQ+/vb73hMwZWhNOV4TMkolfIBeoW1ZQA3fIpplAtoDwfZl5HVJI31IGs
 BCYPn4ECbD+66ilIB1efuovqFvJ8Ao/pZ5ZgoxsY39VgYmj533impEiql42Mb+s+ExYezw
 qZJr7e1cJtgAr5KdzIGTpWreC6fq3lU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-m4IFGxh-P66SyHeBj-EQYw-1; Thu, 28 Jul 2022 10:03:10 -0400
X-MC-Unique: m4IFGxh-P66SyHeBj-EQYw-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz20-20020a0564021d5400b0043be2c5cd32so1171860edb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 07:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bp9MI9TKd+Ng568dne52yZ2870kOeeZ21RNHjNYdSfM=;
 b=1SzJWLgcRAViJWMBSFiqusC7lTp8TaOfD+irwBJ/k9G1lEzXsjKjeD34sMd6Y5FTbn
 mysyFiAPBethxWfrDAPPF+7Qn6Jq5VkLwr/cRzGNKNaDsI07PxP4QH1HrDPVE/kKITSo
 NAKDTrCldxa3n9wUwt0uk7vbgn+mNQBh1iA1s2xzq4lClqH/HCkKoZl3r+2cp8+4LmPF
 JOfjfYVH7jC33H6psc4rCQ30ouaCzh2OoEEOam18++pWBf9KYYUAs/RHLfRA8PqoSCZy
 5yDWSxM8lx5tZr9xdGTZ4wL5Czeq4tNwHOIzfxPyCPstuj69GInStjjwxBCC+enpseHo
 LK8A==
X-Gm-Message-State: AJIora8F6bNCouRVZ4Bu5QBkmQkqMefpaRfaqs6B3GWC1RWcIVgDJDbs
 Y2J7vCcrUWnRq4gI275gKVn7Xr5tMTPak2RGQS4jFoldcDmH1U+iJDDR4mrMzDi7ZxPivWRNiRz
 2ABE5C5fM4gVEQqs=
X-Received: by 2002:a17:907:9483:b0:72f:6e4f:f54c with SMTP id
 dm3-20020a170907948300b0072f6e4ff54cmr21435587ejc.471.1659016989132; 
 Thu, 28 Jul 2022 07:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tF52kLy4mBDYI67GTsysVAEdUKJf0uXGrxHsQy+6tUzVzNpdVM716GncMvMkJ8HN/yfoGA1g==
X-Received: by 2002:a17:907:9483:b0:72f:6e4f:f54c with SMTP id
 dm3-20020a170907948300b0072f6e4ff54cmr21435547ejc.471.1659016988539; 
 Thu, 28 Jul 2022 07:03:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906200900b006fe8a4ec62fsm455835ejo.4.2022.07.28.07.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 07:03:08 -0700 (PDT)
Date: Thu, 28 Jul 2022 16:03:07 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: Re: [PATCH 5/6] hw/loongarch: Add acpi ged support
Message-ID: <20220728160307.4fcc3ce0@redhat.com>
In-Reply-To: <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 12 Jul 2022 16:32:05 +0800
Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:

> Loongarch virt machine uses general hardware reduces acpi method, rather
> than LS7A acpi device. Now only power management function is used in
> acpi ged device, memory hotplug will be added later. Also acpi tables
> such as RSDP/RSDT/FADT etc.
> 
> The acpi table has submited to acpi spec, and will release soon.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>  hw/loongarch/Kconfig        |   2 +
>  hw/loongarch/acpi-build.c   | 609 ++++++++++++++++++++++++++++++++++++
>  hw/loongarch/loongson3.c    |  78 ++++-
>  hw/loongarch/meson.build    |   1 +
>  include/hw/loongarch/virt.h |  13 +
>  include/hw/pci-host/ls7a.h  |   4 +
>  6 files changed, 704 insertions(+), 3 deletions(-)
>  create mode 100644 hw/loongarch/acpi-build.c
> 
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 610552e522..a99aa387c3 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -15,3 +15,5 @@ config LOONGARCH_VIRT
>      select LOONGARCH_EXTIOI
>      select LS7A_RTC
>      select SMBIOS
> +    select ACPI_PCI
> +    select ACPI_HW_REDUCED
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> new file mode 100644
> index 0000000000..b95b83b079
> --- /dev/null
> +++ b/hw/loongarch/acpi-build.c
[...]


Most of the following code copied from x86 which is needlessly
complicated for loongarch wich doesn't have all that legacy to care about,
see ARM's variant virt_acpi_setup() for a cleaner example and
drop not needed parts.

> +static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> +{
> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
> +    GArray *table_offsets;
> +    AcpiFadtData fadt_data;
> +    unsigned facs, rsdt, fadt, dsdt;
> +    uint8_t *u;
> +    size_t aml_len = 0;
> +    GArray *tables_blob = tables->table_data;
> +
> +    init_common_fadt_data(&fadt_data);
> +
> +    table_offsets = g_array_new(false, true, sizeof(uint32_t));
> +    ACPI_BUILD_DPRINTF("init ACPI tables\n");
> +
> +    bios_linker_loader_alloc(tables->linker,
> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
> +                             64, false);
> +
> +    /*
> +     * FACS is pointed to by FADT.
> +     * We place it first since it's the only table that has alignment
> +     * requirements.
> +     */
> +    facs = tables_blob->len;
> +    build_facs(tables_blob);
> +
> +    /* DSDT is pointed to by FADT */
> +    dsdt = tables_blob->len;
> +    build_dsdt(tables_blob, tables->linker, machine);
> +
> +    /*
> +     * Count the size of the DSDT, we will need it for
> +     * legacy sizing of ACPI tables.
> +     */
> +    aml_len += tables_blob->len - dsdt;
> +
> +    /* ACPI tables pointed to by RSDT */
> +    fadt = tables_blob->len;
> +    acpi_add_table(table_offsets, tables_blob);
> +    fadt_data.facs_tbl_offset = &facs;
> +    fadt_data.dsdt_tbl_offset = &dsdt;
> +    fadt_data.xdsdt_tbl_offset = &dsdt;
> +    build_fadt(tables_blob, tables->linker, &fadt_data,
> +               lams->oem_id, lams->oem_table_id);
> +    aml_len += tables_blob->len - fadt;
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_madt(tables_blob, tables->linker, lams);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_srat(tables_blob, tables->linker, machine);
> +
> +    acpi_add_table(table_offsets, tables_blob);
> +    {
> +        AcpiMcfgInfo mcfg = {
> +           .base = cpu_to_le64(LS_PCIECFG_BASE),
> +           .size = cpu_to_le64(LS_PCIECFG_SIZE),
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
> +                   lams->oem_table_id);
> +    }
> +
> +    /* Add tables supplied by user (if any) */
> +    for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
> +        unsigned len = acpi_table_len(u);
> +
> +        acpi_add_table(table_offsets, tables_blob);
> +        g_array_append_vals(tables_blob, u, len);
> +    }
> +
> +    /* RSDT is pointed to by RSDP */
> +    rsdt = tables_blob->len;
> +    build_rsdt(tables_blob, tables->linker, table_offsets,
> +               lams->oem_id, lams->oem_table_id);
> +
> +    /* RSDP is in FSEG memory, so allocate it separately */
> +    {
> +        AcpiRsdpData rsdp_data = {
> +            .revision = 0,
> +            .oem_id = lams->oem_id,
> +            .xsdt_tbl_offset = NULL,
> +            .rsdt_tbl_offset = &rsdt,
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
> +    }
> +
> +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> +
> +    /* Cleanup memory that's no longer used. */
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
> +static void acpi_build_update(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    AcpiBuildTables tables;
> +
> +    /* No state to update or already patched? Nothing to do. */
> +    if (!build_state || build_state->patched) {
> +        return;
> +    }
> +    build_state->patched = 1;
> +
> +    acpi_build_tables_init(&tables);
> +
> +    acpi_build(&tables, MACHINE(qdev_get_machine()));
> +
> +    acpi_ram_update(build_state->table_mr, tables.table_data);
> +    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
> +    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
> +
> +    acpi_build_tables_cleanup(&tables, true);
> +}
> +
> +static void acpi_build_reset(void *build_opaque)
> +{
> +    AcpiBuildState *build_state = build_opaque;
> +    build_state->patched = 0;
> +}
> +
> +static const VMStateDescription vmstate_acpi_build = {
> +    .name = "acpi_build",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(patched, AcpiBuildState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +void loongarch_acpi_setup(LoongArchMachineState *lams)
> +{
> +    AcpiBuildTables tables;
> +    AcpiBuildState *build_state;
> +
> +    if (!lams->fw_cfg) {
> +        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
> +        return;
> +    }
> +
> +    if (!loongarch_is_acpi_enabled(lams)) {
> +        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
> +        return;
> +    }
> +
> +    build_state = g_malloc0(sizeof *build_state);
> +
> +    acpi_build_tables_init(&tables);
> +    acpi_build(&tables, MACHINE(lams));
> +
> +    /* Now expose it all to Guest */
> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
> +                                              build_state, tables.table_data,
> +                                              ACPI_BUILD_TABLE_FILE);
> +    assert(build_state->table_mr != NULL);
> +
> +    build_state->linker_mr =
> +        acpi_add_rom_blob(acpi_build_update, build_state,
> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
> +
> +    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
> +                                             build_state, tables.rsdp,
> +                                             ACPI_BUILD_RSDP_FILE);
> +
> +    qemu_register_reset(acpi_build_reset, build_state);
> +    acpi_build_reset(build_state);
> +    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
> +
> +    /*
> +     * Cleanup tables but don't free the memory: we track it
> +     * in build_state.
> +     */
> +    acpi_build_tables_cleanup(&tables, false);
> +}
[...]


