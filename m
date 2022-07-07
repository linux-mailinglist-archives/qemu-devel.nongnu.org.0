Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19356A359
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 15:18:54 +0200 (CEST)
Received: from localhost ([::1]:60940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9RPB-0008I0-95
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 09:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9RMe-0007P2-Ic
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o9RMU-0003mG-E8
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 09:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657199764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=952aGOg/SFwOjgyr5312Daxq0jsj4/8yy/9HT8+LLTA=;
 b=FLnvJgRLSZ9Mcco/I2Aa16C3OgzZBHQgW/ahHD+3ktODIjOgjCEOdnV0xlPFB9mBihx2hE
 OStB63Xzi9AiA8/DiV0GmaJqJLDHc8ggGgCJMMdoZtssrZK9YZtDlcTQ+rRMMhmxzaXt3G
 l74e/748mtHrKxd7kne02OiSXur3k3s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-a6Ciki2QNKOh4yz4JLUHgA-1; Thu, 07 Jul 2022 09:16:03 -0400
X-MC-Unique: a6Ciki2QNKOh4yz4JLUHgA-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso4723091ejc.18
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 06:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=952aGOg/SFwOjgyr5312Daxq0jsj4/8yy/9HT8+LLTA=;
 b=cETeuedsS6GXpYC4r7i+YDpBDSGU2cQElfxUEaWQliborZqHEeBXxuPnKbhQ+aorCm
 5gSwpc2nMCFc/LzlqaWR2h4GSipWkUQPJq1K7ztuZjt3s+FgqiMQ9/ZrqayXmqwaV2lS
 Jj3arc1EXZj2ETcXz4/85//HxNbJ46CqsfAebro4XCuJVMjFF6Wi+ORVRhvVMlYySz7X
 VU51lEgq1qqBVwaAN8jX/s2A9c4GHdqHIs8E+secRhzz/7Wn6IM94ElM34xFMOoDI/0w
 x3wK2rLSfGq1KuroirLtFkoP7XcjDgcYueGHvAAhrXJW/Zh7W+TW5wdL5f9u4xn0PKlL
 iP9A==
X-Gm-Message-State: AJIora/TVBjP7tbDWRFd44IwgMlE+omqM41IOZGItzdp7df6mJpRk6y4
 gp+s8YjGtS2NJkra8VUVEohKu5P1iMhOzhtUdTEdiETP4Iii8Ui4Jxh8NxV9Tuo37J6wwDnC4mC
 KuiCJ+5ljwFpxt3I=
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id
 dz16-20020a0564021d5000b0043a737c289cmr21704729edb.47.1657199761855; 
 Thu, 07 Jul 2022 06:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uo0Y/ZldWmX/F75Lqgcijsc68EQ43Bm9NC9IopX4RZzERZndQ0pj3/hB6L+Mthv4+RNJFXOw==
X-Received: by 2002:a05:6402:1d50:b0:43a:737c:289c with SMTP id
 dz16-20020a0564021d5000b0043a737c289cmr21704702edb.47.1657199761597; 
 Thu, 07 Jul 2022 06:16:01 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a056402104f00b0043577da51f1sm27948308edu.81.2022.07.07.06.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 06:16:01 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:15:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 08/10] i386/pc: factor out device_memory base/size to
 helper
Message-ID: <20220707151559.043fe91d@redhat.com>
In-Reply-To: <20220701161014.3850-9-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-9-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Jul 2022 17:10:12 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> Move obtaining hole64_start from device_memory MR base/size into an helper
> alongside correspondent getters in pc_memory_init() when the hotplug
> range is unitialized.
> 
> This is the final step that allows pc_pci_hole64_start() to be callable
> at the beginning of pc_memory_init() before any MRs are initialized.
> 
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c | 55 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d6dff71012ab..a79fa1b6beeb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -825,16 +825,48 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>  }
>  
> +static void pc_get_device_memory_range(PCMachineState *pcms,
> +                                       hwaddr *base,
> +                                       ram_addr_t *device_mem_size)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +    MachineState *machine = MACHINE(pcms);
> +    ram_addr_t size;
> +    hwaddr addr;
> +

> +    if (pcmc->has_reserved_memory &&
> +        machine->device_memory && machine->device_memory->base) {
> +        *base = machine->device_memory->base;
> +        *device_mem_size = memory_region_size(&machine->device_memory->mr);
> +        return;
> +    }
is this block really needed?
(i.e. shouldn't block bellow always yeld the same result
as block above?)

> +
> +    /* handles uninitialized @device_memory MR */
> +    size = machine->maxram_size - machine->ram_size;
> +    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
> +
> +    if (pcmc->enforce_aligned_dimm) {
> +        /* size device region assuming 1G page max alignment per slot */
> +        size += (1 * GiB) * machine->ram_slots;
> +    }
> +
> +    *base = addr;
> +    *device_mem_size = size;
> +}
> +
> +
>  static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *machine = MACHINE(pcms);
>      hwaddr cxl_base;
> +    ram_addr_t size;
>  
> -    if (pcmc->has_reserved_memory && machine->device_memory->base) {
> -        cxl_base = machine->device_memory->base;
> +    if (pcmc->has_reserved_memory &&
> +        machine->device_memory && machine->device_memory->base) {
> +        pc_get_device_memory_range(pcms, &cxl_base, &size);
>          if (!pcmc->broken_reserved_end) {
> -            cxl_base += memory_region_size(&machine->device_memory->mr);
> +            cxl_base += size;
>          }
>      } else {
>          cxl_base = pc_above_4g_end(pcms);
> @@ -937,7 +969,7 @@ void pc_memory_init(PCMachineState *pcms,
>      /* initialize device memory address space */
>      if (pcmc->has_reserved_memory &&
>          (machine->ram_size < machine->maxram_size)) {
> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
> +        ram_addr_t device_mem_size;
>  
>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>              error_report("unsupported amount of memory slots: %"PRIu64,
> @@ -952,13 +984,7 @@ void pc_memory_init(PCMachineState *pcms,
>              exit(EXIT_FAILURE);
>          }
>  
> -        machine->device_memory->base =
> -            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
> -
> -        if (pcmc->enforce_aligned_dimm) {
> -            /* size device region assuming 1G page max alignment per slot */
> -            device_mem_size += (1 * GiB) * machine->ram_slots;
> -        }
> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
>  
>          if ((machine->device_memory->base + device_mem_size) <
>              device_mem_size) {
> @@ -1063,13 +1089,14 @@ uint64_t pc_pci_hole64_start(void)
>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      MachineState *ms = MACHINE(pcms);
>      uint64_t hole64_start = 0;
> +    ram_addr_t size = 0;
>  
>      if (pcms->cxl_devices_state.is_enabled) {
>          hole64_start = pc_get_cxl_range_end(pcms);
> -    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
> -        hole64_start = ms->device_memory->base;
> +    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>          if (!pcmc->broken_reserved_end) {
> -            hole64_start += memory_region_size(&ms->device_memory->mr);
> +            hole64_start += size;
>          }
>      } else {
>          hole64_start = pc_above_4g_end(pcms);


