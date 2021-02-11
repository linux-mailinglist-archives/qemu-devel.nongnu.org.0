Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C156318B41
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:58:53 +0100 (CET)
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABYa-0006sA-2a
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIv-0002Nw-Dd
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABIt-0001GZ-Un
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=shvt80EQH6NhdlRKAUbE2O8ZKVtBUyt+nP0EDC2lmrQ=;
 b=XHH88yV0xLdXbpiblXMRmeF2MxDAQJmpx1CxTZ7XnQpHrB3mrItV+2HwPI9qnzsKLv90jp
 Oy1rQ/NZQQ0U7RhupYOTSq4Iy/sd2WClUbn/6IPDLOWKzuvaoEeDzud4TVOvPAoeBV2oqa
 1XUU8ctXM1yPTerAnU+GaFUhEEcOsXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-B9WYkzFGMpGr6xslz1UYhw-1; Thu, 11 Feb 2021 07:42:36 -0500
X-MC-Unique: B9WYkzFGMpGr6xslz1UYhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E130880403A
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:42:35 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB6CA5D9E8;
 Thu, 11 Feb 2021 12:42:25 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:42:24 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 15/24] DAX: virtiofsd: Perform an unmap on destroy
Message-ID: <20210211124224.GP247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-16-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-16-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zn4k3Q+N5puqXur4"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--zn4k3Q+N5puqXur4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:15PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Force unmap all remaining dax cache entries on a destroy.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zn4k3Q+N5puqXur4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJjAACgkQnKSrs4Gr
c8h0QQf/Y+nocbSfwxxIWY1gxZT7QmiUhimJdTWI2u1GigEhfgOmZv/YMXPwTlcj
IkmkAHd0m0FOgPhywjK+bN6xW8r/+MFuDGoCZEE+yt2mjZQByzkQOmL7xIXN3BBg
seJQ50AeqYoFw9iE6zVlGUX6boFZEAEhA4ArzEH4t7Hl8nl+pwBw7YQtxUJxfVC/
EGbZt2bxiLSPRooJ4aL4lc1HLeQmL1ByV5yJLRxyQbF5NgaihZOwz1TlaoJ4Laoc
KGVadJxDX+T1AjS6q7kBRv3l4AW4Nh/WPkHEt6J8JRMMIzdhR6GmEwqLYGrsx60m
BlUVIXsFwTd/EKdkbyfxqvPn309A3w==
=rSU5
-----END PGP SIGNATURE-----

--zn4k3Q+N5puqXur4--


