Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E039851C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:17:53 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN0b-00013L-0O
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loMwG-0003PL-Ff
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loMwE-0007uX-TM
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Vx0DBN0wKDjG3AGM2bLcX4cwB1jkbZgkyknHQSFNr4=;
 b=ZbnVvStUnqJV6ePqAz/723o1hRhp4EB7J9u0bj1If911rOGMtLz2fv/r6oy/N7ySD1K0gN
 tUJ30YB+kySQozsKTzI035dOsxgxNDk/mWqEPKMDZJYqKfctuBF36LHjAGarGTmuWoILnn
 jbM6o65WQPQaaVDYn4c8vuXFBLu9Wys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-oGH_76ENNeqc3L0-lFM3Hg-1; Wed, 02 Jun 2021 05:13:20 -0400
X-MC-Unique: oGH_76ENNeqc3L0-lFM3Hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87799501E0;
 Wed,  2 Jun 2021 09:13:19 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E4565C648;
 Wed,  2 Jun 2021 09:13:19 +0000 (UTC)
Date: Wed, 2 Jun 2021 10:13:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] block-copy: small fix and refactor
Message-ID: <YLdLrrTszu8MMxPv@stefanha-x1.localdomain>
References: <20210528141628.44287-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210528141628.44287-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gVRSxmVHlYy9ri8J"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gVRSxmVHlYy9ri8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 05:16:26PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi all!
>=20
> This is my suggestion how to refactor block-copy to avoid extra atomic
> operations in=20
> "[PATCH v2 0/7] block-copy: protect block-copy internal structures"
>=20
> Vladimir Sementsov-Ogievskiy (2):
>   block-copy: fix block_copy_task_entry() progress update
>   block-copy: refactor copy_range handling
>=20
>  block/block-copy.c | 79 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 53 insertions(+), 26 deletions(-)

I posted suggestions for the doc comment on Patch 2, otherwise:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gVRSxmVHlYy9ri8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3S64ACgkQnKSrs4Gr
c8isUAf9G/dTR1EqcWwClWm+w9rKLHv6JfaQWjW6RQDhNXY5rGP0TSomHCedGOG8
Rwb6x2pJ4SDQKtfXSHOL0RZBHNTd/qJXzNQAVSSnp37/0GxxQgaLeOzxps8cQ02Z
5qc+5aRlcUHXrINtuNEI/s34DmkbPK9Gnu//Dvs0E31ScJK6VlMZ7/QNCzRjEkAK
wA9VF4fqpT2i7WN2zUrBYINYb2c240rqabaVb/5pDAZqxC3hzS1ytjwI+ZSZnIuO
hCx4DoB+0LTOMXkwH7JEVTJY1CF1E/luIDlTbPKqJfZzQHvLjkJ8qIZJSCfEFGCa
+4/StTxTolcb+S2Gc8hG3UlEUcRyow==
=dC4O
-----END PGP SIGNATURE-----

--gVRSxmVHlYy9ri8J--


