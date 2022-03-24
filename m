Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C14E6155
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:53:34 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXK9t-0006wS-Jt
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:53:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nXK8g-00060e-GC; Thu, 24 Mar 2022 05:52:18 -0400
Received: from kerio.kamp.de ([195.62.97.192]:58880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1nXK8d-00022f-TH; Thu, 24 Mar 2022 05:52:17 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Thu, 24 Mar 2022 10:52:04 +0100
Message-ID: <02086768-ff74-e927-a691-7adf1c3b4459@kamp.de>
Date: Thu, 24 Mar 2022 10:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
References: <20220318164743.vgkbcoeok2e4r6pa@sgarzare-redhat>
 <40388E21-4608-4815-B332-C6173412B6C3@kamp.de>
 <20220321083137.rtwh6gretloaipwk@sgarzare-redhat>
 <a12f9b05-1b10-02a6-111c-674d8b36df81@redhat.com>
From: Peter Lieven <pl@kamp.de>
In-Reply-To: <a12f9b05-1b10-02a6-111c-674d8b36df81@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.03.22 um 10:38 schrieb Hanna Reitz:
> On 21.03.22 09:31, Stefano Garzarella wrote:
>> On Sat, Mar 19, 2022 at 04:15:33PM +0100, Peter Lieven wrote:
>>>
>>>
>>>> Am 18.03.2022 um 17:47 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>
>>>> ﻿On Fri, Mar 18, 2022 at 04:48:18PM +0100, Peter Lieven wrote:
>>>>>
>>>>>
>>>>>>> Am 18.03.2022 um 09:25 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>>>
>>>>>> ﻿On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>>>>>>
>>>>>>>
>>>>>>>>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella <sgarzare@redhat.com>:
>>>>>>>>
>>>>>>>> ﻿Commit d24f80234b ("block/rbd: increase dynamically the image size")
>>>>>>>> added a workaround to support growing images (eg. qcow2), resizing
>>>>>>>> the image before write operations that exceed the current size.
>>>>>>>>
>>>>>>>> We recently added support for write zeroes and without the
>>>>>>>> workaround we can have problems with qcow2.
>>>>>>>>
>>>>>>>> So let's move the resize into qemu_rbd_start_co() and do it when
>>>>>>>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>>>>>>
>>>>>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>>>>>>>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>>>>>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>>>>> ---
>>>>>>>> block/rbd.c | 26 ++++++++++++++------------
>>>>>>>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>>>> index 8f183eba2a..6caf35cbba 100644
>>>>>>>> --- a/block/rbd.c
>>>>>>>> +++ b/block/rbd.c
>>>>>>>> @@ -1107,6 +1107,20 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>>>>>>>>
>>>>>>>>   assert(!qiov || qiov->size == bytes);
>>>>>>>>
>>>>>>>> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>>>>>>>> +        /*
>>>>>>>> +         * RBD APIs don't allow us to write more than actual size, so in order
>>>>>>>> +         * to support growing images, we resize the image before write
>>>>>>>> +         * operations that exceed the current size.
>>>>>>>> +         */
>>>>>>>> +        if (offset + bytes > s->image_size) {
>>>>>>>> +            int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>> +            if (r < 0) {
>>>>>>>> +                return r;
>>>>>>>> +            }
>>>>>>>> +        }
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>>   r = rbd_aio_create_completion(&task,
>>>>>>>>                                 (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>>>>>>>   if (r < 0) {
>>>>>>>> @@ -1182,18 +1196,6 @@ coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>>>>>>>                                int64_t bytes, QEMUIOVector *qiov,
>>>>>>>>                                BdrvRequestFlags flags)
>>>>>>>> {
>>>>>>>> -    BDRVRBDState *s = bs->opaque;
>>>>>>>> -    /*
>>>>>>>> -     * RBD APIs don't allow us to write more than actual size, so in order
>>>>>>>> -     * to support growing images, we resize the image before write
>>>>>>>> -     * operations that exceed the current size.
>>>>>>>> -     */
>>>>>>>> -    if (offset + bytes > s->image_size) {
>>>>>>>> -        int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>> -        if (r < 0) {
>>>>>>>> -            return r;
>>>>>>>> -        }
>>>>>>>> -    }
>>>>>>>>   return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
>>>>>>>> }
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 2.35.1
>>>>>>>>
>>>>>>>
>>>>>>> Do we really have a use case for growing rbd images?
>>>>>>
>>>>>> The use case is to have a qcow2 image on rbd.
>>>>>> I don't think it's very common, but some people use it and here [1] we had a little discussion about features that could be interesting (e.g.  persistent dirty bitmaps for incremental backup).
>>>>>>
>>>>>> In any case the support is quite simple and does not affect other use cases since we only increase the size when we go beyond the current size.
>>>>>>
>>>>>> IMHO we can have it in :-)
>>>>>>
>>>>>
>>>>> The QCOW2 alone doesn’t make much sense, but additional metadata might be a use case.
>>>>
>>>> Yep.
>>>>
>>>>> Be aware that the current approach will serialize requests. If there is a real use case, we might think of a better solution.
>>>>
>>>> Good point, but it only happens when we have to resize, so maybe it's okay for now, but I agree we could do better ;-)
>>>
>>> There might also be a problem if a write for a higher offset past eof will be executed shortly before a write to a slightly lower offset past eof. The second resize will fail as it would shrink the image. We would need proper locking to avoid this. 
>>> Maybe we need to check if we write past eof. If yes, take a lock around the resize op and then check again if it’s still eof and only resize if true.
>>
>> I thought rbd_resize() was synchronous. Indeed when you said this could serialize writes it sounded like confirmation to me.
>>
>> Since we call rbd_resize() before rbd_aio_writev(), I thought this case could not occur.
>>
>> Can you please elaborate?
>
> Seconding this request, because if rbd_resize() is allowed to shrink data, it being asynchronous might cause data corruption.
>
> I’ll keep your patch because I find this highly unlikely, though: qemu_rbd_resize() itself is definitely synchronous, it can’t invoke qemu_coroutine_yield().
>
> The only other possibility that comes to my mind is that rbd_resize() might delay the actual resize operation, but I would still expect consecutive resize requests to be executed in order, and since we call rbd_aio_writev()/rbd_aio_write_zeroes() 
> immediately after the rbd_resize() (with no yielding in between), everything should be executed in the order that we expect.


Maybe my assumption of parallelism here was wrong. I was thinking of:


Request A: write at offset (EOL + 4k).

Request A: rbd_resize is invoked (size EOL + 4k)

Request B: write at offset (EOL + 2k)

Request B: rbd_resize is invoked (size EOL + 2k) because image_size is not yet updated

Request A: rbd_resize finishes image_size is set to EOL + 4k

Request B: rbd_resize fails or shrinks the image to EOL + 2k


If this can't happen with coroutines, please ignore my concern.


Peter




