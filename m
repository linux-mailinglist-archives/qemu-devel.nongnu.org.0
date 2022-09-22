Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4855E60AC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:14:54 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKAO-0003wE-Rs
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obIvK-0007ON-B7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:55:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obIvI-0006IZ-3J
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 05:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663840511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xYAGwmwbPSJWsFdPEAUWiaaIJxu53y0l3oVjwoTA/mA=;
 b=Pd6f6FytH9QmBHNR5cT50HLEcT8jgmpyh1A+b5SNCWwp/5v99zWEfQuC3RqZOaZgjTv+OT
 9gg/9ubg3Wmh78kL3h0Rj94GYjV3D7PAM93de3VYy5d116yv4cYceG52Lj0iobPD23HoLA
 JgE/9+7/excfYZeT3C8rdUYEV+sl318=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-x6caTR6SN1av0S3OlYCCeg-1; Thu, 22 Sep 2022 05:55:09 -0400
X-MC-Unique: x6caTR6SN1av0S3OlYCCeg-1
Received: by mail-wm1-f70.google.com with SMTP id
 t14-20020a1c770e000000b003b4856a6ecaso558747wmi.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 02:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=xYAGwmwbPSJWsFdPEAUWiaaIJxu53y0l3oVjwoTA/mA=;
 b=XyR66TZlEPTFBk+F/4e0LLpS5voSQc7pCTIfFQ2dqZ7VQi3R1YB9vZYnP5HD2OIDt0
 uOtHEjwgDt3ogHL+6ADRW63yNL+daUBNaoC6eGTX2V8ukNLLZjPEVmHcgwnu4CLfW8A2
 UI6zxhtv1XvmvIYekzaFD9zlFXoMMXIxtI8QFyrxGa6ay+t7r0nsaxw5CkpRqM+FUzNc
 hrgo1c4PMtt+UDmDHCCykW7csA6znoCwh4VJvayTa0g+RB31kzulzQeYYMZRx6mXF3CV
 ZUNhRy2DkRneph/DtOSh5X/XaO2Cv/qXxlmyrzG2QSdm9ihDWxrE7ckir8Jz9x3kxIAH
 WNdQ==
X-Gm-Message-State: ACrzQf0519ja+K7BpCTTT4kIyw8xWKM37fzMEJey4/XbK1KUeV0HUdmd
 aM4VG+UkCsgk9dHCJNarghNqoZfKd/W1jxYQ9dNT0mu7ZggpB4tXEAPAbpBRGTsG0j2XpAnP06T
 W4CUXXK6vaYYCz8s=
X-Received: by 2002:a05:600c:3506:b0:3b4:c086:fa37 with SMTP id
 h6-20020a05600c350600b003b4c086fa37mr9217124wmq.165.1663840508558; 
 Thu, 22 Sep 2022 02:55:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jTG0IeatJe11wqalL6pTPmydlTrk0RxsDOiHgrpLgRuhXq0eiqcAwcHsx9kTBTzxp7u2AVQ==
X-Received: by 2002:a05:600c:3506:b0:3b4:c086:fa37 with SMTP id
 h6-20020a05600c350600b003b4c086fa37mr9217107wmq.165.1663840508328; 
 Thu, 22 Sep 2022 02:55:08 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003a84375d0d1sm5714860wmq.44.2022.09.22.02.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 02:55:07 -0700 (PDT)
Date: Thu, 22 Sep 2022 05:55:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922055339-mutt-send-email-mst@kernel.org>
References: <20220922084356.878907-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922084356.878907-1-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 10:43:56AM +0200, Gerd Hoffmann wrote:
> In case phys bits are functional and can be used by the guest (aka
> host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> be used by the guest firmware for address space configuration.
> 
> This is only enabled for 7.2+ machine types for live migration
> compatibility reasons.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

The patch looks good to me. A comment explaining what
is going on as I posted elsewhere in this thread can't hurt.

Besides that

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/i386/fw_cfg.h     |  1 +
>  include/hw/i386/pc.h |  1 +
>  hw/i386/fw_cfg.c     | 12 ++++++++++++
>  hw/i386/pc.c         |  5 +++++
>  hw/i386/pc_piix.c    |  2 ++
>  hw/i386/pc_q35.c     |  2 ++
>  6 files changed, 23 insertions(+)
> 
> diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
> index 275f15c1c5e8..6ff198a6cb85 100644
> --- a/hw/i386/fw_cfg.h
> +++ b/hw/i386/fw_cfg.h
> @@ -26,5 +26,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
>  void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg);
>  void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg);
>  void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg);
> +void fw_cfg_phys_bits(FWCfgState *fw_cfg);
>  
>  #endif
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c95333514ed3..bedef1ee13c1 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -119,6 +119,7 @@ struct PCMachineClass {
>      bool enforce_aligned_dimm;
>      bool broken_reserved_end;
>      bool enforce_amd_1tb_hole;
> +    bool phys_bits_in_fw_cfg;
>  
>      /* generate legacy CPU hotplug AML */
>      bool legacy_cpu_hotplug;
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index a283785a8de4..6a1f18925725 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -219,3 +219,15 @@ void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg)
>      aml_append(dev, aml_name_decl("_CRS", crs));
>      aml_append(scope, dev);
>  }
> +
> +void fw_cfg_phys_bits(FWCfgState *fw_cfg)
> +{
> +    X86CPU *cpu = X86_CPU(first_cpu);
> +    uint64_t phys_bits = cpu->phys_bits;
> +
> +    if (cpu->host_phys_bits) {
> +        fw_cfg_add_file(fw_cfg, "etc/phys-bits",
> +                        g_memdup2(&phys_bits, sizeof(phys_bits)),
> +                        sizeof(phys_bits));
> +    }
> +}
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 566accf7e60a..17ecc7fe4331 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -744,6 +744,7 @@ void pc_machine_done(Notifier *notifier, void *data)
>  {
>      PCMachineState *pcms = container_of(notifier,
>                                          PCMachineState, machine_done);
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>      X86MachineState *x86ms = X86_MACHINE(pcms);
>  
>      cxl_hook_up_pxb_registers(pcms->bus, &pcms->cxl_devices_state,
> @@ -764,6 +765,9 @@ void pc_machine_done(Notifier *notifier, void *data)
>          fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
>          /* update FW_CFG_NB_CPUS to account for -device added CPUs */
>          fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
> +        if (pcmc->phys_bits_in_fw_cfg) {
> +            fw_cfg_phys_bits(x86ms->fw_cfg);
> +        }
>      }
>  }
>  
> @@ -1907,6 +1911,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->kvmclock_enabled = true;
>      pcmc->enforce_aligned_dimm = true;
>      pcmc->enforce_amd_1tb_hole = true;
> +    pcmc->phys_bits_in_fw_cfg = true;
>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>       * to be used at the moment, 32K should be enough for a while.  */
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 8043a250adf3..c6a4dbd5c0b0 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -447,9 +447,11 @@ DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
>  
>  static void pc_i440fx_7_1_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_7_2_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
> +    pcmc->phys_bits_in_fw_cfg = false;
>      compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>      compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
>  }
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 53eda50e818c..c2b56daa1550 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -384,8 +384,10 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
>  
>  static void pc_q35_7_1_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_7_2_machine_options(m);
>      m->alias = NULL;
> +    pcmc->phys_bits_in_fw_cfg = false;
>      compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
>      compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
>  }
> -- 
> 2.37.3


