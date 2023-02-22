Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79069EDB5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 04:56:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUgEg-0001no-Qq; Tue, 21 Feb 2023 22:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgEf-0001nZ-7x
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:56:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pUgEd-0007RN-Gk
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 22:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677038163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezMuI5YG23ad7qY4EaNZuXK4S2JL7CXJcZVLJx8IXKc=;
 b=DSZPeTr/Fk30OiFHYqoSgkvoHeTHASVNkue6WidCkKFBL+T8yqJ17j6xGI4P5GkwAlWDWm
 OJB9vG9vS8RA1Aikaaur+p+PiAMMlAYTJ1tewkH4gZri62YMhuYSQ3SwZr9ja2Q3YFykNk
 HC/hEQqI3pY6gh4gxgRrGCr9XhVPatI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-j81GNQOGNHmlNDz6XFOESQ-1; Tue, 21 Feb 2023 22:56:01 -0500
X-MC-Unique: j81GNQOGNHmlNDz6XFOESQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 s6-20020a17090aba0600b00230ffd3f340so2181842pjr.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 19:56:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezMuI5YG23ad7qY4EaNZuXK4S2JL7CXJcZVLJx8IXKc=;
 b=o378pSCWY5Ck22A0t1Z8RAUOWbsl7eeoZVYvsND3+ISy1ClpkZzcjnsXE0fR6AgCTk
 ShOj+TC5VcpDZrQunlx1VWw/w2KDwiWFqj9ZkTxIGBVqhccb9DiR6BljnqcxyEq54zOm
 txpkO6a0FEE63zd1vc1SrWrdoGir8dpCN50/fMUZEZI4xEL4uFRw0T1r+Sa9tFUEKoY1
 tvU2CBPIDubiNL/D5WCkrkDSqWU//nvaQOladOUPtzaffEPjtq65MiPWl5I4y/y7CuWx
 Hf3F/ZRI2e8zd8FEQ5qtHFXxGqI9C71VnQNlSuCwQ3CV6zD71aG9KSOasxDnf9QL85UK
 G5og==
X-Gm-Message-State: AO0yUKW+HVkoBbRZTsuIJCp0SYykW1bmIdj36iW4KWCaH4MsSt+xJi+E
 DEJOFLYmVhHGA+r2D58uiYzAdTu9OpKfuiBuRTiVzGJzh7zs5VFo2e9UnHEB1X03n13jvrAxZXx
 T/dk0KVcHGtqIGR4=
X-Received: by 2002:a17:90b:1d01:b0:234:27a4:fba2 with SMTP id
 on1-20020a17090b1d0100b0023427a4fba2mr5912281pjb.18.1677038160410; 
 Tue, 21 Feb 2023 19:56:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/zZDuzN6HImOMgEwUCsIL85iGMzphb5M1qLWzYmswPLzYwBtMNCKMfZWNHlR1LdXLnJE6B3A==
X-Received: by 2002:a17:90b:1d01:b0:234:27a4:fba2 with SMTP id
 on1-20020a17090b1d0100b0023427a4fba2mr5912249pjb.18.1677038160032; 
 Tue, 21 Feb 2023 19:56:00 -0800 (PST)
Received: from [10.72.13.76] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a636116000000b004fbb4a55b64sm2342151pgb.86.2023.02.21.19.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 19:55:59 -0800 (PST)
Message-ID: <17716bcb-9281-c5bb-f0c8-7715378569a2@redhat.com>
Date: Wed, 22 Feb 2023 11:55:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-8-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/2/8 17:42, Eugenio Pérez 写道:
> This allows net to restart the device backend to configure SVQ on it.
>
> Ideally, these changes should not be net specific. However, the vdpa net
> backend is the one with enough knowledge to configure everything because
> of some reasons:
> * Queues might need to be shadowed or not depending on its kind (control
>    vs data).
> * Queues need to share the same map translations (iova tree).
>
> Because of that it is cleaner to restart the whole net backend and
> configure again as expected, similar to how vhost-kernel moves between
> userspace and passthrough.
>
> If more kinds of devices need dynamic switching to SVQ we can create a
> callback struct like VhostOps and move most of the code there.
> VhostOps cannot be reused since all vdpa backend share them, and to
> personalize just for networking would be too heavy.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3:
> * Add TODO to use the resume operation in the future.
> * Use migration_in_setup and migration_has_failed instead of a
>    complicated switch case.
> ---
>   net/vhost-vdpa.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index dd686b4514..bca13f97fd 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -26,12 +26,14 @@
>   #include <err.h>
>   #include "standard-headers/linux/virtio_net.h"
>   #include "monitor/monitor.h"
> +#include "migration/misc.h"
>   #include "hw/virtio/vhost.h"
>   
>   /* Todo:need to add the multiqueue support here */
>   typedef struct VhostVDPAState {
>       NetClientState nc;
>       struct vhost_vdpa vhost_vdpa;
> +    Notifier migration_state;
>       VHostNetState *vhost_net;
>   
>       /* Control commands shadow buffers */
> @@ -241,10 +243,79 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>       return DO_UPCAST(VhostVDPAState, nc, nc0);
>   }
>   
> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
> +{
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +    VirtIONet *n;
> +    VirtIODevice *vdev;
> +    int data_queue_pairs, cvq, r;
> +    NetClientState *peer;
> +
> +    /* We are only called on the first data vqs and only if x-svq is not set */
> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
> +        return;
> +    }
> +
> +    vdev = v->dev->vdev;
> +    n = VIRTIO_NET(vdev);


Let's tweak the code to move those initialization to the beginning of 
the function.


> +    if (!n->vhost_started) {
> +        return;
> +    }


What happens if the vhost is started during the live migration?


> +
> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
> +                                  n->max_ncs - n->max_queue_pairs : 0;
> +    /*
> +     * TODO: vhost_net_stop does suspend, get_base and reset. We can be smarter
> +     * in the future and resume the device if read-only operations between
> +     * suspend and reset goes wrong.
> +     */
> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +
> +    peer = s->nc.peer;
> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
> +        VhostVDPAState *vdpa_state;
> +        NetClientState *nc;
> +
> +        if (i < data_queue_pairs) {
> +            nc = qemu_get_peer(peer, i);
> +        } else {
> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
> +        }
> +
> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
> +        vdpa_state->vhost_vdpa.shadow_data = enable;
> +
> +        if (i < data_queue_pairs) {
> +            /* Do not override CVQ shadow_vqs_enabled */
> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
> +        }


I wonder what happens if the number of queue pairs is changed during 
live migration? Should we assign all qps in this case?

Thanks


> +    }
> +
> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
> +    if (unlikely(r < 0)) {
> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
> +    }
> +}
> +
> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *migration = data;
> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
> +                                     migration_state);
> +
> +    if (migration_in_setup(migration)) {
> +        vhost_vdpa_net_log_global_enable(s, true);
> +    } else if (migration_has_failed(migration)) {
> +        vhost_vdpa_net_log_global_enable(s, false);
> +    }
> +}
> +
>   static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>   {
>       struct vhost_vdpa *v = &s->vhost_vdpa;
>   
> +    add_migration_state_change_notifier(&s->migration_state);
>       if (v->shadow_vqs_enabled) {
>           v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>                                              v->iova_range.last);
> @@ -278,6 +349,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>   
>       assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>   
> +    if (s->vhost_vdpa.index == 0) {
> +        remove_migration_state_change_notifier(&s->migration_state);
> +    }
> +
>       dev = s->vhost_vdpa.dev;
>       if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>           g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> @@ -741,6 +816,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.device_fd = vdpa_device_fd;
>       s->vhost_vdpa.index = queue_pair_index;
>       s->always_svq = svq;
> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_range = iova_range;
>       s->vhost_vdpa.shadow_data = svq;


