Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8E4B32EF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 05:02:39 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIjcM-0005kz-Dt
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 23:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nIjYY-0003QJ-7j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 22:58:42 -0500
Received: from mga12.intel.com ([192.55.52.136]:46090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1nIjYT-0002I2-QM
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 22:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644638317; x=1676174317;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8AMkPA76jgjgLTkk0aSGPMrwkwEgtqU7v2fHwOrjDzo=;
 b=jLeJAx+fyKfEDvAhIU+Akpc35XCOU4Ou60PCb4NZiCIdq279NHhXtAxk
 72xz/UO1J8PSHRFtafnKDoQWghnGeHM+kUuu6UiIbMc6PKMoAZJMcCNTA
 6nsMOjtb0qqSyiv392Ttf4RAN4R0Ke+gZ6fAfYPZ/KpNTkigBd9w8ebc2
 +3n45fo4min4mipQx+NRIuY8ToH9+QBI1xkWPGKzTHAsR+9t1C3mHCjwU
 LbFIsuYodZGHFA3k2EAK+Jz+oBxUDOYqCyGEFNtf4GXxsOiNAEx4ynF6t
 M7RtFNjG/tKG6SNP2zgaiSA13ht8WdvmAcBhCI9FnsKBQ69bszThy6rf6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="229814893"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="229814893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 19:58:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="542344356"
Received: from yangweij-mobl.ccr.corp.intel.com (HELO [10.249.168.248])
 ([10.249.168.248])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 19:58:30 -0800
Message-ID: <a034b518-7b04-d85d-ea45-d5eeaec95354@intel.com>
Date: Sat, 12 Feb 2022 11:58:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] target/i386: Add kvm_get_one_msr helper
Content-Language: en-US
To: pbonzini@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org
References: <20220129230719.111339-1-weijiang.yang@intel.com>
From: "Yang, Weijiang" <weijiang.yang@intel.com>
In-Reply-To: <20220129230719.111339-1-weijiang.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=weijiang.yang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping...

Does this v2 meet the requirement?

On 1/30/2022 7:07 AM, Yang Weijiang wrote:
> When try to get one msr from KVM, I found there's no such kind of
> existing interface while kvm_put_one_msr() is there. So here comes
> the patch. It'll remove redundant preparation code before finally
> call KVM_GET_MSRS IOCTL.
>
> No functional change intended.
>
> v2:
>   Per Paolo's suggestion, move the helper before uses to eliminate
>   a forward declaration.
>
> base-commit: 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3
>
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>   target/i386/kvm/kvm.c | 48 ++++++++++++++++++++++++-------------------
>   1 file changed, 27 insertions(+), 21 deletions(-)
>
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2c8feb4a6f..627535395a 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -201,32 +201,45 @@ bool kvm_hv_vpindex_settable(void)
>       return hv_vpindex_settable;
>   }
>   
> -static int kvm_get_tsc(CPUState *cs)
> +static int kvm_get_one_msr(X86CPU *cpu, int index, uint64_t *value)
>   {
> -    X86CPU *cpu = X86_CPU(cs);
> -    CPUX86State *env = &cpu->env;
> +    int ret;
>       struct {
>           struct kvm_msrs info;
>           struct kvm_msr_entry entries[1];
> -    } msr_data = {};
> +    } msr_data = {
> +        .info.nmsrs = 1,
> +        .entries[0].index = index,
> +    };
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    assert(ret == 1);
> +    *value = msr_data.entries[0].data;
> +    return ret;
> +}
> +
> +static int kvm_get_tsc(CPUState *cs)
> +{
> +    X86CPU *cpu = X86_CPU(cs);
> +    CPUX86State *env = &cpu->env;
> +    uint64_t value;
>       int ret;
>   
>       if (env->tsc_valid) {
>           return 0;
>       }
>   
> -    memset(&msr_data, 0, sizeof(msr_data));
> -    msr_data.info.nmsrs = 1;
> -    msr_data.entries[0].index = MSR_IA32_TSC;
>       env->tsc_valid = !runstate_is_running();
>   
> -    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_GET_MSRS, &msr_data);
> +    ret = kvm_get_one_msr(cpu, MSR_IA32_TSC, &value);
>       if (ret < 0) {
>           return ret;
>       }
>   
> -    assert(ret == 1);
> -    env->tsc = msr_data.entries[0].data;
> +    env->tsc = value;
>       return 0;
>   }
>   
> @@ -1478,21 +1491,14 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>            * the kernel doesn't support setting vp_index; assert that its value
>            * is in sync
>            */
> -        struct {
> -            struct kvm_msrs info;
> -            struct kvm_msr_entry entries[1];
> -        } msr_data = {
> -            .info.nmsrs = 1,
> -            .entries[0].index = HV_X64_MSR_VP_INDEX,
> -        };
> -
> -        ret = kvm_vcpu_ioctl(cs, KVM_GET_MSRS, &msr_data);
> +        uint64_t value;
> +
> +        ret = kvm_get_one_msr(cpu, HV_X64_MSR_VP_INDEX, &value);
>           if (ret < 0) {
>               return ret;
>           }
> -        assert(ret == 1);
>   
> -        if (msr_data.entries[0].data != hyperv_vp_index(CPU(cpu))) {
> +        if (value != hyperv_vp_index(CPU(cpu))) {
>               error_report("kernel's vp_index != QEMU's vp_index");
>               return -ENXIO;
>           }

