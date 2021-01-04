Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791842E9557
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:55:46 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwPOj-0002pG-1d
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwPNj-0002F1-1U
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwPNe-0001WE-3B
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609764876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tk4bKQ7QbxXIBCD4NM3Jel0rl1Z0D3vNhGpHZnCA3z8=;
 b=UJbaT5JDoGVOn7ZkRA+mHqfMEfXjVKT+B55lOPyHZaOjaARzkQ6W/mT0aWaMfBzx8kcr2v
 qRtMBCMEDAZYfZwhY4FWvWNellkrI3aSz3uWwFTHU7DBs4a3alGVIhiuFXO1xY73zAPFQT
 f1MYMr++A3wz/Ct1rFXOLEPJ4cDrZ3Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-kc8fGgobN9O3CFFegQ_zJA-1; Mon, 04 Jan 2021 07:54:34 -0500
X-MC-Unique: kc8fGgobN9O3CFFegQ_zJA-1
Received: by mail-ej1-f71.google.com with SMTP id r26so6924880ejx.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 04:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=tk4bKQ7QbxXIBCD4NM3Jel0rl1Z0D3vNhGpHZnCA3z8=;
 b=LDcQSmGrPnN9zFrIoAB5DISIfo6tcUzuo26l/QUfyhiCn//EO0wRCj0TzTPLkUIWAj
 lCygV8cS1bC1eLHcsg77wvsTTwlxOezmfg0yRt8+h3mcrJcv6HNzd7ybM8sZtPep7aNc
 XwqF0g8KJ8AEdPOT7PAorOVxKS/Zr1ZapvnvNZm5eyTY+BSIo8JhME4y7X32WSnjL9kF
 BigQvDaC6cGXS2nOH1G3O4LJr6rvDu9eWH2sGwfERFKUBr5xLz3r1Bdj1HlOP+AqcMUc
 05zh2TGzivZbASZ+3s/TC4VnHr4k6pePfVvyehEJfcv/Ph1zlVh7GspHVe0yehUig7Rh
 cY0A==
X-Gm-Message-State: AOAM533jpvHf3HnnW202PzCjgd9WdfNKzt/g5kyeng1YMHg0sXI2JZN4
 dOh313zDSWPqmkPD67mi7jYvKt5qd1/gphqa9qAmI5E4PIjexKOt/j2BgQqdk6/m2tjnOaWcM/R
 DvKzPqCJZtCVdAUwtl/UU/QUOiBU6el5ynTKMWa+/y5HyhOxb3iaIonX3sMoZiX9kVEE=
X-Received: by 2002:a17:907:105e:: with SMTP id
 oy30mr66131997ejb.495.1609764873590; 
 Mon, 04 Jan 2021 04:54:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxySOFTcv/SmTr1MMnLTgxbvOnrZ0/6vjlN3hQKesU7qXNs5Lzh8JpHCxN8GdgnypEHqSYbMA==
X-Received: by 2002:a17:907:105e:: with SMTP id
 oy30mr66131980ejb.495.1609764873390; 
 Mon, 04 Jan 2021 04:54:33 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id j22sm23468722ejy.106.2021.01.04.04.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 04:54:32 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20201218181340.5e398280@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com>
Date: Mon, 04 Jan 2021 13:54:32 +0100
Message-ID: <87r1n0j20n.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

>> >  
>> > +    /* Hyper-V features enabled with 'hyperv=on' */
>> > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
>> > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
>> > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);
> I'd argue that feature bits do not belong to machine code at all.
> If we have to involve machine at all then it should be a set property/value pairs
> that machine will set on CPU object (I'm not convinced that doing it
> from machine code is good idea though).
>

These are 'features' and not feature bits. 'Bits' here are just our
internal (to QEMU) representation of which features are enable and which
are not, we could've just used booleans instead. These feature, when
enabled, will result in some CPUID changes (not 1:1) but I don't see how
it's different from
  
" -machine q35,accel=kvm "

which also results in CPUID changes.

The main reason for putting this to x86 machine type is versioning, as
we go along we will (hopefully) be implementing more and more Hyper-V
features but we want to provide 'one knob to rule them all' but do it in
a way that will allow migration. We already have 'hv_passthrough' for
CPU.

>> >  
>> > +    if (x86ms->hyperv_enabled) {
>> > +        feat = x86mc->default_hyperv_features;
>> > +        /* Enlightened VMCS is only available on Intel/VMX */
>> > +        if (!cpu_has_vmx(&cpu->env)) {
>> > +            feat &= ~BIT(HYPERV_FEAT_EVMCS);
>> > +        }
>> > +
>> > +        cpu->hyperv_features |= feat;
> that will ignore features user explicitly doesn't want,
> ex:
>  -machine hyperv=on -cpu foo,hv-foo=off
>

Existing 'hv_passthrough' mode can also affect the result. Personally, I
don't see where 'hv-foo=off' is needed outside of debugging and these
use-cases can probably be covered by explicitly listing required
features but I'm not against making this work, shouldn't be hard.

> not sure we would like to introduce such invariant,
> in normal qom property handling the latest set property should have effect
> (all other invariants we have in x86 cpu property semantics are comming from legacy handling
> and I plan to deprecate them (it will affect x86 and sparc cpus) so CPUs will behave like
> any other QOM object when it come to property handling)
>  
> anyways it's confusing a bit to have cpu flags to come from 2 different places
>
> -cpu hyperv-use-preset=on,hv-foo=off
>
> looks less confusing and will heave expected effect
>

Honestly, 'hyperv-use-preset' is confusing even to me :-)

What if we for a second stop thinking about Hyper-V features being CPU
features only, e.g. if we want to create Dynamic Memory or PTP or any
other Hyper-V specific device in a simple way? We'll have to put these
under machine type.

-- 
Vitaly


