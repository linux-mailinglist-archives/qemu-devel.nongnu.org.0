Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BD0D3CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:55:25 +0200 (CEST)
Received: from localhost ([::1]:48000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIrdq-0002Gr-AY
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iIrc9-00016q-Ne
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iIrc1-0001Nj-B0
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:53:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iIraX-0000TM-GB
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:53:29 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 592493B72D
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 09:51:55 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id j7so4120322wrx.14
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 02:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5HxG/uAPAqo+4HTdG3rZOVxxqSeoToSmsMndcXyg4UM=;
 b=gaRoxhVslj0pYjOaNvAJjzPcuBefqzsjhriC55HSrIXnwvsBjHbzN2Zw1bsyZsPw+k
 AMMbavFRcQ0sqN6Oj5UchszMgkw+8OuFM/SFF0UTgZjIFOZpVh9IWofJTuwiasiO9eB2
 A0Hb+KeW3e6dqllIHBGhi+nswV7NmQdQm46TCTgt/vI3mKzRDnrx8lDpqWe7Xv+oS+Bu
 DaDAF9fnnBSKwtOA9UrMc/6XcSY/G47Urw7hxOYPS/SLWrUSeFaGuV92b8PaNrp/OXdn
 +g32LkOyT2WnDWe0BmyUJCyIqGFOO/HT2UGCCCf4mSg7oqSO/yI6E/EfL/U1Vxkn8s19
 K5Zw==
X-Gm-Message-State: APjAAAW2tdf1EfQwM8OKlAIVnyBrx+//X7/kVrOQZESyxq1H9xGEOz1c
 XyskH/JVI59VJvcraaunoJQmG6muIuy7Y+ZcD5BxHtBwJMXcgQcBynMt0n/F6MdWou52zO0ZIvC
 hTGtqb0lwfMHKNb4=
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr11948086wrv.42.1570787513326; 
 Fri, 11 Oct 2019 02:51:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4UnqvtB8wJHLc4Byu11+xPUVIU0vmhrbxxNBtCiVWrdM45SrDHu7L221vK6QjzCsL79MFbw==
X-Received: by 2002:a5d:4ec1:: with SMTP id s1mr11948065wrv.42.1570787513044; 
 Fri, 11 Oct 2019 02:51:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
 by smtp.gmail.com with ESMTPSA id
 u1sm7189102wmc.38.2019.10.11.02.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 02:51:51 -0700 (PDT)
Date: Fri, 11 Oct 2019 05:51:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Subject: Re: [RFC 2/2] virtio-net: use post load hook
Message-ID: <20191011055111-mutt-send-email-mst@kernel.org>
References: <20191010180412.26236-1-mst@redhat.com>
 <20191010180412.26236-2-mst@redhat.com>
 <CALHVEJYqJ+4nvuXb27-1CKkZ=EL0QyEQY_qYRDYGk9kUWdR7kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHVEJYqJ+4nvuXb27-1CKkZ=EL0QyEQY_qYRDYGk9kUWdR7kw@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 11, 2019 at 11:46:22AM +0200, Mikhail Sennikovsky wrote:
> Hi Michael,
> 
> Unfortunately your approach will not work, because the
> VirtIONet::curr_guest_offloads would still be reset in
> virtio_net_set_features:
> --
> if (n->has_vnet_hdr) {
>     n->curr_guest_offloads =
>         virtio_net_guest_offloads_by_features(features);

So let's move that part to the new hook too.

> --
> ( https://github.com/qemu/qemu/blob/master/hw/net/virtio-net.c#L774 )
> 
> I.e. although virtio_net_apply_guest_offloads would now be called
> after the virtio_net_set_features, by the time it is called the
> VirtIONet::curr_guest_offloads would be reset to a full list of
> features.
> 
> Regards,
> Mikhail
> 
> Am Do., 10. Okt. 2019 um 20:04 Uhr schrieb Michael S. Tsirkin <mst@redhat.com>:
> >
> > Currently offloads disabled by guest via the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> > command are not preserved on VM migration.
> > Instead all offloads reported by guest features (via VIRTIO_PCI_GUEST_FEATURES)
> > get enabled.
> > What happens is: first the VirtIONet::curr_guest_offloads gets restored
> > and offloads are getting set correctly:
> >
> >  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=0, tso6=0, ecn=0, ufo=0) at net/net.c:474
> >  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
> >  #2  virtio_net_post_load_device (opaque=0x555557701ca0, version_id=11) at hw/net/virtio-net.c:2334
> >  #3  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577c80 <vmstate_virtio_net_device>, opaque=0x555557701ca0, version_id=11)
> >      at migration/vmstate.c:168
> >  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2197
> >  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
> >  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
> >  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
> >  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
> >  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
> >  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
> >  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> >
> > However later on the features are getting restored, and offloads get reset to
> > everything supported by features:
> >
> >  #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=1, tso6=1, ecn=0, ufo=0) at net/net.c:474
> >  #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
> >  #2  virtio_net_set_features (vdev=0x555557701ca0, features=5104441767) at hw/net/virtio-net.c:773
> >  #3  virtio_set_features_nocheck (vdev=0x555557701ca0, val=5104441767) at hw/virtio/virtio.c:2052
> >  #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2220
> >  #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
> >  #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
> >  #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
> >  #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
> >  #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
> >  #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
> >  #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449
> >
> > Fix this by pushing out offload initialization to the new post load hook.
> >
> > Reported-by: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9f11422337..62fb858e2d 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -2333,10 +2333,6 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> >          n->curr_guest_offloads = virtio_net_supported_guest_offloads(n);
> >      }
> >
> > -    if (peer_has_vnet_hdr(n)) {
> > -        virtio_net_apply_guest_offloads(n);
> > -    }
> > -
> >      virtio_net_set_queues(n);
> >
> >      /* Find the first multicast entry in the saved MAC filter */
> > @@ -2370,6 +2366,15 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
> >      return 0;
> >  }
> >
> > +static int virtio_net_post_load_virtio(VirtIODevice *vdev)
> > +{
> > +    if (peer_has_vnet_hdr(n)) {
> > +        virtio_net_apply_guest_offloads(n);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  /* tx_waiting field of a VirtIONetQueue */
> >  static const VMStateDescription vmstate_virtio_net_queue_tx_waiting = {
> >      .name = "virtio-net-queue-tx_waiting",
> > @@ -2912,6 +2917,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
> >      vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
> >      vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;
> >      vdc->legacy_features |= (0x1 << VIRTIO_NET_F_GSO);
> > +    vdc->post_load = virtio_net_post_load_virtio;
> >      vdc->vmsd = &vmstate_virtio_net_device;
> >  }
> >
> > --
> > MST
> >

