Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29634F02C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 19:52:31 +0200 (CEST)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIXW-00070C-Ec
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 13:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRIVU-0006F5-I0
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRIVR-0000Tg-8D
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 13:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617126619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w9KB+WgnfQiQF1XxqYLn9R83QcPIjshcvDauy04Cuww=;
 b=i5yDkonRBJLaNRCaRK7T4nEGfguzvinA/ODj7M73sJVohzB1AFkvs88Ozy1ntNd4pixlaZ
 ZRRWPii/Q3aX2cvrOlsp4FUFrJaQvAhodCDzp+YDOnpRV2ckjWOL0XY2ptRTQP6XVc1Vhs
 hy11sz1sOute6Y1fepgd9m4uYMFh8FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-eb5tDlunOZ2egWYjRGHMbw-1; Tue, 30 Mar 2021 13:50:14 -0400
X-MC-Unique: eb5tDlunOZ2egWYjRGHMbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C52A19251AF;
 Tue, 30 Mar 2021 17:50:13 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1403F19C44;
 Tue, 30 Mar 2021 17:50:12 +0000 (UTC)
Date: Tue, 30 Mar 2021 18:50:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 0/6] coroutine rwlock downgrade fix, minor VDI changes
Message-ID: <YGNk1H+NMBVEu1jh@stefanha-x1.localdomain>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WmH14DrerSoSnC1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: david.edmondson@oracle.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--/WmH14DrerSoSnC1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 12:29:35PM +0100, Paolo Bonzini wrote:
> This is a resubmit of David Edmondson's series at
> https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.c=
om/.
> After closer analysis on IRC, the CoRwlock's attempt to ensure
> fairness turned out to be flawed.  Therefore, this series
> reimplements CoRwlock without using a CoQueue.  Tracking whether
> each queued coroutine is a reader/writer makes it possible to
> never wake a writer when only readers should be allowed and
> vice versa.
>=20
> v2->v3: new CoRwlock implementation
>=20
> v3->v4: fix upgrade and add a test for that, too
>=20
> v4->v5: typo
>=20
> v5->v6: improve documentation, do not read lock->owners where
>         neither wrlock nor lock->mutex exclude concurrent writes
>=20
> David Edmondson (4):
>   block/vdi: When writing new bmap entry fails, don't leak the buffer
>   block/vdi: Don't assume that blocks are larger than VdiHeader
>   coroutine-lock: Store the coroutine in the CoWaitRecord only once
>   test-coroutine: Add rwlock downgrade test
>=20
> Paolo Bonzini (2):
>   coroutine-lock: Reimplement CoRwlock to fix downgrade bug
>   test-coroutine: Add rwlock upgrade test
>=20
>  block/vdi.c                 |  11 ++-
>  include/qemu/coroutine.h    |  17 ++--
>  tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
>  util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
>  4 files changed, 274 insertions(+), 64 deletions(-)
>=20
> --=20
> 2.29.2
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--/WmH14DrerSoSnC1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjZNQACgkQnKSrs4Gr
c8jX+wf/d7fT9PsjOTTcKQHBDjtYgg9mXZQ61Tp/0nRi4CEcKkxF963vdVwY7Yoy
pwL7TTGfy5t80iG+Ues/NZhNnZUUD+7wRv/Fih/HqF7PGjp6ib9lMgjYZNB6Hk64
/seseiUImxVws3w+Y59fZE4vQPIFA2k9sNX6UQvw5lckRSR9jtGS4UUtHGwBrUbL
Bmi4JP1hYarm2foXyYm9qxAUHh3dZXuPEKVJafoXlNNx8pqS0+jM2o7cBBMML7Le
kVEfoOdxzCF0I5a10bhXp/jUGCYq5bBKq0XXIDmMz/b6EqkhFNBMyIGi8cennbnP
seTB65sojS0H+yEgerz1BYIZ+pXUgQ==
=6N4P
-----END PGP SIGNATURE-----

--/WmH14DrerSoSnC1--


