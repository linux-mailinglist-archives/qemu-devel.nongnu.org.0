Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B99964A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:21:06 +0200 (CEST)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nxZ-0007dw-6O
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1i0nw1-0006Sl-3h
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:19:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1i0nvz-00078q-Tl
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:19:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1i0nvx-00077n-A0; Thu, 22 Aug 2019 10:19:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9DCAF10C6960;
 Thu, 22 Aug 2019 14:19:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E1688FD;
 Thu, 22 Aug 2019 14:19:22 +0000 (UTC)
Date: Thu, 22 Aug 2019 15:19:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190822141920.GU3267@redhat.com>
References: <20190820104836.3093-1-quintela@redhat.com>
 <20190820104836.3093-2-quintela@redhat.com>
 <20190820105034.GG23352@redhat.com> <87mug4xezc.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mug4xezc.fsf@trasno.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 22 Aug 2019 14:19:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/5] socket: Add backlog parameter to
 socket_listen
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 20, 2019 at 01:17:59PM +0200, Juan Quintela wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > On Tue, Aug 20, 2019 at 12:48:32PM +0200, Juan Quintela wrote:
> >> Current parameter was always one.  We continue with that value for n=
ow
> >> in all callers.
> >>=20
> >> Signed-off-by: Juan Quintela <quintela@redhat.com>
> >>=20
> >> ---
> >> Moved trace to socket_listen
> >> ---
> >>  include/qemu/sockets.h    |  2 +-
> >>  io/channel-socket.c       |  2 +-
> >>  qga/channel-posix.c       |  2 +-
> >>  tests/test-util-sockets.c | 12 ++++++------
> >>  util/qemu-sockets.c       | 33 ++++++++++++++++++++++-----------
> >>  util/trace-events         |  3 +++
> >>  6 files changed, 34 insertions(+), 20 deletions(-)
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>=20
> Hi
>=20
> Everything is reviewed by you, and it is mostly socket code.  Should I
> do the pull request, or are you doing it?

I'm fine if you want to send a PR, since this is ultimately about
fixing migration problems.


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

