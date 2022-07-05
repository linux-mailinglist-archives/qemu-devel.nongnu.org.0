Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A227567174
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:47:48 +0200 (CEST)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jq7-0002Rt-6Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jna-00014o-MW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o8jnX-0006iV-I4
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657032306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L35Il11jsLSd6n6L/jryOY2zCFJzrYayzVGfmGWCXc4=;
 b=Ivr8n9viWHguRVpvl39QF+dQ5KHZ+YYCPtVhHRt5z7EjmBh97LPhoMySVg5FqWKpq+1DAa
 znWnlbY9scTzfdqIeKNNP4jGrP/3beoVXDwcXPJvbozmotvudFKhezwOKnDRT1VudevLxk
 wsUD2nqI8fWs7LuDpvf3XEYfKGwBmvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-izbUoS2zM4GCJIFPiYJoFg-1; Tue, 05 Jul 2022 10:45:04 -0400
X-MC-Unique: izbUoS2zM4GCJIFPiYJoFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1066D18A64F7;
 Tue,  5 Jul 2022 14:45:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D1091121315;
 Tue,  5 Jul 2022 14:45:03 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:45:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 7/8] VirtIOBlock: protect rq with its own lock
Message-ID: <YsRObmNTP471U9zU@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-8-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b+8Jk6zcJDi9hiVJ"
Content-Disposition: inline
In-Reply-To: <20220609143727.1151816-8-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--b+8Jk6zcJDi9hiVJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 10:37:26AM -0400, Emanuele Giuseppe Esposito wrote:
> @@ -946,17 +955,20 @@ static void virtio_blk_reset(VirtIODevice *vdev)
>       * stops all Iothreads.
>       */
>      blk_drain(s->blk);
> +    aio_context_release(ctx);
> =20
>      /* We drop queued requests after blk_drain() because blk_drain() its=
elf can
>       * produce them. */
> +    qemu_mutex_lock(&s->req_mutex);
>      while (s->rq) {
>          req =3D s->rq;
>          s->rq =3D req->next;
> +        qemu_mutex_unlock(&s->req_mutex);
>          virtqueue_detach_element(req->vq, &req->elem, 0);
>          virtio_blk_free_request(req);
> +        qemu_mutex_lock(&s->req_mutex);

Why is req_mutex dropped temporarily? At this point we don't really need
the req_mutex (all I/O should be stopped and drained), but maybe we
should do:

  WITH_QEMU_MUTEX(&s->req_mutex) {
      req =3D s->rq;
      s->rq =3D NULL;
  }

  ...process req list...

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--b+8Jk6zcJDi9hiVJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLETm4ACgkQnKSrs4Gr
c8hkiAgAueJnkKwTj0xcTAJ2ptP6H4N6tMojYfck/K0K6J0OHs5Rd01jo+BZT/xX
XElclwC6WwKDdGeN2e4i7w6admA6DSNC5zGvGAJ353Y5UbjNZHomjVtSWj6v/Gxq
VoFVLhMEATpo7Eft0A8ggJIP2yr5EiHYBnqjs4VEq+k4KJ0e/v200ZYCW2w1ZGxD
HsKf5VUBIvdQK7k+0a6voPcEY2t0dY57816AO3KlhXGaZ4I7+KFWRhl+42jo2o1g
M6n5xGSaoJKIFmAdhM4DBF4ZyNUbf3bpt7Rpg6EM5sJlohQg5gsrNWcP3zqmDW2k
VIpo//HYYRrU92e/fUaZ10jEbDCWeg==
=C26w
-----END PGP SIGNATURE-----

--b+8Jk6zcJDi9hiVJ--


