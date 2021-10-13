Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147042BC3C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:56:56 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mab0J-0003FS-2e
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maamY-0005pP-QP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:42:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1maamX-0005F5-6A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3Lp3BmTN9OBaVsFCsPFROjGc3vT6eGZPM/8Ya/pi7A=;
 b=M/iu40ZmqQVNaFCm2n0MmHrYlonRs+gA1U+MrHhtqC8NLDDX41jG4B3xlk3fWmxQICyZ49
 Z046YxWofdGEb6wLgnNbV3ERMTB7ogsuFFtqw1SV62yYrPH7w5chaPSkosfs0daZeRYGI5
 7TJjKVcvj2HMRbA42Lvwzk4KjEqO+A0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-mkN3tHAePUOX5PGlnoaSzA-1; Wed, 13 Oct 2021 05:42:37 -0400
X-MC-Unique: mkN3tHAePUOX5PGlnoaSzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 097F21053C7A;
 Wed, 13 Oct 2021 09:42:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 638DF1B5C0;
 Wed, 13 Oct 2021 09:41:50 +0000 (UTC)
Date: Wed, 13 Oct 2021 10:41:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG skipping
 mmap_addr
Message-ID: <YWap3fYyKXE+3f1J@stefanha-x1.localdomain>
References: <20211011201047.62587-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011201047.62587-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jt3h7Yh5MHldU5Wy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Coiby Xu <coiby.xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jt3h7Yh5MHldU5Wy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 10:10:47PM +0200, David Hildenbrand wrote:
> We end up not copying the mmap_addr of all existing regions, resulting
> in a SEGFAULT once we actually try to map/access anything within our
> memory regions.
>=20
> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
> Cc: qemu-stable@nongnu.org
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Cc: "Marc-Andr=E9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jt3h7Yh5MHldU5Wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFmqd0ACgkQnKSrs4Gr
c8jFgggAqjS6isGMx1dYG8ffbBaAAbE2tssPlBJVdJAU7XEqsmbhGgqcNBhqPt+e
AJ2mSwIHgIJshyK7LLazPjazCst2u+ALTj2pEi0T/ZSCXEgqU5x4ZmHm99mlWQPp
8XRp9M32zfa8hmMjTXh5Ynez7X1+8NZc9BKsDoQcE0v+ucV4Kg7IWNzfc7SMVbNR
glpvuI5ZoGLlNe8Uuh2BVl2htvsAo6pN4qDbldCQiNFbwSpKgbUlLnZlRDDbX4Oy
SINy0iChPc4DjoxKXDngkRzOemTp6NV+XXU+554Vti/hEES04cYuvS+fwYHiTI39
Qfv73HbIcZtK9tn/lEtQ+/VTPdP1EA==
=hIg9
-----END PGP SIGNATURE-----

--jt3h7Yh5MHldU5Wy--


