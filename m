Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22983CB50C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:08:57 +0200 (CEST)
Received: from localhost ([::1]:38148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Jq4-0004qL-CH
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4JoS-000480-QO
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m4JoP-0005qm-6D
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626426431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8efeVFyZdlNBLrGCgMRLF1YfAz+xaqWIbhcMsGEkt7E=;
 b=gsSp1Z083f6y4rL5Msmn9u9c1/ww+/Zzvc5QEleeAxA7Eg8ILgOdSb5eqKFy3QjTOrio1y
 ApTTmJoxBiWxmpUHouVpwVMkzxDhQYkZYQRjzejegjOv1E4g44cn+Kw7vK+r0pIP2smGJs
 ya+veDMmv5kumcnTCmwId0a2yjXk1q4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Ur-GNfDmMBS0C7fp-dyWyg-1; Fri, 16 Jul 2021 05:07:09 -0400
X-MC-Unique: Ur-GNfDmMBS0C7fp-dyWyg-1
Received: by mail-ej1-f72.google.com with SMTP id
 nc15-20020a1709071c0fb029052883e9de3eso3340452ejc.19
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 02:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8efeVFyZdlNBLrGCgMRLF1YfAz+xaqWIbhcMsGEkt7E=;
 b=e2EU4WLNWBLSTWL6AL/b876lKI1Ymyyr7+TNJ1csRQv0BeECDJ1nmmDMy2taJHz3nP
 z/wTsjexQZ6iDkrMG5dT0Rt/QZLWIZdi6+PxzeNHN5KoN+V4KjH/ogeBIMa/nIhuevzD
 WZQvhSnGkvyHHsxPPm58zgZ+rtLkzH+34wGoSNPUMLyiL97zc0kiVqR8Z78iJjbhtR2Q
 koPH3x4gsNVLvkm94lsFtW49q7mYxOdXVc7Guz/HmdOr2QGehCIfHhgRZhfxVQMPUq3r
 pVCsWE1Rq1gUXMpJZvuO0tHLace2yTikLs6UmR5JaiqC6RNVvwDLURYJclgclsvaOrzh
 B3ZQ==
X-Gm-Message-State: AOAM532PUmgWKrpjyMc3voFNgpLpYFOndPDbWwRUfWpEo0xvQTXDbI4V
 TPANR8YXnT5q5Hgr87sMHdnOgbkbPnyiWdZv84wvkqRYDwUS7MSpluqn7f1DKAsYqGE0Oac7SjV
 BfqcAGU2y+k8Q3qY=
X-Received: by 2002:a17:906:fc6:: with SMTP id
 c6mr10595307ejk.65.1626426428742; 
 Fri, 16 Jul 2021 02:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGogOZixuFoShn9FSPdi0P8CvjTCPptdWEx0iq0Redq8XXB+R55o/2MXJV/XcG/kpOY93ArQ==
X-Received: by 2002:a17:906:fc6:: with SMTP id
 c6mr10595286ejk.65.1626426428536; 
 Fri, 16 Jul 2021 02:07:08 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f15sm2662703ejc.61.2021.07.16.02.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 02:07:08 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>
Subject: Re: [PULL 04/11] i386: expand Hyper-V features during CPU feature
 expansion time
In-Reply-To: <CAFEAcA-nif_Z0guHx4q4NUg=FEyhUz8kkAvfZ58916yp6TXT7Q@mail.gmail.com>
References: <20210713160957.3269017-1-ehabkost@redhat.com>
 <20210713160957.3269017-5-ehabkost@redhat.com>
 <CAFEAcA-nif_Z0guHx4q4NUg=FEyhUz8kkAvfZ58916yp6TXT7Q@mail.gmail.com>
Date: Fri, 16 Jul 2021 11:07:06 +0200
Message-ID: <878s261vb9.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 13 Jul 2021 at 17:19, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>
>> From: Vitaly Kuznetsov <vkuznets@redhat.com>
>>
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
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Message-Id: <20210608120817.1325125-6-vkuznets@redhat.com>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>
> Hi; Coverity reports an issue in this code (CID 1458243):
>
>> -static bool hyperv_expand_features(CPUState *cs, Error **errp)
>> +bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
>>  {
>> -    X86CPU *cpu = X86_CPU(cs);
>> +    CPUState *cs = CPU(cpu);
>>
>>      if (!hyperv_enabled(cpu))
>>          return true;
>>
>> +    /*
>> +     * When kvm_hyperv_expand_features is called at CPU feature expansion
>> +     * time per-CPU kvm_state is not available yet so we can only proceed
>> +     * when KVM_CAP_SYS_HYPERV_CPUID is supported.
>> +     */
>> +    if (!cs->kvm_state &&
>> +        !kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID))
>> +        return true;
>
> Here we check whether cs->kvm_state is NULL, but even if it is
> NULL we can still continue execution further through the function.
>
> Later in the function we call hv_cpuid_get_host(), which in turn
> can call get_supported_hv_cpuid_legacy(), which can dereference
> cs->kvm_state without checking it.

get_supported_hv_cpuid_legacy() is only called when KVM_CAP_HYPERV_CPUID
is not supported and this is not possible with
KVM_CAP_SYS_HYPERV_CPUID. Coverity, of course, can't know that.

>
> So either the check on cs->kvm_state above is unnecessary, or we
> need to handle it being NULL in some way other than falling through.

It seems an assert(cs) before calling get_supported_hv_cpuid_legacy()
(with a proper comment) should do the job.

>
> Side note: this change isn't in line with our coding style, which
> requires braces around the body of the if().

My bad, will fix.

-- 
Vitaly


