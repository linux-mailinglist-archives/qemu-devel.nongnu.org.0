Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79A564E7C0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 08:30:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p659o-00081e-0Z; Fri, 16 Dec 2022 02:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p659m-00081P-2B
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:29:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p659j-0006Cp-Tc
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 02:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671175758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW+sv5mYhRvxJF0GOvtPqOs7Ygs+0slBtBfj7fBSikk=;
 b=gJ4ApR3vcDcZZZBilDz4cqJ3bpaU+P7IR8qZYJZ+8YBjpCpsj9TiVk5V8jfRwxECEwqdND
 PtNUy3rJn2xNeYEDuoUiEwGscwuhzaN2BoDkV0ANhLHC9tJwCPMU2og6WEahNiDSAqzSow
 jpO6BmxlOKECZmunHLaaVRBTBuTO5iM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-GNZ-IgvwMFW63pFl1XwE4A-1; Fri, 16 Dec 2022 02:29:16 -0500
X-MC-Unique: GNZ-IgvwMFW63pFl1XwE4A-1
Received: by mail-ot1-f70.google.com with SMTP id
 l31-20020a9d1b22000000b0066c48e9249fso912673otl.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 23:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TW+sv5mYhRvxJF0GOvtPqOs7Ygs+0slBtBfj7fBSikk=;
 b=ofGB3ABPm93yCETqgMV9E95dvL+zNB7AkUZipOLjjELTEBnjG/Egfmi1/msqhVO+Bf
 EBQGnDJMDAH+vAJB9IvHUXsXx4pOh+EjxNeVzUaiXN38bcW06/uAf9O1j5PqsP/srof4
 NZuNNe6K+IQR8qOaSiRVT/u0A04rP8VYJsWmPUsuNwmP6TrFcssQbZb+gKUKvIOEQoCb
 LZOWPSPaC8V5YdRdSLM7oze/7vZzBkmtTrCyJmo7zrFyibebxbhLT24ZTHgyCkm2m/Xf
 fWNxCUdoe6/GHf9wO/zjRJKNvUpD2IQkVmwf2f5AHDijIlNf0XNZVZYlse3rqQiIMEF2
 lM+g==
X-Gm-Message-State: AFqh2kq+q6ooVCdqblxChspigjYHmioGjFr9Au5jxqCc+MLotKOFAixi
 JfYCSLXaMcl3luEToUBfQe09cTNvXYx2TuBdYYzq/4WwcUNC2b84Dw/sxxFPAbaUBT3GAyXScJ+
 txbTJV71pJDq+txkGsm6XBU4kkvd4Rto=
X-Received: by 2002:a05:6870:bb1a:b0:144:b22a:38d3 with SMTP id
 nw26-20020a056870bb1a00b00144b22a38d3mr872729oab.280.1671175755916; 
 Thu, 15 Dec 2022 23:29:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXusEFPcQUgv8vWQpDBGlYmgo/nVhMOtk5zg4py81ZTLkbfbNHejRxyk1WzIGWqY0Or4Lgg2VyCQoA1j+incrFU=
X-Received: by 2002:a05:6870:bb1a:b0:144:b22a:38d3 with SMTP id
 nw26-20020a056870bb1a00b00144b22a38d3mr872708oab.280.1671175755609; Thu, 15
 Dec 2022 23:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20221215113144.322011-1-eperezma@redhat.com>
 <20221215113144.322011-7-eperezma@redhat.com>
In-Reply-To: <20221215113144.322011-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Dec 2022 15:29:04 +0800
Message-ID: <CACGkMEtE_6nci5zwQZbOMbu3e9gh4aa_88WjTgkWkjKqQBB3Zw@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] vdpa: request iova_range only once
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Longpeng <longpeng2@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Dec 15, 2022 at 7:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Currently iova range is requested once per queue pair in the case of
> net. Reduce the number of ioctls asking it once at initialization and
> reusing that value for each vhost_vdpa.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 15 ---------------
>  net/vhost-vdpa.c       | 27 ++++++++++++++-------------
>  2 files changed, 14 insertions(+), 28 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 691bcc811a..9b7f4ef083 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -365,19 +365,6 @@ static int vhost_vdpa_add_status(struct vhost_dev *d=
ev, uint8_t status)
>      return 0;
>  }
>
> -static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> -{
> -    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> -                              &v->iova_range);
> -    if (ret !=3D 0) {
> -        v->iova_range.first =3D 0;
> -        v->iova_range.last =3D UINT64_MAX;
> -    }
> -
> -    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> -                                    v->iova_range.last);
> -}
> -
>  /*
>   * The use of this function is for requests that only need to be
>   * applied once. Typically such request occurs at the beginning
> @@ -465,8 +452,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, voi=
d *opaque, Error **errp)
>          goto err;
>      }
>
> -    vhost_vdpa_get_iova_range(v);
> -
>      if (!vhost_vdpa_first_dev(dev)) {
>          return 0;
>      }
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 2c0ff6d7b0..b6462f0192 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -541,14 +541,15 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net=
_svq_ops =3D {
>  };
>
>  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> -                                           const char *device,
> -                                           const char *name,
> -                                           int vdpa_device_fd,
> -                                           int queue_pair_index,
> -                                           int nvqs,
> -                                           bool is_datapath,
> -                                           bool svq,
> -                                           VhostIOVATree *iova_tree)
> +                                       const char *device,
> +                                       const char *name,
> +                                       int vdpa_device_fd,
> +                                       int queue_pair_index,
> +                                       int nvqs,
> +                                       bool is_datapath,
> +                                       bool svq,
> +                                       struct vhost_vdpa_iova_range iova=
_range,
> +                                       VhostIOVATree *iova_tree)

Nit: it's better not mix style changes.

Other than this:

Acked-by: Jason Wang <jasonwang@redhat.com>

Thanks

>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
> @@ -567,6 +568,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
>      s->vhost_vdpa.index =3D queue_pair_index;
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> +    s->vhost_vdpa.iova_range =3D iova_range;
>      s->vhost_vdpa.iova_tree =3D iova_tree;
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
> @@ -646,6 +648,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      int vdpa_device_fd;
>      g_autofree NetClientState **ncs =3D NULL;
>      g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> +    struct vhost_vdpa_iova_range iova_range;
>      NetClientState *nc;
>      int queue_pairs, r, i =3D 0, has_cvq =3D 0;
>
> @@ -689,14 +692,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>          return queue_pairs;
>      }
>
> +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
>      if (opts->x_svq) {
> -        struct vhost_vdpa_iova_range iova_range;
> -
>          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>              goto err_svq;
>          }
>
> -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
>          iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range.l=
ast);
>      }
>
> @@ -705,7 +706,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      for (i =3D 0; i < queue_pairs; i++) {
>          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                       vdpa_device_fd, i, 2, true, opts->x=
_svq,
> -                                     iova_tree);
> +                                     iova_range, iova_tree);
>          if (!ncs[i])
>              goto err;
>      }
> @@ -713,7 +714,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      if (has_cvq) {
>          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                   vdpa_device_fd, i, 1, false,
> -                                 opts->x_svq, iova_tree);
> +                                 opts->x_svq, iova_range, iova_tree);
>          if (!nc)
>              goto err;
>      }
> --
> 2.31.1
>


