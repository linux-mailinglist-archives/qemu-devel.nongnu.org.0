Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C04DCE10
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 19:53:58 +0100 (CET)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvG1-0006BT-Hq
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 14:53:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nUuqH-0004Xh-JW; Thu, 17 Mar 2022 14:27:22 -0400
Received: from kerio.kamp.de ([195.62.97.192]:56436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nUuqF-0006gq-JD; Thu, 17 Mar 2022 14:27:21 -0400
X-Footer: a2FtcC5kZQ==
Received: from smtpclient.apple ([79.201.202.49])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 17 Mar 2022 19:27:06 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Date: Thu, 17 Mar 2022 19:27:05 +0100
Message-Id: <CAC868B4-D120-4EB4-A0E9-78F38BA20FA7@kamp.de>
References: <20220317162638.41192-1-sgarzare@redhat.com>
In-Reply-To: <20220317162638.41192-1-sgarzare@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
X-Mailer: iPhone Mail (19C56)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>=20
> =EF=BB=BFCommit d24f80234b ("block/rbd: increase dynamically the image siz=
e")
> added a workaround to support growing images (eg. qcow2), resizing
> the image before write operations that exceed the current size.
>=20
> We recently added support for write zeroes and without the
> workaround we can have problems with qcow2.
>=20
> So let's move the resize into qemu_rbd_start_co() and do it when
> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2020993
> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> block/rbd.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/block/rbd.c b/block/rbd.c
> index 8f183eba2a..6caf35cbba 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriv=
erState *bs,
>=20
>     assert(!qiov || qiov->size =3D=3D bytes);
>=20
> +    if (cmd =3D=3D RBD_AIO_WRITE || cmd =3D=3D RBD_AIO_WRITE_ZEROES) {
> +        /*
> +         * RBD APIs don't allow us to write more than actual size, so in o=
rder
> +         * to support growing images, we resize the image before write
> +         * operations that exceed the current size.
> +         */
> +        if (offset + bytes > s->image_size) {
> +            int r =3D qemu_rbd_resize(bs, offset + bytes);
> +            if (r < 0) {
> +                return r;
> +            }
> +        }
> +    }
> +
>     r =3D rbd_aio_create_completion(&task,
>                                   (rbd_callback_t) qemu_rbd_completion_cb,=
 &c);
>     if (r < 0) {
> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *=
bs, int64_t offset,
>                                  int64_t bytes, QEMUIOVector *qiov,
>                                  BdrvRequestFlags flags)
> {
> -    BDRVRBDState *s =3D bs->opaque;
> -    /*
> -     * RBD APIs don't allow us to write more than actual size, so in orde=
r
> -     * to support growing images, we resize the image before write
> -     * operations that exceed the current size.
> -     */
> -    if (offset + bytes > s->image_size) {
> -        int r =3D qemu_rbd_resize(bs, offset + bytes);
> -        if (r < 0) {
> -            return r;
> -        }
> -    }
>     return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE=
);
> }
>=20
> --=20
> 2.35.1
>=20

Do we really have a use case for growing rbd images?

Peter=



