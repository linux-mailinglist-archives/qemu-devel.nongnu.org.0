Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141332748A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:11:56 +0100 (CET)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTM2-0002VB-S1
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:11:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGT00-0006xr-Ea
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 15:49:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lGSrF-0006sa-E0
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 15:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614544797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yp/ijWIoVCmWK0cQ//oi1b7Itl/aFjM0RJhldWUFC+g=;
 b=XTDep62XXBM5OLmO13RY0gLH2nYi/oy3usRWHi6yAxocIKx8CSDcBOdag8y5noJ0GR9XM5
 1nMN/vWbKpRijEfaE0c8VvTmrDZrV5WyrovQJy0NRaBNpypwzMwAibog+MDwTtpzIz/kK7
 9IRETJK3M1sXGXOjDnnBp3NmN7BR9Bg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-B6Xc6IY2PDGUnNXEA-moQA-1; Sun, 28 Feb 2021 15:39:55 -0500
X-MC-Unique: B6Xc6IY2PDGUnNXEA-moQA-1
Received: by mail-ed1-f71.google.com with SMTP id q2so7763231edt.16
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 12:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yp/ijWIoVCmWK0cQ//oi1b7Itl/aFjM0RJhldWUFC+g=;
 b=py4jTu6kEZHxaPOVy6+1NNWaG8+KTXDuMDe/igpzi+u49WMML+usPYwFKgUZ9TF3SC
 s8kxOBpfthJOMkCc9zbUjjbJin2g2pPeVP/kjWCeF7mOYMIzngZ00L40GUxwSrAzzolq
 Zr8YljN9Tau79gwpso/L5cw2q2JOdPvbI26Df7nkLZneCm5oVoBqEQSHrOHsZTWxxMg7
 M6DiDBmcJtn2lz9rbxvtYNLD8z8OC9qZs6qBcx6zPjG9DqQIqhS8Rj0gH1MrSqfbOOVd
 cRojEUBjY3n5dhLdBAmSuNzDfzSnRjddXFw27rtUuBn8tr6ICnG5JwpvvgvSpEsYzMLk
 NHTA==
X-Gm-Message-State: AOAM531b9OtBYi/QUIho/cHtJwJ2Dm3qUcNkUbFrtiwdAZ5HnRMt4HxN
 6pd38snXLKBsSmPd9fN+14faJKblWdCBC22JM/s/gcGi8L/Ow+E74aXOGgwpNa0lQYNHCGKcjXW
 5h3G+w7la4CVbus0=
X-Received: by 2002:aa7:c0c7:: with SMTP id j7mr812677edp.298.1614544794365;
 Sun, 28 Feb 2021 12:39:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdpPjabZqxCPcSmuGJe97X/UXytu5ODNhiaJzYpTCUZD4cZkeoCEIRegCQVuFjEMOY2jIApw==
X-Received: by 2002:aa7:c0c7:: with SMTP id j7mr812662edp.298.1614544794201;
 Sun, 28 Feb 2021 12:39:54 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id q27sm11246729ejc.74.2021.02.28.12.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 12:39:53 -0800 (PST)
Date: Sun, 28 Feb 2021 15:39:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v5 1/1] virtio-net: Add check for mac address while peer
 is vdpa
Message-ID: <20210228153905-mutt-send-email-mst@kernel.org>
References: <20210225165506.18321-1-lulu@redhat.com>
 <20210225165506.18321-2-lulu@redhat.com>
 <20210225141203-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210225141203-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: eperezma@redhat.com, jasowang@redhat.com, amorenoz@redhat.com,
 qemu-devel@nongnu.org, Sean Mooney <smooney@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 25, 2021 at 02:14:39PM -0500, Michael S. Tsirkin wrote:
> On Fri, Feb 26, 2021 at 12:55:06AM +0800, Cindy Lu wrote:
> > While peer is vdpa, sometime qemu get an all zero mac address from the hardware,
> > This is not a legal value. Add the check for this.if we get an zero mac address.
> > qemu will use the default mac address or the mac address from qemu cmdline
> > 
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> 
> I guess I will have to rewrite the comments and commit log :(
> 
> It is all saying what does the patch do. We want it to rather
> give motivation.
> 
> Sean could you please comment on whether this patch fixes your
> config?

ping. if I'm to try and merge this work around it's critical
that someone with access to hardware confirm it actually works.


> > ---
> >  hw/net/virtio-net.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..8f36ca5066 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >      VirtIONet *n = VIRTIO_NET(vdev);
> >      struct virtio_net_config netcfg;
> >      NetClientState *nc = qemu_get_queue(n->nic);
> > +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> >  
> >      int ret = 0;
> >      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> > @@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> >                                     n->config_size);
> >          if (ret != -1) {
> > +            /*
> > +             * Here is a work around, the 0 mac address is not a legal value.
> > +             * if we got this from hardware, qemu will use the mac address
> > +             * saved in VirtIONet->mac.
> > +             */
> > +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
> > +                info_report("Get an all zero mac address from hardware");
> > +                memcpy(netcfg.mac, n->mac, ETH_ALEN);
> > +            }
> >              memcpy(config, &netcfg, n->config_size);
> >          }
> >      }
> > -- 
> > 2.21.3


