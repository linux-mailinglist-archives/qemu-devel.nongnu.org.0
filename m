Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB690526302
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:39:38 +0200 (CEST)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVW5-0000fl-9t
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npVUG-0007Wq-CT
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1npVUC-0003jl-BL
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652449059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dje7gUvz5ERjOzAnMi7xaWYpJ+DQ4JH+qWGxndahImg=;
 b=Fgl/FSB6oeGbgv8wzQCPrb2ldpgsDFAzC5UHD1de8RJi1SLPvVfToXJMcpQV3yP1+xJ0TN
 pLk8NpQyVWGESOf6crEhipDye9gV4oUnd/YfjQ1yKZlYXr27UeaISrIMn7QGFlgvQRUbB0
 +SrLyaB+GT8n6fa3wE3OMbS++ukQAFU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-ntuS9RiaNqKJSCPkCIPlwQ-1; Fri, 13 May 2022 09:37:37 -0400
X-MC-Unique: ntuS9RiaNqKJSCPkCIPlwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so5978928wmq.3
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 06:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dje7gUvz5ERjOzAnMi7xaWYpJ+DQ4JH+qWGxndahImg=;
 b=WO8cNtPHmarHZDwqcv8/EHvHi0hd573aZ1f9gAWtrfthxUALqV29mxx9F3OC2z6UGS
 5ZhQ/JwZIWQ1VIu0MWCL9m0CCyrrKjgXa7muxDoHALJSFzLg4tB+SB+b4NGugWdFTZeH
 tZ/m9LISOqviMk3dH9h4QVYXqh6r9cn0DToX5bsiEwTZa5fLyhKkK2OKAik+yjXhwJzD
 PAWw9QOgf/YijbfMdeU5BCNpxj3kWLCPrEN9EM24YuOeBAaHdkP8Bq0KstdJop5Z0xhH
 uxoS1yJGiVLHlFrPYkQLgcDckXEHHqcA+oHFnDx6Xyf05hwkddc0I3lzs1655XfSs0+p
 D5fQ==
X-Gm-Message-State: AOAM532bIHIP8LSXufNfF0xprAkDAv6oKYWKqEc6IUKfpEFSn5XE3yag
 5PdY6tk18RU0UstFC2PNNZCK4ZXXb3OypxU3XJs7cEJEqS+BP6i48FlMQVqVJDeyUuHYp9DQlMS
 KBrWMwbbsWm7Orik=
X-Received: by 2002:a05:600c:4e51:b0:394:513b:934 with SMTP id
 e17-20020a05600c4e5100b00394513b0934mr4665802wmq.164.1652449054073; 
 Fri, 13 May 2022 06:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB5jwJ9OltT4QNOsvYvSZjyOhEyx2rmKexRGPVscnMucHyLNhAAmmeeONvGi+npOrZkTNTHA==
X-Received: by 2002:a05:600c:4e51:b0:394:513b:934 with SMTP id
 e17-20020a05600c4e5100b00394513b0934mr4665778wmq.164.1652449053816; 
 Fri, 13 May 2022 06:37:33 -0700 (PDT)
Received: from redhat.com ([2.53.15.195]) by smtp.gmail.com with ESMTPSA id
 t21-20020adfa2d5000000b0020c5253d901sm2144190wra.77.2022.05.13.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:37:32 -0700 (PDT)
Date: Fri, 13 May 2022 09:37:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220513093616-mutt-send-email-mst@kernel.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314142544.150555-1-dwmw2@infradead.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Mar 14, 2022 at 02:25:41PM +0000, David Woodhouse wrote:
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


Fow now I applied this as-is, in particular because if the added split
irqchip test make check started failing for me on Fedora.
Igor please go ahead and make a change on top limiting things
to the split irqchip.

> ---
>  hw/i386/pc.c              |  8 --------
>  hw/i386/x86.c             | 16 ++++++++++++++++
>  target/i386/kvm/kvm-cpu.c |  2 +-
>  3 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fd55fc725c..d3ab28fec5 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -740,14 +740,6 @@ void pc_machine_done(Notifier *notifier, void *data)
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
> index 4cf107baea..8da55d58ea 100644
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
> @@ -123,6 +124,21 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
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
> 2.33.1


