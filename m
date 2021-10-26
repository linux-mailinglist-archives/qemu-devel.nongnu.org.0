Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559943ACF6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:13:40 +0200 (CEST)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGeQ-0003a3-4o
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mfFty-0003Y0-2B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mfFts-00031j-Ep
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635229527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=APUUuX0ehUDsBD2q/LuY4Qm0tDRD9Bu7Y+Lx4g0WU9U=;
 b=YNcBev4jdaJgcxHyGEY/DMFq8yhH0h7XGnL4x9YbSTE++JinhMwnukAcw055pOuiwLRRa/
 xg4+REWp5TxNIcPpGioKSdQaUHnZ2T/yVT1trNyNWm8RSAk9TPqH1SOZBEaIvw/rGHGmfo
 T5BJRxAwLOgZbBhNPPoU6x/lbGRf2XI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-6fHAKLV2MSWfGTbFGf7kAw-1; Tue, 26 Oct 2021 02:25:26 -0400
X-MC-Unique: 6fHAKLV2MSWfGTbFGf7kAw-1
Received: by mail-ed1-f69.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso12103736edj.13
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 23:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=APUUuX0ehUDsBD2q/LuY4Qm0tDRD9Bu7Y+Lx4g0WU9U=;
 b=sClJHSHEzF017Tf6D3cD6kUCtwlmKI8o6DSW1wVVvjX+qCstHROuAd541kNWyyoGel
 Y79a4C33Je1pKNg4kLbi4Upf6AJY5qURCFL2/vhvnssS2yL+4o7mEewctqwjyie7i5qn
 NmTAng2RspaDxhr9j0qy0AnF8nWB4lsFry/THY/Xl6BEnhY5IrwcEG07oZKBHsi2e8wD
 7Td/IRM5VWrSak0FnaWKTW7mmWaFl3ywRiSUrrvJu/BEhx3HXXEYFc49g10VLeCTMED+
 fl+6oeUA10V3Fmo9zzfGMQ5gVkDdKckeMsYkAr4smdibBM5vJa9ZZWEem2/lxGwzEqia
 57KQ==
X-Gm-Message-State: AOAM530atKO0Fa9/slrsVPoFlkOPviEqNOMd4b6/haqJTAkk6LznHJlH
 bkWrRZJhnyikTJIwQ+Bg90IjbVbLBtTKepO+DaUJk5pw631DTSPkHCAnXa/B05NyjMjaxy26tZ3
 8GgERlp33v+gtvt4=
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr14170841edw.272.1635229525492; 
 Mon, 25 Oct 2021 23:25:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUWgYtWYZSouKfXN4Vw6tifzsKd0e5ecGVPWEv31H9SiomtgJPEzTA9yCqIrRtI0PV5MEkHA==
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr14170810edw.272.1635229525281; 
 Mon, 25 Oct 2021 23:25:25 -0700 (PDT)
Received: from gator.home (cst2-174-2.cust.vodafone.cz. [31.30.174.2])
 by smtp.gmail.com with ESMTPSA id r5sm6005597edy.86.2021.10.25.23.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 23:25:24 -0700 (PDT)
Date: Tue, 26 Oct 2021 08:25:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Expose empty NUMA nodes through ACPI
Message-ID: <20211026062523.xjsnwl64hte3zphi@gator.home>
References: <20211025234101.224705-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211025234101.224705-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 07:41:01AM +0800, Gavin Shan wrote:
> The empty NUMA nodes, where no memory resides, aren't exposed
> through ACPI SRAT table. It's not user preferred behaviour because
> the corresponding memory node devices are missed from the guest
> kernel as the following example shows, and memory can't be hot
> added to these empty NUMA nodes at later point.
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
>   node2

node2 shouldn't be in this list, should it?

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
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
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
> +        mem_base += ms->numa_state->nodes[i].node_mem;
>      }
>  
>      if (ms->nvdimms_state->is_enabled) {
> -- 
> 2.23.0
>

Besides the possible issue with the commit message,

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


