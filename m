Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB612F751C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:22:25 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LJI-0005QW-JR
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l0LHT-0000ye-MC
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:20:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l0LHR-0003PY-H1
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5uTcbCtXXuxy+wkwjOXGdnQ83abvxvdStE5DypZ41ng=;
 b=K7xxrb1gwCqZorwdgLBTaBcd5GEO3Hh4BEvj0QKmVcEp6iuTpDgBP0hVz19KNVVH0xYX5b
 +eqodBZ8bJ6NAcKtrWlqy/gqeQv2hwjmJ0eSvY7X/6KAOMTPQwY1MZVtNzEZ1ZJkduzrXq
 cuZRn4h8mhI3v3309iuZwFKdIrc1Yz8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-hdOvbIt0NfmoJObLFAdKzA-1; Fri, 15 Jan 2021 04:20:26 -0500
X-MC-Unique: hdOvbIt0NfmoJObLFAdKzA-1
Received: by mail-ed1-f72.google.com with SMTP id y6so1675986edc.17
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5uTcbCtXXuxy+wkwjOXGdnQ83abvxvdStE5DypZ41ng=;
 b=WITFFczGBQwUt0w7NQG6dxcQHQrJ0pbh9SabXMgDPHkB+tb0qYAtEfv6/dD4HCRaEj
 sb+hW44MYXVA0dZ/yFq1aMC5YDBfy1OTdBia19CNladVAdWwyXoD3vH2mpeG01tHHWze
 4w8yLkEiBeFoptK0qOD7aD3l6X4SsCiYaGHM3s/s92sjPBP+buK3d2k2TxG/M42r++Ww
 jryCMd3dmEIXyUzTxRURxdKPovJCQME0Fumr3+xdsNK9Zq41AeOUb200Dx919I/qt+P1
 5H8GMX5y2DcK6oWvokJlIiReckxeQDbLWCPvCdfNqveS5BJa8EZRdoR+pvCy8kG9ZE0U
 dJMA==
X-Gm-Message-State: AOAM5329e+SlMgxxnR7+1lPfxCGEeLbMU7dyw1Ph6RcQdCfTbfl8I0my
 CDWyW9omL1G3TSOn33NvsBdo/wy7P6dQHwzVPowfP07b/Z7HxvwoFvD8+Y5hU92ikfWEpktV0l8
 qiYLB5eYdbRkF5iE=
X-Received: by 2002:a17:906:d98:: with SMTP id
 m24mr4320669eji.428.1610702425290; 
 Fri, 15 Jan 2021 01:20:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyXXgyzMmfIkRACUSyZvd35FFpPkMh7mLoM4mNlCVkxL0hI0MAmyGXssqY7qGIvZrN1B5gF6g==
X-Received: by 2002:a17:906:d98:: with SMTP id
 m24mr4320663eji.428.1610702425007; 
 Fri, 15 Jan 2021 01:20:25 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id k16sm2974569ejd.78.2021.01.15.01.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 01:20:24 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
In-Reply-To: <20210115031142.7c171a7f@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com>
Date: Fri, 15 Jan 2021 10:20:23 +0100
Message-ID: <87h7ni7e08.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Thu,  7 Jan 2021 16:14:49 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
>> requires listing all currently supported enlightenments ("hv-*" CPU
>> features) explicitly. We do have 'hv-passthrough' mode enabling
>> everything but it can't be used in production as it prevents migration.
>> 
>> Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
>> Hyper-V enlightenments. Later, when new enlightenments get implemented,
>> compat_props mechanism will be used to disable them for legacy machine types,
>> this will keep 'hv-default=on' configurations migratable.
>> 
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>>  docs/hyperv.txt   | 16 +++++++++++++---
>>  target/i386/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  target/i386/cpu.h |  5 +++++
>>  3 files changed, 56 insertions(+), 3 deletions(-)
>> 
>> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> index 5df00da54fc4..a54c066cab09 100644
>> --- a/docs/hyperv.txt
>> +++ b/docs/hyperv.txt
>> @@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
>>  
>>  2. Setup
>>  =========
>> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
>> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
>> +All currently supported Hyper-V enlightenments can be enabled by specifying
>> +'hv-default=on' CPU flag:
>>  
>> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
>> +
>> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
>> +e.g:
>> +
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...
>
> I'd put here not '...' but rather recommended list of flags, and update
> it every time when new feature added if necessary.
>

This is an example of fine-grained enablement, there is no point to put
all the existing flags there (hv-default is the only recommended way
now, the rest is 'expert'/'debugging').

> (not to mention that if we had it to begin with, then new 'hv-default' won't
> be necessary, I still see it as functionality duplication but I will not oppose it)
>

Unfortunately, upper layer tools don't read this doc and update
themselves to enable new features when they appear. Similarly, if when
these tools use '-machine q35' they get all the new features we add
automatically, right?

>
>> +It is also possible to disable individual enlightenments from the default list,
>> +this can be used for debugging purposes:
>> +
>> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
>>  
>>  Sometimes there are dependencies between enlightenments, QEMU is supposed to
>>  check that the supplied configuration is sane.
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 48007a876e32..99338de00f78 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4552,6 +4552,24 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
>>      cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
>>  }
>>  
>> +static bool x86_hv_default_get(Object *obj, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    return cpu->hyperv_default;
>> +}
>> +
>> +static void x86_hv_default_set(Object *obj, bool value, Error **errp)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    cpu->hyperv_default = value;
>> +
>> +    if (value) {
>> +        cpu->hyperv_features |= cpu->hyperv_default_features;
>
> s/|="/=/ please,
> i.e. no option overrides whatever was specified before to keep semantics consistent.
>

Hm,

this doesn't matter for the most recent machine type as
hyperv_default_features has all the features but imagine you're running
an older machine type which doesn't have 'hv_feature'. Now your
suggestion is 

if I do:

'hv_default,hv_feature=on' I will get "hyperv_default_features | hv_feature"

but if I do

'hv_feature=on,hv_default' I will just get 'hyperv_default_features'
(as hv_default enablement will overwrite everything)

How is this consistent?

>> +    }
>> +}
>> +
>>  /* Generic getter for "feature-words" and "filtered-features" properties */
>>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>>                                        const char *name, void *opaque,
>> @@ -6955,10 +6973,26 @@ static void x86_cpu_initfn(Object *obj)
>>      object_property_add_alias(obj, "pause_filter", obj, "pause-filter");
>>      object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
>>      object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
>> +    object_property_add_alias(obj, "hv_default", obj, "hv-default");
>>  
>>      if (xcc->model) {
>>          x86_cpu_load_model(cpu, xcc->model);
>>      }
>> +
>> +    /* Hyper-V features enabled with 'hv-default=on' */
>> +    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
>> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
>> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
>> +
>> +    /* Enlightened VMCS is only available on Intel/VMX */
>> +    if (kvm_hv_evmcs_available()) {
>> +        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
>> +    }
> what if VVM is migrated to another host without evmcs,
> will it change CPUID?
>

Evmcs is tightly coupled with VMX, we can't migrate when it's not
there.

>>  }
>>  
>>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
>> @@ -7285,6 +7319,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>                                x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
>>  #endif
>>  
>> +    object_class_property_add_bool(oc, "hv-default",
>> +                              x86_hv_default_get,
>> +                              x86_hv_default_set);
>> +
>>      for (w = 0; w < FEATURE_WORDS; w++) {
>>          int bitnr;
>>          for (bitnr = 0; bitnr < 64; bitnr++) {
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 6220cb2cabb9..8a484becb6b9 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -1657,6 +1657,11 @@ struct X86CPU {
>>      bool hyperv_synic_kvm_only;
>>      uint64_t hyperv_features;
>>      bool hyperv_passthrough;
>> +
>> +    /* 'hv-default' enablement */
>> +    uint64_t hyperv_default_features;
>> +    bool hyperv_default;
>> +
>>      OnOffAuto hyperv_no_nonarch_cs;
>>      uint32_t hyperv_vendor_id[3];
>>      uint32_t hyperv_interface_id[4];
>

-- 
Vitaly


