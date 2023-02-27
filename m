Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA56A4300
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdfd-0007PL-2m; Mon, 27 Feb 2023 08:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdfa-0007L0-Fv
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:35:58 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWdfX-00005d-5a
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677504955; x=1709040955;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fOGnqKrczo7fmnmtxjZOfxvh9nut4tew30f5W6bLKk4=;
 b=WE8+Q3m0Kr82IGFDV1Uf6m3nlyUd5VD49bpZ8TFSGbsjCceb0Y2ZQxzx
 iRrz8g1KXl5jqZsus796VB7/4sIwSF8YihVej9+JXDQ+zFska9gCSZ8Mj
 ODvJ2CZKMDoOu/JJ4KqsbhdI12g9cJMfwPPdXTcFekE+UKjWjSHESweXo
 v1Wu703pYaI1R4steDEuDXiaJ9nqezeQaETuv43NYRVe4yLd6Q7Xt4VRc
 M/Kcy1/vREyLk5jMKUn/r60/UFPU+4b+WmmI/tO5zUcklsr2zMoLV8QbY
 jv1CtIys0Noj30Se6+XUQGet/M/BbzGJvC00jfcTCmm8QICkFERvQpuXg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="314283464"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="314283464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:35:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="762735161"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; d="scan'208";a="762735161"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.190])
 ([10.255.28.190])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:35:49 -0800
Message-ID: <d34d6406-4684-40f7-d00b-5b79a201eb4c@intel.com>
Date: Mon, 27 Feb 2023 21:35:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 3/4] target/i386: KVM: allow fast string operations if
 host supports them
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
 <20230227101332.636203-4-pbonzini@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230227101332.636203-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 2/27/2023 6:13 PM, Paolo Bonzini wrote:
> These are just a flag that documents the performance characteristic of
> an instruction; it needs no hypervisor support.  So include them even
> if KVM does not show them.  In particular, FZRM/FSRS/FSRC have only
> been added very recently, but they are available on Sapphire Rapids
> processors.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 587030199192..fe66a4953d41 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -352,7 +352,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>   {
>       struct kvm_cpuid2 *cpuid;
>       uint32_t ret = 0;
> -    uint32_t cpuid_1_edx;
> +    uint32_t cpuid_1_edx, unused;
>       uint64_t bitmask;
>   
>       cpuid = get_supported_cpuid(s);
> @@ -399,10 +399,20 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>       } else if (function == 6 && reg == R_EAX) {
>           ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
>       } else if (function == 7 && index == 0 && reg == R_EBX) {
> +        /* Not new instructions, just an optimization.  */
> +        uint32_t ebx;
> +        host_cpuid(1, 0, &unused, &ebx, &unused, &unused);
                       ^

It should be leaf 7, not 1.

> +        ret |= ebx & CPUID_7_0_EBX_ERMS;
> +
>           if (host_tsx_broken()) {
>               ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>           }
>       } else if (function == 7 && index == 0 && reg == R_EDX) {
> +        /* Not new instructions, just an optimization.  */
> +        uint32_t edx;
> +        host_cpuid(1, 0, &unused, &unused, &unused, &edx);

Ditto.

> +        ret |= edx & CPUID_7_0_EDX_FSRM;
> +
>           /*
>            * Linux v4.17-v4.20 incorrectly return ARCH_CAPABILITIES on SVM hosts.
>            * We can detect the bug by checking if MSR_IA32_ARCH_CAPABILITIES is
> @@ -411,6 +421,11 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>           if (!has_msr_arch_capabs) {
>               ret &= ~CPUID_7_0_EDX_ARCH_CAPABILITIES;
>           }
> +    } else if (function == 7 && index == 1 && reg == R_EAX) {
> +        /* Not new instructions, just an optimization.  */
> +        uint32_t eax;
> +        host_cpuid(1, 0, &eax, &unused, &unused, &unused);

Ditto.

After them fixed,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> +        ret |= eax & (CPUID_7_1_EAX_FZRM | CPUID_7_1_EAX_FSRS | CPUID_7_1_EAX_FSRC);
>       } else if (function == 0xd && index == 0 &&
>                  (reg == R_EAX || reg == R_EDX)) {
>           /*


