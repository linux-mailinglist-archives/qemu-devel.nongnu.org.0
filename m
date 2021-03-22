Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C83344832
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:53:50 +0100 (CET)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLwD-0006Nn-Cq
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOLIy-0007xj-3R
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOLIq-0002gN-Ty
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616422388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LggILm3kXbZ5uVIxHVD8cqBouNwpuZiNs0Wlt17nDc=;
 b=P58oZxJrnVqkuhVOk0hA7RPeweyA4YM56poASfFOnlMLSm14ocDB40FMSQAQXRHMfOIbeh
 EKYYIz/aIA7il6D3uN9OrMZRNZSZ8jP0YvF6zX884xQHE5i9WtIqzoohW46sBVC0cgTo3/
 jzXemLhkK7e1X+NUw0fFfMmZnNYDTu0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-4ihYxe6WOYqaigeAqEBSQw-1; Mon, 22 Mar 2021 10:13:04 -0400
X-MC-Unique: 4ihYxe6WOYqaigeAqEBSQw-1
Received: by mail-wr1-f72.google.com with SMTP id 9so10555725wrb.16
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9LggILm3kXbZ5uVIxHVD8cqBouNwpuZiNs0Wlt17nDc=;
 b=EX/g1TFtk4aeszCnklSmTYGyLsFgceK4TfuJpMLK9RIBcMEhfgTNHToi5RfUP8lQJH
 SkGJIyxol9PDMoHWpjM1o5iSCt6WK4WyQwHn887h6krl6KvEionrJNeYUIqMEhv5KPSu
 jceGrAXcyPDFugTklsBmp0naysADx4pZOfIYyyFP7jwiXNeiQPGPGOGlYfzeyy1x8pkJ
 K4e4vKC3GrKUdbmP1Gakm5EMUyj0MwgC5tlFHghsPfgq4PsNBaZXYWGIlBjlDwjFFx6A
 hnGptgp8e19cEj4QPB5Zh3x1EiHDw6KDOoAoqvqGPk87rGt9GIGC0UAd+IvsHbwh7XhM
 IlWA==
X-Gm-Message-State: AOAM530D4c+Ww+wRlwj1N+VSp047wk/4oe2eUjvlwiVWUM9t+rfWtJHf
 z1ptuNtKow/fFs/rVGm6+j7WG9zkLIN3a0vm6ZclHVzO4MFNl3iSbEcDQjVHByX0wRgVDP81eHr
 EXh/C+WPjca7YN5M=
X-Received: by 2002:a5d:534b:: with SMTP id t11mr18279430wrv.186.1616422380524; 
 Mon, 22 Mar 2021 07:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtN+oqW6xJQMKnnPK4BF1QGNYyiT4Pig3MWrTWcgUzfPZodHghsEblx2MBvkB1syyKRlKrfA==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr18279372wrv.186.1616422379943; 
 Mon, 22 Mar 2021 07:12:59 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id f126sm16803421wmf.17.2021.03.22.07.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:12:59 -0700 (PDT)
Date: Mon, 22 Mar 2021 10:12:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 2/2] acpi: Consolidate the handling of OEM ID and OEM
 Table ID fields
Message-ID: <20210322101237-mutt-send-email-mst@kernel.org>
References: <20210221001737.24499-1-posteuca@mutex.one>
 <20210221001737.24499-3-posteuca@mutex.one>
MIME-Version: 1.0
In-Reply-To: <20210221001737.24499-3-posteuca@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list : ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 21, 2021 at 02:17:37AM +0200, Marian Postevca wrote:
> Introduces structure AcpiBuildOem to hold the value of OEM fields and
> uses dedicated macros to initialize/set the values.
> Unnecessary dynamically allocated OEM fields are re-factored to static
> allocation.
> 
> Signed-off-by: Marian Postevca <posteuca@mutex.one>

Can't apply this - can you rebase please?
> ---
>  hw/acpi/hmat.h                   |  2 +-
>  hw/i386/acpi-common.h            |  2 +-
>  include/hw/acpi/acpi-build-oem.h | 55 ++++++++++++++++++++++
>  include/hw/acpi/aml-build.h      | 16 +++----
>  include/hw/acpi/ghes.h           |  2 +-
>  include/hw/acpi/pci.h            |  2 +-
>  include/hw/acpi/vmgenid.h        |  2 +-
>  include/hw/arm/virt.h            |  4 +-
>  include/hw/i386/x86.h            |  4 +-
>  include/hw/mem/nvdimm.h          |  4 +-
>  hw/acpi/aml-build.c              | 27 ++++++-----
>  hw/acpi/ghes.c                   |  5 +-
>  hw/acpi/hmat.c                   |  4 +-
>  hw/acpi/nvdimm.c                 | 22 +++++----
>  hw/acpi/pci.c                    |  4 +-
>  hw/acpi/vmgenid.c                |  6 ++-
>  hw/arm/virt-acpi-build.c         | 40 ++++++----------
>  hw/arm/virt.c                    | 16 +++----
>  hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------
>  hw/i386/acpi-common.c            |  4 +-
>  hw/i386/acpi-microvm.c           | 13 ++----
>  hw/i386/x86.c                    | 19 ++++----
>  22 files changed, 182 insertions(+), 149 deletions(-)
>  create mode 100644 include/hw/acpi/acpi-build-oem.h
> 
> diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
> index b57f0e7e80..39c42328bd 100644
> --- a/hw/acpi/hmat.h
> +++ b/hw/acpi/hmat.h
> @@ -38,6 +38,6 @@
>  #define HMAT_PROXIMITY_INITIATOR_VALID  0x1
>  
>  void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
> -                const char *oem_id, const char *oem_table_id);
> +                struct AcpiBuildOem *bld_oem);
>  
>  #endif
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> index b12cd73ea5..27c2e5b6a9 100644
> --- a/hw/i386/acpi-common.h
> +++ b/hw/i386/acpi-common.h
> @@ -10,6 +10,6 @@
>  
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
> -                     const char *oem_id, const char *oem_table_id);
> +                     struct AcpiBuildOem *bld_oem);
>  
>  #endif
> diff --git a/include/hw/acpi/acpi-build-oem.h b/include/hw/acpi/acpi-build-oem.h
> new file mode 100644
> index 0000000000..5e5edc4c22
> --- /dev/null
> +++ b/include/hw/acpi/acpi-build-oem.h
> @@ -0,0 +1,55 @@
> +#ifndef QEMU_HW_ACPI_BUILD_OEM_H
> +#define QEMU_HW_ACPI_BUILD_OEM_H
> +
> +/*
> + * Utilities for working with ACPI OEM ID and OEM TABLE ID fields
> + *
> + * Copyright (c) 2021 Marian Postevca
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
> +#include "qemu/cutils.h"
> +
> +#define ACPI_BUILD_APPNAME6 "BOCHS "
> +#define ACPI_BUILD_APPNAME8 "BXPC    "
> +
> +#define ACPI_BUILD_OEM_ID_SIZE 6
> +#define ACPI_BUILD_OEM_TABLE_ID_SIZE 8
> +
> +struct AcpiBuildOem {
> +    char oem_id[ACPI_BUILD_OEM_ID_SIZE + 1];
> +    char oem_table_id[ACPI_BUILD_OEM_TABLE_ID_SIZE + 1];
> +};
> +
> +#define ACPI_SET_BUILD_OEM_ID(__bld_oem, __oem_id) do {        \
> +        pstrcpy(__bld_oem.oem_id,                              \
> +                sizeof __bld_oem.oem_id, __oem_id);            \
> +} while (0)
> +
> +#define ACPI_SET_BUILD_OEM_TABLE_ID(__bld_oem,  __oem_table_id) do {    \
> +        pstrcpy(__bld_oem.oem_table_id,                                 \
> +                sizeof __bld_oem.oem_table_id, __oem_table_id);         \
> +} while (0)
> +
> +#define ACPI_INIT_BUILD_OEM(__bld_oem, __oem_id, __oem_table_id) do {   \
> +        ACPI_SET_BUILD_OEM_ID(__bld_oem, __oem_id);                     \
> +        ACPI_SET_BUILD_OEM_TABLE_ID(__bld_oem, __oem_table_id);         \
> +    } while (0)
> +
> +#define ACPI_INIT_DEFAULT_BUILD_OEM(__bld_oem) do {                     \
> +        ACPI_INIT_BUILD_OEM(__bld_oem,                                  \
> +                            ACPI_BUILD_APPNAME6, ACPI_BUILD_APPNAME8);  \
> +} while (0)
> +
> +#endif /* QEMU_HW_ACPI_BUILD_OEM_H */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 380d3e3924..65c26842ad 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,13 +3,11 @@
>  
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  
>  /* Reserve RAM space for tables: add another order of magnitude. */
>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
>  
> -#define ACPI_BUILD_APPNAME6 "BOCHS "
> -#define ACPI_BUILD_APPNAME8 "BXPC    "
> -
>  #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
>  #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
>  #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
> @@ -416,7 +414,7 @@ void build_append_int_noprefix(GArray *table, uint64_t value, int size);
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> -             const char *oem_id, const char *oem_table_id);
> +             struct AcpiBuildOem *bld_oem);
>  void *acpi_data_push(GArray *table_data, unsigned size);
>  unsigned acpi_data_len(GArray *table);
>  void acpi_add_table(GArray *table_offsets, GArray *table_data);
> @@ -426,10 +424,10 @@ void
>  build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
>  void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> -           const char *oem_id, const char *oem_table_id);
> +           struct AcpiBuildOem *bld_oem);
>  void
>  build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> -           const char *oem_id, const char *oem_table_id);
> +           struct AcpiBuildOem *bld_oem);
>  
>  int
>  build_append_named_dword(GArray *array, const char *name_format, ...)
> @@ -460,11 +458,11 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
>  
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id);
> +                struct AcpiBuildOem *bld_oem);
>  
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> -                const char *oem_id, const char *oem_table_id);
> +                struct AcpiBuildOem *bld_oem);
>  
>  void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> -                const char *oem_id, const char *oem_table_id);
> +                struct AcpiBuildOem *bld_oem);
>  #endif
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 2ae8bc1ded..9a7b654c98 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -68,7 +68,7 @@ typedef struct AcpiGhesState {
>  
>  void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
>  void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
> -                     const char *oem_id, const char *oem_table_id);
> +                     struct AcpiBuildOem *bld_oem);
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
>  int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index e514f179d8..1a41c6dc8a 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -34,5 +34,5 @@ typedef struct AcpiMcfgInfo {
>  } AcpiMcfgInfo;
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
> -                const char *oem_id, const char *oem_table_id);
> +                struct AcpiBuildOem *bld_oem);
>  #endif
> diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
> index dc8bb3433e..388d6ebd59 100644
> --- a/include/hw/acpi/vmgenid.h
> +++ b/include/hw/acpi/vmgenid.h
> @@ -31,7 +31,7 @@ static inline Object *find_vmgenid_dev(void)
>  }
>  
>  void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
> -                        BIOSLinker *linker, const char *oem_id);
> +                        BIOSLinker *linker, struct AcpiBuildOem *bld_oem);
>  void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid);
>  
>  #endif
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ee9a93101e..6af0396294 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -38,6 +38,7 @@
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "qom/object.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  
>  #define NUM_GICV2M_SPIS       64
>  #define NUM_VIRTIO_TRANSPORTS 32
> @@ -165,8 +166,7 @@ struct VirtMachineState {
>      DeviceState *acpi_dev;
>      Notifier powerdown_notifier;
>      PCIBus *bus;
> -    char *oem_id;
> -    char *oem_table_id;
> +    struct AcpiBuildOem bld_oem;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 26c9cc45a4..0d547ac67f 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -27,6 +27,7 @@
>  #include "hw/isa/isa.h"
>  #include "hw/i386/ioapic.h"
>  #include "qom/object.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  
>  struct X86MachineClass {
>      /*< private >*/
> @@ -67,8 +68,7 @@ struct X86MachineState {
>      OnOffAuto smm;
>      OnOffAuto acpi;
>  
> -    char *oem_id;
> -    char *oem_table_id;
> +    struct AcpiBuildOem bld_oem;
>      /*
>       * Address space used by IOAPIC device. All IOAPIC interrupts
>       * will be translated to MSI messages in the address space.
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index bcf62f825c..a7ab354cd1 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -154,8 +154,8 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>  void nvdimm_build_srat(GArray *table_data);
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>                         BIOSLinker *linker, NVDIMMState *state,
> -                       uint32_t ram_slots, const char *oem_id,
> -                       const char *oem_table_id);
> +                       uint32_t ram_slots,
> +                       struct AcpiBuildOem *bld_oem);
>  void nvdimm_plug(NVDIMMState *state);
>  void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
>  #endif
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index a2cd7a5830..164d02e0c9 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1667,7 +1667,7 @@ Aml *aml_object_type(Aml *object)
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> -             const char *oem_id, const char *oem_table_id)
> +             struct AcpiBuildOem *bld_oem)
>  {
>      unsigned tbl_offset = (char *)h - table_data->data;
>      unsigned checksum_offset = (char *)&h->checksum - table_data->data;
> @@ -1675,9 +1675,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
>      h->length = cpu_to_le32(len);
>      h->revision = rev;
>  
> -    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
> +    strpadcpy((char *)h->oem_id, sizeof h->oem_id, bld_oem->oem_id, ' ');
>      strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
> -              oem_table_id, ' ');
> +              bld_oem->oem_table_id, ' ');
>  
>      h->oem_revision = cpu_to_le32(1);
>      memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
> @@ -1797,7 +1797,7 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
>  /* Build rsdt table */
>  void
>  build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> -           const char *oem_id, const char *oem_table_id)
> +           struct AcpiBuildOem *bld_oem)
>  {
>      int i;
>      unsigned rsdt_entries_offset;
> @@ -1818,13 +1818,13 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
>      }
>      build_header(linker, table_data,
> -                 (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
> +                 (void *)rsdt, "RSDT", rsdt_len, 1, bld_oem);
>  }
>  
>  /* Build xsdt table */
>  void
>  build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
> -           const char *oem_id, const char *oem_table_id)
> +           struct AcpiBuildOem *bld_oem)
>  {
>      int i;
>      unsigned xsdt_entries_offset;
> @@ -1845,7 +1845,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
>              ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
>      }
>      build_header(linker, table_data,
> -                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
> +                 (void *)xsdt, "XSDT", xsdt_len, 1, bld_oem);
>  }
>  
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
> @@ -1864,7 +1864,7 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>   * (Revision 2.0 or later)
>   */
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id)
> +                struct AcpiBuildOem *bld_oem)
>  {
>      int slit_start, i, j;
>      slit_start = table_data->len;
> @@ -1885,12 +1885,12 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>      build_header(linker, table_data,
>                   (void *)(table_data->data + slit_start),
>                   "SLIT",
> -                 table_data->len - slit_start, 1, oem_id, oem_table_id);
> +                 table_data->len - slit_start, 1, bld_oem);
>  }
>  
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> -                const char *oem_id, const char *oem_table_id)
> +                struct AcpiBuildOem *bld_oem)
>  {
>      int off;
>      int fadt_start = tbl->len;
> @@ -2009,7 +2009,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>  
>  build_hdr:
>      build_header(linker, tbl, (void *)(tbl->data + fadt_start),
> -                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> +                 "FACP", tbl->len - fadt_start, f->rev, bld_oem);
>  }
>  
>  /*
> @@ -2018,7 +2018,7 @@ build_hdr:
>   * of TCG ACPI Specification, Family “1.2” and “2.0”, Version 1.2, Rev 8
>   */
>  void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> -                const char *oem_id, const char *oem_table_id)
> +                struct AcpiBuildOem *bld_oem)
>  {
>      uint8_t start_method_params[12] = {};
>      unsigned log_addr_offset, tpm2_start;
> @@ -2067,8 +2067,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                                     log_addr_offset, 8,
>                                     ACPI_BUILD_TPMLOG_FILE, 0);
>      build_header(linker, table_data,
> -                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, oem_id,
> -                 oem_table_id);
> +                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, bld_oem);
>  }
>  
>  Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index a4dac6bf15..963d602b26 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -21,6 +21,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/aml-build.h"
>  #include "qemu/error-report.h"
> @@ -360,7 +361,7 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>  
>  /* Build Hardware Error Source Table */
>  void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
> -                     const char *oem_id, const char *oem_table_id)
> +                     struct AcpiBuildOem *bld_oem)
>  {
>      uint64_t hest_start = table_data->len;
>  
> @@ -373,7 +374,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
>  
>      build_header(linker, table_data, (void *)(table_data->data + hest_start),
> -                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
> +                 "HEST", table_data->len - hest_start, 1, bld_oem);
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
> index edb3fd91b2..d8f594100f 100644
> --- a/hw/acpi/hmat.c
> +++ b/hw/acpi/hmat.c
> @@ -254,7 +254,7 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
>  }
>  
>  void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
> -                const char *oem_id, const char *oem_table_id)
> +                struct AcpiBuildOem *bld_oem)
>  {
>      int hmat_start = table_data->len;
>  
> @@ -265,5 +265,5 @@ void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
>  
>      build_header(linker, table_data,
>                   (void *)(table_data->data + hmat_start),
> -                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
> +                 "HMAT", table_data->len - hmat_start, 2, bld_oem);
>  }
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e3d5fe1939..54b29fc424 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -403,7 +403,7 @@ void nvdimm_plug(NVDIMMState *state)
>  
>  static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
>                                GArray *table_data, BIOSLinker *linker,
> -                              const char *oem_id, const char *oem_table_id)
> +                              struct AcpiBuildOem *bld_oem)
>  {
>      NvdimmFitBuffer *fit_buf = &state->fit_buf;
>      unsigned int header;
> @@ -418,8 +418,7 @@ static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
>  
>      build_header(linker, table_data,
>                   (void *)(table_data->data + header), "NFIT",
> -                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
> -                 oem_table_id);
> +                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, bld_oem);
>  }
>  
>  #define NVDIMM_DSM_MEMORY_SIZE      4096
> @@ -1280,9 +1279,11 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
>  static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>                                BIOSLinker *linker,
>                                NVDIMMState *nvdimm_state,
> -                              uint32_t ram_slots, const char *oem_id)
> +                              uint32_t ram_slots,
> +                              struct AcpiBuildOem *bld_oem)
>  {
>      Aml *ssdt, *sb_scope, *dev;
> +    struct AcpiBuildOem tmp_bld_oem;
>      int mem_addr_offset, nvdimm_ssdt;
>  
>      acpi_add_table(table_offsets, table_data);
> @@ -1331,9 +1332,11 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>      bios_linker_loader_add_pointer(linker,
>          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
>          NVDIMM_DSM_MEM_FILE, 0);
> +
> +    ACPI_INIT_BUILD_OEM(tmp_bld_oem, bld_oem->oem_id, "NVDIMM");
>      build_header(linker, table_data,
> -        (void *)(table_data->data + nvdimm_ssdt),
> -                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
> +                 (void *)(table_data->data + nvdimm_ssdt),
> +                 "SSDT", table_data->len - nvdimm_ssdt, 1, &tmp_bld_oem);
>      free_aml_allocator();
>  }
>  
> @@ -1361,8 +1364,7 @@ void nvdimm_build_srat(GArray *table_data)
>  
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>                         BIOSLinker *linker, NVDIMMState *state,
> -                       uint32_t ram_slots, const char *oem_id,
> -                       const char *oem_table_id)
> +                       uint32_t ram_slots, struct AcpiBuildOem *bld_oem)
>  {
>      GSList *device_list;
>  
> @@ -1372,7 +1374,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>      }
>  
>      nvdimm_build_ssdt(table_offsets, table_data, linker, state,
> -                      ram_slots, oem_id);
> +                      ram_slots, bld_oem);
>  
>      device_list = nvdimm_get_device_list();
>      /* no NVDIMM device is plugged. */
> @@ -1381,6 +1383,6 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>      }
>  
>      nvdimm_build_nfit(state, table_offsets, table_data, linker,
> -                      oem_id, oem_table_id);
> +                      bld_oem);
>      g_slist_free(device_list);
>  }
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index ec455c3b25..0e7173a24d 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -29,7 +29,7 @@
>  #include "hw/pci/pcie_host.h"
>  
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
> -                const char *oem_id, const char *oem_table_id)
> +                struct AcpiBuildOem *bld_oem)
>  {
>      int mcfg_start = table_data->len;
>  
> @@ -57,6 +57,6 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>      build_append_int_noprefix(table_data, 0, 4);
>  
>      build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
> -                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
> +                 "MCFG", table_data->len - mcfg_start, 1, bld_oem);
>  }
>  
> diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
> index 4f41a13ea0..bf3253d168 100644
> --- a/hw/acpi/vmgenid.c
> +++ b/hw/acpi/vmgenid.c
> @@ -24,11 +24,12 @@
>  #include "sysemu/reset.h"
>  
>  void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
> -                        BIOSLinker *linker, const char *oem_id)
> +                        BIOSLinker *linker, struct AcpiBuildOem *bld_oem)
>  {
>      Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
>      uint32_t vgia_offset;
>      QemuUUID guid_le;
> +    struct AcpiBuildOem tmp_bld_oem;
>  
>      /* Fill in the GUID values.  These need to be converted to little-endian
>       * first, since that's what the guest expects
> @@ -116,9 +117,10 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
>          ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
>          VMGENID_GUID_FW_CFG_FILE, 0);
>  
> +    ACPI_INIT_BUILD_OEM(tmp_bld_oem, bld_oem->oem_id, "VMGENID");
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - ssdt->buf->len),
> -        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
> +        "SSDT", ssdt->buf->len, 1, &tmp_bld_oem);
>      free_aml_allocator();
>  }
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f9c9df916c..55d2f427c2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -341,8 +341,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      iort->length = cpu_to_le32(iort_length);
>  
>      build_header(linker, table_data, (void *)(table_data->data + iort_start),
> -                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
> -                 vms->oem_table_id);
> +                 "IORT", table_data->len - iort_start, 0, &vms->bld_oem);
>  }
>  
>  static void
> @@ -376,8 +375,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
>  
>      build_header(linker, table_data, (void *)(table_data->data + spcr_start),
> -                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +                 "SPCR", table_data->len - spcr_start, 2, &vms->bld_oem);
>  }
>  
>  static void
> @@ -429,8 +427,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
> -                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
> -                 vms->oem_table_id);
> +                 "SRAT", table_data->len - srat_start, 3, &vms->bld_oem);
>  }
>  
>  /* GTDT */
> @@ -465,8 +462,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      build_header(linker, table_data,
>                   (void *)(table_data->data + gtdt_start), "GTDT",
> -                 table_data->len - gtdt_start, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +                 table_data->len - gtdt_start, 2, &vms->bld_oem);
>  }
>  
>  /* MADT */
> @@ -555,8 +551,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      build_header(linker, table_data,
>                   (void *)(table_data->data + madt_start), "APIC",
> -                 table_data->len - madt_start, 3, vms->oem_id,
> -                 vms->oem_table_id);
> +                 table_data->len - madt_start, 3, &vms->bld_oem);
>  }
>  
>  /* FADT */
> @@ -586,7 +581,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>          g_assert_not_reached();
>      }
>  
> -    build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
> +    build_fadt(table_data, linker, &fadt, &vms->bld_oem);
>  }
>  
>  /* DSDT */
> @@ -650,8 +645,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +                 "DSDT", dsdt->buf->len, 2, &vms->bld_oem);
>      free_aml_allocator();
>  }
>  
> @@ -710,8 +704,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>             .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
>             .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
>          };
> -        build_mcfg(tables_blob, tables->linker, &mcfg, vms->oem_id,
> -                   vms->oem_table_id);
> +        build_mcfg(tables_blob, tables->linker, &mcfg, &vms->bld_oem);
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> @@ -720,8 +713,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      if (vms->ras) {
>          build_ghes_error_table(tables->hardware_errors, tables->linker);
>          acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->linker, vms->oem_id,
> -                        vms->oem_table_id);
> +        acpi_build_hest(tables_blob, tables->linker, &vms->bld_oem);
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> @@ -729,15 +721,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          build_srat(tables_blob, tables->linker, vms);
>          if (ms->numa_state->have_numa_distance) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_slit(tables_blob, tables->linker, ms, vms->oem_id,
> -                       vms->oem_table_id);
> +            build_slit(tables_blob, tables->linker, ms, &vms->bld_oem);
>          }
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
> -                          ms->nvdimms_state, ms->ram_slots, vms->oem_id,
> -                          vms->oem_table_id);
> +                          ms->nvdimms_state, ms->ram_slots, &vms->bld_oem);
>      }
>  
>      if (its_class_name() && !vmc->no_its) {
> @@ -747,20 +737,18 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
> -                   vms->oem_table_id);
> +        build_tpm2(tables_blob, tables->linker, tables->tcpalog, &vms->bld_oem);
>      }
>  
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
> -    build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
> -               vms->oem_table_id);
> +    build_xsdt(tables_blob, tables->linker, table_offsets, &vms->bld_oem);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
>      {
>          AcpiRsdpData rsdp_data = {
>              .revision = 2,
> -            .oem_id = vms->oem_id,
> +            .oem_id = vms->bld_oem.oem_id,
>              .xsdt_tbl_offset = &xsdt,
>              .rsdt_tbl_offset = NULL,
>          };
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 371147f3ae..0a2d121efe 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2159,7 +2159,7 @@ static char *virt_get_oem_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>  
> -    return g_strdup(vms->oem_id);
> +    return g_strdup(vms->bld_oem.oem_id);
>  }
>  
>  static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
> @@ -2167,20 +2167,19 @@ static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      size_t len = strlen(value);
>  
> -    if (len > 6) {
> +    if (len > ACPI_BUILD_OEM_ID_SIZE) {
>          error_setg(errp,
>                     "User specified oem-id value is bigger than 6 bytes in size");
>          return;
>      }
> -
> -    strncpy(vms->oem_id, value, 6);
> +    ACPI_SET_BUILD_OEM_ID(vms->bld_oem, value);
>  }
>  
>  static char *virt_get_oem_table_id(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>  
> -    return g_strdup(vms->oem_table_id);
> +    return g_strdup(vms->bld_oem.oem_table_id);
>  }
>  
>  static void virt_set_oem_table_id(Object *obj, const char *value,
> @@ -2189,12 +2188,12 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
>      VirtMachineState *vms = VIRT_MACHINE(obj);
>      size_t len = strlen(value);
>  
> -    if (len > 8) {
> +    if (len > ACPI_BUILD_OEM_TABLE_ID_SIZE) {
>          error_setg(errp,
>                     "User specified oem-table-id value is bigger than 8 bytes in size");
>          return;
>      }
> -    strncpy(vms->oem_table_id, value, 8);
> +    ACPI_SET_BUILD_OEM_TABLE_ID(vms->bld_oem, value);
>  }
>  
>  
> @@ -2706,8 +2705,7 @@ static void virt_instance_init(Object *obj)
>  
>      virt_flash_create(vms);
>  
> -    vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> -    vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    ACPI_INIT_DEFAULT_BUILD_OEM(vms->bld_oem);
>  }
>  
>  static const TypeInfo virt_machine_info = {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index fa6a6f20f1..2d904e4f58 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -24,6 +24,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qmp/qnum.h"
>  #include "acpi-build.h"
> +#include "hw/acpi/acpi-build-oem.h"
>  #include "acpi-common.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/error-report.h"
> @@ -1637,13 +1638,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
> +                 "DSDT", dsdt->buf->len, 1, &x86ms->bld_oem);
>      free_aml_allocator();
>  }
>  
>  static void
> -build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> -           const char *oem_table_id)
> +build_hpet(GArray *table_data, BIOSLinker *linker, struct AcpiBuildOem *bld_oem)
>  {
>      Acpi20Hpet *hpet;
>  
> @@ -1654,12 +1654,12 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      hpet->timer_block_id = cpu_to_le32(0x8086a201);
>      hpet->addr.address = cpu_to_le64(HPET_BASE);
>      build_header(linker, table_data,
> -                 (void *)hpet, "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
> +                 (void *)hpet, "HPET", sizeof(*hpet), 1, bld_oem);
>  }
>  
>  static void
>  build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> -               const char *oem_id, const char *oem_table_id)
> +               struct AcpiBuildOem *bld_oem)
>  {
>      Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
>      unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
> @@ -1679,7 +1679,7 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>          ACPI_BUILD_TPMLOG_FILE, 0);
>  
>      build_header(linker, table_data,
> -                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
> +                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, bld_oem);
>  }
>  
>  #define HOLE_640K_START  (640 * KiB)
> @@ -1814,8 +1814,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      build_header(linker, table_data,
>                   (void *)(table_data->data + srat_start),
>                   "SRAT",
> -                 table_data->len - srat_start, 1, x86ms->oem_id,
> -                 x86ms->oem_table_id);
> +                 table_data->len - srat_start, 1, &x86ms->bld_oem);
>  }
>  
>  /*
> @@ -1823,8 +1822,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>   * (version Oct. 2014 or later)
>   */
>  static void
> -build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> -               const char *oem_table_id)
> +build_dmar_q35(GArray *table_data, BIOSLinker *linker,
> +               struct AcpiBuildOem *bld_oem)
>  {
>      int dmar_start = table_data->len;
>  
> @@ -1874,7 +1873,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + dmar_start),
> -                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_table_id);
> +                 "DMAR", table_data->len - dmar_start, 1, bld_oem);
>  }
>  
>  /*
> @@ -1885,8 +1884,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>   * Helpful to speedup Windows guests and ignored by others.
>   */
>  static void
> -build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> -           const char *oem_table_id)
> +build_waet(GArray *table_data, BIOSLinker *linker, struct AcpiBuildOem *bld_oem)
>  {
>      int waet_start = table_data->len;
>  
> @@ -1902,7 +1900,7 @@ build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
>  
>      build_header(linker, table_data, (void *)(table_data->data + waet_start),
> -                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id);
> +                 "WAET", table_data->len - waet_start, 1, bld_oem);
>  }
>  
>  /*
> @@ -2004,8 +2002,8 @@ ivrs_host_bridges(Object *obj, void *opaque)
>  }
>  
>  static void
> -build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> -                const char *oem_table_id)
> +build_amd_iommu(GArray *table_data, BIOSLinker *linker,
> +                struct AcpiBuildOem *bld_oem)
>  {
>      int ivhd_table_len = 24;
>      int iommu_start = table_data->len;
> @@ -2100,8 +2098,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + iommu_start),
> -                 "IVRS", table_data->len - iommu_start, 1, oem_id,
> -                 oem_table_id);
> +                 "IVRS", table_data->len - iommu_start, 1, bld_oem);
>  }
>  
>  typedef
> @@ -2157,6 +2154,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      GArray *tables_blob = tables->table_data;
>      AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>      Object *vmgenid_dev;
> +    struct AcpiBuildOem slic_bld_oem;
> +    struct AcpiBuildOem *bld_oem;
>      char *oem_id;
>      char *oem_table_id;
>  
> @@ -2168,15 +2167,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      if (slic_oem.id) {
>          oem_id = slic_oem.id;
>      } else {
> -        oem_id = x86ms->oem_id;
> +        oem_id = x86ms->bld_oem.oem_id;
>      }
>  
>      if (slic_oem.table_id) {
>          oem_table_id = slic_oem.table_id;
>      } else {
> -        oem_table_id = x86ms->oem_table_id;
> +        oem_table_id = x86ms->bld_oem.oem_table_id;
>      }
>  
> +    ACPI_INIT_BUILD_OEM(slic_bld_oem, oem_id, oem_table_id);
> +    bld_oem = &x86ms->bld_oem;
> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>      ACPI_BUILD_DPRINTF("init ACPI tables\n");
> @@ -2210,35 +2212,33 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      pm.fadt.facs_tbl_offset = &facs;
>      pm.fadt.dsdt_tbl_offset = &dsdt;
>      pm.fadt.xdsdt_tbl_offset = &dsdt;
> -    build_fadt(tables_blob, tables->linker, &pm.fadt, oem_id, oem_table_id);
> +    build_fadt(tables_blob, tables->linker, &pm.fadt, &slic_bld_oem);
>      aml_len += tables_blob->len - fadt;
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, x86ms,
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> -                    x86ms->oem_table_id);
> +                    ACPI_DEVICE_IF(x86ms->acpi_dev), bld_oem);
>  
>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
>          vmgenid_build_acpi(VMGENID(vmgenid_dev), tables_blob,
> -                           tables->vmgenid, tables->linker, x86ms->oem_id);
> +                           tables->vmgenid, tables->linker, bld_oem);
>      }
>  
>      if (misc.has_hpet) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_hpet(tables_blob, tables->linker, x86ms->oem_id,
> -                   x86ms->oem_table_id);
> +        build_hpet(tables_blob, tables->linker, bld_oem);
>      }
>      if (misc.tpm_version != TPM_VERSION_UNSPEC) {
>          if (misc.tpm_version == TPM_VERSION_1_2) {
>              acpi_add_table(table_offsets, tables_blob);
>              build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog,
> -                           x86ms->oem_id, x86ms->oem_table_id);
> +                           bld_oem);
>          } else { /* TPM_VERSION_2_0 */
>              acpi_add_table(table_offsets, tables_blob);
>              build_tpm2(tables_blob, tables->linker, tables->tcpalog,
> -                       x86ms->oem_id, x86ms->oem_table_id);
> +                       bld_oem);
>          }
>      }
>      if (pcms->numa_nodes) {
> @@ -2246,40 +2246,36 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          build_srat(tables_blob, tables->linker, machine);
>          if (machine->numa_state->have_numa_distance) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_slit(tables_blob, tables->linker, machine, x86ms->oem_id,
> -                       x86ms->oem_table_id);
> +            build_slit(tables_blob, tables->linker, machine, bld_oem);
>          }
>          if (machine->numa_state->hmat_enabled) {
>              acpi_add_table(table_offsets, tables_blob);
>              build_hmat(tables_blob, tables->linker, machine->numa_state,
> -                       x86ms->oem_id, x86ms->oem_table_id);
> +                       bld_oem);
>          }
>      }
>      if (acpi_get_mcfg(&mcfg)) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
> -                   x86ms->oem_table_id);
> +        build_mcfg(tables_blob, tables->linker, &mcfg, bld_oem);
>      }
>      if (x86_iommu_get_default()) {
>          IommuType IOMMUType = x86_iommu_get_type();
>          if (IOMMUType == TYPE_AMD) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
> -                            x86ms->oem_table_id);
> +            build_amd_iommu(tables_blob, tables->linker, bld_oem);
>          } else if (IOMMUType == TYPE_INTEL) {
>              acpi_add_table(table_offsets, tables_blob);
> -            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
> -                           x86ms->oem_table_id);
> +            build_dmar_q35(tables_blob, tables->linker, bld_oem);
>          }
>      }
>      if (machine->nvdimms_state->is_enabled) {
>          nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
>                            machine->nvdimms_state, machine->ram_slots,
> -                          x86ms->oem_id, x86ms->oem_table_id);
> +                          bld_oem);
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> -    build_waet(tables_blob, tables->linker, x86ms->oem_id, x86ms->oem_table_id);
> +    build_waet(tables_blob, tables->linker, bld_oem);
>  
>      /* Add tables supplied by user (if any) */
>      for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
> @@ -2292,13 +2288,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      /* RSDT is pointed to by RSDP */
>      rsdt = tables_blob->len;
>      build_rsdt(tables_blob, tables->linker, table_offsets,
> -               oem_id, oem_table_id);
> +               &slic_bld_oem);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
>      {
>          AcpiRsdpData rsdp_data = {
>              .revision = 0,
> -            .oem_id = x86ms->oem_id,
> +            .oem_id = bld_oem->oem_id,
>              .xsdt_tbl_offset = NULL,
>              .rsdt_tbl_offset = &rsdt,
>          };
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 1f5947fcf9..c3a5e6f0b5 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -73,7 +73,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
> -                     const char *oem_id, const char *oem_table_id)
> +                     struct AcpiBuildOem *bld_oem)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> @@ -158,6 +158,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>  
>      build_header(linker, table_data,
>                   (void *)(table_data->data + madt_start), "APIC",
> -                 table_data->len - madt_start, 1, oem_id, oem_table_id);
> +                 table_data->len - madt_start, 1, bld_oem);
>  }
>  
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index d4c3511e00..a7d2d1e925 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -149,7 +149,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
>      build_header(linker, table_data,
>          (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
> +                 "DSDT", dsdt->buf->len, 2, &x86ms->bld_oem);
>      free_aml_allocator();
>  }
>  
> @@ -201,24 +201,21 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>      pmfadt.dsdt_tbl_offset = &dsdt;
>      pmfadt.xdsdt_tbl_offset = &dsdt;
>      acpi_add_table(table_offsets, tables_blob);
> -    build_fadt(tables_blob, tables->linker, &pmfadt, x86ms->oem_id,
> -               x86ms->oem_table_id);
> +    build_fadt(tables_blob, tables->linker, &pmfadt, &x86ms->bld_oem);
>  
>      acpi_add_table(table_offsets, tables_blob);
>      acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
> -                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
> -                    x86ms->oem_table_id);
> +                    ACPI_DEVICE_IF(x86ms->acpi_dev), &x86ms->bld_oem);
>  
>      xsdt = tables_blob->len;
> -    build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
> -               x86ms->oem_table_id);
> +    build_xsdt(tables_blob, tables->linker, table_offsets, &x86ms->bld_oem);
>  
>      /* RSDP is in FSEG memory, so allocate it separately */
>      {
>          AcpiRsdpData rsdp_data = {
>              /* ACPI 2.0: 5.2.4.3 RSDP Structure */
>              .revision = 2, /* xsdt needs v2 */
> -            .oem_id = x86ms->oem_id,
> +            .oem_id = x86ms->bld_oem.oem_id,
>              .xsdt_tbl_offset = &xsdt,
>              .rsdt_tbl_offset = NULL,
>          };
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 8665876216..ce2a7aed54 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1203,7 +1203,7 @@ static char *x86_machine_get_oem_id(Object *obj, Error **errp)
>  {
>      X86MachineState *x86ms = X86_MACHINE(obj);
>  
> -    return g_strdup(x86ms->oem_id);
> +    return g_strdup(x86ms->bld_oem.oem_id);
>  }
>  
>  static void x86_machine_set_oem_id(Object *obj, const char *value, Error **errp)
> @@ -1211,21 +1211,20 @@ static void x86_machine_set_oem_id(Object *obj, const char *value, Error **errp)
>      X86MachineState *x86ms = X86_MACHINE(obj);
>      size_t len = strlen(value);
>  
> -    if (len > 6) {
> +    if (len > ACPI_BUILD_OEM_ID_SIZE) {
>          error_setg(errp,
>                     "User specified "X86_MACHINE_OEM_ID" value is bigger than "
>                     "6 bytes in size");
>          return;
>      }
> -
> -    strncpy(x86ms->oem_id, value, 6);
> +    ACPI_SET_BUILD_OEM_ID(x86ms->bld_oem, value);
>  }
>  
>  static char *x86_machine_get_oem_table_id(Object *obj, Error **errp)
>  {
>      X86MachineState *x86ms = X86_MACHINE(obj);
>  
> -    return g_strdup(x86ms->oem_table_id);
> +    return g_strdup(x86ms->bld_oem.oem_table_id);
>  }
>  
>  static void x86_machine_set_oem_table_id(Object *obj, const char *value,
> @@ -1234,14 +1233,13 @@ static void x86_machine_set_oem_table_id(Object *obj, const char *value,
>      X86MachineState *x86ms = X86_MACHINE(obj);
>      size_t len = strlen(value);
>  
> -    if (len > 8) {
> +    if (len > ACPI_BUILD_OEM_TABLE_ID_SIZE) {
>          error_setg(errp,
>                     "User specified "X86_MACHINE_OEM_TABLE_ID
> -                   " value is bigger than "
> -                   "8 bytes in size");
> +                   " value is bigger than 8 bytes in size");
>          return;
>      }
> -    strncpy(x86ms->oem_table_id, value, 8);
> +    ACPI_SET_BUILD_OEM_TABLE_ID(x86ms->bld_oem, value);
>  }
>  
>  static void x86_machine_initfn(Object *obj)
> @@ -1252,8 +1250,7 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->acpi = ON_OFF_AUTO_AUTO;
>      x86ms->smp_dies = 1;
>      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
> -    x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> -    x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    ACPI_INIT_DEFAULT_BUILD_OEM(x86ms->bld_oem);
>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> -- 
> 2.26.2
> 


