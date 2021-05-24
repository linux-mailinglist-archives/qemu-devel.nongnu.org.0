Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19638E619
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:02:17 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9Hj-00013I-SS
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9GJ-0000Kp-P9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:00:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1ll9GE-00034m-H9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621857641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y8ukYIAqlsYGkIOpg3cGCXhLI5OXN5ZUmDvt/Xcz+3M=;
 b=WTNoeCFYzfW2Qd9wIiSE+A1t1ZWjxbA0f1zmnauz9QkoEWX/tl/3LY6raPAHVZVWVFYTp1
 0GiQJOb1FJkggJG1zq0Ej2ijVwHwFXNdcH6gX/txaozgrbGR8RTH/vNSxHm/c4lQVx31Oo
 kt6uvU/6ApRjtUDC6T7qeqvQf0XHB9s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-6YNqjJn1Pdi7ZXEQv7wf7A-1; Mon, 24 May 2021 08:00:40 -0400
X-MC-Unique: 6YNqjJn1Pdi7ZXEQv7wf7A-1
Received: by mail-wm1-f72.google.com with SMTP id
 g206-20020a1c39d70000b029016ac627fbe9so4116561wma.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 05:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Y8ukYIAqlsYGkIOpg3cGCXhLI5OXN5ZUmDvt/Xcz+3M=;
 b=gZuAdZBUCQnlbFoSXzq2WCXllt5S7DQw9X23zGbMXBnv0RftY1Et6djuRxPN5UMO+U
 K/5WysHKv6QpIA5b7YdifJSJdmb14dAdtYLPeZpp1lYlh/GaMxOHg4sPHTV96Tn33q2v
 1lXAwBMGzFRoggaAWwVj5P9jaJqqMmeSrHc4j5h9B3JIv/sVMUzrw0jgqC4hjAf/8aeb
 XxLjNBXx4nX7+YeP6pSWhFv/JYJmnmBFm0ifpkiwxYKwB4DJWp6BWvrm0DY31ld6y/6W
 foGUX7MgWmBt6olyg+KSNx3CQIuNMcBDjJmgWvfbU5VzBIN3wXLXnnAT21wvBwIplxWx
 P+9g==
X-Gm-Message-State: AOAM532CN/HXKPHCoFQcnUPdO+B7Pl2sPDRzWdIyywxE2fKaobpuH4G4
 BoD8Lo4LugxdIrLXLzJNv+gnHWIQaAyAObl9Q09K2wQyXYTDarWIRekf++NtzkEMkCt9EszT1n0
 9siG149lf5zSdMko=
X-Received: by 2002:a05:6000:104a:: with SMTP id
 c10mr21829116wrx.45.1621857639111; 
 Mon, 24 May 2021 05:00:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtNHbXJvlfywc0QmqmOi0JsOaA5giIAi6xo78SJEjfbaFVVq/H6SmIpSFO3Lx5klMy+QjLFg==
X-Received: by 2002:a05:6000:104a:: with SMTP id
 c10mr21829089wrx.45.1621857638845; 
 Mon, 24 May 2021 05:00:38 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id m9sm14716090wrs.36.2021.05.24.05.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 05:00:38 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 10/19] i386: move eVMCS enablement to hyperv_init_vcpu()
In-Reply-To: <20210521212021.lsf2pzfu647ocqj3@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-11-vkuznets@redhat.com>
 <20210521212021.lsf2pzfu647ocqj3@habkost.net>
Date: Mon, 24 May 2021 14:00:37 +0200
Message-ID: <87mtsk734q.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
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

> On Thu, Apr 22, 2021 at 06:11:21PM +0200, Vitaly Kuznetsov wrote:
>> hyperv_expand_features() will be called before we create vCPU so
>> evmcs enablement should go away. hyperv_init_vcpu() looks like the
>> right place.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  target/i386/kvm/kvm.c | 60 ++++++++++++++++++++++++++-----------------
>>  1 file changed, 37 insertions(+), 23 deletions(-)
>> 
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 6b391db7a030..a2ef2dc154a2 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -962,6 +962,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>>  {
>>      struct kvm_cpuid2 *cpuid;
>>      int max = 7; /* 0x40000000..0x40000005, 0x4000000A */
>> +    int i;
>>  
>>      /*
>>       * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
>> @@ -971,6 +972,22 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>>      while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
>>          max++;
>>      }
>> +
>> +    /*
>> +     * KVM_GET_SUPPORTED_HV_CPUID does not set EVMCS CPUID bit before
>> +     * KVM_CAP_HYPERV_ENLIGHTENED_VMCS is enabled but we want to get the
>> +     * information early, just check for the capability and set the bit
>> +     * manually.
>> +     */
>
> Should we add a comment noting that this hack won't be necessary
> if using the system ioctl?  I assume we still want to support
> Linux < v5.11 for a while, so simply 

Not exactly sure what was supposed to be here but yes, the hack is not
needed with system KVM_GET_SUPPORTED_HV_CPUID ioctl but we want to
support older kernels.

>
>
>> +    if (kvm_check_extension(cs->kvm_state,
>> +                            KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {
>> +        for (i = 0; i < cpuid->nent; i++) {
>> +            if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
>> +                cpuid->entries[i].eax |= HV_ENLIGHTENED_VMCS_RECOMMENDED;
>> +            }
>> +        }
>> +    }
>> +
>>      return cpuid;
>>  }
>>  
>> @@ -1200,24 +1217,6 @@ static int hyperv_expand_features(CPUState *cs)
>>      if (!hyperv_enabled(cpu))
>>          return 0;
>>  
>> -    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) ||
>> -        cpu->hyperv_passthrough) {
>> -        uint16_t evmcs_version;
>> -
>> -        r = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>> -                                (uintptr_t)&evmcs_version);
>> -
>> -        if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS) && r) {
>> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> -            return -ENOSYS;
>> -        }
>> -
>> -        if (!r) {
>> -            cpu->hyperv_nested[0] = evmcs_version;
>> -        }
>> -    }
>> -
>>      if (cpu->hyperv_passthrough) {
>>          cpu->hyperv_vendor_id[0] =
>>              hv_cpuid_get_host(cs, HV_CPUID_VENDOR_AND_MAX_FUNCTIONS, R_EBX);
>> @@ -1455,6 +1454,21 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>>          }
>>      }
>>  
>> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
>> +        uint16_t evmcs_version;
>> +
>> +        ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>> +                                  (uintptr_t)&evmcs_version);
>> +
>> +        if (ret < 0) {
>> +            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> +                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> +            return ret;
>> +        }
>> +
>> +        cpu->hyperv_nested[0] = evmcs_version;
>
> Wait, won't this break guest ABI?  Do we want to make
> HYPERV_FEAT_EVMCS a migration blocker until this is fixed?
>

Could you please elaborate on the issue? I read the above is: when 
evmcs' feature was requested, make an attempt to enable
KVM_CAP_HYPERV_ENLIGHTENED_VMCS, and bail out if this fails. Propagate
the the acquired evmcs version to 'cpu->hyperv_nested[]' otherwise.

>
>> +    }
>> +
>>      return 0;
>>  }
>>  
>> @@ -1519,6 +1533,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      }
>>  
>>      if (hyperv_enabled(cpu)) {
>> +        r = hyperv_init_vcpu(cpu);
>> +        if (r) {
>> +            return r;
>> +        }
>> +
>>          cpuid_i = hyperv_fill_cpuids(cs, cpuid_data.entries);
>>          kvm_base = KVM_CPUID_SIGNATURE_NEXT;
>>          has_msr_hv_hypercall = true;
>> @@ -1868,11 +1887,6 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>  
>>      kvm_init_msrs(cpu);
>>  
>> -    r = hyperv_init_vcpu(cpu);
>> -    if (r) {
>> -        goto fail;
>> -    }
>> -
>>      return 0;
>
> I would move the two hunks above to a separate patch, but not a
> big deal.  The guest ABI issue is existing, and the comment
> suggestion can be done in a follow up patch, so:
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>

Thanks!

>>  
>>   fail:
>> -- 
>> 2.30.2
>> 

-- 
Vitaly


