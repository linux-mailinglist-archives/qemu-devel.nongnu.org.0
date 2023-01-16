Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBB66B7A4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 07:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJLV-0005Ha-Cf; Mon, 16 Jan 2023 01:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJLS-0005HO-QK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJLQ-0008Rw-U7
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 01:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673851908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEgK1W/4AtncXFklq1aU2IolshoJf6eof+e71XD/W4I=;
 b=FnOs1FuwRwcR7Blij3ta4CfShcw1R04KmeheWjqJcC0mCrvcWtaqWYFhm8OYySeN/q/lj+
 +RKUwGlrr5AsYyNXE6BhZImRSR/dq245GcfYa4QLjov9FNr1ajRI9yrB8/XvTloioGuK8x
 bBxsxTtpZDugJD6vG6dodRPiAfuqsWI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-F0UKN71LNcuHF7omGFsdew-1; Mon, 16 Jan 2023 01:51:38 -0500
X-MC-Unique: F0UKN71LNcuHF7omGFsdew-1
Received: by mail-pj1-f70.google.com with SMTP id
 u7-20020a17090a410700b002291f69fbb5so4088787pjf.2
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 22:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LEgK1W/4AtncXFklq1aU2IolshoJf6eof+e71XD/W4I=;
 b=Cqwjiy2jFFaneyjVsMmj3vYzT9btq0bnwplTfh9zM6g5Vb3Syd2weW2fsUDa2M6sMD
 V8SD1iDU1HVreK2OvngrV+veTizIMf67INDfylXvmqaOUOcN1gGo7aZAJtLYmOo541cH
 URzY+1QpF3VVe3gd5Ol8AqO+TTbyXTzLhc5dl5S7qElIRSZ0ku11SxJMhhL1tV5x267o
 HyB1r1KlIYZJPV6J4lQTmvCiHU5+WoRC8l1VJsJ1gduJgzw78wgrA4bO1qaQN1dIVG2+
 YHcjTLXD/u6OmgG5Hymw1iE/yYBgQaEI6slwnvAMvpb/B8p8JeMjUmn6v6j4LiCKtCld
 MY0Q==
X-Gm-Message-State: AFqh2kpYd59W4fewEkgtNLcIa0ZOdmuFXgbR3haJHuxFkbK/ahlLumNX
 twnFWYv0ajcTxj/FakwLcy2SbG8mTg+17oLanzuSMFeQxtKTkdVvJfKjB/QJEuEulM2r3nC162o
 4oqOknRzLiBmWhI0=
X-Received: by 2002:a05:6a21:e388:b0:b6:acf5:d32 with SMTP id
 cc8-20020a056a21e38800b000b6acf50d32mr13537168pzc.20.1673851897700; 
 Sun, 15 Jan 2023 22:51:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/tCiM1yEz0M9Z1pmRC21TejyGu3eGZ0eBRfA2O0/MxFiT1Oa7Rg567taAyEDxGFt91ryQwA==
X-Received: by 2002:a05:6a21:e388:b0:b6:acf5:d32 with SMTP id
 cc8-20020a056a21e38800b000b6acf50d32mr13537145pzc.20.1673851897405; 
 Sun, 15 Jan 2023 22:51:37 -0800 (PST)
Received: from [10.72.13.212] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902e84700b0019327a6abc2sm15644831plg.44.2023.01.15.22.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 22:51:36 -0800 (PST)
Message-ID: <0a432009-63e8-1bff-ca9f-0a638d54ef5f@redhat.com>
Date: Mon, 16 Jan 2023 14:51:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Juan Quintela <quintela@redhat.com>, David Gilbert <dgilbert@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <CACGkMEuZjN+6sWiuZnMP7J-mBiwxnkO1VUW-AHz9izW4QkYvUw@mail.gmail.com>
 <CAJaqyWdbWACJdJfECjLu4x2nK82MJOsS8BTBdi7QQDZM-tg-OQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdbWACJdJfECjLu4x2nK82MJOsS8BTBdi7QQDZM-tg-OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/1/13 17:00, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 5:55 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:25 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> This allows net to restart the device backend to configure SVQ on it.
>>>
>>> Ideally, these changes should not be net specific. However, the vdpa net
>>> backend is the one with enough knowledge to configure everything because
>>> of some reasons:
>>> * Queues might need to be shadowed or not depending on its kind (control
>>>    vs data).
>>> * Queues need to share the same map translations (iova tree).
>>>
>>> Because of that it is cleaner to restart the whole net backend and
>>> configure again as expected, similar to how vhost-kernel moves between
>>> userspace and passthrough.
>>>
>>> If more kinds of devices need dynamic switching to SVQ we can create a
>>> callback struct like VhostOps and move most of the code there.
>>> VhostOps cannot be reused since all vdpa backend share them, and to
>>> personalize just for networking would be too heavy.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 84 insertions(+)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 5d7ad6e4d7..f38532b1df 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -26,6 +26,8 @@
>>>   #include <err.h>
>>>   #include "standard-headers/linux/virtio_net.h"
>>>   #include "monitor/monitor.h"
>>> +#include "migration/migration.h"
>>> +#include "migration/misc.h"
>>>   #include "migration/blocker.h"
>>>   #include "hw/virtio/vhost.h"
>>>
>>> @@ -33,6 +35,7 @@
>>>   typedef struct VhostVDPAState {
>>>       NetClientState nc;
>>>       struct vhost_vdpa vhost_vdpa;
>>> +    Notifier migration_state;
>>>       Error *migration_blocker;
>>>       VHostNetState *vhost_net;
>>>
>>> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>       return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>   }
>>>
>>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
>>> +{
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +    VirtIONet *n;
>>> +    VirtIODevice *vdev;
>>> +    int data_queue_pairs, cvq, r;
>>> +    NetClientState *peer;
>>> +
>>> +    /* We are only called on the first data vqs and only if x-svq is not set */
>>> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
>>> +        return;
>>> +    }
>>> +
>>> +    vdev = v->dev->vdev;
>>> +    n = VIRTIO_NET(vdev);
>>> +    if (!n->vhost_started) {
>>> +        return;
>>> +    }
>>> +
>>> +    if (enable) {
>>> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
>> Do we need to check if the device is started or not here?
>>
> v->vhost_started is checked right above, right?


Right, I miss that.


>
>>> +    }
>> I'm not sure I understand the reason for vhost_net_stop() after a
>> VHOST_VDPA_SUSPEND. It looks to me those functions are duplicated.
>>
> I think this is really worth exploring, and it would have been clearer
> if I didn't squash the vhost_reset_status commit by mistake :).
>
> Looking at qemu master vhost.c:vhost_dev_stop:
>      if (hdev->vhost_ops->vhost_dev_start) {
>          hdev->vhost_ops->vhost_dev_start(hdev, false);
>      }
>      if (vrings) {
>          vhost_dev_set_vring_enable(hdev, false);
>      }
>      for (i = 0; i < hdev->nvqs; ++i) {
>          vhost_virtqueue_stop(hdev,
>                               vdev,
>                               hdev->vqs + i,
>                               hdev->vq_index + i);
>      }
>
> Both vhost-used and vhost-vdpa set_status(0) at
> ->vhost_dev_start(hdev, false). It cleans virtqueue state in vdpa so
> they are not recoverable at vhost_virtqueue_stop->get_vring_base, and
> I think it is too late for vdpa devices to change it. I guess
> vhost-user devices do not lose the state there, but I did not test.
>
> I call VHOST_VDPA_SUSPEND here so vhost_vdpa_dev_start looks more
> similar to vhost_user_dev_start. We can make
> vhost_vdpa_dev_start(false) to suspend the device instead. But then we
> need to reset it after getting the indexes. That's why I added
> vhost_vdpa_reset_status, but I admit it is neither the cleanest
> approach nor the best name to it.


I wonder if we can simply suspend in vhost_net_stop() if we know the 
parent can stop?

Thanks


>
> Adding Maxime, RFC here so we can make -vdpa and -user not to divert too much.
>
>>> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>> +                                  n->max_ncs - n->max_queue_pairs : 0;
>>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>> +
>>> +    peer = s->nc.peer;
>>> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
>>> +        VhostVDPAState *vdpa_state;
>>> +        NetClientState *nc;
>>> +
>>> +        if (i < data_queue_pairs) {
>>> +            nc = qemu_get_peer(peer, i);
>>> +        } else {
>>> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
>>> +        }
>>> +
>>> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +        vdpa_state->vhost_vdpa.shadow_data = enable;
>>> +
>>> +        if (i < data_queue_pairs) {
>>> +            /* Do not override CVQ shadow_vqs_enabled */
>>> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
>>> +        }
>>> +    }
>>> +
>>> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>> +    if (unlikely(r < 0)) {
>>> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
>>> +    }
>>> +}
>>> +
>>> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
>>> +{
>>> +    MigrationState *migration = data;
>>> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
>>> +                                     migration_state);
>>> +
>>> +    switch (migration->state) {
>>> +    case MIGRATION_STATUS_SETUP:
>>> +        vhost_vdpa_net_log_global_enable(s, true);
>>> +        return;
>>> +
>>> +    case MIGRATION_STATUS_CANCELLING:
>>> +    case MIGRATION_STATUS_CANCELLED:
>>> +    case MIGRATION_STATUS_FAILED:
>>> +        vhost_vdpa_net_log_global_enable(s, false);
>> Do we need to recover here?
>>
> I may be missing something, but the device is fully reset and restored
> in these cases.
>
> CCing Juan and D. Gilbert, a review would be appreciated to check if
> this covers all the cases.
>
> Thanks!
>
>
>> Thanks
>>
>>> +        return;
>>> +    };
>>> +}
>>> +
>>>   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>   {
>>>       struct vhost_vdpa *v = &s->vhost_vdpa;
>>>
>>> +    if (v->feature_log) {
>>> +        add_migration_state_change_notifier(&s->migration_state);
>>> +    }
>>> +
>>>       if (v->shadow_vqs_enabled) {
>>>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>                                              v->iova_range.last);
>>> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>
>>>       assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>
>>> +    if (s->vhost_vdpa.index == 0 && s->vhost_vdpa.feature_log) {
>>> +        remove_migration_state_change_notifier(&s->migration_state);
>>> +    }
>>> +
>>>       dev = s->vhost_vdpa.dev;
>>>       if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>>>       s->vhost_vdpa.index = queue_pair_index;
>>>       s->always_svq = svq;
>>> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>>>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>       s->vhost_vdpa.iova_range = iova_range;
>>>       s->vhost_vdpa.shadow_data = svq;
>>> --
>>> 2.31.1
>>>
>>


