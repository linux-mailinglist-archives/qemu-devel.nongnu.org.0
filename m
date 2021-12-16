Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DF476A69
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:35:07 +0100 (CET)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxkM4-0002zc-Eh
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:35:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxkGe-0001I2-HK
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mxkGb-0001uf-Mq
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 01:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639636164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hltzC0jH0InsE4jc4nIJQXMG5CeN7I/5TezuBuQh9eE=;
 b=RZ3RoD2fxmMbt9u6cYgXd0M7STT1PhN9DtJQG7Q3qEOHxs6LsgcClN9YC3dvkM6cUtir7D
 wwEMf3+GPSEjXvQk/KLugASx67jNHSol2K0OHvX0gyWsNIINfc2bOpEsz1DChp235RYDc+
 Rhg905gdXFgrhUgXn//ta2csUrxKI2Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-lmbt8F5dOeGtVCLE5ZEgSg-1; Thu, 16 Dec 2021 01:29:22 -0500
X-MC-Unique: lmbt8F5dOeGtVCLE5ZEgSg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t30-20020adfa2de000000b001a24004e1fbso314086wra.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 22:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hltzC0jH0InsE4jc4nIJQXMG5CeN7I/5TezuBuQh9eE=;
 b=S7IvEszSu2lkTWSSOs9qJZWBfDDt7SEzzbCDHiYTscM4FbXumC5z/wRII7d8zqii4u
 Mtr4324RiTwP1j7Q5etZpQXwMOH0PoBKuWrmjW77IVYS2oLkT06ZPp195lRMVteyfv83
 DyLt3T9RiuAyDmvETNHGgqmNGA5tIyGqW8mM+nGz8Kh7KHt2W/310fVbYW2u8VpuGuLt
 BCvzgjatXDkr+GT9ryIBVqAx+rgm+VhdiZUmdiaXU0QQrW4vlA/lhAfUemaBs6U2N1vn
 3ROYCNAwRTgX6HfKzVLfvyqj+tmxKxgwzGOry+J2WjZkajjDLcfpD1odrhZvD1Mmwnun
 nzbA==
X-Gm-Message-State: AOAM533P5XUSp4MkFP12mRknR01YSbdYffGnQD3uu3P6VnertHmeV/Vs
 ZJ6AvF1QgbylCX0YKRblG2WzrbfHezZ2T2hrA9SxzYsA+4sVq/9izVvpuJhhcjDFpK5Ah2MVAqQ
 lcws7xGyVdi4o9bk=
X-Received: by 2002:adf:9142:: with SMTP id j60mr7672055wrj.647.1639636160083; 
 Wed, 15 Dec 2021 22:29:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX+T9NNLdFZLk9doCVVEU/thTxcm8lH7TAils+KIVa32uOr+/Y76DYKjl6obHoWYvFCKXSKQ==
X-Received: by 2002:adf:9142:: with SMTP id j60mr7672033wrj.647.1639636159849; 
 Wed, 15 Dec 2021 22:29:19 -0800 (PST)
Received: from xz-m1.local ([64.64.123.12])
 by smtp.gmail.com with ESMTPSA id f18sm3780031wre.7.2021.12.15.22.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:29:19 -0800 (PST)
Date: Thu, 16 Dec 2021 14:29:12 +0800
From: Peter Xu <peterx@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <YbrcuC+MEigJpxCS@xz-m1.local>
References: <20211209220840.14889-1-dwmw2@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20211209220840.14889-1-dwmw2@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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

I'm wondering whether we should still leave it be in the accel code, or is
therer something that guarantees when reaching here kvm accel is initialized?

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
> 

-- 
Peter Xu


