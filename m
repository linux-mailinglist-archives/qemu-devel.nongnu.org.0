Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324FF420D8E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:14:46 +0200 (CEST)
Received: from localhost ([::1]:48674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNno-00046L-0b
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXNkV-0001T9-Sd
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXNkQ-00055e-Ok
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633353073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJ8uD8KGtyPPl9fPzzKl5NSX78fI1kIzy833DRlhopA=;
 b=EcM/mp6plBrwmKNINx0/+0UFgpTglcAcKSviQY2oOt8GMjbAxYA2G2/Lxn/+JKsXop7JBc
 zPxNSkdkZcBBq7iYFuxhg8/Zbxb8PpgB4HTqmmOiiqPhOdhtxoOIeshACfaN2e8eAB1Fus
 hQXA5ST4cOAiAM8GYM1wwpHk6RhrY30=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-t34M4-pVNZqf57dulGansQ-1; Mon, 04 Oct 2021 09:11:12 -0400
X-MC-Unique: t34M4-pVNZqf57dulGansQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso2880639wrg.16
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gJ8uD8KGtyPPl9fPzzKl5NSX78fI1kIzy833DRlhopA=;
 b=DRnIJMI0xBglMZ5RN6HJHdZJDD3Ep6blD2SFNRfDAehcDPnkh36H9luYDYF55tlBp9
 24R5g4pW2YwULhcGpsNiANNBpIMZkJNFv28W4HPr8zQ7GsFk2G9svv+V5sLTd8Kn5lvh
 Z/83SCjvUm0SL0zm6J4DPtkGh2dWWtq8gk9FSk0zCRX833Ddpi2FojiMbUWPD/gmbVj5
 nNlvMDaOXpX4VtuPszGGIqApgJE68CI81zH0LmqAI2Qp0eu10Vy7+uEmBRl8ExZqlh+4
 ESt+1FN05g3awKKu4CTW/IBhVt81QFYbeka9laE+OdGl3N+w8/5gE1NZjwloGYj8ueSx
 APSA==
X-Gm-Message-State: AOAM5308yioeIrds0L0j6Wc14bRUeAKEzOMMoUs/oyShzvaSK23Jw/YW
 MNMK093W1CodE+91e4iYLdl/DeYmsAENQg0vN2JNg7xDY9Ecnl+PU2Ob9oZwYe5EMVvRzexOrOX
 f7JhRXpCl+4H4dDg=
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr13849610wre.387.1633353070707; 
 Mon, 04 Oct 2021 06:11:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZvYf+VMC4Tiq195Wdu1f4UR7aD4zUUtGSveBANC153CIfNm6xHmaKVfbT3y2gMzaLHqaWkw==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr13849547wre.387.1633353070291; 
 Mon, 04 Oct 2021 06:11:10 -0700 (PDT)
Received: from redhat.com ([2.55.134.94])
 by smtp.gmail.com with ESMTPSA id p3sm7750728wmp.43.2021.10.04.06.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:11:09 -0700 (PDT)
Date: Mon, 4 Oct 2021 09:11:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
Message-ID: <20211004090018-mutt-send-email-mst@kernel.org>
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <20210930070444-mutt-send-email-mst@kernel.org>
 <20211001092125.64fef348.pasic@linux.ibm.com>
 <20211002055605-mutt-send-email-mst@kernel.org>
 <87bl452d90.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87bl452d90.fsf@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Xie Yongji <xieyongji@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 02:19:55PM +0200, Cornelia Huck wrote:
> 
> [cc:qemu-devel]
> 
> On Sat, Oct 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Oct 01, 2021 at 09:21:25AM +0200, Halil Pasic wrote:
> >> On Thu, 30 Sep 2021 07:12:21 -0400
> >> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> 
> >> > On Thu, Sep 30, 2021 at 03:20:49AM +0200, Halil Pasic wrote:
> >> > > This patch fixes a regression introduced by commit 82e89ea077b9
> >> > > ("virtio-blk: Add validation for block size in config space") and
> >> > > enables similar checks in verify() on big endian platforms.
> >> > > 
> >> > > The problem with checking multi-byte config fields in the verify
> >> > > callback, on big endian platforms, and with a possibly transitional
> >> > > device is the following. The verify() callback is called between
> >> > > config->get_features() and virtio_finalize_features(). That we have a
> >> > > device that offered F_VERSION_1 then we have the following options
> >> > > either the device is transitional, and then it has to present the legacy
> >> > > interface, i.e. a big endian config space until F_VERSION_1 is
> >> > > negotiated, or we have a non-transitional device, which makes
> >> > > F_VERSION_1 mandatory, and only implements the non-legacy interface and
> >> > > thus presents a little endian config space. Because at this point we
> >> > > can't know if the device is transitional or non-transitional, we can't
> >> > > know do we need to byte swap or not.  
> >> > 
> >> > Hmm which transport does this refer to?
> >> 
> >> It is the same with virtio-ccw and virtio-pci. I see the same problem
> >> with both on s390x. I didn't try with virtio-blk-pci-non-transitional
> >> yet (have to figure out how to do that with libvirt) for pci I used
> >> virtio-blk-pci.
> >> 
> >> > Distinguishing between legacy and modern drivers is transport
> >> > specific.  PCI presents
> >> > legacy and modern at separate addresses so distinguishing
> >> > between these two should be no trouble.
> >> 
> >> You mean the device id? Yes that is bolted down in the spec, but
> >> currently we don't exploit that information. Furthermore there
> >> is a fat chance that with QEMU even the allegedly non-transitional
> >> devices only present a little endian config space after VERSION_1
> >> was negotiated. Namely get_config for virtio-blk is implemented in
> >> virtio_blk_update_config() which does virtio_stl_p(vdev,
> >> &blkcfg.blk_size, blk_size) and in there we don't care
> >> about transitional or not:
> >> 
> >> static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
> >> {
> >> #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
> >>     return virtio_is_big_endian(vdev);
> >> #elif defined(TARGET_WORDS_BIGENDIAN)
> >>     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
> >>         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
> >>         return false;
> >>     }
> >>     return true;
> >> #else
> >>     return false;
> >> #endif
> >> }
> >> 
> >
> > ok so that's a QEMU bug. Any virtio 1.0 and up
> > compatible device must use LE.
> > It can also present a legacy config space where the
> > endian depends on the guest.
> 
> So, how is the virtio core supposed to determine this? A
> transport-specific callback?

I'd say a field in VirtIODevice is easiest.

> >
> >> > Channel i/o has versioning so same thing?
> >> >
> >> 
> >> Don't think so. Both a transitional and a non-transitional device
> >> would have to accept revisions higher than 0 if the driver tried to
> >> negotiate those (and we do in our case).
> >
> > Yes, the modern driver does. And that one is known to be LE.
> > legacy driver doesn't.
> >
> >> > > The virtio spec explicitly states that the driver MAY read config
> >> > > between reading and writing the features so saying that first accessing
> >> > > the config before feature negotiation is done is not an option. The
> >> > > specification ain't clear about setting the features multiple times
> >> > > before FEATURES_OK, so I guess that should be fine.
> >> > > 
> >> > > I don't consider this patch super clean, but frankly I don't think we
> >> > > have a ton of options. Another option that may or man not be cleaner,
> >> > > but is also IMHO much uglier is to figure out whether the device is
> >> > > transitional by rejecting _F_VERSION_1, then resetting it and proceeding
> >> > > according tho what we have figured out, hoping that the characteristics
> >> > > of the device didn't change.  
> >> > 
> >> > I am confused here. So is the problem at the device or at the driver level?
> >> 
> >> We have a driver regression. Since the 82e89ea077b9 ("virtio-blk: Add
> >> validation for block size in config space") virtio-blk is broken on
> >> s390.
> >
> > Because of a qemu bug. I agree. It's worth working around in the driver
> > since the qemu bug has been around for a very long time.
> 
> Yes, since we introduced virtio 1 support, I guess...
> 
> >
> >
> >> The deeper problem is in the spec. We stated that the driver may read
> >> config space before the feature negotiation is finalized, but we didn't
> >> think enough about what happens when native endiannes is not little
> >> endian in the different cases.
> >
> > Because the spec is very clear that endian-ness is LE.
> > I don't see a spec issue yet here, just an implementation issue.
> 
> Maybe not really a bug in the spec, but probably an issue, as this seems
> to have been unclear to most people so far.
> 
> >
> >> I believe, for non-transitional devices we have a problem in the host as
> >> well (i.e. in QEMU).
> >
> > Because QEMU ignores the spec and instead relies on the feature
> > negotiation.
> >
> >> 
> >> > I suspect it's actually the host that has the issue, not
> >> > the guest?
> >> 
> >> I tend to say we have a problem both in the host and in the guest. I'm
> >> more concerned about the problem in the guest, because that is a really
> >> nasty regression.
> >
> > The problem is in the guest. The bug is in the host ;)
> >
> >> For the host. I think for legacy we don't have a
> >> problem, because both sides would operate on the assumption no
> >> _F_VERSION_1, IMHO the implementation for the transitional devices is
> >> correct.
> >
> > Well no, the point of transitional is really to be 1.0 compliant
> > *and* also expose a legacy interface.
> 
> Worth noting that PCI and CCW are a tad different here: PCI exposes an
> additional interface, while CCW uses a revision negotiation mechanism
> (for CCW, legacy and standard-compliant are much closer on the transport
> side as for PCI.) MMIO does not do transitional, if I'm not wrong.

Right. It probably still uses VIRTIO_F_VERSION_1 and we need to
fix that.

> >
> >> For non-transitional flavor, it depends on the device. For
> >> example virtio-net and virtio-blk is broken, because we use primitives
> >> like virtio_stl_p() and those don't do the right thing before feature
> >> negotiation is completed. On the other hand virtio-crypto.c as a truly
> >> non-transitional device uses stl_le_p() and IMHO does the right thing.
> >> 
> >> Thanks for your comments! I hope I managed to answer your questions. I
> >> need some guidance on how do we want to move forward on this.
> >> 
> >> Regards,
> >> Halil
> >
> > OK so. I don't have a problem with the patch itself,
> > assuming it's enough to work around all buggy hosts.
> > I am especially worried about things like vhost/vhost-user,
> > I suspect they might have a bug like this too, and
> > I am not sure whether your work around is enough for these.
> > Can you check please?
> >
> > If not we'll have to move all validate code to after FEATURES_OK
> > is set.
> 
> What is supposed to happen for validate after FEATURES_OK? The driver
> cannot change any features at that point in time, it can only fail to
> use the device.

Fail to use the device. Need to tread carefully here of course,
we don't want to break working setups.

> >
> > We do however want to document that this API can be called
> > multiple times since that was not the case
> > previously.
> >
> > Also, I would limit this to when
> > - the validate callback exists
> > - the guest endian-ness is not LE
> >
> > We also want to document the QEMU bug in a comment here,
> > e.g. 
> >
> > /*
> >  * QEMU before version 6.2 incorrectly uses driver features with guest
> >  * endian-ness to set endian-ness for config space instead of just using
> >  * LE for the modern interface as per spec.
> >  * This breaks reading config in the validate callback.
> >  * To work around that, when device is 1.0 (so supposed to be LE)
> >  * but guest is not LE, then send the features to device one extra
> >  * time before validation.
> >  */
> 
> Do we need to consider migration, or do we not need to be bug-compatible
> in this case?

I suspect we don't need to be bug compatible, any driver
accessing config before FEATURES_OK is already broken ...

> >
> > Finally I'd like to see the QEMU bug fix before I merge this one,
> > since it will be harder to test with a fix.
> >
> >
> >
> >
> >> > 
> >> > 
> >> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> > > Fixes: 82e89ea077b9 ("virtio-blk: Add validation for block size in config space")
> >> > > Reported-by: markver@us.ibm.com
> >> > > ---
> >> > >  drivers/virtio/virtio.c | 4 ++++
> >> > >  1 file changed, 4 insertions(+)
> >> > > 
> >> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> >> > > index 0a5b54034d4b..9dc3cfa17b1c 100644
> >> > > --- a/drivers/virtio/virtio.c
> >> > > +++ b/drivers/virtio/virtio.c
> >> > > @@ -249,6 +249,10 @@ static int virtio_dev_probe(struct device *_d)
> >> > >  		if (device_features & (1ULL << i))
> >> > >  			__virtio_set_bit(dev, i);
> >> > >  
> >> > > +	/* Write back features before validate to know endianness */
> >> > > +	if (device_features & (1ULL << VIRTIO_F_VERSION_1))
> >> > > +		dev->config->finalize_features(dev);
> >> > > +
> >> > >  	if (drv->validate) {
> >> > >  		err = drv->validate(dev);
> >> > >  		if (err)
> >> > > 
> >> > > base-commit: 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
> >> > > -- 
> >> > > 2.25.1  
> >> > 


