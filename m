Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A3638736B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:43:45 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuOG-0000G3-7n
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuN4-0007o0-Mu
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:42:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuN2-0002Ld-IZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621323747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUvY52dngLI4C48EpQ0qr2LsH5Jxir/ijQxmffabwHM=;
 b=OkQBi9L/v1mzueEgz5TjTYMK4rpFU7D2F87tsNYCqhL+yD6NXGTA5LLEJKyu0tEpPjK9JK
 XHiMvapO4E7w+Oen3bj6/6lAwKcb2EbJokWr+sy1Y3pBkfqYgx5M2g4nIFkAnZRKwxJM8x
 V/AZpEBC41KNQ2NYnywMq8NspBm7UgA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-ikDUMHwCN0SoSriiOEzLqw-1; Tue, 18 May 2021 03:42:25 -0400
X-MC-Unique: ikDUMHwCN0SoSriiOEzLqw-1
Received: by mail-ej1-f72.google.com with SMTP id
 m18-20020a1709062352b02903d2d831f9baso2014949eja.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dUvY52dngLI4C48EpQ0qr2LsH5Jxir/ijQxmffabwHM=;
 b=gjJG45XKXS+IvhPiaBJFWLI5NNoqDmZC6pFKefI7onR41UkpWiWdZRAcxf883ys7z2
 FmYenJNd1JVauWzQIRSVRdc87DgTovNKnDctYUCwZNycpcPTgGYFWMdtrfBijSIBb4FN
 VOhDi/0Qjy9WQ7A8KTFJ6AsFFBwa/9NZxDgiOX+Wux1mmKtH6H6rAbg8ZVzVMsXcUHrp
 PtX/361fj7QJW/21n3SwFfsGq0ZHEHk13G/jm9rOUYjGlxavnwJcEFO6ci4HJ5tmWeXT
 YvI1C1H9WRvtD2YKANwZ36T0uLu9IlX668fVb73CpGM0L1+38bRBsCR3kGSyYZXhXNRM
 MdUw==
X-Gm-Message-State: AOAM531c4S1F8Ox6OaHvORMrPLma9BZm203PkZ16oxczzY2f0cMKLwjv
 TdiMix2P7QJDs3JzivE3JnPJ3fYbb8RsN2Q/ZuEvZ5trVEBpt4Yqiu8/TLqmsUFKgN237gtfGFp
 V0MJuA5va5iErt7g=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr4731103ejf.25.1621323744610; 
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwenel5BVwQdNy5PyOSElfzWZ9lOQG+vg0tRoYHHhFvXcZ6bq36B5CL247bj/mpvYFX/W+MPA==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr4731062ejf.25.1621323744293; 
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id h9sm9978486edr.10.2021.05.18.00.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
Date: Tue, 18 May 2021 09:42:21 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210518074221.umezsdedzyzmcbsk@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 18, 2021 at 07:17:56AM +0000, Salil Mehta wrote:
> > From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
> > On Behalf Of wangyanan (Y)
> > Sent: Thursday, May 13, 2021 6:10 AM
> > 
> > Hi Drew,
> > 
> > I got a question below, and hope your reply. Thanks!
> > On 2021/4/13 16:07, Yanan Wang wrote:
> > > Add the Processor Properties Topology Table (PPTT) to present
> > > CPU topology information to ACPI guests. Note, while a DT boot
> > > Linux guest with a non-flat CPU topology will see socket and
> > > core IDs being sequential integers starting from zero, e.g.
> > > with -smp 4,sockets=2,cores=2,threads=1
> > >
> > > a DT boot produces
> > >
> > >   cpu:  0 package_id:  0 core_id:  0
> > >   cpu:  1 package_id:  0 core_id:  1
> > >   cpu:  2 package_id:  1 core_id:  0
> > >   cpu:  3 package_id:  1 core_id:  1
> > >
> > > an ACPI boot produces
> > >
> > >   cpu:  0 package_id: 36 core_id:  0
> > >   cpu:  1 package_id: 36 core_id:  1
> > >   cpu:  2 package_id: 96 core_id:  2
> > >   cpu:  3 package_id: 96 core_id:  3
> > >
> > > This is due to several reasons:
> > >
> > >   1) DT cpu nodes do not have an equivalent field to what the PPTT
> > >      ACPI Processor ID must be, i.e. something equal to the MADT CPU
> > >      UID or equal to the UID of an ACPI processor container. In both
> > >      ACPI cases those are platform dependant IDs assigned by the
> > >      vendor.
> > >
> > >   2) While QEMU is the vendor for a guest, if the topology specifies
> > >      SMT (> 1 thread), then, with ACPI, it is impossible to assign a
> > >      core-id the same value as a package-id, thus it is not possible
> > >      to have package-id=0 and core-id=0. This is because package and
> > >      core containers must be in the same ACPI namespace and therefore
> > >      must have unique UIDs.
> > >
> > >   3) ACPI processor containers are not required for PPTT tables to
> > >      be used and, due to the limitations of which IDs are selected
> > >      described above in (2), they are not helpful for QEMU, so we
> > >      don't build them with this patch. In the absence of them, Linux
> > >      assigns its own unique IDs. The maintainers have chosen not to use
> > >      counters from zero, but rather ACPI table offsets, which explains
> > >      why the numbers are so much larger than with DT.
> > >
> > >   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
> > >      match the logical CPU IDs, because these IDs must be equal to the
> > >      MADT CPU UID (as no processor containers are present), and QEMU
> > >      uses the logical CPU ID for these MADT IDs.
> > >
> > > Tested-by: Jiajie Li <lijiajie11@huawei.com>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 63 insertions(+)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 2ad5dad1bf..03fd812d5a 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> > VirtMachineState *vms)
> > >                    vms->oem_table_id);
> > >   }
> > >
> > > +/* PPTT */
> > > +static void
> > > +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > +{
> > > +    int pptt_start = table_data->len;
> > > +    int uid = 0, cpus = 0, socket = 0;
> > > +    MachineState *ms = MACHINE(vms);
> > > +    unsigned int smp_cores = ms->smp.cores;
> > > +    unsigned int smp_threads = ms->smp.threads;
> > > +
> > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > +
> > > +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
> > > +        uint32_t socket_offset = table_data->len - pptt_start;
> > > +        int core;
> > > +
> > > +        build_processor_hierarchy_node(
> > > +            table_data, 1, /* Physical package */
> > > +            0, socket, /* No parent */
> > > +            NULL, 0);  /* No private resources */
> > > +
> > > +        for (core = 0; core < smp_cores; core++) {
> > > +            uint32_t core_offset = table_data->len - pptt_start;
> > > +            int thread;
> > > +
> > > +            if (smp_threads <= 1) {
> > > +                build_processor_hierarchy_node(
> > > +                    table_data,
> > > +                    (1 << 1) | /* ACPI Processor ID valid */
> > > +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > +                    socket_offset, uid++, /* Parent is a Socket */
> > > +                    NULL, 0);  /* No private resources */
> > > +            } else {
> > > +                build_processor_hierarchy_node(
> > > +                    table_data, 0,
> > > +                    socket_offset, core, /* Parent is a Socket */
> > > +                    NULL, 0); /* No private resources */
> > > +
> > > +                for (thread = 0; thread < smp_threads; thread++) {
> > > +                    build_processor_hierarchy_node(
> > > +                        table_data,
> > > +                        (1 << 1) | /* ACPI Processor ID valid */
> > > +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> > > +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > +                        core_offset, uid++, /* Parent is a Core */
> > > +                        NULL, 0);  /* No private resources */
> > > +                }
> > > +            }
> > > +        }
> > > +        cpus += smp_cores * smp_threads;
> > > +    }
> > > +
> > > +    build_header(linker, table_data,
> > > +                 (void *)(table_data->data + pptt_start), "PPTT",
> > > +                 table_data->len - pptt_start, 2,
> > > +                 vms->oem_id, vms->oem_table_id);
> > > +}
> > > +
> > >   /* GTDT */
> > >   static void
> > >   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms,
> > AcpiBuildTables *tables)
> > >       acpi_add_table(table_offsets, tables_blob);
> > >       build_madt(tables_blob, tables->linker, vms);
> > >
> > > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > I'm not really sure why we need to care about "ms->smp.cpus > 1" here?
> > 
> > IMO, just like MADT in which we create both ENABLED and DISABLED
> > gicc nodes no matter of number of ENABLED nodes is one or not, we
> > should create PPTT table for all the possible cpus and not care about
> > number of smp cpus, too. This will be more consistent with the ACPI
> > specification and the PPTT table will be used for ACPI cpu hotplug in
> > the future even with  "smp.cpus == 1".
> 
> 
> A humble request:
> Let us not anticipate the changes of vcpu Hotplug here. Things are fluid
> with respect to the vcpu Hotplug right now and I think it will not be
> right to base PPTT Table changes in anticipation of something we are not
> sure of what it looks like.
> 
> Any such decisions should be postponed and be made part of the actual
> vcpu Hotplug changes when(and if ever) they come for ARM64. This will
> also ensure proper review of such changes and useful in that particular
> context.

Hi Salil,

Can you please elaborate on this and send some pointers to the hot plug
discussions? You're not saying that we shouldn't try to generate PPTT
tables for AArch64 guests until a solution for hot plug has been
determined, are you? If so, I don't think I would agree with that. There
are benefits to properly describing cpu topology to guests, even without
hot plug. Those benefits, when vcpu pinning is used, are the same benefits
as for the host, which already use PPTT tables to describe topology, even
though hot plug isn't supported.

Now, if you're saying we should only generate tables for smp.cpus, not
smp.maxcpus, because hot plug isn't supported anyway, then I see your
point. But, it'd be better to require smp.cpus == smp.maxcpus in our
smp_parse function to do that, which we've never done before, so we may
have trouble supporting existing command lines.

Thanks,
drew

> 
> 
> Thanks
> 
> > 
> > Care of "smp.cpus > 1" in the DT cpu-map part makes sense to me,
> > because we are required to only add present cpu nodes to the DT and
> > Linux Doc says that a cpu-map is not needed for uniprocessor systems.
> > 
> > Thanks,
> > Yanan
> > > +        acpi_add_table(table_offsets, tables_blob);
> > > +        build_pptt(tables_blob, tables->linker, vms);
> > > +    }
> > > +
> > >       acpi_add_table(table_offsets, tables_blob);
> > >       build_gtdt(tables_blob, tables->linker, vms);
> > >
> 


