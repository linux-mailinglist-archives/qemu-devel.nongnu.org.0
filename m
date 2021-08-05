Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C853E1142
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:27:30 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZez-0003W5-91
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZdq-0002qF-E0
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mBZdp-0003EF-0p
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628155576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeU5N8eovjrhtGEJVByIT+L9kh2Ko09apTS3jN8rO2o=;
 b=hT5GRXjeYwgFhqq07WRCbBweEHaDJP66OlBojlo3HEITEipUJWUjdYAigsVia/dJeYMtqB
 a/ltHJA5/tqvJCnP7bRgHpdwBdR7jdIgXUTWJN+4eHUpB2FETy0YvB46x+hAV3uWYc8kjk
 hWO2sutk9Dh0ewwooB6K+smV2Scrhks=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-H-tVR2d0P6SICvHvgQEyOw-1; Thu, 05 Aug 2021 05:26:13 -0400
X-MC-Unique: H-tVR2d0P6SICvHvgQEyOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso1726758wrf.5
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YeU5N8eovjrhtGEJVByIT+L9kh2Ko09apTS3jN8rO2o=;
 b=DVW/shOhlhdohRmoo9C8uJ3p4VfU+GoA5wI99VuhrBCE9TsWJ2G2Qir+VaUzLRYl8K
 r1baTxNfhfJx+b/Mdo2kFYzydzkCTXJJ0FjzgNCsB+RbyAzXTaNeM+x7WD/W7GmAX42e
 /5DMldePC56mka+VriYpb8OIu4XapaZiC8dmOT3yaDRcRg5Rob4VFpSe0b22IJNpvkhm
 YS03qGTCKhL8yKW7iBQzeXr4pF+qgMEyOtBjxaqCkK+iV7Gz64KWiFFZ4bEoJm1HgKtX
 3UmYbwM57F6Ig9ZUBR7SsNdRylLhf8lEfnqS2txNnjOpznyJ/RiUK7KrSJhGKucwUKpb
 GsxA==
X-Gm-Message-State: AOAM530BnxX943IBLQr4x5tBNvzNhFjJZes7a6QagBUzGXKNiFAHD9TY
 b3qEnJ4b0gaYcq/2XC+NCO3y0v0keokZs4kBf4lUn3hPooH8JkBpKiuGO4qTDL4HE9dfTZiMWlV
 Rx7ZYaCafbDPDnnA=
X-Received: by 2002:a05:600c:4fd1:: with SMTP id
 o17mr14367926wmq.131.1628155571932; 
 Thu, 05 Aug 2021 02:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoZeAIh2tRuyt4UuBaoLtDOQ6LxutXHhob38mFPfB4pyRM/oVKSp6dM2Px5Ewl2VelVppMxQ==
X-Received: by 2002:a05:600c:4fd1:: with SMTP id
 o17mr14367908wmq.131.1628155571765; 
 Thu, 05 Aug 2021 02:26:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j140sm5055288wmj.37.2021.08.05.02.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:26:11 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:26:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
Message-ID: <20210805112610.5c86dfaf@redhat.com>
In-Reply-To: <20210803063005.72770-1-jingqi.liu@intel.com>
References: <20210803063005.72770-1-jingqi.liu@intel.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  3 Aug 2021 14:30:05 +0800
Jingqi Liu <jingqi.liu@intel.com> wrote:

> The NUMA information in PCMachineState is copied from MachineState.
> We get this information uniformly from struct NumaState in MachineState.
Is there a another reason behind this patch?

As cleanup it's not complete, why do you keep
PCMachineState::numa_nodes & co around?
I'd suggest to remove it completely and use data from
MachineState everywhere.

> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  hw/i386/acpi-build.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 17836149fe..e3c9ad011e 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1902,6 +1902,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      X86MachineState *x86ms = X86_MACHINE(machine);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
>      PCMachineState *pcms = PC_MACHINE(machine);
> +    int nb_numa_nodes = machine->numa_state->num_nodes;
> +    NodeInfo *numa_info = machine->numa_state->nodes;
>      ram_addr_t hotplugabble_address_space_size =
>          object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
>                                  NULL);
> @@ -1945,9 +1947,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      next_base = 0;
>      numa_start = table_data->len;
>  
> -    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
> +    for (i = 1; i < nb_numa_nodes + 1; ++i) {
>          mem_base = next_base;
> -        mem_len = pcms->node_mem[i - 1];
> +        mem_len = numa_info[i - 1].node_mem;
>          next_base = mem_base + mem_len;
>  
>          /* Cut out the 640K hole */
> @@ -1995,7 +1997,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      }
>  
>      slots = (table_data->len - numa_start) / sizeof *numamem;
> -    for (; slots < pcms->numa_nodes + 2; slots++) {
> +    for (; slots < nb_numa_nodes + 2; slots++) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
>          build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
>      }
> @@ -2011,7 +2013,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      if (hotplugabble_address_space_size) {
>          numamem = acpi_data_push(table_data, sizeof *numamem);
>          build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
> +                          hotplugabble_address_space_size, nb_numa_nodes - 1,
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> @@ -2513,7 +2515,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>          }
>      }
>  #endif
> -    if (pcms->numa_nodes) {
> +    if (machine->numa_state->num_nodes) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_srat(tables_blob, tables->linker, machine);
>          if (machine->numa_state->have_numa_distance) {


