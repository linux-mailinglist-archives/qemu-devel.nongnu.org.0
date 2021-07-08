Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFB3C1413
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:16:57 +0200 (CEST)
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Ttg-0000zm-Tc
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Ti4-0006RV-I5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m1Ti2-0007gp-SH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ViTWauDbT6ZDglgHi0j9WIJ/SxIojB3/odAVmDp1jWc=;
 b=SNOF7dAmt/7lRL9uoOgIuNx4FxNLHRinqWR3KGlt7ifenPsWo+4oPk5OEtzbKBQ67Ew2ZL
 cahiRFC5M0ikZmCqUhaE9Qp1rLhOPMXYOhntvtnQGOvRqn60xUCOhrVqABh8szj0fAtsAN
 hGvq9RrlKbiSrE+dHIvnySiTVc48zmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-IguM2CwMMyqLSKO_oty-bA-1; Thu, 08 Jul 2021 09:04:50 -0400
X-MC-Unique: IguM2CwMMyqLSKO_oty-bA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E1CE101F01D;
 Thu,  8 Jul 2021 13:04:49 +0000 (UTC)
Received: from localhost (ovpn-114-141.ams2.redhat.com [10.36.114.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 738C4E729;
 Thu,  8 Jul 2021 13:04:22 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:04:21 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hxt8HI8RONiMrZWM"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Hxt8HI8RONiMrZWM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
> On 08/07/21 12:36, Stefan Hajnoczi wrote:
> > > What is very clear from this patch is that it
> > > is strictly related to the brdv_* and lower level calls, because
> > > they also internally check or even use the aiocontext lock.
> > > Therefore, in order to make it work, I temporarly added some
> > > aiocontext_acquire/release pair around the function that
> > > still assert for them or assume they are hold and temporarly
> > > unlock (unlock() - lock()).
> >=20
> > Sounds like the issue is that this patch series assumes AioContext lock=
s
> > are no longer required for calling the blk_*()/bdrv_*() APIs? That is
> > not the case yet, so you had to then add those aio_context_lock() calls
> > back in elsewhere. This approach introduces unnecessary risk. I think w=
e
> > should wait until blk_*()/bdrv_*() no longer requires the caller to hol=
d
> > the AioContext lock before applying this series.
>=20
> In general I'm in favor of pushing the lock further down into smaller and
> smaller critical sections; it's a good approach to make further audits
> easier until it's "obvious" that the lock is unnecessary.  I haven't yet
> reviewed Emanuele's patches to see if this is what he's doing where he's
> adding the acquire/release calls, but that's my understanding of both his
> cover letter and your reply.

The problem is the unnecessary risk. We know what the goal is for
blk_*()/bdrv_*() but it's not quite there yet. Does making changes in
block jobs help solve the final issues with blk_*()/bdrv_*()?

If yes, then it's a risk worth taking. If no, then spending time
developing interim code, reviewing those patches, and risking breakage
doesn't seem worth it. I'd rather wait for blk_*()/bdrv_*() to be fully
complete and then see patches that delete aio_context_acquire() in most
places or add locks in the remaining places where the caller was relying
on the AioContext lock.

Stefan

--Hxt8HI8RONiMrZWM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDm99UACgkQnKSrs4Gr
c8gb0Qf/SI9UisEVzq7oeSuJsk9/T60/3og1gvBnPOBhwp56k22MqII5b9olhAp2
FZWKKt9IJl2cAQAHWMl/lPE1Y5B/uFEYGLNdzfBIKJTNDZPLDZ/WS36LAjS3ZtZb
inPSv42djZ5XjkuFTAWrODvrXcF3ep9dw0ECvOWqpXg8UbZt/nwopbDWDTgAfwLQ
WipBs5ib5HXgUAoX+//y1LNbLP0TGxt+4LFsVTwA7ttWmYq4x8eBn1nes1DYsZeW
ir1eO3NAY4CUa/KjQniYL+jX86S8nogOYSMgFmx+XGdWHVVnHwIOCWypI67+qlaw
WWHTz2EmfwZt/rTMSAfK9QoB1pIBnQ==
=8U2P
-----END PGP SIGNATURE-----

--Hxt8HI8RONiMrZWM--


