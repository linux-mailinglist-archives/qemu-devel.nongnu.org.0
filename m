Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A812AD59F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:51:50 +0100 (CET)
Received: from localhost ([::1]:50930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSBg-0005FD-Ro
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcS6B-0008K2-3O
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcS67-0007Df-Rd
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605008761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IYFaCMc9nhjfdh7XfDF6SQjfPlmnHakQPcghHeJJ3yg=;
 b=a45Vop2mju4o1VX6Fq5Mq+IMOCNWGcNxnkISJp1p+DQzOo6nmDpFcJyq/dVNHp2Rl/v+b1
 wNrsImkT5mOjRXYjPAb6cFDIA7t9X3P+9JhtRlO1+qJq+35YAQPzIeQsYOS28lPxXZEJrF
 4bG/WpzVBacGNTKlRhv8iVoKjtHSS+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-85pDw4aMMLKqmZKSBXVl2Q-1; Tue, 10 Nov 2020 06:45:57 -0500
X-MC-Unique: 85pDw4aMMLKqmZKSBXVl2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 597E7809DEA;
 Tue, 10 Nov 2020 11:45:56 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 281095C1D0;
 Tue, 10 Nov 2020 11:45:49 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:45:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Haotian Li <lihaotian9@huawei.com>
Subject: Re: [Virtio-fs] [PATCH v2 0/2] virtiofsd: fix some accessing NULL
 pointer problem
Message-ID: <20201110114548.GA1084668@stefanha-x1.localdomain>
References: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <4bfe8bbd-282f-f271-735d-8892791327e1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 02:32:17PM +0800, Haotian Li wrote:
> Haotian Li (2):
>   tools/virtiofsd/buffer.c: check whether buf is NULL in
>     fuse_bufvec_advance func
>   virtiofsd/passthrough_ll.c: check whether lo_map_reserve returns NULL
>     in main func
>=20
>  tools/virtiofsd/buffer.c         |  4 ++++
>  tools/virtiofsd/passthrough_ll.c | 10 +++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)

Please consider printing an error message in Patch 2 so that users can
easily tell why the program refused to start.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qfWwACgkQnKSrs4Gr
c8i4vAgArY87Y44cegiCYSJGX/urC4kN1AkNe1Ok5SEoDC3DQwiyG/4ESHQRCAfL
Iq2h2yAFR5tZoIXwNa2A1e5X7X+YRhaKqW9cqUjrSPSX/gxT01SsZCytpvtaIrKZ
mvPG6Yv9xczSkOF+er9KNOAKMTGwLLNBfKgdXougDRcmWYjSeUBOy0wMZgUkl6P/
9+EzMgh9fl0KrMtnTh3j3d41M3Gg9yRCiZQuC1wv2xybC/yTUaQhN535snQB1Qtf
nBO1unge8Gzq0r8jGb5A9qqW0yh7YQWKReOZDF3k9UgZZjDIKVCSelK+iF0pCQeW
KNWYdOwNrRziGieSoUdvp1kALzDHNQ==
=RT3g
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--


