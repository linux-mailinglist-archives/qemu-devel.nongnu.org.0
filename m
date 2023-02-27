Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B16A4646
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:43:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfdL-0000HO-MF; Mon, 27 Feb 2023 10:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWfdJ-0000Gv-Nr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:41:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWfdF-0002nP-0Z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677512492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbwzvKv2zG+mrCQxPtTTMvgM+pkTWTz0xo61SbVi9i8=;
 b=WD8Y/iY43QCmZIqKNYuvXv/U2/dCZ1CPj3KYwoW/e8erjuPgQgwKmVfkeYVTOwqP4pzWgU
 LnsLjD7qO4ZXVB7ma8E/wA3PQWz0KImuyuhBHfBKnsTPAUnUdcV6+0Gva0ra4IAiMNevHx
 9s7fGKFcmjbSVq9tzL4h1HFf5f5m6AQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-33-4X_X8-A2M5CZ8uQ_4z8iIw-1; Mon, 27 Feb 2023 10:41:27 -0500
X-MC-Unique: 4X_X8-A2M5CZ8uQ_4z8iIw-1
Received: by mail-qk1-f198.google.com with SMTP id
 u28-20020a05620a085c00b0073b88cae2f5so4213435qku.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbwzvKv2zG+mrCQxPtTTMvgM+pkTWTz0xo61SbVi9i8=;
 b=J65K+afiGPHqEKWnfUgnN3X79rPdzdQuqQQBHCn5MJCKa/k715lnFJOil+2+mzpIsk
 KKqrgzlQoYO4raSFDk1FVno0+/YXlkMjpmc2VwwfdcPWXR2L+vR+NOe2/8/8srqgKXuR
 fGeaPMozuORvWDKaoTvs+e1+w8H+k8oHMjJ+ajbfEyM7HOitXEWxQLmTUbMXbyeA6ODs
 2EPjTiF5PtCpnc/TUPsu/zgMWVVR2pbHqYxFOMAPL39INfbSMqMgrREGw076P3JZegXC
 Nh/uyErWlRJNPbNCvPMHly1NtSUTKkqofvTK94MEqmPuOy/H8C9EzI6q247xkytApV1a
 k2dA==
X-Gm-Message-State: AO0yUKWm37RYb2rtc0IHaxjxm8xK6nDxHwSTPJKowggvzlZYOyfEugUG
 P4oGCPsM1doy54YDAi3zZb2tbFKpr3n+0EYl2f7NLnv32dce8DGCCMtiyDIpR5VJh57mgD3Df5J
 ORQOk0gxo1vtUSmM=
X-Received: by 2002:a05:622a:1a94:b0:3bf:ca3d:673c with SMTP id
 s20-20020a05622a1a9400b003bfca3d673cmr13240586qtc.2.1677512487147; 
 Mon, 27 Feb 2023 07:41:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9Lf0gjlCBaRtChf6G5hRHzXO2pQB4lYHVWR8IL/L7BA39Ri/WdlYzT6W5sEDeEzunfNJDjXQ==
X-Received: by 2002:a05:622a:1a94:b0:3bf:ca3d:673c with SMTP id
 s20-20020a05622a1a9400b003bfca3d673cmr13240539qtc.2.1677512486714; 
 Mon, 27 Feb 2023 07:41:26 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 s184-20020a372cc1000000b0073bb00eb0besm5095139qkh.22.2023.02.27.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 07:41:25 -0800 (PST)
Date: Mon, 27 Feb 2023 16:41:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230227164121.73d1ecc0@imammedo.users.ipa.redhat.com>
In-Reply-To: <Y/jJMnHaspaic2M3@sunil-laptop>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
 <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
 <Y/jJMnHaspaic2M3@sunil-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 24 Feb 2023 19:56:58 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Hi Igor,
> 
> On Fri, Feb 24, 2023 at 01:53:43PM +0100, Igor Mammedov wrote:
> > On Fri, 24 Feb 2023 14:06:58 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> >   
> > > Add Multiple APIC Description Table (MADT) with the
> > > RINTC structure for each cpu.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > > 
> > > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > > index 3a5e2e6d53..8b85b34c55 100644
> > > --- a/hw/riscv/virt-acpi-build.c
> > > +++ b/hw/riscv/virt-acpi-build.c
> > > @@ -32,6 +32,7 @@
> > >  #include "sysemu/reset.h"
> > >  #include "migration/vmstate.h"
> > >  #include "hw/riscv/virt.h"
> > > +#include "hw/riscv/numa.h"
> > >  
> > >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> > >  
> > > @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
> > >      free_aml_allocator();
> > >  }
> > >  
> > > +/* MADT */  
> > 
> > see build_srat() how this comment must look like
> >  
> Currently, even though ECRs are approved, the ACPI spec is not released
> for these MADT structures. I can add the spec version for the generic
> MADT but not for the RINTC. Same issue with a new table RHCT.
> What is the recommendation in such case?

ther must be some draft variant of spec or a ticket where it was approved
or a reference impl. somewhere.

> 
> > > +static void build_madt(GArray *table_data,
> > > +                       BIOSLinker *linker,
> > > +                       RISCVVirtState *s)
> > > +{
> > > +    MachineState *ms = MACHINE(s);
> > > +    int socket;
> > > +    uint16_t base_hartid = 0;
> > > +    uint32_t cpu_id = 0;
> > > +
> > > +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> > > +                        .oem_table_id = s->oem_table_id };
> > > +
> > > +    acpi_table_begin(&table, table_data);
> > > +    /* Local Interrupt Controller Address */
> > > +    build_append_int_noprefix(table_data, 0, 4);
> > > +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> > > +
> > > +    /* RISC-V Local INTC structures per HART */
> > > +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> > > +        base_hartid = riscv_socket_first_hartid(ms, socket);
> > > +
> > > +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> > > +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> > > +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> > > +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> > > +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> > > +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> > > +            build_append_int_noprefix(table_data,
> > > +                                      (base_hartid + i), 8);   /* Hart ID  */
> > > +
> > > +            /* ACPI Processor UID  */
> > > +            build_append_int_noprefix(table_data, cpu_id, 4);  
> > 
> > cpu_id here seems to be unrelated to one in DSDT.
> > Could you explain how socket/hartid and cpu_id are related to each other?
> >   
> cpu_id should match the _UID. I needed two loops here to get the
> base_hartid of the socket. hart_id is the unique ID for each hart
> similar to MPIDR / APIC ID. I understand your point. Let me make DSDT
> also created using two loops so that both match.

Why not reuse possible CPUs to describe topology there and then
use ids from it to build ACPI tables instead of inventing your own
cpu topo all over the place?

PS: look for possible_cpus and how it's used (virt-arm already uses it
although partially). And I'd like to avoid adding new ad-hoc ways
to describe CPU topology is current possible_cpu ca do the job.

> Thank you very much for your review!
> Sunil
> 


