Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E526A54AC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvdE-0008Ku-BA; Tue, 28 Feb 2023 03:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWvd6-0008If-Th
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:46:41 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1pWvd4-0001ec-4w
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677573994; x=1709109994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E2NHBGOSvXpQ97/ZAMQbcNEwzLNkJrUlK5tFnUCz0Ac=;
 b=e6vMGXvyRQ/EuZm2qz1RSAX514nafMqDLc+KlACdjbCTYcFF3lTLr/3L
 Hr8cPz0aVils+dr+7d4FPXD3kWmFstdbElQS/9DM7EhGS8COe60d4pccT
 djayo8xJNai1g7F0DmLP2ZHxLqOZjHbKAV899SVOLWjAPVxFpTJe6OSbZ
 MzxYm53xTBUY/SG3vhllGgVZT8yK36lcbhALW4U7ejFPNv36BfSTgb9Cy
 Uer4M4wgpY91s8sald0UjpofBu6S6lW3JKoaVeXJjud3Sla40cEXBhcEc
 RqhTX5sv5A8l94/sEnrkebrq7DrovkOQjcaxQxtwk92fpmiH78ZqLZYqP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332808123"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="332808123"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 00:46:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738081578"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738081578"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.254.211.20])
 ([10.254.211.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 00:46:15 -0800
Message-ID: <022a4fec-b08e-fa87-4717-e27017fad6c9@intel.com>
Date: Tue, 28 Feb 2023 16:46:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/4] target/i386: Add new CPU model SapphireRapids and
 new fast string op leaves
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: lei4.wang@intel.com, robert.hu@linux.intel.com, chenyi.qiang@intel.com
References: <20230227101332.636203-1-pbonzini@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230227101332.636203-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
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
> Sapphire Rapids enablement patches got stuck on the doubts regarding
> properties for AMX support.  However, for now there is no need to have
> anything but hardcoded values, because all Intel processors with AMX
> currently support exactly the same palettes and TMUL limits.  Intel has
> also promised that palette formats will remain backwards compatible so
> the only worry is for the TMUL leaf, CPUID[1Eh].
> 
> However, providing modifiable properties for AMX is premature.  
> Rather,
> the first step should be to_validate_  host CPUID values against the
> ones supported by QEMU.  

Paolo,

The validation of host CPUID values (kvm supported CPUIDs) against the 
ones supported by QEMU (the hardcoded value) is missing in current QEMU.

As for how to implement the validation, I have two options in mind:

a) special check in x86_cpu_filter_features() just like what did for 
Intel PT:

     if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) &&
         kvm_enabled()) {
         KVMState *s = CPU(cpu)->kvm_state;
         uint32_t eax_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EAX);
         uint32_t ebx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_EBX);
         uint32_t ecx_0 = kvm_arch_get_supported_cpuid(s, 0x14, 0, R_ECX);
         uint32_t eax_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EAX);
         uint32_t ebx_1 = kvm_arch_get_supported_cpuid(s, 0x14, 1, R_EBX);

         if (!eax_0 ||
            ((ebx_0 & INTEL_PT_MINIMAL_EBX) != INTEL_PT_MINIMAL_EBX) ||
            ((ecx_0 & INTEL_PT_MINIMAL_ECX) != INTEL_PT_MINIMAL_ECX) ||
            ((eax_1 & INTEL_PT_MTC_BITMAP) != INTEL_PT_MTC_BITMAP) ||
            ((eax_1 & INTEL_PT_ADDR_RANGES_NUM_MASK) <
                                            INTEL_PT_ADDR_RANGES_NUM) ||
            ((ebx_1 & (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) !=
                 (INTEL_PT_PSB_BITMAP | INTEL_PT_CYCLE_BITMAP)) ||
            ((ecx_0 & CPUID_14_0_ECX_LIP) !=
                 (env->features[FEAT_14_0_ECX] & CPUID_14_0_ECX_LIP))) {
             /*
              * Processor Trace capabilities aren't configurable, so if the
              * host can't emulate the capabilities we report on
              * cpu_x86_cpuid(), intel-pt can't be enabled on the 
current host.
              */
             mark_unavailable_features(cpu, FEAT_7_0_EBX, 
CPUID_7_0_EBX_INTEL_PT, prefix);
         }
     }

This has flaws for leaf 0x1e, since its value might change on future 
production (Intel PT is facing this exact problem that SPR has less PT 
capabilities of CPUID(0x14,1):EBX[15:0] than ICX, and Intel PT cannot be 
enabled for guest on SPR machine). As well, if hardware reports 
different value of leaf 0x1e in the future, QEMU will fail to enable AMX 
for guest.

b) at least introduce FEAT_ for CPUID leaf 0x1E, so that it will be 
checked in x86_cpu_filter_features() automatically and "-cpu max/host" 
can pass through the host's value to guest. The additional work is that 
we might need MultiBitFeature framework introducing in 
https://lore.kernel.org/qemu-devel/20230106083826.5384-1-lei4.wang@intel.com/T/#t

Do you think it worths the effort to go for option b? or just option a 
for now is enough?

> So for now apply the simpler patch that only
> adds the new model.


