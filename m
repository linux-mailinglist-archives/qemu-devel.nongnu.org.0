Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A984929B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:33:35 +0100 (CET)
Received: from localhost ([::1]:51436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qUH-0005N9-JB
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otK-0003sH-VZ
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9otI-00006R-Nj
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 08:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642513876;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtsWfSO5g+1IkZhp0URadLZGJDH3pn6puBwMTeb0Tvw=;
 b=A+kWj0oV0pnk/UIQLc9/x7AC65xKv5yjo9eGSOWIaeoIBukMQmx+HDfPnkHpClu/pHfgKl
 RRHU+g8NZjuqVdB1Ocuc0PoODd12Xh91GQbsg9cIuS9JUavs57qwx16pBUZCgBe82XEz2c
 LxzEn3iRQ45IO2yuTHxK0pj9aI9f4/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-7aDvnsZDOy-QTyw4d0KUxg-1; Tue, 18 Jan 2022 08:51:15 -0500
X-MC-Unique: 7aDvnsZDOy-QTyw4d0KUxg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso1872506wms.8
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 05:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XtsWfSO5g+1IkZhp0URadLZGJDH3pn6puBwMTeb0Tvw=;
 b=OS9l8Z/Pt2yckW35TruK8k7aK5vXnK7shadf73tmqgvQEIh9eog0rTZO6MPzwZg5Es
 sxgVtfDEgfPZ/Zbtpo/7LIu88/JcXjHNmseY0FZ+o0+Sx9fPyMICPMZgluuTOBQQS/d2
 fcJt4UQ4LgH//xgSdPQFPoGwCy3h0xp0xZ6ipz3Gzg7HsCXh9KdG4eVn9muVF6z9e2ty
 HInU6bbfYUYbL2qMnz6aOgEBKHIZowmJ22c9sahBLafbpVwNH8etgdKY/NLark2ut/Al
 QVieWg39xQyJtFIxznhiHvB6SbMlCOKYlHHJ8Z5g2ttY4FHh+lu88xntqrSnhC2ezs7P
 uWPA==
X-Gm-Message-State: AOAM530EUiFZMi6EbgyZ34CENRf7NxSoY1vd/pRlQ1F6b3qNYxZxPnP9
 Ad2TxOK+cxSDu+Kj0dn6WqD/DnXOM8x9FV/WUtuG+yIC+yF3novLA5k9VC9U9LXIF+tp/wZKeYM
 c8sgIZgwKVzKfCwA=
X-Received: by 2002:adf:d216:: with SMTP id j22mr24178137wrh.577.1642513873895; 
 Tue, 18 Jan 2022 05:51:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+zdAwpffOMmGVouMShoWBPumbBdn/bH0H3D0yY6l0Qqa/DIEvHGXEORdmRbsUH9omHoWCww==
X-Received: by 2002:adf:d216:: with SMTP id j22mr24178127wrh.577.1642513873737; 
 Tue, 18 Jan 2022 05:51:13 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id w9sm2903086wmc.36.2022.01.18.05.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 05:51:13 -0800 (PST)
Subject: Re: [PATCH v5 2/6] hw/arm/virt: Add a control for the the highmem
 redistributors
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20220114140741.1358263-1-maz@kernel.org>
 <20220114140741.1358263-3-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <8a25a161-6ad5-4a2a-c16b-b3784dd60af6@redhat.com>
Date: Tue, 18 Jan 2022 14:51:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220114140741.1358263-3-maz@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On 1/14/22 3:07 PM, Marc Zyngier wrote:
> Just like we can control the enablement of the highmem PCIe region
> using highmem_ecam, let's add a control for the highmem GICv3
> redistributor region.
>
> Similarily to highmem_ecam, these redistributors are disabled when
> highmem is off.
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt-acpi-build.c | 2 ++
>  hw/arm/virt.c            | 2 ++
>  include/hw/arm/virt.h    | 4 +++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 449fab0080..0757c28f69 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -947,6 +947,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
>  
> +    vms->highmem_redists &= vms->highmem;
> +
>      acpi_add_table(table_offsets, tables_blob);
>      build_madt(tables_blob, tables->linker, vms);
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ed8ea96acc..e734a75850 100644
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
>  }
>  
>  #endif /* QEMU_ARM_VIRT_H */


