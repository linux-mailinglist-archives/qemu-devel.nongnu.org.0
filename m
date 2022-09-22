Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A55E62F8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:56:15 +0200 (CEST)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLkN-0001tv-5p
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obKJa-0002aH-12
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1obKJW-0003FB-O7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 07:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663845857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ekyat6wE5O8YWrL8KdK7RsMTtyGDEoPpZ9rWPegYGrs=;
 b=JvxOQjhwIpBbltG9f9nPg/qxOo+DtUZut+t5YS+dVeVXWH5oan8QpkzPjec/nqYskqBSWH
 12D53fufJ7c08C9bxErMYzOfEhKEJaTuINkzaqoSUngfjtrjdYabpSq6DdQJ0a52yCxjgE
 XBwHUuslCl5mtouFN8oxtAFPw7Q+SOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-7TV2T3G2NUevHd_AnjKOxA-1; Thu, 22 Sep 2022 07:24:14 -0400
X-MC-Unique: 7TV2T3G2NUevHd_AnjKOxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6118828C3;
 Thu, 22 Sep 2022 11:24:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 015682027061;
 Thu, 22 Sep 2022 11:24:11 +0000 (UTC)
Date: Thu, 22 Sep 2022 12:24:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] x86: add etc/phys-bits fw_cfg file
Message-ID: <YyxF2TNwnXaefT6u@redhat.com>
References: <20220922101454.1069462-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220922101454.1069462-1-kraxel@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 12:14:54PM +0200, Gerd Hoffmann wrote:
> In case phys bits are functional and can be used by the guest (aka
> host-phys-bits=on) add a fw_cfg file carrying the value.  This can
> be used by the guest firmware for address space configuration.
> 
> The value in the etc/phys-bits fw_cfg file should be identical to
> the phys bits value published via cpuid leaf 0x80000008.
> 
> This is only enabled for 7.2+ machine types for live migration
> compatibility reasons.

Is this going to have any implications for what mgmt apps must
take into account when selecting valid migration target hosts ?

Historically, apps have tended to ignore any checks for phys
bits between src/dst migration hosts and hoped for the best.

Will this new behaviour introduce / change any failure scenarios
where the target host has fewer phys bits than the src host, that
mgmt apps need to be made aware of ?

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


