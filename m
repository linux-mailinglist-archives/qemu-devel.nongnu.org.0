Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21373FDFE2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:28:10 +0200 (CEST)
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT5t-0000bF-Nm
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLSMT-0003Vu-0Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:41:13 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:25617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mLSMR-00065J-6w
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:41:12 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-wrDYPfDWPS-t-4b9Q2w_9Q-1; Wed, 01 Sep 2021 11:41:06 -0400
X-MC-Unique: wrDYPfDWPS-t-4b9Q2w_9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 559BE80198A;
 Wed,  1 Sep 2021 15:41:04 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A99E260BD8;
 Wed,  1 Sep 2021 15:41:03 +0000 (UTC)
Date: Wed, 1 Sep 2021 17:41:02 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs: Twalk crash
Message-ID: <20210901174102.715b3169@bahia.lan>
In-Reply-To: <1825588.ABy5TKrSrS@silver>
References: <4325838.qn0ATYcOi1@silver> <20210831190454.5c725f2b@bahia.lan>
 <37058587.QroWqLRJlK@silver> <1825588.ABy5TKrSrS@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Wed, 01 Sep 2021 16:21:06 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Mittwoch, 1. September 2021 14:49:37 CEST Christian Schoenebeck wrote:
> > > > And it triggered, however I am not sure if some of those functions =
I
> > > > asserted above are indeed allowed to be executed on a different thr=
ead
> > > > than main thread:
> > > >=20
> > > > Program terminated with signal SIGABRT, Aborted.
> > > > #0  __GI_raise (sig=3Dsig@entry=3D6) at
> > > > ../sysdeps/unix/sysv/linux/raise.c:50
> > > > 50      ../sysdeps/unix/sysv/linux/raise.c: No such file or directo=
ry.
> > > > [Current thread is 1 (Thread 0x7fd0bcef1700 (LWP 6470))]
> > >=20
> > > Based in the thread number, it seems that the signal was raised by
> > > the main event thread...
> >=20
> > No, it was not main thread actually, gdb's "current thread is 1" output=
 is
> > misleading.
> >=20
> > Following the thread id trace, I extended the thread assertion checks o=
ver
> > to v9fs_walk() as well, like this:
> >=20
> > static void coroutine_fn v9fs_walk(void *opaque)
> > {
> >     ...
> >     assert_thread();
> >     v9fs_co_run_in_worker({
> >         ...
> >     });
> >     assert_thread();
> >     ...
> > }
> >=20
> > and made sure the reference thread id to be compared is really the main
> > thread.
> >=20
> > And what happens here is before v9fs_co_run_in_worker() is entered,
> > v9fs_walk() runs on main thread, but after returning from
> > v9fs_co_run_in_worker() it runs on a different thread for some reason, =
not
> > on main thread as it would be expected at that point.
>=20
> Ok, I think I found the root cause: the block is break;-ing out too far. =
The=20

That could explain the breakage indeed since the block you've added
to v9fs_walk() embeds a bunch of break statements. AFAICT this block
breaks on errors... do you know which one ?

> following patch should fix it:
>=20
> diff --git a/hw/9pfs/coth.h b/hw/9pfs/coth.h
> index c51289903d..f83c7dda7b 100644
> --- a/hw/9pfs/coth.h
> +++ b/hw/9pfs/coth.h
> @@ -51,7 +51,9 @@
>           */                                                             =
\
>          qemu_coroutine_yield();                                         =
\
>          qemu_bh_delete(co_bh);                                          =
\
> -        code_block;                                                     =
\
> +        do {                                                            =
\
> +            code_block;                                                 =
\
> +        } while (0);                                                    =
\

Good.

>          /* re-enter back to qemu thread */                              =
\
>          qemu_coroutine_yield();                                         =
\
>      } while (0)
>=20
> I haven't triggered a crash with that patch, but due to the occasional na=
ture=20
> of this issue I'll give it some more spins before officially proclaiming =
it my=20
> bug. :)

Well, this is a pre-existing limitation with v9fs_co_run_in_worker().
This wasn't documented as such and not really obvious to detect when
you optimized TWALK. We've never hit it before because the other
v9fs_co_run_in_worker() users don't have break statements.

But, indeed, this caused a regression in 6.1 so this will need a Fixes:
tag and Cc: qemu-stable.

>=20
> Best regards,
> Christian Schoenebeck
>=20
>=20


