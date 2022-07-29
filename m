Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E4F584957
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 03:35:34 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHEua-0002QO-NR
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 21:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oHEsI-0007eX-SE
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 21:33:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43702 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oHEsF-00073I-Tn
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 21:33:10 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9OyOONi2bJAAA--.2326S3;
 Fri, 29 Jul 2022 09:32:35 +0800 (CST)
Subject: Re: [PATCH 5/6] hw/loongarch: Add acpi ged support
To: Igor Mammedov <imammedo@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, maobibo@loongson.cn, 
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, ani@anisinha.ca,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
 <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
 <20220728160307.4fcc3ce0@redhat.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <15f5c00a-49dc-e4d1-b515-c8580b816ea7@loongson.cn>
Date: Fri, 29 Jul 2022 09:32:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220728160307.4fcc3ce0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxf9OyOONi2bJAAA--.2326S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4fJw1rJFWfJF4UCw1xZrb_yoW3ZrW7pa
 yDJFZ5KF4Yqr1xJr1xX3yUKF9Ygrs7CwnrX3yxt340v34q9rn5CF4kKrW3KF97Aw1kXrn0
 vFyDtasruF4kArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2022/7/28 下午10:03, Igor Mammedov wrote:
> On Tue, 12 Jul 2022 16:32:05 +0800
> Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
>> Loongarch virt machine uses general hardware reduces acpi method, rather
>> than LS7A acpi device. Now only power management function is used in
>> acpi ged device, memory hotplug will be added later. Also acpi tables
>> such as RSDP/RSDT/FADT etc.
>>
>> The acpi table has submited to acpi spec, and will release soon.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   hw/loongarch/Kconfig        |   2 +
>>   hw/loongarch/acpi-build.c   | 609 ++++++++++++++++++++++++++++++++++++
>>   hw/loongarch/loongson3.c    |  78 ++++-
>>   hw/loongarch/meson.build    |   1 +
>>   include/hw/loongarch/virt.h |  13 +
>>   include/hw/pci-host/ls7a.h  |   4 +
>>   6 files changed, 704 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/loongarch/acpi-build.c
>>
>> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
>> index 610552e522..a99aa387c3 100644
>> --- a/hw/loongarch/Kconfig
>> +++ b/hw/loongarch/Kconfig
>> @@ -15,3 +15,5 @@ config LOONGARCH_VIRT
>>       select LOONGARCH_EXTIOI
>>       select LS7A_RTC
>>       select SMBIOS
>> +    select ACPI_PCI
>> +    select ACPI_HW_REDUCED
>> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
>> new file mode 100644
>> index 0000000000..b95b83b079
>> --- /dev/null
>> +++ b/hw/loongarch/acpi-build.c
> [...]
>
>
> Most of the following code copied from x86 which is needlessly
> complicated for loongarch wich doesn't have all that legacy to care about,
> see ARM's variant virt_acpi_setup() for a cleaner example and
> drop not needed parts.
Thanks for you review, We will send a patch to clean the code.

Thanks.
Song Gao
>> +static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>> +{
>> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>> +    GArray *table_offsets;
>> +    AcpiFadtData fadt_data;
>> +    unsigned facs, rsdt, fadt, dsdt;
>> +    uint8_t *u;
>> +    size_t aml_len = 0;
>> +    GArray *tables_blob = tables->table_data;
>> +
>> +    init_common_fadt_data(&fadt_data);
>> +
>> +    table_offsets = g_array_new(false, true, sizeof(uint32_t));
>> +    ACPI_BUILD_DPRINTF("init ACPI tables\n");
>> +
>> +    bios_linker_loader_alloc(tables->linker,
>> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
>> +                             64, false);
>> +
>> +    /*
>> +     * FACS is pointed to by FADT.
>> +     * We place it first since it's the only table that has alignment
>> +     * requirements.
>> +     */
>> +    facs = tables_blob->len;
>> +    build_facs(tables_blob);
>> +
>> +    /* DSDT is pointed to by FADT */
>> +    dsdt = tables_blob->len;
>> +    build_dsdt(tables_blob, tables->linker, machine);
>> +
>> +    /*
>> +     * Count the size of the DSDT, we will need it for
>> +     * legacy sizing of ACPI tables.
>> +     */
>> +    aml_len += tables_blob->len - dsdt;
>> +
>> +    /* ACPI tables pointed to by RSDT */
>> +    fadt = tables_blob->len;
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    fadt_data.facs_tbl_offset = &facs;
>> +    fadt_data.dsdt_tbl_offset = &dsdt;
>> +    fadt_data.xdsdt_tbl_offset = &dsdt;
>> +    build_fadt(tables_blob, tables->linker, &fadt_data,
>> +               lams->oem_id, lams->oem_table_id);
>> +    aml_len += tables_blob->len - fadt;
>> +
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_madt(tables_blob, tables->linker, lams);
>> +
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_srat(tables_blob, tables->linker, machine);
>> +
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    {
>> +        AcpiMcfgInfo mcfg = {
>> +           .base = cpu_to_le64(LS_PCIECFG_BASE),
>> +           .size = cpu_to_le64(LS_PCIECFG_SIZE),
>> +        };
>> +        build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
>> +                   lams->oem_table_id);
>> +    }
>> +
>> +    /* Add tables supplied by user (if any) */
>> +    for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
>> +        unsigned len = acpi_table_len(u);
>> +
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        g_array_append_vals(tables_blob, u, len);
>> +    }
>> +
>> +    /* RSDT is pointed to by RSDP */
>> +    rsdt = tables_blob->len;
>> +    build_rsdt(tables_blob, tables->linker, table_offsets,
>> +               lams->oem_id, lams->oem_table_id);
>> +
>> +    /* RSDP is in FSEG memory, so allocate it separately */
>> +    {
>> +        AcpiRsdpData rsdp_data = {
>> +            .revision = 0,
>> +            .oem_id = lams->oem_id,
>> +            .xsdt_tbl_offset = NULL,
>> +            .rsdt_tbl_offset = &rsdt,
>> +        };
>> +        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>> +    }
>> +
>> +    /*
>> +     * The align size is 128, warn if 64k is not enough therefore
>> +     * the align size could be resized.
>> +     */
>> +    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
>> +        warn_report("ACPI table size %u exceeds %d bytes,"
>> +                    " migration may not work",
>> +                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
>> +        error_printf("Try removing CPUs, NUMA nodes, memory slots"
>> +                     " or PCI bridges.");
>> +    }
>> +
>> +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
>> +
>> +    /* Cleanup memory that's no longer used. */
>> +    g_array_free(table_offsets, true);
>> +}
>> +
>> +static void acpi_ram_update(MemoryRegion *mr, GArray *data)
>> +{
>> +    uint32_t size = acpi_data_len(data);
>> +
>> +    /*
>> +     * Make sure RAM size is correct - in case it got changed
>> +     * e.g. by migration
>> +     */
>> +    memory_region_ram_resize(mr, size, &error_abort);
>> +
>> +    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
>> +    memory_region_set_dirty(mr, 0, size);
>> +}
>> +
>> +static void acpi_build_update(void *build_opaque)
>> +{
>> +    AcpiBuildState *build_state = build_opaque;
>> +    AcpiBuildTables tables;
>> +
>> +    /* No state to update or already patched? Nothing to do. */
>> +    if (!build_state || build_state->patched) {
>> +        return;
>> +    }
>> +    build_state->patched = 1;
>> +
>> +    acpi_build_tables_init(&tables);
>> +
>> +    acpi_build(&tables, MACHINE(qdev_get_machine()));
>> +
>> +    acpi_ram_update(build_state->table_mr, tables.table_data);
>> +    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
>> +    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
>> +
>> +    acpi_build_tables_cleanup(&tables, true);
>> +}
>> +
>> +static void acpi_build_reset(void *build_opaque)
>> +{
>> +    AcpiBuildState *build_state = build_opaque;
>> +    build_state->patched = 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_acpi_build = {
>> +    .name = "acpi_build",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(patched, AcpiBuildState),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>> +void loongarch_acpi_setup(LoongArchMachineState *lams)
>> +{
>> +    AcpiBuildTables tables;
>> +    AcpiBuildState *build_state;
>> +
>> +    if (!lams->fw_cfg) {
>> +        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
>> +        return;
>> +    }
>> +
>> +    if (!loongarch_is_acpi_enabled(lams)) {
>> +        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
>> +        return;
>> +    }
>> +
>> +    build_state = g_malloc0(sizeof *build_state);
>> +
>> +    acpi_build_tables_init(&tables);
>> +    acpi_build(&tables, MACHINE(lams));
>> +
>> +    /* Now expose it all to Guest */
>> +    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
>> +                                              build_state, tables.table_data,
>> +                                              ACPI_BUILD_TABLE_FILE);
>> +    assert(build_state->table_mr != NULL);
>> +
>> +    build_state->linker_mr =
>> +        acpi_add_rom_blob(acpi_build_update, build_state,
>> +                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
>> +
>> +    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
>> +                                             build_state, tables.rsdp,
>> +                                             ACPI_BUILD_RSDP_FILE);
>> +
>> +    qemu_register_reset(acpi_build_reset, build_state);
>> +    acpi_build_reset(build_state);
>> +    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
>> +
>> +    /*
>> +     * Cleanup tables but don't free the memory: we track it
>> +     * in build_state.
>> +     */
>> +    acpi_build_tables_cleanup(&tables, false);
>> +}
> [...]


