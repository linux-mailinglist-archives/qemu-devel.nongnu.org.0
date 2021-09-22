Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47861414551
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 11:38:45 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSyiB-0004Bh-Tg
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 05:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSygT-0003IX-SO
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSygP-00074M-4S
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 05:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632303411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ijUfguxFIlgDYNsL7VVSZ5zxBO5I+O8YAJBIy1eP1aM=;
 b=SMXfQGcuUVO23bK+aOmDs9hEe+smQJfjGR/iDBl4D/UYDq9iVSViVGYBSaa/SVCLom9DzQ
 yVy4yKhJGoxhofkuHUjiHkhc14+sD9V+kYbVJ0Yjv/ojBZGOhs/pqHQYsu/lIDTALjPTTP
 Cxp53c1fxMG6Y+OSvIcOh/YWBi9Blhs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-egsy7YIjMbmROY3iuIYNsg-1; Wed, 22 Sep 2021 05:36:50 -0400
X-MC-Unique: egsy7YIjMbmROY3iuIYNsg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so1658322wrh.0
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 02:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ijUfguxFIlgDYNsL7VVSZ5zxBO5I+O8YAJBIy1eP1aM=;
 b=QXC96LKnAxtb7CGWn0FuIYNSmDZFc2KEm73pLND0TLhq9rBDtbmXoMNW4Vzz1H6knz
 LRYOk8v5MXt7g7e+FA4C4ruABMjgak7WhESLGKDfcFDZ5skQd2zbr6/oFAg3W0FjsI36
 8w/5ymspYwRzq0F4sW6EYBqY/5Fyt5PqR7VPj16IkpS+oy480tOy6rmMrByWhRsQq5Ju
 UW6VS3pr1VfA61UWrxaHphMJQIfbVE+g02xOox1LCYjAy+1WNGXM6LKQ0Q3e5yWKJ+bP
 EGVJU3Wg/EzvXqeGRyMdB0Zm7RzKlkmydHgxdRhzP9ONA1EDVGIqOFrCo1zGMMRxiRZK
 UwBg==
X-Gm-Message-State: AOAM531JEe7SmZr6Nf57fwQaJKZt7WdQVQrDcnIXLDc2AucWqr72QKgH
 D7f64ZeTdeF21feqYhVNV/QsvmclBO5OYPq15wKPgSj0zkHC+AUK0imTDTb4UWd/dGRW8S6dANl
 QMerDtdgsNcU2LVU=
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr39767835wre.387.1632303408948; 
 Wed, 22 Sep 2021 02:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcecPlulOEqpGJ3NoTo5CcG91CX7bDmkgx4TktlGmkzD4dB/9utBTg3mBeeI+C1yjo3J/UBw==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr39767809wre.387.1632303408716; 
 Wed, 22 Sep 2021 02:36:48 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c17sm1936088wrn.54.2021.09.22.02.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 02:36:48 -0700 (PDT)
Subject: Re: [PATCH v3 21/35] acpi: madt: arm/x86: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-22-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <f3064e58-afe5-04c9-c6ae-66c03087b5f9@redhat.com>
Date: Wed, 22 Sep 2021 11:36:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-22-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 4:48 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: marcel.apfelbaum@gmail.com
> CC: shannon.zhaosl@gmail.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> CC: eauger@redhat.com
> ---
>  include/hw/acpi/acpi-defs.h |  9 ---------
>  hw/arm/virt-acpi-build.c    | 19 +++++++++++--------
>  hw/i386/acpi-common.c       | 19 +++++++++++--------
>  3 files changed, 22 insertions(+), 25 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c4f0a202e8..c7fa5caa06 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -176,15 +176,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
>  #define ACPI_DUAL_PIC                0
>  #define ACPI_MULTIPLE_APIC           1
>  
> -/* Master MADT */
> -
> -struct AcpiMultipleApicTable {
> -    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
> -    uint32_t local_apic_address;     /* Physical address of local APIC */
> -    uint32_t flags;
> -} QEMU_PACKED;
> -typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
> -
>  /* Values for Type in APIC sub-headers */
>  
>  #define ACPI_APIC_PROCESSOR          0
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6ba02cf281..e3bdcd44e8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -567,19 +567,26 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> -/* MADT */
> +/*
> + * ACPI spec, Revision 5.0
> + * 5.2.12 Multiple APIC Description Table (MADT)
> + */
>  static void
>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> -    int madt_start = table_data->len;
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
>      AcpiMadtGenericDistributor *gicd;
>      AcpiMadtGenericMsiFrame *gic_msi;
>      int i;
> +    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> -    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
> +    acpi_table_begin(&table, table_data);
> +    /* Local Interrupt Controller Address */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    build_append_int_noprefix(table_data, 0, 4); /* Flags */
>  
>      gicd = acpi_data_push(table_data, sizeof *gicd);
>      gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
> @@ -650,11 +657,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
>          gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
>      }
> -
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + madt_start), "APIC",
> -                 table_data->len - madt_start, 3, vms->oem_id,
> -                 vms->oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /* FADT */
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 1f5947fcf9..a0cde1d874 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -71,24 +71,29 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>      }
>  }
>  
> +/*
> + * ACPI spec, Revision 1.0b
> + * 5.2.8 Multiple APIC Description Table
> + */
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
>                       const char *oem_id, const char *oem_table_id)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> -    int madt_start = table_data->len;
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>      bool x2apic_mode = false;
>  
> -    AcpiMultipleApicTable *madt;
>      AcpiMadtIoApic *io_apic;
>      AcpiMadtIntsrcovr *intsrcovr;
>      int i;
> +    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
>  
> -    madt = acpi_data_push(table_data, sizeof *madt);
> -    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
> -    madt->flags = cpu_to_le32(1);
> +    acpi_table_begin(&table, table_data);
> +    /* Local APIC Address */
> +    build_append_int_noprefix(table_data, APIC_DEFAULT_ADDRESS, 4);
> +    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
>  
>      for (i = 0; i < apic_ids->len; i++) {
>          adevc->madt_cpu(adev, i, apic_ids, table_data);
> @@ -156,8 +161,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>          local_nmi->lint         = 1; /* ACPI_LINT1 */
>      }
>  
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + madt_start), "APIC",
> -                 table_data->len - madt_start, 1, oem_id, oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


