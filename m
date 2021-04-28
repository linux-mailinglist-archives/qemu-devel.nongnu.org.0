Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652036E0DE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 23:21:16 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbrcR-0002gK-0l
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 17:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbrae-0001pk-3Y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 17:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lbraV-00063Z-L8
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 17:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619644752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CD47q1NDGUUL4Iy68PIht5wYhqjYa9JmVp/QQGnCV9c=;
 b=Noeen+V08TK4afUejP6lTEAHQWHZHuZjeqnp1uIVWeMCyPxdQRYa7G2vXbElEneserevMh
 Nx1M17dzSIg1Er9fCZXpKG5/Fb91lNYJF8L3hzsc6d6KNFWw5elXan0E4hekTr/tLH4s4+
 gw7cnkRebLyS5gkMsn/hpzJgv4CYEwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-5BDQrq2_O32gvCDxQhqTyg-1; Wed, 28 Apr 2021 17:19:10 -0400
X-MC-Unique: 5BDQrq2_O32gvCDxQhqTyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAEC4107ACCA;
 Wed, 28 Apr 2021 21:19:08 +0000 (UTC)
Received: from localhost (unknown [10.22.9.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F86861008;
 Wed, 28 Apr 2021 21:19:08 +0000 (UTC)
Date: Wed, 28 Apr 2021 17:19:08 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Subject: Re: [PATCH v2] target/i386: add "-cpu, lbr-fmt=*" support to enable
 guest LBR
Message-ID: <20210428211908.ysogzmzh2ulpajgq@habkost.net>
References: <20210427080948.439432-1-like.xu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210427080948.439432-1-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, wei.w.wang@intel.com,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 04:09:48PM +0800, Like Xu wrote:
> The last branch recording (LBR) is a performance monitor unit (PMU)
> feature on Intel processors that records a running trace of the most
> recent branches taken by the processor in the LBR stack. The QEMU
> could configure whether it's enabled or not for each guest via CLI.
> 
> The LBR feature would be enabled on the guest if:
> - the KVM is enabled and the PMU is enabled and,
> - the msr-based-feature IA32_PERF_CAPABILITIES is supporterd on KVM and,
> - the supported returned value for lbr_fmt from this msr is not zero and,
> - the requested guest vcpu model does support FEAT_1_ECX.CPUID_EXT_PDCM,
> - the configured lbr-fmt value is the same as the host lbr_fmt value
>   OR use the QEMU option "-cpu host,migratable=no".

I don't understand why "migratable" matters here.  "migratable"
is just a convenience property to get better defaults when using
"-cpu host".  I don't know why it would change the lbr-fmt
validation rules.

> 
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---

A changelog explaining what you changed since v1 would have been
useful here.

>  target/i386/cpu.c     | 34 ++++++++++++++++++++++++++++++++++
>  target/i386/cpu.h     | 10 ++++++++++
>  target/i386/kvm/kvm.c | 10 ++++++++--
>  3 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7..9c8e54aa6f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6623,6 +6623,10 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  
>      for (w = 0; w < FEATURE_WORDS; w++) {
> +        if (w == FEAT_PERF_CAPABILITIES) {
> +            continue;
> +        }
> +

Why exactly is this necessary?  I expected to be completely OK to
call mark_unavailable_features() multiple times for the same
FeatureWord.

If there's a reason why this is necessary, I suggest adding a
comment explaining why.

>          uint64_t host_feat =
>              x86_cpu_get_supported_feature_word(w, false);
>          uint64_t requested_features = env->features[w];
> @@ -6630,6 +6634,27 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
>  
> +    uint64_t host_perf_cap =
> +        x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
> +    if (!cpu->lbr_fmt && !cpu->migratable) {
> +        cpu->lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;

"migratable=no" is not a request to override explicit user
settings.  This is why we have the ~env->user_features masking
inside x86_cpu_expand_features() when initializing
env->features[].

In either case, I don't understand why you need the lines above.
"migratable=no" should already trigger the x86_cpu_get_supported_feature_word()
loop inside x86_cpu_expand_features(), and it should initialize
env->features[FEAT_PERF_CAPABILITIES] with the host value.  Isn't
that code working for you?


> +        if (cpu->lbr_fmt) {
> +            info_report("vPMU: The value of lbr-fmt has been adjusted "
> +                        "to 0x%lx and guest LBR is enabled.",
> +                        host_perf_cap & PERF_CAP_LBR_FMT);


From your other message:

(I'm assuming your examples are for a lbr-fmt=5 host)

> "-cpu host,migratable=no" --> "Enable guest LBR and show warning"

Enabling guest LBR in this case is 100% OK, isn't it?  I don't
think you need to show a warning.


> "-cpu host,migratable=no,lbr-fmt=0" --> "Enable guest LBR and show warning"

Why?  In this case, we should do what the user asked for whenever
possible, and the user is explicitly asking lbr-fmt to be 0.

> "-cpu host,migratable=no,lbr-fmt=5" --> "Enable guest LBR"

Looks OK.

> "-cpu host,migratable=no,lbr-fmt=6" --> "Disable guest LBR and show warning"

Makes sense to me[1].


> +        }
> +    } else {
> +        uint64_t requested_lbr_fmt = cpu->lbr_fmt & PERF_CAP_LBR_FMT;
> +        if (requested_lbr_fmt && kvm_enabled()) {


From your other message:

> "-cpu host,lbr-fmt=0" --> "Disable guest LBR"

Makes sense to me.  I understand this as a confirmation that it's
OK to have a guest/host mismatch if guest LBR=0.

> "-cpu host,lbr-fmt=5" --> "Enable guest LBR"

Makes sense to me.

> "-cpu host,lbr-fmt=6" --> "Disable guest LBR and show warning"

Makes sense to me[1].


[1] As long as "show warning" becomes "fatal error" if enforce=1.
    mark_unavailable_features() should make sure this happens.

    Or maybe we should make this an error?  It would be even
    better.  The example code below makes it an error.


> +            if (requested_lbr_fmt != (host_perf_cap & PERF_CAP_LBR_FMT)) {
> +                cpu->lbr_fmt = 0;
> +                warn_report("vPMU: The supported lbr-fmt value on the host "
> +                            "is 0x%lx and guest LBR is disabled.",
> +                            host_perf_cap & PERF_CAP_LBR_FMT);
> +            }
> +        }
> +    }
> +
>      if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
>          kvm_enabled()) {
>          KVMState *s = CPU(cpu)->kvm_state;
> @@ -6734,6 +6759,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +    if (cpu->lbr_fmt) {
> +        if (!cpu->enable_pmu) {
> +            error_setg(errp, "LBR is unsupported since guest PMU is disabled.");
> +            return;
> +        }
> +        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;

This doesn't seem right, as we should still do what the user
asked for if "lbr-fmt=0" is used.

You need to differentiate "lbr-fmt=0" from "lbr-fmt not set"
somehow.  I suggest initializing lbr_fmt to 0xFF by default,
so you can override env->features[FEAT_PERF_CAPABILITIES]
when lbr_fmt != 0xFF (even if lbr_fmt=0).

Something like this:

  #define LBR_FMT_UNSET 0xff
  ...
  DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, LBR_FMT_UNSET)
  ...

  void x86_cpu_realizefn(...)
  {
      ...
      if (cpu->lbr_fmt != LBR_FMT_UNSET) {
          if ((cpu->lbr_fmt & LBR_FMT_FMT) != cpu->lbr_fmt) {
              error_setg(errp, "invalid lbr-fmt" ...);
              return;
          }
          env->features[FEAT_PERF_CAPABILITIES] &= ~PERF_CAP_LBR_FMT;
          env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
      }
      /* If lbr_fmt == LBR_FMT_UNSET, the default value of env->features[]
       * will be used as is (and it may depend on the "migratable" flag)
       */
      ...
      /*
       * We can always validate env->features[FEAT_PERF_CAPABILITIES],
       * no matter how it was initialized:
       */
      uint64_t requested_lbr_fmt =
          env->features[FEAT_PERF_CAPABILITIES] & PERF_CAP_LBR_FMT;
      if (requested_lbr_fmt && kvm_enabled()) {
          /* Maybe this code will work out of the box for all
           * accelerators, but checking kvm_enabled() is safer.
           */
          uint64_t host_perf_cap =
              x86_cpu_get_supported_feature_word(FEAT_PERF_CAPABILITIES, false);
          uint64_t host_lbr_fmt = host_perf_cap & PERF_CAP_LBR_FMT;
          if (!cpu->enable_pmu) {
              error_setg(errp, "LBR is unsupported without pmu=on");
              return;
          }
          if (requested_lbr_fmt != host_lbr_fmt)) {
              /* An error is better than a warning */
              error_setg(errp, "lbr-fmt mismatch" ...);
              /* probably a good idea to include requested_lbr_fmt
               * and host_lbr_fmt in the error message */
              return;
          }
      }
      ...
  }



> +    }
> +
>      /* mwait extended info: needed for Core compatibility */
>      /* We always wake on interrupt even if host does not have the capability */
>      cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
> @@ -7300,6 +7333,7 @@ static Property x86_cpu_properties[] = {
>  #endif
>      DEFINE_PROP_INT32("node-id", X86CPU, node_id, CPU_UNSET_NUMA_NODE_ID),
>      DEFINE_PROP_BOOL("pmu", X86CPU, enable_pmu, false),
> +    DEFINE_PROP_UINT8("lbr-fmt", X86CPU, lbr_fmt, 0),
>  
>      DEFINE_PROP_UINT32("hv-spinlocks", X86CPU, hyperv_spinlock_attempts,
>                         HYPERV_SPINLOCK_NEVER_NOTIFY),
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878..b12c879fc4 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -354,6 +354,7 @@ typedef enum X86Seg {
>  #define ARCH_CAP_TSX_CTRL_MSR		(1<<7)
>  
>  #define MSR_IA32_PERF_CAPABILITIES      0x345
> +#define PERF_CAP_LBR_FMT      0x3f
>  
>  #define MSR_IA32_TSX_CTRL		0x122
>  #define MSR_IA32_TSCDEADLINE            0x6e0
> @@ -1726,6 +1727,15 @@ struct X86CPU {
>       */
>      bool enable_pmu;
>  
> +    /*
> +     * Configure LBR_FMT bits on IA32_PERF_CAPABILITIES MSR.
> +     * This can't be enabled by default yet because it doesn't have
> +     * ABI stability guarantees, as it is only allowed to pass all
> +     * LBR_FMT bits returned by kvm_arch_get_supported_msr_feature()
> +     * (that depends on host CPU and kernel capabilities) to the guest.
> +     */
> +    uint8_t lbr_fmt;
> +
>      /* LMCE support can be enabled/disabled via cpu option 'lmce=on/off'. It is
>       * disabled by default to avoid breaking migration between QEMU with
>       * different LMCE configurations.
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 7fe9f52710..aa926984ae 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2732,8 +2732,14 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
>                                             MSR_IA32_PERF_CAPABILITIES);
>  
>      if (kvm_perf_cap) {
> -        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES,
> -                        kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]);
> +        kvm_perf_cap = (cpu->migratable) ?
> +            (kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]) : kvm_perf_cap;

I don't understand why you are checking cpu->migratable here.
The CPU code should ensure f[FEAT_PERF_CAPABILITIES] is
initialized correctly before calling kvm_arch_init_vcpu().

> +
> +        if (!cpu->lbr_fmt) {
> +            kvm_perf_cap &= ~PERF_CAP_LBR_FMT;
> +        }

Likewise: this should be done by the CPU initialization code
before kvm_arch_init_vcpu() gets called.

The existing code looks weird here: what's the purpose of the
kvm_arch_get_supported_msr_feature() call in this function?

env->features[] is supposed to reflect what the guest actually
sees.  x86_cpu_realizefn()/x86_cpu_filter_features() is supposed
to ensure that before calling kvm_arch_init_vcpu().  If there's a
mismatch between env->features and what the guest sees, we have a
problem.

If you want to be 100% sure, maybe you can add an assert() here.
But if the function is receiving invalid input it's too late to
fix the value.

> +
> +        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES, kvm_perf_cap);
>      }
>  }
>  
> -- 
> 2.30.2
> 

-- 
Eduardo


