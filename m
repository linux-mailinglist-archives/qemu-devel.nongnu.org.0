Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142003AE53E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:50:17 +0200 (CEST)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvFdI-0002zY-4q
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lvFcT-0001sh-JV; Mon, 21 Jun 2021 04:49:25 -0400
Received: from kerio.kamp.de ([195.62.97.192]:50798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lvFcN-0003lu-HZ; Mon, 21 Jun 2021 04:49:24 -0400
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 21 Jun 2021 10:49:05 +0200
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
To: Ilya Dryomov <idryomov@gmail.com>
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-6-pl@kamp.de>
 <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
 <99aaf586-5555-8c45-08c8-e50e3b5919de@kamp.de>
 <CAOi1vP8PAMttja8vWvxkWX-Wn4co5tu6kORKXSHGbwTMzFzMdA@mail.gmail.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <52b6dbf5-897a-c862-bde2-5e8c0424e8db@kamp.de>
Date: Mon, 21 Jun 2021 10:49:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOi1vP8PAMttja8vWvxkWX-Wn4co5tu6kORKXSHGbwTMzFzMdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
 qemu-devel@nongnu.org, ct@flyingcircus.io, Paolo Bonzini <pbonzini@redhat.com>,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.06.21 um 12:34 schrieb Ilya Dryomov:
> On Fri, Jun 18, 2021 at 11:00 AM Peter Lieven <pl@kamp.de> wrote:
>> Am 16.06.21 um 14:34 schrieb Ilya Dryomov:
>>> On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
>>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>>> ---
>>>>   block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>> index 0d8612a988..ee13f08a74 100644
>>>> --- a/block/rbd.c
>>>> +++ b/block/rbd.c
>>>> @@ -63,7 +63,8 @@ typedef enum {
>>>>       RBD_AIO_READ,
>>>>       RBD_AIO_WRITE,
>>>>       RBD_AIO_DISCARD,
>>>> -    RBD_AIO_FLUSH
>>>> +    RBD_AIO_FLUSH,
>>>> +    RBD_AIO_WRITE_ZEROES
>>>>   } RBDAIOCmd;
>>>>
>>>>   typedef struct BDRVRBDState {
>>>> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>
>>>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
>>>> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
>>> I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
>>> does not really have a notion of non-efficient explicit zeroing.
>>
>> This is only true if thick provisioning is supported which is in Octopus onwards, right?
> Since Pacific, I think.
>
>> So it would only be correct to set this if thick provisioning is supported otherwise we could
>>
>> fail with ENOTSUP and then qemu emulates the zeroing with plain writes.
> I actually had a question about that.  Why are you returning ENOTSUP
> in case BDRV_REQ_MAY_UNMAP is not specified and that can't be fulfilled
> because librbd is too old for RBD_WRITE_ZEROES_FLAG_THICK_PROVISION?
>
> My understanding has always been that BDRV_REQ_MAY_UNMAP is just
> a hint.  Deallocating if BDRV_REQ_MAY_UNMAP is specified is not nice
> but should be perfectly acceptable.  It is certainly better than
> returning ENOTSUP, particularly if ENOTSUP causes Qemu to do plain
> zeroing.


I think this was introduced to support different provisioning modes. If BDRV_REQ_MAY_UNMAP is not set

the caller of bdrv_write_zeroes expects that the driver does thick provisioning. If the driver cannot handle that (efficiently)

qemu does a plain zero write.


I am still not fully understanding the meaning of the BDRV_REQ_NO_FALLBACK flag. The original commit states that it was introduced for qemu-img to efficiently

zero out the target and avoid the slow fallback. When I last worked on qemu-img convert I remember that there was a call to zero out the target if bdrv_has_zero_init

is not 1. It seems hat meanwhile a target_is_zero cmdline switch for qemu-img convert was added to let the user assert that a preexisting target is zero.

Maybe someone can help here if it would be right to set BDRV_REQ_NO_FALLBACK for rbd in either of the 2 cases (thick provisioning is support or not)?


Thanks

Peter





