Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A44322DE6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:49:21 +0100 (CET)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZw8-0004BN-GZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lEZuu-0003m0-Rg
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lEZuq-0004B9-Dg
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614095276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3LugzM6AAeQ0D1do9O3Qzy76nHxldMKm0xpsLkh29t0=;
 b=PSVnHbMBbtlviamta0Fxgwe48hJcmU8D0n4I5C5lU73IqUQ1u+HgIr6/clRu13I8Pvbmmo
 Y7FxleZhLFJi6pKF6x0nlc4Dl5IX9eUnlWaify67Ly38QqgYsFxC/G9dJDb9+4WjWAb1P6
 9owLypHiuyb13RHgxrRN+aVDJi016hU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-pDoo1aiYPle0Es10W3U5Fw-1; Tue, 23 Feb 2021 10:46:52 -0500
X-MC-Unique: pDoo1aiYPle0Es10W3U5Fw-1
Received: by mail-ed1-f70.google.com with SMTP id p12so8856520edw.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3LugzM6AAeQ0D1do9O3Qzy76nHxldMKm0xpsLkh29t0=;
 b=h93u8SX996yYlpoNQq1dQUiTrhO6PZtv0rMCGu3Ewchp0hm3nncwEE90HkDO97kjcs
 TRLFHZNOy6BH/UgdgpMqvJs25Dg0QXUQ24j0/hVzX+IfJw728Bm8yegZ/kqEi3FUKmJ8
 ZfghiP9S1nm9NK1CETXGr6thZ8fEGo7JqLPhiiv6goVS1+W4z+5D/sCHDpRHT2fOVy/N
 0ve2w5itpeQmf7Zks0hM1ySZVh61rxWcm0o8M2z5D4Kaj9dWKqvoyg2rsDP7Guaj8uJf
 qvuBDNDZrH//EOseJ17NuOrKrSVqNv1Uw04+jsiL1TrsJIPZkbiIY1Vii9+trsdFgXD7
 72Vw==
X-Gm-Message-State: AOAM533bi2KhP4OzOQQjJMLRc1viedQjp6WZxuWTEkb98h5Noom0IARa
 99pD9cbLXgt+pndrse5loerHCoHmKvQpqqFdPb7UHG6ydG+iOPDLB5qQNfT9G8tUvUur8C0T6pP
 vUmRHzJUKchMz26w=
X-Received: by 2002:a05:6402:d1:: with SMTP id
 i17mr28604208edu.85.1614095211787; 
 Tue, 23 Feb 2021 07:46:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFFvAWC0A01MqVWBnRve+/vudP/VNbWMSac4G7RHbTXI5JQ/iYXRoZ9L4OKFQUiOcGuMgMlw==
X-Received: by 2002:a05:6402:d1:: with SMTP id
 i17mr28604186edu.85.1614095211571; 
 Tue, 23 Feb 2021 07:46:51 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id r6sm15083800edm.23.2021.02.23.07.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 07:46:51 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210223161948.56bf86c0@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com> <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com> <87sg5xjj60.fsf@vitty.brq.redhat.com>
 <87mtvw4d59.fsf@vitty.brq.redhat.com> <20210223161948.56bf86c0@redhat.com>
Date: Tue, 23 Feb 2021 16:46:50 +0100
Message-ID: <871rd6yefp.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Mon, 22 Feb 2021 11:20:34 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>> 
>> > Igor Mammedov <imammedo@redhat.com> writes:
>> >  
>> >>> 
>> >>> We need to distinguish because that would be sane.
>> >>> 
>> >>> Enlightened VMCS is an extension to VMX, it can't be used without
>> >>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,  
>> >> ...  
>> >>> That bein said, if
>> >>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
>> >>> there is a problem with explicit enablement: what should
>> >>> 
>> >>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
>> >>> sound sane to me.  
>> >> based on above I'd error out is user asks for unsupported option
>> >> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out  
>> >
>> > That's what I keep telling you but you don't seem to listen. 'Scratch
>> > CPU' can't possibly help with this use-case because when you parse 
>> >
>> > 'hv-passthrough,hv-evmcs,vmx=off' you
>> >
>> > 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
>> > host.
>> >
>> > 2) 'hv-evmcs' -> keep EVMCS bit '1'
>> >
>> > 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
>> >
>> > We have to remember which options were aquired from the host and which
>> > were set explicitly by the user.   
>> 
>> Igor,
>> 
>> could you please comment on the above? In case my line of thought is
>> correct, and it is impossible to distinguish between e.g.
>> 
>> 'hv-passthrough,hv-evmcs,-vmx'
>> and
>> 'hv-passthrough,-vmx'
>> 
>> without a custom parser (written just exactly the way I did in this
>> version, for example) regardless of when 'hv-passthrough' is
>> expanded. E.g. we have the exact same problem with
>> 'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing
>
> right, if we need to distinguish between explicit and implicit hv-evmcs set by
> hv-passthrough custom parser probably the way to go.
>
> However do we need actually need to do it?

I think we really need that. See below ...

> I'd treat 'hv-passthrough,-vmx' the same way as 'hv-passthrough,hv-evmcs,-vmx'
> and it applies not only hv-evmcs but other features hv-passthrough might set
> (i.e. if whatever was [un]set by hv-passthrough in combination with other
> features results in invalid config, QEMU shall error out instead of magically
> altering host provided hv-passthrough value).
>
> something like:
>   'hv-passthrough,-vmx' when hv-passthrough makes hv-evmcs bit set
> should result in
>   error_setg(errp,"'vmx' feature can't be disabled when hv-evmcs is enabled,"
>                  " either enable 'vmx' or disable 'hv-evmcs' along with disabling 'vmx'"
>
> making host's features set, *magically* mutable, depending on other user provided features
> is a bit confusing. One would never know what hv-passthrough actually means, and if
> enabling/disabling 'random' feature changes it.
>
> It's cleaner to do just what user asked (whether implicitly or explicitly) and error out
> in case it ends up in nonsense configuration.
>

I don't seem to agree this is a sane behavior, especially if you replace
'hv-passthrough' with 'hv-default' above. Removing 'vmx' from CPU for
Windows guests is common if you'd want to avoid nested configuration:
even without any Hyper-V guests created, Windows itself is a Hyper-V
partition.

So a sane user will do:

'-cpu host,hv-default,vmx=off' 

and on Intel he will get an error, and on AMD he won't. 

So what you're suggesting actually defeats the whole purpose of
'hv-default' as upper-layer tools (think libvirt) will need to know that
Intel configurations for Windows guests are somewhat different. They'll
need to know what 'hv-evmcs' is. We're back to where we've started.

If we are to follow this approach let's just throw away 'hv-evmcs' from
'hv-default' set, it's going to be much cleaner. But again, I don't
really believe it's the right way to go.

-- 
Vitaly


