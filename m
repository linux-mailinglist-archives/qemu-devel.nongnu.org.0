Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076B3BF883
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:38:39 +0200 (CEST)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1RQT-0006I8-O3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1RP3-0005Um-Q3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1RP2-00025P-5D
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:37:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625740624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kdnqT2Rz9/L7nEsiAdVto9ZI4AgNwk89HOISfmM3dGk=;
 b=QSo2WOGPvHbIcN+rFsNjnbUy86i/ingfcbj7EAil/fxzxsYSqTas8tnmGqMPWmkJXkkbUf
 g8+zS/rHJ70e6Do31Pv3C7pUTDhsZW9S7ykRqi7H03yIZuL3WTYwdenaq82eFH9sc7m3UQ
 USrUCJXpE1eiMpD3YsqC1TtRuMsD61w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-sQtLd9YuP_-k7VJe5pDv3Q-1; Thu, 08 Jul 2021 06:37:01 -0400
X-MC-Unique: sQtLd9YuP_-k7VJe5pDv3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E06580006E;
 Thu,  8 Jul 2021 10:37:00 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66653421F;
 Thu,  8 Jul 2021 10:36:59 +0000 (UTC)
Date: Thu, 8 Jul 2021 11:36:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707165813.55361-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BDdmxVhLMGdZa/mD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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

--BDdmxVhLMGdZa/mD
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
>=20
> The reason why we propose to use the existing job_mutex and not make one =
for
> each job is to keep things as simple as possible for now, and because
> the jobs are not in the execution critical path, so we can affort
> some delays.
> Having a lock per job would increase overall complexity and
> increase the chances of deadlocks (one good example could be the job
> transactions, where multiple jobs are grouped together).
> Anyways, the per-job mutex can always be added in the future.
>=20
> Patch 1-4 are in preparation for patch 5. They try to simplify and clarif=
y
> the job_mutex usage. Patch 5 tries to add proper syncronization to the jo=
b
> structure, replacing the AioContext lock when necessary.
> Patch 6 just removes unnecessary AioContext locks that are now unneeded.
>=20
>=20
> RFC: I am not sure the way I layed out the locks is ideal.
> But their usage should not make deadlocks. I also made sure
> the series passess all qemu_iotests.
>=20
> What is very clear from this patch is that it
> is strictly related to the brdv_* and lower level calls, because
> they also internally check or even use the aiocontext lock.
> Therefore, in order to make it work, I temporarly added some
> aiocontext_acquire/release pair around the function that
> still assert for them or assume they are hold and temporarly
> unlock (unlock() - lock()).

Sounds like the issue is that this patch series assumes AioContext locks
are no longer required for calling the blk_*()/bdrv_*() APIs? That is
not the case yet, so you had to then add those aio_context_lock() calls
back in elsewhere. This approach introduces unnecessary risk. I think we
should wait until blk_*()/bdrv_*() no longer requires the caller to hold
the AioContext lock before applying this series.

Stefan

--BDdmxVhLMGdZa/mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm1UoACgkQnKSrs4Gr
c8ijYAgAnl38jEm/TJv9H6zOkzTgSzwGIlAaCzFHm3F6dJDz8bBAyEVpNZt2s7rh
14MYld1LRFkQ1ToNdS+VzmL8QFHcMp2Tqyj+TROJhv/Mc+dIGjii/QGsyEehtHyM
v38yiaTqxuf+/Akgj2M5231I02HglNrohn1vX/pOgnH8sjtLtyEd5+kDNN4Rd8v5
FtfHSRfgYcDtqirqksSzSbDV13tCob/9ze+6SxodGpaUpKd+xJ/JZEkSBhCU06WZ
zvTxAjb35rj6uJhnoR2Fkz58xvVeekS6uH1sn9N3gF35vMaiS2cfZe1lxzkCAx4I
keZQRdpQ0u7TkpLCwtEMn8xBVt68ww==
=dsJ7
-----END PGP SIGNATURE-----

--BDdmxVhLMGdZa/mD--


