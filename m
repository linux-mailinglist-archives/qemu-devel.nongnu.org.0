Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7F2DBF3C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:14:21 +0100 (CET)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpUlA-0008PE-4k
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUjp-0007xa-Nl
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpUjn-0005Fh-Bz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608117174;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jm8BXxaF+xaTS8wsfjDfaxPUFM8OLPKVCVAlUIN52dQ=;
 b=gyiwdv/qxRqjsKllE/TyFoMHSzoGILdFfHV2PBWj56MSWXRiEFIBwiogFr2uZoAsJnHZC0
 R5PiBw4q3gzqYp3q67AlYuQosJUfcrHqfUiXnoMmRNAXORafS2cOq27NizXpOPWvcUp1Xx
 D/Ev+qUfWfq+UcHsdWHPL7wwh9dmxYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-nwEQnt-aNzOzHFrN2EETgA-1; Wed, 16 Dec 2020 06:12:50 -0500
X-MC-Unique: nwEQnt-aNzOzHFrN2EETgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347C1192D787
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:12:49 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A3F318017;
 Wed, 16 Dec 2020 11:12:44 +0000 (UTC)
Date: Wed, 16 Dec 2020 11:12:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 8/9] vnc: add support for extended desktop resize
Message-ID: <20201216111242.GG189795@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
 <20201208115737.18581-9-kraxel@redhat.com>
 <20201208181328.GW3136942@redhat.com>
 <20201215101503.obaq7ycm2zdxcnq5@sirius.home.kraxel.org>
 <20201215102040.GH121272@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201215102040.GH121272@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 10:20:40AM +0000, Daniel P. Berrangé wrote:
> On Tue, Dec 15, 2020 at 11:15:03AM +0100, Gerd Hoffmann wrote:
> > On Tue, Dec 08, 2020 at 06:13:28PM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Dec 08, 2020 at 12:57:36PM +0100, Gerd Hoffmann wrote:
> > > > The extended desktop resize encoding adds support for (a) clients
> > > > sending resize requests to the server, and (b) multihead support.
> > > > 
> > > > This patch implements (a).  All resize requests are rejected by qemu.
> > > > Qemu can't resize the framebuffer on its own, this is in the hands of
> > > > the guest, so all qemu can do is forward the request to the guest.
> > > > Should the guest actually resize the framebuffer we can notify the vnc
> > > > client later with a separate message.
> > > > 
> > > > This requires support in the display device.  Works with virtio-gpu.
> > > > 
> > > > https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddesktopsize-pseudo-encoding
> > > 
> > > The spec says
> > > 
> > >    "The server must send an ExtendedDesktopSize rectangle in response 
> > >     to a FramebufferUpdateRequest with incremental set to zero, assuming
> > >     the client has requested the ExtendedDesktopSize pseudo-encoding 
> > >     using the SetEncodings message. This requirement is needed so that
> > >     the client has a reliable way of fetching the initial screen 
> > >     configuration, and to determine if the server supports the 
> > >     SetDesktopSize message.
> > > 
> > >     A consequence of this is that a client must not respond to an
> > >     ExtendedDesktopSize rectangle by sending a FramebufferUpdateRequest
> > >     with incremental set to zero. Doing so would make the system go into
> > >     an infinite loop."
> > > 
> > > Historically gtk-vnc always sets incremental=0 after a resize message,
> > > so it should trigger an infinite loop. This doesn't happen with QEMU's
> > > impl, so I think QEMU isn't correctly following the sec here. IIUC,
> > > tt needs to force send an ExtendedDesktopSize message every time
> > > incremental=0, not merely when a resize happens.
> > 
> > There are three cases where qemu sends an ExtendedDesktopSize message:
> > 
> >   (1) during the initial handshake (to cover the feature detection).
> >   (2) as response to a SetDesktopSize request, and
> >   (3) when an resize happens.
> > 
> > So, yes, I skimmed the spec a bit to fast and didn't implement it
> > correctly.  Which also explains why you can't trigger the infinite
> > loop issue.
> > 
> > > Having said that, I find this part of the spec rather crazy. I dont
> > > see why clients need more than the first ExtendedDesktopSize message
> > > in order to detect the feature, rather than after every single
> > > incremental=0 update request.
> > 
> > Yes, it doesn't make much sense.
> > 
> > > None the less the spec says we should get an infinite loop and with
> > > my intentional attempt to cause this, QEMU doesn't play ball.
> > 
> > Not fully sure I should consider this a bug or a feature.
> > This patch doesn't conform to the spec.
> > But it clearly is more robust ...
> 
> I'm going to propose a spec change and see what response it gets

I ended up opening an issue to query the spec instead:

  https://github.com/rfbproto/rfbproto/issues/37


Also, I've proposed a spec update to make the interaction between
ExtendedDesktopSize and WMVi encodings explicit:

   https://github.com/rfbproto/rfbproto/pull/36

QEMU is already  in compliance with this clarification, I just wanted
to make it explicitly required.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


