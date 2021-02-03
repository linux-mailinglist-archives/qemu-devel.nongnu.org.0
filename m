Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F430E0A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:14:56 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ljz-00058k-GJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LTY-0007Af-53
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7LTV-00089V-Rz
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612371473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfrXpNvSY4o2/UbiNYeUUbgiMp6EN58+HjDLwM4QC6w=;
 b=XbuIWuGPVMpSOM6aC5DyXD/0fmNPULA4eXFt/mziM5TdOPtJoooPCDURQsVyBzExZk7pdP
 Og4+6Jl752kmjentto7G66vDSVLHKP1+r74kNOMqAc/dtY6L6O7wIeMK5s/oZ1zXjfqVNp
 nXowIfjkLMC+2oBmDuPUnZHGW3XgTzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-NsnE3mgFNnenoTk9Lmgmbg-1; Wed, 03 Feb 2021 11:57:51 -0500
X-MC-Unique: NsnE3mgFNnenoTk9Lmgmbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01030DF8A7;
 Wed,  3 Feb 2021 16:57:50 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8FC35B692;
 Wed,  3 Feb 2021 16:57:43 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:57:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 1/3] virtiofsd: extract lo_do_open() from lo_open()
Message-ID: <20210203165742.GJ74271@stefanha-x1.localdomain>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-2-stefanha@redhat.com>
 <20210203152035.374924b9@bahia.lan> <20210203144730.GJ2950@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210203144730.GJ2950@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MMMIZFJzhAsRj/+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3MMMIZFJzhAsRj/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 02:47:30PM +0000, Dr. David Alan Gilbert wrote:
> * Greg Kurz (groug@kaod.org) wrote:
> > On Wed,  3 Feb 2021 11:37:17 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > Both lo_open() and lo_create() have similar code to open a file. Extr=
act
> > > a common lo_do_open() function from lo_open() that will be used by
> > > lo_create() in a later commit.
> > >=20
> > > Since lo_do_open() does not otherwise need fuse_req_t req, convert
> > > lo_add_fd_mapping() to use struct lo_data *lo instead.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> >=20
> > With the s/ENOMEM/-ENOMEM/ change in lo_do_open() suggested by patchew,
>=20
> Isn't it actually the return -errno that's different from the original?

Yes. It should be return errno since lo_open() expected err =3D 0
(success) or a positive errno.

Will fix.

Stefan

--3MMMIZFJzhAsRj/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAa1gYACgkQnKSrs4Gr
c8hc2ggAlN00+yDd+ank1WYMzb3Jnjlx+XzbdyK0pDPTy0gk3e8j3qw9qt1ayXDc
kVo5oFPLEgkkT9fsOatZ9Cs0yPwLnLJMKBpqOIqwUwqTXcee4tiUxfMSCRM1KwcR
WZp1FPBAGd3w7Bx1UUQjtoW5joVw/lC60eX/ajJr1taOeG0yJ4EA+ZxK4mFmVSKv
PhQ5VnabPJQiyYrL6ThRfc2GMRhkKFGq6Lu+VcrlStuzEeYmP6FaJUO8MTbGTsKa
oWkFzIv+5V7Be0+IFVJoeJRwBrf1+0MSyOHaxRz0R0jKDGQLboztjt4wVZ6E0Tga
rJe/EQ+yCggA33mH7uz0K71ceHG1Rg==
=KVQk
-----END PGP SIGNATURE-----

--3MMMIZFJzhAsRj/+--


