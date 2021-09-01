Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1813FD91B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:59:37 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOu0-0005KD-TP
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLOsH-0002yw-8Q
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLOsD-0006fY-Nq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630497465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6pBIT0zXhxQ16SQHior1IkenhPusWaJDwqei+HG6b0M=;
 b=A48ZQx7MNY6A/TX3HylgB6LaDBpwOTjaUDmZl71VugyYfk7pf8cgaGRmfjNqgqagyQYi94
 h9GWh6rovTLDvgT1L6ChUN9CkghRjdq60f9PzSt6sTfaKbT0lVikZkaVi/dH3HXOf1Lm1S
 HRqSzTMpQ2r+NitQvXE/T0uKNprIAMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-8VuQk57fNm6nv030t_8Hsw-1; Wed, 01 Sep 2021 07:57:39 -0400
X-MC-Unique: 8VuQk57fNm6nv030t_8Hsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E248107ACC7;
 Wed,  1 Sep 2021 11:57:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0A2610027C4;
 Wed,  1 Sep 2021 11:57:33 +0000 (UTC)
Date: Wed, 1 Sep 2021 12:57:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
Message-ID: <YS9qq0jnjMkr6/iy@redhat.com>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
 <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 11:29:58AM +0300, Michael Tokarev wrote:
> On 31.08.2021 22:47, Peter Maydell wrote:
> > On Tue, 31 Aug 2021 at 19:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
> ..
> > > -    assert(salen >= sizeof(su->sun_family) + 1 &&
> > > -           salen <= sizeof(struct sockaddr_un));
> > > +    /* there's a corner case when trailing \0 does not fit into
> > > +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
> > > +     * not with sizeof(sockaddr_un), since this is what we actually
> > > +     * provide, to ensure we had no truncation and a room for
> > > +     * the trailing \0 which we add below.
> > > +     * When salen == sizeof(sun_family) it is unnamed socket,
> > > +     * and when first byte of sun_path is \0, it is abstract. */
> > > +    assert(salen >= sizeof(su->sun_family) &&
> > > +           salen <= sizeof(struct sockaddr_storage));
> > 
> > Again, why are we asserting an upper bound? We don't care here:
> > the representation in the SocketAddress structure has no length
> > limit on the path. (Conversely, we do care about the max length
> > when we convert from a SocketAddress to a sockaddr_un: we do this
> > in eg unix_connect_saddr().)
> 
> We have sizeof(sockaddr_storage) space there. If the kernel returned
> salen greather than that, this means we received only partial address
> and can't rely on it. It is like snprintf() returning more bytes than
> available in the buffer - it says how much bytes NEEDED.

The salen parameter to 'accept' / 'getsockname' etc is caller
supplied and indicates how long the buffer provided is. The
kernel updates the value on success, but the updated vaue
will never exceed the input value. According to the manpage
if salen only allows sizeof(struct sockaddr_un), then the
returned data will simply not be NUL-terminated.

I'm increasingly inclined to agree with Peter though, we should
just not try to do this assert because it isn't adding value.
We have a trust relationship with the kernel and so can assume
salen values it gives us are correct. We only need to assert
if we're validating an assumption that we're making ourselves,
that isn't otherwise guaranteed by the kernel API semantics.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


