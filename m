Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF340D33A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 08:28:36 +0200 (CEST)
Received: from localhost ([::1]:45100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQkst-00077h-7j
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 02:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQkqt-0006Le-GT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mQkqn-0006F9-8Z
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 02:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631773583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=zaRWC7M8aQOWFa/dFol8qZWm/jo5leOT0h8+QwVw6JU=;
 b=Qb7FAizQeJQ/vghFU9okHwLHfm58F9ee2T5gQgXa/jWGx61W+LtiQrAYP04isHrV1RC/Cx
 Ll2Z61nL2pNV08xUVyJwwXnkktJN6o/2QFxtJrTN+dEEmdZvZMzO7nxRG72kqN55LUw/iv
 vdhdoFHrZNay4/RcjfUXSPPwlfQUt2s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-cFFM6NlQN-2hPA5xNG49dA-1; Thu, 16 Sep 2021 02:26:19 -0400
X-MC-Unique: cFFM6NlQN-2hPA5xNG49dA-1
Received: by mail-ed1-f71.google.com with SMTP id
 n5-20020a05640206c500b003cf53f7cef2so1480622edy.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 23:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=zaRWC7M8aQOWFa/dFol8qZWm/jo5leOT0h8+QwVw6JU=;
 b=UqCkn7cYTNq1/4xbQVoSyvFbmDt5fUj/2bjlVhOlT0QJ7Ij6UECzBy8+yzHKxzlabq
 0u9AwFpqiQFCnqEX4+kDT6IOss7RCKOpJGs5WJ4kIth8KiCxcThsXhPxL/Z0EnoTr+xc
 pcfgNhOozOHXL2nPM45gAGmirggOrdF/Kuf7stH/BcNhZJDEykxQCzsFDAQfzdGB1H7j
 tMs178EvkCGOGB7bg6hO36Q+q/YexBcfCIkV5vdhi7jCY+0SYmsvvzuWuhsDz/gkawem
 dIZ6xTk2DcgOXjTwRjZwXMv6yhZZDEp+tBFwjpEwKaHsMc7gCGx/i+XHHRwGpZWRuHev
 33TQ==
X-Gm-Message-State: AOAM532oHslRebVsp/V6RjMvZzXG1u1Y9Tr1cDn4i1fUP4aMzaWeo4tL
 C82oltZZE435jTcHHyajC4T8d8zP3ibFoyVDRFa29eC8o5LV+QZ+5/QyS7nrnUz1IoR69ZpqNxR
 FBkq/DO1x0Ac6430=
X-Received: by 2002:a05:6402:198:: with SMTP id
 r24mr4659088edv.93.1631773578309; 
 Wed, 15 Sep 2021 23:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKph9ZrOzY+hDdVJxpoxp7fQjuCj8jpUHlg1GJwAoHFfeNjBMkSBR/TE7RyTNTv3/qKqU1hQ==
X-Received: by 2002:a05:6402:198:: with SMTP id
 r24mr4659072edv.93.1631773578031; 
 Wed, 15 Sep 2021 23:26:18 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id s9sm934428edc.82.2021.09.15.23.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 23:26:17 -0700 (PDT)
Date: Thu, 16 Sep 2021 08:26:15 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [RFC v6] virtio/vsock: add two more queues for datagram types
Message-ID: <20210916062615.uxqzujbdceblmy7e@steredhat>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z8vJF7F=mhpRpcFwQarFH_uLWBmahi0jb1q6yj=j7YSXg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Jason Wang <jasowang@redhat.com>, qemu devel list <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 08:59:17PM -0700, Jiang Wang . wrote:
>On Tue, Sep 14, 2021 at 5:46 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> On Mon, Sep 13, 2021 at 10:18:43PM +0000, Jiang Wang wrote:
>> > Datagram sockets are connectionless and unreliable.
>> > The sender does not know the capacity of the receiver
>> > and may send more packets than the receiver can handle.
>> >
>> > Add two more dedicate virtqueues for datagram sockets,
>> > so that it will not unfairly steal resources from
>> > stream and future connection-oriented sockets.
>> >
>> > Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>> > ---
>> > v1 -> v2: use qemu cmd option to control number of queues,
>> >         removed configuration settings for dgram.
>> > v2 -> v3: use ioctl to get features and decide number of
>> >         virt queues, instead of qemu cmd option.
>> > v3 -> v4: change DGRAM feature bit value to 2. Add an argument
>> >         in vhost_vsock_common_realize to indicate dgram is supported or not.
>> > v4 -> v5: don't open dev to get vhostfd. Removed leftover definition of
>> >         enable_dgram
>> > v5 -> v6: fix style errors. Imporve error handling of
>> >         vhost_vsock_dgram_supported. Rename MAX_VQS_WITH_DGRAM and another one.
>> >
>> >  hw/virtio/vhost-user-vsock.c                  |  2 +-
>> >  hw/virtio/vhost-vsock-common.c                | 25 ++++++++++++--
>> >  hw/virtio/vhost-vsock.c                       | 34 ++++++++++++++++++-
>> >  include/hw/virtio/vhost-vsock-common.h        |  6 ++--
>> >  include/hw/virtio/vhost-vsock.h               |  3 ++
>> >  include/standard-headers/linux/virtio_vsock.h |  1 +
>> >  6 files changed, 64 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>> > index 6095ed7349..e9ec0e1c00 100644
>> > --- a/hw/virtio/vhost-user-vsock.c
>> > +++ b/hw/virtio/vhost-user-vsock.c
>> > @@ -105,7 +105,7 @@ static void vuv_device_realize(DeviceState *dev, Error **errp)
>> >          return;
>> >      }
>> >
>> > -    vhost_vsock_common_realize(vdev, "vhost-user-vsock");
>> > +    vhost_vsock_common_realize(vdev, "vhost-user-vsock", false);
>>
>> VIRTIO_VSOCK_F_DGRAM support should work equally well for
>> vhost-user-vsock. I don't think there is a need to disable it here.
>>
>Stefano mentioned in previous email ( V3 ) that I can disable dgram
>for vhost-user-vsock for now. I think we need some extra changes to
>fully support vhost-vsock-user, like feature discovery?

I think Stefan is suggesting something similar of what we discussed 
here:
https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg06689.html

We can allocate all the queues, and choose at runtime which queue to use 
for events, that is the only queue used by QEMU.

We can check that in vhost_vsock_common_start(), just before starting 
the device, where we know the features acked by the guest 
(vdev->guest_features).

And I agree that would be the best approach, since we don't need 
discovery anymore, and the same code works also for vhost-user-vsock as 
is.

>
>> >
>> >      vhost_dev_set_config_notifier(&vvc->vhost_dev, &vsock_ops);
>> >
>> > diff --git a/hw/virtio/vhost-vsock-common.c 
>> > b/hw/virtio/vhost-vsock-common.c
>> > index 4ad6e234ad..d94636e04e 100644
>> > --- a/hw/virtio/vhost-vsock-common.c
>> > +++ b/hw/virtio/vhost-vsock-common.c
>> > @@ -17,6 +17,8 @@
>> >  #include "hw/virtio/vhost-vsock.h"
>> >  #include "qemu/iov.h"
>> >  #include "monitor/monitor.h"
>> > +#include <sys/ioctl.h>
>> > +#include <linux/vhost.h>
>> >
>> >  int vhost_vsock_common_start(VirtIODevice *vdev)
>> >  {
>> > @@ -196,9 +198,11 @@ int vhost_vsock_common_post_load(void *opaque, 
>> > int version_id)
>> >      return 0;
>> >  }
>> >
>> > -void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> > +void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name,
>> > +                               bool enable_dgram)
>> >  {
>> >      VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> > +    int nvqs = VHOST_VSOCK_NVQS;
>> >
>> >      virtio_init(vdev, name, VIRTIO_ID_VSOCK,
>> >                  sizeof(struct virtio_vsock_config));
>> > @@ -209,12 +213,20 @@ void vhost_vsock_common_realize(VirtIODevice *vdev, const char *name)
>> >      vvc->trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                         vhost_vsock_common_handle_output);
>> >
>> > +    if (enable_dgram) {
>> > +        nvqs = VHOST_VSOCK_NVQS_DGRAM;
>> > +        vvc->dgram_recv_vq = virtio_add_queue(vdev, 
>> > VHOST_VSOCK_QUEUE_SIZE,
>> > +                                              vhost_vsock_common_handle_output);
>> > +        vvc->dgram_trans_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> > +                                              vhost_vsock_common_handle_output);
>> > +    }
>>
>> I think the virtqueues can be added unconditionally.
>>
>OK.
>> > +
>> >      /* The event queue belongs to QEMU */
>> >      vvc->event_vq = virtio_add_queue(vdev, VHOST_VSOCK_QUEUE_SIZE,
>> >                                         vhost_vsock_common_handle_output);
>> >
>> > -    vvc->vhost_dev.nvqs = ARRAY_SIZE(vvc->vhost_vqs);
>> > -    vvc->vhost_dev.vqs = vvc->vhost_vqs;
>> > +    vvc->vhost_dev.nvqs = nvqs;
>> > +    vvc->vhost_dev.vqs = g_new0(struct vhost_virtqueue, vvc->vhost_dev.nvqs);
>>
>> IIUC the number of virtqueues needs to be the maximum supported number.
>> It's okay to have more virtqueues than needed. The feature bit is used
>> by the driver to detect the device's support for dgrams, not the number
>> of virtqueues.
>>
>OK. I can just make these changes. But I am not able to test 
>vhost-user-vsock
>as of now. I tried to follow the steps on here:
>https://patchew.org/QEMU/20200515152110.202917-1-sgarzare@redhat.com/
>But the git repo for the vhost-user-vsock is kind of broken. I tried to
>fix it but I am new to rust so it will take some time. Is there any updated
>or an easier way to test vhost-user-vsock?
>

Yep, it was a PoC, please use the new vhost-user-vsock that Harsha is 
developing here:
https://github.com/rust-vmm/vhost-device/pull/7

Feel free to reach me or Harsha if you have any issue.

>
>> >
>> >      vvc->post_load_timer = NULL;
>> >  }
>> > @@ -227,6 +239,13 @@ void vhost_vsock_common_unrealize(VirtIODevice *vdev)
>> >
>> >      virtio_delete_queue(vvc->recv_vq);
>> >      virtio_delete_queue(vvc->trans_vq);
>> > +    if (vvc->vhost_dev.nvqs == VHOST_VSOCK_NVQS_DGRAM) {
>> > +        virtio_delete_queue(vvc->dgram_recv_vq);
>> > +        virtio_delete_queue(vvc->dgram_trans_vq);
>> > +    }
>> > +
>> > +    g_free(vvc->vhost_dev.vqs);
>> > +
>> >      virtio_delete_queue(vvc->event_vq);
>> >      virtio_cleanup(vdev);
>> >  }
>> > diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> > index 1b1a5c70ed..891d38e226 100644
>> > --- a/hw/virtio/vhost-vsock.c
>> > +++ b/hw/virtio/vhost-vsock.c
>> > @@ -20,9 +20,12 @@
>> >  #include "hw/qdev-properties.h"
>> >  #include "hw/virtio/vhost-vsock.h"
>> >  #include "monitor/monitor.h"
>> > +#include <sys/ioctl.h>
>> > +#include <linux/vhost.h>
>> >
>> >  const int feature_bits[] = {
>> >      VIRTIO_VSOCK_F_SEQPACKET,
>> > +    VIRTIO_VSOCK_F_DGRAM,
>>
>> Stefano is currently working on a way to control live migration
>> compatibility when features like seqpacket or dgram aren't available. He
>> can suggest how to do this for dgram.
>>
>Yes. I watched that email thread. I can make similar changes to
>DGRAM. I will do it for the next version.

I'll send a new patch for seqpacket (using on,off,auto prop) hopefully 
tomorrow or early next week, then you can rebase on it. It should be 
simple to add the dgram feature too.

I'll keep you in CC.

Thanks,
Stefano


