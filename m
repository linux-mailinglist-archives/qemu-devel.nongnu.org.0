Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA2387A17
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 15:37:17 +0200 (CEST)
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizuN-0002HB-U3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 09:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lizcX-00018r-Fk
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lizcV-0001Lo-UD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 09:18:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621343927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n3dkuqixw04mVoPmOh9xl5ywhP1GeyDKjDDZfcQwKak=;
 b=Uj2PwTkgJKzq3cuYgeR2MboQnVS/p/PjsPg9bYQUwgR7N5aFg/lLZiIy8PDxGUvYNaPRbA
 AcrBxU4UbEDJA7ljbHHXiAgJ1QayS/aYq/WtVXliftL6fJPLfG4xslT3/IITBtME8gim4W
 F2ijopiJ5embjSZ7I2Cgi9JAJMKmMlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-9cWob4R5OHKxBSfNpN_Uow-1; Tue, 18 May 2021 09:18:44 -0400
X-MC-Unique: 9cWob4R5OHKxBSfNpN_Uow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C46C9F931;
 Tue, 18 May 2021 13:17:34 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A68CD3CC9;
 Tue, 18 May 2021 13:17:33 +0000 (UTC)
Date: Tue, 18 May 2021 15:17:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH Resend] block/quorum: Provide .bdrv_co_flush instead of
 .bdrv_co_flush_to_disk
Message-ID: <YKO+bPVIgKr+s/Z8@merkur.fritz.box>
References: <20210518134214.11ccf05f@gecko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210518134214.11ccf05f@gecko.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RLOGJeQfzmbJ5zN3"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RLOGJeQfzmbJ5zN3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 18.05.2021 um 13:42 hat Lukas Straub geschrieben:
> The quorum block driver uses a custom flush callback to handle the
> case when some children return io errors. In that case it still
> returns success if enough children are healthy.
> However, it provides it as the .bdrv_co_flush_to_disk callback, not
> as .bdrv_co_flush. This causes the block layer to do it's own
> generic flushing for the children instead, which doesn't handle
> errors properly.
>=20
> Fix this by providing .bdrv_co_flush instead of
> .bdrv_co_flush_to_disk so the block layer uses the custom flush
> callback.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Reported-by: Minghao Yuan <meeho@qq.com>

Thanks, applied to the block branch.

Kevin

--RLOGJeQfzmbJ5zN3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmCjvmwACgkQfwmycsiP
L9ZhjQ/+JEsK/34sQ5UI+/U+GIF/S2Cp2Qn5Zj8GRCnYfWCX8tuLcWLJ5lLSFAov
Yy+p8mUUyLSbYYAbvaYf6Nk0VMbPJDbl0W0JknOIXmZ7iZPs/voBCNi2etiVXw2K
rgfc4/+uCPI622rP/GMTh7g56Jrx+L+R8AqRJ3YlXtfmeP5w+BW1f+Ltd+udjP4E
hU+cTMuzbR2fzolQNuJsAxHwEcN0XupSatt5k0Jfa6bSIKIzWXsk8lY1PdLypHu9
JzhgxDrMZjB/O/Y5scoeOjmx4Oi60RR9ug6nrk/J93MGbxgjYM6EO96g4eR927Pz
cJbdsS/d0NBJEChhGOKszpAuEochA/+uaQlxuDY1QkekU8V8C5dCxPKKoX9ywXBb
zHXryDGG6wGJ2E5ImdwuS4ilBMqD2FhlayuOJGe0JGsO1zak8IkyMVM46GSo60zs
sJ1vhEw7uQsM7n3cAuZOwxdOLq0+lIzGjP+ROCuxDwZUT9p1coxD3pW6K33schCs
uPkG7NK9XUv9dyzb7sYObswKCy3yIJU9ogvZ7YM0LdHvhQ5W9KAq9q1LE14+jdTq
O2liTSjJSXbBecFY31NqrOs958cH23nF3gUx3dTylbdFhxgx658TiWnKWrzn5kWq
GOIEdiTmer7hyj2ZqH/k1vjFA0zSkgYd2LF7I2RakwR5WNLMd2k=
=NS9p
-----END PGP SIGNATURE-----

--RLOGJeQfzmbJ5zN3--


