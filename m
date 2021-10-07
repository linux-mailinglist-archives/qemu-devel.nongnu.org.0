Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBCA42580C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:36:06 +0200 (CEST)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWNJ-0000no-HZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mYWHz-0002rH-UB; Thu, 07 Oct 2021 12:30:35 -0400
Received: from kerio.kamp.de ([195.62.97.192]:36000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mYWHw-00008P-PL; Thu, 07 Oct 2021 12:30:35 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 7 Oct 2021 18:30:30 +0200
Subject: Re: [PATCH V3] block/rbd: implement bdrv_co_block_status
To: Ilya Dryomov <idryomov@gmail.com>
References: <20210916122116.802-1-pl@kamp.de>
 <CAOi1vP8_em_m=orH+5L+164+7EgD+JD_5kmrh=mWBMjZSe79kg@mail.gmail.com>
 <8a6c60cb-ef5b-44a9-1872-27937a3a6967@kamp.de>
 <CAOi1vP84c5zX7319O8xRXBBJGh1baNpCzK2YU7uJp7Zyqmwe+Q@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <149cd7b7-2288-d0ff-fb39-def75f98cb10@kamp.de>
Date: Thu, 7 Oct 2021 18:30:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP84c5zX7319O8xRXBBJGh1baNpCzK2YU7uJp7Zyqmwe+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.10.21 um 10:36 schrieb Ilya Dryomov:
> On Tue, Oct 5, 2021 at 10:19 AM Peter Lieven <pl@kamp.de> wrote:
>> Am 05.10.21 um 09:54 schrieb Ilya Dryomov:
>>> On Thu, Sep 16, 2021 at 2:21 PM Peter Lieven <pl@kamp.de> wrote:
>>>> the qemu rbd driver currently lacks support for bdrv_co_block_status.
>>>> This results mainly in incorrect progress during block operations (e.g.
>>>> qemu-img convert with an rbd image as source).
>>>>
>>>> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
>>>> allocated and unallocated (all zero areas).
>>>>
>>>> To avoid querying the ceph OSDs for the answer this is only done if
>>>> the image has the fast-diff feature which depends on the object-map and
>>>> exclusive-lock features. In this case it is guaranteed that the information
>>>> is present in memory in the librbd client and thus very fast.
>>>>
>>>> If fast-diff is not available all areas are reported to be allocated
>>>> which is the current behaviour if bdrv_co_block_status is not implemented.
>>>>
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>> ---
>>>> V2->V3:
>>>> - check rbd_flags every time (they can change during runtime) [Ilya]
>>>> - also check for fast-diff invalid flag [Ilya]
>>>> - *map and *file cant be NULL [Ilya]
>>>> - set ret = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID in case of an
>>>>     unallocated area [Ilya]
>>>> - typo: catched -> caught [Ilya]
>>>> - changed wording about fast-diff, object-map and exclusive lock in
>>>>     commit msg [Ilya]
>>>>
>>>> V1->V2:
>>>> - add commit comment [Stefano]
>>>> - use failed_post_open [Stefano]
>>>> - remove redundant assert [Stefano]
>>>> - add macro+comment for the magic -9000 value [Stefano]
>>>> - always set *file if its non NULL [Stefano]
>>>>
>>>>    block/rbd.c | 126 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 126 insertions(+)
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index dcf82b15b8..3cb24f9981 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -1259,6 +1259,131 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>>>>        return spec_info;
>>>>    }
>>>>
>>>> +typedef struct rbd_diff_req {
>>>> +    uint64_t offs;
>>>> +    uint64_t bytes;
>>>> +    int exists;
>>> Hi Peter,
>>>
>>> Nit: make exists a bool.  The one in the callback has to be an int
>>> because of the callback signature but let's not spread that.
>>>
>>>> +} rbd_diff_req;
>>>> +
>>>> +/*
>>>> + * rbd_diff_iterate2 allows to interrupt the exection by returning a negative
>>>> + * value in the callback routine. Choose a value that does not conflict with
>>>> + * an existing exitcode and return it if we want to prematurely stop the
>>>> + * execution because we detected a change in the allocation status.
>>>> + */
>>>> +#define QEMU_RBD_EXIT_DIFF_ITERATE2 -9000
>>>> +
>>>> +static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
>>>> +                                       int exists, void *opaque)
>>>> +{
>>>> +    struct rbd_diff_req *req = opaque;
>>>> +
>>>> +    assert(req->offs + req->bytes <= offs);
>>>> +
>>>> +    if (req->exists && offs > req->offs + req->bytes) {
>>>> +        /*
>>>> +         * we started in an allocated area and jumped over an unallocated area,
>>>> +         * req->bytes contains the length of the allocated area before the
>>>> +         * unallocated area. stop further processing.
>>>> +         */
>>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>> +    }
>>>> +    if (req->exists && !exists) {
>>>> +        /*
>>>> +         * we started in an allocated area and reached a hole. req->bytes
>>>> +         * contains the length of the allocated area before the hole.
>>>> +         * stop further processing.
>>>> +         */
>>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>> Do you have a test case for when this branch is taken?
>>
>> That would happen if you diff from a snapshot, the question is if it can also happen if the image is a clone from a snapshot?
>>
>>
>>>> +    }
>>>> +    if (!req->exists && exists && offs > req->offs) {
>>>> +        /*
>>>> +         * we started in an unallocated area and hit the first allocated
>>>> +         * block. req->bytes must be set to the length of the unallocated area
>>>> +         * before the allocated area. stop further processing.
>>>> +         */
>>>> +        req->bytes = offs - req->offs;
>>>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * assert that we caught all cases above and allocation state has not
>>>> +     * changed during callbacks.
>>>> +     */
>>>> +    assert(exists == req->exists || !req->bytes);
>>>> +    req->exists = exists;
>>>> +
>>>> +    /*
>>>> +     * assert that we either return an unallocated block or have got callbacks
>>>> +     * for all allocated blocks present.
>>>> +     */
>>>> +    assert(!req->exists || offs == req->offs + req->bytes);
>>>> +    req->bytes = offs + len - req->offs;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>>> +                                                 bool want_zero, int64_t offset,
>>>> +                                                 int64_t bytes, int64_t *pnum,
>>>> +                                                 int64_t *map,
>>>> +                                                 BlockDriverState **file)
>>>> +{
>>>> +    BDRVRBDState *s = bs->opaque;
>>>> +    int ret, r;
>>> Nit: I would rename ret to status or something like that to make
>>> it clear(er) that it is an actual value and never an error.  Or,
>>> even better, drop it entirely and return one of the two bitmasks
>>> directly.
>>>
>>>> +    struct rbd_diff_req req = { .offs = offset };
>>>> +    uint64_t features, flags;
>>>> +
>>>> +    assert(offset + bytes <= s->image_size);
>>>> +
>>>> +    /* default to all sectors allocated */
>>>> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>>>> +    *map = offset;
>>>> +    *file = bs;
>>>> +    *pnum = bytes;
>>>> +
>>>> +    /* check if RBD image supports fast-diff */
>>>> +    r = rbd_get_features(s->image, &features);
>>>> +    if (r < 0) {
>>>> +        goto out;
>>>> +    }
>>>> +    if (!(features & RBD_FEATURE_FAST_DIFF)) {
>>>> +        goto out;
>>>> +    }
>>>> +
>>>> +    /* check if RBD fast-diff result is valid */
>>>> +    r = rbd_get_flags(s->image, &flags);
>>>> +    if (r < 0) {
>>>> +        goto out;
>>>> +    }
>>>> +    if (flags & RBD_FLAG_FAST_DIFF_INVALID) {
>>>> +        goto out;
>>> Nit: I'm not a fan of labels that cover just the return statement.
>>> Feel free to ignore this one but I would get rid of it and replace
>>> these gotos with returns.
>>
>> That would be return with the bitmask directly coded in if I also
>>
>> drop the ret variable. I can change that, no problem.
>>
>>
>>>> +    }
>>>> +
>>>> +    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>>>> +                          qemu_rbd_co_block_status_cb, &req);
>>>> +    if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
>>>> +        goto out;
>>>> +    }
>>>> +    assert(req.bytes <= bytes);
>>>> +    if (!req.exists) {
>>>> +        if (r == 0 && !req.bytes) {
>>>> +            /*
>>>> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
>>>> +             * except for the case where an overlay has a hole where the parent
>>>> +             * has not. This here catches the case where no callback was
>>>> +             * invoked at all.
>>>> +             */
>>> The above is true in the case of diffing against a snapshot, i.e. when
>>> the "from" snapshot has some data where the "to" revision (whether HEAD
>>> or another snapshot) has a hole.  I don't think it is true for child vs
>>> parent (but it has been a while since I looked at the diff code).  As
>>> long as NULL is passed for fromsnapname, I would expect the callback to
>>> be invoked only for allocated areas.  If I'm right, we could simplify
>>> qemu_rbd_co_block_status_cb() considerably.
>> See my comment in the callback. Can you look at the diff code or give
>> me at least a pointer where I can find it. I am not that familiar with
>> the librbd code yet.
> I assumed that you added !exists handling because it came up in your
> testing.  If you don't have a test case then let's proceed under the
> assumption that it doesn't happen for clones.
>
> Thanks,
>
>                  Ilya


I just have sent V4. I tested also with thin-clones from a protected snapshot

and do not receive exists == 0 in the callback even after removing big files

from the image and running fstrim or rbd sparsify afterwards.


Peter



