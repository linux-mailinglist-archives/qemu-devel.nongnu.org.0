Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42929AD8E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 14:39:36 +0100 (CET)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPC9-0007GO-KU
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 09:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kXOes-0005PH-Tv
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kXOeq-0003Bk-M4
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603803898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KhEc9GF+Agx8r2cHEEnEbHXE40/IYJVZQzuq7Lj5ZKI=;
 b=KRI+OBj1lgrfzfU3oBhvbAEKYvHB3o/KCse9g8nOCJpl4pvGWXsndotcJAvpuvF4nlZCon
 h68H7AM91pdJUfSoU+1cOX3uP1DV11b6kaHeDi6qzjvVLqeH+T+I+38VyURX+CObHph9Rg
 ZhNxdxPVvQFaCGlLnocDoWBU2iQtNuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-JEHGf9qbN8iXCRhp0ISg5w-1; Tue, 27 Oct 2020 09:04:57 -0400
X-MC-Unique: JEHGf9qbN8iXCRhp0ISg5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF24159;
 Tue, 27 Oct 2020 13:04:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-179.ams2.redhat.com [10.36.115.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0723810013C0;
 Tue, 27 Oct 2020 13:04:49 +0000 (UTC)
Date: Tue, 27 Oct 2020 09:04:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Felipe Franciosi <felipe@nutanix.com>
Subject: Re: [PATCH] virtio: skip guest index check on device load
Message-ID: <20201027090420-mutt-send-email-mst@kernel.org>
References: <20201026151328.77611-1-felipe@nutanix.com>
 <20201027113049.GH79063@stefanha-x1.localdomain>
 <20201027082337-mutt-send-email-mst@kernel.org>
 <12146644-5D22-4CAC-9B4F-F16E84ED56AE@nutanix.com>
 <20201027085447-mutt-send-email-mst@kernel.org>
 <AE57D4EC-2C3C-4C22-9203-38A61D87B31F@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <AE57D4EC-2C3C-4C22-9203-38A61D87B31F@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 01:02:59PM +0000, Felipe Franciosi wrote:
> 
> 
> > On Oct 27, 2020, at 12:56 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > 
> > On Tue, Oct 27, 2020 at 12:53:29PM +0000, Felipe Franciosi wrote:
> >> 
> >> 
> >>> On Oct 27, 2020, at 12:25 PM, Michael S. Tsirkin <mst@redhat.com> wrote:
> >>> 
> >>> On Tue, Oct 27, 2020 at 11:30:49AM +0000, Stefan Hajnoczi wrote:
> >>>> On Mon, Oct 26, 2020 at 03:13:32PM +0000, Felipe Franciosi wrote:
> >>>>> QEMU must be careful when loading device state off migration streams to
> >>>>> prevent a malicious source from exploiting the emulator. Overdoing these
> >>>>> checks has the side effect of allowing a guest to "pin itself" in cloud
> >>>>> environments by messing with state which is entirely in its control.
> >>>>> 
> >>>>> Similarly to what f3081539 achieved in usb_device_post_load(), this
> >>>>> commit removes such a check from virtio_load(). Worth noting, the result
> >>>>> of a load without this check is the same as if a guest enables a VQ with
> >>>>> invalid indexes to begin with. That is, the virtual device is set in a
> >>>>> broken state (by the datapath handler) and must be reset.
> >>>>> 
> >>>>> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> >>>>> ---
> >>>>> hw/virtio/virtio.c | 12 ------------
> >>>>> 1 file changed, 12 deletions(-)
> >>>>> 
> >>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >>>>> index 6f8f865aff..0561bdb857 100644
> >>>>> --- a/hw/virtio/virtio.c
> >>>>> +++ b/hw/virtio/virtio.c
> >>>>> @@ -3136,8 +3136,6 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
> >>>>>    RCU_READ_LOCK_GUARD();
> >>>>>    for (i = 0; i < num; i++) {
> >>>>>        if (vdev->vq[i].vring.desc) {
> >>>>> -            uint16_t nheads;
> >>>>> -
> >>>>>            /*
> >>>>>             * VIRTIO-1 devices migrate desc, used, and avail ring addresses so
> >>>>>             * only the region cache needs to be set up.  Legacy devices need
> >>>>> @@ -3157,16 +3155,6 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
> >>>>>                continue;
> >>>>>            }
> >>>>> 
> >>>>> -            nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
> >>>>> -            /* Check it isn't doing strange things with descriptor numbers. */
> >>>>> -            if (nheads > vdev->vq[i].vring.num) {
> >>>>> -                error_report("VQ %d size 0x%x Guest index 0x%x "
> >>>>> -                             "inconsistent with Host index 0x%x: delta 0x%x",
> >>>>> -                             i, vdev->vq[i].vring.num,
> >>>>> -                             vring_avail_idx(&vdev->vq[i]),
> >>>>> -                             vdev->vq[i].last_avail_idx, nheads);
> >>>>> -                return -1;
> >>>>> -            }
> >>>> 
> >>>> Michael, the commit that introduced this check seems to have been for
> >>>> debugging rather than to prevent a QEMU crash, so this removing the
> >>>> check may be safe:
> >>>> 
> >>>> commit 258dc7c96bb4b7ca71d5bee811e73933310e168c
> >>>> Author: Michael S. Tsirkin <mst@redhat.com>
> >>>> Date:   Sun Oct 17 20:23:48 2010 +0200
> >>>> 
> >>>>     virtio: sanity-check available index
> >>>> 
> >>>>     Checking available index upon load instead of
> >>>>     only when vm is running makes is easier to
> >>>>     debug failures.
> >>> 
> >>> Agreed. Given this, let's keep the message around, just with
> >>> LOG_GUEST_ERROR ?
> >> 
> >> I thought about it. Happy to send a v2 which keeps the check and logs
> >> without throwing an error.
> >> 
> >> Separately, I'm thinking of hooking up QEMU with VRING_ERR so datapath
> >> handlers can notify QEMU that something went broken and NEEDS_RESET
> >> can be flipped on the status register, possibly along a configuration
> >> interrupt. I can see libvhost-user supports that, but are there any
> >> reasons QEMU doesn't do this already?
> > 
> > Mostly because guest support isn't there. That in turn isn't easy,
> > lots of synchronization is needed within guests.
> 
> Do you mean guest support to reset when seeing that bit in status
> following the configuration interrupt?
> 
> It should be safe, though. I can have a stab to see if it breaks
> Windows/Linux at least, and share an RFC if I get anywhere.
> 
> Unless you think it's a waste of time. Ideally guests shouldn't find
> themselves in this situation to begin with, and if they did, resetting
> would arguably just lead them into corruption again (for example). But
> it does provide a mechanism for QEMU to find out that the vhost
> backend stopped. That would help in the context of this patch.
> 
> F.


It's not a waste of time, it's just a lot of work
within guests.

> > 
> > 
> >>> 
> >>>> Felipe: Did you audit the code to make sure the invalid avail_idx value
> >>>> and the fields it is propagated to (e.g. shadow_avail_idx) are always
> >>>> used in a safe way?
> >>> 
> >> 
> >> I did it briefly. I also wrote a mock userspace driver that creates
> >> this condition in a very controlled way (so I can step half-way
> >> through setting up VQs and trigger a migration, for example). But you
> >> know how manual tests are... I may have missed something.
> >> Your expert eyes are most welcome. :)
> >> 
> >> F.
> > 


