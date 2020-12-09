Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E172D4732
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:54:09 +0100 (CET)
Received: from localhost ([::1]:37530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2jA-0001rh-Kw
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kn2gp-0007xh-Bt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1kn2gm-0005nZ-Ls
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607532696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tReWGyepUz23ZTnlnZelJ4Kc+SDqhse3nS+om1kmOcU=;
 b=K6MV+TZ1YV5iH4refHa2oiv5f689zcexllgknKTADB/01jdH3N4hj+MfwzGSGgmwajRF4H
 +C++f9D9zPzBhqZzoGcUKeVCNs6b4DLpAIlasciawXQ5EVd/CcYg5ol8mMq8P8QXIp6Gu4
 mQkbKXKoorNBjAU2mAmcoyVTPJgEVkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-_KWT8ps9MhiiwKxfNJUImw-1; Wed, 09 Dec 2020 11:51:30 -0500
X-MC-Unique: _KWT8ps9MhiiwKxfNJUImw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95F7411300F1;
 Wed,  9 Dec 2020 16:51:17 +0000 (UTC)
Received: from localhost (ovpn-115-46.rdu2.redhat.com [10.10.115.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D03775D719;
 Wed,  9 Dec 2020 16:51:13 +0000 (UTC)
Date: Wed, 9 Dec 2020 17:51:12 +0100
From: Sergio Lopez <slp@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] virtio-blk: Acquire context while switching them on
 dataplane start
Message-ID: <20201209165112.o46ommtx2xab7lg2@mhamilton>
References: <20201204165347.73542-1-slp@redhat.com>
 <20201204165347.73542-2-slp@redhat.com>
 <20201207153753.GD5281@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20201207153753.GD5281@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wfcebcaqsb2aydis"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wfcebcaqsb2aydis
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 04:37:53PM +0100, Kevin Wolf wrote:
> Am 04.12.2020 um 17:53 hat Sergio Lopez geschrieben:
> > On dataplane start, acquire the new AIO context before calling
> > 'blk_set_aio_context', releasing it immediately afterwards. This
> > prevents reaching the AIO context attach/detach notifier functions
> > without having acquired it first.
> >=20
> > It was also the only place where 'blk_set_aio_context' was called with
> > an unprotected AIO context.
> >=20
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  hw/block/dataplane/virtio-blk.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virti=
o-blk.c
> > index 37499c5564..034e43cb1f 100644
> > --- a/hw/block/dataplane/virtio-blk.c
> > +++ b/hw/block/dataplane/virtio-blk.c
> > @@ -214,7 +214,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
> >      vblk->dataplane_started =3D true;
> >      trace_virtio_blk_data_plane_start(s);
> > =20
> > +    aio_context_acquire(s->ctx);
> >      r =3D blk_set_aio_context(s->conf->conf.blk, s->ctx, &local_err);
> > +    aio_context_release(s->ctx);
>=20
> bdrv_set_aio_context_ignore() is documented like this:
>=20
>  * The caller must own the AioContext lock for the old AioContext of bs, =
but it
>  * must not own the AioContext lock for new_context (unless new_context i=
s the
>  * same as the current context of bs).

Does that rule apply to blk_set_aio_context too? All use cases I can
find in the code are acquiring the new context:

hw/block/dataplane/xen-block.c:
 719 void xen_block_dataplane_start(XenBlockDataPlane *dataplane,
 720                                const unsigned int ring_ref[],
 721                                unsigned int nr_ring_ref,
 722                                unsigned int event_channel,
 723                                unsigned int protocol,
 724                                Error **errp)
 725 {
 ...
 811     aio_context_acquire(dataplane->ctx);
 812     /* If other users keep the BlockBackend in the iothread, that's ok=
 */
 813     blk_set_aio_context(dataplane->blk, dataplane->ctx, NULL);
 814     /* Only reason for failure is a NULL channel */
 815     xen_device_set_event_channel_context(xendev, dataplane->event_chan=
nel,
 816                                          dataplane->ctx, &error_abort)=
;
 817     aio_context_release(dataplane->ctx);

hw/scsi/virtio-scsi.c:
 818 static void virtio_scsi_hotplug(HotplugHandler *hotplug_dev, DeviceSta=
te *dev,
 819                                 Error **errp)
 820 {
 ...
 830         virtio_scsi_acquire(s);
 831         ret =3D blk_set_aio_context(sd->conf.blk, s->ctx, errp);
 832         virtio_scsi_release(s);

Thanks,
Sergio.

--wfcebcaqsb2aydis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAl/RAHwACgkQ9GknjS8M
AjVLtxAAogu0h8fSY8UwSYOC5iPWu+2v4BO3HSdd6u6T0Y37Ni5NLF3BoEe4hDhw
o9nNEAmwcWy5LteCLcfqUl7Qs+QCCzWNeu4TWBhbvkm8PZrZF9CddnzvDl62UlQ9
P6yZMdbSwq/ThIH9lqqktUf4YSBu1vRGbjsQwPiToGrXFJlFqc3xuaaz/TJ2DuoT
gBzV01HZSae1EWCDXCCUvSGZxBzGyzXC+j3UQ8muveoUxO/X9+ljrYwaohiADUzG
phRCsqkczTZhxvGjQxsrn+LbCDqBZvv2Gvg6eNTEGwkEXeqo/ozSMzlWnWXnmLzi
1arnWUtNX8NZjbRIGujE1jUjL59N/wdY5W2pXVGomnCJu06xajbNEs4m9lTtDTk4
F9F0viirV0lF7NEggOMAI5tcFrXKmB++hLVnQKMwCWhwJRENJ6+aTuenZvyviMvJ
4XMyBQ4M0dcpMnK8y5aFmHA4qNXfwmLbsnMuMBGZK2e5IR8FmTT5wyi9Q2uzHbag
mVRMj0GK/bKhq/l/jOYoRXZdX7a8h074lXULv6E6MnljPNeV5UBU0PEc4Hh6/Stw
VEQ4ZcUCtuAl3xGg9OmWQKofBCFeziQC9poMmbVBcm/pcu7Uwt5E7ikVRF4J/FuB
uF/C2/03/xk62JnSROtpffFdpussFsZo7+HSux5w8x4sFpS/T8I=
=U/Wt
-----END PGP SIGNATURE-----

--wfcebcaqsb2aydis--


