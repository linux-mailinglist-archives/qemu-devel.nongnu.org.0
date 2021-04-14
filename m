Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C329D35F1A9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:49:38 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWd5V-0006ZO-9M
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWd2m-0004An-Rx
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lWd2i-0006l4-Nn
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618397204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/y95CYCUQIPscNorVhWGM4x1ni994pordKYGQWsWuzo=;
 b=OjbIMedI87nOYJgpZEu+kkKS16hdqxLes7p8LnYHC0SioUb8bswTXCDJmwYIHbzx/iIrnJ
 nrE7D79plzOsGnlhYdhcT/AcBcPkyS/c3NZlwSuE1Ac3haGTlB/F15sW9GcbLlO4I9VK4f
 0TdHikvkLWrWQj/VT/fEOKRMfPnU+mI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-V2ruyiLyPemnP4YiyTK8ww-1; Wed, 14 Apr 2021 06:46:42 -0400
X-MC-Unique: V2ruyiLyPemnP4YiyTK8ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D8D6D249;
 Wed, 14 Apr 2021 10:46:41 +0000 (UTC)
Received: from localhost (ovpn-114-209.ams2.redhat.com [10.36.114.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2C675D9CC;
 Wed, 14 Apr 2021 10:46:39 +0000 (UTC)
Date: Wed, 14 Apr 2021 11:46:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] ratelimit: protect with a mutex
Message-ID: <YHbIDnyGt51FXZXp@stefanha-x1.localdomain>
References: <20210413125533.217440-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413125533.217440-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JJvc46E2XDtHBDPk"
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
Cc: eesposit@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JJvc46E2XDtHBDPk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 02:55:33PM +0200, Paolo Bonzini wrote:
> Right now, rate limiting is protected by the AioContext mutex, which is
> taken for example both by the block jobs and by qmp_block_job_set_speed
> (via find_block_job).
>=20
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.  However, there is no existing lock that can easily
> be taken by both ratelimit_set_speed and ratelimit_calculate_delay,
> especially because the latter might run in coroutine context (and
> therefore under a CoMutex) but the former will not.
>=20
> Since concurrent calls to ratelimit_calculate_delay are not possible,
> one idea could be to use a seqlock to get a snapshot of slice_ns and
> slice_quota.  But for now keep it simple, and just add a mutex to the
> RateLimit struct; block jobs are generally not performance critical to
> the point of optimizing the clock cycles spent in synchronization.
>=20
> This also requires the introduction of init/destroy functions, so
> add them to the two users of ratelimit.h.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/block-copy.c       |  2 ++
>  blockjob.c               |  3 +++
>  include/qemu/ratelimit.h | 14 ++++++++++++++
>  3 files changed, 19 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JJvc46E2XDtHBDPk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmB2yA4ACgkQnKSrs4Gr
c8ib4wf/dls0+PN+JF5ibqT8uRQI20m9bWzr46a4P4YzkjV+/leF136cmxZAqxZu
9VJ7qrpsBvmM7++NzFHZiCZsEfQiO9vK9fIZUL97q9vGFZzYI9PIvpH6p7dRrK6p
oZlJUPywoK1X/yT9nOwjZA5c+j9cXG2WUJrDzRcHvcRSkWMVkTw1KFwiQ2U1FjXy
FsKPezBu5WivmjnUTaYXZwQ6hsEzfKjovYJzBfSiH7NGt54Yz/zvCkryitoEWNpJ
gWMH0Nx0N53Ah95qyh/U4O0uYiQN7bLlEOG/cx5TJQu4gE8ZZVp7TTju7crZ9TCa
99iMX/jAJ8itZHLeQTBW9+x8KLdu7Q==
=rC28
-----END PGP SIGNATURE-----

--JJvc46E2XDtHBDPk--


