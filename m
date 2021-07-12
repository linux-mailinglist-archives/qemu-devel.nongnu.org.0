Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C050E3C5BA9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:07:44 +0200 (CEST)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uit-0005E5-Hk
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2uhP-0003tD-8v
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m2uhK-0006ms-BC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626091564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXk4/tlgrBt32jT9R4FomDjmS1mQcDOLB4wmI5fQl3w=;
 b=GclWmTuJeHfgTmc8hkqbcaeNRcRWptkXS6u/IBL6kBwsFhhVv8ZjBRLj/Vq3IXnf6GEHNK
 ZGnUTVaqjNdJSNaINiQ5jJHGyApND3Lv2HySmcinEuvAL487NwTKmnX/fwcVgkysNTM7LB
 Ey2Eyv/CKZXCt5cLqjXjYIBvSsIyB+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-R3pbyFRoMNCZch9HELhkUg-1; Mon, 12 Jul 2021 08:06:00 -0400
X-MC-Unique: R3pbyFRoMNCZch9HELhkUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7871B10C1ADC;
 Mon, 12 Jul 2021 12:05:59 +0000 (UTC)
Received: from localhost (ovpn-112-230.ams2.redhat.com [10.36.112.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84C05189C7;
 Mon, 12 Jul 2021 12:05:49 +0000 (UTC)
Date: Mon, 12 Jul 2021 13:05:45 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: question on vhost, limiting kernel threads and NPROC
Message-ID: <YOwwGbOhkDEy/KvQ@stefanha-x1.localdomain>
References: <b6d181c2-ec7b-913b-3eea-142fcce7c104@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b6d181c2-ec7b-913b-3eea-142fcce7c104@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N7ArdoMLpSs+ZgNE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: libvir-list@redhat.com, "jasowang@redhat.com" <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Christian Brauner <christian.brauner@ubuntu.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--N7ArdoMLpSs+ZgNE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 09, 2021 at 11:25:37AM -0500, Mike Christie wrote:
> Hi,
>=20
> The goal of this email is to try and figure how we want to track/limit th=
e
> number of kernel threads created by vhost devices.
>=20
> Background:
> -----------
> For vhost-scsi, we've hit a issue where the single vhost worker thread ca=
n't
> handle all IO the being sent from multiple queues. IOPs is stuck at aroun=
d
> 500K. To fix this, we did this patchset:
>=20
> https://lore.kernel.org/linux-scsi/20210525180600.6349-1-michael.christie=
@oracle.com/
>=20
> which allows userspace to create N threads and map them to a dev's virtqu=
eues.
> With this we can get around 1.4M IOPs.
>=20
> Problem:
> --------
> While those patches were being reviewed, a concern about tracking all the=
se
> new possible threads was raised here:
>=20
> https://lore.kernel.org/linux-scsi/YL45CfpHyzSEcAJv@stefanha-x1.localdoma=
in/
>=20
> To save you some time, the question is what does other kernel code using =
the
> kthread API do to track the number of kernel threads created on behalf of
> a userspace thread. The answer is they don't do anything so we will have =
to
> add that code.
>=20
> I started to do that here:
>=20
> https://lkml.org/lkml/2021/6/23/1233
>=20
> where those patches would charge/check the vhost device owner's RLIMIT_NP=
ROC
> value. But, the question of if we really want to do this has come up whic=
h is
> why I'm bugging lists like libvirt now.
>=20
> Question/Solution:
> ------------------
> I'm bugging everyone so we can figure out:
>=20
> If we need to specifically track the number of kernel threads being made
> for the vhost kernel use case by the RLIMIT_NPROC limit?
>=20
> Or, is it ok to limit the number of devices with the RLIMIT_NOFILE limit.
> Then each device has a limit on the number of threads it can create.

Do we want to add an interface where an unprivileged userspace process
can create large numbers of kthreads? The number is indirectly bounded
by RLIMIT_NOFILE * num_virtqueues, but there is no practical way to
use that rlimit since num_virtqueues various across vhost devices and
RLIMIT_NOFILE might need to have a specific value to control file
descriptors.

io_uring worker threads are limited by RLIMIT_NPROC. I think it makes
sense in vhost too where the device instance is owned by a specific
userspace process and can be accounted against that process' rlimit.

I don't have a specific use case other than that I think vhost should be
safe and well-behaved.

Stefan

--N7ArdoMLpSs+ZgNE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDsMBkACgkQnKSrs4Gr
c8iczAgArXvbkfEdzLQ1/34BfWIPk9xP+mfxQl9to6qpTOpxVNmCLve2xxM2MEzv
1m7pvftik+qnjquVUrruzQafErBn3ipkByCXTvJi5OxSSHKIPjAu1ilZfowaAmfk
3tHtYxlYvbxQ/I7Fr6aDcPKO16qS/he30gdhZImjYjvWW390nsh3six0eEBU4G0x
dNv36uBYMaeV1Iox7xi+z3tCYmkZXc8L67RpP+RCDirUBU7B9voDqwASbKC4OUKT
g+iOVEO2jjAw/vLope8bTelYHWO2G8eqrP24w025+naDFgpbFlmeLXIWf+yhIKVt
gauY5XtL0NP2mGlVaueTMizZGhNNeg==
=uXha
-----END PGP SIGNATURE-----

--N7ArdoMLpSs+ZgNE--


