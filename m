Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8214142D3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 09:40:12 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSwrT-0003eG-1p
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 03:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwpn-0002kA-PC
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mSwpk-00056H-Br
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 03:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632296303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Y5KZJuAYKi+1M22/csvgOOMW2BKZ3fzhscAOQl7sK8=;
 b=BrURx3qtdORB82mshH4uN2IWUw4ziq/ndiCXgSzlisHhWF/6gT6xG7Q3UaBJSfMSpXGiji
 qmxlKspxByvJYUJjlKjYw2GTX/fdnM9GcMZELCWO2yH38qHEz5KxBhD/brOSSVimAah/+X
 IJRR8f2v58BU7YP5UcnQZdcRMc/TyKI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-K3Ql9UtNMQOp6GkA5F5fQQ-1; Wed, 22 Sep 2021 03:38:17 -0400
X-MC-Unique: K3Ql9UtNMQOp6GkA5F5fQQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so1276671wrg.17
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 00:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Y5KZJuAYKi+1M22/csvgOOMW2BKZ3fzhscAOQl7sK8=;
 b=F6/lMe96x/QCrod4ihcYI3ir4AuqcjH5GIGKenMRpQRKKzanqboAeifVaSKx1/9VX+
 uJOS45dzoLNkpBobPi+VzZPBl3NtUDWOQUqb3lDhgJeQd3qlgr2Rilm53eObXt5rZlXP
 Zysed92Au4SoxkFyDXljyg+hQsRDIwmc6xTBXYAziOQ05rVCWTOoGL2ZCmT5+JSupp0o
 RYykbLkdjDPABpOm4ZbN7/MB/Pw0+d/WkPILZipneP5a/8osRvOi93NKYKeY36dMAMGT
 1dsYIDsQW/9gtb5o88WegyjJY8g4TVTxxJc19W5NzTkHzZbJlxV7A4ywT/YDKCrDWmXi
 EP9g==
X-Gm-Message-State: AOAM531i9/ELliwtvkuce9ryfV4zijL6JaUqM9OU7VLGND+SsqXo3rF4
 I+VoTsSwgNHoDlxz6p/rcsoKc6m0W+pFNiglVz5nOTHbw0cJ44qkjcfvW5RahE5/Z+ILA0qNoXJ
 GUiHHgdqRIYTpfjI=
X-Received: by 2002:a5d:5989:: with SMTP id n9mr37236883wri.89.1632296296666; 
 Wed, 22 Sep 2021 00:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKfdMjDjrt9hwbvZerjhv89T0h2XGN135pbGtDjbmwFClPdOjgPNAy6Xzp2XTZG3w1aEklHQ==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr37236860wri.89.1632296296491; 
 Wed, 22 Sep 2021 00:38:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f5sm1080246wmb.47.2021.09.22.00.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 00:38:15 -0700 (PDT)
Subject: Re: [PATCH v3 16/35] acpi: arm/x86: build_srat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-17-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <44b92fd3-1f4b-04f1-e628-9f55e6b4df84@redhat.com>
Date: Wed, 22 Sep 2021 09:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210907144814.741785-17-imammedo@redhat.com>
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

Hi Igor,

On 9/7/21 4:47 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
nit: also removes AcpiSystemResourceAffinityTable and use
build_append_int_noprefix for reserved fields
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v3:
>   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> 
> CC: shannon.zhaosl@gmail.com
> CC: peter.maydell@linaro.org
> CC: marcel.apfelbaum@gmail.com
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> CC: eauger@redhat.com
> ---
>  include/hw/acpi/acpi-defs.h | 11 -----------
>  hw/arm/virt-acpi-build.c    | 15 +++++++--------
>  hw/i386/acpi-build.c        | 18 +++++++-----------
>  3 files changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 3b42b138f0..5826ee04b6 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -358,17 +358,6 @@ struct AcpiGenericTimerTable {
>  } QEMU_PACKED;
>  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
>  
> -/*
> - * SRAT (NUMA topology description) table
Missing version reference if any
https://uefi.org/specs/ACPI/6.4/05_ACPI_Software_Programming_Model/ACPI_Software_Programming_Model.html#system-resource-affinity-table-srat
5.2.16. System Resource Affinity Table (SRAT)

> - */
> -
> -struct AcpiSystemResourceAffinityTable {
> -    ACPI_TABLE_HEADER_DEF
> -    uint32_t    reserved1;
> -    uint32_t    reserved2[2];
> -} QEMU_PACKED;
> -typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
> -
>  #define ACPI_SRAT_PROCESSOR_APIC     0
>  #define ACPI_SRAT_MEMORY             1
>  #define ACPI_SRAT_PROCESSOR_x2APIC   2
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 037cc1fd82..21efe7fe34 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -477,18 +477,19 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  static void
>  build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> -    AcpiSystemResourceAffinityTable *srat;
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
> -    int i, srat_start;
> +    int i;
>      uint64_t mem_base;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>      MachineState *ms = MACHINE(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
> +    AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> -    srat_start = table_data->len;
> -    srat = acpi_data_push(table_data, sizeof(*srat));
> -    srat->reserved1 = cpu_to_le32(1);
> +    acpi_table_begin(&table, table_data);
> +    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
>  
>      for (i = 0; i < cpu_list->len; ++i) {
>          core = acpi_data_push(table_data, sizeof(*core));
> @@ -522,9 +523,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> -    build_header(linker, table_data, (void *)(table_data->data + srat_start),
> -                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
> -                 vms->oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /* GTDT */
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index c329580cff..41c0a63b30 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1920,11 +1920,10 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>  static void
>  build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>  {
> -    AcpiSystemResourceAffinityTable *srat;
>      AcpiSratMemoryAffinity *numamem;
>  
>      int i;
> -    int srat_start, numa_start, slots;
> +    int numa_start, slots;
>      uint64_t mem_len, mem_base, next_base;
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>      X86MachineState *x86ms = X86_MACHINE(machine);
> @@ -1935,11 +1934,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      ram_addr_t hotplugabble_address_space_size =
>          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                  NULL);
> +    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
> +                        .oem_table_id = x86ms->oem_table_id };
>  
> -    srat_start = table_data->len;
> -
> -    srat = acpi_data_push(table_data, sizeof *srat);
> -    srat->reserved1 = cpu_to_le32(1);
> +    acpi_table_begin(&table, table_data);
> +    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
>  
>      for (i = 0; i < apic_ids->len; i++) {
>          int node_id = apic_ids->cpus[i].props.node_id;
> @@ -2045,11 +2045,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> -    build_header(linker, table_data,
> -                 (void *)(table_data->data + srat_start),
> -                 "SRAT",
> -                 table_data->len - srat_start, 1, x86ms->oem_id,
> -                 x86ms->oem_table_id);
> +    acpi_table_end(linker, &table);
>  }
>  
>  /*
> 
Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>


Eric


