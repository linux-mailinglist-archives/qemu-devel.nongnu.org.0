Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A93976E6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:40:01 +0200 (CEST)
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6Uq-00029b-Kn
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6Sg-0007Fq-Qh
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lo6Se-00012F-Pu
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622561864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2vmJ8WFGMiP3qaq3IoBWZ0CkIxfAtW5C1m7aIjK2d4k=;
 b=G38XRqRPDUBM++KHw6W1kYJlwC7oIYYEH3UeHPaKyKZooyt+mDXaxgAuZoDF6D5CcoldTk
 vvZjkaxDdCNdQf0z1HI8zglzY70tasFhGvCaZZv0mKPugVdxj15w2royMAZXs/FdOyJDR+
 Ra8uFwIPWmyqqHzdgpfA6NdFGoubCv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-o83e5J3pM0SNDbb8966Qng-1; Tue, 01 Jun 2021 11:37:42 -0400
X-MC-Unique: o83e5J3pM0SNDbb8966Qng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D76F91094240;
 Tue,  1 Jun 2021 15:36:13 +0000 (UTC)
Received: from localhost (ovpn-113-244.ams2.redhat.com [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A601100763C;
 Tue,  1 Jun 2021 15:36:13 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:36:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/3] vhost-user-blk-test: fix Coverity mkstemp(2) umask
 warning
Message-ID: <YLZT7BmQXqrZI2Nd@stefanha-x1.localdomain>
References: <20210526091248.434459-1-stefanha@redhat.com>
 <20210526091248.434459-3-stefanha@redhat.com>
 <CAFEAcA8XA=+tL5194oKUkvraKd7ojPj2qdnjhRUsTZMndSbH6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8XA=+tL5194oKUkvraKd7ojPj2qdnjhRUsTZMndSbH6Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oEkhQTPMKnVCupWn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oEkhQTPMKnVCupWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 30, 2021 at 08:01:21PM +0100, Peter Maydell wrote:
> On Wed, 26 May 2021 at 10:14, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> >
> > The Linux man page for mkstemp(3) states:
> >
> >   In glibc versions 2.06 and earlier, the file is created with
> >   permissions 0666, that is, read and write for all users.  This old
> >   behavior may be a security risk, especially  since other UNIX flavors
> >   use 0600, and somebody might overlook this detail when porting
> >   programs. POSIX.1-2008 adds a requirement that the file be created
> >   with mode 0600.
> >
> >   More generally, the POSIX specification of mkstemp() does not say
> >   anything about file modes, so the application should make sure its
> >   file mode creation mask (see umask(2)) is set appropriately before
> >   calling mkstemp() (and mkostemp()).
> >
> > glibc 2.0.6 was released in 1997 and POSIX caught up in 2008. macOS and
> > FreeBSD also use POSIX-compliant 0600 permissions.
> >
> > At this point the Coverity warning seems archaic and no longer useful,
> > but go ahead and silence it.
>=20
> We had a lot of these on other uses of mkstemp() in tests/ -- I
> have been simply marking them as false-positive on the same grounds
> that you cite above. I would suggest we do the same here rather
> than having this one test do something different with mkstemp().
>=20
> (If we really wanted to handle ancient glibc, we should do that
> by having a qemu_mkstemp() or something. But it doesn't seem
> worthwhile...)

Sounds good. I have updated Coverity.

Stefan

--oEkhQTPMKnVCupWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC2U+wACgkQnKSrs4Gr
c8hAZggAlK16isWxhEpSEaIyPF36cMk9QG3eiGpx3HSiNmJXPdSYs2jtYzYtwB4g
eXl8mrLkd7uG3lHpX1j0VbuzP3eSGwRPrhQZgMubou/CSF737aV8+JfOIizJPggG
M00z86+PpFaoXQPTJvEUlnFeykKNYU9dvBtdsG6VkIhZos3lNs+le7NLax5IfYGN
ArCuAXRH2UFsEk61B/iPQ0UM3cbcefHMw8AauYkYdoGwayjCOp9CcMuASQzI0epZ
keu74xD0zFXwmVDmJt99F7J6H1Qa20COb8YMLkY3rHBs1nIHoMHnVfrUaTzEkrZQ
YTa9vLHIDICfTg+RiNZWhNOMsJHBOw==
=sRaC
-----END PGP SIGNATURE-----

--oEkhQTPMKnVCupWn--


