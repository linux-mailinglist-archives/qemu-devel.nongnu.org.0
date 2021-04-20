Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08413365D80
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:37:29 +0200 (CEST)
Received: from localhost ([::1]:50496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYtNP-0007ev-Ju
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYtL4-0006oQ-N2
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lYtKr-0001oc-7S
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 12:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618936486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gl+E9IP+e5+LU0nxoOVtz+cvMycobvT48vlQJu0LYPQ=;
 b=Hlz+fKm0RppQRLtjomnv9XSUX6437m6G593ePRytWKdrwHURPuLjauZdIW1HItSe2sM5Nm
 Zf3+BNub5m0zh8MT2jn/3Kr69I+DYmhwRNdROM7XBef3cjstqaLqFR/Hr40c2doS59S0/B
 gbf08BunE6eVCXUyd9zPifWBl4V1TJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316--hpQFDFGPH2LSooeX30Dfg-1; Tue, 20 Apr 2021 12:34:35 -0400
X-MC-Unique: -hpQFDFGPH2LSooeX30Dfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A6E817470;
 Tue, 20 Apr 2021 16:34:18 +0000 (UTC)
Received: from localhost (ovpn-118-208.rdu2.redhat.com [10.10.118.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7ECE5D6A1;
 Tue, 20 Apr 2021 16:34:17 +0000 (UTC)
Date: Tue, 20 Apr 2021 12:34:17 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH v2] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210420163417.lbns24ypfqz7icxg@habkost.net>
References: <20210420093736.17613-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210420093736.17613-1-chenyi.qiang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Thanks for the patch.  Comments below:

On Tue, Apr 20, 2021 at 05:37:36PM +0800, Chenyi Qiang wrote:
> Virtual Machines can exploit bus locks to degrade the performance of
> system. To address this kind of performance DOS attack, bus lock VM exit
> is introduced in KVM and it will report the bus locks detected in guest,
> which can help userspace to enforce throttling policies.
> 

Is there anything today that would protect the system from
similar attacks from userspace with access to /dev/kvm?


> The availability of bus lock VM exit can be detected through the
> KVM_CAP_X86_BUS_LOCK_EXIT. The returned bitmap contains the potential
> policies supported by KVM. The field KVM_BUS_LOCK_DETECTION_EXIT in
> bitmap is the only supported strategy at present. It indicates that KVM
> will exit to userspace to handle the bus locks.
> 
> This patch adds a ratelimit on the bus locks acquired in guest as a
> mitigation policy.
> 
> Introduce a new field "bld" to record the limited speed of bus locks in
> target VM. The user can specify it through the "bus-lock-detection"
> as a machine property. In current implementation, the default value of
> the speed is 0 per second, which means no restriction on the bus locks.
> 
> Ratelimit enforced in data transmission uses a time slice of 100ms to
> get smooth output during regular operations in block jobs. As for
> ratelimit on bus lock detection, simply set the ratelimit interval to 1s
> and restrict the quota of bus lock occurrence to the value of "bld". A
> potential alternative is to introduce the time slice as a property
> which can help the user achieve more precise control.
> 
> The detail of Bus lock VM exit can be found in spec:
> https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> 
> ---
> Changes from RFC v1:
>   - Remove the rip info output, as the rip can't reflect the bus lock
>     position correctly.
>   - RFC v1: https://lore.kernel.org/qemu-devel/20210317084709.15605-1-chenyi.qiang@intel.com/
> ---
>  hw/i386/x86.c         |  6 ++++++
>  include/hw/i386/x86.h |  7 +++++++
>  target/i386/kvm/kvm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index ed796fe6ba..42d10857a6 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1256,6 +1256,12 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
>      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +    x86ms->bld = 0;
> +
> +    object_property_add_uint64_ptr(obj, "bus-lock-detection",
> +                                   &x86ms->bld, OBJ_PROP_FLAG_READWRITE);
> +    object_property_set_description(obj, "bus-lock-detection",
> +            "Bus lock detection ratelimit");

I suggest using a name that indicates this is a rate limit (e.g.
"bus-lock-rate-limit").  "bus-lock-detection" sounds like a
boolean option to just enable/disable detection.

Please register a class property at x86_machine_class_init()
instead.  The plan is to eventually stop using instance
properties wherever possible, as class properties make property
introspection simpler.

See machine_class_init() for some examples of integer class
properties.  Unfortunately object_class_property_add_uint64_ptr()
is not very useful currently, so you'll need to write your own
getter/setter function.


>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index c09b648dff..d6e198b228 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -74,6 +74,13 @@ struct X86MachineState {
>       * will be translated to MSI messages in the address space.
>       */
>      AddressSpace *ioapic_as;
> +
> +    /*
> +     * ratelimit enforced on detected bus locks, the default value
> +     * is 0 per second
> +     */

I suggest documenting here that 0 means no limit.

> +    uint64_t bld;
> +    RateLimit bld_limit;
>  };
>  
>  #define X86_MACHINE_SMM              "smm"
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 7fe9f52710..a75fac0404 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -130,6 +130,8 @@ static bool has_msr_mcg_ext_ctl;
>  static struct kvm_cpuid2 *cpuid_cache;
>  static struct kvm_msr_list *kvm_feature_msrs;
>  
> +#define SLICE_TIME 1000000000ULL /* ns */
> +

"slice time" is a very generic name.  I suggest "BLD_SLICE_TIME"
or "BUS_LOCK_SLICE_TIME".

>  int kvm_has_pit_state2(void)
>  {
>      return has_pit_state2;
> @@ -2267,6 +2269,27 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          }
>      }
>  
> +    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
> +        X86MachineState *x86ms = X86_MACHINE(ms);
> +
> +        if (x86ms->bld > 0) {
> +            ret = kvm_check_extension(s, KVM_CAP_X86_BUS_LOCK_EXIT);
> +            if (!(ret & KVM_BUS_LOCK_DETECTION_EXIT)) {
> +                error_report("kvm: bus lock detection unsupported");
> +                return -ENOTSUP;
> +            }
> +            ret = kvm_vm_enable_cap(s, KVM_CAP_X86_BUS_LOCK_EXIT, 0,
> +                                    KVM_BUS_LOCK_DETECTION_EXIT);
> +            if (ret < 0) {
> +                error_report("kvm: Failed to enable bus lock detection cap: %s",
> +                             strerror(-ret));
> +                return ret;
> +            }
> +
> +            ratelimit_set_speed(&x86ms->bld_limit, x86ms->bld, SLICE_TIME);
> +        }
> +    }
> +
>      return 0;
>  }
>  
> @@ -4221,6 +4244,18 @@ void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
>      }
>  }
>  
> +static void kvm_rate_limit_on_bus_lock(void)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    X86MachineState *x86ms = X86_MACHINE(ms);
> +
> +    uint64_t delay_ns = ratelimit_calculate_delay(&x86ms->bld_limit, 1);
> +

This doesn't look thread safe.  Isn't this going to run from the
VCPU thread with no locks acquired?

> +    if (delay_ns) {
> +        g_usleep(delay_ns / SCALE_US);
> +    }
> +}
> +
>  MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>  {
>      X86CPU *x86_cpu = X86_CPU(cpu);
> @@ -4236,6 +4271,9 @@ MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run)
>      } else {
>          env->eflags &= ~IF_MASK;
>      }
> +    if (run->flags & KVM_RUN_X86_BUS_LOCK) {
> +        kvm_rate_limit_on_bus_lock();
> +    }
>  
>      /* We need to protect the apic state against concurrent accesses from
>       * different threads in case the userspace irqchip is used. */
> @@ -4594,6 +4632,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>          ioapic_eoi_broadcast(run->eoi.vector);
>          ret = 0;
>          break;
> +    case KVM_EXIT_X86_BUS_LOCK:
> +        /* already handled in kvm_arch_post_run */
> +        ret = 0;
> +        break;
>      default:
>          fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>          ret = -1;
> -- 
> 2.17.1
> 

-- 
Eduardo


