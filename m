Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251D338EFA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:41:32 +0100 (CET)
Received: from localhost ([::1]:56434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKi2l-0001tQ-IL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:41:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laine@redhat.com>) id 1lKi0W-0000pG-1q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:39:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <laine@redhat.com>) id 1lKi0P-0002YY-Nb
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615556339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnRe1gar5v2yTd3BVp3UHd7o185jmamIM65cWhqjB0k=;
 b=cO8F23D/xv1Q0f42jAshm3oLZGxsTQe16iomuOcvcRCi7dU/FZJgPoBHi6HFQd7MCyXGXZ
 HAjcyR/FOb7dMZhJEFZVOJx1LrMlRFu6KmanqrS4Wvj9HUqpcAOp0LSUSA5lJrzlWs+xvB
 blcqqI8o63CMZj7Uj2INCtCxBK4JVXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-yv_NiEQWPgKhh6zzBa-Xkw-1; Fri, 12 Mar 2021 08:38:58 -0500
X-MC-Unique: yv_NiEQWPgKhh6zzBa-Xkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6B3192D785;
 Fri, 12 Mar 2021 13:38:56 +0000 (UTC)
Received: from [10.10.116.99] (ovpn-116-99.rdu2.redhat.com [10.10.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7CA60636;
 Fri, 12 Mar 2021 13:38:48 +0000 (UTC)
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
From: Laine Stump <laine@redhat.com>
Message-ID: <70a596e0-102c-60ce-ccf7-6c961fa5eec3@redhat.com>
Date: Fri, 12 Mar 2021 08:38:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YErBpf7w25xho1so@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=laine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=laine@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 8:19 PM, David Gibson wrote:
> On Thu, Mar 11, 2021 at 05:50:42PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/9/21 3:22 AM, Markus Armbruster wrote:
>>> Cc: Paolo and Julia in addition to Igor, because the thread is wandering
>>> towards DeviceState member pending_deleted_event.
>>>
>>> Cc: Laine for libvirt expertise.  Laine, if you're not the right person,
>>> please loop in the right person.
>>>
>>> David Gibson <david@gibson.dropbear.id.au> writes:
>>>
>>>> On Mon, Mar 08, 2021 at 03:01:53PM -0300, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 3/8/21 2:04 PM, Markus Armbruster wrote:
>>>>>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>>>>>
>>>>>>> On 3/6/21 3:57 AM, Markus Armbruster wrote:
>>> [...]
>>>>>>>> We should document the event's reliability.  Are there unplug operations
>>>>>>>> where we can't detect failure?  Are there unplug operations where we
>>>>>>>> could, but haven't implemented the event?
>>>>>>>
>>>>>>> The current version of the PowerPC spec that the pseries machine implements
>>>>>>> (LOPAR) does not predict a way for the virtual machine to report a hotunplug
>>>>>>> error back to the hypervisor. If something fails, the hypervisor is left
>>>>>>> in the dark.
>>>>>>>
>>>>>>> What happened in the 6.0.0 dev cycle is that we faced a reliable way of
>>>>>>
>>>>>> Do you mean "unreliable way"?
>>>>>
>>>>> I guess a better word would be 'reproducible', as in we discovered a reproducible
>>>>> way of getting the guest kernel to refuse the CPU hotunplug.
>>>>
>>>> Right.  It's worth noting here that in the PAPR model, there are no
>>>> "forced" unplugs.  Unplugs always consist of a request to the guest,
>>>> which is then resposible for offlining the device and signalling back
>>>> to the hypervisor that it's done with it.
>>>>
>>>>>>> making CPU hotunplug fail in the guest (trying to hotunplug the last online
>>>>>>> CPU) and the pseries machine was unprepared for dealing with it. We ended up
>>>>>>> implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
>>>>>>> that the CPU hotunplug failed in the guest. This is the first scenario we have
>>>>>>> today where we want to send a QAPI event informing the CPU hotunplug error,
>>>>>>> but this event does not exist in QEMU ATM.
>>>>>>
>>>>>> When the timeout kicks in, how can you know the operation failed?  You
>>>>>> better be sure when you send an error event.  In other words: what
>>>>>> prevents the scenario where the operation is much slower than you
>>>>>> expect, the timeout expires, the error event is sent, and then the
>>>>>> operation completes successfully?
>>>>>
>>>>> A CPU hotunplug in a pseries guest takes no more than a couple of seconds, even
>>>>> if the guest is under heavy load. The timeout is set to 15 seconds.
>>>>
>>>> Right.  We're well aware that a timeout is an ugly hack, since it's
>>>> not really possible to distinguish it from a guest that's just being
>>>> really slow.
>>>
>>> As long as unplug failure cannot be detected reliably, we need a timeout
>>> *somewhere*.  I vaguely recall libvirt has one.  Laine?
>>
>> Yeah, Libvirt has a timeout for hotunplug operations. I agree that QEMU doing
>> the timeout makes more sense since it has more information about the
>> conditions/mechanics involved.
> 
> Right.  In particular, I can't really see how libvirt can fully
> implement that timeout.  AFAIK qemu has no way of listing or
> cancelling "in flight" unplug requests, so it's entirely possible that
> the unplug could still complete after libvirt's has "timed out".

(I'm purposefully not trying to understand the full context of all of 
this, as I'm mostly unconnected right now, and only popped in at the 
mention of my name and CC. So forgive me if I'm missing some of the 
details of the conversation - I'm only here to give context about 
libvirt's timeout during unplug)

I didn't remember there being any sort of timeout for unplugs in 
libvirt, so I went back into the code and found that there *is* a 
timeout (I'd just forgotten that I'd ever seen it), but (for PCI 
devices, which is the only hotplug/unplug code I have any real 
familiarity with) it is just a short (10 seconds for PPC, 5 seconds for 
other platforms) to see if the unplug can complete before the public API 
returns; if there is a "timeout" then we still return success (after 
logging a warning message) but the device stays in the domain's device 
list, and nothing else is changed unless/until we receive a 
DEVICE_DELETED event from qemu (completely asynchronous - libvirt's API 
has long ago returned success) - only then do we remove the device from 
libvirt's domain status. libvirt won't/can't ever go back and 
retroactively fail the API that's already completed successfully though :-)

For VCPUs (which I guess is what you're exclusively talking about here) 
it looks like libvirt waits for the same 5-10 seconds (during the unplug 
API call) and if it hasn't received DEVICE_DELETED, then it returns an 
error:

     if ((rc = qemuDomainWaitForDeviceRemoval(vm)) <= 0) {
         if (rc == 0)
             virReportError(VIR_ERR_OPERATION_TIMEOUT, "%s",
                            _("vcpu unplug request timed out. Unplug 
result "
                              "must be manually inspected in the domain"));

         goto cleanup;
     }

Here's what Peter says in the commit log when he replaced old-useless 
VCPU unplug code with new-working code in 2016:

     As the new code is using device_del all the implications of using it
     are present. Contrary to the device deletion code, the vcpu deletion
     code fails if the unplug request is not executed in time.

I have no clue why in the case of PCI devices libvirt is logging a 
warning and returning success, while in the case of VCPUs it is logging 
an error and returning failure. I think there may have originally been a 
stated/unstated assumption that the libvirt unplug APIs were 
synchronous, and both situations were just the result of later trying to 
cope with the reality that the operation is actually asynchronous.

>> At this moment, the only case I know of hotunplug operations timing out in
>> QEMU is what we did with CPU hotunplug in pseries though. I can't tell if
>> unplug timeout is desirable mechanism for other machines/device types.
>>
>>> Putting the timeout in QEMU might be better.  QEMU might be in a better
>>> position to pick a suitable timeout.
>>>
>>>> It was the best thing we could come up with in the short term though.
>>>> Without the changes we're suggesting here, the guest can positively
>>>> assert the unplug is complete, but it has no way to signal failure.
>>>> So, without a timeout qemu is stuck waiting indefinitely (or at least
>>>> until the next machine reset) on the guest for an unplug that might
>>>> never complete.
>>>>
>>>> It's particularly nasty if the guest does really fail the hotplug
>>>> internally, but then conditions change so that the same unplug could
>>>> now succeed.  The unplug request is just a message - there's no guest
>>>> visible persistent state saying we want the device unplugged, so if
>>>> conditions change the guest won't then re-attempt the unplug.
>>>> Meanwhile the user can't re-attempt the device_del, because on the
>>>> qemu side it's still stuck in a pending unplug waiting on the guest.
>>>
>>> "Can't re-attempt" feels like a bug.  Let me explain.
> 
> You may be right.  Perhaps we should just send another unplug message
> if we get a device_del on something that's already pending deletion.
> AFAICT repeated unplug messages for the same device should be
> harmless.
> 
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
>>
>> As for the commit mentioned below:
>>
>>>
>>> Depending on the device, device_del can complete the unplug, or merely
>>> initiate it.  Documentation:
>>>
>>> # Notes: When this command completes, the device may not be removed from the
>>> #        guest.  Hot removal is an operation that requires guest cooperation.
>>> #        This command merely requests that the guest begin the hot removal
>>> #        process.  Completion of the device removal process is signaled with a
>>> #        DEVICE_DELETED event. Guest reset will automatically complete removal
>>> #        for all devices.
>>>
>>> This is not as accurate as it could be.  Behavior depends on the device.
>>>
>>> For some kinds of devices, the command completes the unplug before it
>>> sends its reply.  Example: USB devices.  Fine print: the DEVICE_DELETED
>>> event gets send with a slight delay because device cleanup uses RCU.
>>>
>>> For others, notably PCI devices, the command only pokes the guest to do
>>> its bit.  QEMU reacts to the guest's actions, which eventually leads to
>>> the actual unplug.  DEVICE_DELETED gets sent then.  If the guest doesn't
>>> play ball to the end, the event doesn't get send.
>>>
>>> The "can't retry unplug" behavior is new.  Another device_del used to
>>> simply poke the guest again.
> 
> Maybe on x86.  I think a repeated device_del was at best a no-op on
> PAPR.
> 
>>> I think this regressed in commit
>>> cce8944cc9 "qdev-monitor: Forbid repeated device_del", 2020-02-25.
>>> Feels like a must-fix for 6.0.
>>
>>
>> This doesn't directly affect pseries code because we're not using
>> dev->pending_deleted_event to track the pending unplug status. We're
> 
> Huh... I didn't know about pending_deleted_event.  Maybe we *should*
> be using that.  Handling the migration will be painful, of course.
> 
>> using an internal flag that is related to the DRC (the 'hotplug state'
>> of the device).
>>
>> The commit seems a bit odd because it is making a change in the common code
>> inside qmp_device_del() based on a PCI-e specific behavior. In the end this
>> doesn't impact any other device but PCI-e (it is the only device that uses
>> dev->pending_deleted_event to mark the start and finish of the unplug process),
>> but it's not something that I might expect in that function.
>>
>> IMO this verification should be removed from qmp_device_del and moved to
>> pcie_cap_slot_unplug_request_cb(). This would fix the problem for PCIe devices
>> without making assumptions about everything else.
>>
>>
>>>
>>>> As we're discussing we think we have a better way, but it relies on
>>>> guest changes, so we can't assume we already have that on the qemu
>>>> side.
>>>>
>>>>> I'm aware that there's always that special use case, that we haven't seen yet,
>>>>> where this assumption is no longer valid. The plan is to change the spec and the
>>>>> guest kernel to signal the CPU hotunplug error back to QEMU before the dragon
>>>>> lands. For now, timing out the CPU hotunplug process when we're almost certain
>>>>> (but not 100%) that it failed in the guest is the best can do.
>>>>>
>>>>> For both cases I want to use DEVICE_UNPLUG_ERROR right from the start, avoiding
>>>>> guest visible changes when we change how we're detecting the unplug errors.
>>>>>
>>>>>>> The second scenario is a memory hotunplug error. I found out that the pseries
>>>>>>> guest kernel does a reconfiguration step when re-attaching the DIMM right
>>>>>>> after refusing the hotunplug, and this reconfiguration is visible to QEMU.
>>>>>>> I proceeded to make the pseries machine detect this error case, rollback the
>>>>>>> unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
>>>>>>> by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
>>>>>>> well instead of the MEM specific one.
>>>>>>>
>>>>>>> This investigation and work in the mem hotunplug error path triggered a
>>>>>>> discussion in qemu-ppc, where we're considering whether we should do the same
>>>>>>> signalling the kernel does for the DIMM hotunplug error for all other device
>>>>>>> hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
>>>>>>> and it's currently a no-op. We would make a LOPAR spec change to make this an
>>>>>>> official hotunplug error report mechanism, and all pseries hotunplug operations,
>>>>>>> for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>>>>>>>
>>>>>>> Granted, the spec change + Kernel change is not something that we will be able
>>>>>>> to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
>>>>>>> already in place would make it easier for the future as well.
>>>>>>>
>>>>>>>
>>>>>>> I have a doc draft of these changes/infos that I forgot to post. I would post
>>>>>>> it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
>>>>>>> information there as well. Does that work for you as far as documentation
>>>>>>> goes?
>>>>>>
>>>>>> A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
>>>>>> and device.
>>>>
>>>> Ack.  Fwiw, I don't think this can ever be more than a "best effort"
>>>> notification.  Even with a machine and OS that should support it, a
>>>> guest bug or hang could mean that it never acks *or* nacks an unplug
>>>> request.
>>>
>>> Since the success event is named DEVICE_DELETED, I'd name the
>>> probably-failed event DEVICE_NOT_DELETED.  Bonus: can read it as a
>>> statement of fact "still not deleted" instead of an error (that just
>>> might not be one).
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
>>
>>
>>
>>
>> Thanks,
>>
>>
>> DHB
>>
>>
>>>
>>>>>> I'm not asking you to to implement it for all machines and devices.  But
>>>>>> I want its design to support growth towards that goal, and its
>>>>>> documentation reflect its current state.
>>>>>>
>>>>>> In particular, the doc comment in the QAPI schema should list the
>>>>>> limitation.  If the event is only implemented for LOPAR for now, say so.
>>>>>> If it's only implemented for certain devices, say so.
>>>>>>
>>>>>> Questions?
>>>>>
>>>>>
>>>>> Nope. Thanks for the pointers. I'll add the DEVICE_UNPLUG_ERROR QAPI event
>>>>> in a way that it can be used by other machines in the future, and documenting
>>>>> where the event is being used ATM.
>>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>>
>>>>> DHB
>>>>>
>>>>>
>>>>>>
>>>>>
>>>
>>
> 


