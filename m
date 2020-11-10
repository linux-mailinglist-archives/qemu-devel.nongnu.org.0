Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E284C2AD674
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:37:34 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcStx-0000ab-W9
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcSsc-0008St-Ts
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcSsb-0007oe-A9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605011767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=luNkKD9xgVUhBaObUx9m1v6nEfZrGHxBw4AGBjtU+4U=;
 b=NL8TJoagrapKKo3RHvwDXTKVNpdYAWmHvdlaSHri7Zgby+rsGw5fzui69EQAlahvJqQPnV
 6YkZb3IOuXJASQy/82Lx4ymQwFXZVpQswy+LxkvU6e+34tQ19OUlpiIpawArRcZvDl6CYy
 A16uRdDlRYvKRGOZX2jhwad6JC0OJic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-juhu7p4TMxu84JKUsAGnng-1; Tue, 10 Nov 2020 07:36:05 -0500
X-MC-Unique: juhu7p4TMxu84JKUsAGnng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70B971084D60;
 Tue, 10 Nov 2020 12:36:04 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF0705DA6A;
 Tue, 10 Nov 2020 12:36:03 +0000 (UTC)
Date: Tue, 10 Nov 2020 12:36:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid
 potential integer overflow
Message-ID: <20201110123602.GC1084668@stefanha-x1.localdomain>
References: <20201109150522.10350-1-peter.maydell@linaro.org>
 <4c65f0d3-3769-b659-985f-f0cc5263a41e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4c65f0d3-3769-b659-985f-f0cc5263a41e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 04:16:45PM +0100, Max Reitz wrote:
> [Cc-ing Stefan]
>=20
> On 09.11.20 16:05, Peter Maydell wrote:
> > In vu_blk_discard_write_zeroes(), we read a 32-bit sector count from
> > the descriptor and convert it to a 64-bit byte count. Coverity warns
> > that the left shift is done with 32-bit arithmetic so it might
> > overflow before the conversion to 64-bit happens. Add a cast to
> > avoid this.
>=20
> This will silence Coverity, but both functions to which range[1] is then
> passed (blk_co_pdiscard() and blk_co_pwrite_zeroes()) only accept ints
> there, so this would only move the overflow to the function call.
>=20
> Shouldn=E2=80=99t we verify that the number of sectors is in range and re=
turn an
> error if it isn=E2=80=99t?  (The same probably goes for the starting sect=
or, then,
> too.)

Yes, the input validation from hw/block/virtio-blk.c is missing.

I'll send a patch to add that.

Stefan

--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qiTIACgkQnKSrs4Gr
c8gwCgf/bb+C6RUAWGNJj45nkHGjVxyd3G/GksBdTNJIZlXOTi8925IP248pKqqp
pHS69v81qVPb0udaYqPEuOZgWXPERUqAz3ZHobqtvKAQOqtVdGPyuIwpJCEgamA7
F4iDI4Jm1Uw/e/c/kGXcuG4w0QJf7tDwfE96q63nrkGOMHf6bjcXa+wijueb1Qq9
ybAnBS6oXFBeTFD+5+fluapbRb1e23lMoxEEHbpaGQbO/w95CbhJiJ6mSAVO970c
nowMny2OTUQn92wD+hYFN6CQNyZuYfmP/O3CxZ0jFxX9t15GiUi7YYVQ55wBaUbN
pAekKLTRVxrQ6baiuvtsmP4oGx/6AA==
=OTmq
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--


