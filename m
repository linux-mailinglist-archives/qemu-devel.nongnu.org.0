Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ECF2DDB79
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:35:32 +0100 (CET)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq1rv-0001MM-8b
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq1qV-0000uA-C1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:34:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:48404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq1qT-0004m7-Hp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:34:03 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1282EAC79;
 Thu, 17 Dec 2020 22:34:00 +0000 (UTC)
Subject: Re: [PULL 07/17] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
 <20201217184620.3945917-8-ehabkost@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <e3168f16-b338-d758-34f6-ee5bff41e918@suse.de>
Date: Thu, 17 Dec 2020 23:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201217184620.3945917-8-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

On 12/17/20 7:46 PM, Eduardo Habkost wrote:
> From: Vitaly Kuznetsov <vkuznets@redhat.com>
> 
> As a preparation to expanding Hyper-V CPU features early, move
> hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
> x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
> itself.

this seems to fit very well the ongoing work on separating accelerator specific realize functions;

related to the previous discussions about the class hierarchies,
do you think that we should have a separate class in target/i386/kvm/ for a hyperv variant of the kvm-cpu.c?

Should it be a separate class or a subclass of "kvm-accel-x86_64-cpu" ?

Thanks,

Claudio


> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> Message-Id: <20201119103221.1665171-2-vkuznets@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  target/i386/cpu.h     |  3 ++-
>  target/i386/cpu.c     | 23 ++++++++++++++++++++++-
>  target/i386/kvm/kvm.c | 25 ++++++++++---------------
>  3 files changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 343e51baab..ad9ef559fc 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1659,11 +1659,12 @@ struct X86CPU {
>      uint64_t ucode_rev;
>  
>      uint32_t hyperv_spinlock_attempts;
> -    char *hyperv_vendor_id;
> +    char *hyperv_vendor;
>      bool hyperv_synic_kvm_only;
>      uint64_t hyperv_features;
>      bool hyperv_passthrough;
>      OnOffAuto hyperv_no_nonarch_cs;
> +    uint32_t hyperv_vendor_id[3];
>  
>      bool check_cpuid;
>      bool enforce_cpuid;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 77f0e44df8..599526406a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6544,6 +6544,25 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  }
>  
> +static void x86_cpu_hyperv_realize(X86CPU *cpu)
> +{
> +    size_t len;
> +
> +    /* Hyper-V vendor id */
> +    if (!cpu->hyperv_vendor) {
> +        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
> +    } else {
> +        len = strlen(cpu->hyperv_vendor);
> +
> +        if (len > 12) {
> +            warn_report("hv-vendor-id truncated to 12 characters");
> +            len = 12;
> +        }
> +        memset(cpu->hyperv_vendor_id, 0, 12);
> +        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
> +    }
> +}
> +
>  static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -6715,6 +6734,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>          env->cache_info_amd.l3_cache = &legacy_l3_cache;
>      }
>  
> +    /* Process Hyper-V enlightenments */
> +    x86_cpu_hyperv_realize(cpu);
>  
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> @@ -7218,7 +7239,7 @@ static Property x86_cpu_properties[] = {
>      DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
>      DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
>      DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
> -    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor_id),
> +    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
>      DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
>      DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
>      DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index bcfa4b03e0..6a5d91e39f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1208,6 +1208,13 @@ static int hyperv_handle_properties(CPUState *cs,
>          memcpy(cpuid_ent, &cpuid->entries[0],
>                 cpuid->nent * sizeof(cpuid->entries[0]));
>  
> +        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
> +        if (c) {
> +            cpu->hyperv_vendor_id[0] = c->ebx;
> +            cpu->hyperv_vendor_id[1] = c->ecx;
> +            cpu->hyperv_vendor_id[2] = c->edx;
> +        }
> +
>          c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
>          if (c) {
>              env->features[FEAT_HYPERV_EAX] = c->eax;
> @@ -1282,23 +1289,11 @@ static int hyperv_handle_properties(CPUState *cs,
>  
>      c = &cpuid_ent[cpuid_i++];
>      c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
> -    if (!cpu->hyperv_vendor_id) {
> -        memcpy(signature, "Microsoft Hv", 12);
> -    } else {
> -        size_t len = strlen(cpu->hyperv_vendor_id);
> -
> -        if (len > 12) {
> -            error_report("hv-vendor-id truncated to 12 characters");
> -            len = 12;
> -        }
> -        memset(signature, 0, 12);
> -        memcpy(signature, cpu->hyperv_vendor_id, len);
> -    }
>      c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
>          HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
> -    c->ebx = signature[0];
> -    c->ecx = signature[1];
> -    c->edx = signature[2];
> +    c->ebx = cpu->hyperv_vendor_id[0];
> +    c->ecx = cpu->hyperv_vendor_id[1];
> +    c->edx = cpu->hyperv_vendor_id[2];
>  
>      c = &cpuid_ent[cpuid_i++];
>      c->function = HV_CPUID_INTERFACE;
> 


