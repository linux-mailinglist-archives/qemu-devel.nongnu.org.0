Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6DC485927
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 20:27:55 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Bww-0003Vh-Af
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 14:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5Bn5-00059U-Ed
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:17:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1n5Bn3-0008CH-3a
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 14:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641410259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fH7IF7pOQsqTwHWpmprJnFGZUojg0QDUC0pGWtPlgZo=;
 b=eFr9hVefi8xmoTFPqIDneATi+nguKb/PNjf+KG1HQM5vXbB+fB7y4D1uDKS4WMWfzmvKB2
 ZHVgXl2hIiXdao9pe5q1eBUp3hQXhRg9jevyFsOD9sMAUvYpBe4XqzQWW2KkIhl5Z4MgGh
 ifya70LkWjZclnKmqh+4OYDZVV7flPE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-rRmJdBvRM8GpXGoUkFSMoQ-1; Wed, 05 Jan 2022 14:17:33 -0500
X-MC-Unique: rRmJdBvRM8GpXGoUkFSMoQ-1
Received: by mail-ot1-f70.google.com with SMTP id
 i3-20020a05683033e300b0057a02219a82so229011otu.9
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 11:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzzcEXl9m3Dg59A+yxsxr2yz6T5Er/SCB1GYXMPl6YI=;
 b=petuN9+AG6RZ6NFbiqj+KHp6NtHYyxltYeDA7TWCOj2/S3MsGCVagvT0wFCGM7d2BA
 hR8IlcIqVYNtcmx/OEingzYmBSOSe/mSeesBwpXTAfELfX/fYG4psf0ulTKJ+LAoUwj+
 Gv/4gmZCOlmTU/9dxTiSzap61/1NDwdW0loDHQzyd3tIvtf+YT5mA0PUxMXOYSA3wP1G
 ck5FbgtHxcjvyj7PEjhtKjRrKVzupoIvjgFIWJu+R19CYIyO/NCKAWHN+mNXR0Ai9zZG
 Cx3F1CZBDN/L+AbFZDzR9RgBUPbFb49znpGUWlI9AqW9QXl2isIeiySV+q2Rir8c397j
 cdxA==
X-Gm-Message-State: AOAM531B2y9QwksNd0QDNRpnl6C5DxeyXShnrddlXS3UiffyYVz9btMh
 CLPP9lUK+yvkZmrC6hc3jN/9lik0bGXKwXxK1y9RxegnzJhZH32C/DkcIzzH2spzAN/uv/ObYCM
 dPysALdksoHJWobQ=
X-Received: by 2002:aca:ba85:: with SMTP id k127mr3612341oif.169.1641410252282; 
 Wed, 05 Jan 2022 11:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweutMK+Fos0zvBC0e5lUdD2nFBwvP7OMm5qCbn4ya6/QkiDGHMseOzuv8NsCi+7+YeYjOBXg==
X-Received: by 2002:aca:ba85:: with SMTP id k127mr3612324oif.169.1641410251992; 
 Wed, 05 Jan 2022 11:17:31 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id c10sm8994708ots.73.2022.01.05.11.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 11:17:31 -0800 (PST)
Date: Wed, 5 Jan 2022 12:17:30 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] pci: Skip power-off reset when pending unplug
Message-ID: <20220105121730.76fe115c.alex.williamson@redhat.com>
In-Reply-To: <20211223060931-mutt-send-email-mst@kernel.org>
References: <164002480875.2328622.7843917444941101286.stgit@omen>
 <20211220174502-mutt-send-email-mst@kernel.org>
 <20211221093656.0d30644e.alex.williamson@redhat.com>
 <20211221183400-mutt-send-email-mst@kernel.org>
 <20211222120809.3f28f44b.alex.williamson@redhat.com>
 <20211222152815-mutt-send-email-mst@kernel.org>
 <20211222161007.27cb7729.alex.williamson@redhat.com>
 <20211223060931-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Dec 2021 08:33:09 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Dec 22, 2021 at 04:10:07PM -0700, Alex Williamson wrote:
> > On Wed, 22 Dec 2021 15:48:24 -0500
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >  =20
> > > On Wed, Dec 22, 2021 at 12:08:09PM -0700, Alex Williamson wrote: =20
> > > > On Tue, 21 Dec 2021 18:40:09 -0500
> > > > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > The reset is actually just an attempt to approximate power off.
> > > So I'm not sure that is right powering device off and then on
> > > is just a slow but reasonable way for guests to reset a device. =20
> >=20
> > Agree, I don't have a problem with resetting devices in response to the
> > slot being powered off, just that it's pointless, and in some scenarios
> > causes us additional grief when it occurs when the device is being
> > removed anyway.
> >  =20
> > > >  In that case we could reorganize things to let the unplug occur
> > > > before the power transition.   =20
> > >=20
> > > Hmm you mean unplug on host immediately when it starts blinking?
> > > But drivers are not notified at this point, are they? =20
> >=20
> > I think this is confusing Attention Indicator and Power Indicator
> > again. =20
>=20
> Let's try to clear it up.
>=20
> Here's text from the SHPC spec, pcie spec is less clear imho but
> same idea IIUC.
>=20
> The Power Indicator provides visual feedback to the human operator (if th=
e system
> software accepts the request initiated by the Attention Button) by blinki=
ng. Once the
> Power Indicator begins blinking, a 5-second abort interval exists during =
which a second
> depression of the Attention Button cancels the operation.
>=20
> Attention Indicator is confusingly unrelated to the Attention Button.
> Right?

Yeah, I think that's where I was getting confused.  So a qdev_unplug()
results in "pushing" the attention button, the power indicator starts
flashing for 5s, during which an additional attention button press
could cancel the event.  After that 5s period and with the power
indicator still flashing, the power controller is set to off, followed
by the power indicator turning off.

> >  The write sequence I noted for the slot control register was as
> > follows:
> >=20
> >     01f1 - > 02f1 -> 06f1 -> 07f1
> >=20
> >  01f1:
> >    Attention Indicator: OFF
> >    Power Indicator: ON
> >    Power Controller: ON
> >=20
> >  02f1:
> >    Power Indicator: ON -> BLINK
> >=20
> >  06f1:
> >    Power Controller: ON -> OFF
> >=20
> >  07f1:
> >    Power Indicator: BLINK -> OFF
> >=20
> > The device reset currently occurs at 06f1, when the Power Controller
> > removes power to the slot.  The unplug doesn't occur until 07f1 when
> > the Power Indicator turns off.  On bare metal, the device power would
> > be in some indeterminate state between those two writes as the power
> > drains.  We've chosen to reset the device at the beginning of this
> > phase, where power is first removed (ie. instantaneous power drain),
> > but on a physical device it happens somewhere in between. =20
>=20
> Yes, this is true I think. But I think on bare metal it's guaranteed to
> happen within 1 second after power is removed, whatever the state of the
> power indicator.
> Also, Gerd attempted to add PV code that special cases KVM and
> removes all the multi-second waiting from unplug path.
> So I am not sure we should rely on the 1 second wait, either.

Right, if we don't reset when power is removed we're in a guessing game
of whether the guest is following our assumed transitions.

> >  It therefore
> > seems valid that it could happen at the moment the Power Indicator
> > turns off such that we could precede the device reset with any
> > necessary unplug operations. =20
>=20
> However the power indicator is merely an indicator for the
> human operator. My understanding is that driver that does not want to per=
mit
> removing the device can turn off power without turning off
> the power indicator.

Yes, on bare metal there's likely some small window where the device
power state is indeterminate, but to take advantage of that we'd need
to do something like setup a 2s timer to reset the device, where that
timer gets canceled if the power indicator turns off in the meantime.
It's a lot of heuristics.

> > > >  Of course the original proposal also
> > > > essentially supports this interpretation, the slot power off reset =
does
> > > > not occur for devices with a pending unplug and those devices are
> > > > removed after the slot transition grace period.   =20
> > >=20
> > > Meaning the patch you posted? It relies on guest doing a specific
> > > thing though, and guest and host states are not synchronized. =20
> >=20
> > The proposed patch just means we won't reset the device in response to
> > slot power if an unplug is pending.  So sure, if it's true that a guest
> > playing with the Power Controller without using the Power Indicator to
> > reflect the slot state could skip a device reset, but is that valid
> > guest behavior? =20
>=20
> I'm not 100% sure:
> The Power Indicator in the Off state indicates that insertion or removal =
of an the adapter is
> permitted.
>=20
> but also
>=20
> =09System software must cause a slot=E2=80=99s Power Indicator to be turn=
ed off when the slot
> =09is not powered and/or it is permissible to insert or remove an adapter=
.
>=20
> this and/or confuses me, but I think the "or" here is simply misguided.
> The SHPC spec from which the interface in pcie was inherited just says:
>=20
> =09When the Power Indicator is off, it means that main power to the slot =
is off and that
> =09insertion or removal of an add-in card is permitted.

I think the power indicator is clearly our guideline for when we're
allowed to insert or remove a device from the slot.  Other than
resetting when slot power is removed as we do now, the above timer hack
is the only solution I can think of that guarantees we eventually reset
the device after power is removed without relying on the power
indicator transition.  But I'm not sure it's worthwhile.

> > > I think it might work to defer reset if it's blinking until it actual=
ly
> > > stops blinking. To me it seems a bit less risky but but again, in the=
ory
> > > some guest driver could use the power cycle reset while hotplug plays
> > > with PIC waiting for the cancel button press. =20
> >=20
> > That's essentially my previous suggestion above.  The Power Indicator
> > blinking tells us the slot power is in transition, the option to press
> > the attention button to abort has passed.  I understand the abort
> > window to be governed by the Attention Indicator blinking. =20
>=20
> what text in the spec gives you that impression?

My misunderstanding of the attention vs power indicators.

> > > E.g. I suspect your patch can be broken just by guest loading/unloadi=
ng
> > > driver in a loop while host also triggers plug/unplug. =20
> >=20
> > It's not clear to me why that might fail.  Can you elaborate?  All it
> > does is skip the reset when an unplug is pending, but the actual unplug
> > finalizes the device and any subsequent plug necessarily uses a new
> > device, so I don't see what goes wrong. =20
>=20
> host wants to start unplug
> meanwhile guest wants to attempt a reset (for its own reasons)
> we skip the reset to device retains a bunch of state in
> its registers, the guest attempts to drive it assuming
> a reset device.

Under the condition of the kernel device lock being held, we can't
reset the device anyway.  But yes, we don't need to extend that
vfio-pci limitation to other devices.  Unless you're interested in
pursuing a timer based solution, which I guess would model a physical
system with super capacitors on the power rail that will drain
eventually, or instantly with the power indicator turning off, I think
the best we can do at the moment is to clean up the error reporting in
vfio-pci, report that the reset failed, but not some obscure error
about un-owned groups because we've fallen through to unexpected reset
methods.  A reasonable error message for this condition can be
considered a feature rather than a regression.  It's arguably correct
to try to reset the device here.  I'll post a different patch where we
clean up the vfio-pci error reporting for this case.  Thanks,

Alex


