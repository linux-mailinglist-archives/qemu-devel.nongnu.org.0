Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAA23FD645
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:13:43 +0200 (CEST)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMJT-0007K9-2l
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLMId-0006Ov-2B
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:12:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLMIb-00011a-9Q
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630487568;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arAcqMy1cemMgEou4+KLGEWLhvH0jbOU0SSNr2Qt7o0=;
 b=GBnLm6CgMCAAUAqz1/3tfXJmgGmXyZ4pRAEpearzF6KVhy1Jucjo4aQigqcWAwO2havrCd
 6zild9mVBEHoT4Gz9Xa/Wy0gnxk6uWWMwI4JpIWCHg39ARD1VC55ITiiWanqreJfsPIu36
 Ge7nxMUuKxTgAwvTQ8L2wYpcIDye/dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-PMQLAzMhMoiN_k7kyymxeA-1; Wed, 01 Sep 2021 05:12:40 -0400
X-MC-Unique: PMQLAzMhMoiN_k7kyymxeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04A7107ACCA;
 Wed,  1 Sep 2021 09:12:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9408C60CC9;
 Wed,  1 Sep 2021 09:12:34 +0000 (UTC)
Date: Wed, 1 Sep 2021 10:12:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
Message-ID: <YS9EAOX4g7zIjxhp@redhat.com>
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvayrgXYBU0dcmmO2=Po1fBLFugxP7JS7KrR83iVQZE9fKg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 11:21:43PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 31, 2021 at 10:26 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
> 
> > We test whenever the path of unix-domain socket
> > address is non-empty and strictly-less than
> > the length of the path buffer. Both these
> > conditions are wrong: the socket can be unnamed,
> > with empty path, or socket can have pathname
> > null-terminated _after_ the sun_path buffer,
> > since we provided more room when asking kernel.
> >
> > So on one side, allow empty, unnamed sockets
> > (and adjust the test for abstract socket too -
> > only do that if the socket is not unnamed),
> > and on another side, allow path length to be
> > up to our own maximum, - we have up to size
> > of sockaddr_storage there.
> >
> > While at it, fix the duplication of regular
> > pathname socket to not require trailing \0
> > (since it can be missing for unnamed sockets).
> >
> > Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> > Fixes: http://bugs.debian.org/993145
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > Cc: qemu-stable@nongnu.org
> > --
> > Two questions.
> > 1. Why do we store the name of the socket to start with?
> > 2. The code in the abstract socket case should not use
> >    g_strndup but g_memdup instead, since the whole thing
> >    is a blob of the given length, not a \0-terminated string.
> > ---
> >  util/qemu-sockets.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index f2f3676d1f..7c83d81792 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1345,13 +1345,20 @@ socket_sockaddr_to_address_unix(struct
> > sockaddr_storage *sa,
> >      SocketAddress *addr;
> >      struct sockaddr_un *su = (struct sockaddr_un *)sa;
> >
> > -    assert(salen >= sizeof(su->sun_family) + 1 &&
> > -           salen <= sizeof(struct sockaddr_un));
> > +    /* there's a corner case when trailing \0 does not fit into
> > +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
> > +     * not with sizeof(sockaddr_un), since this is what we actually
> > +     * provide, to ensure we had no truncation and a room for
> > +     * the trailing \0 which we add below.
> > +     * When salen == sizeof(sun_family) it is unnamed socket,
> > +     * and when first byte of sun_path is \0, it is abstract. */
> > +    assert(salen >= sizeof(su->sun_family) &&
> > +           salen <= sizeof(struct sockaddr_storage));
> >
> 
> Seems right to me, however there are some notes in libc bits/socket.h
> /* Structure large enough to hold any socket address (with the historical
>    exception of AF_UNIX).  */
> 
> And also this
> https://idea.popcount.org/2019-12-06-addressing/#fn:sockaddr_storage
> 
> I must say I feel confused by those comments :) Is it large enough or not??

From 'man unix(7)'

       When  binding a socket to an address, Linux is one of the im‐
       plementations that appends a null terminator if none is  sup‐
       plied in sun_path.  In most cases this is unproblematic: when
       the socket address is retrieved, it will be one  byte  longer
       than that supplied when the socket was bound.  However, there
       is one case where confusing behavior can result: if 108  non-
       null  bytes are supplied when a socket is bound, then the ad‐
       dition of the null terminator takes the length of  the  path‐
       name  beyond sizeof(sun_path).  Consequently, when retrieving
       the socket address (for example, via accept(2)), if the input
       addrlen  argument  for  the  retrieving  call is specified as
       sizeof(struct sockaddr_un), then the returned address  struc‐
       ture won't have a null terminator in sun_path.

Essentially this is saying that if the kernel allocates the
sockaddr_un buffer, it will have intentionally *over-allocated*
by 1 byte.  So you can't assume salen <= sizeof(sockaddr_un)
nor  salen <= sizeof(sockadr_storage) unless *you* have allocated
the sockaddr buffer.

In this context of QEMU, I don't know whether the addr buffer
we dealing with was allocated by QEMU or the kernel, if the
former, then we're safe in terms of size, but cannot assume
NUL terminator.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


