Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C60628DB5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouikV-00050z-HD; Mon, 14 Nov 2022 18:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ouif4-00039s-Bz
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oubhL-0005On-G7
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668440914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rRDAFMJJ2qbbt7Hgk5UIr5CQij1ViJUfogyqeC+sdY=;
 b=IwUcExuJCCyS0cLG1Kmzn3j1XyV61cA5/POWcEffwL0AmMULNEmPuzUYyfeTXisp707WZ7
 lCelNUfhEjajIQTr2W9QNzqiItZtxF7nR0yJoXtsUDhUFzpqwoGp8W/1sTKh6XYc5Vo9QO
 t6ckBP+iwREaZh8K9fxrTx4DgfoStOw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-EflcOPqCNh6aIYBTQAaxjg-1; Mon, 14 Nov 2022 10:48:32 -0500
X-MC-Unique: EflcOPqCNh6aIYBTQAaxjg-1
Received: by mail-qt1-f200.google.com with SMTP id
 ff5-20020a05622a4d8500b003a526107477so8209554qtb.9
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6rRDAFMJJ2qbbt7Hgk5UIr5CQij1ViJUfogyqeC+sdY=;
 b=ofxDI4wWpfRxzs9PpbNMSBc+zcOMB26hp7yksY7xNRntOmVtQ6e1HsS3S8Mb4wyF88
 kcTTLBZHAHDOLfKCkd7tCgIVmbqtFr3qAoMRf79VRQd0cy1DJ8zeCTT9o8Z/+MtEOxyk
 aOLjAGrsnRf6L2XehmvfGzaBLAllgAx77OP6uE44LjGMTiQl6P0g+dfvIVYIokuTx8Hz
 H1T2j6C2SCFr9fmNjj3aA7Ro4r32z1lEv/lDYMupHbApmzA7FxGOrFec02guuXQ4QHrK
 nVql4JzF8VeJAj1thfLYnsZSAoj8HrOGHbro54U8DfjCKj7xOWLi51ZhS7+cgddXUrCS
 0xxA==
X-Gm-Message-State: ANoB5pnwPBtk0SktjhFLguAS+rVMBi7l9zFvT0Fk2nJ6HkWTNV8zYgfr
 oGUQ1ugclJmyuscbeDZlnxM3tn0ry8s5oLV5E0uos85ca35zxM1FuJVYVvrZulTffR9219vKz+p
 j/QP+8dLca2t+2cg=
X-Received: by 2002:a05:622a:98e:b0:3a5:122:fbe4 with SMTP id
 bw14-20020a05622a098e00b003a50122fbe4mr12881462qtb.493.1668440911801; 
 Mon, 14 Nov 2022 07:48:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5te+JHJLwH9KaIF/LyiS9a9m+kwlwG/8+j+4Ct78dwg8FyapmF0goSyGhi25GWxasgm5EN7A==
X-Received: by 2002:a05:622a:98e:b0:3a5:122:fbe4 with SMTP id
 bw14-20020a05622a098e00b003a50122fbe4mr12881443qtb.493.1668440911487; 
 Mon, 14 Nov 2022 07:48:31 -0800 (PST)
Received: from redhat.com ([37.19.196.93]) by smtp.gmail.com with ESMTPSA id
 t8-20020a37ea08000000b006fa313bf185sm6739867qkj.8.2022.11.14.07.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:48:30 -0800 (PST)
Date: Mon, 14 Nov 2022 10:48:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hyman <huangy81@chinatelecom.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Guoyi Tu <tugy@chinatelecom.cn>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v3 2/2] vhost-net: Fix the virtio features negotiation flaw
Message-ID: <20221114104008-mutt-send-email-mst@kernel.org>
References: <cover.1667136717.git.huangy81@chinatelecom.cn>
 <2560bb4e8cabc550da07162c520aff3669a8f56f.1667136717.git.huangy81@chinatelecom.cn>
 <20221110141415-mutt-send-email-mst@kernel.org>
 <fc4c24eb-239b-8e6e-a534-64effe845ca5@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc4c24eb-239b-8e6e-a534-64effe845ca5@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 14, 2022 at 11:35:30PM +0800, Hyman wrote:
> 
> 
> 在 2022/11/11 3:17, Michael S. Tsirkin 写道:
> > On Sun, Oct 30, 2022 at 09:52:39PM +0800, huangy81@chinatelecom.cn wrote:
> > > From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > > 
> > > Save the acked_features once it be configured by guest
> > > virtio driver so it can't miss any features.
> > > 
> > > Note that this patch also change the features saving logic
> > > in chr_closed_bh, which originally backup features no matter
> > > whether the features are 0 or not, but now do it only if
> > > features aren't 0.
> > > 
> > > As to reset acked_features to 0 if needed, Qemu always
> > > keeping the backup acked_features up-to-date, and save the
> > > acked_features after virtio_net_set_features in advance,
> > > including reset acked_features to 0, so the behavior is
> > > also covered.
> > > 
> > > Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> > > Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> > > ---
> > >   hw/net/vhost_net.c      | 9 +++++++++
> > >   hw/net/virtio-net.c     | 5 +++++
> > >   include/net/vhost_net.h | 2 ++
> > >   net/vhost-user.c        | 6 +-----
> > >   4 files changed, 17 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > index d28f8b9..2bffc27 100644
> > > --- a/hw/net/vhost_net.c
> > > +++ b/hw/net/vhost_net.c
> > > @@ -141,6 +141,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
> > >       return net->dev.acked_features;
> > >   }
> > > +void vhost_net_save_acked_features(NetClientState *nc)
> > > +{
> > > +    if (nc->info->type != NET_CLIENT_DRIVER_VHOST_USER) {
> > > +        return;
> > > +    }
> > > +
> > > +    vhost_user_save_acked_features(nc, false);
> > > +}
> > > +
> > >   static int vhost_net_get_fd(NetClientState *backend)
> > >   {
> > >       switch (backend->info->type) {
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index e9f696b..5f8f788 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -924,6 +924,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
> > >               continue;
> > >           }
> > >           vhost_net_ack_features(get_vhost_net(nc->peer), features);
> > > +        /*
> > > +         * keep acked_features in NetVhostUserState up-to-date so it
> > > +         * can't miss any features configured by guest virtio driver.
> > > +         */
> > > +        vhost_net_save_acked_features(nc->peer);
> > >       }
> > >       if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
> > 
> > So when do you want to ack features but *not* save them?
> When openvswitch restart and reconnect and Qemu start the vhost_dev，
> acked_features in vhost_dev Qemu need to be initialized and the initialized
> value be fetched from acked_features int NetVhostUserState.
> At this time, acked_features  may not be up-to-date but we want it.
> > 
> > Is the effect of this patch, fundamentally, that guest features
> > from virtio are always copied to vhost-user?
> > Do we even need an extra copy in vhost user then?
> > 
> I'm trying to explain this from my view, please point out the mistake if i
> failed. :)
> 
> When socket used by vhost-user device disconnectted from openvswitch,
> Qemu will stop the vhost-user and clean up the whole struct of
> vhost_dev(include vm's memory region and acked_features), once socket is
> reconnected from openvswitch, Qemu will collect vm's memory region
> dynamically but as to acked_features, IMHO, Qemu can not fetch it from guest
> features of virtio-net, because acked_features are kind of different from
> guest features(bit 30 is different at least)，so Qemu need an extra copy.

Well we already have a list of valid frontend features in
user_feature_bits.



> > 
> > all this came in with:
> > 
> > commit a463215b087c41d7ca94e51aa347cde523831873
> > Author: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Date:   Mon Jun 6 18:45:05 2016 +0200
> > 
> >      vhost-net: save & restore vhost-user acked features
> > 
> > Marc-André do you remember why we have a copy of features in vhost-user
> > and not just reuse the features from virtio?
> > 
> > 
> > > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > > index 387e913..3a5579b 100644
> > > --- a/include/net/vhost_net.h
> > > +++ b/include/net/vhost_net.h
> > > @@ -46,6 +46,8 @@ int vhost_set_vring_enable(NetClientState * nc, int enable);
> > >   uint64_t vhost_net_get_acked_features(VHostNetState *net);
> > > +void vhost_net_save_acked_features(NetClientState *nc);
> > > +
> > >   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
> > >   #endif
> > > diff --git a/net/vhost-user.c b/net/vhost-user.c
> > > index 74f349c..c512cc9 100644
> > > --- a/net/vhost-user.c
> > > +++ b/net/vhost-user.c
> > > @@ -258,11 +258,7 @@ static void chr_closed_bh(void *opaque)
> > >       s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
> > >       for (i = queues -1; i >= 0; i--) {
> > > -        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
> > > -
> > > -        if (s->vhost_net) {
> > > -            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
> > > -        }
> > > +        vhost_user_save_acked_features(ncs[i], false);
> > >       }
> > >       qmp_set_link(name, false, &err);
> > > -- 
> > > 1.8.3.1
> > 


