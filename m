Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0A3FE07D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:58:00 +0200 (CEST)
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTYl-0001fH-7e
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLT9j-0001on-9l
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:32:07 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLT9g-0005EF-V8
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 12:32:06 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-DPTLuc4wMZ-VURy1eRGPLQ-1; Wed, 01 Sep 2021 12:32:02 -0400
X-MC-Unique: DPTLuc4wMZ-VURy1eRGPLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D1887D542;
 Wed,  1 Sep 2021 16:32:01 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C675A19C79;
 Wed,  1 Sep 2021 16:32:00 +0000 (UTC)
Date: Wed, 1 Sep 2021 18:31:59 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs: Twalk crash
Message-ID: <20210901183159.09d9119c@bahia.lan>
In-Reply-To: <3500709.Usqnbg2EYA@silver>
References: <4325838.qn0ATYcOi1@silver> <1825588.ABy5TKrSrS@silver>
 <20210901174102.715b3169@bahia.lan> <3500709.Usqnbg2EYA@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 01 Sep 2021 18:07:39 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 1. September 2021 17:41:02 CEST Greg Kurz wrote:
> > On Wed, 01 Sep 2021 16:21:06 +0200
> >=20
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > On Mittwoch, 1. September 2021 14:49:37 CEST Christian Schoenebeck wr=
ote:
> > > > > > And it triggered, however I am not sure if some of those functi=
ons I
> > > > > > asserted above are indeed allowed to be executed on a different
> > > > > > thread
> > > > > > than main thread:
> > > > > >=20
> > > > > > Program terminated with signal SIGABRT, Aborted.
> > > > > > #0  __GI_raise (sig=3Dsig@entry=3D6) at
> > > > > > ../sysdeps/unix/sysv/linux/raise.c:50
> > > > > > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or
> > > > > > directory.
> > > > > > [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
> > > > >=20
> > > > > Based in the thread number, it seems that the signal was raised b=
y
> > > > > the main event thread...
> > > >=20
> > > > No, it was not main thread actually, gdb's "current thread is 1" ou=
tput
> > > > is
> > > > misleading.
> > > >=20
> > > > Following the thread id trace, I extended the thread assertion chec=
ks
> > > > over
> > > > to v9fs_walk() as well, like this:
> > > >=20
> > > > static void coroutine_fn v9fs_walk(void *opaque)
> > > > {
> > > >=20
> > > >     ...
> > > >     assert_thread();
> > > >     v9fs_co_run_in_worker({
> > > >    =20
> > > >         ...
> > > >    =20
> > > >     });
> > > >     assert_thread();
> > > >     ...
> > > >=20
> > > > }
> > > >=20
> > > > and made sure the reference thread id to be compared is really the =
main
> > > > thread.
> > > >=20
> > > > And what happens here is before v9fs_co_run_in_worker() is entered,
> > > > v9fs_walk() runs on main thread, but after returning from
> > > > v9fs_co_run_in_worker() it runs on a different thread for some reas=
on,
> > > > not
> > > > on main thread as it would be expected at that point.
> > >=20
> > > Ok, I think I found the root cause: the block is break;-ing out too f=
ar.
> > > The
> > That could explain the breakage indeed since the block you've added
> > to v9fs_walk() embeds a bunch of break statements. AFAICT this block
> > breaks on errors... do you know which one ?
>=20
> Yes, I've verified that. In my case an interrupt of Twalk triggered this =
bug.=20
> so it was this path exactly:
>=20
>     v9fs_co_run_in_worker({
>         if (v9fs_request_cancelled(pdu)) {
>             ...
>             break;
>         }
>         ...
>     });
>=20
> so it was really this break;-ing too far being the root cause of the cras=
h.
>=20
> > > following patch should fix it:
> > >=20
> > > diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> > > index c51289903d..f83c7dda7b 100644
> > > --- a/hw/9pfs/coth.h
> > > +++ b/hw/9pfs/coth.h
> > > @@ -51,7 +51,9 @@
> > >=20
> > >           */                                                         =
    \
> > >         =20
> > >          qemu_coroutine_yield();                                     =
    \
> > >          qemu_bh_delete(co_bh);                                      =
    \
> > >=20
> > > -        code_block;                                                 =
    \
> > > +        do {                                                        =
    \
> > > +            code_block;                                             =
    \
> > > +        } while (0);                                                =
    \
> >=20
> > Good.
> >=20
> > >          /* re-enter back to qemu thread */                          =
    \
> > >          qemu_coroutine_yield();                                     =
    \
> > >     =20
> > >      } while (0)
> > >=20
> > > I haven't triggered a crash with that patch, but due to the occasiona=
l
> > > nature of this issue I'll give it some more spins before officially
> > > proclaiming it my bug. :)
> >=20
> > Well, this is a pre-existing limitation with v9fs_co_run_in_worker().
> > This wasn't documented as such and not really obvious to detect when
> > you optimized TWALK. We've never hit it before because the other
> > v9fs_co_run_in_worker() users don't have break statements.
>=20
> Yes, I know, this was my bad.
>=20

No, I mean the opposite actually. You shouldn't feel sorry to have
detected that this macro we're using everywhere is badly broken from
the beginning... even at the cost of a regression we'll fix shortly :)

> > But, indeed, this caused a regression in 6.1 so this will need a Fixes:
> > tag and Cc: qemu-stable.
>=20
> Yep, I'm preparing a patch now.
>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


