Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002382E0219
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 22:38:13 +0100 (CET)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krSsf-0007UJ-3o
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 16:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krSr3-0006mW-Pg
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krSr1-0007bM-OB
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 16:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608586590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hFfGV+7bR8eTtdbc/DI4Y5RRdgaHeCobZnNm96Jhy7E=;
 b=hw+5ziqh6HnSZXuZ1QhCLdAU2LCs7YuoF51+SLQfScj2TkHVcKNCzeM2FxKQbLC5iD70gk
 Qnm3155Q+1ka3VK6q6ZQ1OmCFmFjdDEUr4jT2Bx7vMEER0yuJ3LFvZ508yNgyatzmSEXez
 CU2l4l23CAz+ZH3phFfScG6wKA98V5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-cXmR7g2XMqmzf_B5u_Isiw-1; Mon, 21 Dec 2020 16:36:28 -0500
X-MC-Unique: cXmR7g2XMqmzf_B5u_Isiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B451005504;
 Mon, 21 Dec 2020 21:36:25 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50D7A5C6B8;
 Mon, 21 Dec 2020 21:36:21 +0000 (UTC)
Date: Mon, 21 Dec 2020 16:36:20 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [RFC PATCH v2] x86/cpu: initialize the CPU concurrently
Message-ID: <20201221213620.GF6040@habkost.net>
References: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <90be4860-cbe0-25d4-ccca-75b96ecb4a3c@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>, "S. Tsirkin,
 Michael" <mst@redhat.com>, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>, yebiaoxiang <yebiaoxiang@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 07:36:18PM +0800, Zhenyu Ye wrote:
> Providing a optional mechanism to wait for all VCPU threads be
> created out of qemu_init_vcpu(), then we can initialize the cpu
> concurrently on the x86 architecture.
> 
> This reduces the time of creating virtual machines. For example, when
> the haxm is used as the accelerator, cpus_accel->create_vcpu_thread()
> will cause at least 200ms for each cpu, extremely prolong the boot
> time.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: eillon <yezhenyu2@huawei.com>

The patch is easier to follow now, but I have a question that may
be difficult to answer:

What exactly is the meaning of cpu->created=true, and what
exactly would break if we never wait for cpu->created==true at all?

I'm asking that because we might be introducing subtle races
here, if some of the remaining CPU initialization code in
x86_cpu_realizefn() [1] expects the VCPU thread to be already
initialized.

The cpu_reset() call below is one such example (but probably not
the only one).  cpu_reset() ends up calling
kvm_arch_reset_vcpu(), which seems to assume kvm_init_vcpu() was
already called.  With your patch, kvm_init_vcpu() might end up
being called after kvm_arch_reset_vcpu().

Maybe a simpler alternative is to keep the existing thread
creation logic, but changing hax_cpu_thread_fn() to do less work
before calling cpu_thread_signal_created()?

In my testing (without this patch), creation of 8 KVM VCPU
threads in a 4 core machine takes less than 3 ms.  Why is
qemu_init_vcpu() taking so long on haxm?  Which parts of haxm
initialization can be moved after cpu_thread_signal_created(), to
make this better?

---
[1]  For reference, the last few lines of x86_cpu_realizefn() are:

|     qemu_init_vcpu(cs);
| 
|     /*
|      * Most Intel and certain AMD CPUs support hyperthreading. Even though QEMU
|      * fixes this issue by adjusting CPUID_0000_0001_EBX and CPUID_8000_0008_ECX
|      * based on inputs (sockets,cores,threads), it is still better to give
|      * users a warning.
|      *
|      * NOTE: the following code has to follow qemu_init_vcpu(). Otherwise
|      * cs->nr_threads hasn't be populated yet and the checking is incorrect.
|      */
|     if (IS_AMD_CPU(env) &&
|         !(env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_TOPOEXT) &&
|         cs->nr_threads > 1 && !ht_warned) {
|             warn_report("This family of AMD CPU doesn't support "
|                         "hyperthreading(%d)",
|                         cs->nr_threads);
|             error_printf("Please configure -smp options properly"
|                          " or try enabling topoext feature.\n");
|             ht_warned = true;
|     }
| 
|     x86_cpu_apic_realize(cpu, &local_err);
|     if (local_err != NULL) {
|         goto out;
|     }
|     cpu_reset(cs);
| 
|     xcc->parent_realize(dev, &local_err);
| 
| out:
|     if (local_err != NULL) {
|         error_propagate(errp, local_err);
|         return;
|     }
| }



> ---
>  hw/i386/x86.c         |  3 +++
>  include/hw/core/cpu.h | 13 +++++++++++++
>  softmmu/cpus.c        | 21 +++++++++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6329f90ef9..09afff724a 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -108,6 +108,8 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
>      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>          goto out;
>      }
> +
> +    CPU(cpu)->async_init = true;
>      qdev_realize(DEVICE(cpu), NULL, errp);
> 
>  out:
> @@ -137,6 +139,7 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>      for (i = 0; i < ms->smp.cpus; i++) {
>          x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
>      }
> +    qemu_wait_all_vcpu_threads_init();
>  }
> 
>  void x86_rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count)
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 8e7552910d..55c2c17d93 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -467,6 +467,12 @@ struct CPUState {
> 
>      /* track IOMMUs whose translations we've cached in the TCG TLB */
>      GArray *iommu_notifiers;
> +
> +    /*
> +     * If true, qemu_init_vcpu() will not wait for the VCPU thread to be created
> +     * before returning.
> +     */
> +    bool async_init;
>  };
> 
>  typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
> @@ -977,6 +983,13 @@ void start_exclusive(void);
>   */
>  void end_exclusive(void);
> 
> +/**
> + * qemu_wait_all_vcpu_threads_init:
> + *
> + * Wait for all VCPU threads to be created.
> + */
> +void qemu_wait_all_vcpu_threads_init(void);
> +
>  /**
>   * qemu_init_vcpu:
>   * @cpu: The vCPU to initialize.
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 1dc20b9dc3..d76853d356 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -601,6 +601,23 @@ void cpus_register_accel(const CpusAccel *ca)
>      cpus_accel = ca;
>  }
> 
> +static void qemu_wait_vcpu_thread_init(CPUState *cpu)
> +{
> +    while (!cpu->created) {
> +        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +    }
> +}
> +
> +void qemu_wait_all_vcpu_threads_init(void)
> +{
> +    CPUState *cpu;
> +
> +    CPU_FOREACH(cpu) {
> +        printf("***** cpuid: %d\n", cpu->cpu_index);

Debugging leftover.

> +        qemu_wait_vcpu_thread_init(cpu);
> +    }
> +}
> +
>  void qemu_init_vcpu(CPUState *cpu)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -622,8 +639,8 @@ void qemu_init_vcpu(CPUState *cpu)
>      g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
>      cpus_accel->create_vcpu_thread(cpu);
> 
> -    while (!cpu->created) {
> -        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +    if (!cpu->async_init) {
> +        qemu_wait_vcpu_thread_init(cpu);
>      }
>  }
> 
> -- 
> 2.22.0.windows.1
> 

-- 
Eduardo


