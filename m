Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACE3079D6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:36:02 +0100 (CET)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Kz-0001zV-N3
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l59IJ-0000H7-5a
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:33:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l59IF-0000o3-Am
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:33:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611847990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIfx30+c0NjTMI8MsYAqAt2won7FaYieffOxteFFIgA=;
 b=FeVrjDylqOTOFD1JTghDgDIhbKSCJj5BQey9VRRlzKLAkVfqnxTm0ECcliKD71C2PJmZ+0
 HNmn5t1oF7WGsm1jHMErnaQXVCx3KWLqoiKlY/t9MISiP5hJNzDCZCGYGTTlVNS8fh63VO
 YEb0mTsSEDXpvPt1HqJBYneZCzL4Tj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-uWduTeYsO4yz31eTAFg5sw-1; Thu, 28 Jan 2021 10:33:08 -0500
X-MC-Unique: uWduTeYsO4yz31eTAFg5sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB718144E2;
 Thu, 28 Jan 2021 15:33:06 +0000 (UTC)
Received: from localhost (ovpn-112-242.ams2.redhat.com [10.36.112.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 428B018A2F;
 Thu, 28 Jan 2021 15:33:00 +0000 (UTC)
Date: Thu, 28 Jan 2021 15:32:58 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210128153258.GA20377@stefanha-x1.localdomain>
References: <20210127112131.308451-1-stefanha@redhat.com>
 <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
 <20210127141430.GA310142@stefanha-x1.localdomain>
 <CAOssrKdmpjMG1fVRJBBG7DKy4Fy46HaBz5gHvWZfOTy6FGF+6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKdmpjMG1fVRJBBG7DKy4Fy46HaBz5gHvWZfOTy6FGF+6Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>,
 Sergio Lopez Pascual <slp@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 03:27:23PM +0100, Miklos Szeredi wrote:
> On Wed, Jan 27, 2021 at 3:14 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Wed, Jan 27, 2021 at 02:01:54PM +0100, Miklos Szeredi wrote:
>=20
> > > The problem here is there can also be a race between the open and the
> > > subsequent lo_do_lookup().
> > >
> > > At this point it's probably enough to verify that fuse_entry_param
> > > refers to the same object as the fh (using fstat and comparing st_dev
> > > and st_ino).
> >
> > Can you describe the race in detail? FUSE_CREATE vs FUSE_OPEN?
> > FUSE_CREATE vs FUSE_CREATE?
>=20
> A race between FUSE_CREATE and external modification:
>=20
> VIRTIOFSD: lo_create() {
> VIRTIOFSD:     fd =3D open(foo, O_CREAT | O_EXCL)
> EXTERNAL:  unlink(foo)
> EXTERNAL:  open(foo, O_CREAT)
> VIRTIOFSD:     lo_do_lookup() {
> VIRTIOFSD:         newfd =3D open(foo, O_PATH | O_NOFOLLOW)
>=20
> Nothing serious will happen, but there will be a discrepancy between
> the open file and the inode that it references.  I.e.  the following
> in the client will yield weird results:
>=20
> open(foo, O_CREAT) -> fd
> sprintf(procname, "/proc/self/fd/%i", fd);
> open(procname, O_RDONLY) -> fd2
> write(fd, buf, bufsize)
> read(fd2, buf, bufsize)
>=20
> This is probably not a security issue, more of a quality of
> implementation issue.

Thanks for explaining. This is related to consistency when the shared
directory is accessed by multiple systems (e.g. other guests or the
host). virtiofsd doesn't support consistency in that case yet.

Let's treat this as a separate issue.

Stefan

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAS2SYACgkQnKSrs4Gr
c8hKSQf/bjaMIB+c5JK/IX+azZaL78TpuZsbWwuA3cXr8zGhTCJUHURkH9qBJr6O
ySoxNFF1kUkHpF3VEbvSLJaoKrNVBQ1TC3l1nHhD2mhL9xQlJGOVq0oORUIaF5Vh
e47i7YqsLUYyA1WA+Z+d7vYmv8JaoFWkUXshtIHVGxUg0bSLEPelIcWuxsWyFTxM
jO+VFxFJ9UiZJyiu7X1XrwIeOnKaPUtPCEpMkhvxZjCYYaAHbnziklFL+aRX5wKr
8S3u64VU2ADDxoNPscMv8n0BTHbxMgIXdTxvz/w3JbAw9qkJeg/dFuUjlCLTZOqy
24cneiLEqmkVZyiXG6YBpJm2MjHwKw==
=9Ba+
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


