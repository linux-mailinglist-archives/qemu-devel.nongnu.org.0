Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF4A4AB849
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:12:35 +0100 (CET)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH10V-000736-WD
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:12:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGzgP-0003bd-Ni
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:47:43 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nGzgN-0001ZL-Co
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:47:36 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-WIKF25egPfy4iQmnVAONtQ-1; Mon, 07 Feb 2022 03:47:22 -0500
X-MC-Unique: WIKF25egPfy4iQmnVAONtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE2D80292C;
 Mon,  7 Feb 2022 08:47:21 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020994F85B;
 Mon,  7 Feb 2022 08:47:18 +0000 (UTC)
Date: Mon, 7 Feb 2022 09:47:17 +0100
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <20220207094717.5f92da9d@bahia>
In-Reply-To: <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
 <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
 <CAB26zV1ZmpODTqv20Ae77+SWvG5Cf1GWdi7FuR_L_aWjFcgfnA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 20:10:23 -0500
Will Cohen <wwcohen@gmail.com> wrote:

> This patch set currently places it in 9p-util only because 9p is the only
> place where this issue seems to have come up so far and we were wary of
> editing files too far afield, but I have no attachment to its specific
> location!
>=20

Inline comments are preferred on qemu-devel. Please don't top post !
This complicates the review a lot.

This is indeed a good candidate for osdep. This being said, unless there's
some other user in the QEMU code base, it is acceptable to leave it under
9pfs.

> On Sun, Feb 6, 2022 at 4:21 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
> wrote:
>=20
> > On 6/2/22 21:07, Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > >
> > > Darwin does not support mknodat. However, to avoid race conditions
> > > with later setting the permissions, we must avoid using mknod on
> > > the full path instead. We could try to fchdir, but that would cause
> > > problems if multiple threads try to call mknodat at the same time.
> > > However, luckily there is a solution: Darwin includes a function
> > > that sets the cwd for the current thread only.
> > > This should suffice to use mknod safely.
> > >
> > > This function (pthread_fchdir_np) is protected by a check in
> > > meson in a patch later in tihs series.
> > >
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > [Will Cohen: - Adjust coding style
> > >               - Replace clang references with gcc
> > >               - Note radar filed with Apple for missing syscall
> > >               - Replace direct syscall with pthread_fchdir_np and
> > >                 adjust patch notes accordingly]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > >   hw/9pfs/9p-local.c       |  5 +++--
> > >   hw/9pfs/9p-util-darwin.c | 27 +++++++++++++++++++++++++++
> > >   hw/9pfs/9p-util-linux.c  |  5 +++++
> > >   hw/9pfs/9p-util.h        |  2 ++
> > >   4 files changed, 37 insertions(+), 2 deletions(-)
> >
> > > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > > index 8e610ad224..f6fed963bf 100644
> > > --- a/hw/9pfs/9p-util.h
> > > +++ b/hw/9pfs/9p-util.h
> > > @@ -97,6 +97,8 @@ ssize_t flistxattrat_nofollow(int dirfd, const char
> > *filename,
> > >   ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
> > >                                   const char *name);
> > >
> > > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
> > dev);
> >
> > I think this belong to "osdep.h" & os-posix.c.
> >


