Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ECF332CAA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:56:36 +0100 (CET)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfet-0003fD-8k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJepx-00084t-AW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJeps-0005oV-GW
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qdsQ2H5WmKUkwRrF3gbZ1qDyFmbg0iJ0P8fOb+4o3kI=;
 b=H4ZY3QTZq67Ia/28d2K1brD0QLKJzIezSQhwwBlkXBp18kDUBrG6K6DbZag7TrqS10bjlM
 aLOrAk/40R2LY7m4U2uKZTeHHv74MflLspUo+uBfjKDIG+6CKrxX7uVfZx3UxU4Wb15W79
 yqWlkGEBDPF50oL5yIZQik6cwGO5tJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-7xH8ggLWNz-0Fx931_QvMA-1; Tue, 09 Mar 2021 11:03:42 -0500
X-MC-Unique: 7xH8ggLWNz-0Fx931_QvMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88922804330;
 Tue,  9 Mar 2021 16:03:40 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4BFA19481;
 Tue,  9 Mar 2021 16:03:39 +0000 (UTC)
Date: Tue, 9 Mar 2021 16:03:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 1/4] hw/block/nvme: convert dsm to aiocb
Message-ID: <YEecWpaChyb883Ut@stefanha-x1.localdomain>
References: <20210302111040.289244-1-its@irrelevant.dk>
 <20210302111040.289244-2-its@irrelevant.dk>
 <YEZSr7Y/Y4+NJY5V@stefanha-x1.localdomain>
 <YEZndKMdZcMvDKck@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YEZndKMdZcMvDKck@apples.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I2C3O4hCEuS8kdaj"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--I2C3O4hCEuS8kdaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 07:05:40PM +0100, Klaus Jensen wrote:
> On Mar  8 16:37, Stefan Hajnoczi wrote:
> > On Tue, Mar 02, 2021 at 12:10:37PM +0100, Klaus Jensen wrote:
> > > +static void nvme_dsm_cancel(BlockAIOCB *aiocb)
> > > +{
> > > +    NvmeDSMAIOCB *iocb =3D container_of(aiocb, NvmeDSMAIOCB, common)=
;
> > > +
> > > +    /* break loop */
> > > +    iocb->curr.len =3D 0;
> > > +    iocb->curr.idx =3D iocb->nr;
> > > +
> > > +    iocb->ret =3D -ECANCELED;
> > > +
> > > +    if (iocb->aiocb) {
> > > +        blk_aio_cancel_async(iocb->aiocb);
> > > +        iocb->aiocb =3D NULL;
> > > +    }
> > > +}
> >=20
> > Is the case where iocb->aiocb =3D=3D NULL just in case nvme_dsm_cancel(=
) is
> > called after the last discard has completed but before the BH runs? I
> > want to make sure there are no other cases because nothing would call
> > iocb->common.cb().
> >=20
>=20
> Yes - that case *can* happen, right?
>=20
> I modeled this after the appoach in the ide trim code (hw/ide/core.c).

Yes, nvme_dsm_bh() may run after other event loop activity. Therefore we
have to take the iocb->aiocb =3D=3D NULL case into account because some
event loop activity could call nvme_dsm_cancel() before the BH runs.

Another (wild?) possibility is that nvme_dsm_cancel() is called twice.
That's okay, nvme_dsm_cancel() supports that nicely.

But I wasn't sure if there are any other cases where iocb->aiocb can be
NULL? It could be nice to include an assertion or comment to clarify
this. For example:

  if (iocb->aiocb) {
      blk_aio_cancel_async(iocb->aiocb);
      iocb->aiocb =3D NULL;
  } else {
      /*
       * We only get here if nvme_dsm_cancel() was already called or
       * nvme_dsm_bh() is about to run.
       */
      assert(iocb->curr.idx =3D=3D iocb->nr);
  }

  /* break loop */
  iocb->curr.len =3D 0;
  iocb->curr.idx =3D iocb->nr;

  iocb->ret =3D -ECANCELED;

(I'm not sure if my assert is correct, but hopefully this explains what
I mean.)

The reason why this assertion is important is because nvme_dsm_cancel()
does not support other iocb->aiocb =3D NULL cases. The cancelled request
could hang if nothing completes it. The assertion will complain loudly
if this every happens (may not now, but if someone changes the code in
the future).

Stefan

--I2C3O4hCEuS8kdaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHnFoACgkQnKSrs4Gr
c8jWvQf/ZgLqZAOgpTEF6WoYSugbyeLx4CshQhy5mUHyM2S8JEKzzCYcGIz9kg1q
/wSng5p6m++Z3PuQjcstsVkd+/wJOwgCRa0TfMFMXq1TIP9Ycw2Xhli58qFCaKT7
ORJmW/RL0+qb5DBjf4keFed5CkV/Vd17aCXpTG+VBehZpxVEY2MCVC3vP6iyVJ1O
Z70Fig3gmtQaIl+kK1wcQpBo8EFuzWR+pGdMyqtJvARqqe9Ok5yg6Zvrx3r1mapK
MGSjXUIW0fZ1qEnGPChUpO6xKkqiYYPXLBvbwIc5H3qw3YfHpHCkUtyp5ca0jm4n
DKTShsF/FDA9RgCp8T5Ah38ord5D9g==
=TQ8w
-----END PGP SIGNATURE-----

--I2C3O4hCEuS8kdaj--


