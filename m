Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452492DB281
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:28:34 +0100 (CET)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpE7l-0008FZ-Ao
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpE6U-0007hQ-R6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:27:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kpE6T-0005ku-9Z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608053231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CRT2RnWTC2KUg0aduM+3r6rfK5Si5JdLSD0xOCp5zu4=;
 b=EYxGJiXtFN9HV3c6FVYlF+XQFDXIT8taXZFOg1wFSiO/DV0npGXLCLZhRusN9mKHDIYNlK
 QuYYlZEKa76ELhMIVr6adpemFeyho7qE7K8IvyQNMPJbwBGjyJuokyGiw6Qxx7iJhk9d0p
 0P9n4nT87QXSeMNp2BqtdgTX5JU/0yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-tUoFMpo_Oh-DKH_WWSxhMg-1; Tue, 15 Dec 2020 12:27:07 -0500
X-MC-Unique: tUoFMpo_Oh-DKH_WWSxhMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F28C11936B9E;
 Tue, 15 Dec 2020 17:27:00 +0000 (UTC)
Received: from localhost (ovpn-114-253.rdu2.redhat.com [10.10.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D5617445D;
 Tue, 15 Dec 2020 17:26:29 +0000 (UTC)
Date: Tue, 15 Dec 2020 18:26:28 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 4/4] block: Close block exports in two steps
Message-ID: <20201215172628.andsendtcqcgtdkr@mhamilton>
References: <20201214170519.223781-1-slp@redhat.com>
 <20201214170519.223781-5-slp@redhat.com>
 <20201215153405.GF8185@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201215153405.GF8185@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2qqvpnhxsbc774i"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--f2qqvpnhxsbc774i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 04:34:05PM +0100, Kevin Wolf wrote:
> Am 14.12.2020 um 18:05 hat Sergio Lopez geschrieben:
> > There's a cross-dependency between closing the block exports and
> > draining the block layer. The latter needs that we close all export's
> > client connections to ensure they won't queue more requests, but the
> > exports may have coroutines yielding in the block layer, which implies
> > they can't be fully closed until we drain it.
>=20
> A coroutine that yielded must have some way to be reentered. So I guess
> the quesiton becomes why they aren't reentered until drain. We do
> process events:
>=20
>     AIO_WAIT_WHILE(NULL, blk_exp_has_type(type));
>=20
> So in theory, anything that would finalise the block export closing
> should still execute.
>=20
> What is the difference that drain makes compared to a simple
> AIO_WAIT_WHILE, so that coroutine are reentered during drain, but not
> during AIO_WAIT_WHILE?
>=20
> This is an even more interesting question because the NBD server isn't a
> block node nor a BdrvChildClass implementation, so it shouldn't even
> notice a drain operation.

I agree in that this deserves a deeper analysis. I'm going to drop
this patch from the series, and will re-analyze the issue later.

Thanks,
Sergio.

--f2qqvpnhxsbc774i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/Y8cMACgkQ9GknjS8M
AjUkDRAApetpCE3uZgwqDD+iYgtyPIC0m50Ehe0DFhC7yDo9Fnh5gwBkI4jetoN1
q+eNqnBcD9hjLsTbc8ffCWVU6i8AGLA5K+usJ6Erm3iBTttHcpvG+sdSRpam3hjk
dGXuBK9AE5PHIbSxDOCi2LuX9FCyUrCWiTAE/lnRnkNwhfsPnJcamDjIBRFPdE99
0kDjGuL63UpVdsTAHu5B5KvSaCyY58SZk/aQLl7PIMoVIWvYuE8xBzO/MCFK6js8
WGokHSqqIJPjoHKBLNxU2m7HCWt2E2kTxxmL21GfgdKC9vW0pxB7vXdQI8RYuM2D
jpX9w6EMnUT+WnfUldv0qfFLE0XolM8YEw0is4Y7u8oNRHeW9hgyEM1QCnv3gdc8
XAVgKB2X2/NPboPz9+pGsS/06RN1y6vMLA/aW0YWTcf8p8MGEpiIcR+nmX4LbFUH
qD0a8GrpTmVOWZGGeFdiwxxlCOzvC7NftdSCaJeLjf3BxpuW8Ok8+HE11oya7iYY
ZZvf3SHttWNdxGQCSUNCiM8Z7BkQne0sBqBw94bfRwLbh8BRhytSS6RvWxePSXKo
k7L4Er1z9/T+8RGuIZcJ/Qmc6NOoSmYyxpJ8lhFdyLe3cIXh24Fkd5yla6Qo6HQW
rEp1FBZcAZjS6nD8XeKXKIPkXYEuspjwv12XprG7BFT3zp0rcRE=
=aKje
-----END PGP SIGNATURE-----

--f2qqvpnhxsbc774i--


