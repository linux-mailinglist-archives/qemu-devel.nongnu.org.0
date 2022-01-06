Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCC448630B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:40:56 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QCV-0004Wf-52
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:40:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QAE-0002l2-PR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5QA1-0003wN-C5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641465498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NUC0YRXeoKXluzQDQIK/Y3whFFHC8651FZ8FvN0u72g=;
 b=BXeU8/yBHqrE1nv/617NEE+K3MeD/jEY3fqwOkBrQppxQMukf7lkIExyaX0TC942mh3AKj
 GEQje78Kj3KSWf4M+miVsznB8R5dpQLw+9jzEw6XL6PQvR/zUZ8n9NplnMflfTQR0vV5+c
 DrdSR5kJyK01z8FS/bfx5YI1zf4rDOc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-l2CBYDMTMkG6s7YmAUpRCw-1; Thu, 06 Jan 2022 05:38:17 -0500
X-MC-Unique: l2CBYDMTMkG6s7YmAUpRCw-1
Received: by mail-wr1-f71.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so1049044wrh.23
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NUC0YRXeoKXluzQDQIK/Y3whFFHC8651FZ8FvN0u72g=;
 b=DRUefCa/XAMFaSYW/8NlOPseO5VGjBslm5oM3YrBjFC/5b1orktEABQgbTIjYBcpL1
 HUUOxmK0OxMTsnPrfQ7I/SPBmsQU+jdJ4QTlHYlY4hxHxUfWV2KjlDLFnV3UDdP0gEYs
 Oi99ty3d7ZU0r/sj9knAir39O3iI37FbsUYth5Iyj/+zRFORnkkI1cvO3rKzG9FfCWX3
 hQQTyoR79FuVux83BAP9UuBbPAfGSqiEuXckp379WkHdlSWAq4/a61Trnk/M8GwgbTO9
 9v7+DxFTAU7eRVi4OM3w+W8fYNiVO7nqNWL/JbPX9J7+x4hv8OBP2vUByDigDHzikPcE
 iXlQ==
X-Gm-Message-State: AOAM531TISHDcBOayVQMKoxlMV8tB6pIs5pO6BFiXFAzAW56rT7mGX+G
 /efYirARtU8ar0+yiWWHlY3cJdRBu4zIDREFoZNBWyux80uKz68a8dHm3B67xsnZWxI4/Uioe5Z
 xEEjcopgpzSlVCXU=
X-Received: by 2002:adf:aad6:: with SMTP id i22mr49298217wrc.40.1641465493930; 
 Thu, 06 Jan 2022 02:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylk1pKCInzHxlwir57G4ozARZhGjfPcmXqX5THgVgQPPCTisQYurqlosTA2gbzoBHgK50UAA==
X-Received: by 2002:adf:aad6:: with SMTP id i22mr49298191wrc.40.1641465493683; 
 Thu, 06 Jan 2022 02:38:13 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u3sm2125228wrs.0.2022.01.06.02.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 02:38:12 -0800 (PST)
Date: Thu, 6 Jan 2022 05:38:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220106053739-mutt-send-email-mst@kernel.org>
References: <20211209220840.14889-1-dwmw2@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20211209220840.14889-1-dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 10:08:37PM +0000, David Woodhouse wrote:
> The check on x86ms->apic_id_limit in pc_machine_done() had two problems.
> 
> Firstly, we need KVM to support the X2APIC API in order to allow IRQ
> delivery to APICs >= 255. So we need to call/check kvm_enable_x2apic(),
> which was done elsewhere in *some* cases but not all.
> 
> Secondly, microvm needs the same check. So move it from pc_machine_done()
> to x86_cpus_init() where it will work for both.
> 
> The check in kvm_cpu_instance_init() is now redundant and can be dropped.
> 
> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> Acked-by: Claudio Fontana <cfontana@suse.de>

Could I get an ack from KVM maintainers on this one please?
Thanks!

> ---
>  hw/i386/pc.c              |  8 --------
>  hw/i386/x86.c             | 16 ++++++++++++++++
>  target/i386/kvm/kvm-cpu.c |  2 +-
>  3 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc..9959f93216 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -736,14 +736,6 @@ void pc_machine_done(Notifier *notifier, void *data)
>          /* update FW_CFG_NB_CPUS to account for -device added CPUs */
>          fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
>      }
> -
> -
> -    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
> -        !kvm_irqchip_in_kernel()) {
> -        error_report("current -smp configuration requires kernel "
> -                     "irqchip support.");
> -        exit(EXIT_FAILURE);
> -    }
>  }
>  
>  void pc_guest_info_init(PCMachineState *pcms)
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb..f64639b873 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -39,6 +39,7 @@
>  #include "sysemu/replay.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/cpu-timers.h"
> +#include "sysemu/xen.h"
>  #include "trace.h"
>  
>  #include "hw/i386/x86.h"
> @@ -136,6 +137,21 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>       */
>      x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
>                                                        ms->smp.max_cpus - 1) + 1;
> +
> +    /*
> +     * Can we support APIC ID 255 or higher?
> +     *
> +     * Under Xen: yes.
> +     * With userspace emulated lapic: no
> +     * With KVM's in-kernel lapic: only if X2APIC API is enabled.
> +     */
> +    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
> +        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
> +        error_report("current -smp configuration requires kernel "
> +                     "irqchip and X2APIC API support.");
> +        exit(EXIT_FAILURE);
> +    }
> +
>      possible_cpus = mc->possible_cpu_arch_ids(ms);
>      for (i = 0; i < ms->smp.cpus; i++) {
>          x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index d95028018e..c60cb2dafb 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -165,7 +165,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
>          /* only applies to builtin_x86_defs cpus */
>          if (!kvm_irqchip_in_kernel()) {
>              x86_cpu_change_kvm_default("x2apic", "off");
> -        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
> +        } else if (kvm_irqchip_is_split()) {
>              x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>          }
>  
> -- 
> 2.31.1


