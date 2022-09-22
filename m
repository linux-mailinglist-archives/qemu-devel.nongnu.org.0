Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25775E5FD4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:26:53 +0200 (CEST)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJPw-0000jv-H3
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obHzX-0008DE-LD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obHzQ-0004O2-QP
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BQUZH0l2McBt181klcXtt0pGPwD2K1dPTxk16J/dKt0=;
 b=FRx3UI3d1eOhDxq/0EuIQJx9pvzdbB6TjwHKu5cZxk7E4NGLsI4IzbbPWmsG50D/aHK3eg
 w7F6BPCEpPnh43EvOh6G9FsRbbOs9/714gqblSvllJtR1mi0M5/138XUJ0XET8UqKZ8/og
 nkEnCyWiDmdBGXsuy2UHF3Dp2b7eaMA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-32--qWj7w5dPOmIYOLgdZDqUg-1; Thu, 22 Sep 2022 04:55:22 -0400
X-MC-Unique: -qWj7w5dPOmIYOLgdZDqUg-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so510739wmi.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=BQUZH0l2McBt181klcXtt0pGPwD2K1dPTxk16J/dKt0=;
 b=n0MvAcKPDnrP1S4DRXBghNcH5uq/D5h+bqyZJmyASSWDDP3prEgcaIAeigfXqE7Sd1
 dAzzPK/nIBHmvM19Q8C4KDn7r5A+2iVXTIuHw0lFqjxXERChKGBumvTirgQ4vX6xNFfl
 3rvK5oBJs6mIWxilXf3CutiFOLMdQgxo5c5e1VzkstQ7Nxb7g3Zh/EOouT5lB8drz0bF
 qT+e0S/zhhFEDnjwAgo5QNbeAjFpmWQ9MGYkTMmFHyPhLUlG6LXYFl/U3wgnqF1xajoO
 xMD6YnrI5Ips/p4qqQ08dItdKFwvHQ5A+PPrtVvWWClXbdpayBxXn0ppJC5w1NksGgUq
 /3oQ==
X-Gm-Message-State: ACrzQf1hl6CU4VIXpbEb+gmPTH6dONmdrldxVzvXYOVxL9cUV4QRHdkj
 YvvBZkAdZ6QqaDl7B1UECloCHslQgVxRx8Ld14HIp5Y71c9Az0Gjfhvuj/1DqGR+/38U0tVoWtP
 RopFIcUaTwxrI95k=
X-Received: by 2002:a05:600c:2050:b0:3b4:a51a:a1f5 with SMTP id
 p16-20020a05600c205000b003b4a51aa1f5mr1463334wmg.177.1663836920806; 
 Thu, 22 Sep 2022 01:55:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xvz/kDCcXO3k/Qqm9fQ74sw9y3TIylqcmtcYP4XUWuSa2S1vrfGP3+Py49BTcJljmOZX+2g==
X-Received: by 2002:a05:600c:2050:b0:3b4:a51a:a1f5 with SMTP id
 p16-20020a05600c205000b003b4a51aa1f5mr1463312wmg.177.1663836920533; 
 Thu, 22 Sep 2022 01:55:20 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b00228cbac7a25sm4555579wru.64.2022.09.22.01.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:55:20 -0700 (PDT)
Date: Thu, 22 Sep 2022 04:55:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] x86: add etc/phys-bits fw_cfg file
Message-ID: <20220922044906-mutt-send-email-mst@kernel.org>
References: <20220922084356.878907-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922084356.878907-1-kraxel@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
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

On Thu, Sep 22, 2022 at 10:43:56AM +0200, Gerd Hoffmann wrote:
> In case phys bits are functional and can be used by the guest (aka
> host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> be used by the guest firmware for address space configuration.
> 
> This is only enabled for 7.2+ machine types for live migration
> compatibility reasons.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I'm curious why you decided to switch from a cpuid flag to fw cfg.  I
guess firmware reads fw cfg anyway. But would the guest kernel then need
to load a fw cfg driver very early to detect this, too?

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

So, this allows a lot of flexibility, any phys_bits value at all can now
be used. Do you expect a use-case for such a flexible mechanism?  If
this ends up merely repeating CPUID at all times then we are just
creating confusion.
Could you add the motivation to the commit log pls?


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


