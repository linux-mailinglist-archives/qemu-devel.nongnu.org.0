Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D748C3E0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:23:23 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cew-0005zF-85
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7cEO-0005lE-47; Wed, 12 Jan 2022 06:55:56 -0500
Received: from kerio.kamp.de ([195.62.97.192]:45326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7cEL-0007Rz-TD; Wed, 12 Jan 2022 06:55:55 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.86] ([172.20.250.86])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Wed, 12 Jan 2022 12:55:40 +0100
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
To: Ilya Dryomov <idryomov@gmail.com>
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
 <CAOi1vP8tLGvy7R3NLzfYkD-V=Tzokz6LOKvx--V-jHSSUfyyDw@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <2a2cc253-e7fc-085b-4982-df46432216d4@kamp.de>
Date: Wed, 12 Jan 2022 12:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8tLGvy7R3NLzfYkD-V=Tzokz6LOKvx--V-jHSSUfyyDw@mail.gmail.com>
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 qemu-stable@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.01.22 um 10:59 schrieb Ilya Dryomov:
> On Mon, Jan 10, 2022 at 12:43 PM Peter Lieven <pl@kamp.de> wrote:
>> librbd had a bug until early 2022 that affected all versions of ceph that
>> supported fast-diff. This bug results in reporting of incorrect offsets
>> if the offset parameter to rbd_diff_iterate2 is not object aligned.
>> Work around this bug by rounding down the offset to object boundaries.
>>
>> Fixes: https://tracker.ceph.com/issues/53784
> I don't think the Fixes tag is appropriate here.  Linking librbd
> ticket is fine but this patch doesn't really fix anything.


Okay, I will change that to See:


>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>>  block/rbd.c | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 5e9dc91d81..260cb9f4b4 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>      int status, r;
>>      RBDDiffIterateReq req = { .offs = offset };
>>      uint64_t features, flags;
>> +    int64_t head;
>>
>>      assert(offset + bytes <= s->image_size);
>>
>> @@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>          return status;
>>      }
>>
>> +    /*
>> +     * librbd had a bug until early 2022 that affected all versions of ceph that
>> +     * supported fast-diff. This bug results in reporting of incorrect offsets
>> +     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
>> +     * Work around this bug by rounding down the offset to object boundaries.
>> +     *
>> +     * See: https://tracker.ceph.com/issues/53784
>> +     */
>> +    head = offset & (s->object_size - 1);
>> +    offset -= head;
>> +    req.offs -= head;
>> +    bytes += head;
> So it looks like the intention is to have more or less a permanent
> workaround since all librbd versions are affected, right?  For that,
> I think we would need to also reject custom striping patterns and
> clones.  For the above to be reliable, the image has to be standalone
> and have a default striping pattern (stripe_unit == object_size &&
> stripe_count == 1).  Otherwise, behave as if fast-diff is disabled or
> invalid.


Do you have a fealing how many users use a different striping pattern than default?

What about EC backed pools?

Do you have another idea how we can detect if the librbd version is broken?


>
>> +
> Nit: I'd replace { .offs = offset } initialization at the top with {}
> and assign to req.offs here, right before calling rbd_diff_iterate2().
>
>>      r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>>                            qemu_rbd_diff_iterate_cb, &req);
>>      if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
>> @@ -1379,7 +1393,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>          status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>>      }
>>
>> -    *pnum = req.bytes;
>> +    assert(req.bytes > head);
> I'd expand the workaround comment with an explanation of why it's OK
> to round down the offset -- because rbd_diff_iterate2() is called with
> whole_object=true.  If that wasn't the case, on top of inconsistent
> results for different offsets within an object, this assert could be
> triggered.

Sure, you are right. I had this in mind. This also does not change complexity

since we stay with the offset in the same object. I will mention both.


Peter




