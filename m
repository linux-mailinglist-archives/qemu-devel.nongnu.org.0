Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E839D798
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 10:41:50 +0200 (CEST)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqApR-0000gs-BZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 04:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqAmd-0008O6-5T
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lqAmU-0006Aj-0H
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 04:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623055123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eV8asBhApEJWNulXwrzTUORXN1SiI1VUadEs/0XnE+U=;
 b=WTjF3VGLyS3NMlM6LDEt3pnT7s7XjvHx4Br5tzOKV8YphIn47TNdfdom/T/Q7lCiuC2Mvb
 VcD6Ou7CJ5Ocqyy1PioMve0TYcSRyBfNJF/UHJgYpRj+76E1aAPfwjYNKcB71FMG3OxOVV
 eDLkW49efVlr4XrQRgFNMKqsTZK3pG4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-3I73-VTJOdqQRVFi29Rk8w-1; Mon, 07 Jun 2021 04:38:42 -0400
X-MC-Unique: 3I73-VTJOdqQRVFi29Rk8w-1
Received: by mail-ed1-f70.google.com with SMTP id
 c13-20020a50f60d0000b02903900105f127so8925513edn.22
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 01:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eV8asBhApEJWNulXwrzTUORXN1SiI1VUadEs/0XnE+U=;
 b=Zj2uJJL0BxA9iKBWhmlwTGQbtZMhpbz76kEgexqF3KdvYKgZfshUAbKqCs2gee+kp8
 BuS8TphJWs6e10CYODCPHwyrBxVD46I5g1IcdETsRy4giYWgItjyZG7V4h39PF5b7GW0
 KT4D82E2I+MLu4usihNs9OGLsAkxzg/9moGWDD+2by8lYOFzuaxjcOpLgosJC0uFp7sn
 Dp/ktpvQr88DX/JOY4i5K0x5Sk2narA0za10Y9q0uxDtj3ItkxXwtheZBCxP2s71VQlI
 0eYTRIuCcbKl5GQ4SZzxaEfcoFgeZsjnuGdFRBJpYHDYT0fv/+QTBOApYxfoJbek+4pU
 H9BA==
X-Gm-Message-State: AOAM530VanESE4vYQqN22eeYrm+qet5sr4emDZreXXOBXNZmcf25kBtV
 a4h1aMprnc0dbnPeVltG0IWxs53NwXuK9ahrpWxokpXa9CU8dqsE6lIxWeGx3NT10hAIZcmh20O
 TVyIs0CugAEFkV68=
X-Received: by 2002:a17:906:9455:: with SMTP id
 z21mr16446875ejx.491.1623055121227; 
 Mon, 07 Jun 2021 01:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGVFZseQa1+Bqyg1wf9CLhy+zrUCO44jmquFLB654tsXr8+xy1rBFYn1gxJA+ac2J0Kd7oCg==
X-Received: by 2002:a17:906:9455:: with SMTP id
 z21mr16446860ejx.491.1623055120998; 
 Mon, 07 Jun 2021 01:38:40 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id o64sm7217522eda.83.2021.06.07.01.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 01:38:40 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v7 3/9] i386: hardcode supported eVMCS version to '1'
In-Reply-To: <20210604190028.jxta4nr6cjafq4db@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-4-vkuznets@redhat.com>
 <20210603223506.no7j7jais3qixdhs@habkost.net>
 <877dja1434.fsf@vitty.brq.redhat.com>
 <20210604190028.jxta4nr6cjafq4db@habkost.net>
Date: Mon, 07 Jun 2021 10:38:39 +0200
Message-ID: <87lf7mysq8.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

> On Fri, Jun 04, 2021 at 09:28:15AM +0200, Vitaly Kuznetsov wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Thu, Jun 03, 2021 at 01:48:29PM +0200, Vitaly Kuznetsov wrote:
>> >> Currently, the only eVMCS version, supported by KVM (and described in TLFS)
>> >> is '1'. When Enlightened VMCS feature is enabled, QEMU takes the supported
>> >> eVMCS version range (from KVM_CAP_HYPERV_ENLIGHTENED_VMCS enablement) and
>> >> puts it to guest visible CPUIDs. When (and if) eVMCS ver.2 appears a
>> >> problem on migration is expected: it doesn't seem to be possible to migrate
>> >> from a host supporting eVMCS ver.2 to a host, which only support eVMCS
>> >> ver.1.
>> >
>> > Isn't it possible and safe to expose eVMCS ver.1 to the guest on
>> > a host that supports ver.2?
>> 
>> We expose the supported range, guest is free to use any eVMCS version in
>> the range (see below):
>
> Oh, I didn't notice the returned value was a range.
>
>> 
>> >
>> >> 
>> >> Hardcode eVMCS ver.1 as the result of 'hv-evmcs' enablement for now. Newer
>> >> eVMCS versions will have to have their own enablement options (e.g.
>> >> 'hv-evmcs=2').
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >> ---
>> >>  docs/hyperv.txt       |  2 +-
>> >>  target/i386/kvm/kvm.c | 16 +++++++++++-----
>> >>  2 files changed, 12 insertions(+), 6 deletions(-)
>> >> 
>> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> >> index a51953daa833..000638a2fd38 100644
>> >> --- a/docs/hyperv.txt
>> >> +++ b/docs/hyperv.txt
>> >> @@ -170,7 +170,7 @@ Recommended: hv-frequencies
>> >>  3.16. hv-evmcs
>> >>  ===============
>> >>  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
>> >> -enabled, it provides Enlightened VMCS feature to the guest. The feature
>> >> +enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
>> >>  implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
>> >>  hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
>> >>  Note: some virtualization features (e.g. Posted Interrupts) are disabled when
>> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> >> index c676ee8b38a7..d57eede5dc81 100644
>> >> --- a/target/i386/kvm/kvm.c
>> >> +++ b/target/i386/kvm/kvm.c
>> >> @@ -1490,13 +1490,19 @@ static int hyperv_init_vcpu(X86CPU *cpu)
>> >>          ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>> >>                                    (uintptr_t)&evmcs_version);
>> >>  
>> >> -        if (ret < 0) {
>> >> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> >> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> >> +        /*
>> >> +         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
>> >> +         * option sets. Note: we hardcode the maximum supported eVMCS version
>> >> +         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
>> >> +         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
>> >> +         * to be added.
>> >> +         */
>> >> +        if (ret < 0 || (uint8_t)evmcs_version > 1) {
>> >
>> > Wait, do you really want to get a fatal error every time, after a
>> > kernel upgrade?
>> >
>> 
>> Here, evmcs_version (returned by kvm_vcpu_enable_cap()) represents a
>> *range* of supported eVMCS versions:
>> 
>> (evmcs_highest_supported_version << 8) | evmcs_lowest_supported_version
>> 
>> Currently, this is 0x101 [1..1] range.
>> 
>> The '(uint8_t)evmcs_version > 1' check here means 'eVMCS v1' is no
>> longer supported by KVM. This is not going to happen any time soon, but
>> I can imagine in 10 years or so we'll be dropping v1 so the range (in
>> theory) can be [10..2] -- which would mean eVMCS ver. 1 is NOT
>> supported. And we can't proceed then.
>
> Where is this documented?  The only reference to
> KVM_CAP_HYPERV_ENLIGHTENED_VMCS I've found in linux/Documentation is this
> single sentence:
>
> | - HYPERV_CPUID_NESTED_FEATURES leaf and HV_X64_ENLIGHTENED_VMCS_RECOMMENDED
> |  feature bit are only exposed when Enlightened VMCS was previously enabled
> |  on the corresponding vCPU (KVM_CAP_HYPERV_ENLIGHTENED_VMCS).
>

It seems that KVM_CAP_HYPERV_ENLIGHTENED_VMCS's documentation is indeed
missing in KVM.

>
>> >>          ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>> >>                                    (uintptr_t)&evmcs_version);
>> >>  
>> >> -        if (ret < 0) {
>> >> -            fprintf(stderr, "Hyper-V %s is not supported by kernel\n",
>> >> -                    kvm_hyperv_properties[HYPERV_FEAT_EVMCS].desc);
>> >> +        /*
>> >> +         * KVM is required to support EVMCS ver.1. as that's what 'hv-evmcs'
>> >> +         * option sets. Note: we hardcode the maximum supported eVMCS version
>> >> +         * to '1' as well so 'hv-evmcs' feature is migratable even when (and if)
>> >> +         * ver.2 is implemented. A new option (e.g. 'hv-evmcs=2') will then have
>> >> +         * to be added.
>> >> +         */
>> >> +        if (ret < 0 || (uint8_t)evmcs_version > 1) {
>
> Can we start with something that won't need to be rewritten after we change the
> guest evmcs version range?  e.g.:
>
>     static bool evmcs_version_supported(uint16_t version, uint32_t supported)
>     {
>         uint8_t min_ver = version;
>         uint8_t max_ver = version >> 8;
>         uint8_t min_supported = supported;
>         uint8_t max_supported = supported >> 8;
>         return (min_ver >= min_supported) && (max_ver <= max_supported);
>     }
>     ...
>     #define DEFAULT_EVMCS_VERSION ((1 << 8) | 1)
>     ...
>     uint16_t evmcs_version = DEFAULT_EVMCS_VERSION;
>     int ret = kvm_vcpu_enable_cap(cs, KVM_CAP_HYPERV_ENLIGHTENED_VMCS, 0,
>                               (uintptr_t)&supported_evmcs_version);
>     if (ret < 0) {
>         fprintf(...)
>         return ret;
>     }
>     if (!evmcs_version_supported(evmcs_version, supported_evmcs_version)) {
>         fprintf(...)
>         return -ENOTSUP;
>     }
>     cpu->hyperv_nested[0] = evmcs_version;
>

Sure, I don't have anything against an attempt to make this future
proof. Will use this in v8, thanks!

-- 
Vitaly


