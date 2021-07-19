Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 421593CD744
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:56:17 +0200 (CEST)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Ugq-0004FK-Ac
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5UfK-0003El-OS
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5UfH-0001mo-Cb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626706477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fv5RzRkoLuwImHtWd3x1YOGMoF+e1/54bXDBTKayp2o=;
 b=br+AsIlqWhOiyKZGyxk1WedUv3T6AYvhVM0oFpw/Pf6ioqZGd7BDkVjTFLPOLnr9D1sxlQ
 t6/4pOzDHfJnKgC7YxGAVFLsoo5RD/ItCz33hpzJZvTcfK41XS+yWKDjlYPFUV/x9Td9vH
 8y+XDzJtaesgcMf/+prJKxMt8ayw2CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-DLubOymlMJ2mwSlMnnBwGQ-1; Mon, 19 Jul 2021 10:54:33 -0400
X-MC-Unique: DLubOymlMJ2mwSlMnnBwGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6642802E65;
 Mon, 19 Jul 2021 14:54:32 +0000 (UTC)
Received: from redhat.com (ovpn-114-199.ams2.redhat.com [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC2CA5D9DC;
 Mon, 19 Jul 2021 14:54:23 +0000 (UTC)
Date: Mon, 19 Jul 2021 16:54:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YPWSHRLraiu0s5Bs@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
 <YPGkhtRrhc144vT7@redhat.com>
 <YPVGAqQlf0UDmsf0@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YPVGAqQlf0UDmsf0@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0WlN5xbkGr65N5Jf"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0WlN5xbkGr65N5Jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 19.07.2021 um 11:29 hat Stefan Hajnoczi geschrieben:
> On Fri, Jul 16, 2021 at 05:23:50PM +0200, Kevin Wolf wrote:
> > Am 13.07.2021 um 15:10 hat Stefan Hajnoczi geschrieben:
> > > AIO_WAIT_WHILE() requires that AioContext is acquired according to it=
s
> > > documentation, but I'm not sure that's true anymore. Thread-safe/atom=
ic
> > > primitives are used by AIO_WAIT_WHILE(), so as long as the condition
> > > being waited for is thread-safe too it should work without the
> > > AioContext lock.
> >=20
> > Polling something in a different AioContext from the main thread still
> > temporarily drops the lock, which crashes if it isn't locked. I'm not
> > sure if the documentation claims that the lock is needed in more cases,
> > I guess you could interpret it either way.
>=20
> I'm claiming that the lock doesn't need to be dropped in that case
> anymore - as long as the condition we're polling is thread-safe. :)
>=20
> Have I missed something that still need locking?

I'm not sure if AIO_WAIT_WHILE() actually ever needed the locking. I
think it's more a convenience thing since the callers would already hold
the lock, so dropping it temporarily in AIO_WAIT_WHILE() means that the
callers don't have to duplicate the temporary unlock everywhere.

> We could temporarily introduce an AIO_WAIT_WHILE_UNLOCKED() macro so
> that callers can be converted individually.

Yes, this makes sense to me.

Kevin

--0WlN5xbkGr65N5Jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmD1kh0ACgkQfwmycsiP
L9bKTBAAjiF3iMJHwMP+YKgWsimW2A0dOoCBAWqtu/42YuMB4fU3o8jRETCui+jf
EqI4G4Z65DkyPx2pAkNz56/j99limTog1pbCaQSPCbS4ILyynGv3eMk10y8DYLKS
RUE48MB4nSsOGdVOagy1Yy5oqJHJC2rXOQNqA9zZcJW0JuYcmZGSyht+p0kw9ktC
3AH6vA/k/kPF2UrnnsiQJzfGnwI5p6gwGmSpVgLVnSALcVmh0g+g0LSDT5MlHls2
Eq/eXoeQSYa4xHMqNZM+9V9ubcDW+nMyjRLi01hROBc6Gr42fpB8tGp52O/nPAe0
WYeSzhrKdB3q9g67gq2beJ2Lk1KKbMYPTnDU9k3ckXwPK3br9ZpQQn6CHhUf4L0o
6Cd9Oi8yERoFgtS7eJkGnpkY298Hqc+3RXydBUO0o2x+GRVP55oTmfPugE7FBeJ7
SFYfUyIRWbTxTx2Ux/igKkvG+SSXfUC83aF0Qj856l3KFD9mvdwS/lxUaE6mHqvN
HVmOn0ZGZwzBS/JFn3NM6NY4d+AnvwoqUUAgBbNNRs03csCzTXXnRHlX1T5gRwgk
mtqJc4jY9ENVM5m2ZeORv33yLc9e1aXtS4HcMMi7bd98ou64LpgzCuCzxLzgOCeo
0A95aVYEdpKbEIVgyTHaQjsRygharN0kDIzl5zpjqIRGSobrwYU=
=Emyr
-----END PGP SIGNATURE-----

--0WlN5xbkGr65N5Jf--


