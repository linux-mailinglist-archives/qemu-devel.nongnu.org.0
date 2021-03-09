Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7179331F3C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 07:24:18 +0100 (CET)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJVmz-0002pO-T2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 01:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJVm4-0002B6-Vc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 01:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJVm1-0001Kp-MQ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 01:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615270995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8On7uU0WJELTvNg8jTil0Cv+ukKcmhJmTsobr9Rrcqk=;
 b=Rh0ELFampLnZ8Bd/uVLEBFRNpA+z+d4HHabhpt7ZBxQd/xcEVsBI92t8Z8TEh9xVVb8vNR
 v7RIQPgShdHCk9NtZb5r4+Atmosb6NWS9eAwFBxfmmqWyx5zzVOV8MfT5wB64l8OdrXvr6
 UmBJS0ZFEUD4W1a4puXM7SJVfZ/8rro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-FpaJlzsTNkau6x5dJ6CPvA-1; Tue, 09 Mar 2021 01:23:13 -0500
X-MC-Unique: FpaJlzsTNkau6x5dJ6CPvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA9041008548;
 Tue,  9 Mar 2021 06:23:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8590B5D9D3;
 Tue,  9 Mar 2021 06:23:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F7B01132C12; Tue,  9 Mar 2021 07:22:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
Date: Tue, 09 Mar 2021 07:22:59 +0100
In-Reply-To: <YEbp4wKK/QY7uKYw@yekko.fritz.box> (David Gibson's message of
 "Tue, 9 Mar 2021 14:22:11 +1100")
Message-ID: <87mtvczvzw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Paolo and Julia in addition to Igor, because the thread is wandering
towards DeviceState member pending_deleted_event.

Cc: Laine for libvirt expertise.  Laine, if you're not the right person,
please loop in the right person.

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>> 
>> 
>> On 3/8/21 2:04 PM, Markus Armbruster wrote:
>> > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> > 
>> > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
[...]
>> > > > We should document the event's reliability.  Are there unplug operations
>> > > > where we can't detect failure?  Are there unplug operations where we
>> > > > could, but haven't implemented the event?
>> > > 
>> > > The current version of the PowerPC spec that the pseries machine implements
>> > > (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>> > > error back to the hypervisor. If something fails, the hypervisor is left
>> > > in the dark.
>> > > 
>> > > What happened in the 6.0.0 dev cycle is that we faced a reliable way of
>> > 
>> > Do you mean "unreliable way"?
>> 
>> I guess a better word would be 'reproducible', as in we discovered a reproducible
>> way of getting the guest kernel to refuse the CPU hotunplug.
>
> Right.  It's worth noting here that in the PAPR model, there are no
> "forced" unplugs.  Unplugs always consist of a request to the guest,
> which is then resposible for offlining the device and signalling back
> to the hypervisor that it's done with it.
>
>> > > making CPU hotunplug fail in the guest (trying to hotunplug the last online
>> > > CPU) and the pseries machine was unprepared for dealing with it. We ended up
>> > > implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>> > > that the CPU hotunplug failed in the guest. This is the first scenario we have
>> > > today where we want to send a QAPI event informing the CPU hotunplug error,
>> > > but this event does not exist in QEMU ATM.
>> > 
>> > When the timeout kicks in, how can you know the operation failed?  You
>> > better be sure when you send an error event.  In other words: what
>> > prevents the scenario where the operation is much slower than you
>> > expect, the timeout expires, the error event is sent, and then the
>> > operation completes successfully?
>> 
>> A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
>> if the guest is under heavy load. The timeout is set to 15 seconds.
>
> Right.  We're well aware that a timeout is an ugly hack, since it's
> not really possible to distinguish it from a guest that's just being
> really slow.

As long as unplug failure cannot be detected reliably, we need a timeout
*somewhere*.  I vaguely recall libvirt has one.  Laine?

Putting the timeout in QEMU might be better.  QEMU might be in a better
position to pick a suitable timeout.

> It was the best thing we could come up with in the short term though.
> Without the changes we're suggesting here, the guest can positively
> assert the unplug is complete, but it has no way to signal failure.
> So, without a timeout qemu is stuck waiting indefinitely (or at least
> until the next machine reset) on the guest for an unplug that might
> never complete.
>
> It's particularly nasty if the guest does really fail the hotplug
> internally, but then conditions change so that the same unplug could
> now succeed.  The unplug request is just a message - there's no guest
> visible persistent state saying we want the device unplugged, so if
> conditions change the guest won't then re-attempt the unplug.
> Meanwhile the user can't re-attempt the device_del, because on the
> qemu side it's still stuck in a pending unplug waiting on the guest.

"Can't re-attempt" feels like a bug.  Let me explain.

Depending on the device, device_del can complete the unplug, or merely
initiate it.  Documentation:

# Notes: When this command completes, the device may not be removed from the
#        guest.  Hot removal is an operation that requires guest cooperation.
#        This command merely requests that the guest begin the hot removal
#        process.  Completion of the device removal process is signaled with a
#        DEVICE_DELETED event. Guest reset will automatically complete removal
#        for all devices.

This is not as accurate as it could be.  Behavior depends on the device.

For some kinds of devices, the command completes the unplug before it
sends its reply.  Example: USB devices.  Fine print: the DEVICE_DELETED
event gets send with a slight delay because device cleanup uses RCU.

For others, notably PCI devices, the command only pokes the guest to do
its bit.  QEMU reacts to the guest's actions, which eventually leads to
the actual unplug.  DEVICE_DELETED gets sent then.  If the guest doesn't
play ball to the end, the event doesn't get send.

The "can't retry unplug" behavior is new.  Another device_del used to
simply poke the guest again.  I think this regressed in commit
cce8944cc9 "qdev-monitor: Forbid repeated device_del", 2020-02-25.
Feels like a must-fix for 6.0.

> As we're discussing we think we have a better way, but it relies on
> guest changes, so we can't assume we already have that on the qemu
> side.
>
>> I'm aware that there's always that special use case, that we haven't seen yet,
>> where this assumption is no longer valid. The plan is to change the spec and the
>> guest kernel to signal the CPU hotunplug error back to QEMU before the dragon
>> lands. For now, timing out the CPU hotunplug process when we're almost certain
>> (but not 100%) that it failed in the guest is the best can do.
>> 
>> For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, avoiding
>> guest visible changes when we change how we're detecting the unplug errors.
>> 
>> > > The second scenario is a memory hotunplug error. I found out that the pseries
>> > > guest kernel does a reconfiguration step when re-attaching the DIMM right
>> > > after refusing the hotunplug, and this reconfiguration is visible to QEMU.
>> > > I proceeded to make the pseries machine detect this error case, rollback the
>> > > unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
>> > > by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
>> > > well instead of the MEM specific one.
>> > > 
>> > > This investigation and work in the mem hotunplug error path triggered a
>> > > discussion in qemu-ppc, where we're considering whether we should do the same
>> > > signalling the kernel does for the DIMM hotunplug error for all other device
>> > > hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
>> > > and it's currently a no-op. We would make a LOPAR spec change to make this an
>> > > official hotunplug error report mechanism, and all pseries hotunplug operations,
>> > > for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>> > > 
>> > > Granted, the spec change + Kernel change is not something that we will be able
>> > > to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
>> > > already in place would make it easier for the future as well.
>> > > 
>> > > 
>> > > I have a doc draft of these changes/infos that I forgot to post. I would post
>> > > it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
>> > > information there as well. Does that work for you as far as documentation
>> > > goes?
>> > 
>> > A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
>> > and device.
>
> Ack.  Fwiw, I don't think this can ever be more than a "best effort"
> notification.  Even with a machine and OS that should support it, a
> guest bug or hang could mean that it never acks *or* nacks an unplug
> request.

Since the success event is named DEVICE_DELETED, I'd name the
probably-failed event DEVICE_NOT_DELETED.  Bonus: can read it as a
statement of fact "still not deleted" instead of an error (that just
might not be one).

>> > I'm not asking you to to implement it for all machines and devices.  But
>> > I want its design to support growth towards that goal, and its
>> > documentation reflect its current state.
>> > 
>> > In particular, the doc comment in the QAPI schema should list the
>> > limitation.  If the event is only implemented for LOPAR for now, say so.
>> > If it's only implemented for certain devices, say so.
>> > 
>> > Questions?
>> 
>> 
>> Nope. Thanks for the pointers. I'll add the DEVICE_UNPLUG_ERROR QAPI event
>> in a way that it can be used by other machines in the future, and documenting
>> where the event is being used ATM.
>> 
>> 
>> Thanks,
>> 
>> 
>> DHB
>> 
>> 
>> > 
>> 


