Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8684DAD2F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 10:06:31 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUPbx-0007SQ-Ey
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 05:06:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nUPa8-0006bR-E0
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nUPa5-00008r-9O
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647421471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4b18JDdIA23xku1asRfU8GSHk5Hq4wQ8NYHafXEvJw=;
 b=Yaxx6FcltDWy2LOOxZfGfLMo/7HIlRXilWehR5OA+3llT9AqV08aTp49cnfwB2dtv2Q1gq
 QLvYGhyekRc5pIvZWa7C8nUN0lVHoHdvrOHQvA2Zw+6SB+Z+HzMEppdGNBB30FLQZ98QY7
 AFE07yaMMTWfJTB99Fqpl17cHodwSl0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-W2Vhxl9mPlmZk2gPolseug-1; Wed, 16 Mar 2022 05:04:30 -0400
X-MC-Unique: W2Vhxl9mPlmZk2gPolseug-1
Received: by mail-ej1-f72.google.com with SMTP id
 hy9-20020a1709068a6900b006df68012720so799951ejc.14
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 02:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4b18JDdIA23xku1asRfU8GSHk5Hq4wQ8NYHafXEvJw=;
 b=lmsWTQQFvNOQOssML2H5+fEZsO4LnpVlahh5QVx6doqueOEF69Kz9s3w9jBJD7D+2C
 1W7JS2FICiof+odAuFCF57jq8xQWWIyYxxvYqA2QIpP3vCTRdL3MoPEOlmYjkrg8IKto
 BGZBd6PHSHh8iahZ7pZLpV3QsvqaF8e9N4r8dMnsLUJTNxUeDdTb0LulajUpQoz+/3CZ
 R9RjmbpAiE2iqwjNUyVyl6DhPpnmKRt/mbPKvY00IJWro+rZ82G3GirOG8ub4l8JGXAj
 2anjlPpoliRcDe4u8YW8GjyhX4FoYgtP7GLZb5OEmK/mgM2p7yUbYpgdWMWXT2yye+zi
 en3g==
X-Gm-Message-State: AOAM530Go/pHFoeWbgbmKHz+NDM8KU4YsmAWdP4IoHMoCav3Ola7Ug/y
 iwranmxz3u3jQIkc7d9+lZQeQ8VPo7En6GhnqvVVFz9gmvHF9yHIw6ulnMRAmVABGPAD7NReqiQ
 yOMQitZkAdqmoRUA=
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id
 k4-20020a056402048400b00415d931cb2fmr28755276edv.287.1647421468083; 
 Wed, 16 Mar 2022 02:04:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6vbOkdX2sZ4j3IBSv1ToNL65ZV2X37CiLr293SLnqCYWmt7SMpyk8T2yzkY8h6wuWJMj7tQ==
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id
 k4-20020a056402048400b00415d931cb2fmr28755251edv.287.1647421467847; 
 Wed, 16 Mar 2022 02:04:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 bm24-20020a170906c05800b006d58518e55fsm612760ejb.46.2022.03.16.02.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 02:04:27 -0700 (PDT)
Date: Wed, 16 Mar 2022 10:04:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220316100425.2758afc3@redhat.com>
In-Reply-To: <20220314142544.150555-1-dwmw2@infradead.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 14:25:41 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

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

Well, I retested with the latest upstream kernel (both guest and host),
and adding kvm_enable_x2apic() is not sufficient as guest according
to your patches in kernel caps max APICID at 255 unless kvm-msi-ext-dest-id
is enabled. And attempt in enabling kvm-msi-ext-dest-id with kernel-irqchip
fails.
So number of usable CPUs in guest stays at legacy level, leaving the rest
of CPUs in limbo.


> Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> Acked-by: Claudio Fontana <cfontana@suse.de>
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


