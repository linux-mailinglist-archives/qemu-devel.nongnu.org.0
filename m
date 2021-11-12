Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B944EAE3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:56:36 +0100 (CET)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYuo-0006Nj-H6
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mlYtb-0005Gz-Rw
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:55:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mlYtZ-0004mp-CD
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636732516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+760LTtoGvK9S9T3GKPAud3xCXdNFrISENCZFhQLwA4=;
 b=e6+jjRhXBKW5WEL4+OXPIMStZSSHgImBOnIuZy8Xo9Bmqy8QsjsVcF+xeu0DMFgA2U1xWG
 xvHSvxdIdYiXej9Xm+5leuBXtsXQyhScZmyE1t9+GNU7B+aUzeQ4sw7R41PbJfZ7HyzZxz
 cwdga5fCreNGe5iFkMVqh1hXZbpahqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-e-1yC0azOX6JnkoxNey93w-1; Fri, 12 Nov 2021 10:55:13 -0500
X-MC-Unique: e-1yC0azOX6JnkoxNey93w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F17C101AFA7;
 Fri, 12 Nov 2021 15:55:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B55C35D9DC;
 Fri, 12 Nov 2021 15:55:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH v1 1/3] virtio: introduce virtio_force_modern()
In-Reply-To: <20211112164208.71a2ca73.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20211028220017.930806-1-pasic@linux.ibm.com>
 <20211028220017.930806-2-pasic@linux.ibm.com> <87tugzc26y.fsf@redhat.com>
 <20211112164208.71a2ca73.pasic@linux.ibm.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date: Fri, 12 Nov 2021 16:55:10 +0100
Message-ID: <874k8hmkrl.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 12 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri, 29 Oct 2021 16:53:25 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Fri, Oct 29 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
>> 
>> > Legacy vs modern should be detected via transport specific means. We
>> > can't wait till feature negotiation is done. Let us introduce
>> > virtio_force_modern() as a means for the transport code to signal
>> > that the device should operate in modern mode (because a modern driver
>> > was detected).
>> >
>> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> > ---
>> >
>> > I'm still struggling with how to deal with vhost-user and co. The
>> > problem is that I'm not very familiar with the life-cycle of, let us
>> > say, a vhost_user device.
>> >
>> > Looks to me like the vhost part might be just an implementation detail,
>> > and could even become a hot swappable thing.
>> >
>> > Another thing is, that vhost processes set_features differently. It
>> > might or might not be a good idea to change this.
>> >
>> > Does anybody know why don't we propagate the features on features_set,
>> > but under a set of different conditions, one of which is the vhost
>> > device is started?
>> > ---
>> >  hw/virtio/virtio.c         | 12 ++++++++++++
>> >  include/hw/virtio/virtio.h |  1 +
>> >  2 files changed, 13 insertions(+)
>> >
>> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> > index 3a1f6c520c..75aee0e098 100644
>> > --- a/hw/virtio/virtio.c
>> > +++ b/hw/virtio/virtio.c
>> > @@ -3281,6 +3281,18 @@ void virtio_init(VirtIODevice *vdev, const char *name,
>> >      vdev->use_guest_notifier_mask = true;
>> >  }
>> >  
>> > +void  virtio_force_modern(VirtIODevice *vdev)  
>> 
>> <bikeshed> I'm not sure I like that name. We're not actually forcing the
>> device to be modern, we just set an early indication in the device
>> before proper feature negotiation has finished. Maybe
>> virtio_indicate_modern()? </bikeshed>
>
>
> I don't like virtio_indicate_modern(dev) form object orientation
> perspective. In an OO language one would write it like
> dev.virtio_indicate_modern()
> which would read like the device should indicate modern to somebody.

I think that is actually what happens: we indicate that it is a modern
device to the code making the endianness decisions.

>
> In my opinion what happens is that we want to disable the legacy
> interface if it is exposed by the device, or in other words instruct the
> device that should act (precisely and exclusively) according to the
> interface specification of the modern interface.

I don't see us disabling anything; the driver has already chosen what
they want, and we simply need to make sure that all code honours that
decision.

>
> Maybe we can find a better name than force_modern, but I don't think
> indicate_modern is a better name.
>
>> 
>> > +{
>> > +    /*
>> > +     * This takes care of the devices that implement config space access
>> > +     * in QEMU. For vhost-user and similar we need to make sure the features
>> > +     * are actually propagated to the device implementing the config space.
>> > +     *
>> > +     * A VirtioDeviceClass callback may be a good idea.
>> > +     */
>> > +    virtio_set_features(vdev, (1ULL << VIRTIO_F_VERSION_1));  
>> 
>> Do we really need/want to do the whole song-and-dance for setting
>> features, just for setting VERSION_1? 
>
> When doing the whole song-and-dance the chance is higher that the
> information will propagate to every place it needs to reach. For
> example to the acked_features of vhost_dev. I've just posted a v2 RFC.
> It should not be hard to see what I mean after examining that RFC.
>
>> Devices may modify some of their
>> behaviour or features, depending on what features they are called with,
>
> I believe, if this is the case, we want the behavior that corresponds to
> VERSION_1 set, i.e. 'modern'. So in my understanding this is rather good
> than bad.
>
>> and we will be calling this one again later with what is likely a
>> different feature set. 
>
> That is true, but the driver is allowed to set the features multiple
> times, and since transports only support piecemeal access to the
> features (32 bits at a time), I guess this is biz as usual.

Also see my comment in the v2: I'm not sure how well tested that
actually is.

>
>>Also, the return code is not checked.
>> 
>
> That is true! It might be a good idea to log an error. Unfortunately I
> don't think there is anything else we can sanely do.
>
>> Maybe introduce a new function that sets guest_features directly and
>> errors out if the features are not set in host_features? 
>
> See above.
>
>> If we try to
>> set VERSION_1 here despite the device not offering it, we are in a
>> pickle anyway, as we should not have gotten here if we did not offer it,
>> and we really should moan and fail in that case.
>
> I agree about the moan part. I'm not sure what is the best way to
> 'fail'. Maybe we should continue this discussion in the v2 thread.

Yeah, let's continue there, since that code is a bit different.


