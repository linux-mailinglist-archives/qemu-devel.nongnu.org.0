Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DF34EE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:56:48 +0200 (CEST)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHfb-0007jk-Hp
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRHe1-00076v-RV
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRHdz-0001dz-E3
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617123306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=guHRS33eXArM2dG5UXbhC9Lz+W6VS6idO1v1fgWCt5s=;
 b=ed/Kh6jUInArVua5Uc9wfxx0Vzt4dPiS27Wl/ACKZttZIx9mv71Mm6OmC/RMRn0pH3RH5z
 3DUmP97roAic3jUr6QoMcRxKROqglrBzYNrYGzEd4H7wEuGpDOOOY20AB537VUhPmASQlh
 3tLxcoZGhNEPibl0y6FN0SLDAoFaTtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-pJ_tUOWiOOaamCTTzC18eg-1; Tue, 30 Mar 2021 12:55:03 -0400
X-MC-Unique: pJ_tUOWiOOaamCTTzC18eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D143118C8C00;
 Tue, 30 Mar 2021 16:55:02 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63C5118966;
 Tue, 30 Mar 2021 16:55:02 +0000 (UTC)
Date: Tue, 30 Mar 2021 17:55:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 4/6] coroutine-lock: Reimplement CoRwlock to fix
 downgrade bug
Message-ID: <YGNX5fkeYAQuWXpH@stefanha-x1.localdomain>
References: <20210325112941.365238-1-pbonzini@redhat.com>
 <20210325112941.365238-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210325112941.365238-5-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kyUPYghkFZogJgWo"
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
Cc: david.edmondson@oracle.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kyUPYghkFZogJgWo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 12:29:39PM +0100, Paolo Bonzini wrote:
> An invariant of the current rwlock is that if multiple coroutines hold a
> reader lock, all must be runnable. The unlock implementation relies on
> this, choosing to wake a single coroutine when the final read lock
> holder exits the critical section, assuming that it will wake a
> coroutine attempting to acquire a write lock.
>=20
> The downgrade implementation violates this assumption by creating a
> read lock owning coroutine that is exclusively runnable - any other
> coroutines that are waiting to acquire a read lock are *not* made
> runnable when the write lock holder converts its ownership to read
> only.
>=20
> More in general, the old implementation had lots of other fairness bugs.
> The root cause of the bugs was that CoQueue would wake up readers even
> if there were pending writers, and would wake up writers even if there
> were readers.  In that case, the coroutine would go back to sleep *at
> the end* of the CoQueue, losing its place at the head of the line.
>=20
> To fix this, keep the queue of waiters explicitly in the CoRwlock
> instead of using CoQueue, and store for each whether it is a
> potential reader or a writer.  This way, downgrade can look at the
> first queued coroutines and wake it only if it is a reader, causing
> all other readers in line to be released in turn.
>=20
> Reported-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> v3->v4: clean up the code and fix upgrade logic.  Fix upgrade comment too=
.
>=20
>  include/qemu/coroutine.h   |  17 +++--
>  util/qemu-coroutine-lock.c | 148 ++++++++++++++++++++++++-------------
>  2 files changed, 106 insertions(+), 59 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kyUPYghkFZogJgWo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjV+UACgkQnKSrs4Gr
c8gSJwgAmNn/ADv7r2BJTrnEaKZS671vGLHgE/Tvxcykq0Z5WwQbflIKGD9zmpT5
S5ENWxGDnfl5jOnOWoq3HqxJv5ukm0k8KnhhrBmY2DdIGF5EKqcX0h1oQkHH/BwA
qBoQ2S/XM7SjwVyetCygwZOx3nMPcBx5ZSSGTh6hAEgJZAqvT0RHcUWf8GQygsoc
JeQTPK1p3JnEx/0J3XQbKiFmj3rsiGd70XTL3xMMEF7+CNbEu2NDDTZX7fZAdyav
Eq8W4juraIK0aPzYpn6xqqqt2F9Np2Gz5YCk7/2vwXoaB/a6OU8r7upo3ZK/8eQH
lf410IS+JF3I1gB4bV+RLgUXDm3c3g==
=/WGz
-----END PGP SIGNATURE-----

--kyUPYghkFZogJgWo--


