Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE8C2DD983
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 20:48:38 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzGO-0002lD-6w
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 14:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kpzE5-0001tB-Dw
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:46:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:49716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kpzDz-0000sk-Gx
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 14:46:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B93F5AC1A;
 Thu, 17 Dec 2020 19:46:03 +0000 (UTC)
Subject: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY (was:
 [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
Date: Thu, 17 Dec 2020 20:46:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201211100908.19696-8-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I would like to highlight the current dangerous state of NEED_CPU_H / CONFIG_SOFTMMU / CONFIG_USER_ONLY.

This patch of mine (the last in the i386 cleanup PART 2) breaks check-tcg.

The why is not obvious at all. I'll comment below it.

On 12/11/20 11:09 AM, Claudio Fontana wrote:
> centralize the calls to cpu->accel_cpu_interface
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  include/hw/core/cpu.h | 6 ++++++
>  hw/core/cpu.c         | 9 +++++++++
>  target/i386/cpu.c     | 9 ++-------
>  3 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 97e1dd8279..cc05c8fc96 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -664,6 +664,12 @@ void cpu_list_remove(CPUState *cpu);
>   */
>  void cpu_reset(CPUState *cpu);
>  
> +/**
> + * cpu_accel_instance_init:
> + * @cpu: The CPU that needs to do accel-specific object initializations.
> + */
> +void cpu_accel_instance_init(CPUState *cpu);
> +
>  /**
>   * cpu_class_by_name:
>   * @typename: The CPU base type.
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index f41c009e6c..873cf5e4ef 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -242,6 +242,15 @@ void cpu_reset(CPUState *cpu)
>      trace_guest_cpu_reset(cpu);
>  }
>  
> +void cpu_accel_instance_init(CPUState *cpu)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->accel_cpu_interface) {
> +        cc->accel_cpu_interface->cpu_instance_init(cpu);
> +    }
> +}
> +
>  static void cpu_common_reset(DeviceState *dev)
>  {
>      CPUState *cpu = CPU(dev);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 5615d9e8bc..8ee39bea24 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -28,7 +28,6 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/hvf.h"
> -#include "hw/core/accel-cpu.h"
>  #include "sysemu/xen.h"
>  #include "kvm/kvm_i386.h"
>  #include "sev_i386.h"
> @@ -6621,8 +6620,6 @@ static void x86_cpu_initfn(Object *obj)
>  {
>      X86CPU *cpu = X86_CPU(obj);
>      X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
> -    CPUClass *cc = CPU_CLASS(xcc);
> -
>      CPUX86State *env = &cpu->env;
>      FeatureWord w;
>  
> @@ -6680,10 +6677,8 @@ static void x86_cpu_initfn(Object *obj)
>          x86_cpu_load_model(cpu, xcc->model);
>      }
>  
> -    /* if required, do the accelerator-specific cpu initialization */
> -    if (cc->accel_cpu_interface) {
> -        cc->accel_cpu_interface->cpu_instance_init(CPU(obj));
> -    }
> +    /* if required, do accelerator-specific cpu initializations */
> +    cpu_accel_instance_init(CPU(obj));
>  }
>  
>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
> 


Seems a harmless change right?

Just extract the use of cc->accel_cpu_interface->cpu_instance_init from x86 so it can be a useful function for all architecture targets to start using,
as we continue the refactoring past x86 into arm etc.

Instead, it breaks at least check-tcg (linux-user), if not more.



vvv spoiler below vvvv



The reason comes down in the end to the fact that we have moved code that is using CPUClass from target/i386 to hw/core/cpu.c.

If we look at hw/core/meson.build , we notice that cpu.c is in common_ss.

common_ss code does NOT see CONFIG_USER_ONLY, ever.

So our struct TcgCpuOperations in include/hw/core/cpu.h,
which contains after this series:

#ifndef CONFIG_USER_ONLY
    /**                                                                                                                                     
     * @do_transaction_failed: Callback for handling failed memory transactions                                                             
     * (ie bus faults or external aborts; not MMU faults)                                                                                   
     */
    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
                                  unsigned size, MMUAccessType access_type,
                                  int mmu_idx, MemTxAttrs attrs,
                                  MemTxResult response, uintptr_t retaddr);
    /**                                                                                                                                     
     * @do_unaligned_access: Callback for unaligned access handling                                                                         
     */
    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                MMUAccessType access_type,
                                int mmu_idx, uintptr_t retaddr);
#endif /* !CONFIG_USER_ONLY */

Now suddenly will have some of the objects (in target/...) seeing the struct as not having do_transaction_failed and do_unaligned_access,
and some of the objects (common_ss stuff) not seeing CONFIG_USER_ONLY and therefore instead _seeing_ do_transaction_failed and do_unaligned_access.

Result is a set of segfaults.

The reason we went on and tried to protect with CONFIG_USER_ONLY was to make sure that it is a compile time error to try to use these for linux-user,
but we end up making things worse.

Note that include/hw/core/cpu.h already uses CONFIG_USER_ONLY in other parts of the header file, and we might have hidden problems as a result we (or at least I) don't know about,
because code is being compiled in for linux-user which explicitly should not be compiled there.

There are multiple workarounds / fixes possible for my short term problem,
but would it not be a good idea to fix this problem at its root once and for all?

Otherwise, like I fell into this trap, others also probably will, and based on the existing cpu.h code already in mainline, indeed it seems already have.

Thoughts?

Thanks,

Claudio





