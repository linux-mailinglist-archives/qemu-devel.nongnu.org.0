Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB49372BC5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 16:13:38 +0200 (CEST)
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvnt-0004ZL-Te
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 10:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldvmg-0003pJ-B3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldvmc-0008J6-Op
 for qemu-devel@nongnu.org; Tue, 04 May 2021 10:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620137537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pmBlTR8+h2hPUVbcfrh6BSZ6zQwNHB10UcvlDlCF8rk=;
 b=M5IeJZOY9f8sQVCCCD0RczK5iWy14Lbz067jQMZMn+53KE5Gj/OPYOgrgUee82fW+ar5Qj
 mvPZSnHuclvKrQ8ktZFv72MjJevNPMFtAXwZEvVkZjEitVaTRLMFcauPVwjs0jcN1JHWgc
 ngzwvgqXnmN6SykHJhSCsI8j26ROHUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-nYfq1rBlNf2OQQOV8UbW_Q-1; Tue, 04 May 2021 10:12:14 -0400
X-MC-Unique: nYfq1rBlNf2OQQOV8UbW_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EAC4835DE4;
 Tue,  4 May 2021 14:12:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2316E6090F;
 Tue,  4 May 2021 14:12:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9BEE71800383; Tue,  4 May 2021 16:12:11 +0200 (CEST)
Date: Tue, 4 May 2021 16:12:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Remy Noel <remy.noel@blade-group.com>
Subject: Re: [PULL 6/7] usb/xhci: sanity check packet size (CVE-2021-3527)
Message-ID: <20210504141211.hmevpsfq3bc5j2kq@sirius.home.kraxel.org>
References: <20210504085317.207369-1-kraxel@redhat.com>
 <20210504085317.207369-7-kraxel@redhat.com>
 <20210504133327.wh4ncydrs5jvwhrh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210504133327.wh4ncydrs5jvwhrh@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 03:33:27PM +0200, Remy Noel wrote:
> Hello
> 
> On Tue, May 04, 2021 at 10:53:16AM +0200, Gerd Hoffmann wrote:
> > Make sure the usb packet size is within the
> > bounds of the endpoint configuration.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Message-Id: <20210503132915.2335822-5-kraxel@redhat.com>
> > ---
> > hw/usb/hcd-xhci.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> > 
> > diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> > index 46212b1e695a..7acfb8137bc9 100644
> > --- a/hw/usb/hcd-xhci.c
> > +++ b/hw/usb/hcd-xhci.c
> > @@ -1568,6 +1568,11 @@ static int xhci_setup_packet(XHCITransfer *xfer)
> >         qemu_sglist_destroy(&xfer->sgl);
> >         return -1;
> >     }
> > +    if (xfer->packet.iov.size > ep->max_packet_size) {
> > +        usb_packet_unmap(&xfer->packet, &xfer->sgl);
> > +        qemu_sglist_destroy(&xfer->sgl);
> > +        return -1;
> > +    }
> >     DPRINTF("xhci: setup packet pid 0x%x addr %d ep %d\n",
> >             xfer->packet.pid, ep->dev->addr, ep->nr);
> >     return 0;
> > --
> So im my user's case (using a usb-Display-port adapter) i managed to trigger
> this error.

Oh.

What is the packet size (xfer->packet.iov.size)?
Can I get an 'lsusb -v' for the device in question?

take care,
  Gerd


