Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F754E551
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:48:38 +0200 (CEST)
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qnV-0005I1-Df
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1qTK-0000hM-9M
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1qTI-0008PO-It
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icBeXX1vbQzZr+vlHhIH4moVGK7wi/QLhKeBhFuhzwg=;
 b=Iq+2q3iWGkargtjoiMO+Yq8g/10uPBoPaKejHl2LT1kHnLqaP+01qyoAJCdEnHeDksRMI3
 6eUTrHtzyy0lEzcPMUcjJrGtenTtGwe+ssop5AcIt1Syc89IdbpuZBwSVw97m7XEVlG/ao
 jI3+UO6j/a00xJyj/eT2SnuWovYdNGs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-iwZ1nYcuPwCVDH_VZ9FG3w-1; Thu, 16 Jun 2022 10:27:42 -0400
X-MC-Unique: iwZ1nYcuPwCVDH_VZ9FG3w-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so1231711wmq.2
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icBeXX1vbQzZr+vlHhIH4moVGK7wi/QLhKeBhFuhzwg=;
 b=4hqbchFk7Go4x+LTN3+jVu5YwLg9J2ATB+dLWhx21SRiFdRREMmxLcfyRlGiy8vek/
 rJmAS/IdTg9o21lHic0tjaED4r41eE/8p89A5Op/PcB0C4+b/c0+VKEPByj9OFGz/7Z9
 Ms+11zMxDW4+tdxdZsyJO3jZ2uFyc2GonYNjhB9pdxSlOSnfeSJNa9MWgXhK6+xe2H2i
 no54p1L6iH7eq8e3t2UCsWsstrEXnGokiHCj2FzQPzaH17YCxf1LLBOCRl5iCBocyD66
 31N9TZB9/sSBSTOtc9DDaaJiXwLH+JRnsJXHcB3rTw+XodA3bcNbxUNF6POr8h2YqJx+
 5YTw==
X-Gm-Message-State: AJIora8EtqEKZ4AVyprSRyb8JiUH7u1d3X+cSYykT6ZSoqFL3y8VdAGc
 Ev1TfvlNzXr6ySGU3cwJYmvGnt+zF/oJl1m2P5bvzoAMArinxZL/b6KLL4lHaVTni8YJ6llOpD6
 1PD4E8TnRpH8r+R4=
X-Received: by 2002:a5d:4650:0:b0:213:ba65:73fd with SMTP id
 j16-20020a5d4650000000b00213ba6573fdmr4909826wrs.61.1655389661682; 
 Thu, 16 Jun 2022 07:27:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uRmHrXXidJiypK60i8q7CPYTqfGsX4U6Y0zKViP4ElY+/y/12lt2hPTFtFqN//z21+qbvxqA==
X-Received: by 2002:a5d:4650:0:b0:213:ba65:73fd with SMTP id
 j16-20020a5d4650000000b00213ba6573fdmr4909804wrs.61.1655389661410; 
 Thu, 16 Jun 2022 07:27:41 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a5d4d47000000b002100e86319asm2063620wru.78.2022.06.16.07.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 07:27:40 -0700 (PDT)
Date: Thu, 16 Jun 2022 16:27:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v5 5/5] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Message-ID: <20220616162739.71f3f2f0@redhat.com>
In-Reply-To: <20220520104532.9816-6-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-6-joao.m.martins@oracle.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, 20 May 2022 11:45:32 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> The added enforcing is only relevant in the case of AMD where the
> range right before the 1TB is restricted and cannot be DMA mapped
> by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
> or possibly other kinds of IOMMU events in the AMD IOMMU.
> 
> Although, there's a case where it may make sense to disable the
> IOVA relocation/validation when migrating from a
> non-valid-IOVA-aware qemu to one that supports it.
> 
> Relocating RAM regions to after the 1Tb hole has consequences for
> guest ABI because we are changing the memory mapping, so make
> sure that only new machine enforce but not older ons.

is old machine with so much ram going to work and not explode
even without iommu?

> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c         | 7 +++++--
>  hw/i386/pc_piix.c    | 2 ++
>  hw/i386/pc_q35.c     | 2 ++
>  include/hw/i386/pc.h | 1 +
>  4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 652ae8ff9ccf..62f9af91f19f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -862,6 +862,7 @@ static hwaddr x86_max_phys_addr(PCMachineState *pcms,
>  static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>                                            uint64_t pci_hole64_size)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>      CPUX86State *env = &X86_CPU(first_cpu)->env;
>      hwaddr start = x86ms->above_4g_mem_start;
> @@ -870,9 +871,10 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>      /*
>       * The HyperTransport range close to the 1T boundary is unique to AMD
>       * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> -     * to above 1T to AMD vCPUs only.
> +     * to above 1T to AMD vCPUs only. @enforce_valid_iova is only false in
> +     * older machine types (<= 7.0) for compatibility purposes.
>       */
> -    if (!IS_AMD_CPU(env)) {
> +    if (!IS_AMD_CPU(env) || !pcmc->enforce_valid_iova) {
>          return;
>      }
>  
> @@ -1881,6 +1883,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->has_reserved_memory = true;
>      pcmc->kvmclock_enabled = true;
>      pcmc->enforce_aligned_dimm = true;
> +    pcmc->enforce_valid_iova = true;
>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>       * to be used at the moment, 32K should be enough for a while.  */
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 57bb5b8f2aea..74176a210d56 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -437,9 +437,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>  
>  static void pc_i440fx_7_0_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_7_1_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> +    pcmc->enforce_valid_iova = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4d5c2fbd976b..bc38a6ba4c67 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -381,8 +381,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>  
>  static void pc_q35_7_0_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_1_machine_options(m);
>      m->alias = NULL;
> +    pcmc->enforce_valid_iova = false;
>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>  }
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 9c847faea2f8..22119131eca7 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -117,6 +117,7 @@ struct PCMachineClass {
>      bool has_reserved_memory;
>      bool enforce_aligned_dimm;
>      bool broken_reserved_end;
> +    bool enforce_valid_iova;
>  
>      /* generate legacy CPU hotplug AML */
>      bool legacy_cpu_hotplug;


