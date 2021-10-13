Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5249942C007
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:30:10 +0200 (CEST)
Received: from localhost ([::1]:38092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madOb-0004iI-6T
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madJh-0007ps-KF
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1madJd-0007dz-6W
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634127900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3NtOzxvADTQDRxUqq39GhmNI5frCiu0QqcftxeM4E6Y=;
 b=SFwK9pKjAHMDjMRTHhl+c0Xr1vH2exLwb6yUmMcmAK5JdK8r2vnVz90Res9Ve2SiXRcvSh
 dZHH+MPuDKgIOmj40Rp3k8IJrTIROJ9+G0VitQXBF6Equ9QGobxGbIcLyqKDdz3VfQa9MD
 OYWufBnUKCZHFRJxg1/1xKjaVdCHB3s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-D6t6VfrSPn6ZHT0p87OaHw-1; Wed, 13 Oct 2021 08:24:59 -0400
X-MC-Unique: D6t6VfrSPn6ZHT0p87OaHw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso1855560wrg.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 05:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3NtOzxvADTQDRxUqq39GhmNI5frCiu0QqcftxeM4E6Y=;
 b=JQXExiIJz9fPPeVlCfDEap1Vx2nEZmhZMCTlJqvwks8/I0IZRKHI1VPKqu6GGC6ix5
 8rk8jhOYmGbXcYKZMZBDRIPh8Bh46aL8aMhDPouFSqJAgEjFuCnHefnD7GGIucJ0w3wF
 E3S/3AAoM17EWqFaZnpWCeu+wJLynY2KB24FASVg01iXudJwh9uwtZTDDkTo7RFa5DZY
 EjZH4XA8iow9YeNwStbZkBzthIxQRbfncIocrGPwC+0vlv664PAA6d+DtqDyZ5zNP4wr
 iX+x9FQwDC5NtkEt5N6Rzoe0eqgJeu96aAmUciiCLcY7Kvv/3o3wmzAm1GHnS2TvKO+H
 DSLw==
X-Gm-Message-State: AOAM53145MKyrXSV8RMDcElxIgP2L6sPR4x6WFIf5uO8+K81xY/39chM
 p0HzDhuqTFpbs6VydcciCBJ2+/vcy9ez0BiqzyR07AuMB48RzYLHDdEB85fr1LfyLiawpr5vOow
 x1J6fUCdu81OiL8k=
X-Received: by 2002:adf:a455:: with SMTP id e21mr39490164wra.232.1634127898285; 
 Wed, 13 Oct 2021 05:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDSFMe16ogpHVDRTaFOz/jIPakQIZOos3qRZcdyyohISEjdGqG71pBPixTxJCG6KjC1I5tyQ==
X-Received: by 2002:adf:a455:: with SMTP id e21mr39490144wra.232.1634127898093; 
 Wed, 13 Oct 2021 05:24:58 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id r3sm6850548wrw.55.2021.10.13.05.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:24:57 -0700 (PDT)
Date: Wed, 13 Oct 2021 08:24:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211013081836-mutt-send-email-mst@kernel.org>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
 <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 01:23:50PM +0200, Christian Borntraeger wrote:
> 
> 
> Am 13.10.21 um 12:10 schrieb Michael S. Tsirkin:
> > On Mon, Oct 11, 2021 at 07:39:21AM +0200, Halil Pasic wrote:
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
> > > is complete. Before validate callback existed, config space was only
> > > read after FEATURES_OK. However, we already have two regressions, so
> > > let's address this here as well.
> > > 
> > > The regressions affect the VIRTIO_NET_F_MTU feature of virtio-net and
> > > the VIRTIO_BLK_F_BLK_SIZE feature of virtio-blk for BE guests when
> > > virtio 1.0 is used on both sides. The latter renders virtio-blk unusable
> > > with DASD backing, because things simply don't work with the default.
> > > See Fixes tags for relevant commits.
> > > 
> > > For QEMU, we can work around the issue by writing out the feature bits
> > > with VIRTIO_F_VERSION_1 bit set.  We (ab)use the finalize_features
> > > config op for this. This isn't enough to address all vhost devices since
> > > these do not get the features until FEATURES_OK, however it looks like
> > > the affected devices actually never handled the endianness for legacy
> > > mode correctly, so at least that's not a regression.
> > > 
> > > No devices except virtio net and virtio blk seem to be affected.
> > > 
> > > Long term the right thing to do is to fix the hypervisors.
> > > 
> > > Cc: <stable@vger.kernel.org> #v4.11
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> > > Fixes: fe36cbe0671e ("virtio_net: clear MTU when out of range")
> > > Reported-by: markver@us.ibm.com
> > > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > 
> > OK this looks good! How about a QEMU patch to make it spec compliant on
> > BE?
> 
> Who is going to do that? Halil? you? Conny?

Halil said he'll do it... Right, Halil?

> Can we get this kernel patch queued for 5.15 and stable without waiting for the QEMU patch
> as we have a regression with 4.14?

Probably. Still trying to decide between this and plain revert for 5.15
and back. Maybe both?

> > 
> > > ---
> > > 
> > > @Connie: I made some more commit message changes to accommodate Michael's
> > > requests. I just assumed these will work or you as well and kept your
> > > r-b. Please shout at me if it needs to be dropped :)
> > > ---
> > >   drivers/virtio/virtio.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > index 0a5b54034d4b..236081afe9a2 100644
> > > --- a/drivers/virtio/virtio.c
> > > +++ b/drivers/virtio/virtio.c
> > > @@ -239,6 +239,17 @@ static int virtio_dev_probe(struct device *_d)
> > >   		driver_features_legacy = driver_features;
> > >   	}
> > > +	/*
> > > +	 * Some devices detect legacy solely via F_VERSION_1. Write
> > > +	 * F_VERSION_1 to force LE config space accesses before FEATURES_OK for
> > > +	 * these when needed.
> > > +	 */
> > > +	if (drv->validate && !virtio_legacy_is_little_endian()
> > > +			  && device_features & BIT_ULL(VIRTIO_F_VERSION_1)) {
> > > +		dev->features = BIT_ULL(VIRTIO_F_VERSION_1);
> > > +		dev->config->finalize_features(dev);
> > > +	}
> > > +
> > >   	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> > >   		dev->features = driver_features & device_features;
> > >   	else
> > > 
> > > base-commit: 60a9483534ed0d99090a2ee1d4bb0b8179195f51
> > > -- 
> > > 2.25.1
> > 


