Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C08B3275E1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 02:38:50 +0100 (CET)
Received: from localhost ([::1]:41414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGXWL-0001eX-2P
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 20:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lGXV7-0001AO-Pt
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 20:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lGXV4-0006k6-Uk
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 20:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614562649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0isOphqh27zgWyafV7gybslpLWpyKDr5kHHym/RvLuw=;
 b=gqeX5IhN9Zs6LzUtqcxsJ6VJJb96e0vP5F64k5AFcUQXTM5w3M7xTSBU1FxnB6JyX6yFUX
 GM3UV+UUHUpVZ0Ef5q4NxXkzIjiJf1bcErYsyssXfFH95frL/qFi7qKgyTSChHvU3Zir5x
 KvZ+MVkBb1L8rzTv08zZsDF/zBuPgFU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-enNjmYOwOvSygEiz9KsNaQ-1; Sun, 28 Feb 2021 20:37:26 -0500
X-MC-Unique: enNjmYOwOvSygEiz9KsNaQ-1
Received: by mail-pf1-f200.google.com with SMTP id b12so10117899pfb.15
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 17:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0isOphqh27zgWyafV7gybslpLWpyKDr5kHHym/RvLuw=;
 b=Jp2iUvuZ0e5euxHF+jFLLL2dYSIj0z55b2+fKjwrQjaWzm8CPlCPYpw2/KCv15itsD
 oJD9mzqtGZtwsVFtcnzOKX9lQ9uOBXxpg8fUeIQQpc0jNwI2cURsVQ1KE0z9BKDUttRv
 QHe5FkPyzhQmPmrmfj3nfkjtO1NpjbggfJmevrxEsLcnVUzUsgySRCC1DpPdjD0Kz1q4
 I7LbVq5rzFHd1xKuYiHhR8h6OHKy/ANMRuJTAtyh9OMfrYtkBsss1V9+7JRzP7PQJTe3
 DE7KMw4MRIzg039l1SwnD+ukwmmgFdLenAGuMQBiU7zQmuaKAtR38mIvIJRsW/LMENzx
 Ho4w==
X-Gm-Message-State: AOAM533H1x1tgnZ7fPEuV/PZ8Y3yK4IcEmc9u4mVuHVdn9K7YFPVw97W
 VTHeK6bvKehn3tes+lHLkn3OsPE/Q5ZKDZstpb9Ft+7YpoJ7GCKi44ihte+VrtDT47GQGQqU8Df
 OMa2rnmkXKteSwNOTixqHVeIOgMSHzHE=
X-Received: by 2002:a17:903:2301:b029:e4:700b:6d91 with SMTP id
 d1-20020a1709032301b02900e4700b6d91mr13050842plh.19.1614562645276; 
 Sun, 28 Feb 2021 17:37:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5+1sOEoUg9DFrVWFiEOdjX1/ncHIQdwPPs8T9tRSiwaEkJrBA2uOqO/o0CjphFW5cCBOCkCary8RA8jBuLLA=
X-Received: by 2002:a17:903:2301:b029:e4:700b:6d91 with SMTP id
 d1-20020a1709032301b02900e4700b6d91mr13050823plh.19.1614562645033; Sun, 28
 Feb 2021 17:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20210225165506.18321-1-lulu@redhat.com>
 <20210225165506.18321-2-lulu@redhat.com>
 <20210225141203-mutt-send-email-mst@kernel.org>
 <20210228153905-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210228153905-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 1 Mar 2021 09:36:48 +0800
Message-ID: <CACLfguUUqYAEo_vLRpW3uZr6FUY=STwNUuQjUvqDdHqSAiNmuA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] virtio-net: Add check for mac address while peer
 is vdpa
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Adrian Moreno Zapata <amorenoz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Mooney <smooney@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 1, 2021 at 4:40 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Feb 25, 2021 at 02:14:39PM -0500, Michael S. Tsirkin wrote:
> > On Fri, Feb 26, 2021 at 12:55:06AM +0800, Cindy Lu wrote:
> > > While peer is vdpa, sometime qemu get an all zero mac address from the hardware,
> > > This is not a legal value. Add the check for this.if we get an zero mac address.
> > > qemu will use the default mac address or the mac address from qemu cmdline
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> >
> > I guess I will have to rewrite the comments and commit log :(
> >
> > It is all saying what does the patch do. We want it to rather
> > give motivation.
> >
> > Sean could you please comment on whether this patch fixes your
> > config?
>
> ping. if I'm to try and merge this work around it's critical
> that someone with access to hardware confirm it actually works.
>
Hi Michael, I have tested this patch in qemu+vdpa+mlx environment.
it's working fine.
>
> > > ---
> > >  hw/net/virtio-net.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > > index 9179013ac4..8f36ca5066 100644
> > > --- a/hw/net/virtio-net.c
> > > +++ b/hw/net/virtio-net.c
> > > @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> > >      VirtIONet *n = VIRTIO_NET(vdev);
> > >      struct virtio_net_config netcfg;
> > >      NetClientState *nc = qemu_get_queue(n->nic);
> > > +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> > >
> > >      int ret = 0;
> > >      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> > > @@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> > >          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> > >                                     n->config_size);
> > >          if (ret != -1) {
> > > +            /*
> > > +             * Here is a work around, the 0 mac address is not a legal value.
> > > +             * if we got this from hardware, qemu will use the mac address
> > > +             * saved in VirtIONet->mac.
> > > +             */
> > > +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
> > > +                info_report("Get an all zero mac address from hardware");
> > > +                memcpy(netcfg.mac, n->mac, ETH_ALEN);
> > > +            }
> > >              memcpy(config, &netcfg, n->config_size);
> > >          }
> > >      }
> > > --
> > > 2.21.3
>


