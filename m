Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A76426DDE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:44:11 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYs2b-00033L-Oz
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYs0q-0001md-Dt
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mYs0l-0002NK-GH
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633707730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMC5Klotg1aJNEk7elIqSRCi23Sna03uJX/agMDIgxg=;
 b=hfG3zom7+tWBYTRUDnC3e7/50qouLfw3ciRb2G5ZG0Kn38JGdJz5/rc9MTxIgLHoBcb8mo
 oRDpLvVzxVl4W+8LJ9OexglyqZc9n7xXkcb7b4HtmCOa0rcb6oDUKdGLCaBitA8KaTFizC
 e4rTYcqPJv4F8jp7yNFVg7+x8gk1w40=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-icog4bE6M_Gx649Q2OVUIg-1; Fri, 08 Oct 2021 11:42:09 -0400
X-MC-Unique: icog4bE6M_Gx649Q2OVUIg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so3979210edl.17
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qMC5Klotg1aJNEk7elIqSRCi23Sna03uJX/agMDIgxg=;
 b=a9HRtiRF6tl/ra/wLDJfEvXczgp33L+fVZjPkLHs3vQ0kH5TcnjZJYhh0zMKSArX2P
 K/53h4IqaQb64lKGERwAZpTz5YDyHfpHenXZzZQyskBBsBSXfILwygZ5DYTxNAaXnGV1
 9wSd0PgylsMeScXPbw6YdwZD9c7uVojk2dXeom/yRJV9H6cIPrGhbUkPHOAEaMdNe2DX
 p7fdY6Lh9R8ReKe+Pel3RkqQWQx8DUrDrUTfJYxQ0xffFTSZnyzRTstMpnMTWxjene2I
 s6A840Xbhup+Krk9w8zXRmVAREMsH1X4QbutytI9xZYSgwQrEn9laOz6CgewJVZvEP0z
 bjCg==
X-Gm-Message-State: AOAM5321FGOXlKzK+mEqwALDeQPKZmbfe06XrGDg1ylzJA8GlYFGZLR7
 I6OwFTS68VJdkzXYFs/37JaZ4Dq395bcVi1n55tyFWeTJ2jDA9OnULTlgMl+8Yalo79fekaJu9y
 bG8j6FtBJo3obuJ8=
X-Received: by 2002:a50:da04:: with SMTP id z4mr15752286edj.52.1633707728445; 
 Fri, 08 Oct 2021 08:42:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHLSNoBYozNsq5483RYGKOQ6xoIu8y6Sysra7Dpoor+71RjKofWVLel+TDlQXhZNhKirsgbQ==
X-Received: by 2002:a50:da04:: with SMTP id z4mr15752226edj.52.1633707728015; 
 Fri, 08 Oct 2021 08:42:08 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
 by smtp.gmail.com with ESMTPSA id m9sm1193458edl.66.2021.10.08.08.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:42:07 -0700 (PDT)
Date: Fri, 8 Oct 2021 11:42:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211008113904-mutt-send-email-mst@kernel.org>
References: <20211008123422.1415577-1-pasic@linux.ibm.com>
 <20211008085839-mutt-send-email-mst@kernel.org>
 <20211008155156.626e78b5.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211008155156.626e78b5.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 08, 2021 at 03:51:56PM +0200, Halil Pasic wrote:
> On Fri, 8 Oct 2021 09:05:03 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Oct 08, 2021 at 02:34:22PM +0200, Halil Pasic wrote:
> > > The virtio specification virtio-v1.1-cs01 states: "Transitional devices
> > > MUST detect Legacy drivers by detecting that VIRTIO_F_VERSION_1 has not
> > > been acknowledged by the driver."  This is exactly what QEMU as of 6.1
> > > has done relying solely on VIRTIO_F_VERSION_1 for detecting that.
> > > 
> > > However, the specification also says: "... the driver MAY read (but MUST
> > > NOT write) the device-specific configuration fields to check that it can
> > > support the device ..." before setting FEATURES_OK.
> > > 
> > > In that case, any transitional device relying solely on
> > > VIRTIO_F_VERSION_1 for detecting legacy drivers will return data in
> > > legacy format.  In particular, this implies that it is in big endian
> > > format for big endian guests. This naturally confuses the driver which
> > > expects little endian in the modern mode.
> > > 
> > > It is probably a good idea to amend the spec to clarify that
> > > VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> > > is complete. However, we already have a regression so let's try to address  
> > 
> > actually, regressions. and we can add 
> > "since originally before validate callback existed
> > config space was only read after
> > FEATURES_OK. See Fixes tags for relevant commits"
> > 
> > > it.
> 
> How about replacing the paragraph above with the following?
> 
> "It is probably a good idea to amend the spec to clarify that
> VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
> is complete. Before validate callback existed, config space was only
> read after FEATURES_OK. However, we already have two regression,

two regressions

> so
> let's address this here as well."
> > > 
> > > The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
> > > the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
> > > virtio 1.0 is used on both sides. The latter renders virtio-blk
> > > unusable with DASD backing, because things simply don't work with
> > > the default.  
> 
> and add 
> "See Fixes tags for relevant commits."
> here.
> > 
> > Let's add a work around description now:
> > 
> > 
> > For QEMU, we can work around the issue by writing out the features
> > register with VIRTIO_F_VERSION_1 bit set.  We (ab) use the
> s/features register/feature bits/
> rationale: ccw does not have a features register, and qemu does not
> really act as if its behavior was controlled by the values in a features
> register. I.e. when we read the register we see VIRTIO_F_VERSION_!
> because the feature is offered. In QEMU we basically read host_featues
> but write the guest_features. And what drives device behavior is mostly
> guest_features. 
> 
> s/(ab) use/(ab)use/
> 
> > finalize_features config op for this. It's not enough to address vhost
> 
> s/It's/This is/
> 
> > user and vhost block devices since these do not get the features until
> 
> s/vhost user and vhost block/some vhost-user and vhost-vdpa/ ?

Let's just say "not enough to address vhost devices since some
of these etc" 

> Ratioale: I think vhost block is just a vhost-user device. On the other
> hand vhost-user-fs works like charm because the config space is
> implemented in qemu and not in the vhost-user device. I
> didn't check vhost_net. I'm not even sure qemu offers a vhost_net
> implementation.

it does

> Anyway I wouldn't like to make any false statements here.

ok

> > FEATURES_OK, however it looks like these two actually never handled the
> > endian-ness for legacy mode correctly, so at least that's not a
> > regression.
> > 
> > No devices except virtio net and virtio blk seem to be affected.
> > 
> > Long term the right thing to do is to fix the hypervisors.
> > 
> 
> Sounds good. Thanks! Are you OK with my changes proposed to your changes?
> 
> Regards,
> Halil

yes.

> > 
> > > 
> > > Cc: <stable@vger.kernel.org> #v4.11
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in
> > > config space") Fixes: fe36cbe0671e ("virtio_net: clear MTU when out
> > > of range") Reported-by: markver@us.ibm.com
> > > ---
> > >  drivers/virtio/virtio.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > index 0a5b54034d4b..236081afe9a2 100644
> > > --- a/drivers/virtio/virtio.c
> > > +++ b/drivers/virtio/virtio.c
> > > @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
> > >  		driver_features_legacy = driver_features;
> > >  	}
> > >  
> > > +	/*
> > > +	 * Some devices detect legacy solely via F_VERSION_1. Write
> > > +	 * F_VERSION_1 to force LE config space accesses before
> > > FEATURES_OK for
> > > +	 * these when needed.
> > > +	 */
> > > +	if (drv->validate && !virtio_legacy_is_little_endian()
> > > +			  && device_features &
> > > BIT_ULL(VIRTIO_F_VERSION_1)) {
> > > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> > > +		dev->config->finalize_features(dev);
> > > +	}
> > > +
> > >  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> > >  		dev->features = driver_features & device_features;
> > >  	else
> > > 
> > > base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
> > > -- 
> > > 2.25.1  
> > 


