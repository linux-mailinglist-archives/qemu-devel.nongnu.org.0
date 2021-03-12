Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0A33871E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:14:27 +0100 (CET)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKcwE-0003EU-IJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKcv1-0002Cc-4c
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:13:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKcuy-0003OF-Ha
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:13:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615536787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8/KlvabaigGDe5Im85qLS/NWCPXesa5xL2fQEPeGeMs=;
 b=gqsMlAD1XNR2BfivDxdGF1RTFuYbQYK1gD3G+silfG0hPQFzMTFa/kMyOmj0XKwlDWZn7E
 lp+g+LkOHuQQECXHLB7d6RHgcQJ8Qt9RUaTCmY4S2m5pcRnjMQVDnZC62G8zOt+cVC1g3w
 nr3PROqgvHUvvYHbsGgCMAWWh3P2K9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Y8hhwLEtOcexyEyVkNmpJg-1; Fri, 12 Mar 2021 03:13:06 -0500
X-MC-Unique: Y8hhwLEtOcexyEyVkNmpJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6271E817469;
 Fri, 12 Mar 2021 08:13:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA86659445;
 Fri, 12 Mar 2021 08:12:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6CAC11132C12; Fri, 12 Mar 2021 09:12:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
Date: Fri, 12 Mar 2021 09:12:53 +0100
In-Reply-To: <YErBpf7w25xho1so@yekko.fritz.box> (David Gibson's message of
 "Fri, 12 Mar 2021 12:19:33 +1100")
Message-ID: <875z1w7ptm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Mar 11, 2021 at 05:50:42PM -0300, Daniel Henrique Barboza wrote:
>> 
>> 
>> On 3/9/21 3:22 AM, Markus Armbruster wrote:
>> > Cc: Paolo and Julia in addition to Igor, because the thread is wandering
>> > towards DeviceState member pending_deleted_event.
>> > 
>> > Cc: Laine for libvirt expertise.  Laine, if you're not the right person,
>> > please loop in the right person.
>> > 
>> > David Gibson <david@gibson.dropbear.id.au> writes:
>> > 
>> > > On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>> > > > 
>> > > > 
>> > > > On 3/8/21 2:04 PM, Markus Armbruster wrote:
>> > > > > Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> > > > > 
>> > > > > > On 3/6/21 3:57 AM, Markus Armbruster wrote:
>> > [...]
>> > > > > > > We should document the event's reliability.  Are there unplug operations
>> > > > > > > where we can't detect failure?  Are there unplug operations where we
>> > > > > > > could, but haven't implemented the event?
>> > > > > > 
>> > > > > > The current version of the PowerPC spec that the pseries machine implements
>> > > > > > (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>> > > > > > error back to the hypervisor. If something fails, the hypervisor is left
>> > > > > > in the dark.
>> > > > > > 
>> > > > > > What happened in the 6.0.0 dev cycle is that we faced a reliable way of
>> > > > > 
>> > > > > Do you mean "unreliable way"?
>> > > > 
>> > > > I guess a better word would be 'reproducible', as in we discovered a reproducible
>> > > > way of getting the guest kernel to refuse the CPU hotunplug.
>> > > 
>> > > Right.  It's worth noting here that in the PAPR model, there are no
>> > > "forced" unplugs.  Unplugs always consist of a request to the guest,
>> > > which is then resposible for offlining the device and signalling back
>> > > to the hypervisor that it's done with it.
>> > > 
>> > > > > > making CPU hotunplug fail in the guest (trying to hotunplug the last online
>> > > > > > CPU) and the pseries machine was unprepared for dealing with it. We ended up
>> > > > > > implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>> > > > > > that the CPU hotunplug failed in the guest. This is the first scenario we have
>> > > > > > today where we want to send a QAPI event informing the CPU hotunplug error,
>> > > > > > but this event does not exist in QEMU ATM.
>> > > > > 
>> > > > > When the timeout kicks in, how can you know the operation failed?  You
>> > > > > better be sure when you send an error event.  In other words: what
>> > > > > prevents the scenario where the operation is much slower than you
>> > > > > expect, the timeout expires, the error event is sent, and then the
>> > > > > operation completes successfully?
>> > > > 
>> > > > A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
>> > > > if the guest is under heavy load. The timeout is set to 15 seconds.
>> > > 
>> > > Right.  We're well aware that a timeout is an ugly hack, since it's
>> > > not really possible to distinguish it from a guest that's just being
>> > > really slow.
>> > 
>> > As long as unplug failure cannot be detected reliably, we need a timeout
>> > *somewhere*.  I vaguely recall libvirt has one.  Laine?
>> 
>> Yeah, Libvirt has a timeout for hotunplug operations. I agree that QEMU doing
>> the timeout makes more sense since it has more information about the
>> conditions/mechanics involved.
>
> Right.  In particular, I can't really see how libvirt can fully
> implement that timeout.  AFAIK qemu has no way of listing or
> cancelling "in flight" unplug requests, so it's entirely possible that
> the unplug could still complete after libvirt's has "timed out".

QEMU doesn't really keep track of "in flight" unplug requests, and as
long as that's the case, its timeout even will have the same issue.

>> At this moment, the only case I know of hotunplug operations timing out in
>> QEMU is what we did with CPU hotunplug in pseries though. I can't tell if
>> unplug timeout is desirable mechanism for other machines/device types.

I think we first need to nail down what the even means.  It could mean
"hot unplug definitely failed" or "hot unplug did not complete in time".

Any operation that is not instantaneous goes through a state where it
neither succeeded nor failed.

When the duration of that state is unbounded, no timeout can get us out
of it.  When exiting the state requires guest cooperation, its duration
is unbounded.  "Definitely failed" semantics is unattainable.

It is attainable if we can somehow cancel the unplug, because that
forces transition to "failed".

I suspect we have at least three kinds of unplugs: effectively
instantaneous (command completes the job, e.g. USB), unbounded and not
cancelable, unbounded and cancelable.

When we onlw know "did not complete in time", the management application
needs a way to retry the unplug regardless of actual state.  If the
unplug succeeded meanwhile (sending DEVICE_DELETED), the retry should
fail.  If it failed meanwhile, start over.  If it's still in progress,
do nothing.

We can choose to leave cancelling to the management application.  Ditch
"definitely failed", report "did not complete in time".  The management
application can then either cancel or retry.  The former succeeds if it
canceled the unplug, fails if the unplug completed meanwhile, which also
sent DEVICE_DELETED).

I think before we can continue reworking the code, we need consensus on
a hot unplug state machine that works for all known cases, or at least
the cases we have in QEMU.

>> > Putting the timeout in QEMU might be better.  QEMU might be in a better
>> > position to pick a suitable timeout.
>> > 
>> > > It was the best thing we could come up with in the short term though.
>> > > Without the changes we're suggesting here, the guest can positively
>> > > assert the unplug is complete, but it has no way to signal failure.
>> > > So, without a timeout qemu is stuck waiting indefinitely (or at least
>> > > until the next machine reset) on the guest for an unplug that might
>> > > never complete.
>> > > 
>> > > It's particularly nasty if the guest does really fail the hotplug
>> > > internally, but then conditions change so that the same unplug could
>> > > now succeed.  The unplug request is just a message - there's no guest
>> > > visible persistent state saying we want the device unplugged, so if
>> > > conditions change the guest won't then re-attempt the unplug.
>> > > Meanwhile the user can't re-attempt the device_del, because on the
>> > > qemu side it's still stuck in a pending unplug waiting on the guest.
>> > 
>> > "Can't re-attempt" feels like a bug.  Let me explain.
>
> You may be right.  Perhaps we should just send another unplug message
> if we get a device_del on something that's already pending deletion.
> AFAICT repeated unplug messages for the same device should be
> harmless.

Consider physical PCI hot unplug.  You press a button next to the slot,
wait for the (figuratively) green light, then pull out the card.  You
can press the button as many times as you want.

>> So, what David mentioned above is related to pseries internals I believe.
>> 
>> Up to 5.2.0 the pseries machine were silently ignoring all 'device_del'
>> issued for devices that were in the middle of the unplug process, with the
>> exception of DIMMs where we bothered to throw an error message back to the
>> user.
>> 
>> In 6.0.0 the code was reworked, and now we're always letting the user know
>> when the 'device_del' was ignored due to an ongoing hotunplug of the device.
>> And for CPUs we also tell the timeout remaining. We're still not sending
>> multiple hotunplug IRQ pulses to the guest, but at least the user is now
>> informed about it.

This is possible because you know unplug is in progress.  I'm not sure
we can know for all devices.

>> As for the commit mentioned below:
>> 
>> > 
>> > Depending on the device, device_del can complete the unplug, or merely
>> > initiate it.  Documentation:
>> > 
>> > # Notes: When this command completes, the device may not be removed from the
>> > #        guest.  Hot removal is an operation that requires guest cooperation.
>> > #        This command merely requests that the guest begin the hot removal
>> > #        process.  Completion of the device removal process is signaled with a
>> > #        DEVICE_DELETED event. Guest reset will automatically complete removal
>> > #        for all devices.
>> > 
>> > This is not as accurate as it could be.  Behavior depends on the device.
>> > 
>> > For some kinds of devices, the command completes the unplug before it
>> > sends its reply.  Example: USB devices.  Fine print: the DEVICE_DELETED
>> > event gets send with a slight delay because device cleanup uses RCU.
>> > 
>> > For others, notably PCI devices, the command only pokes the guest to do
>> > its bit.  QEMU reacts to the guest's actions, which eventually leads to
>> > the actual unplug.  DEVICE_DELETED gets sent then.  If the guest doesn't
>> > play ball to the end, the event doesn't get send.
>> > 
>> > The "can't retry unplug" behavior is new.  Another device_del used to
>> > simply poke the guest again.
>
> Maybe on x86.  I think a repeated device_del was at best a no-op on
> PAPR.

There's certainly more than one way to skin this cat.  When QEMU knows
the guest is still working on the unplug, poking the guest again is
useless at best.

>> > I think this regressed in commit
>> > cce8944cc9 "qdev-monitor: Forbid repeated device_del", 2020-02-25.
>> > Feels like a must-fix for 6.0.
>> 
>> 
>> This doesn't directly affect pseries code because we're not using
>> dev->pending_deleted_event to track the pending unplug status. We're
>
> Huh... I didn't know about pending_deleted_event.  Maybe we *should*
> be using that.  Handling the migration will be painful, of course.

Paolo and I believe the code around @pending_deleted_event has become
wrong.

@pending_deleted_event was created to get DEVICE_DELETED right for
recursively deleted devices (commit 352e8da74).  It did *not* "track the
pending unplug status".

It was later appropriated for other purposes (commit c000a9bd0,
9711cd0df, cce8944cc).  Paolo and I believe these are wrong.

>> using an internal flag that is related to the DRC (the 'hotplug state'
>> of the device).
>> 
>> The commit seems a bit odd because it is making a change in the common code
>> inside qmp_device_del() based on a PCI-e specific behavior. In the end this
>> doesn't impact any other device but PCI-e (it is the only device that uses
>> dev->pending_deleted_event to mark the start and finish of the unplug process),
>> but it's not something that I might expect in that function.

Concur.

>> IMO this verification should be removed from qmp_device_del and moved to
>> pcie_cap_slot_unplug_request_cb(). This would fix the problem for PCIe devices
>> without making assumptions about everything else.

A subset of {Igor, Julia, Juan} intends to look into this in time for 6.0.

>> > > As we're discussing we think we have a better way, but it relies on
>> > > guest changes, so we can't assume we already have that on the qemu
>> > > side.
>> > > 
>> > > > I'm aware that there's always that special use case, that we haven't seen yet,
>> > > > where this assumption is no longer valid. The plan is to change the spec and the
>> > > > guest kernel to signal the CPU hotunplug error back to QEMU before the dragon
>> > > > lands. For now, timing out the CPU hotunplug process when we're almost certain
>> > > > (but not 100%) that it failed in the guest is the best can do.
>> > > > 
>> > > > For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, avoiding
>> > > > guest visible changes when we change how we're detecting the unplug errors.
>> > > > 
>> > > > > > The second scenario is a memory hotunplug error. I found out that the pseries
>> > > > > > guest kernel does a reconfiguration step when re-attaching the DIMM right
>> > > > > > after refusing the hotunplug, and this reconfiguration is visible to QEMU.
>> > > > > > I proceeded to make the pseries machine detect this error case, rollback the
>> > > > > > unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
>> > > > > > by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
>> > > > > > well instead of the MEM specific one.
>> > > > > > 
>> > > > > > This investigation and work in the mem hotunplug error path triggered a
>> > > > > > discussion in qemu-ppc, where we're considering whether we should do the same
>> > > > > > signalling the kernel does for the DIMM hotunplug error for all other device
>> > > > > > hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
>> > > > > > and it's currently a no-op. We would make a LOPAR spec change to make this an
>> > > > > > official hotunplug error report mechanism, and all pseries hotunplug operations,
>> > > > > > for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>> > > > > > 
>> > > > > > Granted, the spec change + Kernel change is not something that we will be able
>> > > > > > to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
>> > > > > > already in place would make it easier for the future as well.
>> > > > > > 
>> > > > > > 
>> > > > > > I have a doc draft of these changes/infos that I forgot to post. I would post
>> > > > > > it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
>> > > > > > information there as well. Does that work for you as far as documentation
>> > > > > > goes?
>> > > > > 
>> > > > > A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
>> > > > > and device.
>> > > 
>> > > Ack.  Fwiw, I don't think this can ever be more than a "best effort"
>> > > notification.  Even with a machine and OS that should support it, a
>> > > guest bug or hang could mean that it never acks *or* nacks an unplug
>> > > request.
>> > 
>> > Since the success event is named DEVICE_DELETED, I'd name the
>> > probably-failed event DEVICE_NOT_DELETED.  Bonus: can read it as a
>> > statement of fact "still not deleted" instead of an error (that just
>> > might not be one).
>> 
>> 
>> "DEVICE_NOT_DELETED" sounds way better for what we want to express in the
>> pseries case when we can't be 100% sure of a guest side error. However,
>> there is at least one case where I'm sure of a guest side error (where I'm
>> using MEM_UNPLUG_ERROR), so DEVICE_UNPLUG_ERROR seems fitting in that case.
>> 
>> 
>> Should we add both DEVICE_NOT_DELETED and DEVICE_UNPLUG_ERROR then? I can use
>> both in pseries-6.0.0.

Separate QMP events are advisable when their meaning is different enough
for a management application to want to tell them apart.

[...]


