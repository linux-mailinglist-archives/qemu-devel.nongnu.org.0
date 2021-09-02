Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C62400064
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:21:34 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM98P-0004KQ-MU
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w5-0007b1-DW
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w2-0001Ti-Da
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ngIOU+LhpalEDTc/4a7xSic+N10ODg+lmCLzceQ77uU=;
 b=T1vPnGi2yDeTvui6GAuhQ+U8iCLTa9239PtXs3kQOjR1h/lewc+ajnGZ4oNw5xGNCmBFnM
 aJEE3uKCr/deOCQWTMRbKoyVLE0MgwUQp1RpcTSIlqWTV6repwDjlf9zRv8whmy8r/hP3L
 6AkyZqqsHcPnS4qq95S05m+oniM2y80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-h7QP_z1yPXGzpfgzaLYDDA-1; Fri, 03 Sep 2021 09:08:44 -0400
X-MC-Unique: h7QP_z1yPXGzpfgzaLYDDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F1C100670E
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 13:08:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 171E612D4A;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C289B11326A4; Thu,  2 Sep 2021 17:26:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s>
Date: Thu, 02 Sep 2021 17:26:57 +0200
In-Reply-To: <YTDVh9/MVAfCdkeu@t490s> (Peter Xu's message of "Thu, 2 Sep 2021
 09:45:43 -0400")
Message-ID: <871r6780ce.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Daniel P . =?utf-8?Q?Berrang?= =?utf-8?Q?=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Thu, Sep 02, 2021 at 10:26:16AM +0200, Igor Mammedov wrote:
>> On Mon, 30 Aug 2021 15:02:53 -0400
>> Peter Xu <peterx@redhat.com> wrote:
>> 
>> > On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
>> > > > > A simple state machine can track "has IOMMU" state.  It has three states
>> > > > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
>> > > > > that needs to know".  State diagram:
>> > > > > 
>> > > > >                           no so far
>> > > > >                    +--- (start state) ---+
>> > > > >                    |                     |
>> > > > >          add IOMMU |                     | add device that
>> > > > >                    |                     |  needs to know
>> > > > >                    v                     v
>> > > > >              +--> yes                    no <--+
>> > > > >              |     |   add device that   |     |
>> > > > >              +-----+    needs to know    +-----+
>> > > > > 
>> > > > > "Add IOMMU" in state "no" is an error.  
>> > > > 
>> > > > question is how we distinguish "device that needs to know"
>> > > > from device that doesn't need to know, and then recently
>> > > > added feature 'bypass IOMMU' adds more fun to this.  
>> > > 
>> > > Maybe we can start from "no device needs to know"? Then add more into it when
>> > > the list expands.
>> > > 
>> > > vfio-pci should be a natural fit because we're sure it won't break any valid
>> > > old configurations.  However we may need to be careful on adding more devices,
>> > > e.g. when some old configuration might work on old binaries, but I'm not sure.  
>> > 
>> > Btw, I think this state machine is indeed bringing some complexity on even
>> > understanding it - it is definitely working but it's not obvious to anyone at
>> > the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
>> > yet another state machine for some other ordering constraints?
>> >
>> > From that POV, I don't like this solution more than the simple "assign priority
>> > for device realization" idea..
>> It seems simple but implicit dependencies are fragile (good or
>> I'd rather say bad example implicit dependencies is vl.c magic code,
>> where changing order of initialization can easily break QEMU,
>> which happens almost every time it's refactored),
>
> True.  I was never able of telling whether that comes from natural complexity
> of the piece of software or there's indeed some smarter moves.
>
>> and as Markus already mentioned it won't work in QMP case.
>
> I didn't ask before, but I do have a question on whether that's a real problem.
>
> When QMP interface is ready, we should have a last phase of "preconfig done"
> command, right?  I thought it was "x-exit-preconfig" now, but I'm not sure so
> am guessing.  If so, can we do the reorder there and postpone all device
> creations, maybe?  Then the ordering properties can be applied there too.

This would regress error reporting.

A significant advantage of doing configuration in basic steps is the
relative ease of pinpointing what exactly fails.

If you change device_add to merely record the request for later, you
delay the non-trivial failures until later.

Compare:

    -> {'execute':'device_add','arguments':{'driver':'virtio-blk',"drive": "foo"}}
    <- {"error": {"class": "GenericError", "desc": "Device needs media, but drive is empty"}}

to getting the same error in reply to x-exit-preconfig, with a dozen or
two device_add queued up.

The error comes from virtio_blk_device_realize(), which you propose to
delay until x-exit-preconfig.

In theory, we can rework all the errors in question to provide
sufficient context, and rework libvirt to pick the context apart, so it
can pinpoint what's wrong in the user's configuration.  In practice,
thanks, but no thanks.

> The other thing is I think only libvirt will use the QMP case even if it'll be
> ready, and libvirt will need to know the ordering already like vIOMMU and vfio
> and pci buses - even if a new qemu supported the ordering of all these, libvirt
> still need to support old qemu binaries (and the code is already there anyway)
> and it's fairly natural they initiate the QMP commands using the same ordering.

This is actually a pretty strong argument for not having QEMU reorder at
all.

> IMHO it means ordering for QMP is not as important as cmdline if that's always
> initiated by another software.
>
>> 
>> What could work for both cases is explicit dependencies,
>> however it would be hard to describe such dependency in this case,
>> where device can work both with and without IOMMU depending
>> on the bus settings it's attached to.
>> 
>> Have you considered another approach, i.e. instead of reordering,
>> change vfio-pci device model to reconfigure DMA address space
>> after realize time (ex: at reset time)?
>
> Yes, I agree this seems to be the cleanest appproach.  It may just need more
> changes and they'll be on vfio, and I'm not aware of the rest (Jason should
> know better on virtio/vdpa).
>
> The other thing is some dependency cannot be resolved by this, e.g., the pci
> bus issue where we put the pci bus to be after the device that it owns.  But
> indeed we're already early-fail that now so it seems ok.

Yes, that's a complete non-problem :)

> Side note: from my gut feeling I still think at some point we shouldn't do the
> early-failure for cases in the case of pci bus and device - the cmdline
> obviously contains enough information on the dependency on "this pci device
> needs that pci bus", and early-fail does seem to be an work-around to me just
> because they specified in the wrong order.

Again, there are two sane command line evaluation orders: (1) strictly
left to right, and (2) order doesn't matter.  QEMU of course does (3)
unpredicable for humans without referring back to the source code.

The difficulty with getting to (1) is mostly compatibility and putting
in the work.  Reporting when things don't get created in time nicely and
reliably is yet more work.  Not particularly challenging, just work.

Getting to a reliable version of (2) feels like a pipe dream to me.


