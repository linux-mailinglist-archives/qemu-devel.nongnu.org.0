Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EBE42092E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:14:11 +0200 (CEST)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKz4-0002vh-Ah
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKW6-0000B3-BL
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mXKW4-0005mt-On
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633340652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xj2EuEVOkKsDx8NDBU7nmAb1dXmNr3DxIeN0lCugnx4=;
 b=FVZv1JOXn+VW3Vqk08MTxPUKD5qsI7WBDvUyOGz3xaVTmuqGa0ydPLT9+JAeHRFBNAnsqS
 X7+qByrqgXDwbUYM10fKLQew1z+mVEqDiJeG3v92iBHlKPz+m/zcxMv+LBORxzGkuNSQQP
 ANYKr5rZXy25CJNtnYuRuHs9glCJy+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-RHktDO1DP6q6HOba_yzz_w-1; Mon, 04 Oct 2021 05:44:11 -0400
X-MC-Unique: RHktDO1DP6q6HOba_yzz_w-1
Received: by mail-wm1-f69.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so9748008wmq.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xj2EuEVOkKsDx8NDBU7nmAb1dXmNr3DxIeN0lCugnx4=;
 b=3zZiCciNK5epZeold7tHqDJAbkA0mlVyFtzNrOyA9PhUx1iLWcbDIY0ugtAac2qj8c
 FlJJk6mBgAPYmQRIMyPHuOChARoSxboMyyRcy0aYfk47XsoepnMERcHE4oMcJ0AVBNoF
 +J/inMMroBEX70b7Rn6NTNXO+LUUE9GRuNMMhy6OEPzFypedPaJsfovGn10xEEgojFmx
 J8Zif34qELOSv+ulVXxFTLQLC13VZvHC58DTUjOXWuPZ3EplNbf9YkKRWRPOpiCbTeCP
 2LGGTz+3UmEmPU/LpRruVZoZkBzH8Jdpk1lz8/ZtHn+RmhEdSwEEWKayn4ISreANLILF
 vTAg==
X-Gm-Message-State: AOAM531A7jvwIvpn//26yPC71JpwsjFGYQXYw0L5LDOrQ2kqTnYD6qk0
 rKKU64zltU0/aQHM+l/fuQKmb9GPi7qC5ehvp2BUIllfo54oh+T1P3fAanBYV7FH78MQkAimLFA
 ygWTCqeaBhvuS2KU=
X-Received: by 2002:a1c:7d0c:: with SMTP id y12mr17252400wmc.6.1633340650141; 
 Mon, 04 Oct 2021 02:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJwJXaCcMvmdsIG+SbzkOzsOXG04w26FIdFhGoCqVjymAJqr3ER5/M9rlRA8olgI7/usRnrw==
X-Received: by 2002:a1c:7d0c:: with SMTP id y12mr17252376wmc.6.1633340649909; 
 Mon, 04 Oct 2021 02:44:09 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id n68sm16106200wmn.13.2021.10.04.02.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:44:09 -0700 (PDT)
Date: Mon, 4 Oct 2021 11:44:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/5] hw/arm/virt: Add a control for the the highmem
 redistributors
Message-ID: <20211004094408.xfftmls7h6bbypuk@gator>
References: <20211003164605.3116450-1-maz@kernel.org>
 <20211003164605.3116450-3-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211003164605.3116450-3-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 05:46:02PM +0100, Marc Zyngier wrote:
> Just like we can control the enablement of the highmem PCIe region
> using highmem_ecam, let's add a control for the highmem GICv3
> redistributor region.
> 
> Similarily to highmem_ecam, these redistributors are disabled when
> highmem is off.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 2 ++
>  hw/arm/virt.c            | 3 +++
>  include/hw/arm/virt.h    | 4 +++-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d7bef0e627..f0d0b662b7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -792,6 +792,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> +    vms->highmem_redists &= vms->highmem;
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8021d545c3..bcf58f677d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2053,6 +2053,8 @@ static void machvirt_init(MachineState *machine)
>  
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>  
> +    vms->highmem_redists &= vms->highmem;
> +
>      create_gic(vms, sysmem);
>  
>      virt_cpu_post_init(vms, sysmem);
> @@ -2750,6 +2752,7 @@ static void virt_instance_init(Object *obj)
>      vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>  
>      vms->highmem_ecam = !vmc->no_highmem_ecam;
> +    vms->highmem_redists = true;
>  
>      if (vmc->no_its) {
>          vms->its = false;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index b461b8d261..787cc8a27d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -141,6 +141,7 @@ struct VirtMachineState {
>      bool secure;
>      bool highmem;
>      bool highmem_ecam;
> +    bool highmem_redists;
>      bool its;
>      bool tcg_its;
>      bool virt;
> @@ -187,7 +188,8 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>  
>      assert(vms->gic_version == VIRT_GIC_VERSION_3);
>  
> -    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
> +    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
> +            vms->highmem_redists) ? 2 : 1;

Wouldn't it be equivalent to just use vms->highmem here?

>  }
>  
>  #endif /* QEMU_ARM_VIRT_H */
> -- 
> 2.30.2
> 

Thanks,
drew


