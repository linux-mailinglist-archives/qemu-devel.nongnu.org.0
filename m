Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBD432F6F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:29:48 +0200 (CEST)
Received: from localhost ([::1]:55726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjZD-0006EQ-5q
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjNG-0004QU-AR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjND-0006BB-Lb
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcY1y4jcKtFMEgVr6+Fu3di88tM18URkC3d+VWc8xTM=;
 b=Gg/99Av3yS21ASyc30Fmrjur8tt3i59Zgt3dSFaR3lKXU+gFLwWqJOP29eRw23kumCf9UN
 nU+ekd4uHMQ0N4PZsKTf8GtN024MVS3pDxSVZh0LhYPxfyWiarhSxz30Dd+5+oeYwp2k6h
 gSmqgKOOQRVGH+5vXpluwrSe87cskwg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-NrdnV1dzPj2GTFZXhmajxg-1; Tue, 19 Oct 2021 03:17:21 -0400
X-MC-Unique: NrdnV1dzPj2GTFZXhmajxg-1
Received: by mail-wr1-f70.google.com with SMTP id
 10-20020a5d47aa000000b001610cbda93dso9723355wrb.23
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcY1y4jcKtFMEgVr6+Fu3di88tM18URkC3d+VWc8xTM=;
 b=hFNft6mN/xjJo/IwWC0SmnvLXNx0ctAC2X9OI+UTkWFKWD6u9hsodUOc6Sb72c+sQb
 eXkJ4a08f46Rf44+2TDj9yekooptXUGMUw3DmLx/tHpXHXycC3VdkJThIkJEwNQ6T7fC
 eBeTSCEWgkmTVEkRvlIouGjnQ0m8nTVescm0cC5ralpW0OQzIzNqZnZjY4X1Or8nEAgo
 XvOpT+nYijW0+6F0wQ/1W8ZDWGbg6pVkhfnzACsQAAb5MxCT6oQbojIp52pXYMIvPbkf
 ISOUr01pMzjEYoqyUKvtUk/i9QEfIWhzmaO6W3mMmZaVGd7ofOgDRVNVu376lJmYR+Ju
 /abw==
X-Gm-Message-State: AOAM530oXpvfKAC+FpgPDIAZZ/hS70gKQAvfJQCz5BRNWbgNUMXt7UBp
 CDEEDN0BMPBOq/dSJZg4KgbGgTIgs9etbR3cHR7gQRqEzk16JmWcKFd8fSoVeXYcYc8mPnfkxap
 iHrxfK+t9pRli7t4=
X-Received: by 2002:a1c:a302:: with SMTP id m2mr4257695wme.111.1634627840208; 
 Tue, 19 Oct 2021 00:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ety8khjHIRPr6+jDJ+frq9dU3VOaSTmWK5ehlSrdyYClx2V4ccUxIqBOiQjgFqQh7vnO1g==
X-Received: by 2002:a1c:a302:: with SMTP id m2mr4257684wme.111.1634627840078; 
 Tue, 19 Oct 2021 00:17:20 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e15sm14296861wrv.74.2021.10.19.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:17:19 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:17:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 6/6] hw/riscv: spike: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091718.7dd6e227@redhat.com>
In-Reply-To: <20211018153829.24382-6-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-6-bmeng.cn@gmail.com>
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
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
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Oct 2021 23:38:29 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> 
>  hw/riscv/spike.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 79ae355ae2..288d69cd9f 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -180,7 +180,6 @@ static void spike_board_init(MachineState *machine)
>      const MemMapEntry *memmap = spike_memmap;
>      SpikeState *s = SPIKE_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
> @@ -239,10 +238,8 @@ static void spike_board_init(MachineState *machine)
>      }
>  
>      /* register system main memory (actual RAM) */
> -    memory_region_init_ram(main_mem, NULL, "riscv.spike.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
> -        main_mem);
> +        machine->ram);
>  
>      /* create device tree */
>      create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> @@ -326,6 +323,7 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
>      mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
>      mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>      mc->numa_mem_supported = true;
> +    mc->default_ram_id = "riscv.spike.ram";
>  }
>  
>  static const TypeInfo spike_machine_typeinfo = {


