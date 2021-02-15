Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D2C31C135
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:13:16 +0100 (CET)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBiN1-0003HR-CG
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBiL0-00023q-RV
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:11:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lBiKy-0006iK-R0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613412667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L2qzIoz+S9hcnKhuRT0f9YVC+cuAmXHsGV8FmJn2QcA=;
 b=XkcOCNDbbEx7l8kAD5n0flmbQDC684YRZzN+o9c/p3AfSV8iArP7mqEJSGraFNdNRy/ss3
 uZaItbYZfqqq172j6ORZYyvBQls/fR51kBHoMYOV4VLKot0FTt2gI9u7UigNd8tqtKlwat
 +zV9qZISnIJgHVryLC6IlWoEa0xxms4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-8mPXBu7HNcqrOU-qRBH9Lw-1; Mon, 15 Feb 2021 13:11:05 -0500
X-MC-Unique: 8mPXBu7HNcqrOU-qRBH9Lw-1
Received: by mail-ed1-f70.google.com with SMTP id bo11so5792071edb.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=L2qzIoz+S9hcnKhuRT0f9YVC+cuAmXHsGV8FmJn2QcA=;
 b=mKVoFg1YXM4j1eDBus7wQOwEehAsJhezr5nry4YBn+FmhVkvyaO+Sun5uFXKO7Lm7N
 pM0q3ndOza+IR7BKJkDd2N8bzNocsWAxpUR1Y5XkkocjD8Wd9r0hSWALhzQWU9W+Dg1e
 sq/zE/2mJkyUn+bLwXOMw0/NAMwO7qfHFrJO+KnM5jhKJv5LKv4MQTmAr7Jr5uKfiWvB
 DAplhzAgErb8c/NmJy9r96H/FmXuIx13nPXsAFYFJc8690XyNIpbCzEb5LPLQM56DSyd
 COI1+PcW8h9TKp+MWZT7i3fzgXExHYrRsaAFeppk0N0i2Q9e8KIiiQAnYG/guKvYIUan
 TT0g==
X-Gm-Message-State: AOAM531VjJ5p+Jgxaz92AHBpbbsBawGtwh1InPvntYLyiQnnD7MTt0zr
 jsYsZy4Yie60dKSdWA+NYmgiF/tWKXywFFkUeW7OGSSm7IM6x4Ev8XNR4/TxDJ+zpQuRxFLG1Gl
 GJxvvCBuliKxoKPs=
X-Received: by 2002:a17:906:d10c:: with SMTP id
 b12mr7548615ejz.477.1613412664723; 
 Mon, 15 Feb 2021 10:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcqFq7/wRTnWygX8MXQW4YSPXcn3Wn5Ea5E2XyUX4BDnlp/HsBLE1rOTFCzstA4h+4e4x+0g==
X-Received: by 2002:a17:906:d10c:: with SMTP id
 b12mr7548593ejz.477.1613412664472; 
 Mon, 15 Feb 2021 10:11:04 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id op10sm1461505ejb.98.2021.02.15.10.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 10:11:03 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210215180106.7e573e6a@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com> <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com>
Date: Mon, 15 Feb 2021 19:11:03 +0100
Message-ID: <87sg5xjj60.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

>> 
>> We need to distinguish because that would be sane.
>> 
>> Enlightened VMCS is an extension to VMX, it can't be used without
>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,
> ...
>> That bein said, if
>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
>> there is a problem with explicit enablement: what should
>> 
>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
>> sound sane to me.
> based on above I'd error out is user asks for unsupported option
> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out

That's what I keep telling you but you don't seem to listen. 'Scratch
CPU' can't possibly help with this use-case because when you parse 

'hv-passthrough,hv-evmcs,vmx=off' you

1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
host.

2) 'hv-evmcs' -> keep EVMCS bit '1'

3) 'vmx=off' -> you have no idea where EVMCS bit came from.

We have to remember which options were aquired from the host and which
were set explicitly by the user. Ok, you can replace
'hyperv_features_on' with 'evmcs_was_explicitly_requested' but how is it
better?
 
>
> if later on we find usecase for VMX=off + hv-evmcs=on,
> we will be able to drop error without affecting existing users,
> but not other way around.
>
>> >> Moreover, instead of just adding two 'u64's we're now doing an ioctl
>> >> which can fail, be subject to limits,... Creating and destroying a CPU
>> >> is also slow. Sorry, I hardly see how this is better, maybe just from
>> >> 'code purity' point of view.  
>> > readable and easy to maintain code is not a thing to neglect.  
>> 
>> Of couse, but 'scratch CPU' idea is not a good design decision, it is an
>> ugly hack we should get rid of in ARM land, not try bringing it to other
>> architectures. Generally, KVM should allow to query all its capabilities
>> without the need to create a vCPU or, if not possible, we should create
>> 'real' QEMU VCPUs and use one/all of the to query capabilities, avoiding
>> 'scratch' because:
>> - Creating and destroying a vCPU makes VM startup slower, much
>> slower. E.g. for a single-CPU VM you're doubling the time required to
>> create vCPUs!
>> - vCPUs in KVM are quite memory consuming. Just 'struct kvm_vcpu_arch'
>> was something like 12kb last time I looked at it. 
>> 
>> I have no clue why scratch vCPUs were implemented on ARM, however, I'd
>> very much want us to avoid doing the same on x86. We do have use-cases
>> where startup time and consumed memory is important. There is a point in
>> limiting ioctls for security reasons (e.g. if I'm creating a single vCPU
>> VM I may want to limit userspace process to one and only one
>> KVM_CREATE_VCPU call).
> it should be possible to reuse scratch VCPU (kvm file descriptor) as
> the first CPU of VM, if there is a will/need, without creating unnecessary overhead.
> I don't like scratch CPU either but from my pov it's a lesser evil to
> spawning custom parser every time someone fills like it.

I respectfully disagree.

>
>
>> Now to the code you complain about. The 'hard to read and maintain' code
>> is literaly this:
>> 
>> +static void x86_hv_feature_set(Object *obj, bool value, int feature)
>> +{
>> +    X86CPU *cpu = X86_CPU(obj);
>> +
>> +    if (value) {
>> +        cpu->hyperv_features |= BIT(feature);
>> +        cpu->hyperv_features_on |= BIT(feature);
>> +        cpu->hyperv_features_off &= ~BIT(feature);
>> +    } else {
>> +        cpu->hyperv_features &= ~BIT(feature);
>> +        cpu->hyperv_features_on &= ~BIT(feature);
>> +        cpu->hyperv_features_off |= BIT(feature);
>> +    }
>> +}
> It's not just that code but the rest that uses above variables to
> get final hyperv_features feature set. There is a lot of invariants
> that are hidden in hv specific code that you put in hyperv kvm
> specific part.

Could you give an example please?

>
> btw why can't we get supported hyperv_features in passthrough mode
> during time we initialize KVM (without a vCPU)?

I think I already explained that: KVM_GET_SUPPORTED_HV_CPUID works on
KVM fd from 5.11, it requires a vCPU prior to that.

>
>> I can add as many comments here as needed, however, I don't see what
>> requires additional explanaition. We just want to know two things:
>> - What's the 'effective' setting of the control
>> - Was it explicitly enabled or disabled on the command line.
>> 
>> Custom parsers are not new in QEMU and they're not going anywhere I
>> believe. There are options with simple enablent and there are some with
>> additional considerations. Trying to make CPU objects somewhat 'special'
>> by forcing all options to be of type-1 (and thus crippling user
>> experience) is not the way to go IMHO. I'd very much like us to go in
>> another direction, make our option parser better so my very simple
>> use-case is covered 'out-of-the-box'.
> there is a lot of effort spent on getting rid of custom parsers that
> QEMU accumulated over years. Probably there were good reasons to add
> them back then, and now someone else has to spend time to clean them up.
>
> hyperv case is not any special in that regard (at least I'm not convinced
> at this point). Try alternative(s) first, if that doesn't work out, then
> custom parser might be necessary.

Please explain to me how 

'hv-passthrough,hv-evmcs,-vmx' is going to throw an error
and
'hv-passthrough,-vmx' is not.

-- 
Vitaly


