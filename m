Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F63C13F8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:12:19 +0200 (CEST)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TpC-0000aB-QP
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tmk-0006qk-MH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Tmh-0000EZ-AG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3XsmfzRf1PBY3Tu9OumXELiPCbtyi/fz/kRhRi9QdAk=;
 b=R7ZN4rt5oGVufPA+HAkoYV9mh9l/rLCG44ZqCKtDC+cuKFqcPHlyou0xbdIx++NO+OQdnV
 uDHUmlvKty/7EWXoiHBN3hqtruecxI15et5EoVU9tMbtAQdQ1AmupLaC9HurXR+19qyDal
 vOw3V5cV1YeokoHDch5NDqzuZ5vlFK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-KugiIHp2OmGwUwVR5uxX2g-1; Thu, 08 Jul 2021 09:09:41 -0400
X-MC-Unique: KugiIHp2OmGwUwVR5uxX2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7204C100C664;
 Thu,  8 Jul 2021 13:09:39 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8C9C5C1C2;
 Thu,  8 Jul 2021 13:09:38 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:09:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YOb5EZndlckpruhR@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EvFxS9LmEmg8siPd"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EvFxS9LmEmg8siPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 06:58:07PM +0200, Emanuele Giuseppe Esposito wrote:
> This is a continuation on the work to reduce (and possibly get rid of) th=
e usage of AioContext lock, by introducing smaller granularity locks to kee=
p the thread safety.
>=20
> This series aims to:
> 1) remove the aiocontext lock and substitute it with the already existing
>    global job_mutex
> 2) fix what it looks like to be an oversight when moving the blockjob.c l=
ogic
>    into the more generic job.c: job_mutex was introduced especially to
>    protect job->busy flag, but it seems that it was not used in successiv=
e
>    patches, because there are multiple code sections that directly
>    access the field without any locking.
> 3) use job_mutex instead of the aiocontext_lock
> 4) extend the reach of the job_mutex to protect all shared fields
>    that the job structure has.

Can you explain the big picture:

1. What are the rules for JobDrivers? Imagine you are implementing a new
   JobDriver. What do you need to know in order to write correct code?

2. What are the rules for monitor? The main pattern is looking up a job,
   invoking a job API on it, and then calling job_unlock().

Stefan

--EvFxS9LmEmg8siPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm+REACgkQnKSrs4Gr
c8g1YwgAx/oJj9Jrh2RooLlzi/c0ZIL2n6VUzUYVPOSK6EO+9KIpF4dUt58DAPDQ
7n6gkVtWEnEbzfUqnujzw5X4BrrbDjkwJA4P44tD0qOjYpN/yd9ZKHx+sSuziVNt
v3+5lYk0JS3Zn0QFjo0hi+1zBYIadi9GpcdZTqo0whfh3weCJOur3pnwUSSWn/Fw
WFGZGo+KGcaH1UUG4HlrllvktWIr+MM3M53k7IkVG6g/GdCn1w9DIurU2VKEr0x6
tjBjMzP/Ml/MJLLXPlNifT3WxYAnPa03XCu9WsXBNlnSpYo4GCgruwdwOgw9rhHB
N4XdT+KmxxdpmH80h9wu9NxEffWEsw==
=wnEw
-----END PGP SIGNATURE-----

--EvFxS9LmEmg8siPd--


