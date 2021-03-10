Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A0333BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 12:45:29 +0100 (CET)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxHM-0000KM-KJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 06:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lJxFu-0007Sx-Fo
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lJxFq-0003MU-LJ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 06:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615376632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/O5FY++XK8PpTJ/8ntZiAT65fddpY7jYkyfutUygbY=;
 b=Onw+NtTxFzbJKxwfLEzBjDiuOEhrVpw9hthQNws/fjS7KHKnG1m8tR1pSLkvmNkNPEhA2A
 Y6mQuZR3Iv5kxONdYu5vLKvFWO0Z9PD2YsYheH+eT8L6MkT7cD2VxzcIHyTTtT2PVAT8qb
 sTKATtvV2fumg+4G4IHRksH0HLcoAoM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-C_q6cfBWNpWvBYngVWledA-1; Wed, 10 Mar 2021 06:43:50 -0500
X-MC-Unique: C_q6cfBWNpWvBYngVWledA-1
Received: by mail-ed1-f71.google.com with SMTP id n20so8265813edr.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 03:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=D/O5FY++XK8PpTJ/8ntZiAT65fddpY7jYkyfutUygbY=;
 b=QxEdT3ddfQsZkvA+P6mANmAPdqo4hEIBrWZTziVAduQlXeLw1vG9f43+bLL3LldguS
 81rdyHNPkDL/sGjMnyNeguOmg7DZYCVl61hSb7NAyXVfa9e6tsmpqeX9v6R0Um445/Mt
 LkLaUGlLv3LVIXNXwoHuN0gguyEFXDYsDl+phi91varQpkXQypJ2XAbzTTp8W3yvt81E
 ci1ykKHULdL4Zzvd2UTdWPVVjbKXCVn4wntD4ccAZPyLrQ6r6eYB2kyfqc+xJYdCkVqY
 2GNgc41+qKCFrzZtVAiTmxKF3qylZ624AHF5JcCRieF4HAJZwR9nUF+Ksiw8rRYlvADc
 v/Kw==
X-Gm-Message-State: AOAM5316AR8jZga2egsvrrI2LY4IfDWkIeMvT1uqYUYvX0PJzwt0PsBl
 hvVc71YZgihf6NbvBbACbs9QL+Gb//SR165A1o3kwOLh4x/PU4e3Pi/5wms+Zx4oxx4bM922Sox
 FbJ/snbPZhexjyBU=
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr3243908ejr.516.1615376628809; 
 Wed, 10 Mar 2021 03:43:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxr0CSJlhX9uQ2aYwlHtU/+//RkVfHfI2cQHh2YGzJZjb1bfebuXbyJ6ELqvQppYC4fMSZow==
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr3243893ejr.516.1615376628615; 
 Wed, 10 Mar 2021 03:43:48 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id a9sm10892952edt.82.2021.03.10.03.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 03:43:48 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/5] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
In-Reply-To: <ebfd3385-6e68-cd44-b0bb-464ae56d5b59@suse.de>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-2-vkuznets@redhat.com>
 <ebfd3385-6e68-cd44-b0bb-464ae56d5b59@suse.de>
Date: Wed, 10 Mar 2021 12:43:47 +0100
Message-ID: <87v99z9qto.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana <cfontana@suse.de> writes:

> On 11/19/20 11:32 AM, Vitaly Kuznetsov wrote:
>> As a preparation to expanding Hyper-V CPU features early, move
>> hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
>> x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
>> itself.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>
>
> Hi Vitaly,
>
> If building for TCG-only, does the x86_cpu_hyperv_realize function and other hyperv related functions
> make sense to keep in the build?
>
> Now that we have per-accelerator subdirs in target/i386, should the hyperv code be moved over?
>

Hi Claudio,

I'm not exactly sure. On one hand, we only implement Hyper-V emulation
with KVM now. On the other hand Hyper-V specific CPU options are
available even without it (and as Igor feels strongly against
introducing custom option parsers, I don't see how we can forbid to use
them without KVM). x86_cpu_hyperv_realize() is the bare minimum which is
only needed to set our internal Hyper-V related data in a sane way,
e.g. set the default to 'cpu->hyperv_vendor_id'. The actual enablement
code is in target/i386/kvm.c already. Do you see anything besides
x86_cpu_hyperv_realize() which we could move there? Could you please
take a look at v5
(https://mail.gnu.org/archive/html/qemu-devel/2021-03/msg00158.html)?

Thanks!


> Thanks,
>
> Claudio
>
>
>> ---
>>  target/i386/cpu.c | 23 ++++++++++++++++++++++-
>>  target/i386/cpu.h |  3 ++-
>>  target/i386/kvm.c | 25 ++++++++++---------------
>>  3 files changed, 34 insertions(+), 17 deletions(-)
>> 
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 5a8c96072e41..2a6885753378 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6509,6 +6509,25 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>>      }
>>  }
>>  
>> +static void x86_cpu_hyperv_realize(X86CPU *cpu)
>> +{
>> +    size_t len;
>> +
>> +    /* Hyper-V vendor id */
>> +    if (!cpu->hyperv_vendor) {
>> +        memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
>> +    } else {
>> +        len = strlen(cpu->hyperv_vendor);
>> +
>> +        if (len > 12) {
>> +            warn_report("hv-vendor-id truncated to 12 characters");
>> +            len = 12;
>> +        }
>> +        memset(cpu->hyperv_vendor_id, 0, 12);
>> +        memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
>> +    }
>> +}
>> +
>>  static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>> @@ -6680,6 +6699,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>          env->cache_info_amd.l3_cache = &legacy_l3_cache;
>>      }
>>  
>> +    /* Process Hyper-V enlightenments */
>> +    x86_cpu_hyperv_realize(cpu);
>>  
>>      cpu_exec_realizefn(cs, &local_err);
>>      if (local_err != NULL) {
>> @@ -7198,7 +7219,7 @@ static Property x86_cpu_properties[] = {
>>      DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
>>      DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
>>      DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
>> -    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor_id),
>> +    DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
>>      DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
>>      DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
>>      DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 88e8586f8fb4..be640bf45c29 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -1655,11 +1655,12 @@ struct X86CPU {
>>      uint64_t ucode_rev;
>>  
>>      uint32_t hyperv_spinlock_attempts;
>> -    char *hyperv_vendor_id;
>> +    char *hyperv_vendor;
>>      bool hyperv_synic_kvm_only;
>>      uint64_t hyperv_features;
>>      bool hyperv_passthrough;
>>      OnOffAuto hyperv_no_nonarch_cs;
>> +    uint32_t hyperv_vendor_id[3];
>>  
>>      bool check_cpuid;
>>      bool enforce_cpuid;
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index a2934dda027c..788a2cf2ec51 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -1205,6 +1205,13 @@ static int hyperv_handle_properties(CPUState *cs,
>>          memcpy(cpuid_ent, &cpuid->entries[0],
>>                 cpuid->nent * sizeof(cpuid->entries[0]));
>>  
>> +        c = cpuid_find_entry(cpuid, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, 0);
>> +        if (c) {
>> +            cpu->hyperv_vendor_id[0] = c->ebx;
>> +            cpu->hyperv_vendor_id[1] = c->ecx;
>> +            cpu->hyperv_vendor_id[2] = c->edx;
>> +        }
>> +
>>          c = cpuid_find_entry(cpuid, HV_CPUID_FEATURES, 0);
>>          if (c) {
>>              env->features[FEAT_HYPERV_EAX] = c->eax;
>> @@ -1279,23 +1286,11 @@ static int hyperv_handle_properties(CPUState *cs,
>>  
>>      c = &cpuid_ent[cpuid_i++];
>>      c->function = HV_CPUID_VENDOR_AND_MAX_FUNCTIONS;
>> -    if (!cpu->hyperv_vendor_id) {
>> -        memcpy(signature, "Microsoft Hv", 12);
>> -    } else {
>> -        size_t len = strlen(cpu->hyperv_vendor_id);
>> -
>> -        if (len > 12) {
>> -            error_report("hv-vendor-id truncated to 12 characters");
>> -            len = 12;
>> -        }
>> -        memset(signature, 0, 12);
>> -        memcpy(signature, cpu->hyperv_vendor_id, len);
>> -    }
>>      c->eax = hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ?
>>          HV_CPUID_NESTED_FEATURES : HV_CPUID_IMPLEMENT_LIMITS;
>> -    c->ebx = signature[0];
>> -    c->ecx = signature[1];
>> -    c->edx = signature[2];
>> +    c->ebx = cpu->hyperv_vendor_id[0];
>> +    c->ecx = cpu->hyperv_vendor_id[1];
>> +    c->edx = cpu->hyperv_vendor_id[2];
>>  
>>      c = &cpuid_ent[cpuid_i++];
>>      c->function = HV_CPUID_INTERFACE;
>> 
>

-- 
Vitaly


