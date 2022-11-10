Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E61F623B40
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot07H-00029R-Ue; Thu, 10 Nov 2022 00:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot07G-00029I-Be
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ot07E-0005im-K3
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668058119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZ9yNZRWrzRVhGuUcnX8i46nuRNhbHXIg73hJkv2J6c=;
 b=hdVx6xiIgl5fUZuWGyyUk0L5pVavpMdwx4jGzNDcqZcu3JGZibJymuaVKkgnfxV3wEB8WQ
 p+/i+ntHxmpOLIIBDvZJJ14iqv/mdeGO9oeQ01q0LmThZDxZ7CVFphcjjSiznfduWSaJoQ
 emLnzl9fC5GuiUg1ojBO8O3BwxmExNk=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402-shy7DZeoPtyN2f6M-r9q1w-1; Thu, 10 Nov 2022 00:28:38 -0500
X-MC-Unique: shy7DZeoPtyN2f6M-r9q1w-1
Received: by mail-oo1-f72.google.com with SMTP id
 v10-20020a4a860a000000b00480b3e2b5afso289037ooh.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FZ9yNZRWrzRVhGuUcnX8i46nuRNhbHXIg73hJkv2J6c=;
 b=TIYeSkIvCMr3bEUEM7rw2DzMQCVwggiJB9FjqFAq7yVaexax4pX7YT/841uxOD6J/T
 cXgvuBrjWtOFBeeyPo5XZz3vUJGF/69vzOvyfZgUlF/6GE0N4NKCpjPuLvOn1V9whqct
 l2Bgim+2gybgvQgDgOYlYwz7WLHQzRHlecV3QMjYj34fXLBMOBnU0S/UFtYFdkjvtVyK
 Mkkk3QcPCXeb8CU0CK4hZ/fCmbDbe0RtbgQq64YNScdTDusK1Eq3P7JcXus565bBQnJH
 JdOWwX94UcaMUCjuM8n0hhUufr7Z4t20ovC9x2OGVgaKW4YjltQqFiCcK9It9U7BTrkV
 SBNg==
X-Gm-Message-State: ACrzQf3ggqBzLYuCFXEAEZ7NkxsSNjcltRSfc7r526kYi+mB6gDgRWDB
 iv2VjceJY3KaqCsBLDehP2takikK2ieo4oyR2RxGo/52bGCUheog99Q9gcC89TBlo3NnKJR7w+5
 gwXYjW8+buGYn6rtnqMzYoC9Dv8yqGEw=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr45848520oal.35.1668058117445; 
 Wed, 09 Nov 2022 21:28:37 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5B16fN8VF8lBDbDb2ll+gYuLLDYt1XE0XjaaKO1pEu2jEE1ZLsIgbSLNm2JA0dpBB7rBsdmF3wknx0vsGViYM=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr45848507oal.35.1668058117216; Wed, 09
 Nov 2022 21:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-4-eperezma@redhat.com>
In-Reply-To: <20221108170755.92768-4-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Nov 2022 13:28:24 +0800
Message-ID: <CACGkMEvPeJhjB=CV5-XagUw7urpjRgLa+F9KB2qpd3s_kjEZ8g@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] vhost: Allocate SVQ device file descriptors at
 device start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> The next patches will start control SVQ if possible. However, we don't
> know if that will be possible at qemu boot anymore.
>
> Delay device file descriptors until we know it at device start.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 31 ++------------------------
>  hw/virtio/vhost-vdpa.c             | 35 ++++++++++++++++++++++++------
>  2 files changed, 30 insertions(+), 36 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index 264ddc166d..3b05bab44d 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -715,43 +715,18 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   * @iova_tree: Tree to perform descriptors translations
>   * @ops: SVQ owner callbacks
>   * @ops_opaque: ops opaque pointer
> - *
> - * Returns the new virtqueue or NULL.
> - *
> - * In case of error, reason is reported through error_report.
>   */
>  VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
>                                      const VhostShadowVirtqueueOps *ops,
>                                      void *ops_opaque)
>  {
> -    g_autofree VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue=
, 1);
> -    int r;
> -
> -    r =3D event_notifier_init(&svq->hdev_kick, 0);
> -    if (r !=3D 0) {
> -        error_report("Couldn't create kick event notifier: %s (%d)",
> -                     g_strerror(errno), errno);
> -        goto err_init_hdev_kick;
> -    }
> -
> -    r =3D event_notifier_init(&svq->hdev_call, 0);
> -    if (r !=3D 0) {
> -        error_report("Couldn't create call event notifier: %s (%d)",
> -                     g_strerror(errno), errno);
> -        goto err_init_hdev_call;
> -    }
> +    VhostShadowVirtqueue *svq =3D g_new0(VhostShadowVirtqueue, 1);
>
>      event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
>      svq->iova_tree =3D iova_tree;
>      svq->ops =3D ops;
>      svq->ops_opaque =3D ops_opaque;
> -    return g_steal_pointer(&svq);
> -
> -err_init_hdev_call:
> -    event_notifier_cleanup(&svq->hdev_kick);
> -
> -err_init_hdev_kick:
> -    return NULL;
> +    return svq;
>  }
>
>  /**
> @@ -763,7 +738,5 @@ void vhost_svq_free(gpointer pvq)
>  {
>      VhostShadowVirtqueue *vq =3D pvq;
>      vhost_svq_stop(vq);
> -    event_notifier_cleanup(&vq->hdev_kick);
> -    event_notifier_cleanup(&vq->hdev_call);
>      g_free(vq);
>  }
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7f0ff4df5b..3df2775760 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -428,15 +428,11 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
>
>      shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>      for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> -        g_autoptr(VhostShadowVirtqueue) svq;
> +        VhostShadowVirtqueue *svq;
>
>          svq =3D vhost_svq_new(v->iova_tree, v->shadow_vq_ops,
>                              v->shadow_vq_ops_opaque);
> -        if (unlikely(!svq)) {
> -            error_setg(errp, "Cannot create svq %u", n);
> -            return -1;
> -        }
> -        g_ptr_array_add(shadow_vqs, g_steal_pointer(&svq));
> +        g_ptr_array_add(shadow_vqs, svq);
>      }
>
>      v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> @@ -864,11 +860,23 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev =
*dev,
>      const EventNotifier *event_notifier =3D &svq->hdev_kick;
>      int r;
>
> +    r =3D event_notifier_init(&svq->hdev_kick, 0);
> +    if (r !=3D 0) {
> +        error_setg_errno(errp, -r, "Couldn't create kick event notifier"=
);
> +        goto err_init_hdev_kick;
> +    }
> +
> +    r =3D event_notifier_init(&svq->hdev_call, 0);
> +    if (r !=3D 0) {
> +        error_setg_errno(errp, -r, "Couldn't create call event notifier"=
);
> +        goto err_init_hdev_call;
> +    }
> +
>      file.fd =3D event_notifier_get_fd(event_notifier);
>      r =3D vhost_vdpa_set_vring_dev_kick(dev, &file);
>      if (unlikely(r !=3D 0)) {
>          error_setg_errno(errp, -r, "Can't set device kick fd");
> -        return r;
> +        goto err_init_set_dev_fd;
>      }
>
>      event_notifier =3D &svq->hdev_call;
> @@ -876,8 +884,18 @@ static int vhost_vdpa_svq_set_fds(struct vhost_dev *=
dev,
>      r =3D vhost_vdpa_set_vring_dev_call(dev, &file);
>      if (unlikely(r !=3D 0)) {
>          error_setg_errno(errp, -r, "Can't set device call fd");
> +        goto err_init_set_dev_fd;
>      }
>
> +    return 0;
> +
> +err_init_set_dev_fd:
> +    event_notifier_set_handler(&svq->hdev_call, NULL);
> +
> +err_init_hdev_call:
> +    event_notifier_cleanup(&svq->hdev_kick);
> +
> +err_init_hdev_kick:
>      return r;
>  }
>
> @@ -1089,6 +1107,9 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *=
dev)
>      for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
>          VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs, i=
);
>          vhost_vdpa_svq_unmap_rings(dev, svq);
> +
> +        event_notifier_cleanup(&svq->hdev_kick);
> +        event_notifier_cleanup(&svq->hdev_call);
>      }
>  }
>
> --
> 2.31.1
>


