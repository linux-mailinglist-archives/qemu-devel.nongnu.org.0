Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC94505970
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:18:48 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSDH-0000w1-D8
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngSBq-00004w-1F
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngSBn-000339-2d
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650291433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoLehlZiqBvbgSS3OO+xLaxoWJIrETe2RZOa5kExGc8=;
 b=U/w3ilxthCB6BuP99x4d+u7BBYGPO/Jxi8D/jmNaaBviXejnhS74gO1pDCN9JCGgOq+CNE
 s5N3og0J7wXj6MpuISoaYMrR0kx237ckSu3dRu8eACov5Lu+9l3UEXp3bjIXs8Ibw94IOK
 yzp6Meaqo5yvBRbcnIu3EBYRrZ5IYos=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-yS-jDx9GM4qwuJn21abJmg-1; Mon, 18 Apr 2022 10:17:12 -0400
X-MC-Unique: yS-jDx9GM4qwuJn21abJmg-1
Received: by mail-qt1-f200.google.com with SMTP id
 f5-20020ac84645000000b002f1fb4b3153so1602180qto.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JoLehlZiqBvbgSS3OO+xLaxoWJIrETe2RZOa5kExGc8=;
 b=fgC+l4Qvmp06j+V3wuFsPbPvqwMevzi9YX1PuxrVO3rDfVJbTGq8toMw6t4IHlGYg1
 1PYguzOxk/hJfYTC2tQfRG6a+gXNdSQejOMU9eDc2tHRE01JApA+tbcKwTLbRqflaH0d
 zwOJ+/wuB8+bMIkhb2jUf/k+4eWIu4uaHNZQ683CTQ0MrtSLsrlPFKgCbEfH9rdIToww
 iFqg8OpTch2AF0fkmuNGvJKhTFm3dby3b5yP23fnPQxu+aoAlyn9naURNRYGXu1ErCaI
 bypx+qGB8qzBx9rMWSYEFaaAK1BglhMCtDvWBqtgHzXkECY+GnbOyH+ztjmDpSl8JVwQ
 0mWg==
X-Gm-Message-State: AOAM533JsViYVP+9T7w65u2ke0Y3ZUDwU0JCbKoAwI2MCVUn5q2mM3U0
 8WiQyTl7i+j4PZOg0ExmL8gAv73V6CwOrfE675w7JV4jxzxnT2hnOuE2IP2VyCffvbb0aBjsw/J
 JKesNnKz7xJj2Cr1Y8ELeX98opKnKGGk=
X-Received: by 2002:aed:304a:0:b0:2eb:eb2f:32ca with SMTP id
 68-20020aed304a000000b002ebeb2f32camr6926114qte.221.1650291431870; 
 Mon, 18 Apr 2022 07:17:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztJOy2bAHuyz08saBuDjtmNwY5Ftl6X+8d3Pku9xkEUeHWFuEPjY08rg26W4YH01DKl8bsf588Onjd1EIXH4o=
X-Received: by 2002:aed:304a:0:b0:2eb:eb2f:32ca with SMTP id
 68-20020aed304a000000b002ebeb2f32camr6926090qte.221.1650291431605; Mon, 18
 Apr 2022 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-26-eperezma@redhat.com>
 <CACGkMEsCA58gpjGHC=7-8Pruzsyexu+GUOTC-P4gf5HE2tkUTQ@mail.gmail.com>
In-Reply-To: <CACGkMEsCA58gpjGHC=7-8Pruzsyexu+GUOTC-P4gf5HE2tkUTQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Apr 2022 16:16:35 +0200
Message-ID: <CAJaqyWe=qtkQiYebgFEQ013rVTK4y6fpeFVPvqnt2cSw1ev_OQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 25/25] vdpa: Add x-cvq-svq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Thu, Apr 14, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Apr 14, 2022 at 12:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > This isolates shadow cvq in its own group.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json    |  8 +++-
> >  net/vhost-vdpa.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++--
> >  2 files changed, 100 insertions(+), 6 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 92848e4362..39c245e6cd 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -447,9 +447,12 @@
> >  #
> >  # @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
1)
> >  #         (default: false)
> > +# @x-cvq-svq: Start device with (experimental) shadow virtqueue in its=
 own
> > +#             virtqueue group. (Since 7.1)
> > +#             (default: false)
> >  #
> >  # Features:
> > -# @unstable: Member @x-svq is experimental.
> > +# @unstable: Members @x-svq and x-cvq-svq are experimental.
> >  #
> >  # Since: 5.1
> >  ##
> > @@ -457,7 +460,8 @@
> >    'data': {
> >      '*vhostdev':     'str',
> >      '*queues':       'int',
> > -    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] },
> > +    '*x-cvq-svq':    {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >  ##
> >  # @NetClientDriver:
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index a6f803ea4e..851dacb902 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -377,6 +377,17 @@ static int vhost_vdpa_get_features(int fd, uint64_=
t *features, Error **errp)
> >      return ret;
> >  }
> >
> > +static int vhost_vdpa_get_backend_features(int fd, uint64_t *features,
> > +                                           Error **errp)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_GET_BACKEND_FEATURES, features);
> > +    if (ret) {
> > +        error_setg_errno(errp, errno,
> > +            "Fail to query backend features from vhost-vDPA device");
> > +    }
> > +    return ret;
> > +}
> > +
> >  static int vhost_vdpa_get_max_queue_pairs(int fd, uint64_t features,
> >                                            int *has_cvq, Error **errp)
> >  {
> > @@ -410,16 +421,56 @@ static int vhost_vdpa_get_max_queue_pairs(int fd,=
 uint64_t features,
> >      return 1;
> >  }
> >
> > +/**
> > + * Check vdpa device to support CVQ group asid 1
> > + *
> > + * @vdpa_device_fd: Vdpa device fd
> > + * @queue_pairs: Queue pairs
> > + * @errp: Error
> > + */
> > +static int vhost_vdpa_check_cvq_svq(int vdpa_device_fd, int queue_pair=
s,
> > +                                    Error **errp)
> > +{
> > +    uint64_t backend_features;
> > +    unsigned num_as;
> > +    int r;
> > +
> > +    r =3D vhost_vdpa_get_backend_features(vdpa_device_fd, &backend_fea=
tures,
> > +                                        errp);
> > +    if (unlikely(r)) {
> > +        return -1;
> > +    }
> > +
> > +    if (unlikely(!(backend_features & VHOST_BACKEND_F_IOTLB_ASID))) {
> > +        error_setg(errp, "Device without IOTLB_ASID feature");
> > +        return -1;
> > +    }
> > +
> > +    r =3D ioctl(vdpa_device_fd, VHOST_VDPA_GET_AS_NUM, &num_as);
> > +    if (unlikely(r)) {
> > +        error_setg_errno(errp, errno,
> > +                         "Cannot retrieve number of supported ASs");
> > +        return -1;
> > +    }
> > +    if (unlikely(num_as < 2)) {
> > +        error_setg(errp, "Insufficient number of ASs (%u, min: 2)", nu=
m_as);
> > +    }
> > +
>
> This is not sufficient, we still need to check whether CVQ doesn't
> share a group with other virtqueues.
>

That is done at vhost-vdpa.c:vhost_dev_is_independent_group. This is
because we don't know the cvq index at this moment: Since the guest
still has not acked features, we don't know if cvq is at index 2 or is
the last one the device offers.

> Thanks
>
> > +    return 0;
> > +}
> > +
> >  int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >                          NetClientState *peer, Error **errp)
> >  {
> >      const NetdevVhostVDPAOptions *opts;
> > +    struct vhost_vdpa_iova_range iova_range;
> >      uint64_t features;
> >      int vdpa_device_fd;
> >      g_autofree NetClientState **ncs =3D NULL;
> >      NetClientState *nc;
> >      int queue_pairs, r, i, has_cvq =3D 0;
> >      g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > +    ERRP_GUARD();
> >
> >      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >      opts =3D &netdev->u.vhost_vdpa;
> > @@ -444,8 +495,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >          qemu_close(vdpa_device_fd);
> >          return queue_pairs;
> >      }
> > -    if (opts->x_svq) {
> > -        struct vhost_vdpa_iova_range iova_range;
> > +    if (opts->x_cvq_svq || opts->x_svq) {
> > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +
> >          uint64_t invalid_dev_features =3D
> >              features & ~vdpa_svq_device_features &
> >              /* Transport are all accepted at this point */
> > @@ -457,7 +509,21 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >                         invalid_dev_features);
> >              goto err_svq;
> >          }
> > -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +    }
> > +
> > +    if (opts->x_cvq_svq) {
> > +        if (!has_cvq) {
> > +            error_setg(errp, "Cannot use x-cvq-svq with a device witho=
ut cvq");
> > +            goto err_svq;
> > +        }
> > +
> > +        r =3D vhost_vdpa_check_cvq_svq(vdpa_device_fd, queue_pairs, er=
rp);
> > +        if (unlikely(r)) {
> > +            error_prepend(errp, "Cannot configure CVQ SVQ: ");
> > +            goto err_svq;
> > +        }
> > +    }
> > +    if (opts->x_svq) {
> >          iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> >      }
> >
> > @@ -472,11 +538,35 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >      }
> >
> >      if (has_cvq) {
> > +        g_autoptr(VhostIOVATree) cvq_iova_tree =3D NULL;
> > +
> > +        if (opts->x_cvq_svq) {
> > +            cvq_iova_tree =3D vhost_iova_tree_new(iova_range.first,
> > +                                                iova_range.last);
> > +        } else if (opts->x_svq) {
> > +            cvq_iova_tree =3D vhost_iova_tree_acquire(iova_tree);
> > +        }
> > +
> >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                   vdpa_device_fd, i, 1,
> > -                                 false, opts->x_svq, iova_tree);
> > +                                 false, opts->x_cvq_svq || opts->x_svq=
,
> > +                                 cvq_iova_tree);
> >          if (!nc)
> >              goto err;
> > +
> > +        if (opts->x_cvq_svq) {
> > +            struct vhost_vring_state asid =3D {
> > +                .index =3D 1,
> > +                .num =3D 1,
> > +            };
> > +
> > +            r =3D ioctl(vdpa_device_fd, VHOST_VDPA_SET_GROUP_ASID, &as=
id);
> > +            if (unlikely(r)) {
> > +                error_setg_errno(errp, errno,
> > +                                 "Cannot set cvq group independent asi=
d");
> > +                goto err;
> > +            }
> > +        }
> >      }
> >
> >      return 0;
> > --
> > 2.27.0
> >
>


