Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66780340BEE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:34:42 +0100 (CET)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwXh-0005Ix-G8
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lMwVn-0004Ht-DR
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1lMwVf-0001bi-TL
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616088752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QTzATGSTUECv9fRkj/YN/+2j1iJxqgkV1SCK/kS1gU=;
 b=Cox0CRv0Ems2lKb6cft2MN9Ul9wMPZSFKw+za0xt8+Qy3IhCIlSfjPRjkhQ9/br7MPZ2Ij
 VRln0ors4YPk9zlwo3sWArFw66DM143/WBb10inZHkvMg3qLBaNzafjIHrKrS0yLVo7Jlc
 yVrWuSSODGbh7qscUt5cSqMkkyuklAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-_8TnpzSZNqqKKitwbtYGWg-1; Thu, 18 Mar 2021 13:32:28 -0400
X-MC-Unique: _8TnpzSZNqqKKitwbtYGWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B98C8801817;
 Thu, 18 Mar 2021 17:32:26 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-2.gru2.redhat.com [10.97.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48FE117DC3;
 Thu, 18 Mar 2021 17:32:26 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
 id E56F140E4C26; Thu, 18 Mar 2021 14:32:00 -0300 (-03)
Date: Thu, 18 Mar 2021 14:32:00 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [RFC PATCH] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210318173200.GA35410@fuller.cnet>
References: <20210317084709.15605-1-chenyi.qiang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210317084709.15605-1-chenyi.qiang@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mtosatti@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mtosatti@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 04:47:09PM +0800, Chenyi Qiang wrote:
> Virtual Machines can exploit bus locks to degrade the performance of
> system. To address this kind of performance DOS attack, bus lock VM exit
> is introduced in KVM and it will report the bus locks detected in guest,
> which can help userspace to enforce throttling policies.

> 
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
> ---
>  hw/i386/x86.c         |  6 ++++++
>  include/hw/i386/x86.h |  7 +++++++
>  target/i386/kvm/kvm.c | 44 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 7865660e2c..a70a259e97 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1209,6 +1209,12 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->acpi = ON_OFF_AUTO_AUTO;
>      x86ms->smp_dies = 1;
>      x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
> +    x86ms->bld = 0;
> +
> +    object_property_add_uint64_ptr(obj, "bus-lock-detection",
> +                                   &x86ms->bld, OBJ_PROP_FLAG_READWRITE);
> +    object_property_set_description(obj, "bus-lock-detection",
> +            "Bus lock detection ratelimit");
>  }
>  
>  static void x86_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 56080bd1fb..1f0ffbcfb9 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -72,6 +72,13 @@ struct X86MachineState {
>       * will be translated to MSI messages in the address space.
>       */
>      AddressSpace *ioapic_as;
> +
> +    /*
> +     * ratelimit enforced on detected bus locks, the default value
> +     * is 0 per second
> +     */
> +    uint64_t bld;
> +    RateLimit bld_limit;
>  };
>  
>  #define X86_MACHINE_SMM              "smm"
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index c8d61daf68..724862137d 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -130,6 +130,8 @@ static bool has_msr_mcg_ext_ctl;
>  static struct kvm_cpuid2 *cpuid_cache;
>  static struct kvm_msr_list *kvm_feature_msrs;
>  
> +#define SLICE_TIME 1000000000ULL /* ns */
> +
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
> +    if (delay_ns) {
> +        g_usleep(delay_ns / SCALE_US);
> +    }
> +}

Hi,

Can't see a use-case where the throttling is very useful: this will
slowdown the application to a halt (if its bus-lock instruction is
being called frequently).

However its very nice to know that it (bus lock) has happened.

So on KVM bus exit do you emulate the instruction or just execute it 
in the guest (without a VM-exit for the second time) ?

(But maybe there are usecases where the throttling makes sense, 
sleep is performed outside global mutex lock, so patch looks good).


