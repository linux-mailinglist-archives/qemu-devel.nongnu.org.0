Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200A71359D8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 14:15:19 +0100 (CET)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipXeg-0005TH-7W
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 08:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ipXYV-0005T9-2u
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ipXYT-0003yN-TF
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:08:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36333
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ipXYT-0003wN-OW
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 08:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578575333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sngUd6rai46LEBYf4aDkmjBCBMR1DlXX/uH7wqSozgU=;
 b=WDtPx4JBwFCMAqApMAg0UWGJMmbzE7mMdQan6tZclxi7IeDgjEqUOEoe7efNqpFOCfcP6k
 TY0gnuFBAZWi+gmr0J9YwliX8I1W7zQ3z2x4Afpw0OOLCWXwz5ZBzGeePxwxESGTKQ/d/y
 bnRg2N+eaXMJ0F/g57aXoQ8iSFJyjrs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-KnqpHrXPMe2ZdXmiMlkr5g-1; Thu, 09 Jan 2020 08:08:52 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F1C7801E76;
 Thu,  9 Jan 2020 13:08:51 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F4A9CA3;
 Thu,  9 Jan 2020 13:08:47 +0000 (UTC)
Date: Thu, 9 Jan 2020 13:08:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Roman Kagan <rkagan@virtuozzo.com>, qemu-devel@nongnu.org,
 vkuznets@redhat.com, mst@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH 2/2] hyperv/synic: Allocate as ram_device
Message-ID: <20200109130844.GE6795@work-vm>
References: <20200108135353.75471-1-dgilbert@redhat.com>
 <20200108135353.75471-3-dgilbert@redhat.com>
 <20200109130348.GC3147@rkaganb.sw.ru>
MIME-Version: 1.0
In-Reply-To: <20200109130348.GC3147@rkaganb.sw.ru>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: KnqpHrXPMe2ZdXmiMlkr5g-1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Roman Kagan (rkagan@virtuozzo.com) wrote:
> On Wed, Jan 08, 2020 at 01:53:53PM +0000, Dr. David Alan Gilbert (git) wr=
ote:
> > Mark the synic pages as ram_device so that they won't be visible
> > to vhost.
>=20
> Unless I'm misreading the code this also makes them invisible to
> migration.
>=20
> I need some more reading on the ram_device region behavior to better
> understand other potential consequences.

Hmm you might be right; that's not intended.
Looking at memory.c I see we have vmstate_register_ram calls in
  memory_region_init_ram
  memory_region_init_rom
  memory_region_init_rom_device

but not
  memory_region_init_ram_device_ptr

hmm; OK this needs changing then.

Dave

> Thanks,
> Roman.
>=20
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  hw/hyperv/hyperv.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> > index da8ce82725..4de3ec411d 100644
> > --- a/hw/hyperv/hyperv.c
> > +++ b/hw/hyperv/hyperv.c
> > @@ -95,12 +95,14 @@ static void synic_realize(DeviceState *dev, Error *=
*errp)
> >      msgp_name =3D g_strdup_printf("synic-%u-msg-page", vp_index);
> >      eventp_name =3D g_strdup_printf("synic-%u-event-page", vp_index);
> > =20
> > -    memory_region_init_ram(&synic->msg_page_mr, obj, msgp_name,
> > -                           sizeof(*synic->msg_page), &error_abort);
> > -    memory_region_init_ram(&synic->event_page_mr, obj, eventp_name,
> > -                           sizeof(*synic->event_page), &error_abort);
> > -    synic->msg_page =3D memory_region_get_ram_ptr(&synic->msg_page_mr)=
;
> > -    synic->event_page =3D memory_region_get_ram_ptr(&synic->event_page=
_mr);
> > +    synic->msg_page =3D qemu_memalign(qemu_real_host_page_size,
> > +                                    sizeof(*synic->msg_page));
> > +    synic->event_page =3D qemu_memalign(qemu_real_host_page_size,
> > +                                      sizeof(*synic->event_page));
> > +    memory_region_init_ram_device_ptr(&synic->msg_page_mr, obj, msgp_n=
ame,
> > +                           sizeof(*synic->msg_page), synic->msg_page);
> > +    memory_region_init_ram_device_ptr(&synic->event_page_mr, obj, even=
tp_name,
> > +                           sizeof(*synic->event_page), synic->event_pa=
ge);
> > =20
> >      g_free(msgp_name);
> >      g_free(eventp_name);
> > --=20
> > 2.24.1
> >=20
> >=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


