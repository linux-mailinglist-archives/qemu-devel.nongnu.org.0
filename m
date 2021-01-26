Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327C03039F0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 11:13:21 +0100 (CET)
Received: from localhost ([::1]:60766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4LLc-0005aR-75
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 05:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4LJ9-0003tP-Mk
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l4LJ6-0001zv-EZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 05:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611655841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0tBHAvJGRpg1o0UwQLWnyVXIkuGck9jgoxa62FcQLMg=;
 b=FX3rMOT5EIWQ/N71IjXVfR5w0Eo7dV9YREJseXopNWWz77cS8gfFqaOkJIm+AfkXfo7q9I
 aJPA3qaMqmQMaG3EsC1coE+o+JA7JwW8z9NQNH++7y4Yp2MEyGXsJFs7TT0X3QKsILJstC
 DyUqWnY8FuRewdykn2YeDan9vwrDN0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-TNTi-Bp9NASfrUR9q1VlfA-1; Tue, 26 Jan 2021 05:10:39 -0500
X-MC-Unique: TNTi-Bp9NASfrUR9q1VlfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 642DF802B40;
 Tue, 26 Jan 2021 10:10:38 +0000 (UTC)
Received: from localhost (ovpn-114-186.ams2.redhat.com [10.36.114.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B66810023AB;
 Tue, 26 Jan 2021 10:10:32 +0000 (UTC)
Date: Tue, 26 Jan 2021 10:10:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210126101031.GB226981@stefanha-x1.localdomain>
References: <20210121144429.58885-1-stefanha@redhat.com>
 <20210122154054.GA120574@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210122154054.GA120574@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mszeredi@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 P J P <ppandit@redhat.com>, virtio-fs@redhat.com, Alex Xu <alex@alxu.ca>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 10:40:54AM -0500, Vivek Goyal wrote:
> On Thu, Jan 21, 2021 at 02:44:29PM +0000, Stefan Hajnoczi wrote:
> > A well-behaved FUSE client does not attempt to open special files with
> > FUSE_OPEN because they are handled on the client side (e.g. device node=
s
> > are handled by client-side device drivers).
> >=20
> > The check to prevent virtiofsd from opening special files is missing in
> > a few cases, most notably FUSE_OPEN. A malicious client can cause
> > virtiofsd to open a device node, potentially allowing the guest to
> > escape. This can be exploited by a modified guest device driver. It is
> > not exploitable from guest userspace since the guest kernel will handle
> > special files inside the guest instead of sending FUSE requests.
> >=20
> > This patch adds the missing checks to virtiofsd. This is a short-term
> > solution because it does not prevent a compromised virtiofsd process
> > from opening device nodes on the host.
> >=20
> > Reported-by: Alex Xu <alex@alxu.ca>
> > Fixes: CVE-2020-35517
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> It looks good to me. I see there is another openat() instance in
> lo_opendir(). May be we can convert it to use lo_inode_open() as well?

I thought so too, but this one is interesting:

  fd =3D openat(lo_fd(req, ino), ".", O_RDONLY);

Using "." here is basically equivalent to O_DIRECTORY!

Therefore this always fails on special files. That's why I ended up
leaving it unchanged.

  $ cat a.c
  #define _GNU_SOURCE
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <unistd.h>
  #include <stdio.h>
  #include <stdlib.h>

  int main(int argc, char **argv)
  {
      int fd;
      int pfd =3D open(argv[1], O_PATH);

      if (pfd < 0) {
          perror("open");
          return EXIT_FAILURE;
      }

      fd =3D openat(pfd, ".", O_RDONLY);
      if (fd < 0) {
          perror("openat");
          return EXIT_FAILURE;
      }

      close(fd);
      close(pfd);
      return EXIT_SUCCESS;
  }
  $ gcc -o a a.c
  $ ./a /tmp
  <--- no error
  $ ./a /tmp/a.c
  openat: Not a directory
  $ ./a /dev/stdin
  openat: Not a directory

Stefan

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAP6pcACgkQnKSrs4Gr
c8hGdQgAvd//+jyb2QVpI7GGXlaJslHi+Wm15qWqoEff2/LpuqCtmWJ0hgZ202Fi
B70+Y+27Be3D8f6d28UNo1eM1Yq+TMQLc506SREir0dt3ACkT4SxLgSYcZ3LMeyf
SYee6TDe2/Sbfs/s2/amdo7u4Kr0U06ujho5MXgBktbP2Orv1ydj72XFYsAcq2pJ
+j+Irg0F7nwMdRdYc+nPBCCHlaGh/CG+TRJZ1HkqJyk3g+9UHFs9tn7EWYD5jsik
6R5E5XEFu9IWzEcEGUAwuBIy5JkV+7j9wP3k7rXEFB4Dj0zWEYVWodDGE2iXNzxm
2AZwsjVNhjO/bymeEgXL/YzcNq0e+Q==
=VTao
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--


