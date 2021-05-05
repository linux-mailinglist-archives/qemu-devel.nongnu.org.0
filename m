Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9D3736A3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:52:31 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDGg-0004eq-Pi
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leDEf-0003KK-PO
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leDEd-0002Kw-M1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620204622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZVcKTgslPeSQrWWXBNlt/nlAJwOQBwg8xPKSgXqy4U=;
 b=OhiX6AxtIqzWrSKA737emWwzOT7IQ2eMzYsmJhKYGvfWW363F9Q4uEeU7lMaHgohY0QCxd
 b+aC6zp2IleHxySG/eOAMIKqO/lgcqDZ30B0pkgzEZDqJO1S+Evzjm1t4Y93nSOZWj3K8x
 c7sfmymecNGKpCXpRd8rCMQlW9sCn1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-krCMhDR-O2y3LeClr_zjTw-1; Wed, 05 May 2021 04:50:20 -0400
X-MC-Unique: krCMhDR-O2y3LeClr_zjTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8908210066E8;
 Wed,  5 May 2021 08:50:19 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2851560C17;
 Wed,  5 May 2021 08:50:19 +0000 (UTC)
Date: Wed, 5 May 2021 09:50:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 1/8] block: prepare write threshold code for thread
 safety
Message-ID: <YJJcSqa+EG1U+wMV@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-2-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tK+8CMb9Zw3Xj6db"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--tK+8CMb9Zw3Xj6db
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:55:34AM +0200, Emanuele Giuseppe Esposito wrote:

No commit description. What about write thresholds makes them thread
unsafe? Without a commit description reviewers have to reverse-engineer
the patch to figure out the author's intention, which can lead to
misunderstandings and bugs slipping through.

My guess is the point of this patch was to stop accessing fields in bs
directly?

> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/write-threshold.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>=20
> diff --git a/block/write-threshold.c b/block/write-threshold.c
> index 85b78dc2a9..63040fa4f2 100644
> --- a/block/write-threshold.c
> +++ b/block/write-threshold.c
> @@ -37,18 +37,22 @@ static void write_threshold_disable(BlockDriverState =
*bs)
>      }
>  }
> =20
> +static uint64_t treshold_overage(const BdrvTrackedRequest *req,
> +                                uint64_t thres)
> +{
> +    if (thres > 0 && req->offset + req->bytes > thres) {
> +        return req->offset + req->bytes - thres;
> +    } else {
> +        return 0;
> +    }
> +}
> +
>  uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
>                                         const BdrvTrackedRequest *req)
>  {
> -    if (bdrv_write_threshold_is_set(bs)) {
> -        if (req->offset > bs->write_threshold_offset) {
> -            return (req->offset - bs->write_threshold_offset) + req->byt=
es;
> -        }
> -        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
> -            return (req->offset + req->bytes) - bs->write_threshold_offs=
et;
> -        }
> -    }
> -    return 0;
> +    uint64_t thres =3D bdrv_write_threshold_get(bs);
> +
> +    return treshold_overage(req, thres);
>  }

Hmm...this function is only used by tests now. Should the tests be
updated so that they are exercising the actual code instead of this
test-only interface?

> =20
>  static int coroutine_fn before_write_notify(NotifierWithReturn *notifier=
,
> @@ -56,14 +60,14 @@ static int coroutine_fn before_write_notify(NotifierW=
ithReturn *notifier,
>  {
>      BdrvTrackedRequest *req =3D opaque;
>      BlockDriverState *bs =3D req->bs;
> -    uint64_t amount =3D 0;
> +    uint64_t thres =3D bdrv_write_threshold_get(bs);
> +    uint64_t amount =3D treshold_overage(req, thres);
> =20
> -    amount =3D bdrv_write_threshold_exceeded(bs, req);
>      if (amount > 0) {
>          qapi_event_send_block_write_threshold(
>              bs->node_name,
>              amount,
> -            bs->write_threshold_offset);
> +            thres);
> =20
>          /* autodisable to avoid flooding the monitor */
>          write_threshold_disable(bs);
> --=20
> 2.30.2
>=20

--tK+8CMb9Zw3Xj6db
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSXEoACgkQnKSrs4Gr
c8gp7wf/T0c2X44DlkfKN+86Kst+uAPzs3BZXNjZVKvTob18guAICuayNxC9TQS9
iLRLWaOBeGmPlHrYsjmrRo30s3FHlMjhXj3mcQAi/zNI4amzWaC1aisAU8aJEkmm
s0z9ocfCaZsdQws5PjtnFhHSx75gNmlqLjRGPKvf8h8xA34ezt2IWKEAjHvyJdoW
WsjDxgOeEHoEoFfmC+KdXcA69dU/k53haEaQLUFh+7nmOP8l14mw+sB169UFRQaw
fBx1e52ILGrn2eLkZylfPZjruQ08s3I6ap3tYJXQFwyFwcLbSBNAqnnIgNRq3DpF
mdvdMosiJCAGtadmxQfIyZVOZqvaMQ==
=v13Q
-----END PGP SIGNATURE-----

--tK+8CMb9Zw3Xj6db--


