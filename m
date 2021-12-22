Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DEB47CF65
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 10:37:20 +0100 (CET)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzy3i-0004Az-9s
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 04:37:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mzy1o-0002wc-87
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:35:21 -0500
Received: from mga17.intel.com ([192.55.52.151]:54626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mzy1l-00043d-4e
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640165717; x=1671701717;
 h=message-id:date:mime-version:subject:to:references:from:
 cc:in-reply-to:content-transfer-encoding;
 bh=sVzPkXMbPQhPEFkR7oj7KRY0uPlCJavEn7MnFGGQMEw=;
 b=FWhIpO5mVqxrCbwZqVW+yHyLbVCfb28ScHTOwLZnhYWd18Ijulc/dA8T
 fIVyzyUKL1I965UF6Mi7RkxpV0qse+G/osmgoEtkHMFmQtWqLxDPkc1nE
 QPNqANSs8/HLJ2A1PIWS3fK2m1Yc+6z+P46KdcCPrTrWrlGGi2wYOUqZg
 fSXypq58UzDbR1DDuTnv3+QRVK1uteQG1POXcliSGbBGxtD2UTucaXAUm
 Ftlumd97DuojsBNxMQeOuJ3Hd3HOtR9f7csuTlnyV4VqQugV1hxQmLIoR
 gpLJfIfBePnEntDlPEOpR/WP1hcHTbHi2WcdUn0ZtfxjXSvixDc4Fy6Oa Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221262433"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="221262433"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 01:35:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="521612190"
Received: from cqiang-mobl.ccr.corp.intel.com (HELO [10.238.2.71])
 ([10.238.2.71])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 01:35:12 -0800
Message-ID: <084da7c6-cf0a-8d0c-1121-5c85187942a6@intel.com>
Date: Wed, 22 Dec 2021 17:35:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [PULL 31/53] KVM: x86: believe what KVM says about WAITPKG
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
References: <20200706164155.24696-1-pbonzini@redhat.com>
 <20200706164155.24696-32-pbonzini@redhat.com>
From: Chenyi Qiang <chenyi.qiang@intel.com>
In-Reply-To: <20200706164155.24696-32-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=chenyi.qiang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.694, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/7/2020 12:41 AM, Paolo Bonzini wrote:
> Currently, QEMU is overriding KVM_GET_SUPPORTED_CPUID's answer for
> the WAITPKG bit depending on the "-overcommit cpu-pm" setting.  This is a
> bad idea because it does not even check if the host supports it, but it
> can be done in x86_cpu_realizefn just like we do for the MONITOR bit.
> 
> This patch moves it there, while making it conditional on host
> support for the related UMWAIT MSR.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/cpu.c      |  3 +++
>   target/i386/kvm.c      | 11 +++++------
>   target/i386/kvm_i386.h |  1 +
>   3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index c44cc510e1..dc9ba06f1f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6536,6 +6536,9 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>               host_cpuid(5, 0, &cpu->mwait.eax, &cpu->mwait.ebx,
>                          &cpu->mwait.ecx, &cpu->mwait.edx);
>               env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
> +            if (kvm_enabled() && kvm_has_waitpkg()) {
> +                env->features[FEAT_7_0_ECX] |= CPUID_7_0_ECX_WAITPKG;
> +            }

Hi Paolo and Maxim,

Sorry to find out this long-time-ago mail although the code has been 
refactor nowadays. Recently, when testing WAITPKG exposure, I found 
WAITPKG is no longer controlled by "-overcommit cpu-pm", i.e. if 
!enable_cpu_pm && KVM cap reports WAITPKG (KVM set the cap in 
vmx_set_cpu_caps), this feature can still be seen in guest. It is 
obviously due to QEMU doesn't clear CPUID_7_0_ECX_WAITPKG explicitly if 
!enable_cpu_pm.

So, is this the expected behavior for this patch?

Thanks
Chenyi

>           }
>           if (kvm_enabled() && cpu->ucode_rev == 0) {
>               cpu->ucode_rev = kvm_arch_get_supported_msr_feature(kvm_state,
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 2b6b7443d2..b8455c89ed 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -411,12 +411,6 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>           if (host_tsx_blacklisted()) {
>               ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>           }
> -    } else if (function == 7 && index == 0 && reg == R_ECX) {
> -        if (enable_cpu_pm) {
> -            ret |= CPUID_7_0_ECX_WAITPKG;
> -        } else {
> -            ret &= ~CPUID_7_0_ECX_WAITPKG;
> -        }
>       } else if (function == 7 && index == 0 && reg == R_EDX) {
>           /*
>            * Linux v4.17-v4.20 incorrectly return ARCH_CAPABILITIES on SVM hosts.
> @@ -4730,3 +4724,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>   {
>       abort();
>   }
> +
> +bool kvm_has_waitpkg(void)
> +{
> +    return has_msr_umwait;
> +}
> diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
> index 00bde7acaf..064b8798a2 100644
> --- a/target/i386/kvm_i386.h
> +++ b/target/i386/kvm_i386.h
> @@ -44,6 +44,7 @@ void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
> 
>   bool kvm_enable_x2apic(void);
>   bool kvm_has_x2apic_api(void);
> +bool kvm_has_waitpkg(void);
> 
>   bool kvm_hv_vpindex_settable(void);
> 
> --
> 2.26.2
> 
> 
> 

