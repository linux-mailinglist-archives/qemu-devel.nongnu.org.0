Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5A0195D31
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 18:53:44 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHtAt-0005KP-Q9
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 13:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jHt5G-0003jI-PN
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jHt5F-0005Ow-0h
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:47:54 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:56444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jHt5E-0005ME-So
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585331272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyga5obXmtc3I50IueSDa8L2rkgqVdsgrs+uCszs/QE=;
 b=KSwektmyDK6C+se39HAZLu1YQtQIMXk0koPAT+KVU/9J/SM6qeqwtM2FqjGD/MjKoe6Crp
 nI4dg/pTHlxf3CavLBsVAjgm+zJnrK4jntqGkNRtChLLV/w7xEd3TqJJpARME/yAtRttCc
 x4eZnnQ1iACb9i2fkwPg69m//6trtmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-tFWlEfo0Ov2eE7vxybtTcQ-1; Fri, 27 Mar 2020 13:47:50 -0400
X-MC-Unique: tFWlEfo0Ov2eE7vxybtTcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0CD6149C0;
 Fri, 27 Mar 2020 17:47:49 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5425D60BF3;
 Fri, 27 Mar 2020 17:47:45 +0000 (UTC)
Date: Fri, 27 Mar 2020 17:47:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 3/3] nbd: Use shutdown(SHUT_WR) after last item sent
Message-ID: <20200327174742.GU1619@redhat.com>
References: <20200327161936.2225989-1-eblake@redhat.com>
 <20200327161936.2225989-4-eblake@redhat.com>
 <20200327163548.GP1619@redhat.com>
 <4a56f56e-60b8-6b1f-f805-31a192eb6148@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4a56f56e-60b8-6b1f-f805-31a192eb6148@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 27, 2020 at 12:42:21PM -0500, Eric Blake wrote:
> On 3/27/20 11:35 AM, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Mar 27, 2020 at 11:19:36AM -0500, Eric Blake wrote:
> > > Although the remote end should always be tolerant of a socket being
> > > arbitrarily closed, there are situations where it is a lot easier if
> > > the remote end can be guaranteed to read EOF even before the socket
> > > has closed.  In particular, when using gnutls, if we fail to inform
> > > the remote end about an impending teardown, the remote end cannot
> > > distinguish between our closing the socket as intended vs. a maliciou=
s
> > > intermediary interrupting things, and may result in spurious error
> > > messages.
> >=20
> > Does this actually matter in the NBD case ?
> >=20
> > It has an explicit NBD command for requesting shutdown, and once
> > that's processed, it is fine to just close the socket abruptly - I
> > don't see a benefit to a TLS shutdown sequence on top.
>=20
> You're right that the NBD protocol has ways for the client to advertise i=
t
> will be shutting down, AND documents that the server must be robust to
> clients that just abruptly disconnect after that point.  But we don't hav=
e
> control over all such servers, and there may very well be a server that l=
ogs
> an error on abrupt closure, where it would be silent if we did a proper
> gnutls_bye.  Which is more important: maximum speed in disconnecting afte=
r
> we expressed intent, or maximum attempt at catering to all sorts of remot=
e
> implementations that might not be as tolerant as qemu is of an abrupt
> termination?

It is the cost / benefit tradeoff here that matters. Correctly using
gnutls_bye(), in contexts which aren't expected to block is non-trivial
bringing notable extra code complexity. It isn't an obvious win to me
for something that just changes an error message for a scenario that
can already be cleanly handled at the application protocol level.

>=20
> > AFAIK, the TLS level clean shutdown is only required if the
> > application protocol does not have any way to determine an
> > unexpected shutdown itself.
>=20
> 'man gnutls_bye' states:
>=20
>        Note that not all implementations will properly terminate a TLS
> connec=E2=80=90
>        tion.   Some  of  them, usually for performance reasons, will
> terminate
>        only the  underlying  transport  layer,  and  thus  not
> distinguishing
>        between  a  malicious  party prematurely terminating the connectio=
n
> and
>        normal termination.
>=20
> You're right that because the protocol has an explicit message, we can
> reliably distinguish any early termination prior to
> NBD_OPT_ABORT/NBD_CMD_DISC as being malicious, so the only case where it
> matters is if we have a premature termination after we asked for clean
> shutdown, at which point a malicious termination didn't lose any data. So=
 on
> that front, I guess you are right that not using gnutls_bye isn't going t=
o
> have much impact.
>=20
> >=20
> > This is relevant for HTTP where the connection data stream may not
> > have a well defined end condition.
> >=20
> > In the NBD case though, we have an explicit NBD_CMD_DISC to trigger
> > the disconnect. After processing that message, an EOF is acceptable
> > regardless of whether ,
> > before processing that message, any EOF is a unexpected.
> >=20
> > >            Or, we can end up with a deadlock where both ends are stuc=
k
> > > on a read() from the other end but neither gets an EOF.
> >=20
> > If the socket has been closed abruptly why would it get stuck in
> > read() - it should see EOF surely ?
>=20
> That's what I'm trying to figure out: the nbdkit testsuite definitely hun=
g
> even though 'qemu-nbd --list' exited, but I haven't yet figured out wheth=
er
> the bug lies in nbdkit proper or in libnbd, nor whether a cleaner tls
> shutdown would have prevented the hang in a more reliable manner.
> https://www.redhat.com/archives/libguestfs/2020-March/msg00191.html


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


