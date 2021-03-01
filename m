Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9A3283AF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:23:58 +0100 (CET)
Received: from localhost ([::1]:37440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlKv-0004xR-JF
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGlJx-0004Nt-00
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lGlJt-00071l-0k
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=poJ5bcThpf+fKWEvLAE6TwNy82WrNXrldaNO2AoiLPg=;
 b=QfCqtfEwhLJB2idJFbWQe0aML6TXpBYsFX/Vr/szXXuDCnZUMukCu+u0KMJYjPzJW7x8Jy
 qXFrMuByMjMUUmKw6Hlcvhn6EXeH8Gaej2dGeQx3+Hd8BCLyz1yHpxxU/KAt+wiVhzifHm
 yy0csDQaoF74mFZo+6OxMRbmXBjsNto=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-gWViOE-XOo-BlH2wbvnOMg-1; Mon, 01 Mar 2021 11:22:42 -0500
X-MC-Unique: gWViOE-XOo-BlH2wbvnOMg-1
Received: by mail-ed1-f69.google.com with SMTP id w9so9118190edi.15
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=poJ5bcThpf+fKWEvLAE6TwNy82WrNXrldaNO2AoiLPg=;
 b=igpcEXGWcECVMvt7xNDS6Fz00i4qAeMpBPHQH/dThZC6AoKayauYgtcQj2k2ddK8Np
 q5I4mDFQs2Uk3+R04entoYhs1O+1VEz/pydE6n2Fn8GnscO8aWpg3hqz8Wjj63W00Ws6
 l6eUJJIY68xItN+RA4tCLNeyp+4MLV5THcgmDHBTzk7yxj5FXn87IUSnc1s92T7J5rm1
 if/J3abwI+xiuViBglPzT3qfQrQwXbop8fXsswAzJYj9Bh0siIi2S7+xt7XbCUz4Vf7C
 SjLxa8+gGj6PtuG1rfnAPVg++mlLrRL2V9gg+XY86OWGw48nW7k0X5ytd61DpRs7Zjap
 MeJQ==
X-Gm-Message-State: AOAM533SRfd3CYXXV3MksGMpkQwezuR0WmUbv/04W6EgZ5YLDZt8LmBs
 BKKdF4DVesWJhykV2oTma0gnNb8+/WxkRLumCcLusrGTasJQzMuubBuca7pb2styVN3RSRmvP5+
 59EzC62HEPGvueWqk3ZjUlxoddUfAniUQ6ZPh5ktRU8M162EWFRWXzY6HoLZjZ4VYjD0=
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr7077205edr.387.1614615760526; 
 Mon, 01 Mar 2021 08:22:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfyq9kbYjRX73r/jFBe2bx7OMZyTwXtE2U3EeLNGvjX9XEDMzJwRtfMdWuAJAWZWlmibekog==
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr7077091edr.387.1614615759080; 
 Mon, 01 Mar 2021 08:22:39 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id j14sm14880362eds.78.2021.03.01.08.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 08:22:38 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
In-Reply-To: <20210301163212.53657dbd@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com> <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com> <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com> <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com> <87sg5xjj60.fsf@vitty.brq.redhat.com>
 <87mtvw4d59.fsf@vitty.brq.redhat.com> <20210223161948.56bf86c0@redhat.com>
 <871rd6yefp.fsf@vitty.brq.redhat.com> <20210223184802.7080da4a@redhat.com>
 <87y2fewtat.fsf@vitty.brq.redhat.com> <20210224170622.786515d6@redhat.com>
 <87o8g9wgck.fsf@vitty.brq.redhat.com> <20210301163212.53657dbd@redhat.com>
Date: Mon, 01 Mar 2021 17:22:37 +0100
Message-ID: <877dmqg7xu.fsf@vitty.brq.redhat.com>
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
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> On Wed, 24 Feb 2021 18:00:43 +0100
> Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>
>> Igor Mammedov <imammedo@redhat.com> writes:
>> 
>> > On Tue, 23 Feb 2021 19:08:42 +0100
>> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >  
>> >> Igor Mammedov <imammedo@redhat.com> writes:
>> >>   
>> >> > On Tue, 23 Feb 2021 16:46:50 +0100
>> >> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >> >    
>> >> >> Igor Mammedov <imammedo@redhat.com> writes:
>> >> >>     
>> >> >> > On Mon, 22 Feb 2021 11:20:34 +0100
>> >> >> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>> >> >> >      
>> >> >> >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>> >> >> >>       
>> >> >> >> > Igor Mammedov <imammedo@redhat.com> writes:
>> >> >> >> >        
>> >> >> >> >>> 
>> >> >> >> >>> We need to distinguish because that would be sane.
>> >> >> >> >>> 
>> >> >> >> >>> Enlightened VMCS is an extension to VMX, it can't be used without
>> >> >> >> >>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,        
>> >> >> >> >> ...        
>> >> >> >> >>> That bein said, if
>> >> >> >> >>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
>> >> >> >> >>> there is a problem with explicit enablement: what should
>> >> >> >> >>> 
>> >> >> >> >>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
>> >> >> >> >>> sound sane to me.        
>> >> >> >> >> based on above I'd error out is user asks for unsupported option
>> >> >> >> >> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out        
>> >> >> >> >
>> >> >> >> > That's what I keep telling you but you don't seem to listen. 'Scratch
>> >> >> >> > CPU' can't possibly help with this use-case because when you parse 
>> >> >> >> >
>> >> >> >> > 'hv-passthrough,hv-evmcs,vmx=off' you
>> >> >> >> >
>> >> >> >> > 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
>> >> >> >> > host.
>> >> >> >> >
>> >> >> >> > 2) 'hv-evmcs' -> keep EVMCS bit '1'
>> >> >> >> >
>> >> >> >> > 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
>> >> >> >> >
>> >> >> >> > We have to remember which options were aquired from the host and which
>> >> >> >> > were set explicitly by the user.         
>> >> >> >> 
>> >> >> >> Igor,
>> >> >> >> 
>> >> >> >> could you please comment on the above? In case my line of thought is
>> >> >> >> correct, and it is impossible to distinguish between e.g.
>> >> >> >> 
>> >> >> >> 'hv-passthrough,hv-evmcs,-vmx'
>> >> >> >> and
>> >> >> >> 'hv-passthrough,-vmx'
>> >> >> >> 
>> >> >> >> without a custom parser (written just exactly the way I did in this
>> >> >> >> version, for example) regardless of when 'hv-passthrough' is
>> >> >> >> expanded. E.g. we have the exact same problem with
>> >> >> >> 'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing      
>> >> >> >
>> >> >> > right, if we need to distinguish between explicit and implicit hv-evmcs set by
>> >> >> > hv-passthrough custom parser probably the way to go.
>> >> >> >
>> >> >> > However do we need actually need to do it?      
>> >> >> 
>> >> >> I think we really need that. See below ...
>> >> >>     
>> >> >> > I'd treat 'hv-passthrough,-vmx' the same way as 'hv-passthrough,hv-evmcs,-vmx'
>> >> >> > and it applies not only hv-evmcs but other features hv-passthrough might set
>> >> >> > (i.e. if whatever was [un]set by hv-passthrough in combination with other
>> >> >> > features results in invalid config, QEMU shall error out instead of magically
>> >> >> > altering host provided hv-passthrough value).
>> >> >> >
>> >> >> > something like:
>> >> >> >   'hv-passthrough,-vmx' when hv-passthrough makes hv-evmcs bit set
>> >> >> > should result in
>> >> >> >   error_setg(errp,"'vmx' feature can't be disabled when hv-evmcs is enabled,"
>> >> >> >                  " either enable 'vmx' or disable 'hv-evmcs' along with disabling 'vmx'"
>> >> >> >
>> >> >> > making host's features set, *magically* mutable, depending on other user provided features
>> >> >> > is a bit confusing. One would never know what hv-passthrough actually means, and if
>> >> >> > enabling/disabling 'random' feature changes it.
>> >> >> >
>> >> >> > It's cleaner to do just what user asked (whether implicitly or explicitly) and error out
>> >> >> > in case it ends up in nonsense configuration.
>> >> >> >      
>> >> >> 
>> >> >> I don't seem to agree this is a sane behavior, especially if you replace
>> >> >> 'hv-passthrough' with 'hv-default' above. Removing 'vmx' from CPU for
>> >> >> Windows guests is common if you'd want to avoid nested configuration:
>> >> >> even without any Hyper-V guests created, Windows itself is a Hyper-V
>> >> >> partition.
>> >> >> 
>> >> >> So a sane user will do:
>> >> >> 
>> >> >> '-cpu host,hv-default,vmx=off' 
>> >> >> 
>> >> >> and on Intel he will get an error, and on AMD he won't. 
>> >> >> 
>> >> >> So what you're suggesting actually defeats the whole purpose of
>> >> >> 'hv-default' as upper-layer tools (think libvirt) will need to know that    
>> >> > I'd assume it would be hard for libvirt to use 'hv-default' from migration
>> >> > point of view. It's semi opaque (one can find out what features it sets
>> >> > indirectly inspecting individual hv_foo features, and mgmt will need to
>> >> > know about them). If it will mutate when other features [un]set, upper
>> >> > layers might need to enumerate all these permutations to know which hosts
>> >> > are compatible or compare host feature sets every time before attempting
>> >> > migration.  
>> >> 
>> >> That's exactly the opposite of what's the goal here which is: make it
>> >> possible for upper layers to not know anything about Hyper-V
>> >> enlightenments besides 'hv-default'. Migration should work just fine, if
>> >> the rest of guest configuration matches -- then 'hv-default' will create
>> >> the exact same things (e.g. if 'vmx' was disabled on the source it has  
>> >             ^^^^^
>> > I'm not convinced in that yet (not with current impl. more on that at the end of reply)
>> >  
>> >> to be enabled on the destination, it can't be different)
>> >> 
>> >>   
>> >> >> Intel configurations for Windows guests are somewhat different. They'll
>> >> >> need to know what 'hv-evmcs' is. We're back to where we've started.    
>> >> >
>> >> > we were talking about hv-passthrough, and if host advertises hv-evmcs
>> >> > QEMU should complain if user disabled features it depends on (
>> >> > not silently fixing up configuration error).
>> >> > But the same applies to hv-default.    
>> >> 
>> >> Let's forget about hv-passthrough completely for a while as this series
>> >> is kind of unrelated to it.  
>> >
>> > It adds a lot for unrelated code (not just couple of lines),
>> > I've played with scratch CPU idea, here is demo of it
>> > https://github.com/imammedo/qemu/commit/a4b107d5368ebf72d45082bc8310a6b88a4ba6fb
>> > I didn't rework caps/cpuid querying parts (just hacked around it),
>> > and even without that it saves us ~200LOC (not a small part of which comes
>> > with this series).  
>> 
>> All your savings come from throwing away custom parsers -- which are not
>> needed at all if we don't distinguish between
>> 
>> 'hv-default,hv-evmcs' and 'hv-default'
>> 
>> it's just not needed, don't count these patches in. Or, if it is needed,
>> please explain how your scratch CPU is making things different. I guess
>> it is not so we can discuss this outside of this series.
>
> scratch CPU helps with hostpassthrough refactoring which also brings in
> dependency on custom parser.

I think I already said that but let me repeat myself: scratch CPUs don't
help us in any way to distinguish between

'hv-passthrough,hv-evmcs,vmx=off' 
and
'hv-passthrough,vmx=off' 

and thus are utterly useless (for this particular feature). It's not
'refactoring', it's throwing a feature away for the sake of code
purity.

>
>
>> > I also split horrible hv_cpuid_check_and_set into separate 'set' and 'check' stages.
>> > Granted it was sort-of pre-existing ugly code, some of your
>> > re-factoring made it a bit better but it's still far from readable.
>> >    
>> 
>> hv_cpuid_check_and_set() is already there, I'm not at all opposed to
>> making this code even better but I don't see it as a must for this
>> particular feature (hv-default).
> it's not a must have for hv-default especially if you don't touch it.
> (however if you touch it & co, I'd ask to clean it up first)
>
>
>> >> In the previous submission I was setting 'hv-default' based on host
>> >> availability of the feature only. That is: set on Intel, unset on
>> >> AMD. We have to at least preserve that because it would be insane to
>> >> crash on
>> >> 
>> >> -cpu host,hv-default 
>> >> 
>> >> on AMD because AMD doesn't (and never will!) support hv-evmcs, right?  
>> >
>> > If QEMU prevents cross arch migration i.e. it's not supported,
>> > then I guess we can make hv-default different depending on AMD or Intel host.
>> > If not then we might need to be conservative i.e. exclude hv-evmcs from defaults.
>> >  
>> 
>> Forget about cross vendor. I want to tie it 1:1 to VMX feature on the
>> guest CPU -- which happens to be only available on Intel. It is
>> absolutely impossible to migrate VMX enabled guest to VMX-disabled
>> destination, with or without evmcs.
> Ok
>
>> >> >> If we are to follow this approach let's just throw away 'hv-evmcs' from
>> >> >> 'hv-default' set, it's going to be much cleaner. But again, I don't
>> >> >> really believe it's the right way to go.    
>> >> >
>> >> > if desired behavior, on Intel host for above config, to start without error
>> >> > then indeed defaults should not set 'hv-evmcs' if it results in invalid
>> >> > feature set.    
>> >> 
>> >> This is problematic as it is still sane for everyone to enable it as it
>> >> gives performance advantage. If we just for a second forget about custom  
>> >   "  
>> >     > >> So a sane user will do:
>> >     > >> 
>> >     > >> '-cpu host,hv-default,vmx=off'  
>> >   "
>> >   it's not easy picking defaults.
>> >  
>> >> parsers and all that -- which is just an implementation detail, why can't
>> >> we tie 'hv-evmcs' bit in 'hv-default' to 'vxm' 1:1?  
>> > migration wise I don't see issues wrt vmx=off turning of hv-evmcs,
>> > however ...
>> >
>> > we were replacing user input fixups with hard errors asking
>> > user to fix CLI and removing custom parsers in favor of generic ones.
>> >
>> > In vmx=off case we would be fixing up what 'hv-default' explicitly set.
>> > Same applies to other hv-foo set by hv-default.
>> >
>> > ex: 'hv-default,hv-dep1=off', will turn off some dependent feature
>> > for other hv feature in hv-default set and it will error out,
>> > same goes on for enabling feature that has dependencies.
>> > Why should we treat hv-evmcs/vmx pair any different?
>> >  
>> 
>> VMX is not part of Hyper-V enlightenments, is it? It can also be coming
>> from a CPU model:
>> 
>> "-cpu MyLovelyModelWithVmx,hv-default"
>> 
>> should not throw an error!
>> 
>> Again, the goal is for userspace to not know anything besides
>> 'hv-default' for Hyper-V enlightenments.
>> 
>> 
>> > Granted exiting with error is not the best UX, but at least it says to user
>> > what's wrong with CLI and how to fix it. Also it lets to keep QEMU code
>> > manageable and with consistent behavior.  
>> 
>> Enabling EVMCS only when guest CPU has VMX is a smart behavior, all
>> users want that. It is very consistent with how genuine Hyper-V behaves.
> it's all good,
> unless VMX is absent for whatever reasons (cpumodel or vmx=off on CLI),
> in this case just error out and say what's wrong instead of trying to fix
> CLI up.

It's easier, of course, but I don't think we should do that. At least 

query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}

should give upper layer the full list of supported features, including
evmcs, and not just throw an error. Same with 'hv-default'

>
>> >> Again, the end goal is: make it possible for upper layers to now know
>> >> anything about Hyper-V enlightenments other than 'hv-default'.  
>> > I'm still doubtful about feasibility of this goal when migration is considered.
>> > It sure would work if hosts are identical hw/sw wise.
>> > In mixed setup all features, except of hv-evmcs, that included in 'hv-default',
>> > will error out in case host doesn't support it, which should prevent
>> > incompatible migration so that's also fine.
>> >
>> > But hv-evmcs will silently go away if host doesn't support it,
>> > which is issue when migration happens to/from host that supports it.  
>> 
>> But how can it go away? In KVM, hv-evmcs support is not conditional,
>> basically, all KVMs which support netsting state migration also support
>> EVMCS. 
>
> you added that in kernel between 4.19-4.20 (8cab6507f64),
> so on Intel host flag can change depending on not so old kernel version.
>
> Unless QEMU minimum supported kernel version is 4.20,
> we can't ignore that.
> (downstreams will have to take care of it on its own)

You forget that EVMCS is not a feature in vacuum, it is an extension to
VMX. To migrate a guest which has it enabled, nested state migration has
to support it. Assuming the feature was enabled on the source, you need
at least the following:

commit 8cab6507f64eff0ccfea01fccbc7e3e05e2aaf7e
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Oct 16 18:50:09 2018 +0200

    x86/kvm/nVMX: nested state migration for Enlightened VMCS

which is also in 4.20, I don't see how migration without it can even
succeed. 

>
>> >
>> > Maybe to help mgmt to figure out hosts compatibility
>> >   1. it should know about hv-evmcs to query it's status
>> >   2. or default value set by 'hv-default' should be exposed to mgmt
>> >      so it could compare whole feature-set in one go without being
>> >      aware of individual features.
>> >
>> > Additionally on QEMU side for such conditional features we can
>> > theoretically add a subsection to migration stream when feature
>> > is enabled, that way we at least can prevent 'successful' migration,
>> > when destination value doesn't match. But this might already be
>> > over-engineering on my part.  
>> 
>> I think you're trying to solve an issue which doesn't exist. In case
>> we're successfully migrating a nested enabled guest, our KVM is modern
>> enough and supports EVMCS (on Intel, of course). Also, nested state
>> (which is part of the migration stream) has EVMCS flag, we can't migrate
>> somewhere where the flag is unsupported.
> that's what I was missing.
> Can you point out to the code that makes sure that migration fails?
> (a comment where hv-evcms is added to default set explaining why it's safe, pls)
>

If you look at KVM_SET_NESTED_STATE implementation in KVM (see
kvm_arch_vcpu_ioctl()), it checks for supported flags

arch/x86/kvm/x86.c-             if (kvm_state.flags &
arch/x86/kvm/x86.c-                 ~(KVM_STATE_NESTED_RUN_PENDING | KVM_STATE_NESTED_GUEST_MODE
arch/x86/kvm/x86.c-                   | KVM_STATE_NESTED_EVMCS | KVM_STATE_NESTED_MTF_PENDING
arch/x86/kvm/x86.c-                   | KVM_STATE_NESTED_GIF_SET))
arch/x86/kvm/x86.c-                     break;

if KVM_STATE_NESTED_EVMCS is unsupported (KVM before 8cab6507f64) this
condition will fail.

In reality, regardless of evmcs, there are so many bugs in nested
migration prior to 5.11/5.10(maybe) that chances for successful
migration on these kernels are pretty slim. Worst is, the migration
won't fail, you guest (with its nested guests) will just crash.  I don't
recommend anyone doing nested migration in production with some older
kernel, it's just not safe.

>  
>> Anyway, I feel we're walking in circles. I'm ready to just drop all
>> EVMCS related bits from this seies to get it merged. This will make the
>> part which you hate the most ("custom parsers") go away too. We can discuss
>> EVMCS to death after that and, when we finally decide that user
>> convenience is actually worth something, we can add 'hv-evmcs' to the
>> new 
>
> fine with me, it would be even easier to review if it were just a patch that
> would add 'hv-defaults', without non must have refactoring.
> (cleanup/refactoring could be another series)
>

Ok, v5 is on the list.

> If we can guarantee that hv-evcms won't flip on/off on all supported kernels,
> I'm also fine with keeping it in default set and error-ing out if vmx ends up
> in off state.

I still don't see why and how it should (or could) flip.

> However if it changes, we need to expose 'default set' to mgmt somehow,
> so it will know that hosts aren't compatible (instead of finding out it hard way
> in form of failed migration (assuming it fails))

The first part of this series does exactly that: exposes Hyper-V
enlightenments to upper layers in QMP. Upper layer can do e.g. 

query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}

and it will get all the supported features, including evmcs. This is
one of the reasons I insist this should *always* work instead of
throwing an error (with 'hv-default too).

-- 
Vitaly


