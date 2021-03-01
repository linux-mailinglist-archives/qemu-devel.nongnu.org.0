Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF0327781
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 07:25:48 +0100 (CET)
Received: from localhost ([::1]:41578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGc02-0008KW-Vn
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 01:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGbzG-0007lW-AD
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 01:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGbzD-0001gI-Ch
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 01:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614579893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8TAxYYg7937/MNm6gI3QQ1GQZAxezLvaR25kvT1TIE=;
 b=I4NOlBE5tadjxJOlfD+DCWUr64vJdpkNpsKYpiYiCNN0S5/x6uhFE/5CAP79cmOpkHIs0Y
 7ldVIvYx1SqQHfSSpBs+Fqzte+yAZHEzPIeF5CJUlmQiuKSD/PsyWoowkT8K0VRLdCbowc
 o6Mg+K6rtmhZXFCLyoj9HNsbGtzWobw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-5Hv8IO15MTWghoDS3Y9DsA-1; Mon, 01 Mar 2021 01:24:29 -0500
X-MC-Unique: 5Hv8IO15MTWghoDS3Y9DsA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FFE0107ACFC;
 Mon,  1 Mar 2021 06:24:27 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-230.pek2.redhat.com
 [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAEEC5D9DE;
 Mon,  1 Mar 2021 06:24:12 +0000 (UTC)
Subject: Re: [RFC v2 7/7] vhost: Route host->guest notification through shadow
 virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3df92e05-95c5-536e-150a-b5be8d6e149e@redhat.com>
Date: Mon, 1 Mar 2021 14:24:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210209153757.1653598-8-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 11:37 下午, Eugenio Pérez wrote:
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 49 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost.c                  |  5 ++-
>   3 files changed, 55 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index c45035c4b7..210133434c 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -17,6 +17,8 @@
>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
> +EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue *vq);
> +
>   bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>                                  unsigned idx,
>                                  VhostShadowVirtqueue *svq);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 01f282d434..61d98ae652 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -24,6 +24,8 @@ typedef struct VhostShadowVirtqueue {
>   
>       /* Borrowed virtqueue's guest to host notifier. */
>       EventNotifier host_notifier;
> +    /* Host to guest notifier */
> +    EventNotifier *guest_notifier;
>   
>       /* Virtio queue shadowing */
>       VirtQueue *vq;
> @@ -40,6 +42,26 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>       }
>   }
>   
> +/* Forward vhost notifications */
> +static void vhost_handle_call(EventNotifier *n)
> +{
> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
> +                                             call_notifier);
> +
> +    if (event_notifier_test_and_clear(n)) {
> +        event_notifier_set(svq->guest_notifier);
> +    }
> +}


So I wonder how this is synchonized with virtqueue mask/unmask. Or the 
masking is totally transparent to shadow virtqueue?

Thanks


> +
> +/*
> + * Get the vhost call notifier of the shadow vq
> + * @vq Shadow virtqueue
> + */
> +EventNotifier *vhost_shadow_vq_get_call_notifier(VhostShadowVirtqueue *vq)
> +{
> +    return &vq->call_notifier;
> +}
> +
>   /*
>    * Start shadow virtqueue operation.
>    * @dev vhost device
> @@ -57,6 +79,10 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>           .index = idx,
>           .fd = event_notifier_get_fd(&svq->kick_notifier),
>       };
> +    struct vhost_vring_file call_file = {
> +        .index = idx,
> +        .fd = event_notifier_get_fd(&svq->call_notifier),
> +    };
>       int r;
>   
>       /* Check that notifications are still going directly to vhost dev */
> @@ -66,6 +92,7 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>                              event_notifier_get_fd(vq_host_notifier));
>       event_notifier_set_handler(&svq->host_notifier, vhost_handle_guest_kick);
>   
> +    svq->guest_notifier = virtio_queue_get_guest_notifier(svq->vq);
>       r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
>       if (unlikely(r != 0)) {
>           error_report("Couldn't set kick fd: %s", strerror(errno));
> @@ -75,8 +102,19 @@ bool vhost_shadow_vq_start_rcu(struct vhost_dev *dev,
>       /* Check for pending notifications from the guest */
>       vhost_handle_guest_kick(&svq->host_notifier);
>   
> +    r = dev->vhost_ops->vhost_set_vring_call(dev, &call_file);
> +    if (r != 0) {
> +        error_report("Couldn't set call fd: %s", strerror(errno));
> +        goto err_set_vring_call;
> +    }
> +
>       return true;
>   
> +err_set_vring_call:
> +    kick_file.fd = event_notifier_get_fd(vq_host_notifier);
> +    r = dev->vhost_ops->vhost_set_vring_kick(dev, &kick_file);
> +    assert(r == 0);
> +
>   err_set_vring_kick:
>       event_notifier_set_handler(&svq->host_notifier, NULL);
>   
> @@ -108,6 +146,16 @@ void vhost_shadow_vq_stop_rcu(struct vhost_dev *dev,
>       assert(r == 0);
>   
>       event_notifier_set_handler(&svq->host_notifier, NULL);
> +
> +    if (!dev->vqs[idx].notifier_is_masked) {
> +        EventNotifier *e = vhost_shadow_vq_get_call_notifier(svq);
> +
> +        /* Restore vhost call */
> +        vhost_virtqueue_mask(dev, dev->vdev, dev->vq_index + idx, false);
> +
> +        /* Check for pending calls */
> +        vhost_handle_call(e);
> +    }
>   }
>   
>   /*
> @@ -136,6 +184,7 @@ VhostShadowVirtqueue *vhost_shadow_vq_new(struct vhost_dev *dev, int idx)
>           goto err_init_call_notifier;
>       }
>   
> +    event_notifier_set_handler(&svq->call_notifier, vhost_handle_call);
>       return g_steal_pointer(&svq);
>   
>   err_init_call_notifier:
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 9d4728e545..0dc95679e9 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -975,7 +975,6 @@ static int vhost_sw_live_migration_start(struct vhost_dev *dev)
>           for (idx = 0; idx < dev->nvqs; ++idx) {
>               bool ok = vhost_shadow_vq_start_rcu(dev, idx,
>                                                   dev->shadow_vqs[idx]);
> -
>               if (!ok) {
>                   int stop_idx = idx;
>   
> @@ -1608,6 +1607,10 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
>       if (mask) {
>           assert(vdev->use_guest_notifier_mask);
>           file.fd = event_notifier_get_fd(&hdev->vqs[index].masked_notifier);
> +    } else if (hdev->sw_lm_enabled) {
> +        VhostShadowVirtqueue *svq = hdev->shadow_vqs[n];
> +        EventNotifier *e = vhost_shadow_vq_get_call_notifier(svq);
> +        file.fd = event_notifier_get_fd(e);
>       } else {
>           file.fd = event_notifier_get_fd(virtio_queue_get_guest_notifier(vvq));
>       }


