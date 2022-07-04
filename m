Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCC35658E8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:47:54 +0200 (CEST)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NMe-0003ay-FZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8N3N-0001Se-86
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o8N3J-0006Fg-8Q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656944872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+z+DLUq85V0asdpjEHLAxU7vfKzI0LtvTkMf4TJfLeY=;
 b=VfIk78CimYnIgtzreDRZEEG5gBP91D5vFFPp/rljVLjAKKTpK5FRP5cqrWsXMtIVQmgHLU
 6efH+OOwc3lvkzpG7Sta0sbqohfkUeu7E+9IHzTx5rlL9WpQAwDm809U+mLMVm+S2ERWsn
 5segD6ob9VKEsbIxOkW05sPd+2LLkOI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-a80HPauIPKalibf5NUyZUg-1; Mon, 04 Jul 2022 10:27:50 -0400
X-MC-Unique: a80HPauIPKalibf5NUyZUg-1
Received: by mail-wm1-f72.google.com with SMTP id
 az35-20020a05600c602300b003a1867d09b5so3224850wmb.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+z+DLUq85V0asdpjEHLAxU7vfKzI0LtvTkMf4TJfLeY=;
 b=LzIn5IWc1i7HmK/4hIZhDi4BIwGk8UA3cjObhKkHUa0V0hGz35vgIi4/EUscSUjJa9
 YSa0TkbcSex450WWslju3nXHmqpgvvJr63/2O6ip0MqU2U0HJUpYFY//pVbrS4GrUkLS
 ySW4eKjijOLA9yyPSEFHxE37IadpPb5mst5yhPn+7a9oWP76GlYDpC+3C9e6Lks/3w9o
 dnz8QYvA5lVzry+tIuI4ClVjPh3gE5VOtauhQYZlD3YCkMwAyIf415CEItf2mTTieYE/
 KChvPfA26mNxO1ozYITW6gpddKWdHvuHZW+KtLOsSJx7tnYYOcmzBmu/+0TQUAjd3b0T
 JK4A==
X-Gm-Message-State: AJIora/7e/tAXZ3mKgaxEGJGv2ji8tXsB7jZmOedKKyTMRT45Q8IUOhk
 TM9JXma0VJGLVC2fwRFNykmfrr5I8RVMA7qnK1aKhmQReX/SLoR65+TbbBodmsUEbt80l+ro54A
 O9opHTiDzJ+AQU/E=
X-Received: by 2002:a05:600c:3d92:b0:3a0:4b71:f2c4 with SMTP id
 bi18-20020a05600c3d9200b003a04b71f2c4mr33243940wmb.160.1656944869679; 
 Mon, 04 Jul 2022 07:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vIcwmS8PCKdZuGawwx1ljke0InSHxohTP4OHiTFrItxwC+3chg8B4T0Gpmey0iHodo0hFZsw==
X-Received: by 2002:a05:600c:3d92:b0:3a0:4b71:f2c4 with SMTP id
 bi18-20020a05600c3d9200b003a04b71f2c4mr33243899wmb.160.1656944869376; 
 Mon, 04 Jul 2022 07:27:49 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 m12-20020adfe0cc000000b0021d4155cd6fsm11820459wri.53.2022.07.04.07.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 07:27:48 -0700 (PDT)
Date: Mon, 4 Jul 2022 15:27:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 10/10] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Message-ID: <YsL44oyg8HVzu1YC@work-vm>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-11-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701161014.3850-11-joao.m.martins@oracle.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Joao Martins (joao.m.martins@oracle.com) wrote:
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
> sure that only new machine enforce but not older ones.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Thanks for keeping the migration compatibility, so for migration:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/i386/pc.c         | 6 ++++--
>  hw/i386/pc_piix.c    | 2 ++
>  hw/i386/pc_q35.c     | 2 ++
>  include/hw/i386/pc.h | 1 +
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 07025b510540..f99e16a5db4b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1013,9 +1013,10 @@ void pc_memory_init(PCMachineState *pcms,
>      /*
>       * The HyperTransport range close to the 1T boundary is unique to AMD
>       * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
> -     * to above 1T to AMD vCPUs only.
> +     * to above 1T to AMD vCPUs only. @enforce_valid_iova is only false in
> +     * older machine types (<= 7.0) for compatibility purposes.
>       */
> -    if (IS_AMD_CPU(&cpu->env)) {
> +    if (IS_AMD_CPU(&cpu->env) && pcmc->enforce_valid_iova) {
>          pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>  
>          /*
> @@ -1950,6 +1951,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->has_reserved_memory = true;
>      pcmc->kvmclock_enabled = true;
>      pcmc->enforce_aligned_dimm = true;
> +    pcmc->enforce_valid_iova = true;
>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>       * to be used at the moment, 32K should be enough for a while.  */
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index f3c726e42400..504ddd0deece 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -444,9 +444,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
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
> index 5a4a737fe203..4b747c59c19a 100644
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
> index 568c226d3034..3a873ff69499 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -118,6 +118,7 @@ struct PCMachineClass {
>      bool has_reserved_memory;
>      bool enforce_aligned_dimm;
>      bool broken_reserved_end;
> +    bool enforce_valid_iova;
>  
>      /* generate legacy CPU hotplug AML */
>      bool legacy_cpu_hotplug;
> -- 
> 2.17.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


