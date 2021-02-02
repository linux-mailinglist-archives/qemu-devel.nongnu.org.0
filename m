Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F260C30BE62
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:41:38 +0100 (CET)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uzy-0003MA-22
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6uxI-0002gf-Po
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:38:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ux9-00052u-OJ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612269521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=cWRpikc6AOB8AnZxIX6wCkwg+5moeuAxfPRxXAJOLE8=;
 b=jWK7wEHyjaTqRQMraGLcWsytGXg8HiMf/WTM0nU3Ap98cUvRCWt4dfYE3WZZUlJF3XSK1B
 r035o82sCH98i8pXD8Y6CKrnBQvFIv8vjHdfgOv8jAo9hcJsC6RVn6fatJfS70/XklGYEY
 U/J4h45U0e5+FpqPpbLiO2rMA883p88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-DBttNQvJNmCKv8EUzVuKvg-1; Tue, 02 Feb 2021 07:38:38 -0500
X-MC-Unique: DBttNQvJNmCKv8EUzVuKvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F26C31020C28;
 Tue,  2 Feb 2021 12:38:36 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C789C5C232;
 Tue,  2 Feb 2021 12:38:31 +0000 (UTC)
Date: Tue, 2 Feb 2021 12:38:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: vnc clipboard support
Message-ID: <20210202123829.GF4168502@redhat.com>
References: <20210129143252.GE4008275@redhat.com>
 <05C58667-D9BA-49E2-897D-2286B243E802@redhat.com>
 <20210201155116.GL4131462@redhat.com>
 <0C14700F-CF47-4CD1-AB41-AA69BC0DA469@redhat.com>
 <20210201165634.GM4131462@redhat.com>
 <D704948F-96C7-441F-BCA3-F848ABFD8087@redhat.com>
 <20210201174018.GP4131462@redhat.com>
 <8456ae54-b737-fa7d-cac8-75cd701f9ef5@eik.bme.hu>
 <20210202113144.jrmqtgllpgd2nw2h@sirius.home.kraxel.org>
 <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <e3598537-86af-6cf7-bdfe-eac43bce0f2@eik.bme.hu>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Christophe de Dinechin <cdupontd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 01:31:23PM +0100, BALATON Zoltan wrote:
> On Tue, 2 Feb 2021, Gerd Hoffmann wrote:
> > > > My preferred solution is to have QEMU leverage the existing SPICE
> > > > guest agent if at all possible, because that's already widely
> > > > available in existing guest OS.
> > > 
> > > I think spice is not as widely available as VNC (or even Synergy) so the
> > > idea to strip one of those down to just a guest clipboard agent would help
> > > to get support to the most guests.
> > 
> > Well, we can use the spice agent as-is, then just let it talk to qemu
> > instead of spice client.  No need to code anything on the guest side,
> > and the (guest) code packaged up in distros will just work.
> > 
> > > QEMU already knows about VNC so might be the simplest way and you
> > > could reuse all kinds of VNC client and server code for the guest
> > > agent and also make it easy for others to add support for their
> > > guests.
> > 
> > Something vnc-ish doesn't look like a good plan to me.  When coding up
> > something new I'd go model the protocol after something more modern like
> > wayland.  When reusing something existing the spice-agent protocol looks
> > best as most existing linux guests already support it.
> 
> Is there anything the vnc protocol lacks over more modern ones that would be
> needed? I don't know what wayland does. Just because vnc is old it could be
> sufficient but I have no strong preference for any of these, just wanted to
> say that reusing something that's available on the most guests would make it
> work for most people with the least effort and vnc is quite widely
> available.

The VNC protocol is way too crude. It is limited to transferring
plain text, and provides no way to specify or negotiate a character
set. The RFB spec says apps should use latin-1. In reality few, if any,
impls do charset conversion so most Linux impls will be sending UTF8
while Windows impls will be sending Windows Codepage 1252. It clearly
shows its heritage of being designed in the 1990s.

Essentially any other protocol relating to clipboard that postdates
RFB will be better.

I expect that once we figure out what we want todo with clipboard
for the QEMU <-> guest communication, then we'll end up wanting to
write a RFB protocol extension to define a better VNC clipboard
protocol that has the modern features people expect.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


