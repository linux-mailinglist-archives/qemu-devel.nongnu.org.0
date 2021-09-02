Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670D3FEF44
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:17:38 +0200 (CEST)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnX7-0005CO-4e
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mLnSp-0006OT-5X; Thu, 02 Sep 2021 10:13:11 -0400
Received: from kerio.kamp.de ([195.62.97.192]:47194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mLnSn-0005Fb-11; Thu, 02 Sep 2021 10:13:10 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 2 Sep 2021 16:12:53 +0200
Subject: Re: [PATCH V2] block/rbd: implement bdrv_co_block_status
To: Ilya Dryomov <idryomov@gmail.com>
References: <20210810134124.18523-1-pl@kamp.de>
 <CAOi1vP_vu3sRSp1nV8EfvNvkJMWg26iGJWtXqPnT9yUS6Zh36g@mail.gmail.com>
 <83955263-3d55-7fe8-709a-7729edf48573@kamp.de>
 <CAOi1vP9+7BJj_iYmzVJrBQTer2ABLN3YV1M2cdbCa+A0KdFZgQ@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <92d7d28c-5f55-7364-8699-9adbb4166f91@kamp.de>
Date: Thu, 2 Sep 2021 16:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP9+7BJj_iYmzVJrBQTer2ABLN3YV1M2cdbCa+A0KdFZgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.08.21 um 22:39 schrieb Ilya Dryomov:
> On Mon, Aug 23, 2021 at 11:38 AM Peter Lieven <pl@kamp.de> wrote:
>> Am 22.08.21 um 23:02 schrieb Ilya Dryomov:
>>> On Tue, Aug 10, 2021 at 3:41 PM Peter Lieven <pl@kamp.de> wrote:
>>>> the qemu rbd driver currently lacks support for bdrv_co_block_status.
>>>> This results mainly in incorrect progress during block operations (e.g.
>>>> qemu-img convert with an rbd image as source).
>>>>
>>>> This patch utilizes the rbd_diff_iterate2 call from librbd to detect
>>>> allocated and unallocated (all zero areas).
>>>>
>>>> To avoid querying the ceph OSDs for the answer this is only done if
>>>> the image has the fast-diff features which depends on the object-map
>>> Hi Peter,
>>>
>>> Nit: "has the fast-diff feature which depends on the object-map and
>>> exclusive-lock features"
>>
>> will reword in V3.
>>
>>
>>>> and exclusive-lock. In this case it is guaranteed that the information
>>>> is present in memory in the librbd client and thus very fast.
>>>>
>>>> If fast-diff is not available all areas are reported to be allocated
>>>> which is the current behaviour if bdrv_co_block_status is not implemented.
>>>>
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>> ---
>>>> V1->V2:
>>>> - add commit comment [Stefano]
>>>> - use failed_post_open [Stefano]
>>>> - remove redundant assert [Stefano]
>>>> - add macro+comment for the magic -9000 value [Stefano]
>>>> - always set *file if its non NULL [Stefano]
>>>>
>>>>    block/rbd.c | 125 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 125 insertions(+)
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index dcf82b15b8..8692e76f40 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
>>>>        char *namespace;
>>>>        uint64_t image_size;
>>>>        uint64_t object_size;
>>>> +    uint64_t features;
>>>>    } BDRVRBDState;
>>>>
>>>>    typedef struct RBDTask {
>>>> @@ -983,6 +984,13 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>>>        s->image_size = info.size;
>>>>        s->object_size = info.obj_size;
>>>>
>>>> +    r = rbd_get_features(s->image, &s->features);
>>>> +    if (r < 0) {
>>>> +        error_setg_errno(errp, -r, "error getting image features from %s",
>>>> +                         s->image_name);
>>>> +        goto failed_post_open;
>>>> +    }
>>> The object-map and fast-diff features can be enabled/disabled while the
>>> image is open so this should probably go to qemu_rbd_co_block_status().
>>>
>>>> +
>>>>        /* If we are using an rbd snapshot, we must be r/o, otherwise
>>>>         * leave as-is */
>>>>        if (s->snap != NULL) {
>>>> @@ -1259,6 +1267,122 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>>>>        return spec_info;
>>>>    }
>>>>
>>>> +typedef struct rbd_diff_req {
>>>> +    uint64_t offs;
>>>> +    uint64_t bytes;
>>>> +    int exists;
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
>>>> +     * assert that we catched all cases above and allocation state has not
>>> catched -> caught
>>>
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
>>>> +    struct rbd_diff_req req = { .offs = offset };
>>>> +
>>>> +    assert(offset + bytes <= s->image_size);
>>>> +
>>>> +    /* default to all sectors allocated */
>>>> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>>> I'm a little confused by the meaning of these flags (but I haven't
>>> looked at the other drivers yet).  Looks like this patch always sets
>>> BDRV_BLOCK_OFFSET_VALID (makes sense since the "host" offset is always
>>> known for rbd) and returns either BDRV_BLOCK_DATA or BDRV_BLOCK_ZERO.
>>>
>>> DATA ZERO OFFSET_VALID
>>>    t    t        t       sectors read as zero, returned file is zero at offset
>>>    t    f        t       sectors read as valid from file at offset
>>>    f    t        t       sectors preallocated, read as zero, returned file not
>>>                          necessarily zero at offset
>>>    f    f        t       sectors preallocated but read from backing_hd,
>>>                          returned file contains garbage at offset
>>>
>>> What about the first case (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO)?
>>> What is the practical difference to just BDRV_BLOCK_ZERO?
>>
>> Actually I don't know, I adapted the flags from other drivers. Looking at your
>> table it seems that DATA + ZERO would be more appropriate for rbd, right?
> It would seem that way but I haven't had a chance to look at how qemu
> block layer interprets these yet.
>
>> We do not preallocate in qem/rbd yet.
> I guess it depends on what preallocated means here, if it talks about
> the logical address space or the physical sectors.  If the former, rbd
> can be thought of as always preallocated.
>
> Separately, rbd_read() at an offset that corresponds to an unallocated
> area (including in parent image(s)) would always return zeroes.  I wonder
> if that is the same as "returned file is zero at offset".


It seems that all other drivers either set DATA or ZERO. I would leave it

the same for RBD.


>
>>
>>>> +    if (map) {
>>>> +        *map = offset;
>>>> +    }
>>>> +    if (file) {
>>>> +        *file = bs;
>>>> +    }
>>> A comment in block_int.h says that map and file are guaranteed to be
>>> non-NULL so these tests seem redundant?
>>
>> This is also Copy&Paste from other drivers, will change it (and maybe
>>
>> in other drivers as well).
>>
>>
>>
>>>> +    *pnum = bytes;
>>>> +
>>>> +    /* RBD image does not support fast-diff */
>>>> +    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
>>>> +        goto out;
>>>> +    }
>>> Need to make sure that fast-diff is valid here: call rbd_get_flags()
>>> on the image and test for !RBD_FLAG_FAST_DIFF_INVALID.
>>
>> Do I have to check for feature FAST_DIFF + flag !FAST_DIFF_INVALID or
>>
>> is the second enough? Is this call fast?
> For both.  The call should be as fast as rbd_get_features().


The question was if this is handled solely in the client?


Peter




