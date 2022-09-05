Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED305AC885
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 03:29:21 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV0vP-0001l0-Mi
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 21:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1oV0tg-0000NE-1u
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 21:27:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:62436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guang.zeng@intel.com>)
 id 1oV0td-0003ft-Hp
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 21:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662341249; x=1693877249;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PArFqMpsc31CVfxEJKJglsosV2yx3vAzp7IDKqJSsnE=;
 b=EvVQjB/HeYm1Syq1rM5EAGPmxacj9Xo9pG1IDUiXsKqNMVcm6q4yH2DS
 z0buYwh3bo72YR30uR4sPU3VvgwUu2FNp8nLRh+EDoaMEoHMGsybOZbGR
 4yjiEhYyE4hm/0Wuzjb6RHnX1cMd2JgvuWpB8jrMf/7PffS18xwnYf/7D
 EYM7FfGfAtHWJ2pvBGXMf7bxGU0cblhS8sCrr+7ULh/X/FqepVjXBUZzv
 EbkQFL/DVS5lz9OEnsejlDXNx7M3kyRMC64Yp7muH39B9uF7EdkhFfW9N
 LB3NzkIWGxseaxINnjOUWh2EZdmyvRnIm5FUIkVMhSug/WGtsSXR2Uo9B g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="296288518"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="296288518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 18:27:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; d="scan'208";a="675077315"
Received: from zengguan-mobl1.ccr.corp.intel.com (HELO [10.238.0.184])
 ([10.238.0.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2022 18:27:20 -0700
Message-ID: <2c9d8124-c8f5-5f21-74c5-307e16544143@intel.com>
Date: Mon, 5 Sep 2022 09:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] target/i386: Set maximum APIC ID to KVM prior to vCPU
 creation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Gao, Chao" <chao.gao@intel.com>
References: <20220825025246.26618-1-guang.zeng@intel.com>
From: Zeng Guang <guang.zeng@intel.com>
In-Reply-To: <20220825025246.26618-1-guang.zeng@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=192.55.52.115;
 envelope-from=guang.zeng@intel.com; helo=mga14.intel.com
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly PING!

On 8/25/2022 10:52 AM, Zeng Guang wrote:
> Specify maximum possible APIC ID assigned for current VM session to KVM
> prior to the creation of vCPUs. By this setting, KVM can set up VM-scoped
> data structure indexed by the APIC ID, e.g. Posted-Interrupt Descriptor
> pointer table to support Intel IPI virtualization, with the most optimal
> memory footprint.
>
> It can be achieved by calling KVM_ENABLE_CAP for KVM_CAP_MAX_VCPU_ID
> capability once KVM has enabled it. Ignoring the return error if KVM
> doesn't support this capability yet.
>
> Signed-off-by: Zeng Guang <guang.zeng@intel.com>
> ---
>   hw/i386/x86.c              | 4 ++++
>   target/i386/kvm/kvm-stub.c | 5 +++++
>   target/i386/kvm/kvm.c      | 5 +++++
>   target/i386/kvm/kvm_i386.h | 1 +
>   4 files changed, 15 insertions(+)
>
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..4831193c86 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -139,6 +139,10 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
>           exit(EXIT_FAILURE);
>       }
>   
> +    if (kvm_enabled()) {
> +        kvm_set_max_apic_id(x86ms->apic_id_limit);
> +    }
> +
>       possible_cpus = mc->possible_cpu_arch_ids(ms);
>       for (i = 0; i < ms->smp.cpus; i++) {
>           x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
> diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
> index f6e7e4466e..e052f1c7b0 100644
> --- a/target/i386/kvm/kvm-stub.c
> +++ b/target/i386/kvm/kvm-stub.c
> @@ -44,3 +44,8 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>   {
>       abort();
>   }
> +
> +void kvm_set_max_apic_id(uint32_t max_apic_id)
> +{
> +    return;
> +}
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f148a6d52f..af4ef1e8f0 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -5428,3 +5428,8 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
>           mask &= ~BIT_ULL(bit);
>       }
>   }
> +
> +void kvm_set_max_apic_id(uint32_t max_apic_id)
> +{
> +    kvm_vm_enable_cap(kvm_state, KVM_CAP_MAX_VCPU_ID, 0, max_apic_id);
> +}
> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> index 4124912c20..c133b32a58 100644
> --- a/target/i386/kvm/kvm_i386.h
> +++ b/target/i386/kvm/kvm_i386.h
> @@ -54,4 +54,5 @@ uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
>   bool kvm_enable_sgx_provisioning(KVMState *s);
>   void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask);
>   
> +void kvm_set_max_apic_id(uint32_t max_apic_id);
>   #endif

