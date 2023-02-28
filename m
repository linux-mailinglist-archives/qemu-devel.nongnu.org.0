Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F66A5DB1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3Di-0000h6-0i; Tue, 28 Feb 2023 11:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX3Db-0000dS-Fk
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX3DZ-0000GL-N2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677603164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCPcUvMvu7nP29aOsIlxD6QR0a2L5RjsbiEQanCPXMs=;
 b=b8nla1aI0mqNNyZ7KYYP6dirpBKrrq6KzjB5Uo/HJyPT8Yn5n6aDY/vlrXAwIG+RJuzKqu
 jNRbXBe4Vka69s46y6uUqQ6zyqZm9mALp4nI+qlTzSyaEwkOTQj7dDvILNVi0yX5lYUDQL
 FHDz/GhL40TVd/6FL/nNtGVJHJ2JOX8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-GBoGdbFQNeWJwI467J-afA-1; Tue, 28 Feb 2023 11:52:43 -0500
X-MC-Unique: GBoGdbFQNeWJwI467J-afA-1
Received: by mail-qk1-f200.google.com with SMTP id
 eb13-20020a05620a480d00b00742be8a1a17so2983293qkb.18
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XCPcUvMvu7nP29aOsIlxD6QR0a2L5RjsbiEQanCPXMs=;
 b=RhxQOG5cf6i8tSkblB8ZkCWfM3lqaeIaEQT/PQpnxNyAORlJVfNczuUiiXpelAj65R
 uzsmoHJzD6L1zUQyJ8vKGjpkvJgXLsFO41lhBOpGASLr5fL8ocEjJBbSx3x0ud5Yj5o0
 XbeYd4DNWun0KRAZqNaZimh6ZzWzEfuwdGiuX0YxHPYjrEfQF/tzQrc+wmNC6aTehYIF
 6rLYHDXTY9OUhNIiICFdXmsmel9tenlC5SIhGer4g8kUPiDnee3wYhR9UZBzQT3RvEiS
 1F2cwdHsnHhxAvhiUgKptJmlC7t939/q2dMbhGBdI9PZovFY9swdDuNzwz2+eY0zi9sT
 HQSw==
X-Gm-Message-State: AO0yUKXpPeOZe+6ooiGOCpWGMFbfgynAqWC3w8WDPyT2GD5X62wvv6AK
 oWAbpWYv3WPOhaBoIBIPU77T+Ah50Owk3RErjKhegj7DWGo79IgU+7Q0DusiUNTBy1kc98hfa9n
 TNcJlK2El3m3aLQo=
X-Received: by 2002:ad4:5764:0:b0:570:5389:2216 with SMTP id
 r4-20020ad45764000000b0057053892216mr23125892qvx.22.1677603162741; 
 Tue, 28 Feb 2023 08:52:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/uz8OqIjjwh7S9K0lAIBuXFG61BjDEwlxKafpLeaMq/MFIZQ0Ur8W4akQRtbFJpK07n5ltzA==
X-Received: by 2002:ad4:5764:0:b0:570:5389:2216 with SMTP id
 r4-20020ad45764000000b0057053892216mr23125864qvx.22.1677603162470; 
 Tue, 28 Feb 2023 08:52:42 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a379303000000b007429722e620sm6117315qkd.10.2023.02.28.08.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:52:41 -0800 (PST)
Date: Tue, 28 Feb 2023 17:52:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230228175238.468e6446@imammedo.users.ipa.redhat.com>
In-Reply-To: <Y/2ujHMFrhnfJUiJ@sunil-laptop>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
 <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
 <Y/jJMnHaspaic2M3@sunil-laptop>
 <20230227164121.73d1ecc0@imammedo.users.ipa.redhat.com>
 <Y/2ujHMFrhnfJUiJ@sunil-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 28 Feb 2023 13:04:36 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> On Mon, Feb 27, 2023 at 04:41:21PM +0100, Igor Mammedov wrote:
> > On Fri, 24 Feb 2023 19:56:58 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> >   
> > > Hi Igor,
> > > 
> > > On Fri, Feb 24, 2023 at 01:53:43PM +0100, Igor Mammedov wrote:  
> > > > On Fri, 24 Feb 2023 14:06:58 +0530
> > > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > >     
> > > > > Add Multiple APIC Description Table (MADT) with the
> > > > > RINTC structure for each cpu.
> > > > > 
> > > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > ---
> > > > >  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 44 insertions(+)
> > > > > 
> > > > > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > > > > index 3a5e2e6d53..8b85b34c55 100644
> > > > > --- a/hw/riscv/virt-acpi-build.c
> > > > > +++ b/hw/riscv/virt-acpi-build.c
> > > > > @@ -32,6 +32,7 @@
> > > > >  #include "sysemu/reset.h"
> > > > >  #include "migration/vmstate.h"
> > > > >  #include "hw/riscv/virt.h"
> > > > > +#include "hw/riscv/numa.h"
> > > > >  
> > > > >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> > > > >  
> > > > > @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
> > > > >      free_aml_allocator();
> > > > >  }
> > > > >  
> > > > > +/* MADT */    
> > > > 
> > > > see build_srat() how this comment must look like
> > > >    
> > > Currently, even though ECRs are approved, the ACPI spec is not released
> > > for these MADT structures. I can add the spec version for the generic
> > > MADT but not for the RINTC. Same issue with a new table RHCT.
> > > What is the recommendation in such case?  
> > 
> > ther must be some draft variant of spec or a ticket where it was approved
> > or a reference impl. somewhere.
> >   
> Sure, I can add the ticket ID. Thanks!
and a link, later when new spec is published we can update it
to rev/chapter format.

> 
> > >   
> > > > > +static void build_madt(GArray *table_data,
> > > > > +                       BIOSLinker *linker,
> > > > > +                       RISCVVirtState *s)
> > > > > +{
> > > > > +    MachineState *ms = MACHINE(s);
> > > > > +    int socket;
> > > > > +    uint16_t base_hartid = 0;
> > > > > +    uint32_t cpu_id = 0;
> > > > > +
> > > > > +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> > > > > +                        .oem_table_id = s->oem_table_id };
> > > > > +
> > > > > +    acpi_table_begin(&table, table_data);
> > > > > +    /* Local Interrupt Controller Address */
> > > > > +    build_append_int_noprefix(table_data, 0, 4);
> > > > > +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> > > > > +
> > > > > +    /* RISC-V Local INTC structures per HART */
> > > > > +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> > > > > +        base_hartid = riscv_socket_first_hartid(ms, socket);
> > > > > +
> > > > > +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> > > > > +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> > > > > +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> > > > > +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> > > > > +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> > > > > +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> > > > > +            build_append_int_noprefix(table_data,
> > > > > +                                      (base_hartid + i), 8);   /* Hart ID  */
> > > > > +
> > > > > +            /* ACPI Processor UID  */
> > > > > +            build_append_int_noprefix(table_data, cpu_id, 4);    
> > > > 
> > > > cpu_id here seems to be unrelated to one in DSDT.
> > > > Could you explain how socket/hartid and cpu_id are related to each other?
> > > >     
> > > cpu_id should match the _UID. I needed two loops here to get the
> > > base_hartid of the socket. hart_id is the unique ID for each hart
> > > similar to MPIDR / APIC ID. I understand your point. Let me make DSDT
> > > also created using two loops so that both match.  
> > 
> > Why not reuse possible CPUs to describe topology there and then
> > use ids from it to build ACPI tables instead of inventing your own
> > cpu topo all over the place?
> > 
> > PS: look for possible_cpus and how it's used (virt-arm already uses it
> > although partially). And I'd like to avoid adding new ad-hoc ways
> > to describe CPU topology is current possible_cpu ca do the job.  
> 
> Okay, sure. Let me take a look at possible_cpus and use in cpu topology.
> Thanks!
maybe following could be of help:
  hw/i386/acpi-common.c:acpi_build_madt
  and see how madt_cpu is used.


