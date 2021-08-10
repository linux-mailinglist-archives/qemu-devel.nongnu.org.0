Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022463E5BA6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:31:01 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRqO-0005qo-38
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mDRpA-0004so-LP; Tue, 10 Aug 2021 09:29:45 -0400
Received: from kerio.kamp.de ([195.62.97.192]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1mDRp6-0005Sb-4l; Tue, 10 Aug 2021 09:29:44 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Tue, 10 Aug 2021 15:29:29 +0200
Subject: Re: [PATCH] block/rbd: implement bdrv_co_block_status
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210809134136.23140-1-pl@kamp.de>
 <20210810085124.iwyd3g2jms6suzpi@steredhat>
From: Peter Lieven <pl@kamp.de>
Message-ID: <f570f8b5-27d0-335a-d98e-28c7c56c1fac@kamp.de>
Date: Tue, 10 Aug 2021 15:29:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810085124.iwyd3g2jms6suzpi@steredhat>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, ct@flyingcircus.io, mreitz@redhat.com,
 pbonzini@redhat.com, idryomov@gmail.com, idryomov@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.08.21 um 10:51 schrieb Stefano Garzarella:
> On Mon, Aug 09, 2021 at 03:41:36PM +0200, Peter Lieven wrote:
>
> Please, can you add a description?
> For example also describing what happens if RBD image does not support RBD_FEATURE_FAST_DIFF.


Sure.


>
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>> block/rbd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 119 insertions(+)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index dcf82b15b8..ef1eaa6af3 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -88,6 +88,7 @@ typedef struct BDRVRBDState {
>>     char *namespace;
>>     uint64_t image_size;
>>     uint64_t object_size;
>> +    uint64_t features;
>> } BDRVRBDState;
>>
>> typedef struct RBDTask {
>> @@ -983,6 +984,14 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>     s->image_size = info.size;
>>     s->object_size = info.obj_size;
>>
>> +    r = rbd_get_features(s->image, &s->features);
>> +    if (r < 0) {
>> +        error_setg_errno(errp, -r, "error getting image features from %s",
>> +                         s->image_name);
>> +        rbd_close(s->image);
>> +        goto failed_open;
>           ^
> You can use `failed_post_open` label here, so you can avoid to call rbd_close().


Bad me, I developed this patch in a Qemu version where failed_post_open wasn't present...


>
>> +    }
>> +
>>     /* If we are using an rbd snapshot, we must be r/o, otherwise
>>      * leave as-is */
>>     if (s->snap != NULL) {
>> @@ -1259,6 +1268,115 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
>>     return spec_info;
>> }
>>
>> +typedef struct rbd_diff_req {
>> +    uint64_t offs;
>> +    uint64_t bytes;
>> +    int exists;
>> +} rbd_diff_req;
>> +
>> +static int qemu_rbd_co_block_status_cb(uint64_t offs, size_t len,
>> +                                       int exists, void *opaque)
>> +{
>> +    struct rbd_diff_req *req = opaque;
>> +
>> +    assert(req->offs + req->bytes <= offs);
>> +    assert(offs >= req->offs + req->bytes);
>
> I think just one of the two asserts is enough, isn't that the same condition?


Right.


>
>> +
>> +    if (req->exists && offs > req->offs + req->bytes) {
>> +        /*
>> +         * we started in an allocated area and jumped over an unallocated area,
>> +         * req->bytes contains the length of the allocated area before the
>> +         * unallocated area. stop further processing.
>> +         */
>> +        return -9000;
>                  ^
> What is this magical value?
>
> Please add a macro (with a comment) and also use it below in other places.


Will add in V2.


>
>> +    }
>> +    if (req->exists && !exists) {
>> +        /*
>> +         * we started in an allocated area and reached a hole. req->bytes
>> +         * contains the length of the allocated area before the hole.
>> +         * stop further processing.
>> +         */
>> +        return -9000;
>> +    }
>> +    if (!req->exists && exists && offs > req->offs) {
>> +        /*
>> +         * we started in an unallocated area and hit the first allocated
>> +         * block. req->bytes must be set to the length of the unallocated area
>> +         * before the allocated area. stop further processing.
>> +         */
>> +        req->bytes = offs - req->offs;
>> +        return -9000;
>> +    }
>> +
>> +    /*
>> +     * assert that we catched all cases above and allocation state has not
>> +     * changed during callbacks.
>> +     */
>> +    assert(exists == req->exists || !req->bytes);
>> +    req->exists = exists;
>> +
>> +    /*
>> +     * assert that we either return an unallocated block or have got callbacks
>> +     * for all allocated blocks present.
>> +     */
>> +    assert(!req->exists || offs == req->offs + req->bytes);
>> +    req->bytes = offs + len - req->offs;
>> +
>> +    return 0;
>> +}
>> +
>> +static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>> +                                                 bool want_zero, int64_t offset,
>> +                                                 int64_t bytes, int64_t *pnum,
>> +                                                 int64_t *map,
>> + BlockDriverState **file)
>> +{
>> +    BDRVRBDState *s = bs->opaque;
>> +    int ret, r;
>> +    struct rbd_diff_req req = { .offs = offset };
>> +
>> +    assert(offset + bytes <= s->image_size);
>> +
>> +    /* default to all sectors allocated */
>> +    ret = BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID;
>> +    if (map) {
>> +        *map = offset;
>> +    }
>> +    *pnum = bytes;
>> +
>> +    /* RBD image does not support fast-diff */
>> +    if (!(s->features & RBD_FEATURE_FAST_DIFF)) {
>> +        goto out;
>> +    }
>> +
>> +    r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>> +                          qemu_rbd_co_block_status_cb, &req);
>> +    if (r < 0 && r != -9000) {
>> +        goto out;
>> +    }
>> +    assert(req.bytes <= bytes);
>> +    if (!req.exists) {
>> +        if (r == 0 && !req.bytes) {
>> +            /*
>> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
>> +             * except for the case where an overlay has a hole where the parent
>> +             * has not. This here catches the case where no callback was
>> +             * invoked at all.
>> +             */
>> +            req.bytes = bytes;
>> +        }
>> +        ret &= ~BDRV_BLOCK_DATA;
>> +        ret |= BDRV_BLOCK_ZERO;
>> +    }
>> +    *pnum = req.bytes;
>> +
>> +out:
>> +    if (ret > 0 && ret & BDRV_BLOCK_OFFSET_VALID && file) {
>
> Can ret be zero at this point?
> Doesn't BDRV_BLOCK_OFFSET_VALID always stay set?


Right, I decided to declare any area as allocated if rbd_diff_iterate2 would fail so this

can't happen.


I will send a V2 shortly.


Peter




