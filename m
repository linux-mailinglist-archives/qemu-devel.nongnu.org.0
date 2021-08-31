Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FF3FCC75
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:42:05 +0200 (CEST)
Received: from localhost ([::1]:56824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7lk-0002QR-4r
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7j0-0008Qf-0N
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7iw-00036w-Vk
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630431541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlVQ3nBsIFxxoN2gippqMaLmH2KDNwSrPKf58w462fQ=;
 b=HXu+zJ+AhLVnvX9zpyUfFaiqgbLneFfuGr/bpp2JbNsvgOBy3dNn8PbX2wLUEyCFfv6W+p
 efOfCNNeOLzF7BYPLOw1pfvTEeCSa1TXVYCYEWMhCiZ4sOScr7lh39FCU8PwODvEmu7qQL
 QYejczds2PSYhvqSTmTazLAjHxmXmLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-sjvDiIVtNk-THRitfE00IQ-1; Tue, 31 Aug 2021 13:39:00 -0400
X-MC-Unique: sjvDiIVtNk-THRitfE00IQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DE0E87D543;
 Tue, 31 Aug 2021 17:38:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F715C1A1;
 Tue, 31 Aug 2021 17:38:54 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:38:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: qemu-sockets: account for trailing \0 byte in unix socket pathname
Message-ID: <YS5pLKxTjguyUAlR@redhat.com>
References: <20210830225449.1509719-1-mjt@msgid.tls.msk.ru>
 <c5887473-1df2-5827-e9c7-e6f0470ab332@msgid.tls.msk.ru>
 <CAMxuvawU2d6fFBczkDcPAJzYP4dSoin7UnesX2idHfd1WAyTOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvawU2d6fFBczkDcPAJzYP4dSoin7UnesX2idHfd1WAyTOA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 09:22:01PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Aug 31, 2021 at 9:17 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
> 
> > 31.08.2021 01:54, Michael Tokarev wrote:
> > > Linux kernel can return size of af_unix socket to be
> > > one byte larger than sockaddr_un structure - adding
> > > the trailing zero byte.
> > >
> > > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > > Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
> > > Cc: qemu-stable@nongnu.org
> > >
> > > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > > index f2f3676d1f..83926dc2bc 100644
> > > --- a/util/qemu-sockets.c
> > > +++ b/util/qemu-sockets.c
> > > @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct
> > sockaddr_storage *sa,
> > >       SocketAddress *addr;
> > >       struct sockaddr_un *su = (struct sockaddr_un *)sa;
> > >
> > > +    /* kernel might have added \0 terminator to non-abstract socket */
> > >       assert(salen >= sizeof(su->sun_family) + 1 &&
> > > -           salen <= sizeof(struct sockaddr_un));
> > > +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 :
> > 0);
> > >
> > >       addr = g_new0(SocketAddress, 1);
> > >       addr->type = SOCKET_ADDRESS_TYPE_UNIX;
> >
> > Actually, this is not sufficient.
> >
> > While this change fixes one issue (the famous trailing null byte \0),
> > the actual assertion failure occurs because salen = 2, ie, too SMALL,
> > not too large.
> >
> > So it looks like libvirt provides an unnamed socket there, --
> > maybe from a socketpair(2)?
> >
> 
> Yes

No, libvirt binds to a named socket path and passes in a pre-opened
FD for the listener socket. There shouldn't be any socketpair involved.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


