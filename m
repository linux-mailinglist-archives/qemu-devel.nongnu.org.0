Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414004207E5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:09:55 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJyr-0002ai-VW
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXJwR-0008Tm-Iu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXJwP-0001Cv-MB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633338441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUYZD9Kgpaky1z7hVZXMbU8Alpvzhtxgb9yTTSNBD4U=;
 b=gWfKDOze4pY/KzMy1skF9g2MvpJeXM5lfyt4t1S5JJ9epzWa18YtNYor+0RBf+Z86RfhuO
 E5iIMFHkeYI7IPPVyNYY1xxoHPwgdR3i+jRugd4pi5vlJRZckAQ9JPgX5BF/bDoNO/PLXL
 iA8i7BXnhSQzABA0RXn78B0w5I9jl6E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-U3__jdxMM9mFwVhFc7l0SQ-1; Mon, 04 Oct 2021 05:07:20 -0400
X-MC-Unique: U3__jdxMM9mFwVhFc7l0SQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso652898wmc.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KUYZD9Kgpaky1z7hVZXMbU8Alpvzhtxgb9yTTSNBD4U=;
 b=y2j9V/2Cccoo/BwboSbCsVAcfr4eZdP0m/dodMKFlG/OUFOsNjZxZus2yOsWTb4rG+
 iM832nRhMwpgbFwQ8rNwl+kVBnvU1hUCubMOBOhktO8WoEkscvj1UTUth8iRawFaDlsP
 UKZBRlIN9+JjMzHFMnLo4ehFenFfvERBQSvYD2O+Lhfc14qlSqCBx3EvS042DX2Zq41W
 GnGEdPH7dHYJ+uBu9JtJ/8nFgAkHoP+c1zz/lpOkYjuAcBulIR3whK/yQWpILCU6pugj
 RoK0ETJO7gxikjMJj/c/2R+4kKV24rAd/KsFrHnGe13CLEn1xOoB7Beiq6E+iyA11LH2
 ZdrQ==
X-Gm-Message-State: AOAM532ClsKTs4iZsyNC5lXtgr+cdAWGclw2GJagj7i1vS1MvyQHmDOq
 W5Txxo9/J/AVY8Iy7cW6WbMrt9rIFyO1zHKe8whFmV4//hLstKqmmQvDVtDQiV9x4QTipIm0FEt
 pLT9qzp2YNp6csLQ=
X-Received: by 2002:adf:e309:: with SMTP id b9mr12638349wrj.81.1633338438601; 
 Mon, 04 Oct 2021 02:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxetp1mwKHklXMBwe56BuI1PQiGNQTpk0T6hYH6FfLDl0lEWTgrKFExLyVwgcM3KL58TXci1w==
X-Received: by 2002:adf:e309:: with SMTP id b9mr12638322wrj.81.1633338438386; 
 Mon, 04 Oct 2021 02:07:18 -0700 (PDT)
Received: from redhat.com ([2.55.134.94])
 by smtp.gmail.com with ESMTPSA id t15sm4510863wru.6.2021.10.04.02.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:07:17 -0700 (PDT)
Date: Mon, 4 Oct 2021 05:07:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211004040937-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <87r1d64dl4.fsf@redhat.com>
 <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com>
 <20211001162213.18d7375e.pasic@linux.ibm.com>
 <87v92g3h9l.fsf@redhat.com>
 <20211002082128-mutt-send-email-mst@kernel.org>
 <20211004042323.730c6a5e.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211004042323.730c6a5e.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 04:23:23AM +0200, Halil Pasic wrote:
> On Sat, 2 Oct 2021 14:13:37 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > > Anyone else have an idea? This is a nasty regression; we could revert the
> > > patch, which would remove the symptoms and give us some time, but that
> > > doesn't really feel right, I'd do that only as a last resort.  
> > 
> > Well we have Halil's hack (except I would limit it
> > to only apply to BE, only do devices with validate,
> > and only in modern mode), and we will fix QEMU to be spec compliant.
> > Between these why do we need any conditional compiles?
> 
> We don't. As I stated before, this hack is flawed because it
> effectively breaks fencing features by the driver with QEMU. Some
> features can not be unset after once set, because we tend to try to
> enable the corresponding functionality whenever we see a write
> features operation with the feature bit set, and we don't disable, if a
> subsequent features write operation stores the feature bit as not set.

Something to fix in QEMU too, I think.

> But it looks like VIRTIO_1 is fine to get cleared afterwards.

We'd never clear it though - why would we?

> So my hack
> should actually look like posted below, modulo conditions.


Looking at it some more, I see that vhost-user actually
does not send features to the backend until FEATURES_OK.
However, the code in contrib for vhost-user-blk at least seems
broken wrt endian-ness ATM. What about other backends though?
Hard to be sure right?
Cc Raphael and Stefan so they can take a look.
And I guess it's time we CC'd qemu-devel too.

For now I am beginning to think we should either revert or just limit
validation to LE and think about all this some more. And I am inclining
to do a revert. These are all hypervisors that shipped for a long time.
Do we need a flag for early config space access then?



> 
> Regarding the conditions I guess checking that driver_features has
> F_VERSION_1 already satisfies "only modern mode", or?

Right.

> For now
> I've deliberately omitted the has verify and the is big endian
> conditions so we have a better chance to see if something breaks
> (i.e. the approach does not work). I can add in those extra conditions
> later.

Or maybe if we will go down that road just the verify check (for
performance). I'm a bit unhappy we have the extra exit but consistency
seems more important.

> 
> --------------------------8<---------------------
> 
> From: Halil Pasic <pasic@linux.ibm.com>
> Date: Thu, 30 Sep 2021 02:38:47 +0200
> Subject: [PATCH] virtio: write back feature VERSION_1 before verify
> 
> This patch fixes a regression introduced by commit 82e89ea077b9
> ("virtio-blk: Add validation for block size in config space") and
> enables similar checks in verify() on big endian platforms.
> 
> The problem with checking multi-byte config fields in the verify
> callback, on big endian platforms, and with a possibly transitional
> device is the following. The verify() callback is called between
> config->get_features() and virtio_finalize_features(). That we have a
> device that offered F_VERSION_1 then we have the following options
> either the device is transitional, and then it has to present the legacy
> interface, i.e. a big endian config space until F_VERSION_1 is
> negotiated, or we have a non-transitional device, which makes
> F_VERSION_1 mandatory, and only implements the non-legacy interface and
> thus presents a little endian config space. Because at this point we
> can't know if the device is transitional or non-transitional, we can't
> know do we need to byte swap or not.

Well we established that we can know. Here's an alternative explanation:

	The virtio specification virtio-v1.1-cs01 states:

	Transitional devices MUST detect Legacy drivers by detecting that
	VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
	This is exactly what QEMU as of 6.1 has done relying solely
	on VIRTIO_F_VERSION_1 for detecting that.

	However, the specification also says:
	driver MAY read (but MUST NOT write) the device-specific
	configuration fields to check that it can support the device before
	accepting it.

	In that case, any device relying solely on VIRTIO_F_VERSION_1
	for detecting legacy drivers will return data in legacy format.
	In particular, this implies that it is in big endian format
	for big endian guests. This naturally confuses the driver
	which expects little endian in the modern mode.

	It is probably a good idea to amend the spec to clarify that
	VIRTIO_F_VERSION_1 can only be relied on after the feature negotiation
	is complete. However, we already have regression so let's
	try to address it.


> 
> The virtio spec explicitly states that the driver MAY read config
> between reading and writing the features so saying that first accessing
> the config before feature negotiation is done is not an option. The
> specification ain't clear about setting the features multiple times
> before FEATURES_OK, so I guess that should be fine to set F_VERSION_1
> since at this point we already know that we are about to negotiate
> F_VERSION_1.
> 
> I don't consider this patch super clean, but frankly I don't think we
> have a ton of options. Another option that may or man not be cleaner,
> but is also IMHO much uglier is to figure out whether the device is
> transitional by rejecting _F_VERSION_1, then resetting it and proceeding
> according tho what we have figured out, hoping that the characteristics
> of the device didn't change.

An empty line before tags.

> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> Reported-by: markver@us.ibm.com

Let's add more commits that are affected. E.g. virtio-net with MTU
feature bit set is affected too.

So let's add Fixes tag for:
commit 14de9d114a82a564b94388c95af79a701dc93134
Author: Aaron Conole <aconole@redhat.com>
Date:   Fri Jun 3 16:57:12 2016 -0400

    virtio-net: Add initial MTU advice feature
    
I think that's all, but pls double check me.


> ---
>  drivers/virtio/virtio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 0a5b54034d4b..2b9358f2e22a 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -239,6 +239,12 @@ static int virtio_dev_probe(struct device *_d)
>  		driver_features_legacy = driver_features;
>  	}
>  
> +	/* Write F_VERSION_1 feature to pin down endianness */
> +	if (device_features & (1ULL << VIRTIO_F_VERSION_1) & driver_features) {
> +		dev->features = (1ULL << VIRTIO_F_VERSION_1);
> +		dev->config->finalize_features(dev);
> +	}
> +
>  	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
>  		dev->features = driver_features & device_features;
>  	else
> -- 
> 2.31.1
> 
> 
> 
> 
> 
>  


