Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAF6E593B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:18:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poeez-0007Ok-OO; Tue, 18 Apr 2023 02:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1poeex-0007O8-EC
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1poeei-0006uJ-AU
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681798651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mc5Gga5+MBFtdGezcfpI6OQlHXQSFqZmJM3w/G0e87Y=;
 b=BKqRq6jCeQFiK6IO5WMcd+3sq+7C+bOucU3v0z9VvoleIBIaTD6YJDSp3FJSEkQL7sigww
 RDXxejNwDyprNHcDpv6hrjF1TNq3SQizAFYZL2JjQ5lw7clfSIwNi551lUgaHhzuKL3VAN
 qws5MvkoGwn9/kwuqekPQIQenn9IwfU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-M3gJhwqtMV6MynZun6vyDQ-1; Tue, 18 Apr 2023 02:17:29 -0400
X-MC-Unique: M3gJhwqtMV6MynZun6vyDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1745d08b5so4664375e9.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 23:17:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681798648; x=1684390648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mc5Gga5+MBFtdGezcfpI6OQlHXQSFqZmJM3w/G0e87Y=;
 b=C4YlFYHrNkDxJzbSct6dkGoLLSd5jLWvU/Qb4wBcyWviMy2BWwPLq1CHQm2zSjkw5S
 +bdmTFT1GvPYLRd51wT1ppk8JlQon6xEmLQ41wYmRpLfNpDnR2PQyMRB8o+00dUXYOK3
 MCcnu/Df3y4m9JB6LDtG5EWPKq6tJPekjWpnJzCTO7BhBf+xBEVThrg8VGnkKnrc2VOc
 hvqYyJt15eyM1bKB8F4cWxVH8JU/ClYNx5VSbBxjSK75Np1EzkjMf93S91DqkuNdtj4L
 +cAPBnO18WPwcHagroDIQKqmWrW/nC92n/w29RFymLaiJ4LNtwM5/BdxOOq9WZb5AoI3
 qrmQ==
X-Gm-Message-State: AAQBX9fZY34Imp803FiZg3KGaeJaC/11g6Bi76tbcr4PEC2k3e1MJMTw
 zL+ZqLGGO8YbBOxp7Ylm4rusltwj/8wGuKdLfmJrLIGv9O4BtEWl/inkqlYlGTGfRZMUyXWUjjn
 fCtWCOIl7SRYwVCk=
X-Received: by 2002:a5d:6b4c:0:b0:2f8:1ab3:6777 with SMTP id
 x12-20020a5d6b4c000000b002f81ab36777mr896381wrw.4.1681798648267; 
 Mon, 17 Apr 2023 23:17:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFpSqQSbQ+YLi5yP/zskvOnW1qEb+8ZA6VDSm348DvKjkFnxk3curVIfoJL5IPNBvzbGsU3g==
X-Received: by 2002:a5d:6b4c:0:b0:2f8:1ab3:6777 with SMTP id
 x12-20020a5d6b4c000000b002f81ab36777mr896361wrw.4.1681798647910; 
 Mon, 17 Apr 2023 23:17:27 -0700 (PDT)
Received: from redhat.com ([2.52.136.129]) by smtp.gmail.com with ESMTPSA id
 q27-20020a056000137b00b002fdf0f6b07csm241690wrz.67.2023.04.17.23.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 23:17:27 -0700 (PDT)
Date: Tue, 18 Apr 2023 02:17:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Andrey Ryabinin <arbn@yandex-team.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>,
 Ni Xun <nixun@baidu.com>,
 "d-tatianin@yandex-team.com" <d-tatianin@yandex-team.com>,
 "yc-core@yandex-team.com" <yc-core@yandex-team.com>,
 "vsementsov@yandex-team.com" <vsementsov@yandex-team.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
Message-ID: <20230418020505-mutt-send-email-mst@kernel.org>
References: <20230410083509.3311-1-arbn@yandex-team.com>
 <fcc6073f-280b-580e-b6f7-bc176a64e810@yandex-team.com>
 <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A73B3DE0-41D0-4EDC-B589-2647158AD2D4@nutanix.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 18, 2023 at 05:13:11AM +0000, Raphael Norwitz wrote:
> Hey Andrey - apologies for the late reply here.
> 
> It sounds like you are dealing with a buggy guest, rather than a QEMU issue.
> 
> > On Apr 10, 2023, at 11:39 AM, Andrey Ryabinin <arbn@yandex-team.com> wrote:
> > 
> > 
> > 
> > On 4/10/23 10:35, Andrey Ryabinin wrote:
> >> Some guests hang on boot when using the vhost-user-blk-pci device,
> >> but boot normally when using the virtio-blk device. The problem occurs
> >> because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
> >> before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
> 
> Virtio 1.1 Section 3.1.1, says during setup “[t]he driver MUST NOT notify the device before setting DRIVER_OK.”
> 
> Therefore what you are describing is buggy guest behavior. Sounds like the driver should be made to either
> - not advertise VIRTIO_F_VERSION_1
> - not kick before setting VIRTIO_CONFIG_S_DRIVER_OK
> 
> If anything, the virtio-blk virtio_blk_handle_output() function should probably check start_on_kick?

Question is, how easy is this guest to fix.



> >> be false in vhost_user_blk_handle_output() and preventing the device from
> >> starting.
> >> 
> >> Fix this by removing the check for vdev->start_on_kick to ensure
> >> that the device starts after the kick. This aligns the behavior of
> >> 'vhost-user-blk-pci' device with 'virtio-blk' as it does the similar
> >> thing in its virtio_blk_handle_output() function.
> >> 
> >> Fixes: 110b9463d5c8 ("vhost-user-blk: start vhost when guest kicks")
> >> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> >> ---
> >> hw/block/vhost-user-blk.c | 4 ----
> >> 1 file changed, 4 deletions(-)
> >> 
> >> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> >> index aff4d2b8cbd..448ead448f3 100644
> >> --- a/hw/block/vhost-user-blk.c
> >> +++ b/hw/block/vhost-user-blk.c
> >> @@ -279,10 +279,6 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >>     Error *local_err = NULL;
> >>     int i, ret;
> >> 
> >> -    if (!vdev->start_on_kick) {
> >> -        return;
> >> -    }
> >> -
> >>     if (!s->connected) {
> >>         return;
> >>     }
> > 
> > 
> > After looking a bit closer to this ->start_on_kick thing ( commit badaf79cfdbd ("virtio: Introduce started flag to VirtioDevice")
> > and follow ups) I'm starting to think that removing it entirely would be the right thing to do here.
> > The whole reason for it was to add special case for !VIRTIO_F_VERSION_1 guests.
> 
> The virtio 1.0 spec section 2.1.2 explicitly says: "The device MUST NOT consume buffers or notify the driver before DRIVER_OK.”
> 
> Your change here would make QEMU violate this condition. I don’t know what the danger is but I assume that wording is there for a reason.
> 
> Unless MST or Cornellia (CCed) say otherwise I don’t think this is the correct approach.

If we propagate HV workarounds then guests do not get fixed.


> > If we making start on kick thing for misbehaving VIRTIO_F_VERSION_1 guests too, than the flag is no longer required,
> > so we can do following:
> > 
> > ---
> > hw/block/vhost-user-blk.c  |  4 ----
> > hw/virtio/virtio-qmp.c     |  2 +-
> > hw/virtio/virtio.c         | 21 ++-------------------
> > include/hw/virtio/virtio.h |  5 -----
> > 4 files changed, 3 insertions(+), 29 deletions(-)
> > 
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index aff4d2b8cbd..448ead448f3 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -279,10 +279,6 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> >     Error *local_err = NULL;
> >     int i, ret;
> > 
> > -    if (!vdev->start_on_kick) {
> > -        return;
> > -    }
> > -
> >     if (!s->connected) {
> >         return;
> >     }
> > diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> > index e4d4bece2d7..4865819cd2f 100644
> > --- a/hw/virtio/virtio-qmp.c
> > +++ b/hw/virtio/virtio-qmp.c
> > @@ -773,7 +773,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
> >     status->disabled = vdev->disabled;
> >     status->use_started = vdev->use_started;
> >     status->started = vdev->started;
> > -    status->start_on_kick = vdev->start_on_kick;
> > +    status->start_on_kick = true;
> >     status->disable_legacy_check = vdev->disable_legacy_check;
> >     status->bus_name = g_strdup(vdev->bus_name);
> >     status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index f35178f5fcd..218584eae85 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -2126,7 +2126,6 @@ void virtio_reset(void *opaque)
> >         k->reset(vdev);
> >     }
> > 
> > -    vdev->start_on_kick = false;
> >     vdev->started = false;
> >     vdev->broken = false;
> >     vdev->guest_features = 0;
> > @@ -2248,9 +2247,7 @@ static void virtio_queue_notify_vq(VirtQueue *vq)
> >         trace_virtio_queue_notify(vdev, vq - vdev->vq, vq);
> >         vq->handle_output(vdev, vq);
> > 
> > -        if (unlikely(vdev->start_on_kick)) {
> > -            virtio_set_started(vdev, true);
> > -        }
> > +        virtio_set_started(vdev, true);
> >     }
> > }
> > 
> > @@ -2268,9 +2265,7 @@ void virtio_queue_notify(VirtIODevice *vdev, int n)
> >     } else if (vq->handle_output) {
> >         vq->handle_output(vdev, vq);
> > 
> > -        if (unlikely(vdev->start_on_kick)) {
> > -            virtio_set_started(vdev, true);
> > -        }
> > +        virtio_set_started(vdev, true);
> >     }
> > }
> > 
> > @@ -2881,12 +2876,6 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
> >             }
> >         }
> >     }
> > -    if (!ret) {
> > -        if (!virtio_device_started(vdev, vdev->status) &&
> > -            !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > -            vdev->start_on_kick = true;
> > -        }
> > -    }
> >     return ret;
> > }
> > 
> > @@ -3039,11 +3028,6 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
> >         }
> >     }
> > 
> > -    if (!virtio_device_started(vdev, vdev->status) &&
> > -        !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> > -        vdev->start_on_kick = true;
> > -    }
> > -
> >     RCU_READ_LOCK_GUARD();
> >     for (i = 0; i < num; i++) {
> >         if (vdev->vq[i].vring.desc) {
> > @@ -3162,7 +3146,6 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
> >             g_malloc0(sizeof(*vdev->vector_queues) * nvectors);
> >     }
> > 
> > -    vdev->start_on_kick = false;
> >     vdev->started = false;
> >     vdev->vhost_started = false;
> >     vdev->device_id = device_id;
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 77c6c55929f..5742876b4fa 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -144,7 +144,6 @@ struct VirtIODevice
> >      */
> >     bool use_started;
> >     bool started;
> > -    bool start_on_kick; /* when virtio 1.0 feature has not been negotiated */
> >     bool disable_legacy_check;
> >     bool vhost_started;
> >     VMChangeStateEntry *vmstate;
> > @@ -460,10 +459,6 @@ static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status
> > 
> > static inline void virtio_set_started(VirtIODevice *vdev, bool started)
> > {
> > -    if (started) {
> > -        vdev->start_on_kick = false;
> > -    }
> > -
> >     if (vdev->use_started) {
> >         vdev->started = started;
> >     }
> > -- 
> > 2.39.2
> 


