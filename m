Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6590666453
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 21:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFhHe-0001Fu-EV; Wed, 11 Jan 2023 15:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFhHX-0001FM-76
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 15:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pFhHR-0000Q7-RW
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 15:01:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673467260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLAsffA6rUdPdyCWZMkUGLLVTdlMqvoEs+TD8x7/beM=;
 b=CI8YnfhB2CL2+NCtAd8ijGrkCTELJ4Xo5cqWBoX3Ltxv5274as53pogxFlzKNqnFA5+GVu
 13qH/uiqScyrE7K4xNzqADXoBY2zvgHo6V5Ma9pGQm6PO6WQqz47Yml5xChAWxHkZROcB/
 EYnvaPuprRFbwrDNUgfJJCXQE5/weeU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-OMLOn9maPv-mKzCgZdxeWw-1; Wed, 11 Jan 2023 15:00:56 -0500
X-MC-Unique: OMLOn9maPv-mKzCgZdxeWw-1
Received: by mail-il1-f198.google.com with SMTP id
 l13-20020a056e021c0d00b003034e24b866so11875803ilh.22
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 12:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLAsffA6rUdPdyCWZMkUGLLVTdlMqvoEs+TD8x7/beM=;
 b=IRAxtsNO+aUvfrVSRpOQdANEctKTtUyvZZIy9ainpFGaBl5SsXU+dbRVXDEnVIC3uC
 WV0yLIg5dahXnq11sj9k3WrDv8qBo6BlsaVTjCxoDL+WPbZmAb/L2mCANXn8bU7FlSGO
 Tg1VIf4idiqf2AyH/f9HkCMz58wnZw12BwDQKRAlN/FRj9P5lTTdTON0bc/vMOi5tLEh
 gUQJTYJs5D27teHGDffSwm3ezv8lxhVriPuQWAw4f0i/VwX3FBb0v9vHIJKhBCcAsDFR
 7U8dLx327KnIYLN0kBKuHEEpR0BK/e72CkhBrJpH7dvQU6ahUA/HRQUh30/M1Ac+NzsR
 jNpA==
X-Gm-Message-State: AFqh2kpOMMM5BH3vAOiuEi2hVJ2vIRuiSeV/1MHUsGgz/r5b/WCpKD13
 6I+94bVOaib6mSNBRkPjSsXlPYoJcbIONEoBlzd2/GnWM+bN9CSKLzMg6+Qehj0NQmo6ETBPZq9
 e26tq6p30sRAX9z0=
X-Received: by 2002:a5d:8c8d:0:b0:6df:e3ad:1e1c with SMTP id
 g13-20020a5d8c8d000000b006dfe3ad1e1cmr46364825ion.12.1673467255568; 
 Wed, 11 Jan 2023 12:00:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsd3OzCdtTTABideDz9Unrb0F1lNT3j/OIVve/VHT93ONNw5wJiTOiIjxKfm7JiDMWZGUV0SQ==
X-Received: by 2002:a5d:8c8d:0:b0:6df:e3ad:1e1c with SMTP id
 g13-20020a5d8c8d000000b006dfe3ad1e1cmr46364812ion.12.1673467255268; 
 Wed, 11 Jan 2023 12:00:55 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056602089000b006e31544bea5sm5361371ioz.49.2023.01.11.12.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 12:00:54 -0800 (PST)
Date: Wed, 11 Jan 2023 13:00:53 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, paul@xen.org
Subject: Re: [RFC] Notify IRQ sources of level interrupt ack/EOI
Message-ID: <20230111130053.7564d188.alex.williamson@redhat.com>
In-Reply-To: <790c6618cb25dd9b866fd1788ec4fa839134eba0.camel@infradead.org>
References: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
 <20230111112425-mutt-send-email-mst@kernel.org>
 <70eb35a08a7c48993812b7f088fa9ae3f2c8b925.camel@infradead.org>
 <20230111112947.22237481.alex.williamson@redhat.com>
 <458b3d6af1ad4e5e44e1eac0b05692805e32a070.camel@infradead.org>
 <20230111124319.405bf5ef.alex.williamson@redhat.com>
 <790c6618cb25dd9b866fd1788ec4fa839134eba0.camel@infradead.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, 11 Jan 2023 19:50:15 +0000
David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2023-01-11 at 12:43 -0700, Alex Williamson wrote:
> > On Wed, 11 Jan 2023 19:08:44 +0000
> > David Woodhouse <dwmw2@infradead.org> wrote:
> >  =20
> > > On Wed, 2023-01-11 at 11:29 -0700, Alex Williamson wrote: =20
> > > >=20
> > > > Nice.=C2=A0 IIRC, we ended up with the hack solution we have today =
in vfio
> > > > because there was too much resistance to callbacks that were only
> > > > necessary for vfio in the past.=C2=A0 Once we had KVM resampling su=
pport,
> > > > it simply wasn't worth the effort for a higher latency solution to
> > > > fight that battle, so we implemented what could best be described as
> > > > a universal workaround embedded in vfio.
> > > >=20
> > > > Clearly a callback is preferable, and yes, that's how we operate wi=
th
> > > > KVM resampling and unmasking INTx, so in theory plumbing this to our
> > > > existing eoi callback and removing the region toggling ought to do
> > > > the right thing.=C2=A0 Thanks,=C2=A0  =20
> > >=20
> > > Well, I'm happy for the Xen support be a second use case which means
> > > it's no longer "only necessary for VFIO", and keep prodding at it if
> > > that's going to be useful... =20
> >=20
> > Welcome aboard.=C2=A0 I take it from your cover letter than non-x86
> > architectures would be on your todo list.=C2=A0 Ideally the ack callback
> > would simply be a requirement for any implementation of a new interrupt
> > controller, but that's where we get into striking a balance of device
> > assignment imposing requirements on arbitrary architectures that may or
> > may not care, or even support, device assignment. =20
>=20
> Right. We'd probably want to do it for those interrupt controllers
> which could be behind PCI host controllers that might have VFIO devices
> attached.
>
> > This is the... dare I say, elegance of the region access hack.=C2=A0 It=
's
> > obviously not pretty or performant, but it universally provides an
> > approximation of the behavior of an emulated device, ie. some form of
> > guest access to the device is required to de-assert the interrupt.
> >=20
> > We probably need some way to detect the interrupt controller support
> > for the callback mechanism so we can generate an appropriate user
> > warning to encourage development of that support and fall back to our
> > current hack for some degree of functionality.=C2=A0 Thanks, =20
>=20
> Yeah, I pondered that. It's not that hard to do; have the interrupt
> controller indicate that a given qemu_irq supports EOI notifications,
> and then when the VFIO or other event source calls
> qemu_set_irq_ack_callback() it can get a failure which will cause it to
> use the fallback mode.
>=20
> Happy to look at wiring this up through the pci_set_irq() mechanisms if
> it's not going to be rejected out of hand.


Careful about making too many assumptions around PCI, it's clearly the
most used but vfio is bus agnostic and we do have vfio-platform support
as well as some weird s390 devices.  There's nothing PCI specific about
a level triggered interrupt, so preferably all this sits a layer below
the PCI interfaces.  Thanks,

Alex


