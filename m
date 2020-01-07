Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385061323B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 11:34:25 +0100 (CET)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomBq-0000LY-9H
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 05:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iol4X-0003S4-NL
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:22:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iol4V-0007PO-C2
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:22:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51220
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iol4V-0007Oh-6m
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578388962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0pem6DSB0SSiIr+pKqC3SgfzjBQjdEyIlsVWAUWQLw=;
 b=UqwCps1accAQ5wt0ScY0MCCRLOLFP5GSYXiGpJmBpmfm9fTCam1zov1LObvFz0ZiN1CB6M
 2VWSeBOpVsCUnCDDDjtF9Fzo9FrdyPYPwPCMU7FVBR1JYhGxuvXd0zuMqfbz6wX2XLoQVp
 K/Hr/Qmh6UcecLL5LXIyDRJsPmlCu2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-uP2IPvGMNQWlkhj29bopsw-1; Tue, 07 Jan 2020 04:22:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D8D801E77
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 09:22:38 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748DA7FB4E;
 Tue,  7 Jan 2020 09:22:34 +0000 (UTC)
Date: Tue, 7 Jan 2020 09:22:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 032/104] virtiofsd: passthrough_ll: create new files in
 caller's context
Message-ID: <20200107092231.GA3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-33-dgilbert@redhat.com>
 <20200106143011.GK2930416@redhat.com>
 <20200106190041.GO2798@work-vm> <20200106190843.GP2798@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200106190843.GP2798@work-vm>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uP2IPvGMNQWlkhj29bopsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 06, 2020 at 07:08:43PM +0000, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > On Thu, Dec 12, 2019 at 04:37:52PM +0000, Dr. David Alan Gilbert (git=
) wrote:
> > > > From: Vivek Goyal <vgoyal@redhat.com>
> > > >=20
> > > > We need to create files in the caller's context. Otherwise after
> > > > creating a file, the caller might not be able to do file operations=
 on
> > > > that file.
> > > >=20
> > > > Changed effective uid/gid to caller's uid/gid, create file and then
> > > > switch back to uid/gid 0.
> > > >=20
> > > > Use syscall(setresuid, ...) otherwise glibc does some magic to chan=
ge EUID
> > > > in all threads, which is not what we want.
> > > >=20
> > > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > > Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> > > > ---
> > > >  tools/virtiofsd/passthrough_ll.c | 79 ++++++++++++++++++++++++++++=
++--
> > > >  1 file changed, 74 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/pas=
sthrough_ll.c
> > > > index 68bacb6fc5..0188cd9ad6 100644
> > > > --- a/tools/virtiofsd/passthrough_ll.c
> > > > +++ b/tools/virtiofsd/passthrough_ll.c
> > >=20
> > >=20
> > > > +static int lo_change_cred(fuse_req_t req, struct lo_cred *old)
> > > > +{
> > > > +    int res;
> > > > +
> > > > +    old->euid =3D geteuid();
> > > > +    old->egid =3D getegid();
> > > > +
> > > > +    res =3D syscall(SYS_setresgid, -1, fuse_req_ctx(req)->gid, -1)=
;
> > >=20
> > > Do we need to be using  SYS_setres[u,g]id32 instead...
> > >=20
> > > [quote setresgid(2)]
> > >        The original Linux setresuid() and setresgid() system  calls
> > >        supported  only  16-bit  user  and group IDs.  Subsequently,
> > >        Linux 2.4 added setresuid32() and setresgid32(),  supporting
> > >        32-bit  IDs.   The glibc setresuid() and setresgid() wrapper
> > >        functions transparently deal with the variations across ker=E2=
=80=90
> > >        nel versions.
> > > [/quote]
> >=20
> > OK, updated.
>=20
> Hmm hang on; this is messy.  x86-64 only seems to have setresuid
> where as some architectures have both;  If I'm reading this right, all
> 64 bit machines have setresuid/gid calling the code that takes the
> 32bit ID; some have compat entries for 32bit syscalls.

Oh yuk.

> I think it's probably more correct to call setresuid here; except
> for 32 bit platforms - but how do we tell?

Is it possible to just do an #ifdef SYS_setresgid32 check to see
if the wider variant exists ?


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


