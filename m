Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8636D414CB2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:07:11 +0200 (CEST)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3q2-0000aD-GY
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3mE-0005cz-2Z
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3mB-0002JQ-7t
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632322990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzsHO1aXNTpASgWfR2jsUzpCg3jAqWOuZLYSsYVZUHU=;
 b=ZQTPiA/CPMaA7MLEsFT3hJoHhHk+rUp2oWbXUvsDVMmh0SpVrJYZyCcD81njIS4/dToKYQ
 4HM+CiOFD/FzwgE/DwMiq3AkMGvEsN6dOvGsTmv31Zyid4wOtwToVtWYViOgQ9M72WRzWN
 cyqYEEpiceq3bVLw2uafs8/CuaSCxXA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-WFMzsOEsMBeH6lEhQp0S3w-1; Wed, 22 Sep 2021 11:03:00 -0400
X-MC-Unique: WFMzsOEsMBeH6lEhQp0S3w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so3427762edn.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JzsHO1aXNTpASgWfR2jsUzpCg3jAqWOuZLYSsYVZUHU=;
 b=VpbK8LAGkYneKssJBiWTQgyyTV4PnaoTQAg1GmqBZxpdEnCi4wC5Dol6xtbZrac5oV
 PeBxu7hwVkhS5GLcvvFSVWKwNR6LH81tb42dFSJK7gOVCQ0vnwH709SOWTHTK9xbw3H2
 N571cKtOSTjJttJ0ZAmIm4HE6vjfIE4zjcxT5TT3v4VCTX2JYGdumVdMC/xRNDet19zp
 O6xl+Q37SOSWXEBe8z7Hd9Us5rae0tyjzKm4GywVnBC8ftGnmIQuLxYUAGKbPjbQXnSy
 tZPWWf/elzINd04gisyipf0Bf3Dz+YbrY86HcfOn4KGXhM4drNfHqgO9N1GZX0SBJGPr
 1fDA==
X-Gm-Message-State: AOAM531WQTXcw0WhaSP6JyA9SzHu98DbhGK9E3PJVbMcKW4VZKQbtJ8B
 WWUa30yNOpCHSOemESvfRsHMdZPOJO2947vMiqR4mLqwYjngoTk8JRa5JRHlYPpHowkavWOnYQL
 MKLasRAqxXi/P8qk=
X-Received: by 2002:a17:907:75ed:: with SMTP id
 jz13mr7658ejc.506.1632322979750; 
 Wed, 22 Sep 2021 08:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNOuj9IJLouBkZ+EuCxdxd7dbC2VsFUpHxvYFydNKwiUMz4W+4Jxgw3bJH5eBcFCC4hAIFiw==
X-Received: by 2002:a17:907:75ed:: with SMTP id
 jz13mr7615ejc.506.1632322979323; 
 Wed, 22 Sep 2021 08:02:59 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o7sm1320681edt.68.2021.09.22.08.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 08:02:58 -0700 (PDT)
Date: Wed, 22 Sep 2021 17:02:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 16/35] acpi: arm/x86: build_srat: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20210922170257.208d79f7@redhat.com>
In-Reply-To: <44b92fd3-1f4b-04f1-e628-9f55e6b4df84@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-17-imammedo@redhat.com>
 <44b92fd3-1f4b-04f1-e628-9f55e6b4df84@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 09:38:14 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> 
> On 9/7/21 4:47 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.  

> nit: also removes AcpiSystemResourceAffinityTable and use
> build_append_int_noprefix for reserved fields

I didn't find it as worth of mentioning, the same is done
in some other patches where header wasn't standard one.

> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> > 
> > CC: shannon.zhaosl@gmail.com
> > CC: peter.maydell@linaro.org
> > CC: marcel.apfelbaum@gmail.com
> > CC: qemu-arm@nongnu.org
> > CC: drjones@redhat.com
> > CC: eauger@redhat.com
> > ---
> >  include/hw/acpi/acpi-defs.h | 11 -----------
> >  hw/arm/virt-acpi-build.c    | 15 +++++++--------
> >  hw/i386/acpi-build.c        | 18 +++++++-----------
> >  3 files changed, 14 insertions(+), 30 deletions(-)
> > 
> > diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> > index 3b42b138f0..5826ee04b6 100644
> > --- a/include/hw/acpi/acpi-defs.h
> > +++ b/include/hw/acpi/acpi-defs.h
> > @@ -358,17 +358,6 @@ struct AcpiGenericTimerTable {
> >  } QEMU_PACKED;
> >  typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
> >  
> > -/*
> > - * SRAT (NUMA topology description) table  
> Missing version reference if any
> https://uefi.org/specs/ACPI/6.4/05_ACPI_Software_Programming_Model/ACPI_Software_Programming_Model.html#system-resource-affinity-table-srat
> 5.2.16. System Resource Affinity Table (SRAT)

next patch adds missing doc comment(s) when converting
to build_append_int_noprefix()


> > - */
> > -
> > -struct AcpiSystemResourceAffinityTable {
> > -    ACPI_TABLE_HEADER_DEF
> > -    uint32_t    reserved1;
> > -    uint32_t    reserved2[2];
> > -} QEMU_PACKED;
> > -typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
> > -
> >  #define ACPI_SRAT_PROCESSOR_APIC     0
> >  #define ACPI_SRAT_MEMORY             1
> >  #define ACPI_SRAT_PROCESSOR_x2APIC   2
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 037cc1fd82..21efe7fe34 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -477,18 +477,19 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  static void
> >  build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >  {
> > -    AcpiSystemResourceAffinityTable *srat;
> >      AcpiSratProcessorGiccAffinity *core;
> >      AcpiSratMemoryAffinity *numamem;
> > -    int i, srat_start;
> > +    int i;
> >      uint64_t mem_base;
> >      MachineClass *mc = MACHINE_GET_CLASS(vms);
> >      MachineState *ms = MACHINE(vms);
> >      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
> > +    AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
> > +                        .oem_table_id = vms->oem_table_id };
> >  
> > -    srat_start = table_data->len;
> > -    srat = acpi_data_push(table_data, sizeof(*srat));
> > -    srat->reserved1 = cpu_to_le32(1);
> > +    acpi_table_begin(&table, table_data);
> > +    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
> >  
> >      for (i = 0; i < cpu_list->len; ++i) {
> >          core = acpi_data_push(table_data, sizeof(*core));
> > @@ -522,9 +523,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> >      }
> >  
> > -    build_header(linker, table_data, (void *)(table_data->data + srat_start),
> > -                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
> > -                 vms->oem_table_id);
> > +    acpi_table_end(linker, &table);
> >  }
> >  
> >  /* GTDT */
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index c329580cff..41c0a63b30 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1920,11 +1920,10 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
> >  static void
> >  build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
> >  {
> > -    AcpiSystemResourceAffinityTable *srat;
> >      AcpiSratMemoryAffinity *numamem;
> >  
> >      int i;
> > -    int srat_start, numa_start, slots;
> > +    int numa_start, slots;
> >      uint64_t mem_len, mem_base, next_base;
> >      MachineClass *mc = MACHINE_GET_CLASS(machine);
> >      X86MachineState *x86ms = X86_MACHINE(machine);
> > @@ -1935,11 +1934,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
> >      ram_addr_t hotplugabble_address_space_size =
> >          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
> >                                  NULL);
> > +    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
> > +                        .oem_table_id = x86ms->oem_table_id };
> >  
> > -    srat_start = table_data->len;
> > -
> > -    srat = acpi_data_push(table_data, sizeof *srat);
> > -    srat->reserved1 = cpu_to_le32(1);
> > +    acpi_table_begin(&table, table_data);
> > +    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
> >  
> >      for (i = 0; i < apic_ids->len; i++) {
> >          int node_id = apic_ids->cpus[i].props.node_id;
> > @@ -2045,11 +2045,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
> >                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
> >      }
> >  
> > -    build_header(linker, table_data,
> > -                 (void *)(table_data->data + srat_start),
> > -                 "SRAT",
> > -                 table_data->len - srat_start, 1, x86ms->oem_id,
> > -                 x86ms->oem_table_id);
> > +    acpi_table_end(linker, &table);
> >  }
> >  
> >  /*
> >   
> Besides
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> 
> Eric
> 


