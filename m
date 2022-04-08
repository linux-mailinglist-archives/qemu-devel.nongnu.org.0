Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD74F98ED
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:03:27 +0200 (CEST)
Received: from localhost ([::1]:52206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncq8z-00020Y-VA
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ncq6v-0000HV-AD
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:01:18 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1ncq6t-0001XX-7N
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:01:16 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-_70mehF6Nhmun0Ca0rkJFw-1; Fri, 08 Apr 2022 11:01:03 -0400
X-MC-Unique: _70mehF6Nhmun0Ca0rkJFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9DE4811E7A;
 Fri,  8 Apr 2022 15:01:02 +0000 (UTC)
Received: from bahia (unknown [10.39.192.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A656400F24;
 Fri,  8 Apr 2022 15:01:00 +0000 (UTC)
Date: Fri, 8 Apr 2022 17:00:59 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Message-ID: <20220408170059.1134a039@bahia>
In-Reply-To: <1684580.f98VPQ1boI@silver>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com>
 <1684580.f98VPQ1boI@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 08 Apr 2022 15:52:25 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Sonntag, 27. Februar 2022 23:35:20 CEST Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >=20
> > Darwin does not support mknodat. However, to avoid race conditions
> > with later setting the permissions, we must avoid using mknod on
> > the full path instead. We could try to fchdir, but that would cause
> > problems if multiple threads try to call mknodat at the same time.
> > However, luckily there is a solution: Darwin includes a function
> > that sets the cwd for the current thread only.
> > This should suffice to use mknod safely.
> [...]
> > diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> > index cdb4c9e24c..bec0253474 100644
> > --- a/hw/9pfs/9p-util-darwin.c
> > +++ b/hw/9pfs/9p-util-darwin.c
> > @@ -7,6 +7,8 @@
> >=20
> >  #include "qemu/osdep.h"
> >  #include "qemu/xattr.h"
> > +#include "qapi/error.h"
> > +#include "qemu/error-report.h"
> >  #include "9p-util.h"
> >=20
> >  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const ch=
ar
> > *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const cha=
r
> > *filename, const char *name, close_preserve_errno(fd);
> >      return ret;
> >  }
> > +
> > +/*
> > + * As long as mknodat is not available on macOS, this workaround
> > + * using pthread_fchdir_np is needed.
> > + *
> > + * Radar filed with Apple for implementing mknodat:
> > + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> > + */
> > +#if defined CONFIG_PTHREAD_FCHDIR_NP
> > +
> > +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t d=
ev)
> > +{
> > +    int preserved_errno, err;
> > +    if (!pthread_fchdir_np) {
> > +        error_report_once("pthread_fchdir_np() not available on this
> > version of macOS"); +        return -ENOTSUP;
> > +    }
> > +    if (pthread_fchdir_np(dirfd) < 0) {
> > +        return -1;
> > +    }
> > +    err =3D mknod(filename, mode, dev);
>=20
> I just tested this on macOS Monterey and realized mknod() seems to requir=
e=20
> admin privileges on macOS to work. So if you run QEMU as ordinary user on=
=20
> macOS then mknod() would fail with errno=3D1 (Operation not permitted).
>=20
> That means a lot of stuff would simply not work on macOS, unless you real=
ly=20
> want to run QEMU with super user privileges, which does not sound appeali=
ng to=20
> me. :/
>=20
> Should we introduce another fake behaviour here, i.e. remapping this on m=
acOS=20
> hosts as regular file and make guest believe it would create a device, si=
milar=20
> as we already do for mapped links?
>=20

I'd rather keep that for the mapped security mode only to avoid
confusion, but qemu_mknodat() is also used in passthrough mode.

Anyway, it seems that macOS's mknod() only creates device files,
unlike linux (POSIX) which is also used to create FIFOs, sockets
and regular files. And it also requires elevated privileges,
CAP_MKNOD, in order to create device files.

It seems that this implementation of qemu_mknodat() is just missing
some features that can be implemented with unprivileged syscalls like
mkfifo(), socket() and open().

> > +    preserved_errno =3D errno;
> > +    /* Stop using the thread-local cwd */
> > +    pthread_fchdir_np(-1);
> > +    if (err < 0) {
> > +        errno =3D preserved_errno;
> > +    }
> > +    return err;
> > +}
> > +
> > +#endif
>=20
>=20


