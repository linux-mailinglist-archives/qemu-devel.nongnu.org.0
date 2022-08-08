Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35958CBE3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 18:10:35 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL5Ks-0000cB-FE
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 12:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL5C0-0001OL-Am
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL5Bv-00010U-Nc
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659974478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pcbHsimlPldT1rHxfiVxSpMcFcAeD6yKcVIZTH64qv4=;
 b=ABEngvE1HY/d4muadxiSriEEcq3mslxXqHg8Ydkjgwf3cMpYqX+Bmti+YYBbB4cFdzVPrS
 eriTuzr/Xea25r1AVW1KlXZIC/I44rFAaDIf8DF68fSWyE329CKvByWr/JEWg37ilgwndH
 qbnsNeX/7C+zfIpiES4IiUuDLVPznaY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-abjKTT1cMfyzLhnuFIjf2g-1; Mon, 08 Aug 2022 12:01:15 -0400
X-MC-Unique: abjKTT1cMfyzLhnuFIjf2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA918280F2A0;
 Mon,  8 Aug 2022 16:01:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF2240C1288;
 Mon,  8 Aug 2022 16:01:13 +0000 (UTC)
Date: Mon, 8 Aug 2022 12:01:12 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 sgarzare@redhat.com, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Message-ID: <YvEzSAtrKSDvoUqX@fedora>
References: <20220803162824.948023-1-stefanha@redhat.com>
 <20220805030329-mutt-send-email-mst@kernel.org>
 <837dc213-70cf-f677-2f22-fa731031ee77@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/JE1lOxsTZhLy7tf"
Content-Disposition: inline
In-Reply-To: <837dc213-70cf-f677-2f22-fa731031ee77@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--/JE1lOxsTZhLy7tf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 11:41:27AM +0200, Paolo Bonzini wrote:
> On 8/5/22 09:04, Michael S. Tsirkin wrote:
> > >=20
> > > Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=3D2099541
> > > Reported-by: Qing Wang<qinwang@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi<stefanha@redhat.com>
> > A scsi thing that tree seems more appropriate.
> >=20
> > Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> >=20
> >=20
> >=20
>=20
> Since the same thing has to be done in virtio-blk, any of the
> block/misc/virtio tree will do.

I don't think virtio-blk changes are required because it's already safe.

On the store side:

  s->starting =3D false;
  vblk->dataplane_started =3D true;
  trace_virtio_blk_data_plane_start(s);

  ...

  /* Get this show started by hooking up our callbacks */
  aio_context_acquire(s->ctx);
  ^^^ implicit memory barrier ^^^
  for (i =3D 0; i < nvqs; i++) {
      VirtQueue *vq =3D virtio_get_queue(s->vdev, i);

      virtio_queue_aio_attach_host_notifier(vq, s->ctx);
  }
  aio_context_release(s->ctx);

On the load side:

  void aio_notify_accept(AioContext *ctx)
  {
      qatomic_set(&ctx->notified, false);

      /*
       * Write ctx->notified before reading e.g. bh->flags.  Pairs with smp=
_wmb
       * in aio_notify.
       */
      smp_mb();
      ^^^^^^^^^
  }

vblk->dataplane_started will be visible to the IOThread.

Stefan

--/JE1lOxsTZhLy7tf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLxM0gACgkQnKSrs4Gr
c8hK/gf9HLlEZjzJr6Nfole3wAsbkS9iYhWSLDjEeJc5N09FdD9jTNS7G3ihLmxt
Ildhq8uyE7BvQs7csB/KugAsAhRDG9yjZAkAC1Vgv5136V4Ak9ETMzU80D0e+m7C
L6Ty3VebAAYLSo2gxzVi6es0CMJUxs4yl4EM6aFQEpIDFSngZW8HUROllS6DSbir
6wdqTZv2PGIChI93QDP1VNb/GJl/LXzIvXFEzmdCwkvwHNAQ1Yip+LolLg5uSusy
/a5YGUQLLo6wEY80F22mEaKWpH6E8lixwruYInReHRo+4MUBRhdOuNKOq2fNkrh0
HsL8YzsIcIEnUN4MP5S4IikO35b7Yw==
=h1vb
-----END PGP SIGNATURE-----

--/JE1lOxsTZhLy7tf--


