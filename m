Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF232304C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:09:57 +0100 (CET)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEc8C-0006O0-9l
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lEc7B-0005se-BQ
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:08:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lEc77-00006O-TT
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614103727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6GvFvNM8/w1xUVuWDLSE4hqXqvqrqcD6fkoUKGptzM=;
 b=MdO5tHYWg/vH8Sl1DcxHC7/srO1EaYiTAseJCPC494ZhFOM/dFJp1XiZVEXzxoVz/LZh2h
 MjsT3bbW+v0Z0Jgt5Fzqupp3IgfZnakYHIh7DyBH5G56Np/gO+6RJX/OHNNzZIgKa0vEmT
 u1NK7LuyE1z3hYKtt7+xtKFFQco3alA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-cAmzTb0cNGuH1rIr8k20dw-1; Tue, 23 Feb 2021 13:08:45 -0500
X-MC-Unique: cAmzTb0cNGuH1rIr8k20dw-1
Received: by mail-ed1-f70.google.com with SMTP id p12so9093480edw.9
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=m6GvFvNM8/w1xUVuWDLSE4hqXqvqrqcD6fkoUKGptzM=;
 b=V2KbzbssqS1Yfwdxx4KvgyhdT1tSVE/CxHKmZaE2tCDlgJuBhF6GjfB/ZQHyQTzO6E
 SxhYYdLV0BoePikipJXBlYRaFCv0tNhjqZepcteMS/F3O7d6n14fzz9Yy5VsFnwZltZv
 UTc7zNyVarglf5R/IbTTJNxxjUqVvVpcCwcyv/QjQrqI4/uMQIbI07raioZ1Pu1G6ln6
 J1dd4Q8kOHkKeYiD2S+TqBigqlFRXRMadjCfBePLVqkLqduUjhHuCbTV3Cv4mxFHPSJ/
 HcZQAwgdQnQB391ibTLSdU2DxD8P6zn9LzrVsmbhOZ/nv6XZNBDeEkI/wxR9FEwBho7/
 KdcA==
X-Gm-Message-State: AOAM5322cCUepwmmv4jzmc4sVRV+I6bpdQzHTN6Ixv5cO8+62Kp3Ms7A
 8u4/WFAlxEeQRQuC4E6R3U6r4lbNn89Seq/9GbMakyX2yJEPCPUCeffDFA0mCquJFpLzcQqUWYy
 jkcFHLda9fOIw1eI=
X-Received: by 2002:a17:906:7697:: with SMTP id
 o23mr28020217ejm.292.1614103724575; 
 Tue, 23 Feb 2021 10:08:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8Rs6V7eQdoAThOAelqf9AESLDBsRj3I4fvwjZG5a84AHilh0Kb7u0//xSiC631Mxq/xwFOw==
X-Received: by 2002:a17:906:7697:: with SMTP id
 o23mr28020200ejm.292.1614103724364; 
 Tue, 23 Feb 2021 10:08:44 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id o8sm15099362edj.79.2021.02.23.10.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 10:08:43 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210223184802.7080da4a@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com> <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com> <87sg5xjj60.fsf@vitty.brq.redhat.com>
 <87mtvw4d59.fsf@vitty.brq.redhat.com> <20210223161948.56bf86c0@redhat.com>
 <871rd6yefp.fsf@vitty.brq.redhat.com> <20210223184802.7080da4a@redhat.com>
Date: Tue, 23 Feb 2021 19:08:42 +0100
Message-ID: <87y2fewtat.fsf@vitty.brq.redhat.com>
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

> On Tue, 23 Feb 2021 16:46:50 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Mon, 22 Feb 2021 11:20:34 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >  
>> >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>> >>   
>> >> > Igor Mammedov <imammedo@redhat.com> writes:
>> >> >    
>> >> >>> 
>> >> >>> We need to distinguish because that would be sane.
>> >> >>> 
>> >> >>> Enlightened VMCS is an extension to VMX, it can't be used without
>> >> >>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,    
>> >> >> ...    
>> >> >>> That bein said, if
>> >> >>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
>> >> >>> there is a problem with explicit enablement: what should
>> >> >>> 
>> >> >>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
>> >> >>> sound sane to me.    
>> >> >> based on above I'd error out is user asks for unsupported option
>> >> >> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out    
>> >> >
>> >> > That's what I keep telling you but you don't seem to listen. 'Scratch
>> >> > CPU' can't possibly help with this use-case because when you parse 
>> >> >
>> >> > 'hv-passthrough,hv-evmcs,vmx=off' you
>> >> >
>> >> > 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
>> >> > host.
>> >> >
>> >> > 2) 'hv-evmcs' -> keep EVMCS bit '1'
>> >> >
>> >> > 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
>> >> >
>> >> > We have to remember which options were aquired from the host and which
>> >> > were set explicitly by the user.     
>> >> 
>> >> Igor,
>> >> 
>> >> could you please comment on the above? In case my line of thought is
>> >> correct, and it is impossible to distinguish between e.g.
>> >> 
>> >> 'hv-passthrough,hv-evmcs,-vmx'
>> >> and
>> >> 'hv-passthrough,-vmx'
>> >> 
>> >> without a custom parser (written just exactly the way I did in this
>> >> version, for example) regardless of when 'hv-passthrough' is
>> >> expanded. E.g. we have the exact same problem with
>> >> 'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing  
>> >
>> > right, if we need to distinguish between explicit and implicit hv-evmcs set by
>> > hv-passthrough custom parser probably the way to go.
>> >
>> > However do we need actually need to do it?  
>> 
>> I think we really need that. See below ...
>> 
>> > I'd treat 'hv-passthrough,-vmx' the same way as 'hv-passthrough,hv-evmcs,-vmx'
>> > and it applies not only hv-evmcs but other features hv-passthrough might set
>> > (i.e. if whatever was [un]set by hv-passthrough in combination with other
>> > features results in invalid config, QEMU shall error out instead of magically
>> > altering host provided hv-passthrough value).
>> >
>> > something like:
>> >   'hv-passthrough,-vmx' when hv-passthrough makes hv-evmcs bit set
>> > should result in
>> >   error_setg(errp,"'vmx' feature can't be disabled when hv-evmcs is enabled,"
>> >                  " either enable 'vmx' or disable 'hv-evmcs' along with disabling 'vmx'"
>> >
>> > making host's features set, *magically* mutable, depending on other user provided features
>> > is a bit confusing. One would never know what hv-passthrough actually means, and if
>> > enabling/disabling 'random' feature changes it.
>> >
>> > It's cleaner to do just what user asked (whether implicitly or explicitly) and error out
>> > in case it ends up in nonsense configuration.
>> >  
>> 
>> I don't seem to agree this is a sane behavior, especially if you replace
>> 'hv-passthrough' with 'hv-default' above. Removing 'vmx' from CPU for
>> Windows guests is common if you'd want to avoid nested configuration:
>> even without any Hyper-V guests created, Windows itself is a Hyper-V
>> partition.
>> 
>> So a sane user will do:
>> 
>> '-cpu host,hv-default,vmx=off' 
>> 
>> and on Intel he will get an error, and on AMD he won't. 
>> 
>> So what you're suggesting actually defeats the whole purpose of
>> 'hv-default' as upper-layer tools (think libvirt) will need to know that
> I'd assume it would be hard for libvirt to use 'hv-default' from migration
> point of view. It's semi opaque (one can find out what features it sets
> indirectly inspecting individual hv_foo features, and mgmt will need to
> know about them). If it will mutate when other features [un]set, upper
> layers might need to enumerate all these permutations to know which hosts
> are compatible or compare host feature sets every time before attempting
> migration.
>

That's exactly the opposite of what's the goal here which is: make it
possible for upper layers to not know anything about Hyper-V
enlightenments besides 'hv-default'. Migration should work just fine, if
the rest of guest configuration matches -- then 'hv-default' will create
the exact same things (e.g. if 'vmx' was disabled on the source it has
to be enabled on the destination, it can't be different)


>> Intel configurations for Windows guests are somewhat different. They'll
>> need to know what 'hv-evmcs' is. We're back to where we've started.
>
> we were talking about hv-passthrough, and if host advertises hv-evmcs
> QEMU should complain if user disabled features it depends on (
> not silently fixing up configuration error).
> But the same applies to hv-default.

Let's forget about hv-passthrough completely for a while as this series
is kind of unrelated to it.

In the previous submission I was setting 'hv-default' based on host
availability of the feature only. That is: set on Intel, unset on
AMD. We have to at least preserve that because it would be insane to
crash on

-cpu host,hv-default 

on AMD because AMD doesn't (and never will!) support hv-evmcs, right?

>
>> If we are to follow this approach let's just throw away 'hv-evmcs' from
>> 'hv-default' set, it's going to be much cleaner. But again, I don't
>> really believe it's the right way to go.
>
> if desired behavior, on Intel host for above config, to start without error
> then indeed defaults should not set 'hv-evmcs' if it results in invalid
> feature set.

This is problematic as it is still sane for everyone to enable it as it
gives performance advantage. If we just for a second forget about custom
parsers and all that -- which is just an implementation detail, why can't
we tie 'hv-evmcs' bit in 'hv-default' to 'vxm' 1:1?

Again, the end goal is: make it possible for upper layers to now know
anything about Hyper-V enlightenments other than 'hv-default'. Technically,
it is possible to make it work.

-- 
Vitaly


