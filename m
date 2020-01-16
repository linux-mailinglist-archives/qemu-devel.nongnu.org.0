Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6B413E028
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 17:33:45 +0100 (CET)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is85Y-0000wz-G1
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 11:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1is84Y-0000T1-Rz
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:32:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1is84W-0000IA-Vd
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:32:41 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56349
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1is84W-0000Hh-Rr
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:32:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579192359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LtN29V+J/ho1IXwkyPMlW1DGGCsp7UZLt6XefJEdk+M=;
 b=Kpgg2R2yVvRHvLkRAa3cqnMyFHW2Vbx4DMcNZyQnF+hAAm5sos9sdlFsgrANLRIAYysHNw
 GzmMwvDscPC1x/IauoAFZsfYhbu3hXGfq66qsJtY3XBJxnoa1iR75ligjzyKJklvYJaseJ
 kZIXXUiuACqlmDLeYpULg0mCPiKYndc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-2ZlAi75AOT-g7DnGqOI54g-1; Thu, 16 Jan 2020 11:32:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 266691800D48;
 Thu, 16 Jan 2020 16:32:37 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7338D858B4;
 Thu, 16 Jan 2020 16:32:33 +0000 (UTC)
Date: Thu, 16 Jan 2020 16:32:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Subject: Re: [PATCH 095/104] virtiofsd: convert more fprintf and perror to
 use fuse log infra
Message-ID: <20200116163230.GI3108@work-vm>
References: <20191212163904.159893-96-dgilbert@redhat.com>
 <20200116122930.23078-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20200116122930.23078-1-misono.tomohiro@jp.fujitsu.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 2ZlAi75AOT-g7DnGqOI54g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Misono Tomohiro (misono.tomohiro@jp.fujitsu.com) wrote:
> > From: Eryu Guan <eguan@linux.alibaba.com>
> >=20
> > Signed-off-by: Eryu Guan <eguan@linux.alibaba.com>
> > ---
> >  tools/virtiofsd/fuse_signals.c | 6 +++++-
> >  tools/virtiofsd/helper.c       | 9 ++++++---
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tools/virtiofsd/fuse_signals.c b/tools/virtiofsd/fuse_sign=
als.c
> > index 10a6f88088..edabf24e0d 100644
> > --- a/tools/virtiofsd/fuse_signals.c
> > +++ b/tools/virtiofsd/fuse_signals.c
> > @@ -11,6 +11,7 @@
> >  #include "fuse_i.h"
> >  #include "fuse_lowlevel.h"
> > =20
> > +#include <errno.h>
> >  #include <signal.h>
> >  #include <stdio.h>
> >  #include <stdlib.h>
> > @@ -46,12 +47,15 @@ static int set_one_signal_handler(int sig, void (*h=
andler)(int), int remove)
> >      sa.sa_flags =3D 0;
> > =20
> >      if (sigaction(sig, NULL, &old_sa) =3D=3D -1) {
> > -        perror("fuse: cannot get old signal handler");
> > +        fuse_log(FUSE_LOG_ERR, "fuse: cannot get old signal handler: %=
s\n",
> > +                 strerror(errno));
> >          return -1;
> >      }
> > =20
> >      if (old_sa.sa_handler =3D=3D (remove ? handler : SIG_DFL) &&
> >          sigaction(sig, &sa, NULL) =3D=3D -1) {
> > +        fuse_log(FUSE_LOG_ERR, "fuse: cannot set signal handler: %s\n"=
,
> > +                 strerror(errno));
>=20
> I notice one perror is remaining:
> >          perror("fuse: cannot set signal handler");

Oops,  Removed.

> other than that,
> Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Thanks.

>=20
> >          return -1;
> >      }
> > diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
> > index 7b28507a38..bcb8c05063 100644
> > --- a/tools/virtiofsd/helper.c
> > +++ b/tools/virtiofsd/helper.c
> > @@ -200,7 +200,8 @@ int fuse_daemonize(int foreground)
> >          char completed;
> > =20
> >          if (pipe(waiter)) {
> > -            perror("fuse_daemonize: pipe");
> > +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: pipe: %s\n",
> > +                     strerror(errno));
> >              return -1;
> >          }
> > =20
> > @@ -210,7 +211,8 @@ int fuse_daemonize(int foreground)
> >           */
> >          switch (fork()) {
> >          case -1:
> > -            perror("fuse_daemonize: fork");
> > +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: fork: %s\n",
> > +                     strerror(errno));
> >              return -1;
> >          case 0:
> >              break;
> > @@ -220,7 +222,8 @@ int fuse_daemonize(int foreground)
> >          }
> > =20
> >          if (setsid() =3D=3D -1) {
> > -            perror("fuse_daemonize: setsid");
> > +            fuse_log(FUSE_LOG_ERR, "fuse_daemonize: setsid: %s\n",
> > +                     strerror(errno));
> >              return -1;
> >          }
> > =20
> > --=20
> > 2.23.0
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


