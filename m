Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B63928B2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:39:48 +0200 (CEST)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAcN-0005os-7r
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAan-0004v4-2B
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lmAak-0006sL-2A
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622101084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Ng+Yy1wJzudDZR6i2EAcLUGK1mQGAlVT3c0KXkWgOc=;
 b=fz3ZZIWwpdTzljUjwxsgovR4RD9P+ifXpGRFXCDPqh0PCRgp13kw4Sl0bd+o6mkgnZ1Wim
 MPtiubn/WTyqGh//a6YWJscjNtlzeUvEQKqHKN0djKAM1bgrb4cc3RSazCq/ZqF8F9Xnvo
 xivsEhzq0xrJ13kAUAbLnoXfnvTT1s4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-IzURjMRgMBedYQqTGnJzOA-1; Thu, 27 May 2021 03:38:02 -0400
X-MC-Unique: IzURjMRgMBedYQqTGnJzOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 b68-20020a1c80470000b02901846052c7a7so1031366wmd.2
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=2Ng+Yy1wJzudDZR6i2EAcLUGK1mQGAlVT3c0KXkWgOc=;
 b=SNnMNbjGnLJnWwlmuS0F24qjw9W1ruW8xKS1u1IVQHkX5lMjcXXJystFd+ohgDYCVL
 zkw5sCpyUtg+uvb/XgFFV3CfOtXDvhOmkrXPcAqMSjGQaifvL75bApV0DdHVvrjfp1zV
 F2vSYNUe/D8S/l89u7GlYBJoZaSvS/TfhYKD/7gfRmn/REpyOMIAHnOo82N75wP2xTUC
 CJK1nLFWYilyVlv9WSaK6lyBhttMleLZ146QnhSSqZdwLEJiCr7t2KYJTVpXd99XOpP4
 k/fld0LLnQPQfYO4piG29AiBYEzNsYnovkXTew5tqDc6pqkG+M593SdZWKWqGyp9+qXi
 Ganw==
X-Gm-Message-State: AOAM532NLwvw625OVAVVdg9n+Ug9WqUO7yREc9loUr0e0Vd+I9SmHGJF
 XBahAvTi8rpo8lZVE17BSnYG1h9yys2jpCw4Qc6z9LaU0vfLIRxVH4eq685lEtY2PDitRfs+ss0
 KkYL5zVFNy+cRxKg=
X-Received: by 2002:adf:f50e:: with SMTP id q14mr1832705wro.408.1622101081743; 
 Thu, 27 May 2021 00:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ3tyy7BMpZbj7278mcyh9Pig2Tb6Zekc8kSq8tep7AwhHpKWGzjCU6GlTeFucLSBFzo929g==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr1832668wro.408.1622101081325; 
 Thu, 27 May 2021 00:38:01 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id f18sm1745014wmc.40.2021.05.27.00.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:38:00 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v6 17/19] i386: HV_HYPERCALL_AVAILABLE privilege bit is
 always needed
In-Reply-To: <20210526170530.ugirlteyzamogysz@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-18-vkuznets@redhat.com>
 <20210521220637.kg6g7lfvpwasnzez@habkost.net>
 <878s44723s.fsf@vitty.brq.redhat.com>
 <20210526170530.ugirlteyzamogysz@habkost.net>
Date: Thu, 27 May 2021 09:37:59 +0200
Message-ID: <87im347hk8.fsf@vitty.brq.redhat.com>
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

> On Mon, May 24, 2021 at 02:22:47PM +0200, Vitaly Kuznetsov wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>> 
>> > On Thu, Apr 22, 2021 at 06:11:28PM +0200, Vitaly Kuznetsov wrote:
>> >> According to TLFS, Hyper-V guest is supposed to check
>> >> HV_HYPERCALL_AVAILABLE privilege bit before accessing
>> >> HV_X64_MSR_GUEST_OS_ID/HV_X64_MSR_HYPERCALL MSRs but at least some
>> >> Windows versions ignore that. As KVM is very permissive and allows
>> >> accessing these MSRs unconditionally, no issue is observed. We may,
>> >> however, want to tighten the checks eventually. Conforming to the
>> >> spec is probably also a good idea.
>> >> 
>> >> Add HV_HYPERCALL_AVAILABLE to all 'leaf' features with no dependencies.
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >
>> > Are all VMs being created with HV_HYPERCALL_AVAILABLE unset,
>> > today?
>> >
>> 
>> No, we have HV_HYPERCALL_AVAILABLE encoded in 'hv-relaxed','hv-vapic'
>> and 'hv-time' features but not 
>> 
>> 
>> > Wouldn't it be simpler to simply add a new
>> > HYPERV_FEAT_HYPERCALL_AVAILABLE bit to hyperv_features, and
>> > enabling it by default?
>> >
>> 
>> We could do that but as I note above, we already have it for three
>> features.
>
> Do we have any cases where we do not want to enable
> HV_HYPERCALL_AVAILABLE?
>
> Would it be OK to just hardcoded it in hyperv_fill_cpuids() like
> we do with HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE?
>

struct kvm_hyperv_properties[] serves two purposes:
1) Set corresponding guest visible CPUID bits when certain features are
enabled.

2) Check, that KVM supports certain features before we expose them to the
  guest.

Whatever we hardcode in hyperv_fill_cpuids() gives us 1) but not 2). For
this particular bit it probably doesn't matter as even the oldest
supported kernel (v4.5) has it. That said, I'm OK with moving this to
hyperv_fill_cpuids().

>> 
>> 
>> > We don't necessarily need to make it configurable by the user,
>> > but probably it would be a good idea to keep the bit unset by
>> > default on older machine types.  Even if guests don't mind seeing
>> > the bit changing under their feet, it would make it easier for
>> > automated test cases that check for unexpected changes in raw
>> > CPUID data.
>> 
>> I see current situation as a bug. While most likely nobody runs with
>> a configuration like 'hv-vpindexem,hv-synic' it is still valid. And if KVM
>> was enforcing the features (not yet), Windows would've just crashed in
>> early boot. Normal configurations will likely always include at least
>> 'hv-time' which has HYPERV_FEAT_HYPERCALL_AVAILABLE enabled.
>> 
>> That being said, I'm not sure we need to maintain 'bug compatibility'
>> even for older machine types. I'm also not aware of any specific tests
>> for such 'crazy' configurations out there. The last patch of the series
>> adds a very simple test to qtest but this is about it.
>
> If you are 100% sure the CPUID change can't crash or confuse a
> guest, then that's OK.  I agree that bug compatibility is not a
> must if the bit is simply ignored by most guests and by KVM
> emulation code.

Strictly speaking, this bit has to be set or the guest can't use any of
the Hyper-V features. It was proven that at least certain Windows
versions don't even check it assuming it's always set. Moreover, we
already set it for some very basic enlightenments ('hv-time') so there's
going to be no change at all for real world configutations.

>
>
>> 
>> >
>> >
>> >> ---
>> >>  target/i386/kvm/kvm.c | 15 +++++++++------
>> >>  1 file changed, 9 insertions(+), 6 deletions(-)
>> >> 
>> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> >> index 2c1a77f9b00f..d81451276cd8 100644
>> >> --- a/target/i386/kvm/kvm.c
>> >> +++ b/target/i386/kvm/kvm.c
>> >> @@ -835,6 +835,8 @@ static struct {
>> >>      [HYPERV_FEAT_CRASH] = {
>> >>          .desc = "crash MSRs (hv-crash)",
>> >>          .flags = {
>> >> +            {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> +             .bits = HV_HYPERCALL_AVAILABLE},
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>> >>               .bits = HV_GUEST_CRASH_MSR_AVAILABLE}
>> >>          }
>> >> @@ -843,28 +845,28 @@ static struct {
>> >>          .desc = "reset MSR (hv-reset)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_RESET_AVAILABLE}
>> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_RESET_AVAILABLE}
>> >>          }
>> >>      },
>> >>      [HYPERV_FEAT_VPINDEX] = {
>> >>          .desc = "VP_INDEX MSR (hv-vpindex)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_VP_INDEX_AVAILABLE}
>> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_INDEX_AVAILABLE}
>> >>          }
>> >>      },
>> >>      [HYPERV_FEAT_RUNTIME] = {
>> >>          .desc = "VP_RUNTIME MSR (hv-runtime)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_VP_RUNTIME_AVAILABLE}
>> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_VP_RUNTIME_AVAILABLE}
>> >>          }
>> >>      },
>> >>      [HYPERV_FEAT_SYNIC] = {
>> >>          .desc = "synthetic interrupt controller (hv-synic)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_SYNIC_AVAILABLE}
>> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_SYNIC_AVAILABLE}
>> >>          }
>> >>      },
>> >>      [HYPERV_FEAT_STIMER] = {
>> >> @@ -879,7 +881,7 @@ static struct {
>> >>          .desc = "frequency MSRs (hv-frequencies)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_ACCESS_FREQUENCY_MSRS},
>> >> +             .bits = HV_HYPERCALL_AVAILABLE | HV_ACCESS_FREQUENCY_MSRS},
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EDX,
>> >>               .bits = HV_FREQUENCY_MSRS_AVAILABLE}
>> >>          }
>> >> @@ -888,7 +890,8 @@ static struct {
>> >>          .desc = "reenlightenment MSRs (hv-reenlightenment)",
>> >>          .flags = {
>> >>              {.func = HV_CPUID_FEATURES, .reg = R_EAX,
>> >> -             .bits = HV_ACCESS_REENLIGHTENMENTS_CONTROL}
>> >> +             .bits = HV_HYPERCALL_AVAILABLE |
>> >> +             HV_ACCESS_REENLIGHTENMENTS_CONTROL}
>> >>          }
>> >>      },
>> >>      [HYPERV_FEAT_TLBFLUSH] = {
>> >> -- 
>> >> 2.30.2
>> >> 
>> 
>> -- 
>> Vitaly
>> 

-- 
Vitaly


