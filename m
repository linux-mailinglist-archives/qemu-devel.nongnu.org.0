Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBCF48CDCA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:29:48 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7lBj-0005LY-6a
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:29:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7lA2-0003gi-By; Wed, 12 Jan 2022 16:28:02 -0500
Received: from kerio.kamp.de ([195.62.97.192]:56776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7lA0-0003gj-2a; Wed, 12 Jan 2022 16:28:02 -0500
X-Footer: a2FtcC5kZQ==
Received: from smtpclient.apple ([79.201.201.167])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Wed, 12 Jan 2022 22:27:54 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Peter Lieven <pl@kamp.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/2] block/rbd: fix handling of holes in
 .bdrv_co_block_status
Date: Wed, 12 Jan 2022 22:27:54 +0100
Message-Id: <28283639-9407-4651-A07F-B40712E509CC@kamp.de>
References: <CAOi1vP93pvs8tOxj_9RL=bUTxyvYhcOha_JEa39AtWcVcey2_A@mail.gmail.com>
In-Reply-To: <CAOi1vP93pvs8tOxj_9RL=bUTxyvYhcOha_JEa39AtWcVcey2_A@mail.gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>
X-Mailer: iPhone Mail (19C56)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "=?utf-8?Q? Daniel_P._Berrang=C3=A9 ?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Am 12.01.2022 um 22:06 schrieb Ilya Dryomov <idryomov@gmail.com>:
>=20
> =EF=BB=BFOn Wed, Jan 12, 2022 at 9:39 PM Peter Lieven <pl@kamp.de> wrote:
>>=20
>>> Am 12.01.22 um 10:05 schrieb Ilya Dryomov:
>>> On Mon, Jan 10, 2022 at 12:42 PM Peter Lieven <pl@kamp.de> wrote:
>>>> the assumption that we can't hit a hole if we do not diff against a sna=
pshot was wrong.
>>>>=20
>>>> We can see a hole in an image if we diff against base if there exists a=
n older snapshot
>>>> of the image and we have discarded blocks in the image where the snapsh=
ot has data.
>>>>=20
>>>> Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
>>>> Cc: qemu-stable@nongnu.org
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>> ---
>>>> block/rbd.c | 55 +++++++++++++++++++++++++++++++++--------------------
>>>> 1 file changed, 34 insertions(+), 21 deletions(-)
>>>>=20
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index def96292e0..5e9dc91d81 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -1279,13 +1279,24 @@ static int qemu_rbd_diff_iterate_cb(uint64_t of=
fs, size_t len,
>>>>     RBDDiffIterateReq *req =3D opaque;
>>>>=20
>>>>     assert(req->offs + req->bytes <=3D offs);
>>>> -    /*
>>>> -     * we do not diff against a snapshot so we should never receive a c=
allback
>>>> -     * for a hole.
>>>> -     */
>>>> -    assert(exists);
>>>>=20
>>>> -    if (!req->exists && offs > req->offs) {
>>>> +    if (req->exists && offs > req->offs + req->bytes) {
>>>> +        /*
>>>> +         * we started in an allocated area and jumped over an unalloca=
ted area,
>>>> +         * req->bytes contains the length of the allocated area before=
 the
>>>> +         * unallocated area. stop further processing.
>>>> +         */
>>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>> +    }
>>>> +    if (req->exists && !exists) {
>>>> +        /*
>>>> +         * we started in an allocated area and reached a hole. req->by=
tes
>>>> +         * contains the length of the allocated area before the hole.
>>>> +         * stop further processing.
>>>> +         */
>>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>> +    }
>>>> +    if (!req->exists && exists && offs > req->offs) {
>>>>         /*
>>>>          * we started in an unallocated area and hit the first allocate=
d
>>>>          * block. req->bytes must be set to the length of the unallocat=
ed area
>>>> @@ -1295,17 +1306,19 @@ static int qemu_rbd_diff_iterate_cb(uint64_t of=
fs, size_t len,
>>>>         return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>>     }
>>>>=20
>>>> -    if (req->exists && offs > req->offs + req->bytes) {
>>>> -        /*
>>>> -         * we started in an allocated area and jumped over an unalloca=
ted area,
>>>> -         * req->bytes contains the length of the allocated area before=
 the
>>>> -         * unallocated area. stop further processing.
>>>> -         */
>>>> -        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>> -    }
>>>> +    /*
>>>> +     * assert that we caught all cases above and allocation state has n=
ot
>>>> +     * changed during callbacks.
>>>> +     */
>>>> +    assert(exists =3D=3D req->exists || !req->bytes);
>>>> +    req->exists =3D exists;
>>>>=20
>>>> -    req->bytes +=3D len;
>>>> -    req->exists =3D true;
>>>> +    /*
>>>> +     * assert that we either return an unallocated block or have got c=
allbacks
>>>> +     * for all allocated blocks present.
>>>> +     */
>>>> +    assert(!req->exists || offs =3D=3D req->offs + req->bytes);
>>>> +    req->bytes =3D offs + len - req->offs;
>>>>=20
>>>>     return 0;
>>>> }
>>>> @@ -1354,13 +1367,13 @@ static int coroutine_fn qemu_rbd_co_block_statu=
s(BlockDriverState *bs,
>>>>     }
>>>>     assert(req.bytes <=3D bytes);
>>>>     if (!req.exists) {
>>>> -        if (r =3D=3D 0) {
>>>> +        if (r =3D=3D 0 && !req.bytes) {
>>>>             /*
>>>> -             * rbd_diff_iterate2 does not invoke callbacks for unalloc=
ated
>>>> -             * areas. This here catches the case where no callback was=

>>>> -             * invoked at all (req.bytes =3D=3D 0).
>>>> +             * rbd_diff_iterate2 does not invoke callbacks for unalloc=
ated areas
>>>> +             * except for the case where an overlay has a hole where t=
he parent
>>>> +             * or an older snapshot of the image has not. This here ca=
tches the
>>>> +             * case where no callback was invoked at all.
>>>>              */
>>>> -            assert(req.bytes =3D=3D 0);
>>>>             req.bytes =3D bytes;
>>>>         }
>>>>         status =3D BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>>>> --
>>>> 2.25.1
>>>>=20
>>>>=20
>>> Hi Peter,
>>>=20
>>> Can we just skip these "holes" by replacing the existing assert with
>>> an if statement that would simply bail from the callback on !exists?
>>>=20
>>> Just trying to keep the logic as simple as possible since as it turns
>>> out we get to contend with ages-old librbd bugs here...
>>=20
>>=20
>> I'm afraid I think this would not work. Consider qemu-img convert.
>>=20
>> If we bail out we would immediately call get_block_status with the offset=

>>=20
>> where we stopped and hit the !exist again.
>=20
> I'm suggesting bailing from the callback (i.e. return 0), not from the
> entire rbd_diff_iterate2() instance.  The iteration would move on and
> either stumble upon an allocated area within the requested range or run
> off the end of the requested range.  Both of these cases are already
> handled by the existing code.

Ah, got it. That=E2=80=99s a smart solution!

Peter



