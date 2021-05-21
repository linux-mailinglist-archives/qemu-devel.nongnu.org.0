Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03E38CFC9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 23:22:06 +0200 (CEST)
Received: from localhost ([::1]:49238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkCar-0002mF-Ij
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 17:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkCZK-00025P-OH
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkCZH-0002dK-2u
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621632025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=skdk48aJyf/65+fkWAFyVF904IQGtwuPwwRzyOq7gN4=;
 b=Eg9f3nk36x3j1ogzmJqiBaOqSiMD9EddcYQHeQF/i9pNPYSSf1MFfbuGlVodgo1nsbfU2M
 x5Hc/H76D8IieDRgIVUSU5xOtgu7+UvenFnPjs8nstHXRqtMXXzm4mqgKqwtn0DogbbRJR
 tZnncIf7qIwaVSNOLzOpV0KYj7g+nlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-be7mlAHeOjOx57ovyiwV5A-1; Fri, 21 May 2021 17:20:23 -0400
X-MC-Unique: be7mlAHeOjOx57ovyiwV5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B4F4801B13
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 21:20:22 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 525E460CCC;
 Fri, 21 May 2021 21:20:22 +0000 (UTC)
Date: Fri, 21 May 2021 17:20:21 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 10/19] i386: move eVMCS enablement to hyperv_init_vcpu()
Message-ID: <20210521212021.lsf2pzfu647ocqj3@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-11-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-11-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On Thu, Apr 22, 2021 at 06:11:21PM +0200, Vitaly Kuznetsov wrote:
> hyperv_expand_features() will be called before we create vCPU so
> evmcs enablement should go away. hyperv_init_vcpu() looks like the
> right place.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 60 ++++++++++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 6b391db7a030..a2ef2dc154a2 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -962,6 +962,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>  {
>      struct kvm_cpuid2 *cpuid;
>      int max = 7; /* 0x40000000..0x40000005, 0x4000000A */
> +    int i;
>  
>      /*
>       * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
> @@ -971,6 +972,22 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>      while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
>          max++;
>      }
> +
> +    /*
> +     * KVM_GET_SUPPORTED_HV_CPUID does not set EVMCS CPUID bit before
> +     * KVM_CAP_HYPERV_ENLIGHTENED_VMCS is enabled but we want to get the
> +     * information early, just check for the capability and set the bit
> +     * manually.
> +     */

Should we add a comment noting that this hack won't be necessary
if using the system ioctl?  I assume we still want to support
Linux < v5.11 for a while, so simply 


> +    if (kvm_check_extension(cs->kvm_state,
> +                            KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
> +        for (i = 0; i < cpuid->nent; i++) {
> +            if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
> +                cpuid->entries[i].eax |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
> +            }
> +        }
> +    }
> +
>      return cpuid;
>  }
>  
> @@ -1200,24 +1217,6 @@ static int hyperv_expand_features(CPUState *cs)
>      if (!hyperv_enabled(cpu))
>          return 0;
>  
> -    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ||
> -        cpu->hyperv_passthrough) {
> -        uint16_t evmcs_version;
> -
> -        r = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> -                                (uintptr_t)&evmcs_version);
> -
> -        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) && r) {
> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> -            return -ENOSYS;
> -        }
> -
> -        if (!r) {
> -            cpu->hyperv_nested[0] = evmcs_version;
> -        }
> -    }
> -
>      if (cpu->hyperv_passthrough) {
>          cpu->hyperv_vendor_id[0] =
>              hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
> @@ -1455,6 +1454,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>          }
>      }
>  
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> +        uint16_t evmcs_version;
> +
> +        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
> +                                  (uintptr_t)&evmcs_version);
> +
> +        if (ret < 0) {
> +            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
> +                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
> +            return ret;
> +        }
> +
> +        cpu->hyperv_nested[0] = evmcs_version;

Wait, won't this break guest ABI?  Do we want to make
HYPERV_FEAT_EVMCS a migration blocker until this is fixed?


> +    }
> +
>      return 0;
>  }
>  
> @@ -1519,6 +1533,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>  
>      if (hyperv_enabled(cpu)) {
> +        r = hyperv_init_vcpu(cpu);
> +        if (r) {
> +            return r;
> +        }
> +
>          cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
>          kvm_base = KVM_CPUID_SIGNATURE_NEXT;
>          has_msr_hv_hypercall = true;
> @@ -1868,11 +1887,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      kvm_init_msrs(cpu);
>  
> -    r = hyperv_init_vcpu(cpu);
> -    if (r) {
> -        goto fail;
> -    }
> -
>      return 0;

I would move the two hunks above to a separate patch, but not a
big deal.  The guest ABI issue is existing, and the comment
suggestion can be done in a follow up patch, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

>  
>   fail:
> -- 
> 2.30.2
> 

-- 
Eduardo


