Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D59373817
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:50:12 +0200 (CEST)
Received: from localhost ([::1]:45616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEAV-0002Qx-1H
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leE8H-0001Sx-Ns
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leE88-000384-J6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j95ketHzt8VgVeyZ//pzjrA9vfBQkKU7nihKYgPG0P8=;
 b=FlYl8LSOaxUEZ8zdLx5EXgyEpHyHl5d1S+Yihmupg/QMtSQwE4cMRvhVYxM/+RKgxdosg0
 5azpKOqwJBN291/1WJxcAo3c2atZ3uiVwpGlo2/HrGboyhI92/XMyUfa1AF8AW43aSmPHh
 dQD+LnvEJCxsmMLM8fMU+/7Bv6/PtE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-1wWlzkHWNJmXCYscv3bnuQ-1; Wed, 05 May 2021 05:47:38 -0400
X-MC-Unique: 1wWlzkHWNJmXCYscv3bnuQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEBAB818411;
 Wed,  5 May 2021 09:47:36 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BDB260CC6;
 Wed,  5 May 2021 09:47:36 +0000 (UTC)
Date: Wed, 5 May 2021 10:47:35 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 3/8] util: use RCU accessors for notifiers
Message-ID: <YJJptwo5z6sxiN8q@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-4-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-4-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L+9X7pmrtYeaYj9B"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--L+9X7pmrtYeaYj9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:55:36AM +0200, Emanuele Giuseppe Esposito wrote:

What is the goal? Making the notifier APIs usable from multiple threads
(when callers respect RCU)?

> Note that calling rcu_read_lock() is left to the caller.  In fact,
> if the notifier is really only used within the BQL, it's unnecessary.
>=20
> Even outside the BQL, RCU accessors can also be used with any API that ha=
s
> the same contract as synchronize_rcu, i.e. it stops until all concurrent
> readers complete, no matter how "readers" are defined.  In the next patch=
,
> for example, synchronize_rcu's role is taken by bdrv_drain (which is a
> superset of synchronize_rcu, since it also blocks new incoming readers).
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  util/notify.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

No doc comments are added/updated so the RCU support is kind of hidden.
Please document it explicitly so that it's easy to write and review code
in the future without remembering implementation details of APIs. Using
"rcu" in function names would be most obvious and require no extra
documentation, but it probably makes more sense to have doc comments in
"qemu/notify.h" to avoid renaming everything.

>=20
> diff --git a/util/notify.c b/util/notify.c
> index 76bab212ae..529f1d121e 100644
> --- a/util/notify.c
> +++ b/util/notify.c
> @@ -15,6 +15,7 @@

notifier_list_empty(NotifierList *list) should be updated to use
QLIST_EMPTY_RCU().

--L+9X7pmrtYeaYj9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSabcACgkQnKSrs4Gr
c8iziAf7BRi1+i3wZtfL68QGwvbGfNFNtmN882PSM44r14X3NSw+lStNODMWRgh8
0x7F0o6mfFORkek//fNn7FqRbwSUaL9HWW4TTjxK9fqyP3ywVYD3mMz4CRq/+JYC
OwQx/2fKIqidkgrW+cKnrriCOpbGrbYWTfHNnJnvqaqAFsac3H2P6i06CXvFDr6z
T5rkU8wQpGQtrMKm2MqTMX7EXC05fm9z+dvkhnF1gGM+gUpnHX8EAbX3jHcQpSd4
qlv4DmUOc8vMj+GCRekbV6oqIk2b/TnY2gGaFNKC+Or7fvrYkf6AEBjR5jZ90KHM
8V2oGNCYSIRW2/im/JTc9H0ZV7wFZA==
=wW6P
-----END PGP SIGNATURE-----

--L+9X7pmrtYeaYj9B--


