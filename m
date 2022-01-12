Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AE48CD2C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 21:41:08 +0100 (CET)
Received: from localhost ([::1]:60120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kQc-0001JK-WD
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 15:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7kP6-0000KL-LI; Wed, 12 Jan 2022 15:39:32 -0500
Received: from kerio.kamp.de ([195.62.97.192]:55928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7kP4-0004UV-Sz; Wed, 12 Jan 2022 15:39:32 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.86] ([172.20.250.86])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Wed, 12 Jan 2022 21:39:27 +0100
Subject: Re: [PATCH 1/2] block/rbd: fix handling of holes in
 .bdrv_co_block_status
To: Ilya Dryomov <idryomov@gmail.com>
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-2-pl@kamp.de>
 <CAOi1vP_nvvfmXXq=2kXYVoO-4UtzDmJ0X44_NnB1QCnSKTyGMA@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <6ae8a816-642e-d002-f0b5-31ccc0e4e31a@kamp.de>
Date: Wed, 12 Jan 2022 21:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP_nvvfmXXq=2kXYVoO-4UtzDmJ0X44_NnB1QCnSKTyGMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable@nongnu.org, ct@flyingcircus.io,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.01.22 um 10:05 schrieb Ilya Dryomov:
> On Mon, Jan 10, 2022 at 12:42 PM Peter Lieven <pl@kamp.de> wrote:
>> the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.
>>
>> We can see a hole in an image if we diff against base if there exists an older snapshot
>> of the image and we have discarded blocks in the image where the snapshot has data.
>>
>> Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 55 +++++++++++++++++++++++++++++++++--------------------
>>  1 file changed, 34 insertions(+), 21 deletions(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index def96292e0..5e9dc91d81 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -1279,13 +1279,24 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
>>      RBDDiffIterateReq *req = opaque;
>>
>>      assert(req->offs + req->bytes <= offs);
>> -    /*
>> -     * we do not diff against a snapshot so we should never receive a callback
>> -     * for a hole.
>> -     */
>> -    assert(exists);
>>
>> -    if (!req->exists && offs > req->offs) {
>> +    if (req->exists && offs > req->offs + req->bytes) {
>> +        /*
>> +         * we started in an allocated area and jumped over an unallocated area,
>> +         * req->bytes contains the length of the allocated area before the
>> +         * unallocated area. stop further processing.
>> +         */
>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>> +    }
>> +    if (req->exists && !exists) {
>> +        /*
>> +         * we started in an allocated area and reached a hole. req->bytes
>> +         * contains the length of the allocated area before the hole.
>> +         * stop further processing.
>> +         */
>> +        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>> +    }
>> +    if (!req->exists && exists && offs > req->offs) {
>>          /*
>>           * we started in an unallocated area and hit the first allocated
>>           * block. req->bytes must be set to the length of the unallocated area
>> @@ -1295,17 +1306,19 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
>>          return QEMU_RBD_EXIT_DIFF_ITERATE2;
>>      }
>>
>> -    if (req->exists && offs > req->offs + req->bytes) {
>> -        /*
>> -         * we started in an allocated area and jumped over an unallocated area,
>> -         * req->bytes contains the length of the allocated area before the
>> -         * unallocated area. stop further processing.
>> -         */
>> -        return QEMU_RBD_EXIT_DIFF_ITERATE2;
>> -    }
>> +    /*
>> +     * assert that we caught all cases above and allocation state has not
>> +     * changed during callbacks.
>> +     */
>> +    assert(exists == req->exists || !req->bytes);
>> +    req->exists = exists;
>>
>> -    req->bytes += len;
>> -    req->exists = true;
>> +    /*
>> +     * assert that we either return an unallocated block or have got callbacks
>> +     * for all allocated blocks present.
>> +     */
>> +    assert(!req->exists || offs == req->offs + req->bytes);
>> +    req->bytes = offs + len - req->offs;
>>
>>      return 0;
>>  }
>> @@ -1354,13 +1367,13 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>      }
>>      assert(req.bytes <= bytes);
>>      if (!req.exists) {
>> -        if (r == 0) {
>> +        if (r == 0 && !req.bytes) {
>>              /*
>> -             * rbd_diff_iterate2 does not invoke callbacks for unallocated
>> -             * areas. This here catches the case where no callback was
>> -             * invoked at all (req.bytes == 0).
>> +             * rbd_diff_iterate2 does not invoke callbacks for unallocated areas
>> +             * except for the case where an overlay has a hole where the parent
>> +             * or an older snapshot of the image has not. This here catches the
>> +             * case where no callback was invoked at all.
>>               */
>> -            assert(req.bytes == 0);
>>              req.bytes = bytes;
>>          }
>>          status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>> --
>> 2.25.1
>>
>>
> Hi Peter,
>
> Can we just skip these "holes" by replacing the existing assert with
> an if statement that would simply bail from the callback on !exists?
>
> Just trying to keep the logic as simple as possible since as it turns
> out we get to contend with ages-old librbd bugs here...


I'm afraid I think this would not work. Consider qemu-img convert.

If we bail out we would immediately call get_block_status with the offset

where we stopped and hit the !exist again.


Peter


