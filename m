Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2244D1162
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:57:34 +0100 (CET)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUir-0002O4-M5
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRUKv-0006a4-0S
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:32:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRUKs-00083j-P8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646724766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DkKKUUhFItJ/YND8j7VuccqdKdIldpjIEvVepRyIfiM=;
 b=WhbWTYD7tG17QX1CRKxs9OkXgO/Te6bN+7DIN5/q/Tm27GglRC6k7/6HMYkV2Q7qusYkzq
 lRVUdhFplbmK6fbmkUXjybUe0i4vZjQoVnbjh2yawPPlx5KQKAPALu3WT5djVUE2C176Nz
 WPzM7fLbgKcATw7T3aonkfiNVLNIBpg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-IN7bFTPLOyevDOd3WraIJw-1; Tue, 08 Mar 2022 02:32:45 -0500
X-MC-Unique: IN7bFTPLOyevDOd3WraIJw-1
Received: by mail-qv1-f72.google.com with SMTP id
 w7-20020a0ce107000000b0043512c55ecaso14978989qvk.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DkKKUUhFItJ/YND8j7VuccqdKdIldpjIEvVepRyIfiM=;
 b=At+RKMKxQvRBxqQgkHUfj7eMRAvZik5S4nkhe7nAwb8WPc2SHe6iSQWRJF1KrQNmBJ
 QPrgnbQxIUKm6YqyE6OPxFEj08uhY3LQvp5NxZY7BLA+bnHUVnOsi9b35EniyhFuE+MT
 hIaznDiAXVdq4Ydl5sM8ss8tQYaHwsIQsUeIG5MHB7qOrBObOuEE+ZBXA3M9fUAhKi3G
 1i1OswjDu0KkD3IeKl/zll49nUug65/Fv+JuKf6fwlsxd//IL4UM7eocvmVlf6byPhd8
 WQrAm4HBXaZ2GIvF4OQwm2qG+w5ET6tbN/HJbDAAcInHVR54hYQDnIb28AhWLNlBuNkU
 vkPg==
X-Gm-Message-State: AOAM531DlkOQyVIwXhsOV4pog7YljR6TumwOg5xkTRvMdnf1Uo5qtDbU
 iFNDT7CJvs99NStQbLtRq42rRMOOt1vzvF0hygCpAhKuDR5jNOnUkGGCCPRkjmYtGoFLxRbqRqj
 taMAxP1PM0xcjNQGvhwfMW/DdLs0GBJI=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr12144383qta.199.1646724764439; 
 Mon, 07 Mar 2022 23:32:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDUrU3lvswKWaNB6hfPx+WulsFOSs+gccwGTKJX1DF/j6VBEupLoomHL/1BEGfiLnEaYYMMM3HHpdA49BP6AQ=
X-Received: by 2002:ac8:5a01:0:b0:2dd:2de2:58cf with SMTP id
 n1-20020ac85a01000000b002dd2de258cfmr12144356qta.199.1646724764150; Mon, 07
 Mar 2022 23:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <20220307153334.3854134-16-eperezma@redhat.com>
 <20220308021116-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308021116-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 8 Mar 2022 08:32:07 +0100
Message-ID: <CAJaqyWewPYVPDOYTgKs03-LyfMHWkE+OR6tBEQ25rZ3YZmTrsw@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Mar 8, 2022 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Mar 07, 2022 at 04:33:34PM +0100, Eugenio P=C3=A9rez wrote:
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json    |  8 +++++++-
> >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 47 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..d626fa441c 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,18 @@
> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >  #          (default: 1)
> >  #
> > +# @svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
> > +#
> > +# Features:
> > +# @unstable: Member @svq is experimental.
> > +#
> >  # Since: 5.1
> >  ##
> >  { 'struct': 'NetdevVhostVDPAOptions',
> >    'data': {
> >      '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*svq':          {'type': 'bool', 'features' : [ 'unstable'] } } }
> >
> >  ##
> >  # @NetClientDriver:
>
> I think this should be x-svq same as other unstable features.
>

I'm fine with both, but I was pointed to the other direction at [1] and [2]=
.

Thanks!

[1] https://patchwork.kernel.org/project/qemu-devel/patch/20220302203012.34=
76835-15-eperezma@redhat.com/
[2] https://lore.kernel.org/qemu-devel/20220303185147.3605350-15-eperezma@r=
edhat.com/

> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1e9fe47c03..c827921654 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -127,7 +127,11 @@ err_init:
> >  static void vhost_vdpa_cleanup(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_dev *dev =3D s->vhost_vdpa.dev;
> >
> > +    if (dev && dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > +    }
> >      if (s->vhost_net) {
> >          vhost_net_cleanup(s->vhost_net);
> >          g_free(s->vhost_net);
> > @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info =3D {
> >          .check_peer_type =3D vhost_vdpa_check_peer_type,
> >  };
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
> >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
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
> > +                                       bool svq,
> > +                                       VhostIOVATree *iova_tree)
> >  {
> >      NetClientState *nc =3D NULL;
> >      VhostVDPAState *s;
> > @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >
> >      s->vhost_vdpa.device_fd =3D vdpa_device_fd;
> >      s->vhost_vdpa.index =3D queue_pair_index;
> > +    s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > +    s->vhost_vdpa.iova_tree =3D iova_tree;
> >      ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_inde=
x, nvqs);
> >      if (ret) {
> >          qemu_del_net_client(nc);
> > @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >      g_autofree NetClientState **ncs =3D NULL;
> >      NetClientState *nc;
> >      int queue_pairs, i, has_cvq =3D 0;
> > +    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >
> >      assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >      opts =3D &netdev->u.vhost_vdpa;
> > @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >          qemu_close(vdpa_device_fd);
> >          return queue_pairs;
> >      }
> > +    if (opts->svq) {
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
> >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >
> >      for (i =3D 0; i < queue_pairs; i++) {
> >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                     vdpa_device_fd, i, 2, true);
> > +                                     vdpa_device_fd, i, 2, true, opts-=
>svq,
> > +                                     iova_tree);
> >          if (!ncs[i])
> >              goto err;
> >      }
> >
> >      if (has_cvq) {
> >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > -                                 vdpa_device_fd, i, 1, false);
> > +                                 vdpa_device_fd, i, 1, false, opts->sv=
q,
> > +                                 iova_tree);
> >          if (!nc)
> >              goto err;
> >      }
> >
> > +    iova_tree =3D NULL;
> >      return 0;
> >
> >  err:
> >      if (i) {
> >          qemu_del_net_client(ncs[0]);
> >      }
> > +
> > +err_svq:
> >      qemu_close(vdpa_device_fd);
> >
> >      return -1;
> > --
> > 2.27.0
>


