Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B219F190
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 10:27:34 +0200 (CEST)
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLN6S-0005Im-TC
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 04:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jLN4V-0004EF-P2
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 04:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jLN4U-0007g2-3C
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 04:25:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47556
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jLN4T-0007dn-Ue
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 04:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586161527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgyvPU093E5Rn9607Fe27c6v3grn75YLViKPTemSI/I=;
 b=OT8gtFEIVt9eoUYu3DU/2uOvdw1lhkAjGiuYmQXjJL6L7bsmagxa5i9fE6NlqfqBHFvhX6
 ahBAPfhzmwSczzonmM0qAahMlM8QoOXpw30b2aT0CHUAuAlX4bQqU8BQaGSg/vB6/WBQpu
 lOBlowpCnV+MdW/iuUgB28CqZPLVR0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-IsaiZLQwMJm1udP-c7Ru4Q-1; Mon, 06 Apr 2020 04:25:26 -0400
X-MC-Unique: IsaiZLQwMJm1udP-c7Ru4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6831084432;
 Mon,  6 Apr 2020 08:25:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC85A0A6B;
 Mon,  6 Apr 2020 08:25:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C508616E2C; Mon,  6 Apr 2020 10:25:17 +0200 (CEST)
Date: Mon, 6 Apr 2020 10:25:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/12] acpi: move aml builder code for rtc device
Message-ID: <20200406082517.uyz7zv4jiqqjbcli@sirius.home.kraxel.org>
References: <20200403080502.8154-1-kraxel@redhat.com>
 <20200403080502.8154-8-kraxel@redhat.com>
 <20200403120921.258db9a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200403120921.258db9a5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 03, 2020 at 12:09:21PM +0200, Igor Mammedov wrote:
> On Fri,  3 Apr 2020 10:04:57 +0200
> Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> [...]
> > +static void rtc_build_aml(ISADevice *isadev, Aml *scope)
> > +{
> > +    Aml *dev;
> > +    Aml *crs;
> > +
> > +    crs =3D aml_resource_template();
> > +    aml_append(crs, aml_io(AML_DECODE16, 0x0070, 0x0070, 0x10, 0x02));
> > +    aml_append(crs, aml_irq_no_flags(8));
> > +    aml_append(crs, aml_io(AML_DECODE16, 0x0072, 0x0072, 0x02, 0x06));
>=20
> since this is made a part of device, can we fetch io port values from
> device instead of hard-codding values here?

No, the rtc device hasn't a configurable io port address.

cheers,
  Gerd


