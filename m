Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79159E64D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:45:07 +0200 (CEST)
Received: from localhost ([::1]:41742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQW5S-0006cW-9k
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQW47-0004p3-Bu; Tue, 23 Aug 2022 11:43:43 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:39476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQW43-00031l-IV; Tue, 23 Aug 2022 11:43:41 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 68F9F2E1584;
 Tue, 23 Aug 2022 18:43:27 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 RaIpYe7cQ1-hPP82mZX; Tue, 23 Aug 2022 18:43:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661269406; bh=0ZnWJTLYZpE2V33V+JXdHWUBrt+rqfYauB3HU1f3lqI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=0qE8TnDnULx/kYzy+Nvz8HFlvkgoq+4PdjxlIPDs0M/WxWtjnHlN1+6DKF9rCqTEq
 3BiUNMOza0EezrRJabZW9Gn57zSbEIE/MXnrLNapx+gbKgjFg7ZPHqJ9tGiunmp4Zf
 50vCe1CojECgk+M/EuN4NmphWHW4Lfbdab0J5+NE=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <42a14070-d123-4274-3e1f-8ba81b4f4ac5@yandex-team.ru>
Date: Tue, 23 Aug 2022 18:43:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
 <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
 <01f17112-8e92-b833-a8ea-241b5fd1eaf8@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <01f17112-8e92-b833-a8ea-241b5fd1eaf8@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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

On 8/23/22 16:50, Alexander Ivanov wrote:
> 
> On 23.08.2022 11:58, Vladimir Sementsov-Ogievskiy wrote:
>> On 8/23/22 12:20, Denis V. Lunev wrote:
>>> On 23.08.2022 09:23, Alexander Ivanov wrote:
>>>>
>>>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>>>> data_end field in BDRVParallelsState is set to the biggest offset present
>>>>>> in BAT. If this offset is outside of the image, any further write will create
>>>>>> the cluster at this offset and/or the image will be truncated to this
>>>>>> offset on close. This is definitely not correct.
>>>>>> Raise an error in parallels_open() if data_end points outside the image and
>>>>>> it is not a check (let the check to repaire the image).
>>>>>>
>>>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>>>> ---
>>>>>>   block/parallels.c | 14 ++++++++++++++
>>>>>>   1 file changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>>>> index a229c06f25..c245ca35cd 100644
>>>>>> --- a/block/parallels.c
>>>>>> +++ b/block/parallels.c
>>>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>>       BDRVParallelsState *s = bs->opaque;
>>>>>>       ParallelsHeader ph;
>>>>>>       int ret, size, i;
>>>>>> +    int64_t file_size;
>>>>>>       QemuOpts *opts = NULL;
>>>>>>       Error *local_err = NULL;
>>>>>>       char *buf;
>>>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>>>           }
>>>>>>       }
>>>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>>>> +    if (file_size < 0) {
>>>>>> +        ret = file_size;
>>>>>> +        goto fail;
>>>>>> +    }
>>>>>> +
>>>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>>>>> +        ret = -EINVAL;
>>>>>> +        goto fail;
>>>>>> +    }
>>>>>
>>>>> If image is unaligned to sector size, and image size is less than s->data_end, but the difference itself is less than sector, the error message would be misleading.
>>>>>
>>>>> Should we consider "file_size = DIV_ROUND_UP(file_size, BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>>>>
>>>>> It's hardly possible to get such image on valid scenarios with Qemu (keeping in mind bdrv_truncate() call in parallels_close()). But it still may be possible to have such images produced by another software or by some failure path.
>>>>>
>>>> I think you are right, it would be better to align image size up to sector size.
>>>
>>> I would say that we need to align not on sector size but on cluster size.
>>> That would worth additional check.
>>
>> And not simply align, as data_offset is not necessarily aligned to cluster size.
>>
>> Finally, what should we check?
>>
>> I suggest
>>
>>
>> diff --git a/block/parallels.c b/block/parallels.c
>> index 6d4ed77f16..b882ea1200 100644
>> --- a/block/parallels.c
>> +++ b/block/parallels.c
>> @@ -725,6 +725,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>      BDRVParallelsState *s = bs->opaque;
>>      ParallelsHeader ph;
>>      int ret, size, i;
>> +    int64_t file_size;
>>      QemuOpts *opts = NULL;
>>      Error *local_err = NULL;
>>      char *buf;
>> @@ -735,6 +736,11 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>          return -EINVAL;
>>      }
>>
>> +    file_size = bdrv_getlength(bs->file->bs);
>> +    if (file_size < 0) {
>> +        return file_size;
>> +    }
>> +
>>      ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
>>      if (ret < 0) {
>>          goto fail;
>> @@ -798,6 +804,13 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>
>>      for (i = 0; i < s->bat_size; i++) {
>>          int64_t off = bat2sect(s, i);
>> +        if (off >= file_size) {
> 
> Do we really want to compare file size with cluster offset, not with cluster end?

the spec say:
    Cluster offsets specified by BAT entries must meet the following requirements:
        [...]
        - the value must be lower than the desired file size,


> 
> Also I would leave the comparison outside the loop, because I'm going to move highest offset calculation to a helper (there are two places with the same code).

benefits of check inside the loop:

1. we get good error message with BAT index and problematic offset
2. we are sure that data_end is produced by real cluster. After the loop you'll have to consider image with no clusters separately

> 
>> + error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
>> +                       "is larger than file size (%" PRIi64 ")",
>> +                       off, i, file_size);
>> +            ret = -EINVAL;
>> +            goto fail;
>> +        }
>>          if (off >= s->data_end) {
>>              s->data_end = off + s->tracks;
>>          }
>>
>>
>>
>> - better error message, and we check exactly what's written in the spec (docs/interop/parallels.c):
>>
>>
>>   Cluster offsets specified by BAT entries must meet the following requirements:
>>       [...]
>>       - the value must be lower than the desired file size,
>>
>>
>>


-- 
Best regards,
Vladimir

