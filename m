Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FE36C7A7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:19:36 +0200 (CEST)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOYp-000228-BK
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbOWH-0000i9-2u
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbOWC-0004rk-W3
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619533012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vmklFrTme3j0cpI76YQOwmiCsVzozfL1t3CKehJnu5w=;
 b=XWJb9XjapJaWKgmDkZwDUALV+a7VR2nqRAynnL0L+UGj5Dv1ZxnABs1qMYaIHxnw072U6T
 x74Vy3RtbSnSX3kPu4ITpIwrdxK3cZCCdMr6H0ldG6ogeR9BEQ54sirNtJpRdUmvqKRTJU
 R1/66eZMdO/2bv/gT449xMWK293lW8Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-2sHqRQybMwKUSwlGhiQ_sA-1; Tue, 27 Apr 2021 10:16:48 -0400
X-MC-Unique: 2sHqRQybMwKUSwlGhiQ_sA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z3-20020a05640240c3b029037fb0c2bd3bso25189997edb.23
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vmklFrTme3j0cpI76YQOwmiCsVzozfL1t3CKehJnu5w=;
 b=SBA1m8bSkGjPJs+1Od2SZuRdeh/uqHjxahHKJjc1nGg+YX/+IcGmCSwitJzhSoYRJL
 NyMESWY6ws666ojk+zusDCmNLfxwPXkLO2VGVJo8sMef21mHJt8F7TxC0TAQIXrXc5S2
 pgCzRXfvplKlcOn8smcmH5vGNJmy3mFNDPx54c3KG38ELpx7EA6iU7I2+jNWDqRW4p1i
 fcbHPDCYChGSvoPuEFSiJF3fJcUnLjnSmL1BpG2oSK9YqG5XHMLISdsn3ImuKpklskY5
 swIGLTYXBl77khKyWrmmxHCp+oiRbtvyBKGpgkdpSAzpSzSAytw1jvHd2aJ6B/zlodPL
 s5ug==
X-Gm-Message-State: AOAM530C9bXK6tjJts9b0MZs9XwlU/pqxc9rAqpy8msbscBl6CLnsEbc
 rmXGkueIiE4tULM5PvEfTyzXUrVwUXjMPesN3TmZh533ADkjoMgOVd+WYJajcdsLvOoT1UWSKLA
 WZzI8LVNSzHcGcrQ=
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr23262607ejo.314.1619533007438; 
 Tue, 27 Apr 2021 07:16:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3uMlcOEKUrvvwwM847hV8ZVVTvVWQJROF4cvBxX1LRyYxxXFuRJtp639MlS5O6I3UnOiaDw==
X-Received: by 2002:a17:906:7942:: with SMTP id
 l2mr23262569ejo.314.1619533007182; 
 Tue, 27 Apr 2021 07:16:47 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id me3sm40082ejb.49.2021.04.27.07.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:16:46 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:16:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210427141644.n6vw5fprgjhrymfw@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:07:44PM +0800, Yanan Wang wrote:
> Add the Processor Properties Topology Table (PPTT) to present
> CPU topology information to ACPI guests. Note, while a DT boot
> Linux guest with a non-flat CPU topology will see socket and
> core IDs being sequential integers starting from zero, e.g.
> with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not required for PPTT tables to
>     be used and, due to the limitations of which IDs are selected
>     described above in (2), they are not helpful for QEMU, so we
>     don't build them with this patch. In the absence of them, Linux
>     assigns its own unique IDs. The maintainers have chosen not to use
>     counters from zero, but rather ACPI table offsets, which explains
>     why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> Tested-by: Jiajie Li <lijiajie11@huawei.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 2ad5dad1bf..03fd812d5a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                   vms->oem_table_id);
>  }
>  
> +/* PPTT */

Please point out the ACPI spec section "5.2.29 Processor Properties
Topology Table"

> +static void
> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

QEMU doesn't do this style, please write as

static void build_pptt(GArray *table_data, BIOSLinker *linker,
                       VirtMachineState *vms)

> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0, cpus = 0, socket = 0;
> +    MachineState *ms = MACHINE(vms);
> +    unsigned int smp_cores = ms->smp.cores;
> +    unsigned int smp_threads = ms->smp.threads;
> +
> +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> +
> +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {

Why not iterate from zero to ms->smp.sockets? With this type of loop if
the number of sockets doesn't correctly fit the number of possible cpus,
then you'll magically create new sockets that the user didn't want. That
case shouldn't be able to happen, though, because the smp parsing should
catch it. In any case, iterating sockets between zero it's number would
make more sense.

> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data, 1, /* Physical package */

If we want to pass the flags with in-argument-list comments, then please
make sure the flags are on separate lines. See below.

> +            0, socket, /* No parent */
> +            NULL, 0);  /* No private resources */

We don't need the 'No parent' and 'No private resources' comments.

        build_processor_hierarchy_node(table_data,
            (1 << 0), /* ACPI 6.2: Physical package */
            0, socket, NULL, 0);

> +
> +        for (core = 0; core < smp_cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (smp_threads <= 1) {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, /* Parent is a Socket */
> +                    NULL, 0);  /* No private resources */

Now I see why you were calling out 6.3 in the previous patch. I suggest
still keeping the function of the previous patch referencing 6.2, but
also keep referencing 6.3 here, like you already do

                build_processor_hierarchy_node(table_data,
                    (1 << 1) | /* ACPI Processor ID valid */
                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
                    socket_offset, uid++, NULL, 0);

> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data, 0,
> +                    socket_offset, core, /* Parent is a Socket */
> +                    NULL, 0); /* No private resources */

No need for these in-argument-comments that don't match up with the spec.

> +
> +                for (thread = 0; thread < smp_threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI Processor ID valid */
> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */

This looks good.

> +                        core_offset, uid++, /* Parent is a Core */
> +                        NULL, 0);  /* No private resources */

Don't need these comments.

> +                }
> +            }
> +        }
> +        cpus += smp_cores * smp_threads;

As stated above, we don't want this.

> +    }
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + pptt_start), "PPTT",
> +                 table_data->len - pptt_start, 2,
> +                 vms->oem_id, vms->oem_table_id);
> +}
> +
>  /* GTDT */
>  static void
>  build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_pptt(tables_blob, tables->linker, vms);
> +    }
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_gtdt(tables_blob, tables->linker, vms);
>  
> -- 
> 2.19.1
>

Besides some changes that I think should be changed back and the 6.3
flags, this patch looks very similar to [1], so I'd prefer my
authorship be maintained. However, if my authorship is dropped, then
my s-o-b should be replaced with a Co-developed-by.

[1] https://github.com/rhdrjones/qemu/commit/439b38d67ca1f2cbfa5b9892a822b651ebd05c11 

Thanks,
drew


