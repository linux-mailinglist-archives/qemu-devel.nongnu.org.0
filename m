Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E5566EA2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:37 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8hyl-000372-Km
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 08:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8huk-00020E-Qb
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8huh-00033O-CG
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 08:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657025062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KMi8s6/nB7LUKgfrhG8KMmlvBSP4Wzs6jSmuUjfoNw=;
 b=GJlUCTf1trDzbqifQm3+FR5AXBaa0WE/MJf5JBronnSfgqnEDJc7ZMf8HkfV2NWAzAs3HJ
 2QKRVlnVm+X8GcWY5izO+OFspb3yyARs1x9lh5WM/oujpvyJXFa+avMZHKhIh4W5EQGj7z
 YqcOW5lRSvaDcK5FhaeTJPrpxMUVMO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-NhuYNjJRMYuoxrDy-sCWsw-1; Tue, 05 Jul 2022 08:44:13 -0400
X-MC-Unique: NhuYNjJRMYuoxrDy-sCWsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB87985A582;
 Tue,  5 Jul 2022 12:44:12 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD44F9D7F;
 Tue,  5 Jul 2022 12:44:10 +0000 (UTC)
Date: Tue, 5 Jul 2022 13:44:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v8 16/20] jobs: protect job.aio_context with BQL and
 job_mutex
Message-ID: <YsQyGVOEZNGpNXhA@stefanha-x1.localdomain>
References: <20220629141538.3400679-1-eesposit@redhat.com>
 <20220629141538.3400679-17-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oh3sAxHw4HTnR9bb"
Content-Disposition: inline
In-Reply-To: <20220629141538.3400679-17-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oh3sAxHw4HTnR9bb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 10:15:34AM -0400, Emanuele Giuseppe Esposito wrote:
> In order to make it thread safe, implement a "fake rwlock",
> where we allow reads under BQL *or* job_mutex held, but
> writes only under BQL *and* job_mutex.
>=20
> The only write we have is in child_job_set_aio_ctx, which always
> happens under drain (so the job is paused).
> For this reason, introduce job_set_aio_context and make sure that
> the context is set under BQL, job_mutex and drain.
> Also make sure all other places where the aiocontext is read
> are protected.
>=20
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/replication.c |  6 ++++--
>  blockjob.c          |  3 ++-
>  include/qemu/job.h  | 19 ++++++++++++++++++-
>  job.c               | 12 ++++++++++++
>  4 files changed, 36 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--oh3sAxHw4HTnR9bb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLEMhkACgkQnKSrs4Gr
c8hI7gf/UCE3QpDN+KedsHU67NChRrWsrriLroWXaOnkPjNPXHkRuin/MSOePBVI
jFDI3BaH4ZDz/GfeFyDUFB5kUcbYwHr9AAX5BweS9eMmzh4dCQQ29zv1Xti1vTL/
teqzfqzCTEppX/iW5enqk6u72/7dVs9dF7aovZ+CN1ASpAYjTQ/wHCPZHmeA5z/d
pZWaUHvY8FUwS1JST8ZXeuLa40GI7v6IsJzhhMLnCGY9wRQy1YiIrkn10DS/Zcqx
BatDgpNwhVjmb+fo7hW+IeLXzc0T86D46a1DwG1LRsE5JadwEiTYTAKJunc5iYzx
x8zgGpXeLPTO0h4lDA7bGqa5hMCyvA==
=Fx8n
-----END PGP SIGNATURE-----

--oh3sAxHw4HTnR9bb--


