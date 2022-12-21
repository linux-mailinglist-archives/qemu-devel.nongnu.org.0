Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B750653061
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:48:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xZZ-0008SA-CV; Wed, 21 Dec 2022 06:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xZS-0008Q5-NK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7xZ5-0006cj-CF
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671623234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtRxOgX0TZOayu+PRuST1sFSCcBr/Ov+tY3NROTlMbQ=;
 b=Rl7ZfT+SfCBmhEojUhyrviRY+cvaCJOBRS4PL1DZ0a7EJR2GTzkVIyjd9ibI+0qErh+rfJ
 ClbRR+d6ldhE5H6aRMcN3KVu6VfAw7ysGmoWX9L4oS+aSJDek6zbNZq2ZyjIV1cU+WyJ3m
 x3TgW2oLQdwFh2sg0ELPITB8u+goWBo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-PmguTFSgOwm-pn_Mgrcejg-1; Wed, 21 Dec 2022 06:47:12 -0500
X-MC-Unique: PmguTFSgOwm-pn_Mgrcejg-1
Received: by mail-qt1-f200.google.com with SMTP id
 a13-20020ac8610d000000b003a8151cadebso6851512qtm.10
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 03:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dtRxOgX0TZOayu+PRuST1sFSCcBr/Ov+tY3NROTlMbQ=;
 b=LmvTjq4zWBbod4WAujpddg5Imw9mCmpY+xJKY+GIMJeWqhF5FaKeMobQV2jvFbVcrX
 IIBGuQz+O2ZErZjoi382TnNNaAWMI6HQ8soNmE7Owe9wscV6nXGw9iQeq5eWTcDutKC7
 w37zQ6cy5JZsHV+kWC0UEclGl2bPaxUetKxAoqk2PTJrZmopK6GrJSuIhdh5afIuwymR
 KIsLmVfZ0W2nXI095rcveIOm9tzJF2DKk6BAEL+SDM6wQI3df0axR2pEOBXglX+ILlMe
 BocbBgC38W0JuVIJl/yFwS4HEqoQ8CuZ1rxTouOMto7fJH+UUE21743ZB9LokTxmP/s7
 A8RA==
X-Gm-Message-State: AFqh2kpk/tlEqn4U+wFX6QZILf4f6OvThIlNle4t5gcafbWUjXaMEQKU
 OXSaWXmCgeyy3n4/oUmKEFTuKgenejcafAL8f0OvUrg24I4zdtAd6r2RrNjUg69669XHAwncmSs
 nFrcJ2sbE9hhbLbk=
X-Received: by 2002:a05:6214:5443:b0:4c7:80fa:755c with SMTP id
 kz3-20020a056214544300b004c780fa755cmr1379825qvb.45.1671623232263; 
 Wed, 21 Dec 2022 03:47:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtCgdSPiFJ0Kc3hCB+/E4fHjzkyrWfeDKkFFyw04R0HX5of4NBMeHt0cwR58dN52CLO78Pcjw==
X-Received: by 2002:a05:6214:5443:b0:4c7:80fa:755c with SMTP id
 kz3-20020a056214544300b004c780fa755cmr1379794qvb.45.1671623231982; 
 Wed, 21 Dec 2022 03:47:11 -0800 (PST)
Received: from redhat.com ([37.19.199.117]) by smtp.gmail.com with ESMTPSA id
 m9-20020a05620a290900b006fa8299b4d5sm11066079qkp.100.2022.12.21.03.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 03:47:11 -0800 (PST)
Date: Wed, 21 Dec 2022 06:47:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v9 06/12] vdpa: request iova_range only once
Message-ID: <20221221064619-mutt-send-email-mst@kernel.org>
References: <20221215113144.322011-1-eperezma@redhat.com>
 <20221215113144.322011-7-eperezma@redhat.com>
 <CACGkMEtE_6nci5zwQZbOMbu3e9gh4aa_88WjTgkWkjKqQBB3Zw@mail.gmail.com>
 <CAJaqyWcxeuOiHYBb_ftedSrJpNpN9vQJ2sZZ_5cZh4RsQSdgVQ@mail.gmail.com>
 <CACGkMEtkWJQVrnuG7CKJ+zFcMFhhZs3=iFPjv85U7KAjkpd=EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEtkWJQVrnuG7CKJ+zFcMFhhZs3=iFPjv85U7KAjkpd=EA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 21, 2022 at 04:21:52PM +0800, Jason Wang wrote:
> On Fri, Dec 16, 2022 at 5:53 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Dec 16, 2022 at 8:29 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Thu, Dec 15, 2022 at 7:32 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> > > >
> > > > Currently iova range is requested once per queue pair in the case of
> > > > net. Reduce the number of ioctls asking it once at initialization and
> > > > reusing that value for each vhost_vdpa.
> > > >
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > ---
> > > >  hw/virtio/vhost-vdpa.c | 15 ---------------
> > > >  net/vhost-vdpa.c       | 27 ++++++++++++++-------------
> > > >  2 files changed, 14 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > index 691bcc811a..9b7f4ef083 100644
> > > > --- a/hw/virtio/vhost-vdpa.c
> > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > @@ -365,19 +365,6 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
> > > >      return 0;
> > > >  }
> > > >
> > > > -static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > > -{
> > > > -    int ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE,
> > > > -                              &v->iova_range);
> > > > -    if (ret != 0) {
> > > > -        v->iova_range.first = 0;
> > > > -        v->iova_range.last = UINT64_MAX;
> > > > -    }
> > > > -
> > > > -    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > > -                                    v->iova_range.last);
> > > > -}
> > > > -
> > > >  /*
> > > >   * The use of this function is for requests that only need to be
> > > >   * applied once. Typically such request occurs at the beginning
> > > > @@ -465,8 +452,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> > > >          goto err;
> > > >      }
> > > >
> > > > -    vhost_vdpa_get_iova_range(v);
> > > > -
> > > >      if (!vhost_vdpa_first_dev(dev)) {
> > > >          return 0;
> > > >      }
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 2c0ff6d7b0..b6462f0192 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -541,14 +541,15 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
> > > >  };
> > > >
> > > >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > > -                                           const char *device,
> > > > -                                           const char *name,
> > > > -                                           int vdpa_device_fd,
> > > > -                                           int queue_pair_index,
> > > > -                                           int nvqs,
> > > > -                                           bool is_datapath,
> > > > -                                           bool svq,
> > > > -                                           VhostIOVATree *iova_tree)
> > > > +                                       const char *device,
> > > > +                                       const char *name,
> > > > +                                       int vdpa_device_fd,
> > > > +                                       int queue_pair_index,
> > > > +                                       int nvqs,
> > > > +                                       bool is_datapath,
> > > > +                                       bool svq,
> > > > +                                       struct vhost_vdpa_iova_range iova_range,
> > > > +                                       VhostIOVATree *iova_tree)
> > >
> > > Nit: it's better not mix style changes.
> > >
> >
> > The style changes are because the new parameter is longer than 80
> > characters, do you prefer me to send a previous patch reducing
> > indentation?
> >
> 
> Michale, what's your preference? I'm fine with both.
> 
> Thanks

I think it doesn't matter much, but generally 80 char limit is
not a hard limit. We can just let it be.

> > Thanks!
> >
> > > Other than this:
> > >
> > > Acked-by: Jason Wang <jasonwang@redhat.com>
> > >
> > > Thanks
> > >
> > > >  {
> > > >      NetClientState *nc = NULL;
> > > >      VhostVDPAState *s;
> > > > @@ -567,6 +568,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > >      s->vhost_vdpa.device_fd = vdpa_device_fd;
> > > >      s->vhost_vdpa.index = queue_pair_index;
> > > >      s->vhost_vdpa.shadow_vqs_enabled = svq;
> > > > +    s->vhost_vdpa.iova_range = iova_range;
> > > >      s->vhost_vdpa.iova_tree = iova_tree;
> > > >      if (!is_datapath) {
> > > >          s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
> > > > @@ -646,6 +648,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >      int vdpa_device_fd;
> > > >      g_autofree NetClientState **ncs = NULL;
> > > >      g_autoptr(VhostIOVATree) iova_tree = NULL;
> > > > +    struct vhost_vdpa_iova_range iova_range;
> > > >      NetClientState *nc;
> > > >      int queue_pairs, r, i = 0, has_cvq = 0;
> > > >
> > > > @@ -689,14 +692,12 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >          return queue_pairs;
> > > >      }
> > > >
> > > > +    vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > >      if (opts->x_svq) {
> > > > -        struct vhost_vdpa_iova_range iova_range;
> > > > -
> > > >          if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > > >              goto err_svq;
> > > >          }
> > > >
> > > > -        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > >          iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
> > > >      }
> > > >
> > > > @@ -705,7 +706,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >      for (i = 0; i < queue_pairs; i++) {
> > > >          ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > >                                       vdpa_device_fd, i, 2, true, opts->x_svq,
> > > > -                                     iova_tree);
> > > > +                                     iova_range, iova_tree);
> > > >          if (!ncs[i])
> > > >              goto err;
> > > >      }
> > > > @@ -713,7 +714,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > >      if (has_cvq) {
> > > >          nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > >                                   vdpa_device_fd, i, 1, false,
> > > > -                                 opts->x_svq, iova_tree);
> > > > +                                 opts->x_svq, iova_range, iova_tree);
> > > >          if (!nc)
> > > >              goto err;
> > > >      }
> > > > --
> > > > 2.31.1
> > > >
> > >
> >


