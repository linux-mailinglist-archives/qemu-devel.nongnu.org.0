Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401812FD2D8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:40:17 +0100 (CET)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Eee-0002JY-BO
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l2Ed8-0001uH-Sm
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1l2Ed6-0002rQ-JL
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611153519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPiZcuGe7uNNLzD25eg8IhgfeIRwSIApCIcDOC8+pLc=;
 b=MGniwW7gZifR6kfsiLQUyfiY1iNGIQyUWf8b8PZ5oKWozwXFjsvI5siYXJejNmKnHnO2EE
 S4tLHiyO5GI6BFjXdCxiE5sH7EuxhtUmwFycOzsOhB98ZALAwxRUV3tRpEf+rqTnp9digw
 tJIfKt4xzm9UpSTZl7IwzbvFS9kOIKI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-g7iBlkECNKCR-r0V-JtdTw-1; Wed, 20 Jan 2021 09:38:37 -0500
X-MC-Unique: g7iBlkECNKCR-r0V-JtdTw-1
Received: by mail-ed1-f70.google.com with SMTP id f4so5306187eds.5
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PPiZcuGe7uNNLzD25eg8IhgfeIRwSIApCIcDOC8+pLc=;
 b=sfkW8A+B1r3a02xhnXPeRWacIQ/JqRsVgfeWvQh3VWoRUewSgxCa0Y/hjf533jD4vN
 /oacPM4Zd1ZE5pXMYgjC5EYlu4WwCvpY86SrbiXoXgFERcs6OI5qSFUE862NHuKfv6lA
 vPE9TZkrE2fjY4H0unO3Nr47hOrybEoKLyLDCdZlrfQcjAUbrxloWW5hYQjZHtFXty7f
 bJNkY0KtBHeHGFZByYlID3GfxS7nI6qN0fj/beHowDsoZbgit280V8mgu6B5Rw2MNUm7
 30qyn6GEy0zr6TwIyr5qsz+WU6MB6Uae3LZ3hzdGlP+SHigR9JM82N9CKFgTnessAm9t
 vZXg==
X-Gm-Message-State: AOAM533VmLx6Xb3bBG6Lr0kE3tHwaVBNSFEwIJwwuXTW6NovE8yKJ7Td
 pUSgr2nvPYyxtiDFSLzO67J0gicUFYoPCkHE7NTvOK8Y156+LkaRJKJG8010n1y5Z5UATMuOV4j
 Pd1z51WW+86Bhr60=
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr2297529ejb.149.1611153516010; 
 Wed, 20 Jan 2021 06:38:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvgCpQWrP8/Q9NkN3QgqrflW205B558GT4Lho0VsXLHR4vByaA/vEcdDxicAF4h1r4BYdb1g==
X-Received: by 2002:a17:906:c7d2:: with SMTP id
 dc18mr2297516ejb.149.1611153515695; 
 Wed, 20 Jan 2021 06:38:35 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id k2sm998482ejp.6.2021.01.20.06.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:38:34 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 18/19] i386: provide simple 'hv-default=on' option
In-Reply-To: <20210120141312.0a1e6c33@redhat.com>
References: <20210107150640.539239-1-vkuznets@redhat.com>
 <20210107151449.541062-1-vkuznets@redhat.com>
 <20210115031142.7c171a7f@redhat.com> <87h7ni7e08.fsf@vitty.brq.redhat.com>
 <20210120141312.0a1e6c33@redhat.com>
Date: Wed, 20 Jan 2021 15:38:33 +0100
Message-ID: <874kjb65cm.fsf@vitty.brq.redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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

> On Fri, 15 Jan 2021 10:20:23 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Thu,  7 Jan 2021 16:14:49 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >  
>> >> Enabling Hyper-V emulation for a Windows VM is a tiring experience as it
>> >> requires listing all currently supported enlightenments ("hv-*" CPU
>> >> features) explicitly. We do have 'hv-passthrough' mode enabling
>> >> everything but it can't be used in production as it prevents migration.
>> >> 
>> >> Introduce a simple 'hv-default=on' CPU flag enabling all currently supported
>> >> Hyper-V enlightenments. Later, when new enlightenments get implemented,
>> >> compat_props mechanism will be used to disable them for legacy machine types,
>> >> this will keep 'hv-default=on' configurations migratable.
>> >> 
>> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> >> ---
>> >>  docs/hyperv.txt   | 16 +++++++++++++---
>> >>  target/i386/cpu.c | 38 ++++++++++++++++++++++++++++++++++++++
>> >>  target/i386/cpu.h |  5 +++++
>> >>  3 files changed, 56 insertions(+), 3 deletions(-)
>> >> 
>> >> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
>> >> index 5df00da54fc4..a54c066cab09 100644
>> >> --- a/docs/hyperv.txt
>> >> +++ b/docs/hyperv.txt
>> >> @@ -17,10 +17,20 @@ compatible hypervisor and use Hyper-V specific features.
>> >>  
>> >>  2. Setup
>> >>  =========
>> >> -No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
>> >> -QEMU, individual enlightenments can be enabled through CPU flags, e.g:
>> >> +All currently supported Hyper-V enlightenments can be enabled by specifying
>> >> +'hv-default=on' CPU flag:
>> >>  
>> >> -  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
>> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default ...
>> >> +
>> >> +Alternatively, it is possible to do fine-grained enablement through CPU flags,
>> >> +e.g:
>> >> +
>> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-relaxed,hv-vpindex,hv-time ...  
>> >
>> > I'd put here not '...' but rather recommended list of flags, and update
>> > it every time when new feature added if necessary.
>> >  
>
> 1)
>  
>> This is an example of fine-grained enablement, there is no point to put
>> all the existing flags there (hv-default is the only recommended way
>> now, the rest is 'expert'/'debugging').
> so users are kept in dark what hv-default disables/enables (and it might depend
> on machine version on top that). Doesn't look like a good documentation to me
> (sure everyone can go and read source code for it and try to figure out how
> it's supposed to work)

'hv-default' enables *all* currently supported enlightenments. When
using with an old machine type, it will enable *all* Hyper-V
enlightenmnets which were supported when the corresponding machine type
was released. I don't think we document all other cases when a machine
type is modified (i.e. where can I read how pc-q35-5.1 is different from
pc-q35-5.0 if I refuse to read the source code?)

>
>>
>> > (not to mention that if we had it to begin with, then new 'hv-default' won't
>> > be necessary, I still see it as functionality duplication but I will not oppose it)
>> >  
>> 
>> Unfortunately, upper layer tools don't read this doc and update
>> themselves to enable new features when they appear.
> rant: (just merge all libvirt into QEMU, and make VM configuration less low-level.
> why stop there, just merge with yet another upper layer, it would save us a lot
> on communication protocols and simplify VM creation even more,
> and no one will have to read docs and write anything new on top.)
> There should be limit somewhere, where QEMU job ends and others pile hw abstraction
> layers on top of it.

We have '-machine q35' and we don't require to list all the devices from
it. We have '-cpu Skylake-Server' and we don't require to configure all
the features manually. Why can't we have similar enablement for Hyper-V
emulation where we can't even see a real need for anything but 'enable
everything' option?

There is no 'one libvirt to rule them all' (fortunately or
unfortunately). And sometimes QEMU is the uppermost layer and there's no
'libvirt' on top of it, this is also a perfectly valid use-case.

>
>> Similarly, if when these tools use '-machine q35' they get all the new features we add
>> automatically, right?
> it depends, in case of CPUs, new features usually 'off' by default
> for existing models. In case of bugs, features sometimes could be
> flipped and versioned machines were used to keep broken CPU models
> on old machine types.
>

That's why I was saying that Hyper-V enlightenments hardly resemble
'hardware' CPU features.

>    
>> >> +It is also possible to disable individual enlightenments from the default list,
>> >> +this can be used for debugging purposes:
>> >> +
>> >> +  qemu-system-x86_64 --enable-kvm --cpu host,hv-default=on,hv-evmcs=off ...
>> >>  
>> >>  Sometimes there are dependencies between enlightenments, QEMU is supposed to
>> >>  check that the supplied configuration is sane.
>> >> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> >> index 48007a876e32..99338de00f78 100644
>> >> --- a/target/i386/cpu.c
>> >> +++ b/target/i386/cpu.c
>> >> @@ -4552,6 +4552,24 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
>> >>      cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
>> >>  }
>> >>  
>> >> +static bool x86_hv_default_get(Object *obj, Error **errp)
>> >> +{
>> >> +    X86CPU *cpu = X86_CPU(obj);
>> >> +
>> >> +    return cpu->hyperv_default;
>> >> +}
>> >> +
>> >> +static void x86_hv_default_set(Object *obj, bool value, Error **errp)
>> >> +{
>> >> +    X86CPU *cpu = X86_CPU(obj);
>> >> +
>> >> +    cpu->hyperv_default = value;
>> >> +
>> >> +    if (value) {
>> >> +        cpu->hyperv_features |= cpu->hyperv_default_features;  
>> >
>> > s/|="/=/ please,
>> > i.e. no option overrides whatever was specified before to keep semantics consistent.
>> >  
>> 
>> Hm,
>> 
>
>> this doesn't matter for the most recent machine type as
>> hyperv_default_features has all the features but imagine you're running
>> an older machine type which doesn't have 'hv_feature'. Now your
> normally one shouldn't use new feature with old machine type as it makes
> VM non-migratable to older QEMU that has this machine type but not this feature.
>
> nitpicking:
>   according to (1) user should not use 'hv_feature' on old machine since
>   hv_default should cover all their needs (well they don't know what
> hv_default actually is).

Normally yes but I can imagine sticking to some old machine type for
other-than-hyperv-enlightenments purposes and still wanting to add a
newly introduced enlightenment. Migration is not always a must.

>
>> suggestion is 
>> 
>> if I do:
>> 
>> 'hv_default,hv_feature=on' I will get "hyperv_default_features | hv_feature"
>> 
>> but if I do
>> 
>> 'hv_feature=on,hv_default' I will just get 'hyperv_default_features'
>> (as hv_default enablement will overwrite everything)
>> 
>> How is this consistent?
> usual semantics for properties, is that the latest property overwrites,
> the previous property value parsed from left to right.
> (i.e. if one asked for hv_default, one gets it related CPUID bit set/unset,
> if one needs more than that one should add more related features after that.
>

This semantics probably doesn't apply to 'hv-default' case IMO as my
brain refuses to accept the fact that

'hv_default,hv_feature' != 'hv_feature,hv_default'

which should express the same desire 'the default set PLUS the feature I
want'.

I think I prefer sanity over purity in this case.

>
>> >> +    }
>> >> +}
>> >> +
>> >>  /* Generic getter for "feature-words" and "filtered-features" properties */
>> >>  static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
>> >>                                        const char *name, void *opaque,
>> >> @@ -6955,10 +6973,26 @@ static void x86_cpu_initfn(Object *obj)
>> >>      object_property_add_alias(obj, "pause_filter", obj, "pause-filter");
>> >>      object_property_add_alias(obj, "sse4_1", obj, "sse4.1");
>> >>      object_property_add_alias(obj, "sse4_2", obj, "sse4.2");
>> >> +    object_property_add_alias(obj, "hv_default", obj, "hv-default");
>> >>  
>> >>      if (xcc->model) {
>> >>          x86_cpu_load_model(cpu, xcc->model);
>> >>      }
>> >> +
>> >> +    /* Hyper-V features enabled with 'hv-default=on' */
>> >> +    cpu->hyperv_default_features = BIT(HYPERV_FEAT_RELAXED) |
>> >> +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> >> +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> >> +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> >> +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> >> +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> >> +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_IPI) |
>> >> +        BIT(HYPERV_FEAT_STIMER_DIRECT);
>> >> +
>> >> +    /* Enlightened VMCS is only available on Intel/VMX */
>> >> +    if (kvm_hv_evmcs_available()) {
>> >> +        cpu->hyperv_default_features |= BIT(HYPERV_FEAT_EVMCS);
>> >> +    }  
>> > what if VVM is migrated to another host without evmcs,
>> > will it change CPUID?
>> >  
>> 
>> Evmcs is tightly coupled with VMX, we can't migrate when it's not
>> there.
>
> Are you saying mgmt will check and refuse to migrate to such host?
>

Is it possible to migrate a VM from a VMX-enabled host to a VMX-disabled
one if VMX feature was exposed to the VM? Probably not, you will fail to
create a VM on the destination host. Evmcs doesn't change anything in
this regard, there are no hosts where VMX is available but EVMCS is not.

>> 
>> >>  }
>> >>  
>> >>  static int64_t x86_cpu_get_arch_id(CPUState *cs)
>> >> @@ -7285,6 +7319,10 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>> >>                                x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
>> >>  #endif
>> >>  
>> >> +    object_class_property_add_bool(oc, "hv-default",
>> >> +                              x86_hv_default_get,
>> >> +                              x86_hv_default_set);
>> >> +
>> >>      for (w = 0; w < FEATURE_WORDS; w++) {
>> >>          int bitnr;
>> >>          for (bitnr = 0; bitnr < 64; bitnr++) {
>> >> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> >> index 6220cb2cabb9..8a484becb6b9 100644
>> >> --- a/target/i386/cpu.h
>> >> +++ b/target/i386/cpu.h
>> >> @@ -1657,6 +1657,11 @@ struct X86CPU {
>> >>      bool hyperv_synic_kvm_only;
>> >>      uint64_t hyperv_features;
>> >>      bool hyperv_passthrough;
>> >> +
>> >> +    /* 'hv-default' enablement */
>> >> +    uint64_t hyperv_default_features;
>> >> +    bool hyperv_default;
>> >> +
>> >>      OnOffAuto hyperv_no_nonarch_cs;
>> >>      uint32_t hyperv_vendor_id[3];
>> >>      uint32_t hyperv_interface_id[4];  
>> >  
>> 
>

-- 
Vitaly


