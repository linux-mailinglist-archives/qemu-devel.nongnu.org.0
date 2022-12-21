Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568F652DDD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7uMl-00023H-7B; Wed, 21 Dec 2022 03:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p7uMa-000200-Hu
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p7uMY-0002A4-PJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671610925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oH4xR+6GHPxwyourQ1So44EBmZiMwR8a5z9E2ZObjNc=;
 b=AsKRqygfKjusxqGPsDDU4owaF+bgnfpUq0oQZep74/7KjGnreVf2yP8MWXACKgINaM3VMC
 EspdYSVcFJQIO6esFbKju+mJrXPhLlL1AoOHNVP1EKD+3mmj8ec7DwONkUnOxinMj4DkDu
 9Khw1vIucLb2ibGbbDcQsR29zkTxRvI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-qHSTFrrJMf-RrwCk_I1MfQ-1; Wed, 21 Dec 2022 03:22:04 -0500
X-MC-Unique: qHSTFrrJMf-RrwCk_I1MfQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 w18-20020a4a6d52000000b0049f209d84bbso6616589oof.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oH4xR+6GHPxwyourQ1So44EBmZiMwR8a5z9E2ZObjNc=;
 b=AY4l/z7XNZWIxN+fbni+olBnLW1r6OE1w1teIVn8BcW/OZxp1ZgYe82j3LPgtvk2iU
 4UjEftYzC+HUWvyZHHyi+Oa3L265RISTPHlr6fcxMFxoFGjykx5l1Im02y3FZmLHLAbb
 uv4VYGdwowccvc90ET6yrYdoDLUfeBXTDYUl6DVjyoCz6h3RZE6GLJ9K+vGuHRGKRznJ
 yaJIQUmchY/xukCnZY0fPqNJ0zi1GHNPp3rjLItrxW9AIBm96BMzHRVQCaljLmB7WNm4
 td8ybUzrwZCvMp2a0yXhmAwf62svh6x7qtEpk5JMtQ4O2bzc6CbmnSTfXpVzSPrksAFU
 a+Jg==
X-Gm-Message-State: AFqh2koJn/SCiJs9IuIdTzCHAsfev7hwEaBYjcMmdMAOoMdeDXC7nBqX
 yEhQ3euLnuR72lomw5Yao9eZfN30BEl9pOyNVW3JIxJgGhsCPo+yCiw+Ry84v4LjqvSxS+vkDLj
 isCvBqclVxv0NoQRAaWpIT/h4AwOfdpg=
X-Received: by 2002:a05:6830:4a3:b0:670:8334:ccf2 with SMTP id
 l3-20020a05683004a300b006708334ccf2mr63236otd.201.1671610923618; 
 Wed, 21 Dec 2022 00:22:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv1QgX5oNaFRL+esvIe2wzkXWV7DRjGd86V2hWO4JJsn9J3zuQYV7VCnMIRuGtVaJQH8nbwm1p1aqCGGZyC5Zk=
X-Received: by 2002:a05:6830:4a3:b0:670:8334:ccf2 with SMTP id
 l3-20020a05683004a300b006708334ccf2mr63218otd.201.1671610923360; Wed, 21 Dec
 2022 00:22:03 -0800 (PST)
MIME-Version: 1.0
References: <20221215113144.322011-1-eperezma@redhat.com>
 <20221215113144.322011-7-eperezma@redhat.com>
 <CACGkMEtE_6nci5zwQZbOMbu3e9gh4aa_88WjTgkWkjKqQBB3Zw@mail.gmail.com>
 <CAJaqyWcxeuOiHYBb_ftedSrJpNpN9vQJ2sZZ_5cZh4RsQSdgVQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcxeuOiHYBb_ftedSrJpNpN9vQJ2sZZ_5cZh4RsQSdgVQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 Dec 2022 16:21:52 +0800
Message-ID: <CACGkMEtkWJQVrnuG7CKJ+zFcMFhhZs3=iFPjv85U7KAjkpd=EA@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] vdpa: request iova_range only once
To: Eugenio Perez Martin <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Longpeng <longpeng2@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Fri, Dec 16, 2022 at 5:53 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Dec 16, 2022 at 8:29 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 7:32 PM Eugenio P=C3=A9rez <eperezma@redhat.com=
> wrote:
> > >
> > > Currently iova range is requested once per queue pair in the case of
> > > net. Reduce the number of ioctls asking it once at initialization and
> > > reusing that value for each vhost_vdpa.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-vdpa.c | 15 ---------------
> > >  net/vhost-vdpa.c       | 27 ++++++++++++++-------------
> > >  2 files changed, 14 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index 691bcc811a..9b7f4ef083 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -365,19 +365,6 @@ static int vhost_vdpa_add_status(struct vhost_de=
v *dev, uint8_t status)
> > >      return 0;
> > >  }
> > >
> > > -static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > -{
> > > -    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> > > -                              &v->iova_range);
> > > -    if (ret !=3D 0) {
> > > -        v->iova_range.first =3D 0;
> > > -        v->iova_range.last =3D UINT64_MAX;
> > > -    }
> > > -
> > > -    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > -                                    v->iova_range.last);
> > > -}
> > > -
> > >  /*
> > >   * The use of this function is for requests that only need to be
> > >   * applied once. Typically such request occurs at the beginning
> > > @@ -465,8 +452,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev,=
 void *opaque, Error **errp)
> > >          goto err;
> > >      }
> > >
> > > -    vhost_vdpa_get_iova_range(v);
> > > -
> > >      if (!vhost_vdpa_first_dev(dev)) {
> > >          return 0;
> > >      }
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 2c0ff6d7b0..b6462f0192 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -541,14 +541,15 @@ static const VhostShadowVirtqueueOps vhost_vdpa=
_net_svq_ops =3D {
> > >  };
> > >
> > >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > -                                           const char *device,
> > > -                                           const char *name,
> > > -                                           int vdpa_device_fd,
> > > -                                           int queue_pair_index,
> > > -                                           int nvqs,
> > > -                                           bool is_datapath,
> > > -                                           bool svq,
> > > -                                           VhostIOVATree *iova_tree)
> > > +                                       const char *device,
> > > +                                       const char *name,
> > > +                                       int vdpa_device_fd,
> > > +                                       int queue_pair_index,
> > > +                                       int nvqs,
> > > +                                       bool is_datapath,
> > > +                                       bool svq,
> > > +                                       struct vhost_vdpa_iova_range =
iova_range,
> > > +                                       VhostIOVATree *iova_tree)
> >
> > Nit: it's better not mix style changes.
> >
>
> The style changes are because the new parameter is longer than 80
> characters, do you prefer me to send a previous patch reducing
> indentation?
>

Michale, what's your preference? I'm fine with both.

Thanks

> Thanks!
>
> > Other than this:
> >
> > Acked-by: Jason Wang <jasonwang@redhat.com>
> >
> > Thanks
> >
> > >  {
> > >      NetClientState *nc =3D NULL;
> > >      VhostVDPAState *s;
> > > @@ -567,6 +568,7 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> > >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> > >      s->vhost_vdpa.index =3D queue_pair_index;
> > >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > +    s->vhost_vdpa.iova_range =3D iova_range;
> > >      s->vhost_vdpa.iova_tree =3D iova_tree;
> > >      if (!is_datapath) {
> > >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_=
size(),
> > > @@ -646,6 +648,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >      int vdpa_device_fd;
> > >      g_autofree NetClientState **ncs =3D NULL;
> > >      g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > > +    struct vhost_vdpa_iova_range iova_range;
> > >      NetClientState *nc;
> > >      int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > >
> > > @@ -689,14 +692,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > >          return queue_pairs;
> > >      }
> > >
> > > +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > >      if (opts->x_svq) {
> > > -        struct vhost_vdpa_iova_range iova_range;
> > > -
> > >          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > >              goto err_svq;
> > >          }
> > >
> > > -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > >          iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_ran=
ge.last);
> > >      }
> > >
> > > @@ -705,7 +706,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >      for (i =3D 0; i < queue_pairs; i++) {
> > >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >                                       vdpa_device_fd, i, 2, true, opt=
s->x_svq,
> > > -                                     iova_tree);
> > > +                                     iova_range, iova_tree);
> > >          if (!ncs[i])
> > >              goto err;
> > >      }
> > > @@ -713,7 +714,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> > >      if (has_cvq) {
> > >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > >                                   vdpa_device_fd, i, 1, false,
> > > -                                 opts->x_svq, iova_tree);
> > > +                                 opts->x_svq, iova_range, iova_tree)=
;
> > >          if (!nc)
> > >              goto err;
> > >      }
> > > --
> > > 2.31.1
> > >
> >
>


