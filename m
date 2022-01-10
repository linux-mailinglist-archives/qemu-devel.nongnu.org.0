Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD5489C60
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:38:45 +0100 (CET)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wku-0002hx-5r
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wiR-000143-74
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:36:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n6wi6-0001DA-6b
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641828948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4pmMoHNw9NGYka6eDXChlx6TH2icG0i9HWG7XVxjIE=;
 b=fWsvFSrRdak5q08juizNgw8V6SYeBApzuUBLQO5SmXA/VR2SOT8iCHNWfn8aI8sh3ZOCMC
 vRii5Bf+3UyL3IrwlGtdkiuPeoMH+Wl8vwI3mJ7Yfp89pMYZLhJnUWavUmt3rlbXHfnlrA
 EQ13skRlO86S/fVefOdLi34hlohzTnA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-3c5vv5uNMD25o4J3hLy8Zg-1; Mon, 10 Jan 2022 10:35:47 -0500
X-MC-Unique: 3c5vv5uNMD25o4J3hLy8Zg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v185-20020a1cacc2000000b0034906580813so1816067wme.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=V4pmMoHNw9NGYka6eDXChlx6TH2icG0i9HWG7XVxjIE=;
 b=LBOkJ2LE0BlSZYcTUCEinPf58rKTIiotGFjW4DDKr9DtBJQMS8aLdDDSH4q8Vwk+Dd
 Sshj3v9dgANQ01trRNijJysATZ3Y0WL/Q0nZe34c3z/AVY8eA4nSDJJ3JV1Z7hzFAxTK
 JbsqODiCUzI+Ep5D2gO0TUO8tv2I27tg6M3kmUoVMOpVHx00dvQ8f/vLKjhF8POx0000
 crWe/U/4Fs4o1g4ipafEN7gmq62kkv2bi3bRblvsbrki9Rk9g1CsWW6IX9iyLT+esOzA
 ZjyYzj3esWQ0QQq0X+4Q6qbwt2++hdz+raQHut/2zWghE8yKes6pomm7RiHDmJJiLqRr
 bYJg==
X-Gm-Message-State: AOAM531/yedIAblYbcPRjojq8DGyNqJEuTnP0Y5GpEj48kb2j69ZdRBK
 xgP39/V9ur2uu10A9KG3uW/4CFpXAzjwhr3/0P4xcwbSJzYxbBbGF+pn+F03uZFMm3gVa7aK0s1
 sa0CI2AXHL6UHqCg=
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr3952wmb.175.1641828946330;
 Mon, 10 Jan 2022 07:35:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlBR2VhoyVSOdpuV7VUclmcxkriBbSYJVAxqIDuFB2ondyMLGAPdicSSr3ZHYaQzMMUiZ/NA==
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr3943wmb.175.1641828946188;
 Mon, 10 Jan 2022 07:35:46 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t7sm3889718wmq.42.2022.01.10.07.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 07:35:45 -0800 (PST)
Subject: Re: [PATCH v4 2/6] hw/arm/virt: Add a control for the the highmem
 redistributors
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-3-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <448274ac-2650-7c09-742d-584109fb5c56@redhat.com>
Date: Mon, 10 Jan 2022 16:35:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220107163324.2491209-3-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 1/7/22 5:33 PM, Marc Zyngier wrote:
> Just like we can control the enablement of the highmem PCIe region
> using highmem_ecam, let's add a control for the highmem GICv3
> redistributor region.
>
> Similarily to highmem_ecam, these redistributors are disabled when
> highmem is off.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  hw/arm/virt-acpi-build.c | 2 ++
>  hw/arm/virt.c            | 2 ++
>  include/hw/arm/virt.h    | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index cdac009419..505c61e88e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -946,6 +946,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> +    vms->highmem_redists &= vms->highmem;
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b9ce81f4a1..4d1d629432 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2106,6 +2106,7 @@ static void machvirt_init(MachineState *machine)
>      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
>  
>      vms->highmem_mmio &= vms->highmem;
> +    vms->highmem_redists &= vms->highmem;
>  
>      create_gic(vms, sysmem);
>  
> @@ -2805,6 +2806,7 @@ static void virt_instance_init(Object *obj)
>  
>      vms->highmem_ecam = !vmc->no_highmem_ecam;
>      vms->highmem_mmio = true;
> +    vms->highmem_redists = true;
>  
>      if (vmc->no_its) {
>          vms->its = false;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 9c54acd10d..dc9fa26faa 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -144,6 +144,7 @@ struct VirtMachineState {
>      bool highmem;
>      bool highmem_ecam;
>      bool highmem_mmio;
> +    bool highmem_redists;
>      bool its;
>      bool tcg_its;
>      bool virt;
> @@ -190,7 +191,8 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>  
>      assert(vms->gic_version == VIRT_GIC_VERSION_3);
>  
> -    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
> +    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
> +            vms->highmem_redists) ? 2 : 1;
If we fail to use the high redist region, is there any check that the
number of vcpus does not exceed the first redist region capacity.
Did you check that config, does it nicely fail?

Eric
>  }
>  
>  #endif /* QEMU_ARM_VIRT_H */


