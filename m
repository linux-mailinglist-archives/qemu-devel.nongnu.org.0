Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E139AE57
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 00:44:23 +0200 (CEST)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1low4c-0005P2-4b
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 18:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1low3U-0004Ae-V8
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 18:43:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1low3T-0007m7-9n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 18:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622760190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BbjKLqFKY3HRMNH2lX6WZC+N5yxGQfU5Ue8HllWJpDQ=;
 b=BwtQsZj5WtB02H940U6CyW6F+jPtrtXRie3Wp2Zhdil/0Z+f0aU6Q7LBFqeNIC5OJKMsmN
 MRiQpmFtfIe7hkLIOH9ZLFTk2iKFK4Z9BE/fF9JZQx2djv5EVGOZtkdQFU8z79s6qiMl3a
 CJpGnX06YySvhED0+KCn0wtWuiUDQ/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-oCfUUrecP4mZTu2y_Kslkw-1; Thu, 03 Jun 2021 18:43:08 -0400
X-MC-Unique: oCfUUrecP4mZTu2y_Kslkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058B4501E1
 for <qemu-devel@nongnu.org>; Thu,  3 Jun 2021 22:43:08 +0000 (UTC)
Received: from localhost (ovpn-120-94.rdu2.redhat.com [10.10.120.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A88B65D705;
 Thu,  3 Jun 2021 22:43:04 +0000 (UTC)
Date: Thu, 3 Jun 2021 18:43:04 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 5/9] i386: expand Hyper-V features during CPU feature
 expansion time
Message-ID: <20210603224304.ctigvokfqbcsiy7g@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-6-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-6-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:31PM +0200, Vitaly Kuznetsov wrote:
> To make Hyper-V features appear in e.g. QMP query-cpu-model-expansion we
> need to expand and set the corresponding CPUID leaves early. Modify
> x86_cpu_get_supported_feature_word() to call newly intoduced Hyper-V
> specific kvm_hv_get_supported_cpuid() instead of
> kvm_arch_get_supported_cpuid(). We can't use kvm_arch_get_supported_cpuid()
> as Hyper-V specific CPUID leaves intersect with KVM's.
> 
> Note, early expansion will only happen when KVM supports system wide
> KVM_GET_SUPPORTED_HV_CPUID ioctl (KVM_CAP_SYS_HYPERV_CPUID).
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/cpu.c          |  4 ++++
>  target/i386/kvm/kvm-stub.c |  5 +++++
>  target/i386/kvm/kvm.c      | 24 ++++++++++++++++++++----
>  target/i386/kvm/kvm_i386.h |  1 +
>  4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b2d8e5713911..159b7aa8f073 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5990,6 +5990,10 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>      if (env->cpuid_xlevel2 == UINT32_MAX) {
>          env->cpuid_xlevel2 = env->cpuid_min_xlevel2;
>      }
> +
> +    if (kvm_enabled()) {
> +        kvm_hyperv_expand_features(cpu, errp);
> +    }
>  }
>  
>  /*
> diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
> index 92f49121b8fa..f6e7e4466e1a 100644
> --- a/target/i386/kvm/kvm-stub.c
> +++ b/target/i386/kvm/kvm-stub.c
> @@ -39,3 +39,8 @@ bool kvm_hv_vpindex_settable(void)
>  {
>      return false;
>  }
> +
> +bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
> +{
> +    abort();
> +}
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a5f8553af921..650fdd970d6e 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1217,13 +1217,22 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
>   * of 'hv_passthrough' mode and fills the environment with all supported
>   * Hyper-V features.
>   */
> -static bool hyperv_expand_features(CPUState *cs, Error **errp)
> +bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>  {
> -    X86CPU *cpu = X86_CPU(cs);
> +    CPUState *cs = CPU(cpu);
>  
>      if (!hyperv_enabled(cpu))
>          return true;
>  
> +    /*
> +     * When kvm_hyperv_expand_features is called at CPU feature expansion
> +     * time per-CPU kvm_state is not available yet so we can only proceed
> +     * when KVM_CAP_SYS_HYPERV_CPUID is supported.
> +     */
> +    if (!cs->kvm_state &&
> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
> +        return true;
> +
>      if (cpu->hyperv_passthrough) {
>          cpu->hyperv_vendor_id[0] =
>              hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
> @@ -1565,8 +1574,15 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
>  
> -    /* Paravirtualization CPUIDs */
> -    if (!hyperv_expand_features(cs, &local_err)) {
> +    /*
> +     * kvm_hyperv_expand_features() is called here for the second time in case
> +     * KVM_CAP_SYS_HYPERV_CPUID is not supported. While we can't possibly handle
> +     * 'query-cpu-model-expansion' in this case as we don't have a KVM vCPU to
> +     * check which Hyper-V enlightenments are supported and which are not, we
> +     * can still proceed and check/expand Hyper-V enlightenments here so legacy
> +     * behavior is preserved.
> +     */

Issue we might need to solve later: how can management software
differentiate "Hyper-V enlightenments are not supported at all"
from "we can't tell you which Hyper-V enlightenments are
available because KVM_CAP_SYS_HYPERV_CPUID is unavailable"?


> +    if (!kvm_hyperv_expand_features(cpu, &local_err)) {
>          error_report_err(local_err);
>          return -ENOSYS;
>      }
> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> index dc725083891c..54667b35f09c 100644
> --- a/target/i386/kvm/kvm_i386.h
> +++ b/target/i386/kvm/kvm_i386.h
> @@ -47,6 +47,7 @@ bool kvm_has_x2apic_api(void);
>  bool kvm_has_waitpkg(void);
>  
>  bool kvm_hv_vpindex_settable(void);
> +bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
>  
>  uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


