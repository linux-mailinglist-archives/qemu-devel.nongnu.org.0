Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1DC273FD9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 12:47:21 +0200 (CEST)
Received: from localhost ([::1]:34096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKfpQ-00060M-Cb
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 06:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kKfcM-0006nL-Fr
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kKfcI-0006bQ-R8
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600770825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g1rDSBouqSbb1VQz5HQmB8k9rMlmQ1SNxtvbryzlflY=;
 b=W/PRjnny2XwZxUuI1wGd8kWN9eK1sxWJPK8lLOMesn5Xg1/rSS3zYOoboo212tnjcU4Z/i
 Xr/iQU+SA7aLDzOwKWPBvVYIJnD2S4bcpk0pLF5eKlVzXSGxULCZDIDOx1t5QQ6BuxaW+s
 c0LgFWbRQWjEXVIGjOLGVw5seZJfdiY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-3VOJ1yg7OxOqjq9abT2K6w-1; Tue, 22 Sep 2020 06:33:44 -0400
X-MC-Unique: 3VOJ1yg7OxOqjq9abT2K6w-1
Received: by mail-ed1-f69.google.com with SMTP id y21so5549376edu.23
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 03:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=g1rDSBouqSbb1VQz5HQmB8k9rMlmQ1SNxtvbryzlflY=;
 b=KfeQyE9tYPUx1jHxE1R1pvQFUXR7bNCeEtEBxJ08WsopxiAvI/vM4fDoPR990tOizs
 s33KIOMBGJEcdjoawjq//HYQpUVSs/eepSvNlsyNQE3lQSUOv7iA5Xy1aNQBgQ5phwDD
 EibIVVPTu2MI+v27K+x77EIPSWSRyId7jR3bulFZHdoOPprbayh8rENfjn3/SjL5Q7s8
 wTKY+0fAFh8ByCkWkNcOrdfx3z1lMMUwt5f6YPlX7uspp7naCpCyQzk++wxlPVYVlxb9
 6VFflBe2aUW6pcMK4IAQjOeiP3bJXolnukbJuWaFdRIiWdCXUeoWP+xoVJqnV0j1Fftz
 dLYA==
X-Gm-Message-State: AOAM530JnvyHsVI8kI4jvqafwnioKIOYWnzxMgvtxZwV6cgx6/Cun8xr
 6sgVKdpU7hqyPlCZXqKkoQOWkFkl4bJEYokP7aMYKrXmMJZourEZ6hbGNAC2didoeF32wRDA/v5
 owei7OfFtZeoHXP4=
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr3350898ede.32.1600770822910; 
 Tue, 22 Sep 2020 03:33:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3m8fzA7otJH0XyFOvhJ6ah4sRalxY6iTcRcgVUfs26zQ6wjmthC2wGUK2UGdBT8LGLREnsA==
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr3350871ede.32.1600770822668; 
 Tue, 22 Sep 2020 03:33:42 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id g16sm10533925edf.20.2020.09.22.03.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 03:33:42 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC 22/22] i386: expand Hyper-V features early
In-Reply-To: <20200918223820.GK57321@habkost.net>
References: <20200904145431.196885-1-vkuznets@redhat.com>
 <20200904145431.196885-23-vkuznets@redhat.com>
 <20200918223820.GK57321@habkost.net>
Date: Tue, 22 Sep 2020 12:33:41 +0200
Message-ID: <87blhyf6d6.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Fri, Sep 04, 2020 at 04:54:31PM +0200, Vitaly Kuznetsov wrote:
>> To make Hyper-V features appear in e.g. QMP query-cpu-model-expansion we
>> need to expand and set the corresponding CPUID leaves early. Modify
>> x86_cpu_get_supported_feature_word() to call newly intoduced Hyper-V
>> specific kvm_hv_get_supported_cpuid() instead of
>> kvm_arch_get_supported_cpuid(). We can't use kvm_arch_get_supported_cpuid()
>> as Hyper-V specific CPUID leaves intersect with KVM's.
>> 
>> Note, early expansion will only happen when KVM supports system wide
>> KVM_GET_SUPPORTED_HV_CPUID ioctl (KVM_CAP_SYS_HYPERV_CPUID).
>
> Will this implicitly enable hyperv CPUID passthrough when using
> "-cpu host"?  Do we want it to?
>

I hope it won't. With 'hv_*' features set explicitly we will get just
them (if the host supports), with 'hv_passthrough' we will get
everything supported by the host. With no 'hv_*' parameters on the
command line we should get no Hyper-V features. I'll check this.

Personally, I don't think '-host' mode should enable any Hyper-V
features as these features have side-effects. E.g. if you enable SynIC
you won't be able to use vAPIC. Probably not a reasonable default for
the majority of the guests which (hopefully) are Linux.

>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/cpu.c      | 15 +++++++++------
>>  target/i386/kvm.c      | 15 +++++++++++++++
>>  target/i386/kvm_i386.h |  7 +++++++
>>  3 files changed, 31 insertions(+), 6 deletions(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 479c4bbbf459..d3c4ecb3535c 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -5147,7 +5147,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>>      return cpu_list;
>>  }
>>  
>> -static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>> +static uint64_t x86_cpu_get_supported_feature_word(X86CPU *cpu, FeatureWord w,
>>                                                     bool migratable_only)
>>  {
>>      FeatureWordInfo *wi = &feature_word_info[w];
>> @@ -5156,9 +5156,12 @@ static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>>      if (kvm_enabled()) {
>>          switch (wi->type) {
>>          case CPUID_FEATURE_WORD:
>> -            r = kvm_arch_get_supported_cpuid(kvm_state, wi->cpuid.eax,
>> -                                                        wi->cpuid.ecx,
>> -                                                        wi->cpuid.reg);
>> +            if (hyperv_feature_word(w))
>> +                r = kvm_hv_get_supported_cpuid(cpu, w);
>> +            else
>> +                r = kvm_arch_get_supported_cpuid(kvm_state, wi->cpuid.eax,
>> +                                                 wi->cpuid.ecx,
>> +                                                 wi->cpuid.reg);
>>              break;
>>          case MSR_FEATURE_WORD:
>>              r = kvm_arch_get_supported_msr_feature(kvm_state,
>> @@ -6485,7 +6488,7 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
>>               * by the user.
>>               */
>>              env->features[w] |=
>> -                x86_cpu_get_supported_feature_word(w, cpu->migratable) &
>> +                x86_cpu_get_supported_feature_word(cpu, w, cpu->migratable) &
>>                  ~env->user_features[w] &
>>                  ~feature_word_info[w].no_autoenable_flags;
>>          }
>> @@ -6589,7 +6592,7 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>  
>>      for (w = 0; w < FEATURE_WORDS; w++) {
>>          uint64_t host_feat =
>> -            x86_cpu_get_supported_feature_word(w, false);
>> +            x86_cpu_get_supported_feature_word(cpu, w, false);
>>          uint64_t requested_features = env->features[w];
>>          uint64_t unavailable_features = requested_features & ~host_feat;
>>          mark_unavailable_features(cpu, w, unavailable_features, prefix);
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index 961241528a5c..764b96fbbb7d 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -1449,6 +1449,21 @@ static int hyperv_fill_cpuids(CPUState *cs,
>>      return cpuid_i;
>>  }
>>  
>> +uint32_t kvm_hv_get_supported_cpuid(X86CPU *cpu, enum FeatureWord w)
>> +{
>> +    CPUState *cs = CPU(cpu);
>> +    CPUX86State *env = &cpu->env;
>> +    Error *local_err = NULL;
>> +
>> +    hyperv_expand_features(cs, &local_err);
>> +
>> +    if (local_err) {
>> +            error_report_err(local_err);
>> +    }
>> +
>> +    return env->features[w];
>> +}
>> +
>>  static Error *hv_passthrough_mig_blocker;
>>  static Error *hv_no_nonarch_cs_mig_blocker;
>>  
>> diff --git a/target/i386/kvm_i386.h b/target/i386/kvm_i386.h
>> index 064b8798a26c..2e7da4f39668 100644
>> --- a/target/i386/kvm_i386.h
>> +++ b/target/i386/kvm_i386.h
>> @@ -48,4 +48,11 @@ bool kvm_has_waitpkg(void);
>>  
>>  bool kvm_hv_vpindex_settable(void);
>>  
>> +static inline bool hyperv_feature_word(enum FeatureWord w)
>> +{
>> +    return w >= FEAT_HYPERV_EAX && w <= FEAT_HV_NESTED_EDX;
>> +}
>> +
>> +uint32_t kvm_hv_get_supported_cpuid(X86CPU *cpu, enum FeatureWord w);
>> +
>>  #endif
>> -- 
>> 2.25.4
>> 

-- 
Vitaly


