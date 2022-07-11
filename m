Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E405703DA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:08:22 +0200 (CEST)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAt9B-0000ez-8z
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAt4U-0004F7-KE
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:03:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oAt46-0000xT-4V
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657544585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9s3/tUNPGmUKebMAflxOrykcrvclm5bYSlq0OuR7oo=;
 b=eUYYJgRgVizaUvaDdN2Q+47iK/FLDuGsE+fLbQgWhyboBjCwAOfiBp4R694fWiHVuUzH0o
 GCDSwkJnGijUcHnFMeD53XdKqWEreirYkg1RLcPT7CBachZFDG3DkX96FlBqveYU953zoc
 inmBdlnImRW/i3WV2PBZbbbNyPX0kzg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-xfO6eLQ6Np6zWBlnQ0DzBQ-1; Mon, 11 Jul 2022 09:03:04 -0400
X-MC-Unique: xfO6eLQ6Np6zWBlnQ0DzBQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a056402268f00b0043ac600a6bcso3136242edd.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l9s3/tUNPGmUKebMAflxOrykcrvclm5bYSlq0OuR7oo=;
 b=d2/u7VWN6lY+Tc8mfoT2MXHeboAeiWjWF2BsewSU4zH7fNBNYRnTHw2LAiUizCSmtq
 oaagO00p38GEC2Kjy4JhK/25YOjd7za6/YYbkGhr7MyvPC1ALIgP0DkFMzzIUYYSt5Sa
 bQ2PrrUpK9++lFt5UaRdmyI0w4YcNo0FB7VuunNhXGsW1WlfUn5/jms2u3x9dghO1BNx
 SqxPV+Dud0Cap6EK2O2IqpsnzULhM57ssLktb0k0gc3dBOIKoihGLCE/GDNGOuNeVX8Q
 MPJCGxFSbxzFBiAmeZbdzwHOtFvsVQTZIHZaeRPDDWPksjs8s0fG2oK6dpkPZFaMf2/c
 IpuQ==
X-Gm-Message-State: AJIora+yx38UJQ8X6ET7JKLZxDAHYCEH8ymFXO/2DRfq/5PM/iQkp2sH
 S9qFxkgSjYgHetUCssxN/eRqt7/P1t7pseS6mTW/+K4BVYO1LHmyRs+Yxt6tZ8SMlCzMB0eTqKx
 IJAXmh9qalMiF/BA=
X-Received: by 2002:a17:907:2895:b0:72a:ed50:f0e8 with SMTP id
 em21-20020a170907289500b0072aed50f0e8mr18516941ejc.392.1657544582964; 
 Mon, 11 Jul 2022 06:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u/5NQCR1wYdTaD+CPuQhp2dyHCGWc1b8kjPAzfl+y3qXFCD1TZm6wGWyhA1FSpyLNUZUR2/w==
X-Received: by 2002:a17:907:2895:b0:72a:ed50:f0e8 with SMTP id
 em21-20020a170907289500b0072aed50f0e8mr18516907ejc.392.1657544582665; 
 Mon, 11 Jul 2022 06:03:02 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a50fd87000000b0043a83f77b59sm4305380edt.48.2022.07.11.06.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:03:02 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:03:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 10/10] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Message-ID: <20220711150301.0909b023@redhat.com>
In-Reply-To: <20220701161014.3850-11-joao.m.martins@oracle.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-11-joao.m.martins@oracle.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri,  1 Jul 2022 17:10:14 +0100
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
> sure that only new machine enforce but not older ones.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
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

maybe
s/enforce_valid_iova/enforce_amd_1tb_hole/
to be less ambiguous

otherwise looks good to me so
Acked-by: Igor Mammedov <imammedo@redhat.com>

>  
>      /* generate legacy CPU hotplug AML */
>      bool legacy_cpu_hotplug;


