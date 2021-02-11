Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB9318B3C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:55:10 +0100 (CET)
Received: from localhost ([::1]:50912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABUu-0003YC-E4
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABHb-0001Gj-EM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lABHX-0000jb-RC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613047274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1AwoeIRKkzqj7685FQEQYKvX5OvHHCDxFA1YSDkDn9c=;
 b=M8JrNIwE8YvtIauV1bxiXRom/wyaAbAOOeBT9B6pIxbOmauWpJHVYvydv+VjypU/Sxvnfv
 bpIFRaIhvIGLYp7DBA07QBW5WIjyERRt8WZAIYR72vuAT4gYD+ShO/f4fjLtYDaJ6FWeDJ
 O9EsUKxOPqpyEUpI1easxkmyZoXdyH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-8EbaqtUIPPSPAAIxZOc4Sw-1; Thu, 11 Feb 2021 07:41:11 -0500
X-MC-Unique: 8EbaqtUIPPSPAAIxZOc4Sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B393427C1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:41:11 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7545D6B1;
 Thu, 11 Feb 2021 12:41:01 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:41:00 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 12/24] DAX: virtiofsd: Wire up passthrough_ll's
 lo_setupmapping
Message-ID: <20210211124100.GM247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-13-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-13-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1rguoi8KZGYj2k4L"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--1rguoi8KZGYj2k4L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:12PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Wire up passthrough_ll's setupmapping to allocate, send to virtio
> and then reply OK.
>=20
> Guest might not pass file pointer. In that case using inode info, open
> the file again, mmap() and close fd.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> With fix from:
> Signed-off-by: Fotis Xenakis <foxen@windowslive.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c  | 13 ++++++--
>  tools/virtiofsd/passthrough_ll.c | 52 ++++++++++++++++++++++++++++++--
>  2 files changed, 61 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1rguoi8KZGYj2k4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlJdwACgkQnKSrs4Gr
c8gH8QgAqAobAbMgwOGaUBEFonnTzUmoiBb3BHhpHRO47WrHNjp1uERsKoPepTiA
/wvERadsmtTyLWzwlemkBMdDiHGnX3lP2gfClKN3/zu/7HrtH+FauO3+NZjvf+Lx
BSx+bwxqXbc7wDvY3KVXOpkafgCVEZ64NuYmvFihxXinJnDy4ELpCb+9ZxwOfTiv
cgCuD4etpG4Mcvfs/3hH19mywkoAghvrRNO4dcEmX+H465Vlj9JEWeAmwurYRyoj
XUEnV0WbzpyW93ZUrQ4vFbcHuAEZlGe47hOvWGSa3sBfoCaNAAMOpqiKvcgfvRbJ
5OPPx9wSbuKBbRXlOOseKm7r7owuRw==
=c9jC
-----END PGP SIGNATURE-----

--1rguoi8KZGYj2k4L--


