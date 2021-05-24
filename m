Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E512538E66A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:15:19 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9UM-0001Z3-Oi
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9SR-0000Cc-Nv
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:13:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9SN-0002Ty-3X
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621858394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ROb/AQD5cQyNjmKqVNVW8LePhUf5SBgHb5iIh/njzdU=;
 b=QSjpQ6qgS0isBfN9nXYHV95xTFFMmbaHYUJIsjNK1AwfXpRZV0Pzxcgot54qvNBHumCitF
 GPtiuIQDqqvq8XGlzRDZW5zV7Ly6NgWaY/0wlW0EzPH9y8CWSmkkVdusStMV7KQtrvPFkg
 jqbihX5SW4/gzp5tyLd75CU4YdMZuII=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-4-o_0UkeNHGRmTFqfJ7_uw-1; Mon, 24 May 2021 08:13:12 -0400
X-MC-Unique: 4-o_0UkeNHGRmTFqfJ7_uw-1
Received: by mail-wm1-f69.google.com with SMTP id
 h20-20020a05600c4154b029017cb077d60dso3189572wmm.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ROb/AQD5cQyNjmKqVNVW8LePhUf5SBgHb5iIh/njzdU=;
 b=Uug/ECzp4Lq3JAqds1bhCBIhpatpEqFGLypzhmjKPBhSFbVz3iRvKGxDOVO7jlyhcX
 1E0CLMIpz/ZhQgGQYkkt/oSkYRIZisa2brUXK98/2LN383N8HL9Uqtha/Gj1DUtkZNai
 P6+UGA/lJQHDgAxpA9XCkWKOCtU3h1ouJ5BmJJiyRGPNIPiCpc1i8IESpAExp+fkKNmW
 +Ku1Stlz9yxNqqX7PLORlW48gan1BSMAqUX19ad5Fe2oGJNGMewhHcySM/PLv4+A2vqo
 3N5ng5BFcRDc3UUlWXfnMx/d19KbJpP6/Jgr73yrbyRyyeKzaml9f/nXul+J+pYj4PVb
 1UJg==
X-Gm-Message-State: AOAM533xdnylM/eSsLyvh1ekeGTSG9d/N6JqK8MrfnvUYbH9hfYQwdVr
 jWB7F/hNuCXRu/kpuzHBV1J3V/A1rQmZDIGXsI+PRim4b1PsWd7p0dUvwA1/AN+mAYH3JOJcwaO
 6AyWI3tEOO+P+qdY=
X-Received: by 2002:a05:600c:ad3:: with SMTP id
 c19mr17916615wmr.66.1621858390695; 
 Mon, 24 May 2021 05:13:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaw/g8SnieH+Z8OK7P3EkN580WWEM0H1LG6vC8V+9vydrzNwj3sjz6UbJndnnf8TDmmsMIlA==
X-Received: by 2002:a05:600c:ad3:: with SMTP id
 c19mr17916598wmr.66.1621858390442; 
 Mon, 24 May 2021 05:13:10 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id g10sm12251567wrq.12.2021.05.24.05.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:13:10 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 15/19] i386: expand Hyper-V features during CPU
 feature expansion time
In-Reply-To: <20210521214548.rhdybkofpcfvke3k@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-16-vkuznets@redhat.com>
 <20210521214548.rhdybkofpcfvke3k@habkost.net>
Date: Mon, 24 May 2021 14:13:09 +0200
Message-ID: <87eedw72ju.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 22, 2021 at 06:11:26PM +0200, Vitaly Kuznetsov wrote:
>> To make Hyper-V features appear in e.g. QMP query-cpu-model-expansion we
>> need to expand and set the corresponding CPUID leaves early. Modify
>> x86_cpu_get_supported_feature_word() to call newly intoduced Hyper-V
>> specific kvm_hv_get_supported_cpuid() instead of
>> kvm_arch_get_supported_cpuid(). We can't use kvm_arch_get_supported_cpuid()
>> as Hyper-V specific CPUID leaves intersect with KVM's.
>> 
>> Note, early expansion will only happen when KVM supports system wide
>> KVM_GET_SUPPORTED_HV_CPUID ioctl (KVM_CAP_SYS_HYPERV_CPUID).
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/cpu.c          |  4 ++++
>>  target/i386/kvm/kvm-stub.c |  5 +++++
>>  target/i386/kvm/kvm.c      | 15 ++++++++++++---
>>  target/i386/kvm/kvm_i386.h |  1 +
>>  4 files changed, 22 insertions(+), 3 deletions(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index d72b8760e7a3..18b57f3d8b9c 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6514,6 +6514,10 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>>      if (env->cpuid_xlevel2 == UINT32_MAX) {
>>          env->cpuid_xlevel2 = env->cpuid_min_xlevel2;
>>      }
>> +
>> +    if (kvm_enabled()) {
>> +        kvm_hyperv_expand_features(cpu, errp);
>> +    }
>>  }
>>  
>>  /*
>> diff --git a/target/i386/kvm/kvm-stub.c b/target/i386/kvm/kvm-stub.c
>> index 92f49121b8fa..7f175faa3abd 100644
>> --- a/target/i386/kvm/kvm-stub.c
>> +++ b/target/i386/kvm/kvm-stub.c
>> @@ -39,3 +39,8 @@ bool kvm_hv_vpindex_settable(void)
>>  {
>>      return false;
>>  }
>> +
>> +void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>> +{
>> +    return;
>
> Maybe we should make it abort()?  This function should never be
> called if KVM is disabled.
>

Sure, can do that.

>> +}
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index a42263b24fca..d5551c4ab5cf 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -1216,13 +1216,22 @@ static uint32_t hv_build_cpuid_leaf(CPUState *cs, uint32_t func, int reg)
>>   * of 'hv_passthrough' mode and fills the environment with all supported
>>   * Hyper-V features.
>>   */
>> -static void hyperv_expand_features(CPUState *cs, Error **errp)
>> +void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>>  {
>> -    X86CPU *cpu = X86_CPU(cs);
>> +    CPUState *cs = CPU(cpu);
>>  
>>      if (!hyperv_enabled(cpu))
>>          return;
>>  
>> +    /*
>> +     * When kvm_hyperv_expand_features is called at CPU feature expansion
>> +     * time per-CPU kvm_state is not available yet so we can only proceed
>> +     * when KVM_CAP_SYS_HYPERV_CPUID is supported.
>> +     */
>> +    if (!cs->kvm_state &&
>> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
>> +        return;
>> +
>>      if (cpu->hyperv_passthrough) {
>>          cpu->hyperv_vendor_id[0] =
>>              hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
>> @@ -1556,7 +1565,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      env->apic_bus_freq = KVM_APIC_BUS_FREQUENCY;
>>  
>>      /* Paravirtualization CPUIDs */
>> -    hyperv_expand_features(cs, &local_err);
>> +    kvm_hyperv_expand_features(cpu, &local_err);
>
> Do we still need to call the function again here?
>
> If the first expansion isn't expanding everything, I'm afraid
> this second call will hide bugs in query-cpu-model-expansion.
>

The first expansion will do nothing if KVM_CAP_SYS_HYPERV_CPUID is not
supported, calling it here allows us to proceed. The series makes
'query-cpu-model-expansion' output correct only with
KVM_CAP_SYS_HYPERV_CPUID, without it we don't seem to be able to do much
(unless we decide to create a 'scratch' CPU or something like that).

>
>>      if (local_err) {
>>          error_report_err(local_err);
>>          return -ENOSYS;
>> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
>> index dc725083891c..f1176491051d 100644
>> --- a/target/i386/kvm/kvm_i386.h
>> +++ b/target/i386/kvm/kvm_i386.h
>> @@ -47,6 +47,7 @@ bool kvm_has_x2apic_api(void);
>>  bool kvm_has_waitpkg(void);
>>  
>>  bool kvm_hv_vpindex_settable(void);
>> +void kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
>>  
>>  uint64_t kvm_swizzle_msi_ext_dest_id(uint64_t address);
>>  
>> -- 
>> 2.30.2
>> 

-- 
Vitaly


