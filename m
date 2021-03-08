Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88B3314F2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:34:08 +0100 (CET)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJlf-0006Wz-PB
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJJIz-0004Hf-Gq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJJIv-0002yW-7o
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615223064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZjqPBOxqrXT5hBWJJqUcRx+oaw8KjcgUdD2glnWlpsQ=;
 b=ShPML00u6pwh2rhyO6KRdQysAFC/iUyp5CG4YpijUUngaNgopyzgmu3rwMD3GLo9fyZ87H
 JRcJfcA2Xk+cEZYB9OKah0urhrNEQmmXHdZSD4I1PYwkaZ9xNZl/KI5QuqvRqmry6qXJxg
 YOhno1Jm7Ht9abz8HBOKS1w+Qgn2XJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-lbH2_I1LPCC8bkMd_cE8ug-1; Mon, 08 Mar 2021 12:04:22 -0500
X-MC-Unique: lbH2_I1LPCC8bkMd_cE8ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6F5426860;
 Mon,  8 Mar 2021 17:04:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B2BC59451;
 Mon,  8 Mar 2021 17:04:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EC691132C12; Mon,  8 Mar 2021 18:04:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
Date: Mon, 08 Mar 2021 18:04:15 +0100
In-Reply-To: <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 8 Mar 2021 11:22:54 -0300")
Message-ID: <87blbt60hc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 3/6/21 3:57 AM, Markus Armbruster wrote:
>> Cc: ACPI maintainers for additional expertise.
>> 
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>> 
>>> Hi,
>>>
>>> Recent changes in pseries code (not yet pushed, available at David's
>>> ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report memory
>>> hotunplug errors in the pseries machine.
>>>
>>> The pseries machine is also using a timeout to cancel CPU hotunplugs that
>>> takes too long to finish (in which we're assuming a guest side error) and
>>> it would be desirable to also send a QAPI event for this case as well.
>>>
>>> At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACPI doesn't
>>> need it).
>> 
>> I see two interpretations of "ACPI doesn't need":
>> 
>> 1. Unplug can't fail, or QEMU can't detect failure.  Michael, Igor?
>> 
>> 2. Management applications haven't needed to know badly enough to
>> implement an event.
>> 
>>>            Before sending patches to implement this new event I had a talk
>>> with David Gibson and he suggested that, instead of adding a new CPU_UNPLUG_ERROR
>>> event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) that can be
>>> used by the pseries machine in both error scenarios (MEM and CPU).
>> 
>> Good point.  One general event is better than two special ones that
>> could easily grow siblings.
>> 
>>> This could also be used by x86 as well, although I believe the use of
>>> MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaking ABI.
>> 
>> Yes.  Our rules for interface deprecation apply.
>> 
>>> Any suggestions/comments?
>> 
>> We should document the event's reliability.  Are there unplug operations
>> where we can't detect failure?  Are there unplug operations where we
>> could, but haven't implemented the event?
>
> The current version of the PowerPC spec that the pseries machine implements
> (LOPAR) does not predict a way for the virtual machine to report a hotunplug
> error back to the hypervisor. If something fails, the hypervisor is left
> in the dark.
>
> What happened in the 6.0.0 dev cycle is that we faced a reliable way of

Do you mean "unreliable way"?

> making CPU hotunplug fail in the guest (trying to hotunplug the last online
> CPU) and the pseries machine was unprepared for dealing with it. We ended up
> implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
> that the CPU hotunplug failed in the guest. This is the first scenario we have
> today where we want to send a QAPI event informing the CPU hotunplug error,
> but this event does not exist in QEMU ATM.

When the timeout kicks in, how can you know the operation failed?  You
better be sure when you send an error event.  In other words: what
prevents the scenario where the operation is much slower than you
expect, the timeout expires, the error event is sent, and then the
operation completes successfully?

> The second scenario is a memory hotunplug error. I found out that the pseries
> guest kernel does a reconfiguration step when re-attaching the DIMM right
> after refusing the hotunplug, and this reconfiguration is visible to QEMU.
> I proceeded to make the pseries machine detect this error case, rollback the
> unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
> by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
> well instead of the MEM specific one.
>
> This investigation and work in the mem hotunplug error path triggered a
> discussion in qemu-ppc, where we're considering whether we should do the same
> signalling the kernel does for the DIMM hotunplug error for all other device
> hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
> and it's currently a no-op. We would make a LOPAR spec change to make this an
> official hotunplug error report mechanism, and all pseries hotunplug operations,
> for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.
>
> Granted, the spec change + Kernel change is not something that we will be able
> to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
> already in place would make it easier for the future as well.
>
>
> I have a doc draft of these changes/infos that I forgot to post. I would post
> it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
> information there as well. Does that work for you as far as documentation
> goes?

A DEVICE_UNPLUG_ERROR event makes perfect sense regardless of machine
and device.

I'm not asking you to to implement it for all machines and devices.  But
I want its design to support growth towards that goal, and its
documentation reflect its current state.

In particular, the doc comment in the QAPI schema should list the
limitation.  If the event is only implemented for LOPAR for now, say so.
If it's only implemented for certain devices, say so.

Questions?


