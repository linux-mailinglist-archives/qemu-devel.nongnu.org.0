Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEEF500988
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:18:52 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevcp-0001Pm-TQ
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevXp-0008Da-Mg
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nevXn-0006NY-PZ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 05:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649927618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbIq+i7gukFWlrL22n6lIE4nn55j2hB6hI3nUrUAXQE=;
 b=QADJhc6isqlRCCkMdxiohl3RBX3ziJbHqgnYPnEPsDTT6Rq+/7tSZ2Z/OmdKaG8uz3XkjA
 /9nlMsLv5MTw17ulvOtplHNlYvtHTZdOjb5peXhacz84zKA9E1Jcrn5eXKaDg9T94VR/EC
 iJmVkmYkX0x+cYuVuBlIAIBHxqGObn0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-_T4dte5yMS6mECIcpCDsGw-1; Thu, 14 Apr 2022 05:13:35 -0400
X-MC-Unique: _T4dte5yMS6mECIcpCDsGw-1
Received: by mail-lj1-f200.google.com with SMTP id
 194-20020a2e09cb000000b0024d8028b8e0so299628ljj.6
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 02:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gbIq+i7gukFWlrL22n6lIE4nn55j2hB6hI3nUrUAXQE=;
 b=RNQn8uyz+4a2ozP8J8T59H4LPU94DdtaTYwp2Tq7xYijXr+G3mAP+6KUpUIwAMIk/l
 jJ3YOVpt4M2qitB2TK6SYBM8d2JlqTO1v+wsacVNXQeiJYHKiR4zhoQGRn8AGq/2l3ti
 foZ1XxMMc3gbSpYc3+dDViCD+QXtHaO9HxRqo3A5X+uNxpeqoDkXvnKfjJZ7kjBmiihV
 JVKO7zBg3pZE7dNvXcgmo+yH7wn2hq77F79jqd4zpiueigyJoC9rvgu2ZoXVyq9hmUUN
 EAOIrKTQ8sn4eynVlqiQ81KQwqxYrm3TNHJoUcpQ/MxkXXVwmFTB58cURN8fhYKVZ/F7
 4weQ==
X-Gm-Message-State: AOAM533Lr6AfG/X5U4AVHPGbLv4cqHmZwhzBHBcG7nbAG494UNEw+jIf
 DDM0HGXeV8iRRu7XR+CxoAcUsPSCNaGMrcRqxr3x6XGZFwrFG6JlIJ3nbzLpAO4GC41cwU+x0mz
 IdJxBqLKPUZClgfML9WY2DgKwtCWCrDY=
X-Received: by 2002:a05:6512:3093:b0:46b:814c:3a69 with SMTP id
 z19-20020a056512309300b0046b814c3a69mr1311922lfd.376.1649927614105; 
 Thu, 14 Apr 2022 02:13:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjzJ8/ZfAngzg9JAbpO1Daf90VFmvnZFlS9TksjYZ4joknxkYsqlbZCh/7jdIJi3TZ0CsVNCLIx9vahD14zBs=
X-Received: by 2002:a05:6512:3093:b0:46b:814c:3a69 with SMTP id
 z19-20020a056512309300b0046b814c3a69mr1311900lfd.376.1649927613904; Thu, 14
 Apr 2022 02:13:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-19-eperezma@redhat.com>
In-Reply-To: <20220413163206.1958254-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Apr 2022 17:13:22 +0800
Message-ID: <CACGkMEvn-9nL2gGcs1Lp-feRYqyoXGaApugqbH18SvyrhLq4CA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 18/25] vdpa: Add map/unmap operation callback to SVQ
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
>

Let's document the motivation here. It looks to me we don't have more
than one kind of map ops implemented in this series.

Thanks

> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.h | 21 +++++++++++++++++++--
>  hw/virtio/vhost-shadow-virtqueue.c |  8 +++++++-
>  hw/virtio/vhost-vdpa.c             | 20 +++++++++++++++++++-
>  3 files changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-=
virtqueue.h
> index 2809dee27b..e06ac52158 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -26,6 +26,15 @@ typedef struct VhostShadowVirtqueueOps {
>      VirtQueueElementCallback used_elem_handler;
>  } VhostShadowVirtqueueOps;
>
> +typedef int (*vhost_svq_map_op)(hwaddr iova, hwaddr size, void *vaddr,
> +                                bool readonly, void *opaque);
> +typedef int (*vhost_svq_unmap_op)(hwaddr iova, hwaddr size, void *opaque=
);
> +
> +typedef struct VhostShadowVirtqueueMapOps {
> +    vhost_svq_map_op map;
> +    vhost_svq_unmap_op unmap;
> +} VhostShadowVirtqueueMapOps;
> +
>  /* Shadow virtqueue to relay notifications */
>  typedef struct VhostShadowVirtqueue {
>      /* Shadow vring */
> @@ -73,6 +82,12 @@ typedef struct VhostShadowVirtqueue {
>      /* Optional callbacks */
>      const VhostShadowVirtqueueOps *ops;
>
> +    /* Device memory mapping callbacks */
> +    const VhostShadowVirtqueueMapOps *map_ops;
> +
> +    /* Device memory mapping callbacks opaque */
> +    void *map_ops_opaque;
> +
>      /* Optional custom used virtqueue element handler */
>      VirtQueueElementCallback used_elem_cb;
>
> @@ -102,8 +117,10 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, Virt=
IODevice *vdev,
>                       VirtQueue *vq);
>  void vhost_svq_stop(VhostShadowVirtqueue *svq);
>
> -VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> -                                    const VhostShadowVirtqueueOps *ops);
> +VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_map,
> +                                    const VhostShadowVirtqueueOps *ops,
> +                                    const VhostShadowVirtqueueMapOps *ma=
p_ops,
> +                                    void *map_ops_opaque);
>
>  void vhost_svq_free(gpointer vq);
>  G_DEFINE_AUTOPTR_CLEANUP_FUNC(VhostShadowVirtqueue, vhost_svq_free);
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 72a403d90b..87980e2a9c 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -612,13 +612,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   *
>   * @iova_tree: Tree to perform descriptors translations
>   * @ops: SVQ operations hooks
> + * @map_ops: SVQ mapping operation hooks
> + * @map_ops_opaque: Opaque data to pass to mapping operations
>   *
>   * Returns the new virtqueue or NULL.
>   *
>   * In case of error, reason is reported through error_report.
>   */
>  VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
> -                                    const VhostShadowVirtqueueOps *ops)
> +                                    const VhostShadowVirtqueueOps *ops,
> +                                    const VhostShadowVirtqueueMapOps *ma=
p_ops,
> +                                    void *map_ops_opaque)
>  {
>      g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue=
, 1);
>      int r;
> @@ -641,6 +645,8 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *io=
va_tree,
>      event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>      svq->iova_tree =3D iova_tree;
>      svq->ops =3D ops;
> +    svq->map_ops =3D map_ops;
> +    svq->map_ops_opaque =3D map_ops_opaque;
>      return g_steal_pointer(&svq);
>
>  err_init_hdev_call:
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9e62f3280d..1948c5ca7d 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -384,6 +384,22 @@ static int vhost_vdpa_get_dev_features(struct vhost_=
dev *dev,
>      return ret;
>  }
>
> +static int vhost_vdpa_svq_map(hwaddr iova, hwaddr size, void *vaddr,
> +                              bool readonly, void *opaque)
> +{
> +    return vhost_vdpa_dma_map(opaque, iova, size, vaddr, readonly);
> +}
> +
> +static int vhost_vdpa_svq_unmap(hwaddr iova, hwaddr size, void *opaque)
> +{
> +    return vhost_vdpa_dma_unmap(opaque, iova, size);
> +}
> +
> +static const VhostShadowVirtqueueMapOps vhost_vdpa_svq_map_ops =3D {
> +    .map =3D vhost_vdpa_svq_map,
> +    .unmap =3D vhost_vdpa_svq_unmap,
> +};
> +
>  static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa=
 *v,
>                                 Error **errp)
>  {
> @@ -411,7 +427,9 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev=
, struct vhost_vdpa *v,
>      shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
>          g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new(v->iova_tr=
ee,
> -                                                            v->shadow_vq=
_ops);
> +                                                       v->shadow_vq_ops,
> +                                                       &vhost_vdpa_svq_m=
ap_ops,
> +                                                       v);
>
>          if (unlikely(!svq)) {
>              error_setg(errp, "Cannot create svq %u", n);
> --
> 2.27.0
>


