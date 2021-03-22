Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B8344C71
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:57:44 +0100 (CET)
Received: from localhost ([::1]:54978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONs7-0008HE-8S
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lONqs-0007E5-6U
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lONqp-00069W-FE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616432181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hxy8NcXviYkiClAQYzwoghBpLIIjbZx3kO7r4gR9Zt8=;
 b=Vd+IGTwQrt9yMFmvk3PHepUR4MhwJVFmMLAtL3ep8QwFUmbCzGlUivMFjY3SUgpHrCGOK0
 8gixZmwHJeYyHi7J/3Of2MpRQWC1bow6WvAF78sLGv120SQGf+gVUzBGxMsJwT4UGH1Fsc
 nu150KsHTbSlVDSNrpocWkFBzTy62gY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-niTllKJAMTaRaPY5xtYmVw-1; Mon, 22 Mar 2021 12:56:19 -0400
X-MC-Unique: niTllKJAMTaRaPY5xtYmVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34B3583DD20;
 Mon, 22 Mar 2021 16:56:18 +0000 (UTC)
Received: from localhost (ovpn-114-89.ams2.redhat.com [10.36.114.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DC351850E;
 Mon, 22 Mar 2021 16:56:15 +0000 (UTC)
Date: Mon, 22 Mar 2021 16:56:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH for-6.0 0/2] Fix use-after-free, if remove bitmap during
 migration
Message-ID: <YFjMLmUxQ7ZxpvWR@stefanha-x1.localdomain>
References: <20210322094906.5079-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210322094906.5079-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4lwRkPUyuGt1YgpG"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-block@nongnu.org,
 quintela@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4lwRkPUyuGt1YgpG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 12:49:04PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> Hi all! Accidentally we found on use-after-free. Normally user should
> not remove bitmaps during migration.. But some wrong user actions may
> simply lead to Qemu crash and that's not good.
>=20
> Vladimir Sementsov-Ogievskiy (2):
>   migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>   migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>     bitmaps
>=20
>  migration/block-dirty-bitmap.c                         |  6 ++++++
>  tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 10 ++++++++++
>  2 files changed, 16 insertions(+)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my cpuidle-haltpoll-virtqueue tree:
https://gitlab.com/stefanha/qemu/commits/cpuidle-haltpoll-virtqueue

Stefan

--4lwRkPUyuGt1YgpG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBYzC0ACgkQnKSrs4Gr
c8iogwf9HkziBQcyTh5qozD0CBohymbehln2UMsbLHG4xJP8eCfQOFGmXrkMgrz5
IqET678N2EQ3yDs4tvDwa3soOu7EWjGms6wqfhZgLGRlfMiZ9bltkejO3VJmTT40
bPZ96eAJjaSFKtQImCg0n137wFHuqiPVxTsSgEz5HrNp6WNrIQb+Ej80cTEPSday
GgfcRy7W9TC8I8Eli5fJ25Fv5Aw4m+M8t+EhwB8WwyNc81Qkdcnvcbm48OUV3oSC
NXcYLWjm2+sfcEPXX9TQnbE2DyApcG29TxYsHL3Z9tO15n6bdgV3WxPIBYX155qW
VGUl77UmL9YgfqyT58ynSAnJgjQ+Sw==
=YE56
-----END PGP SIGNATURE-----

--4lwRkPUyuGt1YgpG--


