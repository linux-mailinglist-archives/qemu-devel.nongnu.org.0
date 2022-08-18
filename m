Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C2598105
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:46:25 +0200 (CEST)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOc6Y-0006lp-8M
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oObtf-0005UJ-HA; Thu, 18 Aug 2022 05:33:03 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oObtb-0003Xx-7V; Thu, 18 Aug 2022 05:33:02 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 336D52E11B3;
 Thu, 18 Aug 2022 12:32:48 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:213::1:26] (unknown
 [2a02:6b8:b081:213::1:26])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 0NkdZIvfVs-WkOa1nxx; Thu, 18 Aug 2022 12:32:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1660815167; bh=wD88kFLu4Iw7YqJ393vaNvY63WTOFB7+jMjxYKxmXqQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ozCAsh7FYGwWrp6YwWM8oFzSOTjWD7UR6IzdqurA9Yt0/AVVMiNFzdmBk7la47Ptx
 x49GVNsQvaGDQDF7AbAo/VD3Uc+Ivzk042h6tWc3d+HvPeNQed4nLNev9U3SK3Fd5s
 RKUI7XeAdnbOK31m3w00wiYNiOzM1vNJc8MDE0bg=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1708321d-7500-5183-55d5-a3b7ee3062c1@yandex-team.ru>
Date: Thu, 18 Aug 2022 12:32:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/8] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
 <20220815090216.1818622-2-alexander.ivanov@virtuozzo.com>
 <f0f1cee6-1409-c94e-d9c1-68cb4c848d0a@yandex-team.ru>
 <30d44555-cb86-ae29-e781-959d6f12f0d2@virtuozzo.com>
 <fad01f34-b266-dbc7-6e19-6c29e835cbc1@yandex-team.ru>
 <336cbc1b-c591-3440-e111-762b3088cef1@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <336cbc1b-c591-3440-e111-762b3088cef1@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/22 11:49, Alexander Ivanov wrote:
> 
> On 17.08.2022 21:43, Vladimir Sementsov-Ogievskiy wrote:
>> On 8/17/22 22:27, Denis V. Lunev wrote:
>>> On 17.08.2022 21:13, Vladimir Sementsov-Ogievskiy wrote:
>>>> On 8/15/22 12:02, Alexander Ivanov wrote:
>>>>> data_end field in BDRVParallelsState is set to the biggest offset present
>>>>> in BAT. If this offset is outside of the image, any further write will create
>>>>> the cluster at this offset and/or the image will be truncated to this
>>>>> offset on close. This is definitely not correct and should be fixed.
>>>>>
>>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>>> ---
>>>>> v2: No change.
>>>>> v3: Fix commit message.
>>>>>
>>>>>   block/parallels.c | 17 +++++++++++++++++
>>>>>   1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>>> index a229c06f25..a76cf9d993 100644
>>>>> --- a/block/parallels.c
>>>>> +++ b/block/parallels.c
>>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>       BDRVParallelsState *s = bs->opaque;
>>>>>       ParallelsHeader ph;
>>>>>       int ret, size, i;
>>>>> +    int64_t file_size;
>>>>>       QemuOpts *opts = NULL;
>>>>>       Error *local_err = NULL;
>>>>>       char *buf;
>>>>> @@ -811,6 +812,22 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>           }
>>>>>       }
>>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>>> +    if (file_size < 0) {
>>>>> +        goto fail;
>>>>> +    }
>>>>> +
>>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>>> +    if (s->data_end > file_size) {
>>>>> +        if (flags & BDRV_O_CHECK) {
>>>>> +            s->data_end = file_size;
>>>>
>>>> Hm. but with this, any further allocation may lead to twice-allocted clusters, as you just modify s->data_end, but havn't yet fixed the BAT entry.. It seems unsafe. Or what I miss?
>>>>
>>> if O_CHECK is specified, we are going to execute parallels_co_check which
>>> will correctly handle this. In the other case (normal open) we will
>>> face the error, which is pretty much correct under this logic.
>>
>> Sounds like "s->data_end = file_size" is part of this handling and should be in parallels_co_check()..
>>
>> Looking at it, seems more correct to recalculate s->data_end exactly after for-loop, which fixes out-of-image clusters. Also it would work better in case when we have leaked clusters at the end of file.
>>
>> Otherwise, ideally, you should have comment at top of parallels_co_check(), that we must first fix out-of-image clusters, before doing any kind of allocation, because data_end is already tweaked.
>>
>> I agree that patch should work as is.
> 
> I would like to leave this check in parallels_open(). I think it's a good idea to have an error on a corrupted image. Later we can replace it by checking&fixing images in parallels_open().
> 
> But I agree, it would be better to move the fix of s->data_end to parallels_co_check() and then move to parallels_check_outside_image().

Yes, right, agree.

> 
>>
>>>
>>>>> +        } else {
>>>>> +            error_setg(errp, "parallels: Offset in BAT is out of image");
>>>>> +            ret = -EINVAL;
>>>>> +            goto fail;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>>>>           /* Image was not closed correctly. The check is mandatory */
>>>>>           s->header_unclean = true;
>>>>
>>>>
>>>
>>
>>


-- 
Best regards,
Vladimir

