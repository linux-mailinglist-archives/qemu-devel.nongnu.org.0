Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48237432F4C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:24:07 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjTi-0004KQ-Bg
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjMM-0003Gt-Bj
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjMJ-0005P6-Kt
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAAsMuRfNa5N7r7AZPS+Si3SkCykWvUXu2gcVja7+vc=;
 b=B9V1bpuBUiet4qNxcS4MNKLkYDF333V9G05EqVTIstslO1nbjhTBs/XdgOs3H/DX9y1X0Z
 bZQtltPiD3C8n850biBWfTFGC7dBZmPHl6l7pTtsqptwmhM4D2wbFpboz61Gti96BVDh/r
 +db+s+x9B4SqSIsLsxBtiICCRvCuCIU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-Wp3_W5FRPa2g607GMgv2Sg-1; Tue, 19 Oct 2021 03:16:25 -0400
X-MC-Unique: Wp3_W5FRPa2g607GMgv2Sg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h99-20020adf906c000000b001644add8925so6586857wrh.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAAsMuRfNa5N7r7AZPS+Si3SkCykWvUXu2gcVja7+vc=;
 b=oFqm5LtrNcTBZ19GERtbK1uH2AGJSns2FsEHA3AHy9+PyyhD65dkP/+p/GoCNCIPPm
 ZbrczlSIFOZ3/0l92+GzAWxw9YWH1vQqDbtQAGLWaCsRpHf9Xtj1w4I00h98TVs0M698
 Y2qEj1pPxQsG+iLh6Pgtd89DTyJ5qvl+E9jorEqHKpnQf0OLGiveOFcTUWiSbpSpEb1K
 bwg3SxIdw3cm9gD2bJ/AdYWLUt5e2tasp4ZoYSLObAoryUUR9Q8c+57HxXO7NCHymjgm
 th8yHgn1CWunuwldaGiWNz2aTtecOlLtrFh/lK6aqG28UOpcdaxFAlD3yOk6+YzomCTj
 ofRg==
X-Gm-Message-State: AOAM53367FUu5wuC7AsPggzcy6+NrH+tMCqnK1YiSmRY8N4oFxul2ZqM
 XAW/dC/APvYU1yNsmGy5BBys8r/nm+PlyEEF8KVMlNefyEOGSExO8TKVVNG0QHJgP8xkJPwF/Xz
 1VY7/rmvFtXNpIic=
X-Received: by 2002:a7b:c938:: with SMTP id h24mr4181719wml.41.1634627784274; 
 Tue, 19 Oct 2021 00:16:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxDsS8+ao+d5njQ+Un81/tTE479KOKX2gCxyQrCvWRcd4THE2vxvqoGqzrhwE8IYkLgFgMYQ==
X-Received: by 2002:a7b:c938:: with SMTP id h24mr4181696wml.41.1634627784079; 
 Tue, 19 Oct 2021 00:16:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b19sm1611231wmj.9.2021.10.19.00.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:16:23 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:16:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 5/6] hw/riscv: sifive_u: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091622.1e606d94@redhat.com>
In-Reply-To: <20211018153829.24382-5-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-5-bmeng.cn@gmail.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Oct 2021 23:38:28 +0800
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
>  hw/riscv/sifive_u.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fc5790b8ce..0217006c27 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -528,7 +528,6 @@ static void sifive_u_machine_init(MachineState *machine)
>      const MemMapEntry *memmap = sifive_u_memmap;
>      SiFiveUState *s = RISCV_U_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
>      target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
> @@ -549,10 +548,8 @@ static void sifive_u_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* register RAM */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.u.ram",
> -                           machine->ram_size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[SIFIVE_U_DEV_DRAM].base,
> -                                main_mem);
> +                                machine->ram);
>  
>      /* register QSPI0 Flash */
>      memory_region_init_ram(flash0, NULL, "riscv.sifive.u.flash0",
> @@ -748,6 +745,7 @@ static void sifive_u_machine_class_init(ObjectClass *oc, void *data)
>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpu_type = SIFIVE_U_CPU;
>      mc->default_cpus = mc->min_cpus;
> +    mc->default_ram_id = "riscv.sifive.u.ram";
>  
>      object_class_property_add_bool(oc, "start-in-flash",
>                                     sifive_u_machine_get_start_in_flash,


