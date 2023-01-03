Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06D65C5D7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:14:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClmn-0006ci-9t; Tue, 03 Jan 2023 13:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pClmj-0006cM-8Y
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pClmf-0004K3-Ag
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:13:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672769587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mw0XeCEHuAaNxYRamfAKyrWYjVqg5Q1qmefKc7WXZ/k=;
 b=WlfONK0tCfL7M0XvzfuCegDf6u37bDlaZYYLotf8ezwStPpl2zfhwSOQBlp+RXW43bF0ma
 mNeUCSqFIWCit9c7Dkaf/br1Yo3LsiFL4J6m1oCWt3vvzxKlm9TB3gMjs1evl/P3GulSgE
 W3UedLNX4j1PqhpR+ofu27Q+s5aeZJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-cy4T9Q5APvuKWBlCl59HYg-1; Tue, 03 Jan 2023 13:13:06 -0500
X-MC-Unique: cy4T9Q5APvuKWBlCl59HYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n18-20020a05600c4f9200b003d993e08485so9507960wmq.2
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:13:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mw0XeCEHuAaNxYRamfAKyrWYjVqg5Q1qmefKc7WXZ/k=;
 b=om+9wI1WbwrztS48zCi42mh8yUguziE4BGgnWlMYt+aGM4Jzg0siemZGT9D1uAeRhO
 0CcEux4v68821Rl1M5jIYzHJRVGqfXbF41M7uNzpCKYG/+0jk8ONcucgWM+mGCvn7hAX
 SNLqSTNnhRADQQqwYc4eDBmfFxPzFZ0VUxytmQhmEKZTDFkQKyjadL6PZhs/0IpRaGWA
 +n4q+LdANv4wPoJN/FFMXlAIiZ2iRhedfnlKcLwHeBznUz9D/O2O4H9lLeWdWM0IY57q
 uIFvkmMMNZGHOFEHKoA0VmwuqkEBoOynJAqy0ujVqFVYVkQzbRHBwoLEDmrK+qOSBZtp
 J3mA==
X-Gm-Message-State: AFqh2kovfeJWYZyZHubltkz1yO7NjijjHSuioJUME2nRtoTW/jf2Npmn
 8/0txp9GkYGE2jBRZUwv6AIjbFbdtgsvWJxz1VF6UYqEb9fLPRy0GBiACs4Noqjdfy+09O53ixs
 Z2bblKjUzoXhRB9o=
X-Received: by 2002:a05:600c:4e14:b0:3c6:c6c9:d75e with SMTP id
 b20-20020a05600c4e1400b003c6c6c9d75emr39380408wmq.0.1672769585407; 
 Tue, 03 Jan 2023 10:13:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMQEIt2AHE/w8AV972vYJxOpvs/iRLmwJkR8lNvhJaEUsGUjsuPAGRvYY6wtbTkQR5GZm9iw==
X-Received: by 2002:a05:600c:4e14:b0:3c6:c6c9:d75e with SMTP id
 b20-20020a05600c4e1400b003c6c6c9d75emr39380379wmq.0.1672769585052; 
 Tue, 03 Jan 2023 10:13:05 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05600c4f8100b003d96b8e9bcasm46690271wmq.32.2023.01.03.10.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:13:04 -0800 (PST)
Date: Tue, 3 Jan 2023 18:13:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v5 21/52] i386/xen: handle VCPUOP_register_vcpu_info
Message-ID: <Y7RwLhtR7lQiCsQ5@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-22-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230121235.1282915-22-dwmw2@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* David Woodhouse (dwmw2@infradead.org) wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Handle the hypercall to set a per vcpu info, and also wire up the default
> vcpu_info in the shared_info page for the first 32 vCPUs.
> 
> To avoid deadlock within KVM a vCPU thread must set its *own* vcpu_info
> rather than it being set from the context in which the hypercall is
> invoked.
> 
> Add the vcpu_info (and default) GPA to the vmstate_x86_cpu for migration,
> and restore it in kvm_arch_put_registers() appropriately.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  target/i386/cpu.h            |   2 +
>  target/i386/kvm/kvm.c        |  17 ++++
>  target/i386/kvm/trace-events |   1 +
>  target/i386/kvm/xen-emu.c    | 152 ++++++++++++++++++++++++++++++++++-
>  target/i386/kvm/xen-emu.h    |   2 +
>  target/i386/machine.c        |  19 +++++
>  6 files changed, 190 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c6c57baed5..109b2e5669 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1788,6 +1788,8 @@ typedef struct CPUArchState {
>  #endif
>  #if defined(CONFIG_KVM)
>      struct kvm_nested_state *nested_state;
> +    uint64_t xen_vcpu_info_gpa;
> +    uint64_t xen_vcpu_info_default_gpa;
>  #endif
>  #if defined(CONFIG_HVF)
>      HVFX86LazyFlags hvf_lflags;
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f365e56fcc..52d69e87e7 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -4734,6 +4734,15 @@ int kvm_arch_put_registers(CPUState *cpu, int level)
>          kvm_arch_set_tsc_khz(cpu);
>      }
>  
> +#ifdef CONFIG_XEN_EMU
> +    if (xen_mode == XEN_EMULATE && level == KVM_PUT_FULL_STATE) {
> +        ret = kvm_put_xen_state(cpu);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +#endif
> +
>      ret = kvm_getput_regs(x86_cpu, 1);
>      if (ret < 0) {
>          return ret;
> @@ -4833,6 +4842,14 @@ int kvm_arch_get_registers(CPUState *cs)
>      if (ret < 0) {
>          goto out;
>      }
> +#ifdef CONFIG_XEN_EMU
> +    if (xen_mode == XEN_EMULATE) {
> +        ret = kvm_get_xen_state(cs);
> +        if (ret < 0) {
> +            goto out;
> +        }
> +    }
> +#endif
>      ret = 0;
>   out:
>      cpu_sync_bndcs_hflags(&cpu->env);
> diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
> index 0a47c26e80..14e54dfca5 100644
> --- a/target/i386/kvm/trace-events
> +++ b/target/i386/kvm/trace-events
> @@ -9,3 +9,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
>  # xen-emu.c
>  kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
>  kvm_xen_set_shared_info(uint64_t gfn) "shared info at gfn 0x%" PRIx64
> +kvm_xen_set_vcpu_attr(int cpu, int type, uint64_t gpa) "vcpu attr cpu %d type %d gpa 0x%" PRIx64
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 0e9ae481d8..aa06588c07 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -120,6 +120,8 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
>  
>  int kvm_xen_init_vcpu(CPUState *cs)
>  {
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
>      int err;
>  
>      /*
> @@ -143,6 +145,9 @@ int kvm_xen_init_vcpu(CPUState *cs)
>          }
>      }
>  
> +    env->xen_vcpu_info_gpa = INVALID_GPA;
> +    env->xen_vcpu_info_default_gpa = INVALID_GPA;
> +
>      return 0;
>  }
>  
> @@ -188,10 +193,58 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
>      return true;
>  }
>  
> +static int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa)
> +{
> +    struct kvm_xen_vcpu_attr xhsi;
> +
> +    xhsi.type = type;
> +    xhsi.u.gpa = gpa;
> +
> +    trace_kvm_xen_set_vcpu_attr(cs->cpu_index, type, gpa);
> +
> +    return kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &xhsi);
> +}
> +
> +static void do_set_vcpu_info_default_gpa(CPUState *cs, run_on_cpu_data data)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +
> +    env->xen_vcpu_info_default_gpa = data.host_ulong;
> +
> +    /* Changing the default does nothing if a vcpu_info was explicitly set. */
> +    if (env->xen_vcpu_info_gpa == INVALID_GPA) {
> +        kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
> +                              env->xen_vcpu_info_default_gpa);
> +    }
> +}
> +
> +static void do_set_vcpu_info_gpa(CPUState *cs, run_on_cpu_data data)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +
> +    env->xen_vcpu_info_gpa = data.host_ulong;
> +
> +    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
> +                          env->xen_vcpu_info_gpa);
> +}
> +
> +static void do_vcpu_soft_reset(CPUState *cs, run_on_cpu_data data)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +
> +    env->xen_vcpu_info_gpa = INVALID_GPA;
> +    env->xen_vcpu_info_default_gpa = INVALID_GPA;
> +
> +    kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, INVALID_GPA);
> +}
> +
>  static int xen_set_shared_info(uint64_t gfn)
>  {
>      uint64_t gpa = gfn << TARGET_PAGE_BITS;
> -    int err;
> +    int i, err;
>  
>      /*
>       * The xen_overlay device tells KVM about it too, since it had to
> @@ -206,6 +259,15 @@ static int xen_set_shared_info(uint64_t gfn)
>  
>      trace_kvm_xen_set_shared_info(gfn);
>  
> +    for (i = 0; i < XEN_LEGACY_MAX_VCPUS; i++) {
> +        CPUState *cpu = qemu_get_cpu(i);
> +        if (cpu) {
> +            async_run_on_cpu(cpu, do_set_vcpu_info_default_gpa,
> +                             RUN_ON_CPU_HOST_ULONG(gpa));
> +        }
> +        gpa += sizeof(vcpu_info_t);
> +    }
> +
>      return err;
>  }
>  
> @@ -363,15 +425,43 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>      }
>  }
>  
> +static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
> +                                     uint64_t arg)
> +{
> +    struct vcpu_register_vcpu_info rvi;
> +    uint64_t gpa;
> +
> +    /* No need for 32/64 compat handling */
> +    qemu_build_assert(sizeof(rvi) == 16);
> +    qemu_build_assert(sizeof(struct vcpu_info) == 64);
> +
> +    if (!target) {
> +        return -ENOENT;
> +    }
> +
> +    if (kvm_copy_from_gva(cs, arg, &rvi, sizeof(rvi))) {
> +        return -EFAULT;
> +    }
> +
> +    if (rvi.offset > TARGET_PAGE_SIZE - sizeof(struct vcpu_info)) {
> +        return -EINVAL;
> +    }
> +
> +    gpa = ((rvi.mfn << TARGET_PAGE_BITS) + rvi.offset);
> +    async_run_on_cpu(target, do_set_vcpu_info_gpa, RUN_ON_CPU_HOST_ULONG(gpa));
> +    return 0;
> +}
> +
>  static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>                                    int cmd, int vcpu_id, uint64_t arg)
>  {
> +    CPUState *dest = qemu_get_cpu(vcpu_id);
> +    CPUState *cs = CPU(cpu);
>      int err;
>  
>      switch (cmd) {
>      case VCPUOP_register_vcpu_info:
> -        /* no vcpu info placement for now */
> -        err = -ENOSYS;
> +        err = vcpuop_register_vcpu_info(cs, dest, arg);
>          break;
>  
>      default:
> @@ -384,8 +474,13 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>  
>  static int kvm_xen_soft_reset(void)
>  {
> +    CPUState *cpu;
>      int err;
>  
> +    CPU_FOREACH(cpu) {
> +        async_run_on_cpu(cpu, do_vcpu_soft_reset, RUN_ON_CPU_NULL);
> +    }
> +
>      err = xen_overlay_map_shinfo_page(INVALID_GFN);
>      if (err) {
>          return err;
> @@ -531,3 +626,54 @@ int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>                              exit->u.hcall.result);
>      return 0;
>  }
> +
> +int kvm_put_xen_state(CPUState *cs)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +    uint64_t gpa;
> +    int ret;
> +
> +    gpa = env->xen_vcpu_info_gpa;
> +    if (gpa == INVALID_GPA) {
> +        gpa = env->xen_vcpu_info_default_gpa;
> +    }
> +
> +    if (gpa != INVALID_GPA) {
> +        ret = kvm_xen_set_vcpu_attr(cs, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +int kvm_get_xen_state(CPUState *cs)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +    uint64_t gpa;
> +
> +    /*
> +     * The kernel does not mark vcpu_info as dirty when it delivers interrupts
> +     * to it. It's up to userspace to *assume* that any page shared thus is
> +     * always considered dirty. The shared_info page is different since it's
> +     * an overlay and migrated separately anyway.
> +     */
> +    gpa = env->xen_vcpu_info_gpa;
> +    if (gpa == INVALID_GPA) {
> +        gpa = env->xen_vcpu_info_default_gpa;
> +    }
> +    if (gpa != INVALID_GPA) {
> +        MemoryRegionSection mrs = memory_region_find(get_system_memory(),
> +                                                     gpa,
> +                                                     sizeof(struct vcpu_info));
> +        if (mrs.mr && mrs.size >= sizeof(struct vcpu_info)) {
> +            memory_region_set_dirty(mrs.mr, mrs.offset_within_region,
> +                                    sizeof(struct vcpu_info));
> +        }
> +    }
> +
> +    return 0;
> +}
> diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
> index 21faf6bf38..452605699a 100644
> --- a/target/i386/kvm/xen-emu.h
> +++ b/target/i386/kvm/xen-emu.h
> @@ -26,5 +26,7 @@
>  int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
>  int kvm_xen_init_vcpu(CPUState *cs);
>  int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
> +int kvm_put_xen_state(CPUState *cs);
> +int kvm_get_xen_state(CPUState *cs);
>  
>  #endif /* QEMU_I386_KVM_XEN_EMU_H */
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 310b125235..1215e616c8 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -6,8 +6,10 @@
>  #include "kvm/hyperv.h"
>  #include "hw/i386/x86.h"
>  #include "kvm/kvm_i386.h"
> +#include "hw/xen/xen.h"
>  
>  #include "sysemu/kvm.h"
> +#include "sysemu/kvm_xen.h"
>  #include "sysemu/tcg.h"
>  
>  #include "qemu/error-report.h"
> @@ -1257,6 +1259,22 @@ static const VMStateDescription vmstate_nested_state = {
>      }
>  };
>  
> +static bool xen_vcpu_needed(void *opaque)
> +{
> +    return (xen_mode == XEN_EMULATE);
> +}
> +
> +static const VMStateDescription vmstate_xen_vcpu = {
> +    .name = "cpu/xen_vcpu",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = xen_vcpu_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.xen_vcpu_info_gpa, X86CPU),
> +        VMSTATE_UINT64(env.xen_vcpu_info_default_gpa, X86CPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>  #endif
>  
>  static bool mcg_ext_ctl_needed(void *opaque)
> @@ -1716,6 +1734,7 @@ const VMStateDescription vmstate_x86_cpu = {
>  #endif
>  #ifdef CONFIG_KVM
>          &vmstate_nested_state,
> +        &vmstate_xen_vcpu,

Yep, that shoudln't break anything as long as xen_vcpu_needed is false,
so yeh, OK from migration.

Dave

>  #endif
>          &vmstate_msr_tsx_ctrl,
>          &vmstate_msr_intel_sgx,
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


