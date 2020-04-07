Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6D1A0B95
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 12:28:04 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLlSe-000215-0R
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 06:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jLlRm-0001Ut-1Q
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jLlRk-0001wR-FO
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:27:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41396
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jLlRk-0001tX-BZ
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586255227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCdPsqMFQLhEWThWkOWLlQH9hvr7+wsVWgQHxjMYMV4=;
 b=HRX/rqcbX1NRLXJO5Tl5rZFtzNH7AKpkLy+ir4TSo9luIEf7Q4HufkkcIzMoB12ikgT563
 75JGC4qICb7pt+fCm4oQmjN8BSY+fa4BT0SfdrBxjV6qXBQRIY7cvQfghDBSUMU8CWPHuN
 YYh5PdPD/PRNFA/iYQ9U1rQc+GZIauU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-xaqrptpzNHurwhTP3U4zxw-1; Tue, 07 Apr 2020 06:27:06 -0400
X-MC-Unique: xaqrptpzNHurwhTP3U4zxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5BE1800D4E;
 Tue,  7 Apr 2020 10:27:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BE9F5C1B5;
 Tue,  7 Apr 2020 10:26:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 34EF816E2C; Tue,  7 Apr 2020 12:26:58 +0200 (CEST)
Date: Tue, 7 Apr 2020 12:26:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/12] acpi: move aml builder code for rtc device
Message-ID: <20200407102658.x5tb4txcpvmtxfj7@sirius.home.kraxel.org>
References: <20200403080502.8154-1-kraxel@redhat.com>
 <20200403080502.8154-8-kraxel@redhat.com>
 <20200403120921.258db9a5@redhat.com>
 <20200406082517.uyz7zv4jiqqjbcli@sirius.home.kraxel.org>
 <20200406141705.77d90b68@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406141705.77d90b68@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 06, 2020 at 02:17:05PM +0200, Igor Mammedov wrote:
> On Mon, 6 Apr 2020 10:25:17 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> > On Fri, Apr 03, 2020 at 12:09:21PM +0200, Igor Mammedov wrote:
> > > On Fri,  3 Apr 2020 10:04:57 +0200
> > > Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >  =20
> > > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > > --- =20
> > > [...] =20
> > > > +static void rtc_build_aml(ISADevice *isadev, Aml *scope)
> > > > +{
> > > > +    Aml *dev;
> > > > +    Aml *crs;
> > > > +
> > > > +    crs =3D aml_resource_template();
> > > > +    aml_append(crs, aml_io(AML_DECODE16, 0x0070, 0x0070, 0x10, 0x0=
2));
> > > > +    aml_append(crs, aml_irq_no_flags(8));
> > > > +    aml_append(crs, aml_io(AML_DECODE16, 0x0072, 0x0072, 0x02, 0x0=
6)); =20
> > >=20
> > > since this is made a part of device, can we fetch io port values from
> > > device instead of hard-codding values here? =20
> >=20
> > No, the rtc device hasn't a configurable io port address.
> what I'm after is consistent code, so if we switch to taking
> io_base/irq from ISA device, then do it everywhere.

The patch series does it consistently where it makes sense.
That IMHO isn't the case for the rtc.  It has a fixed address.
You can't have multiple instances if it.  And because of that
there isn't a variable in the device state struct where I could
read the iobase from ...

> So we don't have a zoo of devices doing the same thing in multiple
> ways.

It's two ways: hardcoded for devices which can't move and
read-from-device for devices which can move.

cheers,
  Gerd


