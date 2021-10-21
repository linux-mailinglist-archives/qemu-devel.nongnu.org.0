Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A36436479
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 16:38:20 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZD1-0001md-L8
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 10:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZAD-0007lh-VY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdZAC-0007CV-AW
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 10:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634826923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LPY0vGW68U989IVeAYi+XCYJZEz79iOxd8q15QEkkNI=;
 b=Ch/J1NilSYjwPyVRUJV5rMZclxVDoqcutfJO6ofwZWN+FYnw29pbBQEwIdZEiC/4hFojli
 VIG9D6d9VqDINc7BR/DQage8bTq6QrcVE+M4y+ZIGJEkZTLvNUdn3ysB6jU3+fx04Nqn6n
 GUwajkvWSyn/rPhKqK791bLwvE1rDNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-7DS3p_fWNHO2fGhBfzazKQ-1; Thu, 21 Oct 2021 10:35:19 -0400
X-MC-Unique: 7DS3p_fWNHO2fGhBfzazKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8461BAF83;
 Thu, 21 Oct 2021 14:35:18 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE6E817CE1;
 Thu, 21 Oct 2021 14:35:05 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:35:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v3 06/25] include/block/block_int: split header into I/O
 and global state API
Message-ID: <YXF6mAH+ShuP2YpZ@stefanha-x1.localdomain>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-7-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012084906.2060507-7-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0GaUHtR0ybw6YgHM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0GaUHtR0ybw6YgHM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 04:48:47AM -0400, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patch, split block_int.h
> in block_int-io.h and block_int-global-state.h
>=20
> block_int-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>=20
> Assertions are added in the next patch.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockdev.c                             |    5 +
>  include/block/block_int-common.h       | 1164 +++++++++++++++++++
>  include/block/block_int-global-state.h |  319 +++++
>  include/block/block_int-io.h           |  163 +++
>  include/block/block_int.h              | 1478 +-----------------------
>  5 files changed, 1654 insertions(+), 1475 deletions(-)
>  create mode 100644 include/block/block_int-common.h
>  create mode 100644 include/block/block_int-global-state.h
>  create mode 100644 include/block/block_int-io.h

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--0GaUHtR0ybw6YgHM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFxepgACgkQnKSrs4Gr
c8gDMwgAlukomfYwCBJ12/KLjTbkoAFV64eu3eLPTTlHJbVCW+A+gkkSLwgTiVxs
qVi1gUL+05EcvUDQ2B0V//2bZyUNBzBHGu65EDRm5OC6S/IiDwtffsFimC+VwrkM
wzHVVKgooeL2t7y/ldfg1VYXMRCIZStVSU/pIdcqbrdqo/5abuQsjXjILNiaUGvP
iws82KrEQ6hh1MEc3AawE2YOYSUHS+IyXzzd6d9PORVnmDANde1FtHQyktm1fykv
XdXxXfKJda/6v8OfKu1sRwvKxulT1lm449LRvth9ridHmROtE4yfNeWeFwFfbc5R
SNvvygl3UsrVEXX4psTx3QgwlSCVqg==
=N8EB
-----END PGP SIGNATURE-----

--0GaUHtR0ybw6YgHM--


