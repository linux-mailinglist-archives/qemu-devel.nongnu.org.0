Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AA113534
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 19:53:01 +0100 (CET)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icZlj-0006OD-5D
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 13:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1icZkC-0005xv-To
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 13:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1icZk9-0003bW-GC
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 13:51:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1icZk9-0003XK-4g
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 13:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575485479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLuJC0f7mxIYleAm83OKPJr+8IjMcQ4H4I9215LP0ac=;
 b=W/Q9WeTnt4lvgWJFpxuiZgvjS5tMDZeIzNarvSrXqLPtwqbKgx4YlNmL1D3jkltE9FlRTh
 9BG02S9v6t0KFg2te1G9t1cMTqNuYkXbWqfEkaDegym64t4tauW5Rl10nRGUMTqt+DyfrB
 TiLq3hNXUtzGxdfnyp37vBtQ9pTAs6M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-fa3RQDNLN9yAY7uLU2Lt0w-1; Wed, 04 Dec 2019 13:51:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24C511010FC1;
 Wed,  4 Dec 2019 18:51:15 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0394600CC;
 Wed,  4 Dec 2019 18:51:07 +0000 (UTC)
Date: Wed, 4 Dec 2019 15:51:06 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Subject: Re: qom device lifecycle interaction with hotplug/hotunplug ?
Message-ID: <20191204185106.GC498046@habkost.net>
References: <20191128182705.0635d1d4@redhat.com>
 <CAFEAcA-qA6n49KdHsGLqt422L_b_9xPfSaJB3tATQvRdfKt-xw@mail.gmail.com>
 <20191129132641.4c7da6c5@redhat.com>
 <CAFEAcA_gcxqu+N5iV0L5WLyWmm5yxTFNMtmqQryBgVd4CCCT8A@mail.gmail.com>
 <20191129200545.GG14595@habkost.net>
 <CAFEAcA-BkETOSpOwBegDcbO3bqxDO_a9xoTB7Fc8Ajw_+CDcFA@mail.gmail.com>
 <20191203214004.GS14595@habkost.net>
 <20191204091824.cwufcnlfj5vm4vqu@jenstp.localdomain>
 <20191204143537.GA498046@habkost.net>
 <20191204162125.udpzdse3zchpfinw@jenstp.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191204162125.udpzdse3zchpfinw@jenstp.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fa3RQDNLN9yAY7uLU2Lt0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 04, 2019 at 05:21:25PM +0100, Jens Freimann wrote:
> On Wed, Dec 04, 2019 at 11:35:37AM -0300, Eduardo Habkost wrote:
> > On Wed, Dec 04, 2019 at 10:18:24AM +0100, Jens Freimann wrote:
> > > On Tue, Dec 03, 2019 at 06:40:04PM -0300, Eduardo Habkost wrote:
> > > > +jfreimann, +mst
> > > >
> > > > On Sat, Nov 30, 2019 at 11:10:19AM +0000, Peter Maydell wrote:
> > > > > On Fri, 29 Nov 2019 at 20:05, Eduardo Habkost <ehabkost@redhat.co=
m> wrote:
> > > > > > So, to summarize the current issues:
> > > > > >
> > > > > > 1) realize triggers a plug operation implicitly.
> > > > > > 2) unplug triggers unrealize implicitly.
> > > > > >
> > > > > > Do you expect to see use cases that will require us to implemen=
t
> > > > > > realize-without-plug?
> > > > >
> > > > > I don't think so, but only because of the oddity that
> > > > > we put lots of devices on the 'sysbus' and claim that
> > > > > that's plugging them into the bus. The common case of
> > > > > 'realize' is where one device (say an SoC) has a bunch of child
> > > > > devices (like UARTs); the SoC's realize method realizes its child
> > > > > devices. Those devices all end up plugged into the 'sysbus'
> > > > > but there's no actual bus there, it's fictional and about
> > > > > the only thing it matters for is reset propagation (which
> > > > > we don't model right either). A few devices don't live on
> > > > > buses at all.
> > > >
> > > > That's my impression as well.
> > > >
> > > > >
> > > > > > Similarly, do you expect use cases that will require us to
> > > > > > implement unplug-without-unrealize?
> > > > >
> > > > > I don't know enough about hotplug to answer this one:
> > > > > it's essentially what I'm hoping you'd be able to answer.
> > > > > I vaguely had in mind that eg the user might be able to
> > > > > create a 'disk' object, plug it into a SCSI bus, then
> > > > > unplug it from the bus without the disk and all its data
> > > > > evaporating, and maybe plug it back into the SCSI
> > > > > bus (or some other SCSI bus) later ? But I don't know
> > > > > anything about how we expose that kind of thing to the
> > > > > user via QMP/HMP.
> > > >
> > > > This ability isn't exposed to the user at all.  Our existing
> > > > interfaces are -device, device_add and device_del.
> > > >
> > > > We do have something new that sounds suspiciously similar to
> > > > "unplugged but not unrealized", though: the new hidden device
> > > > API, added by commit f3a850565693 ("qdev/qbus: add hidden device
> > > > support").
> > > >
> > > > Jens, Michael, what exactly is the difference between a "hidden"
> > > > device and a "unplugged" device?
> > >=20
> > > "hidden" the way we use it for virtio-net failover is actually unplug=
ged. But it
> > > doesn't have to be that way. You can register a function that decides
> > > if the device should be hidden, i.e. plugged now, or do something els=
e
> > > with it (in the virtio-net failover case we just save everything we
> > > need to plug the device later).
> > >=20
> > > We did introduce a "unplugged but not unrealized" function too as par=
t
> > > of the failover feature. See "a99c4da9fc pci: mark devices partially
> > > unplugged"
> > >=20
> > > This was needed so we would be able to re-plug the device in case a
> > > migration failed and we need to hotplug the primary device back to th=
e
> > > guest. To avoid the risk of not getting the resources the device need=
s
> > > we don't unrealize but just trigger the unplug from the guest OS.
> >=20
> > Thanks for the explanation.  Let me confirm if I understand the
> > purpose of the new mechanisms: should_be_hidden is a mechanism
> > for implementing realize-without-plug.  partially_hotplugged is a
> > mechanism for implementing unplug-without-unrealize.  Is that
> > correct?
>=20
> should_be_hidden is a mechanism for implementing
> realize-without-plug: kind of. It's a mechanism that ensures
> qdev_device_add() returns early as long as the condition to hide the
> device is true. You could to the realize-without-plug in the handler
> function that decides if the device should be "hidden".

Oh, right.  I thought "qdev_device_add() returns early" meant
"return after realize, before plug".  Now I see it returns before
object_new().  This means we have another user-visible device
state: "defined (in QemuOpts), but not created".

>=20
> partially_hotplugged is a mechanism for implementing
> unplug-without-unrealize: yes.

Thanks!

--=20
Eduardo


