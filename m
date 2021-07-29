Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F190F3DA92D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 18:34:43 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98zb-0007BK-2O
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 12:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98wc-0004qZ-MR
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m98wa-0001KO-SC
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 12:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627576295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n2fGwPC3bD5Nf78BpHpCBaAVhpP10wMFg/SEivtrS2M=;
 b=HsUvtocKGfLdWdGWGKpiiSErTaabfSdlH2jUnqXx93Jz23RzJMxd6HIDw6GhuBeMcjv6LE
 KsrsPgk8BTwlLTp+keP2ikBaQq+2WWlQmVsyUQyapCkNfhiuytLUxrWbyfzSd3zvP9M1N6
 GUPKljBlzDABHraftQi4kkgD6kPhMUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-atgw0-XwO0eg2ZSqbkJD6g-1; Thu, 29 Jul 2021 12:16:00 -0400
X-MC-Unique: atgw0-XwO0eg2ZSqbkJD6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98AA190A7A6;
 Thu, 29 Jul 2021 16:15:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C1951007606;
 Thu, 29 Jul 2021 16:15:54 +0000 (UTC)
Date: Thu, 29 Jul 2021 17:15:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Message-ID: <YQLUOVXgDjRuAZLQ@stefanha-x1.localdomain>
References: <20210729091029.65369-1-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210729091029.65369-1-f.ebner@proxmox.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UQvkFmE9k0HBqj8p"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UQvkFmE9k0HBqj8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2021 at 11:10:29AM +0200, Fabian Ebner wrote:
> Linux SCSI can throw spurious -EAGAIN in some corner cases in its
> completion path, which will end up being the result in the completed
> io_uring request.
>=20
> Resubmitting such requests should allow block jobs to complete, even
> if such spurious errors are encountered.
>=20
> Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>=20
> Changes from v1:
>     * Focus on what's relevant for the patch itself in the commit
>       message.
>     * Add Stefan's comment.
>     * Add Stefano's R-b tag (I hope that's fine, since there was no
>       change code-wise).
>=20
>  block/io_uring.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--UQvkFmE9k0HBqj8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEC1DkACgkQnKSrs4Gr
c8hNcAf+LmWyCLQyB4qMKVnJAdUPATuNQ06dm1M5rYBHbV6cJMakOSBqT891MPx8
yGcx8kAUlZVGVL+LzwCb9CiauC9/FJk2WWLsXd4AF3OuYmiey0vEzxqHO5yQat8C
Tmc7dvWglsCf53B02pIv3RrpfNAlWrQzHuv2NxLfqCPxK4CZ0z4xeTEQzypYerkz
e81fFIN5iR+/u26ZgWeuMJS/QKNpwGMjXtAdSUdWSHiPmKfFW9EB9md1ZVoo2aax
9Y4Q0Nxf+7s22gn4M8TT9s4gnTTDGJH4s17uWvKCsZTEQqjZHT5e7cnHZCGLRAN3
eoQKsOtUp8eh2RbElifQ+Q+OIp1UHw==
=aoJt
-----END PGP SIGNATURE-----

--UQvkFmE9k0HBqj8p--


