Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458F48AA3B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:13:40 +0100 (CET)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7DDn-0001yz-2g
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7DAh-0000LA-Pn; Tue, 11 Jan 2022 04:10:27 -0500
Received: from kerio.kamp.de ([195.62.97.192]:45494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1n7DAe-0000Ef-3S; Tue, 11 Jan 2022 04:10:27 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.20.250.85] ([172.20.250.85])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Tue, 11 Jan 2022 10:10:16 +0100
Subject: Re: [PATCH 2/2] block/rbd: workaround for ceph issue #53784
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20220110114154.3774072-1-pl@kamp.de>
 <20220110114154.3774072-3-pl@kamp.de>
 <20220110141854.6wqqfyrsjyehcxqp@steredhat>
From: Peter Lieven <pl@kamp.de>
Message-ID: <7b5029ab-fa80-b1ed-63b9-9efd2d0284e3@kamp.de>
Date: Tue, 11 Jan 2022 10:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220110141854.6wqqfyrsjyehcxqp@steredhat>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 ct@flyingcircus.io, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com, idryomov@gmail.com,
 idryomov@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.01.22 um 15:18 schrieb Stefano Garzarella:
> On Mon, Jan 10, 2022 at 12:41:54PM +0100, Peter Lieven wrote:
>> librbd had a bug until early 2022 that affected all versions of ceph that
>> supported fast-diff. This bug results in reporting of incorrect offsets
>> if the offset parameter to rbd_diff_iterate2 is not object aligned.
>> Work around this bug by rounding down the offset to object boundaries.
>>
>> Fixes: https://tracker.ceph.com/issues/53784
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Peter Lieven <pl@kamp.de>
>> ---
>> block/rbd.c | 17 ++++++++++++++++-
>> 1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/rbd.c b/block/rbd.c
>> index 5e9dc91d81..260cb9f4b4 100644
>> --- a/block/rbd.c
>> +++ b/block/rbd.c
>> @@ -1333,6 +1333,7 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>     int status, r;
>>     RBDDiffIterateReq req = { .offs = offset };
>>     uint64_t features, flags;
>> +    int64_t head;
>>
>>     assert(offset + bytes <= s->image_size);
>>
>> @@ -1360,6 +1361,19 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>         return status;
>>     }
>>
>> +    /*
>> +     * librbd had a bug until early 2022 that affected all versions of ceph that
>> +     * supported fast-diff. This bug results in reporting of incorrect offsets
>> +     * if the offset parameter to rbd_diff_iterate2 is not object aligned.
>> +     * Work around this bug by rounding down the offset to object boundaries.
>> +     *
>> +     * See: https://tracker.ceph.com/issues/53784
>> +     */
>> +    head = offset & (s->object_size - 1);
>> +    offset -= head;
>> +    req.offs -= head;
>> +    bytes += head;
>> +
>>     r = rbd_diff_iterate2(s->image, NULL, offset, bytes, true, true,
>>                           qemu_rbd_diff_iterate_cb, &req);
>>     if (r < 0 && r != QEMU_RBD_EXIT_DIFF_ITERATE2) {
>> @@ -1379,7 +1393,8 @@ static int coroutine_fn qemu_rbd_co_block_status(BlockDriverState *bs,
>>         status = BDRV_BLOCK_ZERO | BDRV_BLOCK_OFFSET_VALID;
>>     }
>>
>> -    *pnum = req.bytes;
>> +    assert(req.bytes > head);
>> +    *pnum = req.bytes - head;
>>     return status;
>> }
>
> Thanks for the workaround!
>
> I just tested this patch for the issue reported in this BZ [1] and the test now works correctly!
>
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>
>
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=2034791
>


Hi Stefano,


thanks for the feedback. Please note that you also need the other patch or you will sooner or later run into another assertion as soon as rbd snapshots are involved.


Regarding the workaround I need confirmation from Ilya that it covers all cases. I do not know if it works if striping or EC is configured on the pool.


Best,

Peter




