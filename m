Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83743CD5E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:18:23 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkh4-00070D-6r
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfjxn-00048a-CT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfjxi-0000v2-B9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635345088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coChYFomU7o4Ce+HeCP18IomfCTFSt1HNUC3K53689g=;
 b=XOgsEJ8cmQoeeoN5AIsUEvOTNvpZgeg+hCJqfszkRdvjxAJmJSyZuCbFKsQqbXHj+GliuD
 E5UozDXtflDVGJ0fGodhgvtj9LNzQ/UzwjLFGqAphCL0CubwtyfiSl349aeTvCcwqpuxgk
 /2GW7XvBNHtQCCYFllSdVv+hSJ4Hl64=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-oFWq_lIaMT6ohZTWL6Q9VA-1; Wed, 27 Oct 2021 10:31:27 -0400
X-MC-Unique: oFWq_lIaMT6ohZTWL6Q9VA-1
Received: by mail-ed1-f70.google.com with SMTP id
 s18-20020a056402521200b003dd5902f4f3so2433005edd.23
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=coChYFomU7o4Ce+HeCP18IomfCTFSt1HNUC3K53689g=;
 b=6VEhs4JB9lWGKKevk875sz9r16RtvCqAwenuCYHxXzG8znvK8oTz9SZhz2ktWUfK4A
 /qgq6Uay/q0JbK0lqmS+OSq42+f+iBcaEuY7HQ78oE44aLcmGXMVbZk3t8e7HNRvq9vk
 P/dMJWKEZI0sfTxWdEeXKudUDhhOmyij68bv4sPszn88NqvYqCu980EWmKQ+up3LdX9e
 lkKKEHghOg84JEUGn7awdHEPet1j2XlXUBOuWLpgezC5SutPWnw/i7F0MhLIE4SCSmYv
 2Ug521fD+lfeY3yy/QZ2UltIOUuzeEuLASzIFWzhTr19rDr1treEuQDi7nosQ01CX9cy
 A4Pg==
X-Gm-Message-State: AOAM531TmYUMc11fZo4D59i79Jkh9SfYK5B5QGttIt1ZrCTvaAnuWvJE
 L6OJ7Xo8tGTksj3ftdE+7l1CX73Lvp/gx4omFu9lYd8H1zWAv7MTeItidxfYyfnCvuI7yaBqHGK
 C4ptR9c4EeQt1I+A=
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr38846713ejw.92.1635345085492; 
 Wed, 27 Oct 2021 07:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjoDA8T36XMJV9I+IveQ7IdmuLt3IvpHDsoY3xcyA41KE9UyahNCHZlc5zKKaMh73C5bm+Gw==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr38846660ejw.92.1635345085118; 
 Wed, 27 Oct 2021 07:31:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id qa16sm21795ejc.120.2021.10.27.07.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:31:24 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:31:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211027163123.270d077b@redhat.com>
In-Reply-To: <b7b100dc-0555-774a-5b98-2ebc4f2645b0@redhat.com>
References: <20211025234101.224705-1-gshan@redhat.com>
 <20211026114751.427205bc@redhat.com>
 <b7b100dc-0555-774a-5b98-2ebc4f2645b0@redhat.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Oct 2021 16:20:30 +1100
Gavin Shan <gshan@redhat.com> wrote:

> On 10/26/21 8:47 PM, Igor Mammedov wrote:
> > On Tue, 26 Oct 2021 07:41:01 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> The empty NUMA nodes, where no memory resides, aren't exposed
> >> through ACPI SRAT table. It's not user preferred behaviour because
> >> the corresponding memory node devices are missed from the guest
> >> kernel as the following example shows, and memory can't be hot
> >> added to these empty NUMA nodes at later point.  
> > 
> > a error message one gets would be useful here.
> > 
> > btw:
> > memory hotplug seems to work for x86 without adding empty nodes.
> > So it beg a question, if absence of empty nodes is the issue here.
> >   
> 
> Yes, the memory can be still hot added even the empty NUMA nodes
> aren't exposed. However, we still need to expose them so that
> the guest kernel has the information as the users specifies.

commit message says that memory can't be hotplugged though ...
so what doesn't work/is broken currently.

Question is why do we need to expose empty nodes
that aren't warranted by any present hardware (cpu/mem)?
(so far I see it as extra burden on qemu without any gain)

SRAT is typically used to describe startup configuration,
any changes to topology later during runtime are
made using _PXM objects.



> 
> I will make the commit log more precise in v2.
> 
> >>
> >>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
> >>    -accel kvm -machine virt,gic-version=host               \
> >>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
> >>    -m 1024M,slots=16,maxmem=64G                            \
> >>    -object memory-backend-ram,id=mem0,size=512M            \
> >>    -object memory-backend-ram,id=mem1,size=512M            \
> >>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
> >>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
> >>    -numa node,nodeid=2                                     \
> >>    -numa node,nodeid=3                                     \
> >>       :
> >>    guest# ls /sys/devices/system/node | grep node
> >>    node0
> >>    node1
> >>    node2
> >>
> >> This exposes these empty NUMA nodes through ACPI SRAT table. With
> >> this applied, the corresponding memory node devices can be found
> >> from the guest. Note that the hotpluggable capability is explicitly
> >> given to these empty NUMA nodes for sake of completeness.
> >>
> >>    guest# ls /sys/devices/system/node | grep node
> >>    node0
> >>    node1
> >>    node2
> >>    node3
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/arm/virt-acpi-build.c | 14 +++++++++-----
> >>   1 file changed, 9 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 674f902652..a4c95b2f64 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>       const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
> >>       AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
> >>                           .oem_table_id = vms->oem_table_id };
> >> +    MemoryAffinityFlags flags;
> >>   
> >>       acpi_table_begin(&table, table_data);
> >>       build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> >> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   
> >>       mem_base = vms->memmap[VIRT_MEM].base;
> >>       for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> >> -        if (ms->numa_state->nodes[i].node_mem > 0) {
> >> -            build_srat_memory(table_data, mem_base,
> >> -                              ms->numa_state->nodes[i].node_mem, i,
> >> -                              MEM_AFFINITY_ENABLED);
> >> -            mem_base += ms->numa_state->nodes[i].node_mem;
> >> +        if (ms->numa_state->nodes[i].node_mem) {
> >> +            flags = MEM_AFFINITY_ENABLED;
> >> +        } else {
> >> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
> >>           }
> >> +
> >> +        build_srat_memory(table_data, mem_base,
> >> +                          ms->numa_state->nodes[i].node_mem, i, flags);
> >> +        mem_base += ms->numa_state->nodes[i].node_mem;
> >>       }
> >>   
> >>       if (ms->nvdimms_state->is_enabled) {  
> >   
> 
> Thanks,
> Gavin
> 


