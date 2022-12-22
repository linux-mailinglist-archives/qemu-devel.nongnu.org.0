Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228A653AB7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 03:39:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8BSZ-0007LA-VZ; Wed, 21 Dec 2022 21:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p8BSV-0007Kn-Lp
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 21:37:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p8BST-0001gv-Tf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 21:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671676641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=giMLUkqj/o4K+7IOjmHONXqnBVOerXMgtcTq/C/fzIU=;
 b=COMrDUetGc+62lL+rxtouOdyZiWGO0jtOi6mWl8ztWVErFIDwZlXiPir21sJIjoKUAnw0C
 bXC+6iSIPD7NkaN7hrHTdbEgH7B2ecnqEeK+4+qywt6OPp2p5ezE+AtgDKwTIlGqygTCir
 L+owOMT2I0ngyvVXw0lpx6DQG1/XKZg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-E5FLCGSFOmaSIYdmB8d-0g-1; Wed, 21 Dec 2022 21:37:19 -0500
X-MC-Unique: E5FLCGSFOmaSIYdmB8d-0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so1707940wma.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 18:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=giMLUkqj/o4K+7IOjmHONXqnBVOerXMgtcTq/C/fzIU=;
 b=8PLOUd4v5gcrCUQkrmmOMvGR7RoQjsXyjAtqlPjfEXwe6y85CmSH2KJEw5R/HKgCGg
 rP6neLTWi1zz7YX04cyKoS6vlXm8/GzyLVrLB/QngLj5czdcN6/kJdZ4GahpTLMKdJj4
 juBGIQOBobmBfiXkju/nceMEqQA6sPW5oZ1O3koZwgZywAL4giWNKC3yYSoNbe5CEDiV
 CWEsEJo89xAowCXxb3E/RGTUUMcJVvP19hWUvMyx7rbg/uvPxKovj4tz5BcV2akljmIT
 /G2HAyZTnB9pqt1wqEgm+BaVz2NA/wppUZJ3AmMP78i3MG4xGQM4egp+E8MVVG8N+mnx
 2zQQ==
X-Gm-Message-State: AFqh2koegCp8J8nj9wCSIBqoH4S5EdhgY29WnDtUdxY4M03h/piffMle
 gq2J5wRAdh0ZtAgZgs+2xbA6P93o5M+7u96HjlSN6iXS2XogoFRAmPp2jPZtflkujR2joAiTR2C
 i85MgwvPy/24OI2j8oBquGXlKnx3qHH8=
X-Received: by 2002:a5d:4561:0:b0:242:87f3:1de9 with SMTP id
 a1-20020a5d4561000000b0024287f31de9mr162035wrc.40.1671676638343; 
 Wed, 21 Dec 2022 18:37:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvgmd3/hwruQUUASnEeG4RfgVxr1U1U2L389iPo76lZRp+Gm0d0LWM7n8Kgdgp19CJZgZ2cM9g0T6jkFugcS0E=
X-Received: by 2002:a5d:4561:0:b0:242:87f3:1de9 with SMTP id
 a1-20020a5d4561000000b0024287f31de9mr162032wrc.40.1671676638141; Wed, 21 Dec
 2022 18:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20221211172042.3969410-1-lulu@redhat.com>
 <20221211172042.3969410-9-lulu@redhat.com>
 <20221221062407-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221221062407-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 22 Dec 2022 10:36:38 +0800
Message-ID: <CACLfguV1eUz=Y5-wFRvF9rMGtoQEAjma01wXFUNdC+dvVcvwZA@mail.gmail.com>
Subject: Re: [PATCH v20 08/10] virtio-net: add support for configure interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Wed, 21 Dec 2022 at 19:25, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Dec 12, 2022 at 01:20:40AM +0800, Cindy Lu wrote:
> > Add functions to support configure interrupt in virtio_net
> > Add the functions to support vhost_net_config_pending
> > and vhost_net_config_mask.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
>
>
>
> Causes a bunch of failures including mingw.
> See:
> https://gitlab.com/mstredhat/qemu/-/pipelines/728492799/failures
>
> lots of:
> /builds/mstredhat/qemu/build/../hw/net/virtio-net.c:3366: undefined reference to `vhost_net_config_mask'
>
> Pls fix and repost.
>
Sorry,  Michael, will post a new version soon
>
> > ---
> >  hw/net/vhost_net.c      | 9 +++++++++
> >  hw/net/virtio-net.c     | 4 ++--
> >  include/net/vhost_net.h | 2 ++
> >  3 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 043058ff43..6a55f5a473 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -478,6 +478,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
> >      vhost_virtqueue_mask(&net->dev, dev, idx, mask);
> >  }
> >
> > +bool vhost_net_config_pending(VHostNetState *net)
> > +{
> > +    return vhost_config_pending(&net->dev);
> > +}
> > +
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
> > +{
> > +    vhost_config_mask(&net->dev, dev, mask);
> > +}
> >  VHostNetState *get_vhost_net(NetClientState *nc)
> >  {
> >      VHostNetState *vhost_net = 0;
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index bee35d6f9f..ec974f7a76 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -3323,7 +3323,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
> >       */
> >
> >      if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> > -        return false;
> > +        return vhost_net_config_pending(get_vhost_net(nc->peer));
> >      }
> >      return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
> >  }
> > @@ -3355,9 +3355,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
> >       */
> >
> >      if (idx == VIRTIO_CONFIG_IRQ_IDX) {
> > +        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
> >          return;
> >      }
> > -
> >      vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
> >  }
> >
> > diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> > index 40b9a40074..dbbd0dc04e 100644
> > --- a/include/net/vhost_net.h
> > +++ b/include/net/vhost_net.h
> > @@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
> >  bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
> >  void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
> >                                int idx, bool mask);
> > +bool vhost_net_config_pending(VHostNetState *net);
> > +void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
> >  int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
> >  VHostNetState *get_vhost_net(NetClientState *nc);
> >
> > --
> > 2.34.3
>


