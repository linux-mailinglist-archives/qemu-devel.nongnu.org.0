Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8159D6BB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:50:52 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQYd-000207-SE
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQQVx-00087R-QT; Tue, 23 Aug 2022 05:48:10 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:49692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQQVo-0000Pk-NC; Tue, 23 Aug 2022 05:47:59 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0986A2E14CE;
 Tue, 23 Aug 2022 12:47:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 BZKNidkpTX-lfO0Fg9w; Tue, 23 Aug 2022 12:47:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661248062; bh=ocFHu81YAZxaejRKIUYYrjBzPp/vOvC5jHj8+tgY8wE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=T7iWQR/O4DO53WcUCvMe2eSg6bLBpIVsKlw9EFptda7uXUlexX5iaiFpOMxvoFPde
 I/y9DexDVCZ2x45NZh8i3+FIbi2XfHD8ID7KV3wbetKX422svT9Obq6z+5cqQFLCJU
 4X38E9a/dvZI+PDk1XUnVfs3cxZQz0GW/BoO9icY=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <5252a511-b102-b0f0-8d79-1b80b91b0e7c@yandex-team.ru>
Date: Tue, 23 Aug 2022 12:47:41 +0300
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
 <68dc52ea-514a-3561-719b-172acbade2ab@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <68dc52ea-514a-3561-719b-172acbade2ab@virtuozzo.com>
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

On 8/23/22 12:34, Denis V. Lunev wrote:
> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>> data_end field in BDRVParallelsState is set to the biggest offset present
>>> in BAT. If this offset is outside of the image, any further write will create
>>> the cluster at this offset and/or the image will be truncated to this
>>> offset on close. This is definitely not correct.
>>> Raise an error in parallels_open() if data_end points outside the image and
>>> it is not a check (let the check to repaire the image).
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> ---
>>>   block/parallels.c | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index a229c06f25..c245ca35cd 100644
>>> --- a/block/parallels.c
>>> +++ b/block/parallels.c
>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>       BDRVParallelsState *s = bs->opaque;
>>>       ParallelsHeader ph;
>>>       int ret, size, i;
>>> +    int64_t file_size;
>>>       QemuOpts *opts = NULL;
>>>       Error *local_err = NULL;
>>>       char *buf;
>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>           }
>>>       }
>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>> +    if (file_size < 0) {
>>> +        ret = file_size;
>>> +        goto fail;
>>> +    }
>>> +
>>> +    file_size >>= BDRV_SECTOR_BITS;
>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>> +        ret = -EINVAL;
>>> +        goto fail;
>>> +    }
>>
>> If image is unaligned to sector size, and image size is less than s->data_end, but the difference itself is less than sector, the error message would be misleading.
>>
>> Should we consider "file_size = DIV_ROUND_UP(file_size, BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
> That is a different check. We need to be sure that file_size is authentic,
> which worth additional check.
> 
> At my opinion, this worth additional patch later on. Let us agree here,
> queue and proceed with further pending fixes.
> 
> We should use something like the following
> 
>      data_start = le32_to_cpu(s->header->data_off);
>      if (data_start == 0) {
>          data_start = ROUND_UP(bat_entry_off(s->bat_size), BDRV_SECTOR_SIZE);
>      }
>      if ((file_size - data_start) % cluster_size != 0) {
>          error();
>      }

Do you think that we should error-out in such conditions? It doesn't break the spec, is it? Can the last cluster be half allocated?

> 
>>
>> It's hardly possible to get such image on valid scenarios with Qemu (keeping in mind bdrv_truncate() call in parallels_close()). But it still may be possible to have such images produced by another software or by some failure path.
>>
>>
>>> +
>>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>>           /* Image was not closed correctly. The check is mandatory */
>>>           s->header_unclean = true;
>>
>>
> 


-- 
Best regards,
Vladimir

