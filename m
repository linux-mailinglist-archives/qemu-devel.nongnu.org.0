Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB02DE941
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:49:35 +0100 (CET)
Received: from localhost ([::1]:48624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqKoo-0007m7-Hf
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kqKnW-0007Kv-5o
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kqKnT-0001GH-Fh
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 13:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608317289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vh0Y702mbjoNR5+w5rJLyssvLKpcVFI6A8yWmqHOwoA=;
 b=YGg++lMiTpyTWUrZtMYpYsbLtIBlPOGqJGR7xCF4Ofz2UA2EzNdYzt0XA8s4LdZVtcPoqz
 UM4zHLd2A8GPGihBJr2K+xfK64z5spV37Expp7NEB7U7KBeio+Qiv8VWbTkhNZaADUW33e
 ruulEB27uzQdbZGbRvp06MsTuKrxQJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-9nnUSZEIM8eyQd7amaxRiQ-1; Fri, 18 Dec 2020 13:48:05 -0500
X-MC-Unique: 9nnUSZEIM8eyQd7amaxRiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A541842158;
 Fri, 18 Dec 2020 18:48:04 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CE35D6DC;
 Fri, 18 Dec 2020 18:47:55 +0000 (UTC)
Date: Fri, 18 Dec 2020 13:47:54 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [RFC PATCH v1] x86/cpu: initialize the CPU concurrently
Message-ID: <20201218184754.GT3140057@habkost.net>
References: <26a765fb-dae1-db33-a406-cef79d5c1d58@huawei.com>
MIME-Version: 1.0
In-Reply-To: <26a765fb-dae1-db33-a406-cef79d5c1d58@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "S. Tsirkin, Michael" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>,
 yebiaoxiang <yebiaoxiang@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Thanks for the patch, and sorry for taking so long to look at it.

On Wed, Nov 25, 2020 at 07:54:17PM +0800, Zhenyu Ye wrote:
> From 0b4318c9dbf6fa152ec14eab29837ea06e2d78e5 Mon Sep 17 00:00:00 2001
> From: eillon <yezhenyu2@huawei.com>
> Date: Wed, 25 Nov 2020 19:17:03 +0800
> Subject: [PATCH] x86/cpu: initialize the CPU concurrently
> 
> Currently we initialize cpu one by one in qemu_init_vcpu(), every cpu
> should have to wait util cpu->created = true.  When cpus_accel->create_vcpu_thread
> costs too long time or the number of CPUs is too large, this will prolong
> the boot time.
> 

How long was boot time before and after the patch?

> This patch initializes the CPU concurrently.
> 
> Signed-off-by: eillon <yezhenyu2@huawei.com>
> ---
>  hw/i386/x86.c         | 7 +++++--
>  include/hw/core/cpu.h | 3 +++
>  include/hw/i386/x86.h | 3 ++-
>  softmmu/cpus.c        | 9 +++++++--
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 5944fc44ed..a98f68b220 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -101,9 +101,11 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
>  }
> 
> 
> -void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
> +void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
> +                 bool last_cpu, Error **errp)
>  {
>      Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
> +    ((CPUState *)cpu)->last_cpu = last_cpu;

Please use the CPU() macro instead of direct casts.  Preferably
with a separate variable.  e.g.:

  Object *obj = object_new(MACHINE(x86ms)->cpu_type);
  CPUState *cpu = CPU(obj);

> 
>      if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
>          goto out;
> @@ -135,7 +137,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>                                                        ms->smp.max_cpus - 1) + 1;
>      possible_cpus = mc->possible_cpu_arch_ids(ms);
>      for (i = 0; i < ms->smp.cpus; i++) {
> -        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
> +        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
> +                    i == ms->smp.cpus - 1, &error_fatal);
>      }
>  }
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 3d92c967ff..b7e05e2d58 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -467,6 +467,9 @@ struct CPUState {
> 
>      /* track IOMMUs whose translations we've cached in the TCG TLB */
>      GArray *iommu_notifiers;
> +
> +    /* The last cpu to init. */
> +    bool last_cpu;
>  };
> 
>  typedef QTAILQ_HEAD(CPUTailQ, CPUState) CPUTailQ;
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 739fac5087..0f7a6e5d16 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -84,7 +84,8 @@ void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
>  uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
>                                      unsigned int cpu_index);
> 
> -void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, Error **errp);
> +void x86_cpu_new(X86MachineState *pcms, int64_t apic_id,
> +                 bool last_cpu, Error **errp);
>  void x86_cpus_init(X86MachineState *pcms, int default_cpu_version);
>  CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
>                                               unsigned cpu_index);
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index e46ac68ad0..5a8eae28ab 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -621,8 +621,13 @@ void qemu_init_vcpu(CPUState *cpu)
>      g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
>      cpus_accel->create_vcpu_thread(cpu);
> 
> -    while (!cpu->created) {
> -        qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +    if (cpu->last_cpu) {

What about all the other architectures that don't set
last_cpu=true?  They will never wait for the CPU to be created.

> +        CPUState *cs = first_cpu;
> +        CPU_FOREACH(cs) {
> +            while (!cs->created) {
> +                qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
> +            }
> +        }

I suggest doing this "wait for all CPUs" step outside qemu_init_vcpu().

What about not making the last CPU special, and just providing a
optional mechanism to wait for all VCPU threads after the CPU
objects were created?  e.g.:

  struct CPUState {
      ...
      /*
       * If true, qemu_init_vcpu() will not wait for the VCPU thread to be created
       * before returning.
       */
      bool async_init;
  };

  void qemu_wait_vcpu_thread_init(CPUState *cpu)
  {
      while (!cpu->created) {
          qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
      }
  }

  void qemu_wait_all_vcpu_threads_init(void)
  {
      CPU_FOREACH(cpu) {
          qemu_wait_vcpu_thread_init(cpu);
      }
  }

  void qemu_init_vcpu(CPUState *cpu)
  {
      ...
      if (!cpu->async_init) {
          qemu_wait_vcpu_thread_init(cpu);
      }
  }

  void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, bool async, Error **errp)
  {
      ...
      cpu->async_init = async;
      qdev_realize(DEVICE(cpu), NULL, errp);
      ...
  }

  void x86_cpus_init(...)
  {
      ...
      for (i = 0; i < ms->smp.cpus; i++) {
          x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, true, &error_fatal);
      }
      qemu_wait_all_vcpu_threads_init();
  }

>      }
>  }
> 
> -- 
> 2.22.0.windows.1
> 

-- 
Eduardo


