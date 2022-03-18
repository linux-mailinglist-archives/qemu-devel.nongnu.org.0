Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C229F4DDD65
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:57:24 +0100 (CET)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEyh-00048t-Tt
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:57:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nVEq2-0008DK-H2; Fri, 18 Mar 2022 11:48:26 -0400
Received: from kerio.kamp.de ([195.62.97.192]:51572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nVEq0-0001LA-FW; Fri, 18 Mar 2022 11:48:26 -0400
X-Footer: a2FtcC5kZQ==
Received: from smtpclient.apple ([79.201.202.49])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Fri, 18 Mar 2022 16:48:19 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Date: Fri, 18 Mar 2022 16:48:18 +0100
Message-Id: <AA4AC067-D604-43A4-AE1F-18AA1BFCF90C@kamp.de>
References: <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
In-Reply-To: <20220318082504.qxqcarorpo2jxnfk@sgarzare-redhat>
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



> Am 18.03.2022 um 09:25 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>=20
> =EF=BB=BFOn Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>=20
>>=20
>>>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>=
:
>>>=20
>>> =EF=BB=BFCommit d24f80234b ("block/rbd: increase dynamically the image s=
ize")
>>> added a workaround to support growing images (eg. qcow2), resizing
>>> the image before write operations that exceed the current size.
>>>=20
>>> We recently added support for write zeroes and without the
>>> workaround we can have problems with qcow2.
>>>=20
>>> So let's move the resize into qemu_rbd_start_co() and do it when
>>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>=20
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2020993
>>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>> ---
>>> block/rbd.c | 26 ++++++++++++++------------
>>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>>=20
>>> diff --git a/block/rbd.c b/block/rbd.c
>>> index 8f183eba2a..6caf35cbba 100644
>>> --- a/block/rbd.c
>>> +++ b/block/rbd.c
>>> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDr=
iverState *bs,
>>>=20
>>>    assert(!qiov || qiov->size =3D=3D bytes);
>>>=20
>>> +    if (cmd =3D=3D RBD_AIO_WRITE || cmd =3D=3D RBD_AIO_WRITE_ZEROES) {
>>> +        /*
>>> +         * RBD APIs don't allow us to write more than actual size, so i=
n order
>>> +         * to support growing images, we resize the image before write
>>> +         * operations that exceed the current size.
>>> +         */
>>> +        if (offset + bytes > s->image_size) {
>>> +            int r =3D qemu_rbd_resize(bs, offset + bytes);
>>> +            if (r < 0) {
>>> +                return r;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>>    r =3D rbd_aio_create_completion(&task,
>>>                                  (rbd_callback_t) qemu_rbd_completion_cb=
, &c);
>>>    if (r < 0) {
>>> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState=
 *bs, int64_t offset,
>>>                                 int64_t bytes, QEMUIOVector *qiov,
>>>                                 BdrvRequestFlags flags)
>>> {
>>> -    BDRVRBDState *s =3D bs->opaque;
>>> -    /*
>>> -     * RBD APIs don't allow us to write more than actual size, so in or=
der
>>> -     * to support growing images, we resize the image before write
>>> -     * operations that exceed the current size.
>>> -     */
>>> -    if (offset + bytes > s->image_size) {
>>> -        int r =3D qemu_rbd_resize(bs, offset + bytes);
>>> -        if (r < 0) {
>>> -            return r;
>>> -        }
>>> -    }
>>>    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRIT=
E);
>>> }
>>>=20
>>> --
>>> 2.35.1
>>>=20
>>=20
>> Do we really have a use case for growing rbd images?
>=20
> The use case is to have a qcow2 image on rbd.
> I don't think it's very common, but some people use it and here [1] we had=
 a little discussion about features that could be interesting (e.g.  persist=
ent dirty bitmaps for incremental backup).
>=20
> In any case the support is quite simple and does not affect other use case=
s since we only increase the size when we go beyond the current size.
>=20
> IMHO we can have it in :-)
>=20

The QCOW2 alone doesn=E2=80=99t make much sense, but additional metadata mig=
ht be a use case.
Be aware that the current approach will serialize requests. If there is a re=
al use case, we might think of a better solution.

Peter

> Thanks,
> Stefano
>=20
> [1] https://lore.kernel.org/all/20190415080452.GA6031@localhost.localdomai=
n/
>=20



