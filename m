Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662DB112D8D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 15:37:29 +0100 (CET)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icVmR-0003L1-Un
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 09:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1icVks-0002KH-Se
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1icVkr-0004CL-Hx
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:35:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51630
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1icVkr-0004CF-EG
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 09:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575470148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bS9JtcPtluztgNaDzOwCU6df2h/XOu5oKiEOyfPMELo=;
 b=B5YnNNFBKxP0xFC72DPS5jDL68NpmNDsfb0dw6FmBc81V3ciF2mL6cEGi3uckocIp/xyOE
 N7lWaHh7RpR+YwFChAMqxBhisaI1ibrYM64qEm7QAbNsfZmiO3DGxFQ3eGJ2hZgCb6VDgA
 RxLCuz+8M6LfxHNmkY2hhvW3HKPIAMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-Tg1foDOLO5--NxBFdG647Q-1; Wed, 04 Dec 2019 09:35:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E3918B9FB7;
 Wed,  4 Dec 2019 14:35:46 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B78B60BE2;
 Wed,  4 Dec 2019 14:35:38 +0000 (UTC)
Date: Wed, 4 Dec 2019 11:35:37 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Subject: Re: qom device lifecycle interaction with hotplug/hotunplug ?
Message-ID: <20191204143537.GA498046@habkost.net>
References: <CAFEAcA9E-Z-RPwFsAiz9Pi3_MtBUFEU7enJFVrpOQ7UKW8e1DQ@mail.gmail.com>
 <20191128182705.0635d1d4@redhat.com>
 <CAFEAcA-qA6n49KdHsGLqt422L_b_9xPfSaJB3tATQvRdfKt-xw@mail.gmail.com>
 <20191129132641.4c7da6c5@redhat.com>
 <CAFEAcA_gcxqu+N5iV0L5WLyWmm5yxTFNMtmqQryBgVd4CCCT8A@mail.gmail.com>
 <20191129200545.GG14595@habkost.net>
 <CAFEAcA-BkETOSpOwBegDcbO3bqxDO_a9xoTB7Fc8Ajw_+CDcFA@mail.gmail.com>
 <20191203214004.GS14595@habkost.net>
 <20191204091824.cwufcnlfj5vm4vqu@jenstp.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191204091824.cwufcnlfj5vm4vqu@jenstp.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Tg1foDOLO5--NxBFdG647Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On Wed, Dec 04, 2019 at 10:18:24AM +0100, Jens Freimann wrote:
> On Tue, Dec 03, 2019 at 06:40:04PM -0300, Eduardo Habkost wrote:
> > +jfreimann, +mst
> >=20
> > On Sat, Nov 30, 2019 at 11:10:19AM +0000, Peter Maydell wrote:
> > > On Fri, 29 Nov 2019 at 20:05, Eduardo Habkost <ehabkost@redhat.com> w=
rote:
> > > > So, to summarize the current issues:
> > > >
> > > > 1) realize triggers a plug operation implicitly.
> > > > 2) unplug triggers unrealize implicitly.
> > > >
> > > > Do you expect to see use cases that will require us to implement
> > > > realize-without-plug?
> > >=20
> > > I don't think so, but only because of the oddity that
> > > we put lots of devices on the 'sysbus' and claim that
> > > that's plugging them into the bus. The common case of
> > > 'realize' is where one device (say an SoC) has a bunch of child
> > > devices (like UARTs); the SoC's realize method realizes its child
> > > devices. Those devices all end up plugged into the 'sysbus'
> > > but there's no actual bus there, it's fictional and about
> > > the only thing it matters for is reset propagation (which
> > > we don't model right either). A few devices don't live on
> > > buses at all.
> >=20
> > That's my impression as well.
> >=20
> > >=20
> > > > Similarly, do you expect use cases that will require us to
> > > > implement unplug-without-unrealize?
> > >=20
> > > I don't know enough about hotplug to answer this one:
> > > it's essentially what I'm hoping you'd be able to answer.
> > > I vaguely had in mind that eg the user might be able to
> > > create a 'disk' object, plug it into a SCSI bus, then
> > > unplug it from the bus without the disk and all its data
> > > evaporating, and maybe plug it back into the SCSI
> > > bus (or some other SCSI bus) later ? But I don't know
> > > anything about how we expose that kind of thing to the
> > > user via QMP/HMP.
> >=20
> > This ability isn't exposed to the user at all.  Our existing
> > interfaces are -device, device_add and device_del.
> >=20
> > We do have something new that sounds suspiciously similar to
> > "unplugged but not unrealized", though: the new hidden device
> > API, added by commit f3a850565693 ("qdev/qbus: add hidden device
> > support").
> >=20
> > Jens, Michael, what exactly is the difference between a "hidden"
> > device and a "unplugged" device?
>=20
> "hidden" the way we use it for virtio-net failover is actually unplugged.=
 But it
> doesn't have to be that way. You can register a function that decides
> if the device should be hidden, i.e. plugged now, or do something else
> with it (in the virtio-net failover case we just save everything we
> need to plug the device later).
>=20
> We did introduce a "unplugged but not unrealized" function too as part
> of the failover feature. See "a99c4da9fc pci: mark devices partially
> unplugged"
>=20
> This was needed so we would be able to re-plug the device in case a
> migration failed and we need to hotplug the primary device back to the
> guest. To avoid the risk of not getting the resources the device needs
> we don't unrealize but just trigger the unplug from the guest OS.

Thanks for the explanation.  Let me confirm if I understand the
purpose of the new mechanisms: should_be_hidden is a mechanism
for implementing realize-without-plug.  partially_hotplugged is a
mechanism for implementing unplug-without-unrealize.  Is that
correct?

--=20
Eduardo


