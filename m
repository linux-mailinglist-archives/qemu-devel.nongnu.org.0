Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE1504EDE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 12:38:42 +0200 (CEST)
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngOmH-0005C9-8S
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 06:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngOjB-0003ji-Cr
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:35:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ngOj7-0000VP-Ve
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 06:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650278124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7YYs4UeRYBitilAceLeDR9Ep2FoqbDJ/J3Y9XYOnks=;
 b=SHK/JRcIBGLdiNlgQgir2uvuVxn+vTw4QnPhBC5cNhtsZ1jO3oki/IjJRWB70PJqpAfyZv
 RNnx9KPLFAV1lvpGyI8KHf+bUDO3s6PC5RiYsLqF1cMqnk3Xlj+L6XgpGms+5V0eH1GyRX
 +XCCUgyC/7hhu3AzDJEgwVVyPzkHiGo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-mj7XVB8vPeS910-IZdj6JQ-1; Mon, 18 Apr 2022 06:35:20 -0400
X-MC-Unique: mj7XVB8vPeS910-IZdj6JQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk23-20020a05620a1a1700b0067b32f93b90so10044349qkb.16
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 03:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R7YYs4UeRYBitilAceLeDR9Ep2FoqbDJ/J3Y9XYOnks=;
 b=UKfqLaovM/zSbHG2Mh87B5tbsbKe4MuI7u84j+5lU2JRKq1FA7UuETABSNH2Lxxlcv
 vWvtdqzdXUms65ns/QjBF78sKX3CkmkP5/bGx50qp7KWBVPEEAiDi6c6vGdXkdPsmTx+
 8eNT/58OJPlzuL01mhp/pILETBQK6XJO1rml62j0oaddoRlATaLcyb386y4elZgcJi3W
 x+jn8mORnPHtzwbk36zLi4UDFmhB8kjvf+FDKL+Er8nnDgl/qKwglAm3HWcO2nvP1sYq
 u6lBAEcuhIacZB57mzn4u9Seu91AifnFXhdymyDbQuC6V3tprxzeHTEYKkdeCyVr4nPu
 saJg==
X-Gm-Message-State: AOAM531gPIeUJINqVm/rJ6iOWZI8CHRkvD1xingcqwBvK6kOUoSDpZy8
 KSjFQG3QRXnM2ycbwg2dKIc41d+TZqohyYz3bKWwnEEOHJ3IPlNiONVsVpw+0aquJ97PjT17pu8
 3v1mbivWV1EbuJLkdLDMUywFUHv5hovQ=
X-Received: by 2002:ac8:75cf:0:b0:2f1:ec7d:8bd0 with SMTP id
 z15-20020ac875cf000000b002f1ec7d8bd0mr6415151qtq.459.1650278120480; 
 Mon, 18 Apr 2022 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrMXTle1oyzlEoJz/vrAqQ7nNKpGAUK3zNqDas3L7+BRISkPi+O4VtiQ+7Vx67jjt6vZiKZUgLPgC/nLDI0+A=
X-Received: by 2002:ac8:75cf:0:b0:2f1:ec7d:8bd0 with SMTP id
 z15-20020ac875cf000000b002f1ec7d8bd0mr6415129qtq.459.1650278120243; Mon, 18
 Apr 2022 03:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-7-eperezma@redhat.com>
 <84ea79a3-30ab-31e1-35e6-aa63241a051d@redhat.com>
In-Reply-To: <84ea79a3-30ab-31e1-35e6-aa63241a051d@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 18 Apr 2022 12:34:44 +0200
Message-ID: <CAJaqyWcqBW4mneLOQzb7_H1pULvXkXJzGUmB6a4+ocy_Dj+Cxw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/23] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Cornelia Huck <cohuck@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 5:42 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/8 21:33, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   qapi/net.json    |  9 ++++++++-
> >   net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++-------=
-
> >   2 files changed, 48 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index b92f3f5fb4..92848e4362 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,19 @@
> >   # @queues: number of queues to be created for multiqueue vhost-vdpa
> >   #          (default: 1)
> >   #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
1)
> > +#         (default: false)
> > +#
> > +# Features:
> > +# @unstable: Member @x-svq is experimental.
> > +#
> >   # Since: 5.1
> >   ##
> >   { 'struct': 'NetdevVhostVDPAOptions',
> >     'data': {
> >       '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >   ##
> >   # @NetClientDriver:
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1e9fe47c03..def738998b 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -127,7 +127,11 @@ err_init:
> >   static void vhost_vdpa_cleanup(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
> >
> > +    if (dev && dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > +    }
> >       if (s->vhost_net) {
> >           vhost_net_cleanup(s->vhost_net);
> >           g_free(s->vhost_net);
> > @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >           .check_peer_type =3D vhost_vdpa_check_peer_type,
> >   };
> >
> > +static int vhost_vdpa_get_iova_range(int fd,
> > +                                     struct vhost_vdpa_iova_range *iov=
a_range)
> > +{
> > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > +
> > +    return ret < 0 ? -errno : 0;
> > +}
> > +
> >   static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > -                                           const char *device,
> > -                                           const char *name,
> > -                                           int vdpa_device_fd,
> > -                                           int queue_pair_index,
> > -                                           int nvqs,
> > -                                           bool is_datapath)
> > +                                       const char *device,
> > +                                       const char *name,
> > +                                       int vdpa_device_fd,
> > +                                       int queue_pair_index,
> > +                                       int nvqs,
> > +                                       bool is_datapath,
>
>
> It's better not mix style changes with the logic changes.
>

Sure, I did not realize I changed the alignment here. Next version
will only add the parameters.

Thanks!

> Other looks fine.
>
> Thanks
>
>
> > +                                       bool svq,
> > +                                       VhostIOVATree *iova_tree)
> >   {
> >       NetClientState *nc =3D NULL;
> >       VhostVDPAState *s;
> > @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >       s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >       s->vhost_vdpa.index =3D queue_pair_index;
> > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > +    s->vhost_vdpa.iova_tree =3D iova_tree;
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
> >           qemu_del_net_client(nc);
> > @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       g_autofree NetClientState **ncs =3D NULL;
> >       NetClientState *nc;
> >       int queue_pairs, i, has_cvq =3D 0;
> > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >
> >       assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >       opts =3D &netdev->u.vhost_vdpa;
> > @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >           qemu_close(vdpa_device_fd);
> >           return queue_pairs;
> >       }
> > +    if (opts->x_svq) {
> > +        struct vhost_vdpa_iova_range iova_range;
> > +
> > +        if (has_cvq) {
> > +            error_setg(errp, "vdpa svq does not work with cvq");
> > +            goto err_svq;
> > +        }
> > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> > +    }
> >
> >       ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true);
> > +                                     vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > +                                     iova_tree);
> >           if (!ncs[i])
> >               goto err;
> >       }
> >
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false);
> > +                                 vdpa_device_fd, i, 1, false, opts->x_=
svq,
> > +                                 iova_tree);
> >           if (!nc)
> >               goto err;
> >       }
> >
> > +    iova_tree =3D NULL;
> >       return 0;
> >
> >   err:
> >       if (i) {
> >           qemu_del_net_client(ncs[0]);
> >       }
> > +
> > +err_svq:
> >       qemu_close(vdpa_device_fd);
> >
> >       return -1;
>


