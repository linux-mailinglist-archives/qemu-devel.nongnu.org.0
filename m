Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B91373F09
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:55:53 +0200 (CEST)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJsO-0002nS-Qn
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leJnq-00074u-W4
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1leJnk-0001Qu-7a
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620229862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l4SdDGiNzi9m1SvQwtJMGXtzB15RROfFAlwx6aTpz+E=;
 b=cv4SSLYeIMyDwh5TEdgP9J139xtSENrz63XVXshtag7sLNOBhpQGVrqTSDpd+CmQ+ffd0o
 IRPqPTHTkoe+PmcMU3Y+xz5jliaj58Jmd+o3b+jm/iyT3bb+XzPcceX0EBGxRuIZSgdrKo
 j+7odOepQDk2V2HApQ0c69f+ZKDKcK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-1tKKLxX2OMW_gkRbCgv8sw-1; Wed, 05 May 2021 11:51:00 -0400
X-MC-Unique: 1tKKLxX2OMW_gkRbCgv8sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08A94802942;
 Wed,  5 May 2021 15:51:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B405960864;
 Wed,  5 May 2021 15:50:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1BABF18007A6; Wed,  5 May 2021 17:50:58 +0200 (CEST)
Date: Wed, 5 May 2021 17:50:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Remy Noel <remy.noel@blade-group.com>
Subject: Re: [PULL 4/6] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
Message-ID: <20210505155058.jxs42eygjig5fyjp@sirius.home.kraxel.org>
References: <20210505130716.1128420-1-kraxel@redhat.com>
 <20210505130716.1128420-5-kraxel@redhat.com>
 <20210505132910.myokkgilp4md6jit@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210505132910.myokkgilp4md6jit@gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 03:29:10PM +0200, Remy Noel wrote:
> On Wed, May 05, 2021 at 03:07:14PM +0200, Gerd Hoffmann wrote:
> > [...]
> > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > index 17f06f34179a..6a75b0dc4ab2 100644
> > --- a/hw/usb/redirect.c
> > +++ b/hw/usb/redirect.c
> > @@ -620,7 +620,7 @@ static void usbredir_handle_iso_data(USBRedirDevice *dev, USBPacket *p,
> >                 .endpoint = ep,
> >                 .length = p->iov.size
> >             };
> > -            uint8_t buf[p->iov.size];
> > +            g_autofree uint8_t *buf = g_malloc(p->iov.size);
> >             /* No id, we look at the ep when receiving a status back */
> >             usb_packet_copy(p, buf, p->iov.size);
> >             usbredirparser_send_iso_packet(dev->parser, 0, &iso_packet,
> > @@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
> >         usbredirparser_send_bulk_packet(dev->parser, p->id,
> >                                         &bulk_packet, NULL, 0);
> >     } else {
> > -        uint8_t buf[size];
> > +        g_autofree uint8_t *buf = g_malloc(size);
> >         usb_packet_copy(p, buf, size);
> 
> Won't this allows us to malloc then write an arbitrary amount of heap
> memory, allowing a guest driver to abort the qemu ?

Crashing qemu is not as easy as with stack allocation, but yes, unbound
allocation is still there.  Need to figure some way to limit this in
xhci without breaking things.

Or maybe use g_try_malloc() and catch allocation failures.

Alternatively we could add a usbredirparser_send_bulk_packet_iov()
function to usbredir so we can just pass on the iov and don't need a
temporary buffer in the first place.

Not sure yet what the best way forward is.
Comments (and other ideas) are welcome.

take care,
  Gerd


