Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1073241A5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:08:37 +0100 (CET)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwiK-0000x6-6X
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEwgV-0008Lo-8S
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lEwgR-00074X-RW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ex62qcneRpBufL/JHQbEVSXYamvXNTudGHZgTWtOTDw=;
 b=Ghg8+rJsQFOvgmrH79a6Jbz2XneTBscOcb6q0qQyN4hD3vuu9rh3FsCKkdhXUTMq4CBL/x
 z3xIfO4ALIhfGq8oTM/xDgxN0VSwHvV2JUfbDAJTmECoixhpqWzq9B6ISp3LHkhIstS7dh
 qM5jOk/0cDRtLMYdHbjZyDHTGvL8yow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-uJGI-eoLNYqSK6yv4HKKow-1; Wed, 24 Feb 2021 11:06:27 -0500
X-MC-Unique: uJGI-eoLNYqSK6yv4HKKow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71CCB50741
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 16:06:26 +0000 (UTC)
Received: from localhost (unknown [10.40.208.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9037219C71;
 Wed, 24 Feb 2021 16:06:24 +0000 (UTC)
Date: Wed, 24 Feb 2021 17:06:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210224170622.786515d6@redhat.com>
In-Reply-To: <87y2fewtat.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <20210212170113.30a902b2@redhat.com>
 <87eehhlnj5.fsf@vitty.brq.redhat.com>
 <20210215180106.7e573e6a@redhat.com>
 <87sg5xjj60.fsf@vitty.brq.redhat.com>
 <87mtvw4d59.fsf@vitty.brq.redhat.com>
 <20210223161948.56bf86c0@redhat.com>
 <871rd6yefp.fsf@vitty.brq.redhat.com>
 <20210223184802.7080da4a@redhat.com>
 <87y2fewtat.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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

On Tue, 23 Feb 2021 19:08:42 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Tue, 23 Feb 2021 16:46:50 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Igor Mammedov <imammedo@redhat.com> writes:
> >>   
> >> > On Mon, 22 Feb 2021 11:20:34 +0100
> >> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >> >    
> >> >> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> >> >>     
> >> >> > Igor Mammedov <imammedo@redhat.com> writes:
> >> >> >      
> >> >> >>> 
> >> >> >>> We need to distinguish because that would be sane.
> >> >> >>> 
> >> >> >>> Enlightened VMCS is an extension to VMX, it can't be used without
> >> >> >>> it. Genuine Hyper-V doesn't have a knob for enabling and disabling it,      
> >> >> >> ...      
> >> >> >>> That bein said, if
> >> >> >>> guest CPU lacks VMX it is counter-productive to expose EVMCS. However,
> >> >> >>> there is a problem with explicit enablement: what should
> >> >> >>> 
> >> >> >>> 'hv-passthrough,hv-evmcs' option do? Just silently drop EVMCS? Doesn't
> >> >> >>> sound sane to me.      
> >> >> >> based on above I'd error out is user asks for unsupported option
> >> >> >> i.e. no VMX -> no hv-evmcs - if explicitly asked -> error out      
> >> >> >
> >> >> > That's what I keep telling you but you don't seem to listen. 'Scratch
> >> >> > CPU' can't possibly help with this use-case because when you parse 
> >> >> >
> >> >> > 'hv-passthrough,hv-evmcs,vmx=off' you
> >> >> >
> >> >> > 1) "hv-passthrough" -> set EVMCS bit to '1' as it is supported by the
> >> >> > host.
> >> >> >
> >> >> > 2) 'hv-evmcs' -> keep EVMCS bit '1'
> >> >> >
> >> >> > 3) 'vmx=off' -> you have no idea where EVMCS bit came from.
> >> >> >
> >> >> > We have to remember which options were aquired from the host and which
> >> >> > were set explicitly by the user.       
> >> >> 
> >> >> Igor,
> >> >> 
> >> >> could you please comment on the above? In case my line of thought is
> >> >> correct, and it is impossible to distinguish between e.g.
> >> >> 
> >> >> 'hv-passthrough,hv-evmcs,-vmx'
> >> >> and
> >> >> 'hv-passthrough,-vmx'
> >> >> 
> >> >> without a custom parser (written just exactly the way I did in this
> >> >> version, for example) regardless of when 'hv-passthrough' is
> >> >> expanded. E.g. we have the exact same problem with
> >> >> 'hv-default,hv-evmcs,-vmx'. I that case I see no point in discussing    
> >> >
> >> > right, if we need to distinguish between explicit and implicit hv-evmcs set by
> >> > hv-passthrough custom parser probably the way to go.
> >> >
> >> > However do we need actually need to do it?    
> >> 
> >> I think we really need that. See below ...
> >>   
> >> > I'd treat 'hv-passthrough,-vmx' the same way as 'hv-passthrough,hv-evmcs,-vmx'
> >> > and it applies not only hv-evmcs but other features hv-passthrough might set
> >> > (i.e. if whatever was [un]set by hv-passthrough in combination with other
> >> > features results in invalid config, QEMU shall error out instead of magically
> >> > altering host provided hv-passthrough value).
> >> >
> >> > something like:
> >> >   'hv-passthrough,-vmx' when hv-passthrough makes hv-evmcs bit set
> >> > should result in
> >> >   error_setg(errp,"'vmx' feature can't be disabled when hv-evmcs is enabled,"
> >> >                  " either enable 'vmx' or disable 'hv-evmcs' along with disabling 'vmx'"
> >> >
> >> > making host's features set, *magically* mutable, depending on other user provided features
> >> > is a bit confusing. One would never know what hv-passthrough actually means, and if
> >> > enabling/disabling 'random' feature changes it.
> >> >
> >> > It's cleaner to do just what user asked (whether implicitly or explicitly) and error out
> >> > in case it ends up in nonsense configuration.
> >> >    
> >> 
> >> I don't seem to agree this is a sane behavior, especially if you replace
> >> 'hv-passthrough' with 'hv-default' above. Removing 'vmx' from CPU for
> >> Windows guests is common if you'd want to avoid nested configuration:
> >> even without any Hyper-V guests created, Windows itself is a Hyper-V
> >> partition.
> >> 
> >> So a sane user will do:
> >> 
> >> '-cpu host,hv-default,vmx=off' 
> >> 
> >> and on Intel he will get an error, and on AMD he won't. 
> >> 
> >> So what you're suggesting actually defeats the whole purpose of
> >> 'hv-default' as upper-layer tools (think libvirt) will need to know that  
> > I'd assume it would be hard for libvirt to use 'hv-default' from migration
> > point of view. It's semi opaque (one can find out what features it sets
> > indirectly inspecting individual hv_foo features, and mgmt will need to
> > know about them). If it will mutate when other features [un]set, upper
> > layers might need to enumerate all these permutations to know which hosts
> > are compatible or compare host feature sets every time before attempting
> > migration.
> 
> That's exactly the opposite of what's the goal here which is: make it
> possible for upper layers to not know anything about Hyper-V
> enlightenments besides 'hv-default'. Migration should work just fine, if
> the rest of guest configuration matches -- then 'hv-default' will create
> the exact same things (e.g. if 'vmx' was disabled on the source it has
            ^^^^^
I'm not convinced in that yet (not with current impl. more on that at the end of reply)

> to be enabled on the destination, it can't be different)
> 
> 
> >> Intel configurations for Windows guests are somewhat different. They'll
> >> need to know what 'hv-evmcs' is. We're back to where we've started.  
> >
> > we were talking about hv-passthrough, and if host advertises hv-evmcs
> > QEMU should complain if user disabled features it depends on (
> > not silently fixing up configuration error).
> > But the same applies to hv-default.  
> 
> Let's forget about hv-passthrough completely for a while as this series
> is kind of unrelated to it.

It adds a lot for unrelated code (not just couple of lines),
I've played with scratch CPU idea, here is demo of it
https://github.com/imammedo/qemu/commit/a4b107d5368ebf72d45082bc8310a6b88a4ba6fb
I didn't rework caps/cpuid querying parts (just hacked around it),
and even without that it saves us ~200LOC (not a small part of which comes
with this series).
I also split horrible hv_cpuid_check_and_set into separate 'set' and 'check' stages.
Granted it was sort-of pre-existing ugly code, some of your
re-factoring made it a bit better but it's still far from readable.
 
> In the previous submission I was setting 'hv-default' based on host
> availability of the feature only. That is: set on Intel, unset on
> AMD. We have to at least preserve that because it would be insane to
> crash on
> 
> -cpu host,hv-default 
> 
> on AMD because AMD doesn't (and never will!) support hv-evmcs, right?

If QEMU prevents cross arch migration i.e. it's not supported,
then I guess we can make hv-default different depending on AMD or Intel host.
If not then we might need to be conservative i.e. exclude hv-evmcs from defaults.

> >> If we are to follow this approach let's just throw away 'hv-evmcs' from
> >> 'hv-default' set, it's going to be much cleaner. But again, I don't
> >> really believe it's the right way to go.  
> >
> > if desired behavior, on Intel host for above config, to start without error
> > then indeed defaults should not set 'hv-evmcs' if it results in invalid
> > feature set.  
> 
> This is problematic as it is still sane for everyone to enable it as it
> gives performance advantage. If we just for a second forget about custom
  "
    > >> So a sane user will do:
    > >> 
    > >> '-cpu host,hv-default,vmx=off'
  "
  it's not easy picking defaults.

> parsers and all that -- which is just an implementation detail, why can't
> we tie 'hv-evmcs' bit in 'hv-default' to 'vxm' 1:1?
migration wise I don't see issues wrt vmx=off turning of hv-evmcs,
however ...

we were replacing user input fixups with hard errors asking
user to fix CLI and removing custom parsers in favor of generic ones.

In vmx=off case we would be fixing up what 'hv-default' explicitly set.
Same applies to other hv-foo set by hv-default.

ex: 'hv-default,hv-dep1=off', will turn off some dependent feature
for other hv feature in hv-default set and it will error out,
same goes on for enabling feature that has dependencies.
Why should we treat hv-evmcs/vmx pair any different?

Granted exiting with error is not the best UX, but at least it says to user
what's wrong with CLI and how to fix it. Also it lets to keep QEMU code
manageable and with consistent behavior.

> Again, the end goal is: make it possible for upper layers to now know
> anything about Hyper-V enlightenments other than 'hv-default'.
I'm still doubtful about feasibility of this goal when migration is considered.
It sure would work if hosts are identical hw/sw wise.
In mixed setup all features, except of hv-evmcs, that included in 'hv-default',
will error out in case host doesn't support it, which should prevent
incompatible migration so that's also fine.

But hv-evmcs will silently go away if host doesn't support it,
which is issue when migration happens to/from host that supports it.

Maybe to help mgmt to figure out hosts compatibility
  1. it should know about hv-evmcs to query it's status
  2. or default value set by 'hv-default' should be exposed to mgmt
     so it could compare whole feature-set in one go without being
     aware of individual features.

Additionally on QEMU side for such conditional features we can
theoretically add a subsection to migration stream when feature
is enabled, that way we at least can prevent 'successful' migration,
when destination value doesn't match. But this might already be
over-engineering on my part.


> Technically, it is possible to make it work.





