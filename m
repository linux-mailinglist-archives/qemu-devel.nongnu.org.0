Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE416A8FED
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 04:35:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXwC8-0002QD-8h; Thu, 02 Mar 2023 22:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXwC6-0002Q0-M8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:34:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pXwC4-0006hi-Rs
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 22:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677814491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/6EZ5AxQYeiL9+oAmxDD0QUlnJtj4DfZPQ/lC7KO1Hc=;
 b=ONFwiRBFA0Ng64BydWt2RqIrHcsfE3uZmsGkWiYvDPj4KvdrGb0+WOwsKf/i8s61ywwyMV
 45Ycf6h9J7he3AjE/zJWViB++Icach+5Mo2/suipHJJ7UKGf/kkvhlqFtOLbyvIXRP5+pl
 ytxQBr38g3LHAe2D1xrSJ2AdJuDWMV0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-PRuUidLEOE25MDwe5CyCcg-1; Thu, 02 Mar 2023 22:34:50 -0500
X-MC-Unique: PRuUidLEOE25MDwe5CyCcg-1
Received: by mail-pj1-f69.google.com with SMTP id
 d3-20020a17090acd0300b00237659aae8dso2485534pju.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 19:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677814489;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/6EZ5AxQYeiL9+oAmxDD0QUlnJtj4DfZPQ/lC7KO1Hc=;
 b=c8bksDWd+UZ2bhAR5yZ2fT/zKMG9E1kJVKRjY78UIaCQpyhYZr2Lg/pRslLLpogTPr
 zhUOaNXHejQoxWkxyJvCc7Ol2orwkcF67Aa6HugPkwsY6GyeSZA7VVCBphu2BVPIUeE2
 yF3AgRNLWb3Ekb5+a0KlNvPiLaox0dM4ov1E5OgvQOzS3AjbwosQDSJConvEEG9tfINF
 W0zkh79ZnqB+dElsx6TKvmLdzUp/fl7yDN72/XNfHuY8yVDSkWQ8QgdyFhougYeDeI+c
 RNdwac6HkiaxKtMGEF64tDV9CuOsC7KvcnvM/w8XWh3mMO25TkyJ8ixqlYtdx2sL3LQl
 NSKw==
X-Gm-Message-State: AO0yUKWd5qTJvILOmSsnuNyWMYAdFCwgerBqqxs2zNE6Crz8rh4vO7n+
 6h6Jwsz68IqjfQReUvDIxfW49bHd66RgPA40JFzYAAhcKi9HqRtFSCVdbB/z8Meblt6/j4RgRn4
 wPW3kV8YDF0JJ8gc=
X-Received: by 2002:a05:6a20:4b26:b0:cd:1e80:587d with SMTP id
 fp38-20020a056a204b2600b000cd1e80587dmr608968pzb.23.1677814489409; 
 Thu, 02 Mar 2023 19:34:49 -0800 (PST)
X-Google-Smtp-Source: AK7set83Al2C9L/ayQR+RYAvXpnLAsSw/a5H60xBANTg5rjMTOzTowtkQM3H7z2wxdmfS7KQ4xmubw==
X-Received: by 2002:a05:6a20:4b26:b0:cd:1e80:587d with SMTP id
 fp38-20020a056a204b2600b000cd1e80587dmr608946pzb.23.1677814489005; 
 Thu, 02 Mar 2023 19:34:49 -0800 (PST)
Received: from [10.72.13.180] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa78d96000000b005d932d0c029sm439790pfr.65.2023.03.02.19.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 19:34:48 -0800 (PST)
Message-ID: <3ab19235-bdd7-73a8-052a-a365b0582275@redhat.com>
Date: Fri, 3 Mar 2023 11:34:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/15] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-10-eperezma@redhat.com>
 <afad31de-8109-36b7-b7ea-aa2e1a24f254@redhat.com>
 <CAJaqyWdyM6i6-GVNUbEkQ_Bo+AhbAQRDx3wZxRu-jwtc1mZT2g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdyM6i6-GVNUbEkQ_Bo+AhbAQRDx3wZxRu-jwtc1mZT2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/3/2 03:26, Eugenio Perez Martin 写道:
> On Mon, Feb 27, 2023 at 9:08 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/2/24 23:54, Eugenio Pérez 写道:
>>> This allows net to restart the device backend to configure SVQ on it.
>>>
>>> Ideally, these changes should not be net specific. However, the vdpa net
>>> backend is the one with enough knowledge to configure everything because
>>> of some reasons:
>>> * Queues might need to be shadowed or not depending on its kind (control
>>>     vs data).
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
>>> v4:
>>> * Delete duplication of set shadow_data and shadow_vqs_enabled moving it
>>>     to data / cvq net start functions.
>>>
>>> v3:
>>> * Check for migration state at vdpa device start to enable SVQ in data
>>>     vqs.
>>>
>>> v1 from RFC:
>>> * Add TODO to use the resume operation in the future.
>>> * Use migration_in_setup and migration_has_failed instead of a
>>>     complicated switch case.
>>> ---
>>>    net/vhost-vdpa.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++--
>>>    1 file changed, 69 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index b89c99066a..c5512ddf10 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -26,12 +26,15 @@
>>>    #include <err.h>
>>>    #include "standard-headers/linux/virtio_net.h"
>>>    #include "monitor/monitor.h"
>>> +#include "migration/migration.h"
>>> +#include "migration/misc.h"
>>>    #include "hw/virtio/vhost.h"
>>>
>>>    /* Todo:need to add the multiqueue support here */
>>>    typedef struct VhostVDPAState {
>>>        NetClientState nc;
>>>        struct vhost_vdpa vhost_vdpa;
>>> +    Notifier migration_state;
>>>        VHostNetState *vhost_net;
>>>
>>>        /* Control commands shadow buffers */
>>> @@ -239,10 +242,59 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>        return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>    }
>>>
>>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
>>> +{
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +    VirtIONet *n;
>>> +    VirtIODevice *vdev;
>>> +    int data_queue_pairs, cvq, r;
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
>>> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>> +                                  n->max_ncs - n->max_queue_pairs : 0;
>>> +    /*
>>> +     * TODO: vhost_net_stop does suspend, get_base and reset. We can be smarter
>>> +     * in the future and resume the device if read-only operations between
>>> +     * suspend and reset goes wrong.
>>> +     */
>>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>> +
>>> +    /* Start will check migration setup_or_active to configure or not SVQ */
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
>>> +    if (migration_in_setup(migration)) {
>>> +        vhost_vdpa_net_log_global_enable(s, true);
>>> +    } else if (migration_has_failed(migration)) {
>>> +        vhost_vdpa_net_log_global_enable(s, false);
>>> +    }
>>> +}
>>> +
>>>    static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>    {
>>>        struct vhost_vdpa *v = &s->vhost_vdpa;
>>>
>>> +    add_migration_state_change_notifier(&s->migration_state);
>>>        if (v->shadow_vqs_enabled) {
>>>            v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>                                               v->iova_range.last);
>>> @@ -256,6 +308,15 @@ static int vhost_vdpa_net_data_start(NetClientState *nc)
>>>
>>>        assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>
>>> +    if (s->always_svq ||
>>> +        migration_is_setup_or_active(migrate_get_current()->state)) {
>>> +        v->shadow_vqs_enabled = true;
>>> +        v->shadow_data = true;
>>> +    } else {
>>> +        v->shadow_vqs_enabled = false;
>>> +        v->shadow_data = false;
>>> +    }
>>> +
>>>        if (v->index == 0) {
>>>            vhost_vdpa_net_data_start_first(s);
>>>            return 0;
>>> @@ -276,6 +337,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>
>>>        assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>
>>> +    if (s->vhost_vdpa.index == 0) {
>>> +        remove_migration_state_change_notifier(&s->migration_state);
>>> +    }
>>
>> This should work but I just realize that vhost support
>> vhost_dev_set_log(), I wonder if it would be simpler to go with that way.
>>
>> Using vhost_virtqueue_set_addr(, enable_log = true)?
>>
> We can do that but it has the same problem as with checking _F_LOG_ALL
> in set_features:
>
> 1. We're tearing down a vhost device using a listener registered
> against that device, at start / stop.
> 2. We need to traverse all the devices many times to first get all the
> vqs state and then transverse them again to set them up properly.
>
> My two ideas to solve the recursiveness of 1 are:
> a. Duplicating vhost_dev_start / vhost_dev_stop at
> vhost_vdpa_set_features / vhost_vdpa_set_vring_addr.
>
> This has the same problem as all duplications: It will get out of sync
> eventually. For example, the latest changes about configure interrupt
> would need to be duplicated in this new call.
>
> b. Add a new parameter to vhost_dev_start/stop to skip the
> set_features / set_vring_address step.
> Now that the virtio queue reset changes have exposed these functions
> it is also possible to call them from vhost-vdpa.
>
> Maybe we can store that parameter in vhost_vdpa so we don't call
> vhost_dev_start / stop there instead of affecting all backends, but
> the idea is the same.
>
> For problem 2 I still do not have a solution. CVQ / MQ Is out of the
> scope for this series but I think it will bite us when we add it
> (hopefully soon).


Thanks for the clarification, I'd suggest to document the above in the 
changlog.


>
> Thanks!
>
>> Thanks
>>
>>
>>> +
>>>        dev = s->vhost_vdpa.dev;
>>>        if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> @@ -412,11 +477,12 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>        s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>        v = &s->vhost_vdpa;
>>>
>>> -    v->shadow_data = s->always_svq;
>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>> +    v->shadow_data = s0->vhost_vdpa.shadow_vqs_enabled;
>>>        v->shadow_vqs_enabled = s->always_svq;
>>>        s->vhost_vdpa.address_space_id = VHOST_VDPA_GUEST_PA_ASID;
>>>
>>> -    if (s->always_svq) {
>>> +    if (s->vhost_vdpa.shadow_data) {
>>>            /* SVQ is already configured for all virtqueues */
>>>            goto out;
>>>        }
>>> @@ -473,7 +539,6 @@ out:
>>>            return 0;
>>>        }
>>>
>>> -    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>        if (s0->vhost_vdpa.iova_tree) {
>>>            /*
>>>             * SVQ is already configured for all virtqueues.  Reuse IOVA tree for
>>> @@ -749,6 +814,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>        s->vhost_vdpa.device_fd = vdpa_device_fd;
>>>        s->vhost_vdpa.index = queue_pair_index;
>>>        s->always_svq = svq;
>>> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>        s->vhost_vdpa.iova_range = iova_range;
>>>        s->vhost_vdpa.shadow_data = svq;


