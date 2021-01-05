Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A62EAA30
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 12:51:42 +0100 (CET)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwksH-0004Lm-4K
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 06:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwkqs-0003mH-It
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:50:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kwkqq-0002ag-8U
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 06:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609847410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZnMXGPqakSmu6r0xUiJ8npB10gSwOmiYWJLC9adITY=;
 b=fXmRizN1fRz2KRq004UivZwcn/D80eugeTDoVg0/F10wm9YYVp9QM1kcdQ63UPP0AnzjPL
 QaJVGyQ93vYUtY2PmVZZmpkphnW0bPKQWf5pNUi/lkZHLdTtuaZtM9YsJYXPJy0TmISP3X
 n2CKVUkt5TLzsLCVT8Q8ta8rKsB/l5Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-m3YJsocBOz-2wDRld7m-sw-1; Tue, 05 Jan 2021 06:50:08 -0500
X-MC-Unique: m3YJsocBOz-2wDRld7m-sw-1
Received: by mail-wr1-f71.google.com with SMTP id y5so14730433wrs.15
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 03:50:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aZnMXGPqakSmu6r0xUiJ8npB10gSwOmiYWJLC9adITY=;
 b=elcJXGqLzxcP2ICvqMFX/7SElfNul4tEkYg8fWN5OnDAvKcjRkc5iU4k2fR5HXkax5
 CtCCaD5YQIFXQixJULa6ZJwSX/St4cFWhCR5osJx95hALsp0Pr46Un9TYuljY6cX1Cmc
 FJJcNiMZaI1RzorD6b+7vSTyIlStFbSMp8N0YNFFvUWH87ym7BVWLi8zOqMy6q33ZhRt
 MVokojVnhdpTM173xpEVsSQeds9FmWWgQ3eAbLw9PXS4viTL9okT7nZaJxqVK4k9zBc2
 qLEu3ARGJmfZwqimoOGX/U0gHXtY6wHxX8ou1nT0a1mcPQ3HxIXa8pL5RUaW8YCWtQ/8
 tIig==
X-Gm-Message-State: AOAM532tYjiyUbf9vSi7zMAzzfLLsHHPGI/ofdi/dRHqgEJY63CDaptl
 oJhIcKrvLw43ZZwfNf0JRPzwZd0LYwJDJvOSALGEyzwKuMU74ja0b+enRbvtKxChaBkNXVA0LHE
 reV4M2TV8tee6qfKlrq4ph8Gk4YGKQ1Yez0MkcHJIob5ddNDOz2o7ii1RPMQgej55RYA=
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr2981686wmq.89.1609847407227; 
 Tue, 05 Jan 2021 03:50:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvkYFuMAw1/KATLPTgNSfZWThk6P/0d4ewF6hPvbD8NFMMKI15fI9MUsrfdkjYPwEoWvdD2Q==
X-Received: by 2002:a05:600c:3549:: with SMTP id
 i9mr2981661wmq.89.1609847406970; 
 Tue, 05 Jan 2021 03:50:06 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id i18sm98007776wrp.74.2021.01.05.03.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:50:06 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 5/5] i386: provide simple 'hyperv=on' option to x86
 machine types
In-Reply-To: <20210105000435.1cf4c6f6@redhat.com>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
 <20201119103221.1665171-6-vkuznets@redhat.com>
 <20201216205202.GJ3140057@habkost.net>
 <20201218181340.5e398280@redhat.com> <87r1n0j20n.fsf@vitty.brq.redhat.com>
 <20210105000435.1cf4c6f6@redhat.com>
Date: Tue, 05 Jan 2021 12:50:05 +0100
Message-ID: <87lfd7iowi.fsf@vitty.brq.redhat.com>
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Mon, 04 Jan 2021 13:54:32 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> >> >  
>> >> > +    /* Hyper-V features enabled with 'hyperv=on' */
>> >> > +    x86mc->default_hyperv_features = BIT(HYPERV_FEAT_RELAXED) |
>> >> > +        BIT(HYPERV_FEAT_VAPIC) | BIT(HYPERV_FEAT_TIME) |
>> >> > +        BIT(HYPERV_FEAT_CRASH) | BIT(HYPERV_FEAT_RESET) |
>> >> > +        BIT(HYPERV_FEAT_VPINDEX) | BIT(HYPERV_FEAT_RUNTIME) |
>> >> > +        BIT(HYPERV_FEAT_SYNIC) | BIT(HYPERV_FEAT_STIMER) |
>> >> > +        BIT(HYPERV_FEAT_FREQUENCIES) | BIT(HYPERV_FEAT_REENLIGHTENMENT) |
>> >> > +        BIT(HYPERV_FEAT_TLBFLUSH) | BIT(HYPERV_FEAT_EVMCS) |
>> >> > +        BIT(HYPERV_FEAT_IPI) | BIT(HYPERV_FEAT_STIMER_DIRECT);  
>> > I'd argue that feature bits do not belong to machine code at all.
>> > If we have to involve machine at all then it should be a set property/value pairs
>> > that machine will set on CPU object (I'm not convinced that doing it
>> > from machine code is good idea though).
>> >  
>> 
>> These are 'features' and not feature bits. 'Bits' here are just our
>> internal (to QEMU) representation of which features are enable and which
>> are not, we could've just used booleans instead. These feature, when
>> enabled, will result in some CPUID changes (not 1:1) but I don't see how
>> it's different from
>>   
>> " -machine q35,accel=kvm "
>> 
>> which also results in CPUID changes.
>> 
>> The main reason for putting this to x86 machine type is versioning, as
>> we go along we will (hopefully) be implementing more and more Hyper-V
>> features but we want to provide 'one knob to rule them all' but do it in
>> a way that will allow migration. We already have 'hv_passthrough' for
>> CPU.
>
> for versioning device models (cpu included), we typically set some default in
> device's ininfn, and if later on we need to change it to another default
> we use compat properties to keep old default to old machine types.
>
> For example using it with CPU look at pc_compat_3_1
>

The tricky part for Hyper-V enlightenments is that we have to keep them
all off as the default when it wasn't explicitly requested as they're
only needed for Windows guests so one way or another we need a new knob
to enable the default-good-set.

>> What if we for a second stop thinking about Hyper-V features being CPU
>> features only, e.g. if we want to create Dynamic Memory or PTP or any
>> other Hyper-V specific device in a simple way? We'll have to put these
>> under machine type.
> ideally it would be a property of device that implements the feature
> and machine might enable it depending on its own properties defaults,
> but if you change the default behavior of the device model, you do
> it in device model and use compat properties infrastructure to keep
> old machine types happy.

This would work nicely if we were to enable some of the Hyper-V
enlightenments by default for new machine types and then turn them off
with compat properties. We are in a different situation though, we want
one knob which will tell us 'enable the default good set' and then we
need to subtract something from this set because e.g. our machine type
is old. In case the knob is, as you suggest, in CPU properties
('hv_default=on' or something like that) we'll have to play dirty games
in machine init funtion again: go to CPU device options and check if
'hv_default=on' was requested. If yes, then we enable all Hyper-V
enlightenments and do the subtraction according to machine version. And
what's even more weird, that we'll have to use 'hv_default=on' CPU flag
as an indication to create non-CPU devices. Much easier if the knob is a
property of machine type itself.

We can, of course, create a parallel (to the existing one) set of
Hyper-V properties which are going to be enabled by default (and
blacklisted by compat properties) and then later when CPU object is
created we'll set CPU properties according to these 'default' properties
but I hardly see a benefit in complicating stuff that much.

Also, compat properties are not the only thing we take into
consideration when creating an old machine type today. E.g.:

static void pc_q35_3_1_machine_options(MachineClass *m)
{
    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);

    pc_q35_4_0_machine_options(m);
    m->default_kernel_irqchip_split = false;
    pcmc->do_not_add_smb_acpi = true;
    m->smbus_no_migration_support = true;
    m->alias = NULL;
    pcmc->pvh_enabled = false;
    compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
    compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
}

and that's exactly what I was thinking about for Hyper-V enlightenments:
when a new one is introduced we'll turn it off by default for new
machine types, no matter if it's going to be a CPU property or a new
device.

-- 
Vitaly


