Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B02571A36
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:43:47 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFEv-0005lO-Pq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBF63-0003it-NA
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBF5y-0005YL-0d
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657629269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VHOUFAAeCggYddTDUTO8A9GIn/NVNLxsVdzOkFN8dxM=;
 b=Ga3pWZdXodJDOdnj0FebQLbjh5xAQ4He2Oy/AK2yu63N3J/+6RLPiHWPx/XTFgImaSZ81q
 rSv8iSrn+Za1l/+KOlgAIpmFokMRRXETji5hROcZDpIML+tuex1PD67NrzQhBDxEeS3Ywc
 qmckg97gHFJV1oBmteEOO/poe3u/PvI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-0VAR_hZqP8eW6_MgdCKjzQ-1; Tue, 12 Jul 2022 08:34:26 -0400
X-MC-Unique: 0VAR_hZqP8eW6_MgdCKjzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD29385A58B;
 Tue, 12 Jul 2022 12:34:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46396C28118;
 Tue, 12 Jul 2022 12:34:25 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:34:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Message-ID: <Ys1qT1jU9gajugvC@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-8-eesposit@redhat.com>
 <YsRObmNTP471U9zU@stefanha-x1.localdomain>
 <2a1e8343-df7d-b98a-1d3b-2bd4345adf3e@redhat.com>
 <1f88322f-00f0-ae1e-2a3e-c7bac034de72@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EnTcNOqF1x1y5E35"
Content-Disposition: inline
In-Reply-To: <1f88322f-00f0-ae1e-2a3e-c7bac034de72@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--EnTcNOqF1x1y5E35
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 01:22:58PM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 08/07/2022 um 11:33 schrieb Emanuele Giuseppe Esposito:
> >=20
> >=20
> > Am 05/07/2022 um 16:45 schrieb Stefan Hajnoczi:
> >> On Thu, Jun 09, 2022 at 10:37:26AM -0400, Emanuele Giuseppe Esposito w=
rote:
> >>> @@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
> >>>       * stops all Iothreads.
> >>>       */
> >>>      blk_drain(s->blk);
> >>> +    aio_context_release(ctx);
> >>> =20
> >>>      /* We drop queued requests after blk_drain() because blk_drain()=
 itself can
> >>>       * produce them. */
> >>> +    qemu_mutex_lock(&s->req_mutex);
> >>>      while (s->rq) {
> >>>          req =3D s->rq;
> >>>          s->rq =3D req->next;
> >>> +        qemu_mutex_unlock(&s->req_mutex);
> >>>          virtqueue_detach_element(req->vq, &req->elem, 0);
> >>>          virtio_blk_free_request(req);
> >>> +        qemu_mutex_lock(&s->req_mutex);
> >>
> >> Why is req_mutex dropped temporarily? At this point we don't really ne=
ed
> >> the req_mutex (all I/O should be stopped and drained), but maybe we
> >> should do:
> >=20
> > Agree that maybe it is not useful to drop the mutex temporarily.
> >=20
> > Regarding why req_mutex is not needed, yes I guess it isn't. Should I
> > get rid of this hunk at all, and maybe leave a comment like "no
> > synchronization needed, due to drain + ->stop_ioeventfd()"?
>=20
> Actually, regarding this, I found why I added the lock:
>=20
> https://patchew.org/QEMU/20220426085114.199647-1-eesposit@redhat.com/#584=
d7d1a-94cc-9ebb-363b-2fddb8d79f5b@redhat.com
>=20
> So maybe it's better to add it.

I don't see anything obvious in Paolo's email that you linked. I think
he was saying it's safest to use a lock but not that it's necessary.

Can you clarify what you mean?

Stefan

--EnTcNOqF1x1y5E35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNak8ACgkQnKSrs4Gr
c8gqrAf/YCBkAph6yVC702mV8a2paj5gTXlQMt2aespNtoTiP5HM5zaK1zgoFkPK
zAL0YZU9KCflkQtFqfIzvo+F229Txq1Fr5LqGJhA7xuyB9LxAjJzWvH+c1gsvl0r
/ZcCFJIurXur3ILMYKWCzyPA8zUsndhWwPR7LcUqDpuxaom6vikrdsHqe6YuZDxa
vemC3baXMHiD92EiLnVD6Eauk160AzZ+kw6C6ykhu1TtEl5YObvuPuKjNKbc3eB+
+mZXQFSpaQg1mqeBRjFySUYohD8QN+r8+eKovXaoaF0kHtjsiXQg0OEqdi4TOsL5
27VHDg9TabvOGbYndTDeJz3pStpuaw==
=cFGW
-----END PGP SIGNATURE-----

--EnTcNOqF1x1y5E35--


