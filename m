Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECF1369C00
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:22:26 +0200 (CEST)
Received: from localhost ([::1]:36598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3Fp-0007FO-Ti
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1la3Dv-0006bE-Jk
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1la3Do-0006jI-2S
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619212818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oaGtt8dwEy9SFzJuS44NnGjgnu3SGpXWEtCDmo7rG94=;
 b=AbeT2Aiy9iKnlGN88kNwl6wfLiArxPHtBSuulH5IWnL7XSUndZZFNfTjCg5WGOhABwdfw3
 mtdWM9V+Ftx8j4DEKa0oFOQJVkagyGFbUob5+aobBRNP/51I57T7gy+HPxtsMW0jjuUE37
 dUV7xKfwYMSQVWF6EsPmTNJGVoVswhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-JMb6MUDNPSSFJUX9Q60RmQ-1; Fri, 23 Apr 2021 17:20:16 -0400
X-MC-Unique: JMb6MUDNPSSFJUX9Q60RmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C77036D249;
 Fri, 23 Apr 2021 21:20:15 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB2860854;
 Fri, 23 Apr 2021 21:20:15 +0000 (UTC)
Date: Fri, 23 Apr 2021 17:20:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Like Xu <like.xu@linux.intel.com>
Subject: Re: [PATCH RESEND 1/2] target/i386: add "-cpu, lbr-fmt=*" support to
 enable guest LBR
Message-ID: <20210423212014.lfcskxdfmuhtdt5a@habkost.net>
References: <20210423022037.24733-1-like.xu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20210423022037.24733-1-like.xu@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, wei.w.wang@intel.com,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Sorry for missing the previous submission of this series, and
thanks for resubmitting.

On Fri, Apr 23, 2021 at 10:20:36AM +0800, Like Xu wrote:
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
>   or use the QEMU option "-cpu host,migratable=no".
> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  target/i386/cpu.c     | 16 ++++++++++++++++
>  target/i386/cpu.h     | 10 ++++++++++
>  target/i386/kvm/kvm.c |  5 +++--
>  3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7..eee6da3ad8 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6627,6 +6627,13 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>              x86_cpu_get_supported_feature_word(w, false);
>          uint64_t requested_features = env->features[w];
>          uint64_t unavailable_features = requested_features & ~host_feat;
> +        if (kvm_enabled() && w == FEAT_PERF_CAPABILITIES &&

If this block of code should run only once, why is this inside
the loop in the first place?

I suggest following the same pattern used for intel-pt flags and
moving it outside the loop.

> +            (requested_features & PERF_CAP_LBR_FMT)) {

What exactly is supposed to happen if the VCPU is configured with
LBR_FMT=0 and the host has LBR_FMT != 0 ?

If it shouldn't be an error, then the new kvm_exact_match_flags
field added in patch 2/2 becomes hard to reuse, and easy to
misuse (there's no code documentation indicating that a mismatch
is allowed if the requested bits are all zero).  In that case,
maybe patch 2/2 could be dropped by now.

If it should be an error, this patch and 2/2 don't seem correct.
If correcting that, I also suggest reversing the patch order in
the series, so this whole block of code doesn't even need to be
added in the first place.


> +            if ((host_feat & PERF_CAP_LBR_FMT) !=
> +                (requested_features & PERF_CAP_LBR_FMT)) {
> +                unavailable_features |= PERF_CAP_LBR_FMT;
> +            }
> +        }
>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>      }
>  
> @@ -6734,6 +6741,14 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +    if (cpu->lbr_fmt) {
> +        if (!cpu->enable_pmu) {
> +            error_setg(errp, "LBR is unsupported since guest PMU is disabled.");
> +            return;
> +        }
> +        env->features[FEAT_PERF_CAPABILITIES] |= cpu->lbr_fmt;
> +    }
> +
>      /* mwait extended info: needed for Core compatibility */
>      /* We always wake on interrupt even if host does not have the capability */
>      cpu->mwait.ecx |= CPUID_MWAIT_EMX | CPUID_MWAIT_IBE;
> @@ -7300,6 +7315,7 @@ static Property x86_cpu_properties[] = {
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
> index 7fe9f52710..4d842d32a6 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2732,8 +2732,9 @@ static void kvm_msr_entry_add_perf(X86CPU *cpu, FeatureWordArray f)
>                                             MSR_IA32_PERF_CAPABILITIES);
>  
>      if (kvm_perf_cap) {
> -        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES,
> -                        kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]);
> +        kvm_perf_cap = cpu->migratable ?
> +            (kvm_perf_cap & f[FEAT_PERF_CAPABILITIES]) : kvm_perf_cap;
> +        kvm_msr_entry_add(cpu, MSR_IA32_PERF_CAPABILITIES, kvm_perf_cap);
>      }
>  }
>  
> -- 
> 2.30.2
> 
> 

-- 
Eduardo


