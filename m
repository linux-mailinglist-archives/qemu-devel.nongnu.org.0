Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1463CF50
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Gn7-0007hA-8X; Wed, 30 Nov 2022 01:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Gn4-0007h1-BE
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Gn2-0007eH-Op
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669790507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHsnUPgsAXHYQy/PElwkoAe59Hk4r6bXlAIKPglqcY0=;
 b=UsvTYePK+IU0H8PiKUW4G7eD8LW8XE4UOmJWZLhKMC3DurJdc/PeVEFijYgZdCpm38EhB1
 n3GN6tgyNbBbp6JYfG/Piv5fnPZ+sQ5MksIndFzh8LYR/7cDU/CC58eN4Shr37/YfXdiul
 EKbBV94Pggg7Pu9Bn9T7IF+6UlMeUEc=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-m57NPZYYN7ilA_3IOIt48g-1; Wed, 30 Nov 2022 01:41:45 -0500
X-MC-Unique: m57NPZYYN7ilA_3IOIt48g-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13ca47a9815so9597284fac.17
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IHsnUPgsAXHYQy/PElwkoAe59Hk4r6bXlAIKPglqcY0=;
 b=xBZykrAg0Zr7aOTHNBvw1K6jeVEpOhoA2nXMg5CZen+SceVLtbpHoDj6xgUmDe2JWH
 r4aTn18Vk6dnpaQpi6999oDgEYriOUQvwk2lWBleiV1jsIkLOVSm6LFY8gZPPL5YnmBI
 dq+6wpoeCsQMPNoYQep0ybrDz5Dq6k06Lk+HRXZ/AMYd9oTIlshlzLU7aKDZ0tqq9php
 XLzT6/Z9qu1OTU+xvtIEz9B9Tiv4rTUwJxqCMmpoHdpM63h7c5HbYOGGQZX7hWDlVPM+
 AKuSEUv0/X52DjFtGb+s1iTnZ94Fft0lI+MvDL9u0qreCu32iJB5KsCilZGvwnFFh9xP
 uz8A==
X-Gm-Message-State: ANoB5pnPnVlEXiV0aCOFcSTJHDi4eorqT93GbYlP36XnRqJJb1fSXN0h
 dpYtQrCQfeOgKiRCMc9KpK/ArsyQE7uTsq2mjU+lctHxLa6WLBBY0CKdDVfVsPc4EMJH6XtA7+U
 90q2tWnzLJx4o315PaDhqId+rVHmBWvQ=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10600885oiz.280.1669790503017; 
 Tue, 29 Nov 2022 22:41:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5d4xDQb4e1F645YO2KQm0Mp+bvrkNm64BpAmQo7DMgdle3BEU29Odfyc3Bq60SM2d3syTn91xlnjtj6X1LD3w=
X-Received: by 2002:aca:2103:0:b0:35b:9abf:5031 with SMTP id
 3-20020aca2103000000b0035b9abf5031mr10600864oiz.280.1669790502807; Tue, 29
 Nov 2022 22:41:42 -0800 (PST)
MIME-Version: 1.0
References: <20221124155158.2109884-1-eperezma@redhat.com>
 <20221124155158.2109884-5-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:41:31 +0800
Message-ID: <CACGkMEub1-n_54-10PcyZejPgGrZFhnGe-k1fQ-g0X663UH7vQ@mail.gmail.com>
Subject: Re: [PATCH for 8.0 v8 04/12] vhost: move iova_tree set to
 vhost_svq_start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 24, 2022 at 11:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>
> Since we don't know if we will use SVQ at qemu initialization, let's
> allocate iova_tree only if needed. To do so, accept it at SVQ start, not
> at initialization.
>
> This will avoid to create it if the device does not support SVQ.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-shadow-virtqueue.h | 5 ++---
>  hw/virtio/vhost-shadow-virtqueue.c | 9 ++++-----
>  hw/virtio/vhost-vdpa.c             | 5 ++---
>  3 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index d04c34a589..926a4897b1 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -126,11 +126,10 @@ size_t vhost_svq_driver_area_size(const VhostShadow=
Virtqueue *svq);
>  size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>
>  void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> -                     VirtQueue *vq);
> +                     VirtQueue *vq, VhostIOVATree *iova_tree);
>  void vhost_svq_stop(VhostShadowVirtqueue *svq);
>
> -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> -                                    const VhostShadowVirtqueueOps *ops,
> +VhostShadowVirtqueue *vhost_svq_new(const VhostShadowVirtqueueOps *ops,
>                                      void *ops_opaque);
>
>  void vhost_svq_free(gpointer vq);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 3b05bab44d..4307296358 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -642,9 +642,10 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue =
*svq, int svq_kick_fd)
>   * @svq: Shadow Virtqueue
>   * @vdev: VirtIO device
>   * @vq: Virtqueue to shadow
> + * @iova_tree: Tree to perform descriptors translations
>   */
>  void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
> -                     VirtQueue *vq)
> +                     VirtQueue *vq, VhostIOVATree *iova_tree)
>  {
>      size_t desc_size, driver_size, device_size;
>
> @@ -655,6 +656,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtI=
ODevice *vdev,
>      svq->last_used_idx =3D 0;
>      svq->vdev =3D vdev;
>      svq->vq =3D vq;
> +    svq->iova_tree =3D iova_tree;
>
>      svq->vring.num =3D virtio_queue_get_num(vdev, virtio_get_queue_index=
(vq));
>      driver_size =3D vhost_svq_driver_area_size(svq);
> @@ -712,18 +714,15 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   * Creates vhost shadow virtqueue, and instructs the vhost device to use=
 the
>   * shadow methods and file descriptors.
>   *
> - * @iova_tree: Tree to perform descriptors translations
>   * @ops: SVQ owner callbacks
>   * @ops_opaque: ops opaque pointer
>   */
> -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> -                                    const VhostShadowVirtqueueOps *ops,
> +VhostShadowVirtqueue *vhost_svq_new(const VhostShadowVirtqueueOps *ops,
>                                      void *ops_opaque)
>  {
>      VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue, 1);
>
>      event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
> -    svq->iova_tree =3D iova_tree;
>      svq->ops =3D ops;
>      svq->ops_opaque =3D ops_opaque;
>      return svq;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3df2775760..691bcc811a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -430,8 +430,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev=
, struct vhost_vdpa *v,
>      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
>          VhostShadowVirtqueue *svq;
>
> -        svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
> -                            v->shadow_vq_ops_opaque);
> +        svq =3D vhost_svq_new(v->shadow_vq_ops, v->shadow_vq_ops_opaque)=
;
>          g_ptr_array_add(shadow_vqs, svq);
>      }
>
> @@ -1063,7 +1062,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev =
*dev)
>              goto err;
>          }
>
> -        vhost_svq_start(svq, dev->vdev, vq);
> +        vhost_svq_start(svq, dev->vdev, vq, v->iova_tree);
>          ok =3D vhost_vdpa_svq_map_rings(dev, svq, &addr, &err);
>          if (unlikely(!ok)) {
>              goto err_map;
> --
> 2.31.1
>


