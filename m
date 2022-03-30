Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA094EC50B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:58:19 +0200 (CEST)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXty-0007Yz-Ls
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:58:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZXo0-0000GZ-Hi
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZXny-0003iG-Dv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648644725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ywbdNTgZ93pcEKTe8oCQKqoDojzMcXWJA9rZ1OaKiU4=;
 b=M/SbIDdJgAwh9jz2uQ/uDnVI5vsJzw9O0/qiaOc8RvGlqqaETyPTTIu4itGbqRBqFsthn7
 BFfgudKDrihRLu8i69mdvjBmycjckF2ZzciPFG6/aU7zmF6rQzwM9F/mSenYY6fUwdsa3M
 cQVjbAjpArTTHYrCuddaerufl1Y2BcE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-hDuj6zmhPgCT0or8mL0wMw-1; Wed, 30 Mar 2022 08:52:04 -0400
X-MC-Unique: hDuj6zmhPgCT0or8mL0wMw-1
Received: by mail-ej1-f71.google.com with SMTP id
 gx12-20020a1709068a4c00b006df7e8181ceso9772544ejc.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 05:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywbdNTgZ93pcEKTe8oCQKqoDojzMcXWJA9rZ1OaKiU4=;
 b=E3/N3rQSNV5gXz7IIBr4ItISO2c4I3Qsrrbcq6zlOKXQJCHBjkQsxCYHceZHo6ifZQ
 NX/fbflUvDDNrYBDG41ShgmwjLaE4Bby0NJPPZcTVPpHghpicCsCqR9BCxYVIyDN8ZBG
 E3pn9SB0uhrDz6qs9vAhuDR2krjFG2/7N1JY57aoRGBJczXr9Ws34FduodZnPWT+o0Hp
 S/DdQA3lfJgl/0QhrXo+envT5Y70Yd3+v31FyohIeS+FC9ATIOCERX1DdhaAC1Q9zG0y
 lbvnGp75931j/PzudNDp1tWG0jliAGA9W8ZohigC5byk3hUZR4ngMIJY2fiQvsqZus9D
 CKtw==
X-Gm-Message-State: AOAM531MIzYhENekAa4Z0Se1Dy9ZALHM6N4iv44ikNZf/JyCnQFuz5aZ
 pYUH4I0S7InmucmwMhvJjMtrE7oU4b8j6LT4h+nyx+KUuXsZeC2roiFtvfnCpFO7mMEmGSCKJfZ
 7lKYofMQU/0zegbQ=
X-Received: by 2002:a05:6402:51d2:b0:419:7d2e:9d0 with SMTP id
 r18-20020a05640251d200b004197d2e09d0mr10373755edd.82.1648644722853; 
 Wed, 30 Mar 2022 05:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpnbKXECUJntcTieVSWOsGTHeH/9SBSsNMc4AMQDQaIeZwq96hKDB9JC2PPMd4qYquhWDq8A==
X-Received: by 2002:a05:6402:51d2:b0:419:7d2e:9d0 with SMTP id
 r18-20020a05640251d200b004197d2e09d0mr10373721edd.82.1648644722544; 
 Wed, 30 Mar 2022 05:52:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 da19-20020a056402177300b00413583e0996sm9547746edb.14.2022.03.30.05.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 05:52:02 -0700 (PDT)
Date: Wed, 30 Mar 2022 14:52:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 4/4] hw/arm/virt: Unify ACPI processor ID in MADT and
 SRAT table
Message-ID: <20220330145201.77bdcb6c@redhat.com>
In-Reply-To: <5b7686b4-b0e1-a9ec-f546-2161baa0ed3e@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-5-gshan@redhat.com>
 <20220325150020.0063c782@redhat.com>
 <5b7686b4-b0e1-a9ec-f546-2161baa0ed3e@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Mar 2022 03:08:19 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 3/25/22 10:00 PM, Igor Mammedov wrote:
> > On Wed, 23 Mar 2022 15:24:38 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> The value of the following field has been used in ACPI PPTT table
> >> to identify the corresponding processor. This takes the same field
> >> as the ACPI processor ID in MADT and SRAT tables.
> >>
> >>    ms->possible_cpus->cpus[i].props.thread_id  
> > 
> > thread-id could be something different than ACPI processor ID
> > (to be discussed in the first patch).
> > 
> > I'd prefer to keep both decoupled, i.e. use [0 - possible_cpus->len)
> > for ACPI processor ID as it's done with x86 madt/srat and ACPI CPU
> > hotplug code. So we could reuse at least the later when implementing
> > CPU hotplug for arm/virt and it's good from consistency point of view.
> >   
> 
> Yeah, I think so, thread-id and ACPI processor UID could be different.
> thread IDs could be overlapped on multiple CPUs, who belongs to different
> socket/die/core. However, ACPI processor UID should be unique for the
> CPU in the whole system.
> 
> If you agree, Lets use [0 - possible_cpus->len] in next respin.

Agreed.

> What I
> need to do is dropping PATCH[4/4] and replacing @thread_id with @n in
> build_pptt() of PATCH[3/4].
> 
> Thanks,
> Gavin
> 
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/arm/virt-acpi-build.c | 12 +++++++++---
> >>   1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 449fab0080..7fedb56eea 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -534,13 +534,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   
> >>       for (i = 0; i < cpu_list->len; ++i) {
> >>           uint32_t nodeid = cpu_list->cpus[i].props.node_id;
> >> +        uint32_t thread_id = cpu_list->cpus[i].props.thread_id;
> >> +
> >>           /*
> >>            * 5.2.16.4 GICC Affinity Structure
> >>            */
> >>           build_append_int_noprefix(table_data, 3, 1);      /* Type */
> >>           build_append_int_noprefix(table_data, 18, 1);     /* Length */
> >>           build_append_int_noprefix(table_data, nodeid, 4); /* Proximity Domain */
> >> -        build_append_int_noprefix(table_data, i, 4); /* ACPI Processor UID */
> >> +        build_append_int_noprefix(table_data,
> >> +                                  thread_id, 4); /* ACPI Processor UID */
> >>           /* Flags, Table 5-76 */
> >>           build_append_int_noprefix(table_data, 1 /* Enabled */, 4);
> >>           build_append_int_noprefix(table_data, 0, 4); /* Clock Domain */
> >> @@ -704,6 +707,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   {
> >>       int i;
> >>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> >> +    MachineState *ms = MACHINE(vms);
> >>       const MemMapEntry *memmap = vms->memmap;
> >>       AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
> >>                           .oem_table_id = vms->oem_table_id };
> >> @@ -725,8 +729,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>       build_append_int_noprefix(table_data, vms->gic_version, 1);
> >>       build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
> >>   
> >> -    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
> >> +    for (i = 0; i < ms->smp.cpus; i++) {
> >>           ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> >> +        uint32_t thread_id = ms->possible_cpus->cpus[i].props.thread_id;
> >>           uint64_t physical_base_address = 0, gich = 0, gicv = 0;
> >>           uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
> >>           uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
> >> @@ -743,7 +748,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>           build_append_int_noprefix(table_data, 76, 1);   /* Length */
> >>           build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> >>           build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
> >> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> >> +        build_append_int_noprefix(table_data,
> >> +                                  thread_id, 4);        /* ACPI Processor UID */
> >>           /* Flags */
> >>           build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
> >>           /* Parking Protocol Version */  
> >   
> 


