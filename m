Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D500329175
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:27:26 +0100 (CET)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGp8X-0005R6-1Y
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGp5q-0004Vc-OM
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:24:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGp5m-0007od-4u
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614630272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XfcowYAH6XBisPYlyA7TAvvQFLSmqVy1t+5x/WHGxw=;
 b=KKVJcD9LzVPjQPM1jwwQRkBL2x+/7nnRNsdX222672OPIx0oXbMdxLqexgxHrwGjP9ZfAD
 MMcSN8f6dbN7/Wtdd1eH2wjpS9FyeliHJ14Pqq5LIoEc+qf6/Q0KE8CFDMmQcbv6DGPYAa
 /f5jAA11ZamzVOfv3aCS960IK2OOos4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-QAuFR--EMgWXi45V7SM1aQ-1; Mon, 01 Mar 2021 15:24:31 -0500
X-MC-Unique: QAuFR--EMgWXi45V7SM1aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE6450740;
 Mon,  1 Mar 2021 20:24:28 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 236AC5D71F;
 Mon,  1 Mar 2021 20:24:18 +0000 (UTC)
Date: Mon, 1 Mar 2021 21:24:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 1/2] acpi: Move setters/getters of oem fields to
 X86MachineState
Message-ID: <20210301212417.04c47eaa@redhat.com>
In-Reply-To: <20210221001737.24499-2-posteuca@mutex.one>
References: <20210221001737.24499-1-posteuca@mutex.one>
 <20210221001737.24499-2-posteuca@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list : ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 02:17:36 +0200
Marian Postevca <posteuca@mutex.one> wrote:

> The code that sets/gets oem fields is duplicated in both PC and MICROVM
> variants. This commit moves it to X86MachineState so that all x86
> variants can use it and duplication is removed.
> 
> Signed-off-by: Marian Postevca <posteuca@mutex.one>
nice cleanup, thanks!

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/i386/microvm.h |  4 ---
>  include/hw/i386/pc.h      |  4 ---
>  include/hw/i386/x86.h     |  4 +++
>  hw/i386/acpi-build.c      | 48 ++++++++++++++--------------
>  hw/i386/acpi-microvm.c    | 16 +++++-----
>  hw/i386/microvm.c         | 66 ---------------------------------------
>  hw/i386/pc.c              | 63 -------------------------------------
>  hw/i386/x86.c             | 64 +++++++++++++++++++++++++++++++++++++
>  8 files changed, 100 insertions(+), 169 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index 372b05774e..f25f837441 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -76,8 +76,6 @@
>  #define MICROVM_MACHINE_ISA_SERIAL          "isa-serial"
>  #define MICROVM_MACHINE_OPTION_ROMS         "x-option-roms"
>  #define MICROVM_MACHINE_AUTO_KERNEL_CMDLINE "auto-kernel-cmdline"
> -#define MICROVM_MACHINE_OEM_ID              "oem-id"
> -#define MICROVM_MACHINE_OEM_TABLE_ID        "oem-table-id"
>  
>  struct MicrovmMachineClass {
>      X86MachineClass parent;
> @@ -106,8 +104,6 @@ struct MicrovmMachineState {
>      Notifier machine_done;
>      Notifier powerdown_req;
>      struct GPEXConfig gpex;
> -    char *oem_id;
> -    char *oem_table_id;
>  };
>  
>  #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 5f93540a43..9c0ef403e4 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -45,8 +45,6 @@ typedef struct PCMachineState {
>      bool pit_enabled;
>      bool hpet_enabled;
>      uint64_t max_fw_size;
> -    char *oem_id;
> -    char *oem_table_id;
>  
>      /* NUMA information: */
>      uint64_t numa_nodes;
> @@ -64,8 +62,6 @@ typedef struct PCMachineState {
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
>  #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
> -#define PC_MACHINE_OEM_ID           "oem-id"
> -#define PC_MACHINE_OEM_TABLE_ID     "oem-table-id"
>  /**
>   * PCMachineClass:
>   *
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 56080bd1fb..26c9cc45a4 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -67,6 +67,8 @@ struct X86MachineState {
>      OnOffAuto smm;
>      OnOffAuto acpi;
>  
> +    char *oem_id;
> +    char *oem_table_id;
>      /*
>       * Address space used by IOAPIC device. All IOAPIC interrupts
>       * will be translated to MSI messages in the address space.
> @@ -76,6 +78,8 @@ struct X86MachineState {
>  
>  #define X86_MACHINE_SMM              "smm"
>  #define X86_MACHINE_ACPI             "acpi"
> +#define X86_MACHINE_OEM_ID           "oem-id"
> +#define X86_MACHINE_OEM_TABLE_ID     "oem-table-id"
>  
>  #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>  OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b9190b924a..fa6a6f20f1 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1637,7 +1637,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 1, pcms->oem_id, pcms->oem_table_id);
> +                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
>      free_aml_allocator();
>  }
>  
> @@ -1814,8 +1814,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      build_header(linker, table_data,
>                   (void *)(table_data->data + srat_start),
>                   "SRAT",
> -                 table_data->len - srat_start, 1, pcms->oem_id,
> -                 pcms->oem_table_id);
> +                 table_data->len - srat_start, 1, x86ms->oem_id,
> +                 x86ms->oem_table_id);
>  }
>  
>  /*
> @@ -2168,13 +2168,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      if (slic_oem.id) {
>          oem_id = slic_oem.id;
>      } else {
> -        oem_id = pcms->oem_id;
> +        oem_id = x86ms->oem_id;
>      }
>  
>      if (slic_oem.table_id) {
>          oem_table_id = slic_oem.table_id;
>      } else {
> -        oem_table_id = pcms->oem_table_id;
> +        oem_table_id = x86ms->oem_table_id;
>      }
>  
>      table_offsets = g_array_new(false, true /* clear */,
> @@ -2215,30 +2215,30 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), pcms->oem_id,
> -                    pcms->oem_table_id);
> +                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> +                    x86ms->oem_table_id);
>  
>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
>          vmgenid_build_acpi(VMGENID(vmgenid_dev), tables_blob,
> -                           tables->vmgenid, tables->linker, pcms->oem_id);
> +                           tables->vmgenid, tables->linker, x86ms->oem_id);
>      }
>  
>      if (misc.has_hpet) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_hpet(tables_blob, tables->linker, pcms->oem_id,
> -                   pcms->oem_table_id);
> +        build_hpet(tables_blob, tables->linker, x86ms->oem_id,
> +                   x86ms->oem_table_id);
>      }
>      if (misc.tpm_version != TPM_VERSION_UNSPEC) {
>          if (misc.tpm_version == TPM_VERSION_1_2) {
>              acpi_add_table(table_offsets, tables_blob);
>              build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog,
> -                           pcms->oem_id, pcms->oem_table_id);
> +                           x86ms->oem_id, x86ms->oem_table_id);
>          } else { /* TPM_VERSION_2_0 */
>              acpi_add_table(table_offsets, tables_blob);
>              build_tpm2(tables_blob, tables->linker, tables->tcpalog,
> -                       pcms->oem_id, pcms->oem_table_id);
> +                       x86ms->oem_id, x86ms->oem_table_id);
>          }
>      }
>      if (pcms->numa_nodes) {
> @@ -2246,40 +2246,40 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          build_srat(tables_blob, tables->linker, machine);
>          if (machine->numa_state->have_numa_distance) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_slit(tables_blob, tables->linker, machine, pcms->oem_id,
> -                       pcms->oem_table_id);
> +            build_slit(tables_blob, tables->linker, machine, x86ms->oem_id,
> +                       x86ms->oem_table_id);
>          }
>          if (machine->numa_state->hmat_enabled) {
>              acpi_add_table(table_offsets, tables_blob);
>              build_hmat(tables_blob, tables->linker, machine->numa_state,
> -                       pcms->oem_id, pcms->oem_table_id);
> +                       x86ms->oem_id, x86ms->oem_table_id);
>          }
>      }
>      if (acpi_get_mcfg(&mcfg)) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_mcfg(tables_blob, tables->linker, &mcfg, pcms->oem_id,
> -                   pcms->oem_table_id);
> +        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
> +                   x86ms->oem_table_id);
>      }
>      if (x86_iommu_get_default()) {
>          IommuType IOMMUType = x86_iommu_get_type();
>          if (IOMMUType == TYPE_AMD) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_amd_iommu(tables_blob, tables->linker, pcms->oem_id,
> -                            pcms->oem_table_id);
> +            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> +                            x86ms->oem_table_id);
>          } else if (IOMMUType == TYPE_INTEL) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_dmar_q35(tables_blob, tables->linker, pcms->oem_id,
> -                           pcms->oem_table_id);
> +            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> +                           x86ms->oem_table_id);
>          }
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>                            machine->nvdimms_state, machine->ram_slots,
> -                          pcms->oem_id, pcms->oem_table_id);
> +                          x86ms->oem_id, x86ms->oem_table_id);
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_waet(tables_blob, tables->linker, pcms->oem_id, pcms->oem_table_id);
> +    build_waet(tables_blob, tables->linker, x86ms->oem_id, x86ms->oem_table_id);
>  
>      /* Add tables supplied by user (if any) */
>      for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
> @@ -2298,7 +2298,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      {
>          AcpiRsdpData rsdp_data = {
>              .revision = 0,
> -            .oem_id = pcms->oem_id,
> +            .oem_id = x86ms->oem_id,
>              .xsdt_tbl_offset = NULL,
>              .rsdt_tbl_offset = &rsdt,
>          };
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 54b3af478a..d4c3511e00 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -149,7 +149,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, mms->oem_id, mms->oem_table_id);
> +                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
>      free_aml_allocator();
>  }
>  
> @@ -201,24 +201,24 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>      pmfadt.dsdt_tbl_offset = &dsdt;
>      pmfadt.xdsdt_tbl_offset = &dsdt;
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt(tables_blob, tables->linker, &pmfadt, mms->oem_id,
> -               mms->oem_table_id);
> +    build_fadt(tables_blob, tables->linker, &pmfadt, x86ms->oem_id,
> +               x86ms->oem_table_id);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), mms->oem_id,
> -                    mms->oem_table_id);
> +                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> +                    x86ms->oem_table_id);
>  
>      xsdt = tables_blob->len;
> -    build_xsdt(tables_blob, tables->linker, table_offsets, mms->oem_id,
> -               mms->oem_table_id);
> +    build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
> +               x86ms->oem_table_id);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
>      {
>          AcpiRsdpData rsdp_data = {
>              /* ACPI 2.0: 5.2.4.3 RSDP Structure */
>              .revision = 2, /* xsdt needs v2 */
> -            .oem_id = mms->oem_id,
> +            .oem_id = x86ms->oem_id,
>              .xsdt_tbl_offset = &xsdt,
>              .rsdt_tbl_offset = NULL,
>          };
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 4e0cf4c522..edf2b0f061 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -648,51 +648,6 @@ static void microvm_powerdown_req(Notifier *notifier, void *data)
>      }
>  }
>  
> -static char *microvm_machine_get_oem_id(Object *obj, Error **errp)
> -{
> -    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> -
> -    return g_strdup(mms->oem_id);
> -}
> -
> -static void microvm_machine_set_oem_id(Object *obj, const char *value,
> -                                       Error **errp)
> -{
> -    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> -    size_t len = strlen(value);
> -
> -    if (len > 6) {
> -        error_setg(errp,
> -          "User specified "MICROVM_MACHINE_OEM_ID" value is bigger than "
> -          "6 bytes in size");
> -        return;
> -    }
> -
> -    strncpy(mms->oem_id, value, 6);
> -}
> -
> -static char *microvm_machine_get_oem_table_id(Object *obj, Error **errp)
> -{
> -    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> -
> -    return g_strdup(mms->oem_table_id);
> -}
> -
> -static void microvm_machine_set_oem_table_id(Object *obj, const char *value,
> -                                             Error **errp)
> -{
> -    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> -    size_t len = strlen(value);
> -
> -    if (len > 8) {
> -        error_setg(errp,
> -          "User specified "MICROVM_MACHINE_OEM_TABLE_ID" value is bigger than "
> -          "8 bytes in size");
> -        return;
> -    }
> -    strncpy(mms->oem_table_id, value, 8);
> -}
> -
>  static void microvm_machine_initfn(Object *obj)
>  {
>      MicrovmMachineState *mms = MICROVM_MACHINE(obj);
> @@ -714,9 +669,6 @@ static void microvm_machine_initfn(Object *obj)
>      qemu_add_machine_init_done_notifier(&mms->machine_done);
>      mms->powerdown_req.notify = microvm_powerdown_req;
>      qemu_register_powerdown_notifier(&mms->powerdown_req);
> -
> -    mms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> -    mms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>  }
>  
>  static void microvm_class_init(ObjectClass *oc, void *data)
> @@ -805,24 +757,6 @@ static void microvm_class_init(ObjectClass *oc, void *data)
>          MICROVM_MACHINE_AUTO_KERNEL_CMDLINE,
>          "Set off to disable adding virtio-mmio devices to the kernel cmdline");
>  
> -    object_class_property_add_str(oc, MICROVM_MACHINE_OEM_ID,
> -                                  microvm_machine_get_oem_id,
> -                                  microvm_machine_set_oem_id);
> -    object_class_property_set_description(oc, MICROVM_MACHINE_OEM_ID,
> -                                          "Override the default value of field OEMID "
> -                                          "in ACPI table header."
> -                                          "The string may be up to 6 bytes in size");
> -
> -
> -    object_class_property_add_str(oc, MICROVM_MACHINE_OEM_TABLE_ID,
> -                                  microvm_machine_get_oem_table_id,
> -                                  microvm_machine_set_oem_table_id);
> -    object_class_property_set_description(oc, MICROVM_MACHINE_OEM_TABLE_ID,
> -                                          "Override the default value of field OEM Table ID "
> -                                          "in ACPI table header."
> -                                          "The string may be up to 8 bytes in size");
> -
> -
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>  }
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8aa85dec54..332caab026 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1611,49 +1611,6 @@ static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
>      pcms->max_fw_size = value;
>  }
>  
> -static char *pc_machine_get_oem_id(Object *obj, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -
> -    return g_strdup(pcms->oem_id);
> -}
> -
> -static void pc_machine_set_oem_id(Object *obj, const char *value, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -    size_t len = strlen(value);
> -
> -    if (len > 6) {
> -        error_setg(errp,
> -          "User specified "PC_MACHINE_OEM_ID" value is bigger than "
> -          "6 bytes in size");
> -        return;
> -    }
> -
> -    strncpy(pcms->oem_id, value, 6);
> -}
> -
> -static char *pc_machine_get_oem_table_id(Object *obj, Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -
> -    return g_strdup(pcms->oem_table_id);
> -}
> -
> -static void pc_machine_set_oem_table_id(Object *obj, const char *value,
> -                                        Error **errp)
> -{
> -    PCMachineState *pcms = PC_MACHINE(obj);
> -    size_t len = strlen(value);
> -
> -    if (len > 8) {
> -        error_setg(errp,
> -          "User specified "PC_MACHINE_OEM_TABLE_ID" value is bigger than "
> -          "8 bytes in size");
> -        return;
> -    }
> -    strncpy(pcms->oem_table_id, value, 8);
> -}
>  
>  static void pc_machine_initfn(Object *obj)
>  {
> @@ -1667,8 +1624,6 @@ static void pc_machine_initfn(Object *obj)
>      pcms->max_ram_below_4g = 0; /* use default */
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
> -    pcms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> -    pcms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>      pcms->smbus_enabled = true;
>      pcms->sata_enabled = true;
>      pcms->pit_enabled = true;
> @@ -1805,24 +1760,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>          "Maximum combined firmware size");
> -
> -    object_class_property_add_str(oc, PC_MACHINE_OEM_ID,
> -                                  pc_machine_get_oem_id,
> -                                  pc_machine_set_oem_id);
> -    object_class_property_set_description(oc, PC_MACHINE_OEM_ID,
> -                                          "Override the default value of field OEMID "
> -                                          "in ACPI table header."
> -                                          "The string may be up to 6 bytes in size");
> -
> -
> -    object_class_property_add_str(oc, PC_MACHINE_OEM_TABLE_ID,
> -                                  pc_machine_get_oem_table_id,
> -                                  pc_machine_set_oem_table_id);
> -    object_class_property_set_description(oc, PC_MACHINE_OEM_TABLE_ID,
> -                                          "Override the default value of field OEM Table ID "
> -                                          "in ACPI table header."
> -                                          "The string may be up to 8 bytes in size");
> -
>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6329f90ef9..8665876216 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1199,6 +1199,51 @@ static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
>  }
>  
> +static char *x86_machine_get_oem_id(Object *obj, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    return g_strdup(x86ms->oem_id);
> +}
> +
> +static void x86_machine_set_oem_id(Object *obj, const char *value, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    size_t len = strlen(value);
> +
> +    if (len > 6) {
> +        error_setg(errp,
> +                   "User specified "X86_MACHINE_OEM_ID" value is bigger than "
> +                   "6 bytes in size");
> +        return;
> +    }
> +
> +    strncpy(x86ms->oem_id, value, 6);
> +}
> +
> +static char *x86_machine_get_oem_table_id(Object *obj, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    return g_strdup(x86ms->oem_table_id);
> +}
> +
> +static void x86_machine_set_oem_table_id(Object *obj, const char *value,
> +                                         Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    size_t len = strlen(value);
> +
> +    if (len > 8) {
> +        error_setg(errp,
> +                   "User specified "X86_MACHINE_OEM_TABLE_ID
> +                   " value is bigger than "
> +                   "8 bytes in size");
> +        return;
> +    }
> +    strncpy(x86ms->oem_table_id, value, 8);
> +}
> +
>  static void x86_machine_initfn(Object *obj)
>  {
>      X86MachineState *x86ms = X86_MACHINE(obj);
> @@ -1207,6 +1252,8 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->acpi = ON_OFF_AUTO_AUTO;
>      x86ms->smp_dies = 1;
>      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
> +    x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> +    x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> @@ -1233,6 +1280,23 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, X86_MACHINE_ACPI,
>          "Enable ACPI");
> +
> +    object_class_property_add_str(oc, X86_MACHINE_OEM_ID,
> +                                  x86_machine_get_oem_id,
> +                                  x86_machine_set_oem_id);
> +    object_class_property_set_description(oc, X86_MACHINE_OEM_ID,
> +                                          "Override the default value of field OEMID "
> +                                          "in ACPI table header."
> +                                          "The string may be up to 6 bytes in size");
> +
> +
> +    object_class_property_add_str(oc, X86_MACHINE_OEM_TABLE_ID,
> +                                  x86_machine_get_oem_table_id,
> +                                  x86_machine_set_oem_table_id);
> +    object_class_property_set_description(oc, X86_MACHINE_OEM_TABLE_ID,
> +                                          "Override the default value of field OEM Table ID "
> +                                          "in ACPI table header."
> +                                          "The string may be up to 8 bytes in size");
>  }
>  
>  static const TypeInfo x86_machine_info = {


