Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0174D17E0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:37:28 +0100 (CET)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRZ5j-0001oL-Rf
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRZ03-0005RS-Hr
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRZ00-0007w1-C9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646742690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/P3PdEGMtAdlx43Los4YDklBaFHjW3R+UsopxMvSM0=;
 b=gOQ4U05trCPjxlV/rJRKt8ECNjv+DZEJ7FUPfxzaK07+EY161MR+LPAwz2pkhvv/FPYDKJ
 OckzU+HwBzcRy1RXFe9rYvjNNbPVQss+0W8B8d9Enl9Oa46wnKwxDy3gE0PY7H6COvhlXp
 shnGsPqvzqCpZbQKqDkGoAsdWG8M0Io=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-nVMPdGf0Pamn-X-wZG6udw-1; Tue, 08 Mar 2022 07:31:29 -0500
X-MC-Unique: nVMPdGf0Pamn-X-wZG6udw-1
Received: by mail-ed1-f69.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso10480007edt.20
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 04:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n/P3PdEGMtAdlx43Los4YDklBaFHjW3R+UsopxMvSM0=;
 b=1VM+hV97lvJM1lfI3mlSFpX4E8YnzcKlB9hx7IcyQ3Qwon9d2Kzgg6x2rd/ErXG2is
 1/sV6p57rhZgTZX5CibjfqUZQSU7q7Ioh2S+zRX99YavigwW7VXLFxmeCNu1ocpXZ7wx
 18MWtTJr2w+nf9Q1b24ETbgJYsWvRZIcq03TZlu4qZ0xSdF/3lt1XWuLUvK7nT/eKXFy
 cRyJyHbWGtIcDjp4zSE/+I09zNxBFmqy+iHWYMFnxSbz3D1JtXVvJSHqsk02SHoXe2Zc
 WjyemdJJDXQfXhDC6uvmXqINTm713bIAgqm2paJ3EGeDXW5BgguTpkmuBz0hUj7/b+Fy
 UpIw==
X-Gm-Message-State: AOAM5332E2bk/MY93VPxBskGARasMG0e7k3tlQRoYf4gM6rZhTqaV0qC
 MwHGQkOMlctE3t5m2xzY9w42bKhNNtjqd5mgi+xNrZECv6cYgQEt9+zoIKvQMt0ylJLbJo0r6SP
 4zugsNQtaicP//mk=
X-Received: by 2002:a17:906:8a86:b0:6ae:9c35:35c7 with SMTP id
 mu6-20020a1709068a8600b006ae9c3535c7mr13432908ejc.494.1646742688237; 
 Tue, 08 Mar 2022 04:31:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7MBlQpyflDvuMTfi6TSriqIE584JJbz7r1h/80sKMcJMhvbBOe6nZE7WIOxbOgpvWJiKHJA==
X-Received: by 2002:a17:906:8a86:b0:6ae:9c35:35c7 with SMTP id
 mu6-20020a1709068a8600b006ae9c3535c7mr13432874ejc.494.1646742687944; 
 Tue, 08 Mar 2022 04:31:27 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 re27-20020a170906d8db00b006d76251f4e7sm5808407ejb.109.2022.03.08.04.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 04:31:27 -0800 (PST)
Date: Tue, 8 Mar 2022 07:31:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH v5 15/15] vdpa: Add x-svq to NetdevVhostVDPAOptions
Message-ID: <20220308072914-mutt-send-email-mst@kernel.org>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <20220307153334.3854134-16-eperezma@redhat.com>
 <20220308021116-mutt-send-email-mst@kernel.org>
 <CAJaqyWewPYVPDOYTgKs03-LyfMHWkE+OR6tBEQ25rZ3YZmTrsw@mail.gmail.com>
 <20220308030140-mutt-send-email-mst@kernel.org>
 <CAJaqyWeAxjOtvtAD2Ow2MUXQpaBUbP21=CZ4g-S0pPizq_Az-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWeAxjOtvtAD2Ow2MUXQpaBUbP21=CZ4g-S0pPizq_Az-g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Mar 08, 2022 at 09:24:05AM +0100, Eugenio Perez Martin wrote:
> On Tue, Mar 8, 2022 at 9:02 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Mar 08, 2022 at 08:32:07AM +0100, Eugenio Perez Martin wrote:
> > > On Tue, Mar 8, 2022 at 8:11 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Mar 07, 2022 at 04:33:34PM +0100, Eugenio Pérez wrote:
> > > > > Finally offering the possibility to enable SVQ from the command line.
> > > > >
> > > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > > ---
> > > > >  qapi/net.json    |  8 +++++++-
> > > > >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
> > > > >  2 files changed, 47 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/qapi/net.json b/qapi/net.json
> > > > > index 7fab2e7cd8..d626fa441c 100644
> > > > > --- a/qapi/net.json
> > > > > +++ b/qapi/net.json
> > > > > @@ -445,12 +445,18 @@
> > > > >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> > > > >  #          (default: 1)
> > > > >  #
> > > > > +# @svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
> > > > > +#
> > > > > +# Features:
> > > > > +# @unstable: Member @svq is experimental.
> > > > > +#
> > > > >  # Since: 5.1
> > > > >  ##
> > > > >  { 'struct': 'NetdevVhostVDPAOptions',
> > > > >    'data': {
> > > > >      '*vhostdev':     'str',
> > > > > -    '*queues':       'int' } }
> > > > > +    '*queues':       'int',
> > > > > +    '*svq':          {'type': 'bool', 'features' : [ 'unstable'] } } }
> > > > >
> > > > >  ##
> > > > >  # @NetClientDriver:
> > > >
> > > > I think this should be x-svq same as other unstable features.
> > > >
> > >
> > > I'm fine with both, but I was pointed to the other direction at [1] and [2].
> > >
> > > Thanks!
> > >
> > > [1] https://patchwork.kernel.org/project/qemu-devel/patch/20220302203012.3476835-15-eperezma@redhat.com/
> > > [2] https://lore.kernel.org/qemu-devel/20220303185147.3605350-15-eperezma@redhat.com/
> >
> >
> > I think what Markus didn't know is that a bunch of changes in
> > behaviour will occur before we rename it to "svq".
> > The rename is thus less of a bother more of a bonus.
> >
> 
> I'm totally fine with going back to x-svq. I'm not sure if it's more
> appropriate to do different modes of different parameters (svq=off,
> dynamic-svq=on) or different modes of the same parameter (svq=on vs
> svq=on_migration). Or something totally different.
> 
> My impression is that all of the changes are covered with @unstable
> but I can see the advantage of x- prefix since we have not come to an
> agreement on it. I think it's the first time it is mentioned in the
> mail list.
> 
> Do you want me to send a new series with x- prefix?
> 
> Thanks!

Sure, I think it's a prudent thing to do simply because as you say the
semantics of the flag are likely to change yet.


> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 1e9fe47c03..c827921654 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -127,7 +127,11 @@ err_init:
> > > > >  static void vhost_vdpa_cleanup(NetClientState *nc)
> > > > >  {
> > > > >      VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > +    struct vhost_dev *dev = s->vhost_vdpa.dev;
> > > > >
> > > > > +    if (dev && dev->vq_index + dev->nvqs == dev->vq_index_end) {
> > > > > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> > > > > +    }
> > > > >      if (s->vhost_net) {
> > > > >          vhost_net_cleanup(s->vhost_net);
> > > > >          g_free(s->vhost_net);
> > > > > @@ -187,13 +191,23 @@ static NetClientInfo net_vhost_vdpa_info = {
> > > > >          .check_peer_type = vhost_vdpa_check_peer_type,
> > > > >  };
> > > > >
> > > > > +static int vhost_vdpa_get_iova_range(int fd,
> > > > > +                                     struct vhost_vdpa_iova_range *iova_range)
> > > > > +{
> > > > > +    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> > > > > +
> > > > > +    return ret < 0 ? -errno : 0;
> > > > > +}
> > > > > +
> > > > >  static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > > > -                                           const char *device,
> > > > > -                                           const char *name,
> > > > > -                                           int vdpa_device_fd,
> > > > > -                                           int queue_pair_index,
> > > > > -                                           int nvqs,
> > > > > -                                           bool is_datapath)
> > > > > +                                       const char *device,
> > > > > +                                       const char *name,
> > > > > +                                       int vdpa_device_fd,
> > > > > +                                       int queue_pair_index,
> > > > > +                                       int nvqs,
> > > > > +                                       bool is_datapath,
> > > > > +                                       bool svq,
> > > > > +                                       VhostIOVATree *iova_tree)
> > > > >  {
> > > > >      NetClientState *nc = NULL;
> > > > >      VhostVDPAState *s;
> > > > > @@ -211,6 +225,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
> > > > >
> > > > >      s->vhost_vdpa.device_fd = vdpa_device_fd;
> > > > >      s->vhost_vdpa.index = queue_pair_index;
> > > > > +    s->vhost_vdpa.shadow_vqs_enabled = svq;
> > > > > +    s->vhost_vdpa.iova_tree = iova_tree;
> > > > >      ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
> > > > >      if (ret) {
> > > > >          qemu_del_net_client(nc);
> > > > > @@ -266,6 +282,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > > >      g_autofree NetClientState **ncs = NULL;
> > > > >      NetClientState *nc;
> > > > >      int queue_pairs, i, has_cvq = 0;
> > > > > +    g_autoptr(VhostIOVATree) iova_tree = NULL;
> > > > >
> > > > >      assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> > > > >      opts = &netdev->u.vhost_vdpa;
> > > > > @@ -285,29 +302,44 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> > > > >          qemu_close(vdpa_device_fd);
> > > > >          return queue_pairs;
> > > > >      }
> > > > > +    if (opts->svq) {
> > > > > +        struct vhost_vdpa_iova_range iova_range;
> > > > > +
> > > > > +        if (has_cvq) {
> > > > > +            error_setg(errp, "vdpa svq does not work with cvq");
> > > > > +            goto err_svq;
> > > > > +        }
> > > > > +        vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> > > > > +        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
> > > > > +    }
> > > > >
> > > > >      ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
> > > > >
> > > > >      for (i = 0; i < queue_pairs; i++) {
> > > > >          ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > > > -                                     vdpa_device_fd, i, 2, true);
> > > > > +                                     vdpa_device_fd, i, 2, true, opts->svq,
> > > > > +                                     iova_tree);
> > > > >          if (!ncs[i])
> > > > >              goto err;
> > > > >      }
> > > > >
> > > > >      if (has_cvq) {
> > > > >          nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> > > > > -                                 vdpa_device_fd, i, 1, false);
> > > > > +                                 vdpa_device_fd, i, 1, false, opts->svq,
> > > > > +                                 iova_tree);
> > > > >          if (!nc)
> > > > >              goto err;
> > > > >      }
> > > > >
> > > > > +    iova_tree = NULL;
> > > > >      return 0;
> > > > >
> > > > >  err:
> > > > >      if (i) {
> > > > >          qemu_del_net_client(ncs[0]);
> > > > >      }
> > > > > +
> > > > > +err_svq:
> > > > >      qemu_close(vdpa_device_fd);
> > > > >
> > > > >      return -1;
> > > > > --
> > > > > 2.27.0
> > > >
> >


