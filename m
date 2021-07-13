Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48C3C7133
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:28:42 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ISm-00020L-TF
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IRN-000145-JP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IRL-0006Vp-MU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626182830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h+BWF0JiWWOpET8ChWdlj4XwCaLQbuU7Qkb2hMVsaUQ=;
 b=fuXv4KTus2lihrYijXFItOk0uNs9ePjMeWEdU5l69lbHBAy3cqRjvsMCE8XWzqRIC/sd0q
 OMmZqGe1bUhGeIqYvLxdkEyvFPwOvUTjcl/Wt8+UuPRaweAta4U63qb916t++wTdiOvNBL
 b+MDOy52NvnienjCyTBbeF3HxdpP3a4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-FDZOCvCtPoe1y5jovI4LDQ-1; Tue, 13 Jul 2021 09:27:06 -0400
X-MC-Unique: FDZOCvCtPoe1y5jovI4LDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC7F8B4A42;
 Tue, 13 Jul 2021 13:27:05 +0000 (UTC)
Received: from localhost (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4B0F5C22A;
 Tue, 13 Jul 2021 13:27:04 +0000 (UTC)
Date: Tue, 13 Jul 2021 14:27:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YO2Up729qsk6RthC@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YOb5EZndlckpruhR@stefanha-x1.localdomain>
 <1f85b7d3-41fe-e4e0-ec44-b3e1c22293ea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1f85b7d3-41fe-e4e0-ec44-b3e1c22293ea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2WS6SGkkIJduvcP8"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--2WS6SGkkIJduvcP8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 10:42:47AM +0200, Emanuele Giuseppe Esposito wrote:
> On 08/07/2021 15:09, Stefan Hajnoczi wrote:
> > On Wed, Jul 07, 2021 at 06:58:07PM +0200, Emanuele Giuseppe Esposito wr=
ote:
> > > This is a continuation on the work to reduce (and possibly get rid of=
) the usage of AioContext lock, by introducing smaller granularity locks to=
 keep the thread safety.
> > >=20
> > > This series aims to:
> > > 1) remove the aiocontext lock and substitute it with the already exis=
ting
> > >     global job_mutex
> > > 2) fix what it looks like to be an oversight when moving the blockjob=
.c logic
> > >     into the more generic job.c: job_mutex was introduced especially =
to
> > >     protect job->busy flag, but it seems that it was not used in succ=
essive
> > >     patches, because there are multiple code sections that directly
> > >     access the field without any locking.
> > > 3) use job_mutex instead of the aiocontext_lock
> > > 4) extend the reach of the job_mutex to protect all shared fields
> > >     that the job structure has.
> >=20
> > Can you explain the big picture:
> >=20
> > 1. What are the rules for JobDrivers? Imagine you are implementing a ne=
w
> >     JobDriver. What do you need to know in order to write correct code?
>=20
> I think that in general, the rules for JobDrivers remain the same. The
> job_mutex lock should be invisible (or almost) from the point of view of =
a
> JobDriver, because the job API available for it should take care of the
> necessary locking/unlocking.
>=20
> >=20
> > 2. What are the rules for monitor? The main pattern is looking up a job=
,
> >     invoking a job API on it, and then calling job_unlock().
>=20
> The monitor instead is aware of this lock: the reason for that is exactly
> what you have described here.
> Looking up + invoking a job API operation (for example calling find_job()
> and then job_pause() ) must be performed with the same lock hold all the
> time, otherwise other threads could modify the job while the monitor runs
> its command.

That helps, thanks!

Stefan

--2WS6SGkkIJduvcP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtlKcACgkQnKSrs4Gr
c8jxywf+KgVPwjsbIasK9mN2eQUvdH0SOumglH+HF7SWeH3PRreKPD+4RAh21AfF
EQJ3ISGuawsTXBOomx6cX5NAYpJx5Nm3B81sDS6Q6pTXr4RT1MmcZ8+TwNNNMapj
W3wmsjVj8friF/ZwqWdCODOSZ8Q+FN0QLHjpu0sDjbQDsVO9TG2oCt+BI7SiF6kv
7FbcRiVkgIC03bHGvRQekL5Pe7S1O4f4yXHAysGi106QxeDozwTCcwyQ8KxLCugE
ABhDS4bJk7RP0jmtL8NAtdDUQyfxck+2D3kDVnf6Ey/2swxbw4mszHQuajx1pt3O
hdorwNaOHPRKro/YekqBW5lZlMeWPQ==
=8gDJ
-----END PGP SIGNATURE-----

--2WS6SGkkIJduvcP8--


