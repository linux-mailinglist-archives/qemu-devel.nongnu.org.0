Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DE59F5C7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:57:13 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmCG-0006zv-4e
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQm5l-0002gd-BI; Wed, 24 Aug 2022 04:50:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:53290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQm5h-0002TB-8F; Wed, 24 Aug 2022 04:50:27 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9B0EC2E1C56;
 Wed, 24 Aug 2022 11:50:11 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LajA5v5rVd-oAOOHQhP; Wed, 24 Aug 2022 11:50:10 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661331010; bh=z4s5KkMqFvKqErYshSkQZYgqoWs+yAx2sKtVGE+odyE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=aAKg29y6Ua8LtjGMcxox9hWEK0PMxd6+2HpPcYPALXrcISrHZIriAvpO4fdMOGWhY
 N/B4yM6Ih0FJoIzFA0UmB1Fx4sbKJmFv6ZNXuJ7vQSfAs/MqqBJ5CNCefolrLM2QCS
 3I7RvxSKxib2fxh8pD9e5jFl2XgS0CXT7NyfIcM4=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <41cd15b6-e5bd-01a2-7ac6-a7cf82ea857b@yandex-team.ru>
Date: Wed, 24 Aug 2022 11:50:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <234ffa52-e067-b80c-dbfe-427e18013655@virtuozzo.com>
 <8411cd50-6fba-27ab-ee9c-42b69a0c1a1a@yandex-team.ru>
 <5e5624ab-49f0-028f-6d73-d800d9dcd6a1@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <5e5624ab-49f0-028f-6d73-d800d9dcd6a1@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
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

On 8/23/22 13:11, Denis V. Lunev wrote:
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
> Like this, especially >= check which we have had missed.
> Though this would break the repair. We need additional
> 
> if (flags & BDRV_O_CHECK) {
>      continue;
> }
> 
> No incorrect data_end assignment, which would be
> very welcome.
> 
> Den

'continue' here will change the logic around data_end. We'll drop "wrong" clusters from calculation of data_end, and should check, how it affects further logic.

What about:

    for (i = 0; i < s->bat_size; i++) {
         int64_t off = bat2sect(s, i);
         if (off >= file_size && !(flags & BDRV_O_CHECK)) {
             error_setg(errp, "parallels: Offset %" PRIi64 " in BAT[%d] entry "
                        "is larger than file size (%" PRIi64 ")",
                        off, i, file_size);
             ret = -EINVAL;
             goto fail;
         }
         if (off >= s->data_end) {
             s->data_end = off + s->tracks;
         }
     }

- this we simply add new error-out on no-O_CHECK path.

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
> 


-- 
Best regards,
Vladimir

