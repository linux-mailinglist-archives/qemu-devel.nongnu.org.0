Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3315D327EF7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:07:58 +0100 (CET)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiHF-00087E-85
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1lGiFR-0006nj-Qz
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:06:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <smooney@redhat.com>)
 id 1lGiFP-0005HW-FT
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614603962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1MDdzcuxi7n6vDf09QVM0dSSKWdgC+dJM6gaoIvna4=;
 b=Y21qqAUGEXfsWITvNZ6ochP+nwi/vHZU7Q7Uov3thuhBjVB/35G22TEtqqw4VrZ79YvweK
 4xjKin/7FABNzu1OevGZeq0kFCCLWdwJnDXYsUBsngd0BZicw26J6Ksty1w8NF9G7psjyb
 cDgpbYfA6FHCAyW4mBAJ/4UtLTsvfbE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-uftSs0oiN1WTTAgFt2qelw-1; Mon, 01 Mar 2021 08:04:23 -0500
X-MC-Unique: uftSs0oiN1WTTAgFt2qelw-1
Received: by mail-wm1-f71.google.com with SMTP id a63so1235337wmd.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=F1MDdzcuxi7n6vDf09QVM0dSSKWdgC+dJM6gaoIvna4=;
 b=I91tkcsebCtDEJD3T38/FB9zrBrFVxXCdIItIrrHkb5g+RnQ1CDx9QB7bDSUNyaZHT
 5OkzwtaNzJZlryWElPUDHnZn/ZdCjsDA1imhOmw6v5h29vq2C2nw4PYhU4LustC5CPUR
 mPJFPBW1belr0L1EzjsIKiLeSrZgFvXzbNL/iUjxvcEBWnh3FSnTM0+ZVdWLcYmJ4trh
 +u4nRHM2nVFW1uG0MUm/P2/43/WXFl12zLTW5xJdW+PsfhQHbPQVQxisbh2MMp1Q6lS9
 o+z8XWSXtdDUWlt6aGKLNrmsH42kXqU4UdtmlO7AZPlOAu6xIQqktivg5/zUw1e9GLFm
 QPWg==
X-Gm-Message-State: AOAM533FRIi671Hb6A7cYpogXWDsGDz8VSEnsCe+ZlJeRsUyg+gKMFOV
 S73ScEkbHW3CAu3DG+bm+4U0LHdKSUwBvg/ogkXz+/6eaO0ir/Fmo2ZDVd6arHyB41Sj1r3ParF
 cTeLdyxvtDc/xQLY=
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr3084617wmg.26.1614603861632; 
 Mon, 01 Mar 2021 05:04:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEq6a8a5O+wG8OSdsUpWUNgAc01qXLJlN/1SunYS7zDjs1IrvxrYLFIXnCeUAoSYEtQayuEA==
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr3084598wmg.26.1614603861461; 
 Mon, 01 Mar 2021 05:04:21 -0800 (PST)
Received: from [192.168.1.56] ([78.152.229.142])
 by smtp.gmail.com with ESMTPSA id r2sm5260240wrt.8.2021.03.01.05.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:04:21 -0800 (PST)
Message-ID: <5ccb787373eb7884cd69a937ba0984bc240d6a94.camel@redhat.com>
Subject: Re: [PATCH v5 1/1] virtio-net: Add check for mac address while peer
 is vdpa
From: Sean Mooney <smooney@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
Date: Mon, 01 Mar 2021 13:04:19 +0000
In-Reply-To: <20210225141203-mutt-send-email-mst@kernel.org>
References: <20210225165506.18321-1-lulu@redhat.com>
 <20210225165506.18321-2-lulu@redhat.com>
 <20210225141203-mutt-send-email-mst@kernel.org>
User-Agent: Evolution 3.38.3 (3.38.3-1.module_f33+11014+b95688ad)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=smooney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=smooney@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-02-25 at 14:14 -0500, Michael S. Tsirkin wrote:
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
sorry this came in just as i was finsihing up for the day and firday was a company day.

i just applied the patch on my dev env.
when i do the mac is set to the value i set on the qemu command line.
i am able to bring up the interface in the guest and i can successfully ping the host so setting 
only the mac seams to be sufficent to allow the vdpa interface to be used in a guest.

i tested using an unmodifed alpine linux image for the guest and appied the patch
to qemu commit e90ef02389dc8b57eaea22b290244609d720a8bf which was the had of master when i cloned qemu a few days ago.
regards
sean

> 
> > ---
> >  hw/net/virtio-net.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 9179013ac4..8f36ca5066 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -126,6 +126,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >      VirtIONet *n = VIRTIO_NET(vdev);
> >      struct virtio_net_config netcfg;
> >      NetClientState *nc = qemu_get_queue(n->nic);
> > +    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
> >  
> > 
> > 
> > 
> >      int ret = 0;
> >      memset(&netcfg, 0 , sizeof(struct virtio_net_config));
> > @@ -151,6 +152,15 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
> >          ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
> >                                     n->config_size);
> >          if (ret != -1) {
> > +            /*
> > +             * Here is a work around, the 0 mac address is not a legal value.
> > +             * if we got this from hardware, qemu will use the mac address
> > +             * saved in VirtIONet->mac.
> > +             */
> > +            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
> > +                info_report("Get an all zero mac address from hardware");
> > +                memcpy(netcfg.mac, n->mac, ETH_ALEN);
> > +            }
> >              memcpy(config, &netcfg, n->config_size);
> >          }
> >      }
> > -- 
> > 2.21.3
> 



