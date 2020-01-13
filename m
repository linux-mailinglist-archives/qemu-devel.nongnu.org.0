Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B71138C82
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 08:49:28 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iquTX-0007EA-7y
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 02:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iquSO-0005oo-1u
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:48:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iquSL-0000M2-Vu
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:48:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57885
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iquSL-0000Ej-Jv
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578901691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7bEOR9oyDnD2vz8O9zDFtOYrvT5bY8MGcoR9KuTjcDg=;
 b=WuorQt747GwVAMV83HrB8sksBxY33Hfu0DIuyLbMz5ckFnzlMh6U9vcwrRFz9FxPVY/bfQ
 QhQRsLvihVP0z0vNbsUy1QtLbyvwU2D9QPLi+FcYFKqSs9lw45mgnFl3N2+AP6G8ljIRG6
 PsMJnG7fytFOiHe9O/BJJioumTQACV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-lDyjCLBsP7uiW9NpZ1WrOA-1; Mon, 13 Jan 2020 02:48:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BE1477;
 Mon, 13 Jan 2020 07:48:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66C3888863;
 Mon, 13 Jan 2020 07:48:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 690279DA5; Mon, 13 Jan 2020 08:48:05 +0100 (CET)
Date: Mon, 13 Jan 2020 08:48:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] xhci: Fix memory leak in xhci_kick_epctx when poweroff
 GuestOS
Message-ID: <20200113074805.4nsqairqwvrf37eb@sirius.home.kraxel.org>
References: <20200110105855.81144-1-kuhn.chenqun@huawei.com>
 <d5e369c6-b1c2-2b64-97a5-d9b2fc443842@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d5e369c6-b1c2-2b64-97a5-d9b2fc443842@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: lDyjCLBsP7uiW9NpZ1WrOA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, kuhn.chenqun@huawei.com, pannengyuan@huawei.com,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > index 80988bb305..0d3d96d05a 100644
> > --- a/hw/usb/hcd-xhci.c
> > +++ b/hw/usb/hcd-xhci.c
> > @@ -2000,6 +2000,7 @@ static void xhci_kick_epctx(XHCIEPContext *epctx,=
 unsigned int streamid)
> >           if (xfer !=3D NULL && xfer->running_retry) {
> >               DPRINTF("xhci: xfer nacked, stopping schedule\n");
> >               epctx->retry =3D xfer;
> > +            xhci_xfer_unmap(xfer);
>=20
> Shouldn't we use xhci_ep_free_xfer() instead?

No, xhci will try to run the transfer again later.

xhci will re-create the sgl then, so freeing the
sgl here is correct.  Patch added to usb queue.

thanks,
  Gerd


