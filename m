Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED3D340EEB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:15:45 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMz3Y-0002eG-4q
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMz1j-0002Cl-AX
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMz1h-0003lD-Ej
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616098427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LMyHUmPC5cRso7vAKjkBYc1EU6Kd8+IV9O/ru/4EBVk=;
 b=Kukqc+dtFDF6pfq62RvxilYOdagocsMc/iJVBqFAeVQCb8lOGm6+47Acvi5DYVtskmVEn8
 VUWzLerrk4cdyP7IN25KiXceRZmkfMB3Iul7jIgxSYoqzE5bVXdQZbjb/J6nMI+fYgv2/i
 XtOQONlyubWW6+l+ZjVZwVU3KvS9bRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-s5eX4TfMM7GrVdPuHPp2og-1; Thu, 18 Mar 2021 16:13:46 -0400
X-MC-Unique: s5eX4TfMM7GrVdPuHPp2og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC228801817;
 Thu, 18 Mar 2021 20:13:43 +0000 (UTC)
Received: from work-vm (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4655D9D0;
 Thu, 18 Mar 2021 20:13:42 +0000 (UTC)
Date: Thu, 18 Mar 2021 20:13:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 3/3] i386: Make sure kvm_arch_set_tsc_khz() succeeds on
 migration when 'hv-reenlightenment' was exposed
Message-ID: <YFO0cxitRbCtKle8@work-vm>
References: <20210318160249.1084178-1-vkuznets@redhat.com>
 <20210318160249.1084178-4-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318160249.1084178-4-vkuznets@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vitaly Kuznetsov (vkuznets@redhat.com) wrote:
> KVM doesn't fully support Hyper-V reenlightenment notifications on
> migration. In particular, it doesn't support emulating TSC frequency
> of the source host by trapping all TSC accesses so unless TSC scaling
> is supported on the destination host and KVM_SET_TSC_KHZ succeeds, it
> is unsafe to proceed with migration.
> 
> Normally, we only require KVM_SET_TSC_KHZ to succeed when 'user_tsc_khz'
> was set and just 'try' KVM_SET_TSC_KHZ without otherwise.
> 
> Introduce a new vmstate section (which is added when the guest has
> reenlightenment feature enabled) and add env.tsc_khz to it. We already
> have env.tsc_khz packed in 'cpu/tsc_khz' but we don't want to be dependent
> on the section order.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/hyperv.h |  1 +
>  target/i386/kvm/kvm.c    | 11 +++++++++++
>  target/i386/machine.c    | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/target/i386/kvm/hyperv.h b/target/i386/kvm/hyperv.h
> index 67543296c3a4..c65e5c85c4d3 100644
> --- a/target/i386/kvm/hyperv.h
> +++ b/target/i386/kvm/hyperv.h
> @@ -20,6 +20,7 @@
>  
>  #ifdef CONFIG_KVM
>  int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit);
> +int kvm_hv_tsc_frequency_loaded(X86CPU *cpu);
>  #endif
>  
>  int hyperv_x86_synic_add(X86CPU *cpu);
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 7fe9f527103c..f6c4093778e9 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1460,6 +1460,17 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>      return 0;
>  }
>  
> +int kvm_hv_tsc_frequency_loaded(X86CPU *cpu)
> +{
> +    CPUState *cs = CPU(cpu);
> +
> +    /*
> +     * KVM doens't fully support re-enlightenment notifications so we need to
                 ^^
tpyo

Dave

> +     * make sure TSC frequency doesn't change upon migration.
> +     */
> +    return kvm_arch_set_tsc_khz(cs);
> +}
> +
>  static Error *invtsc_mig_blocker;
>  
>  #define KVM_MAX_CPUID_ENTRIES  100
> diff --git a/target/i386/machine.c b/target/i386/machine.c
> index 715620c58809..369a8f1e7a7a 100644
> --- a/target/i386/machine.c
> +++ b/target/i386/machine.c
> @@ -896,6 +896,42 @@ static const VMStateDescription vmstate_msr_hyperv_reenlightenment = {
>          VMSTATE_END_OF_LIST()
>      }
>  };
> +
> +static bool hyperv_tsc_frequency_needed(void *opaque)
> +{
> +    X86CPU *cpu = opaque;
> +    CPUX86State *env = &cpu->env;
> +
> +    return env->tsc_khz != 0 && (env->msr_hv_reenlightenment_control ||
> +                                 env->msr_hv_tsc_emulation_control);
> +}
> +
> +static int hyperv_tsc_frequency_post_load(void *opaque, int version_id)
> +{
> +    X86CPU *cpu = opaque;
> +    int r;
> +
> +    r = kvm_hv_tsc_frequency_loaded(cpu);
> +    if (r) {
> +        error_report("Failed to set the desired TSC frequency and "
> +                     "reenlightenment was exposed");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_msr_hyperv_tsc_frequency = {
> +    .name = "cpu/msr_hyperv_tsc_frequency",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hyperv_tsc_frequency_needed,
> +    .post_load = hyperv_tsc_frequency_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_INT64(env.tsc_khz, X86CPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
>  #endif
>  
>  static bool avx512_needed(void *opaque)
> @@ -1495,6 +1531,7 @@ VMStateDescription vmstate_x86_cpu = {
>          &vmstate_msr_hyperv_synic,
>          &vmstate_msr_hyperv_stimer,
>          &vmstate_msr_hyperv_reenlightenment,
> +        &vmstate_msr_hyperv_tsc_frequency,
>  #endif
>          &vmstate_avx512,
>          &vmstate_xss,
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


