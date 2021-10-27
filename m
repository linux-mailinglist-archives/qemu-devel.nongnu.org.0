Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59443CE8C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:17:53 +0200 (CEST)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflce-0001NF-Ak
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfl2h-0005lE-H3
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfl2f-0007SC-07
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635349234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WW8JNbKaYWgKbKMAzLi3WEvCv45Hrsz4KQyCTn+SwdQ=;
 b=YprtzIcOzBqNCVQj/DJsTnjSilLmh5ISZb+zJEZiM3mr9neN+/V5zGBFxZELiAgTFGpJxg
 w6ONoiHtufkaPs/CsaeXBLAQ9TNwKIzAXjV5RkXgEBxpemnYjri01H2L9HYaP73iEwUR7d
 U7UhV3OZ2+HX4Gquv2ncc9y+S4ujFZU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-sy1H5LgSNMOmgLJKuU8Vzw-1; Wed, 27 Oct 2021 11:40:30 -0400
X-MC-Unique: sy1H5LgSNMOmgLJKuU8Vzw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a508709000000b003dd4b55a3caso2679565edb.19
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WW8JNbKaYWgKbKMAzLi3WEvCv45Hrsz4KQyCTn+SwdQ=;
 b=aZzCstKjvfLcr6GVuDJtHDimJ18KiSJDMzwGFqPVF7waJmdS88LuRoyxSXKhyTxWyZ
 dgwRJ71oN28WweSrjVrto9VJDN1W2s3+2/9G+zTVtv4w6Z68+6WSwE/p12yvkHomqipS
 wZaoyMoJa1jeARSxxKOZMnFxbfEEgM3a5SJrW9M79o6cxvuaiAVc+PDcPf9Gps4DPQFU
 5lfLXNNGczspIjiDdC4WOwnHGxJyuihODBbMj5g8Q/LUn2izEx8uaJdaSzdlnj5HOPhg
 oLnqN3PH6mOUps19in35KLCye5Ey/I2zXtecPo/Onni4gXtv+nCz/+bsEMruiml9/nLj
 bQoQ==
X-Gm-Message-State: AOAM531pkVCNKV80t5TqtB61V1S4OQWdVaTqmzC8kNEVlhG6p8oztpUZ
 NEIIBm5fgLnbYw5IRk+chv9ZtEr/KnbRcwgVvhUbMJaukTP3kUk75t0zISQa4Y0db5AP//An8wr
 J5ALnShnNaWqcIRw=
X-Received: by 2002:aa7:c941:: with SMTP id h1mr46650268edt.128.1635349229759; 
 Wed, 27 Oct 2021 08:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA5Kdodfm4eUgFU2hfNlv0EdP5yghDYEd+/GbH99jCv6BYpo9ghFFHOKxx7Js5GZu8EBOTAA==
X-Received: by 2002:aa7:c941:: with SMTP id h1mr46650229edt.128.1635349229507; 
 Wed, 27 Oct 2021 08:40:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f22sm133905ejh.74.2021.10.27.08.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 08:40:29 -0700 (PDT)
Date: Wed, 27 Oct 2021 17:40:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211027174028.1f16fcfb@redhat.com>
In-Reply-To: <20211027052958.280741-1-gshan@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Oct 2021 13:29:58 +0800
Gavin Shan <gshan@redhat.com> wrote:

> The empty NUMA nodes, where no memory resides, aren't exposed
> through ACPI SRAT table. It's not user preferred behaviour because
> the corresponding memory node devices are missed from the guest
> kernel as the following example shows. It means the guest kernel
> doesn't have the node information as user specifies. However,
> memory can be still hot added to these empty NUMA nodes when
> they're not exposed.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=512M            \
>   -object memory-backend-ram,id=mem1,size=512M            \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>   -numa node,nodeid=2                                     \
>   -numa node,nodeid=3                                     \
>      :
>   guest# ls /sys/devices/system/node | grep node
>   node0
>   node1
>   (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>   (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>   guest# ls /sys/devices/system/node | grep node
>   node0
>   node1
>   node2
>   guest# cat /sys/devices/system/node/node2/meminfo | grep MemTotal
>   Node 2 MemTotal:    1048576 kB
> 
> This exposes these empty NUMA nodes through ACPI SRAT table. With
> this applied, the corresponding memory node devices can be found
> from the guest. Note that the hotpluggable capability is explicitly
> given to these empty NUMA nodes for sake of completeness.
> 
>   guest# ls /sys/devices/system/node | grep node
>   node0
>   node1
>   node2
>   node3
>   guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
>   Node 3 MemTotal:    0 kB
>   (qemu) object_add memory-backend-ram,id=hp-mem0,size=1G
>   (qemu) device_add pc-dimm,id=hp-dimm0,node=3,memdev=hp-mem0
>   guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
>   Node 3 MemTotal:    1048576 kB

I'm still not sure why this is necessary and if it's a good idea,
is there a real hardware that have such nodes?

SRAT is used to assign resources to nodes, I haven't seen it being
used  as means to describe an empty node anywhere in the spec.
(perhaps we should not allow empty nodes on QEMU CLI at all).

Then if we really need this, why it's done for ARM only
and not for x86?

> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
> v2: Improved commit log as suggested by Drew and Igor.
> ---
>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..a4c95b2f64 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
>      AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> +    MemoryAffinityFlags flags;
>  
>      acpi_table_begin(&table, table_data);
>      build_append_int_noprefix(table_data, 1, 4); /* Reserved */
> @@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      mem_base = vms->memmap[VIRT_MEM].base;
>      for (i = 0; i < ms->numa_state->num_nodes; ++i) {
> -        if (ms->numa_state->nodes[i].node_mem > 0) {
> -            build_srat_memory(table_data, mem_base,
> -                              ms->numa_state->nodes[i].node_mem, i,
> -                              MEM_AFFINITY_ENABLED);
> -            mem_base += ms->numa_state->nodes[i].node_mem;
> +        if (ms->numa_state->nodes[i].node_mem) {
> +            flags = MEM_AFFINITY_ENABLED;
> +        } else {
> +            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
>          }
> +
> +        build_srat_memory(table_data, mem_base,
> +                          ms->numa_state->nodes[i].node_mem, i, flags);
that will create 0 length memory range, which is "Enabled",
I'm not sure it's safe thing to do.

As side effect this will also create empty ranges for memory-less
nodes that have only CPUs, where it's not necessary.

I'd really try avoid adding empty ranges unless it hard requirement,
described somewhere or fixes a bug that can't be fixed elsewhere.

> +        mem_base += ms->numa_state->nodes[i].node_mem;
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {


