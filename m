Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A021F8D6A3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 16:53:02 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxue5-0002MJ-OJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 10:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <abologna@redhat.com>) id 1hxud6-0001sI-7V
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1hxud5-0006AZ-1F
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 10:52:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35522)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1hxud1-00069W-EF; Wed, 14 Aug 2019 10:51:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C074E91772;
 Wed, 14 Aug 2019 14:51:54 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF1E806AD;
 Wed, 14 Aug 2019 14:51:50 +0000 (UTC)
Message-ID: <9becb1b8d13703740411ae0e1e6e0580fe6a1bc7.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,  "Richard
 W . M . Jones" <rjones@redhat.com>, qemu-devel@nongnu.org, Pino Toscano
 <ptoscano@redhat.com>
Date: Wed, 14 Aug 2019 16:51:48 +0200
In-Reply-To: <ca03335f-55a1-322f-401d-a02a2d115b66@redhat.com>
References: <20190814121527.17876-1-philmd@redhat.com>
 <20190814121527.17876-3-philmd@redhat.com>
 <4876e26ccda980f45e0ad1492097a66b07fe65de.camel@redhat.com>
 <ca03335f-55a1-322f-401d-a02a2d115b66@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 14 Aug 2019 14:51:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/4] configure: Avoid using libssh
 deprecated API
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?=E5=91=A8=E6=96=87=E9=9D=92?= <1151451036@qq.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-08-14 at 16:15 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> On 8/14/19 3:27 PM, Andrea Bolognani wrote:
> > On Wed, 2019-08-14 at 14:15 +0200, Philippe Mathieu-Daud=C3=A9 wrote:
> > > The libssh packaged by a distribution can predate version 0.8,
> > > but still provides the newer API introduced after version 0.7.
> > >=20
> > > Using the deprecated API leads to build failure, as on Ubuntu 18.04=
:
> > >=20
> > >     CC      block/ssh.o
> > >   block/ssh.c: In function 'check_host_key_hash':
> > >   block/ssh.c:444:5: error: 'ssh_get_publickey' is deprecated [-Wer=
ror=3Ddeprecated-declarations]
> > >        r =3D ssh_get_publickey(s->session, &pubkey);
> > >        ^
> > >   In file included from block/ssh.c:27:0:
> > >   /usr/include/libssh/libssh.h:489:31: note: declared here
> > >    SSH_DEPRECATED LIBSSH_API int ssh_get_publickey(ssh_session sess=
ion, ssh_key *key);
> > >                                  ^~~~~~~~~~~~~~~~~
> > >   rules.mak:69: recipe for target 'block/ssh.o' failed
> > >   make: *** [block/ssh.o] Error 1
> > >=20
> > > Fix by using the newer API if available.
> > >=20
> > > Suggested-by: Andrea Bolognani <abologna@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > > ---
> > >  block/ssh.c | 2 +-
> > >  configure   | 7 +++++++
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> >=20
> > Did I really suggest this? I have no recollection of doing so, or
> > even getting involved with libssh support in QEMU at all for that
> > matter.
>=20
> I took this suggestion from
> https://www.redhat.com/archives/libvir-list/2018-May/msg00597.html

I see :)

I feel like adding a Suggested-by because of something that was
posted on an unrelated project's mailing list is stretching the
definition of the tag a bit, so if you end up having to respin I
think it would be reasonable to drop it, but honestly it's not a
big deal either way: I was just curious.

--=20
Andrea Bolognani / Red Hat / Virtualization


