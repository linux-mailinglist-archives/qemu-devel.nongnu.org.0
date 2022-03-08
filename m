Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D034D122A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:26:14 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVAc-00052G-1W
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:26:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRV9C-0003oW-T7
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:24:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRV9A-0007nw-AL
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646727883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwmwTqzYpl0nr3y2BGIMZUByskRaKdsM7+GqIZD5jbs=;
 b=CltPj/bbzufHbKk9wqPshWD6NHOOk3rrik4Pf66aEQ2n0Wq8HBgbxxhztXH9GixjqFrEM2
 WRrLnAucBga9d6n7o6ag3TTwap7YXU3poFySEPXIbp7BVbjp8bjdsl48LW27aeD3rX7wCZ
 4gGuyvdNoMEokRAf2NUvOgipjToJBkA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-M7siXQtEMSembetGIAGJ4g-1; Tue, 08 Mar 2022 03:24:42 -0500
X-MC-Unique: M7siXQtEMSembetGIAGJ4g-1
Received: by mail-qv1-f72.google.com with SMTP id
 n8-20020a0ce488000000b0043519e2750cso15113542qvl.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 00:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SwmwTqzYpl0nr3y2BGIMZUByskRaKdsM7+GqIZD5jbs=;
 b=Ko8Tf4UW130aI/qujTUoUGHGwMRwp00hX+Uy/n0zs0SchVlAiJPoBNqcWWxYABM1aD
 Osw/Pf59+fqbTUZi0Xuoik7Fu0zj8v8tDgyuwrwjm0kwzd5a5h4iq9H8xq9Im9cGVmQ8
 zALgow1uoS7beP7t2U78yEJBJVD7I7HgvDk8XtDBXY7LCK7bXI6S/4fUgnP2eR8QmRNq
 5ThnIMJL4BQsQGcVh0bF8nshps0evva30e7/83c3qdjXNdkS1KtPFhfQkPEGTXnEeYcO
 keM6i2xHHsBtfuiurqFQO5u+lyWr74MVpfy7FsPVNJq5hw8bYjEmi5SLxqmczYda+Mn/
 mVNg==
X-Gm-Message-State: AOAM5339r+WRqWCwvb7zETAuyHXRA42ehb7akQJso4SIHgku4Vxb9U0O
 TKsWw8R7JVNb5BSEUndHEypg3MzogaE3xeNj/O73zfDKFySW+qWrtFKeeihvHPh9l5Xhyh8yfh5
 9eieZmConA0+hlLFi60y1h9Npve+h614=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr9340938qkb.308.1646727881779; 
 Tue, 08 Mar 2022 00:24:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9c6RzGgUBXRSpYYrADE7wzTiZSf1seJqvJD2Qi4YBzmnilpgcs+oL6L6CoeXbxGp9om6CSJno5Xz/2UPwCm4=
X-Received: by 2002:a05:620a:3195:b0:649:2a18:1480 with SMTP id
 bi21-20020a05620a319500b006492a181480mr9340915qkb.308.1646727881482; Tue, 08
 Mar 2022 00:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <20220307153334.3854134-16-eperezma@redhat.com>
 <20220308021116-mutt-send-email-mst@kernel.org>
 <CAJaqyWewPYVPDOYTgKs03-LyfMHWkE+OR6tBEQ25rZ3YZmTrsw@mail.gmail.com>
 <20220308030140-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308030140-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Mar 2022 09:24:05 +0100
Message-ID: <CAJaqyWeAxjOtvtAD2Ow2MUXQpaBUbP21=CZ4g-S0pPizq_Az-g@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 9:02 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 08:32:07AM +0100, Eugenio Perez Martin wrote:
> > On Tue, Mar 8, 2022 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> > >
> > > On Mon, Mar 07, 2022 at 04:33:34PM +0100, Eugenio P=C3=A9rez wrote:
> > > > Finally offering the possibility to enable SVQ from the command lin=
e.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  qapi/net.json    |  8 +++++++-
> > > >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++----=
----
> > > >  2 files changed, 47 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/qapi/net.json b/qapi/net.json
> > > > index 7fab2e7cd8..d626fa441c 100644
> > > > --- a/qapi/net.json
> > > > +++ b/qapi/net.json
> > > > @@ -445,12 +445,18 @@
> > > >  # @queues: number of queues to be created for multiqueue vhost-vdp=
a
> > > >  #          (default: 1)
> > > >  #
> > > > +# @svq: Start device with (experimental) shadow virtqueue. (Since =
7.0)
> > > > +#
> > > > +# Features:
> > > > +# @unstable: Member @svq is experimental.
> > > > +#
> > > >  # Since: 5.1
> > > >  ##
> > > >  { 'struct': 'NetdevVhostVDPAOptions',
> > > >    'data': {
> > > >      '*vhostdev':     'str',
> > > > -    '*queues':       'int' } }
> > > > +    '*queues':       'int',
> > > > +    '*svq':          {'type': 'bool', 'features' : [ 'unstable'] }=
 } }
> > > >
> > > >  ##
> > > >  # @NetClientDriver:
> > >
> > > I think this should be x-svq same as other unstable features.
> > >
> >
> > I'm fine with both, but I was pointed to the other direction at [1] and=
 [2].
> >
> > Thanks!
> >
> > [1] https://patchwork.kernel.org/project/qemu-devel/patch/2022030220301=
2.3476835-15-eperezma@redhat.com/
> > [2] https://lore.kernel.org/qemu-devel/20220303185147.3605350-15-eperez=
ma@redhat.com/
>
>
> I think what Markus didn't know is that a bunch of changes in
> behaviour will occur before we rename it to "svq".
> The rename is thus less of a bother more of a bonus.
>

I'm totally fine with going back to x-svq. I'm not sure if it's more
appropriate to do different modes of different parameters (svq=3Doff,
dynamic-svq=3Don) or different modes of the same parameter (svq=3Don vs
svq=3Don_migration). Or something totally different.

My impression is that all of the changes are covered with @unstable
but I can see the advantage of x- prefix since we have not come to an
agreement on it. I think it's the first time it is mentioned in the
mail list.

Do you want me to send a new series with x- prefix?

Thanks!

> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 1e9fe47c03..c827921654 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -127,7 +127,11 @@ err_init:
> > > >  static void vhost_vdpa_cleanup(NetClientState *nc)
> > > >  {
> > > >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
> > > >
> > > > +    if (dev && dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end)=
 {
> > > > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> > > > +    }
> > > >      if (s->vhost_net) {
> > > >          vhost_net_cleanup(s->vhost_net);
> > > >          g_free(s->vhost_net);
> > > > @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info =3D =
{
> > > >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> > > >  };
> > > >
> > > > +static int vhost_vdpa_get_iova_range(int fd,
> > > > +                                     struct vhost_vdpa_iova_range =
*iova_range)
> > > > +{
> > > > +    int ret =3D ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > > > +
> > > > +    return ret < 0 ? -errno : 0;
> > > > +}
> > > > +
> > > >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > > -                                           const char *device,
> > > > -                                           const char *name,
> > > > -                                           int vdpa_device_fd,
> > > > -                                           int queue_pair_index,
> > > > -                                           int nvqs,
> > > > -                                           bool is_datapath)
> > > > +                                       const char *device,
> > > > +                                       const char *name,
> > > > +                                       int vdpa_device_fd,
> > > > +                                       int queue_pair_index,
> > > > +                                       int nvqs,
> > > > +                                       bool is_datapath,
> > > > +                                       bool svq,
> > > > +                                       VhostIOVATree *iova_tree)
> > > >  {
> > > >      NetClientState *nc =3D NULL;
> > > >      VhostVDPAState *s;
> > > > @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> > > >
> > > >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> > > >      s->vhost_vdpa.index =3D queue_pair_index;
> > > > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > > +    s->vhost_vdpa.iova_tree =3D iova_tree;
> > > >      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_=
index, nvqs);
> > > >      if (ret) {
> > > >          qemu_del_net_client(nc);
> > > > @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> > > >      g_autofree NetClientState **ncs =3D NULL;
> > > >      NetClientState *nc;
> > > >      int queue_pairs, i, has_cvq =3D 0;
> > > > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> > > >
> > > >      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > >      opts =3D &netdev->u.vhost_vdpa;
> > > > @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev,=
 const char *name,
> > > >          qemu_close(vdpa_device_fd);
> > > >          return queue_pairs;
> > > >      }
> > > > +    if (opts->svq) {
> > > > +        struct vhost_vdpa_iova_range iova_range;
> > > > +
> > > > +        if (has_cvq) {
> > > > +            error_setg(errp, "vdpa svq does not work with cvq");
> > > > +            goto err_svq;
> > > > +        }
> > > > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > > +        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_r=
ange.last);
> > > > +    }
> > > >
> > > >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > > >
> > > >      for (i =3D 0; i < queue_pairs; i++) {
> > > >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name=
,
> > > > -                                     vdpa_device_fd, i, 2, true);
> > > > +                                     vdpa_device_fd, i, 2, true, o=
pts->svq,
> > > > +                                     iova_tree);
> > > >          if (!ncs[i])
> > > >              goto err;
> > > >      }
> > > >
> > > >      if (has_cvq) {
> > > >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > > -                                 vdpa_device_fd, i, 1, false);
> > > > +                                 vdpa_device_fd, i, 1, false, opts=
->svq,
> > > > +                                 iova_tree);
> > > >          if (!nc)
> > > >              goto err;
> > > >      }
> > > >
> > > > +    iova_tree =3D NULL;
> > > >      return 0;
> > > >
> > > >  err:
> > > >      if (i) {
> > > >          qemu_del_net_client(ncs[0]);
> > > >      }
> > > > +
> > > > +err_svq:
> > > >      qemu_close(vdpa_device_fd);
> > > >
> > > >      return -1;
> > > > --
> > > > 2.27.0
> > >
>


