Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC01C697AF7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGB8-0002MB-5Q; Wed, 15 Feb 2023 06:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSGB6-0002Lv-Aa; Wed, 15 Feb 2023 06:42:24 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSGB0-0004EB-Au; Wed, 15 Feb 2023 06:42:20 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 729C861C7A;
 Wed, 15 Feb 2023 14:42:08 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4bf::1:2e] (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7giK730Rwa61-xX1ZTVeR; Wed, 15 Feb 2023 14:42:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676461327; bh=To4HVdBjonYkZJWR81NLRVCT+5LUc8BifHyIqRuLa3g=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=qoR1Z+CDtd4qUY4gCNLOLca7fAem0o7rqs6wN7EiZBHS1mLrdtxWBuGV3PSeVsm8F
 HfTt965UCw3LawLWX5diqQTr+ee+jdxICe2ZLknhW9IgTyojcmVe5s4eceoq7wMJIh
 Cbbi291pt3pCPmnyQWIagf4E+Q9qlTd+L8hAdjkQ=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <877b7404-52ca-481d-fd05-d53e908afcf8@yandex-team.ru>
Date: Wed, 15 Feb 2023 14:42:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 01/12] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <20230203091854.2221397-2-alexander.ivanov@virtuozzo.com>
 <7b45258d-e046-373e-6434-2ae5bd7c2aa5@yandex-team.ru>
 <61e10fd3-c58a-5990-dcfc-45ebfe56d74b@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <61e10fd3-c58a-5990-dcfc-45ebfe56d74b@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15.02.23 14:29, Denis V. Lunev wrote:
> On 2/14/23 18:44, Vladimir Sementsov-Ogievskiy wrote:
>> On 03.02.23 12:18, Alexander Ivanov wrote:
>>> data_end field in BDRVParallelsState is set to the biggest offset present
>>> in BAT. If this offset is outside of the image, any further write will
>>> create the cluster at this offset and/or the image will be truncated to
>>> this offset on close. This is definitely not correct.
>>>
>>> Raise an error in parallels_open() if data_end points outside the image
>>> and it is not a check (let the check to repaire the image). Set data_end
>>> to the end of the cluster with the last correct offset.
>>>
>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>> Reviewed-by: Denis V. Lunev <den@openvz.org>
>>> ---
>>>   block/parallels.c | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/block/parallels.c b/block/parallels.c
>>> index bbea2f2221..4af68adc61 100644
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
>>> @@ -741,6 +742,12 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>           return ret;
>>>       }
>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>> +    if (file_size < 0) {
>>> +        return -EINVAL;
>>> +    }
>>> +    file_size >>= BDRV_SECTOR_BITS;
>>
>> if file size somehow not aligned to BDRV_SECTOR_SIZE, that's not correct, DIV_ROUND_UP would be better
>>
> I would say that if file length is not aligned to block size - this is a
> point to mark such file as broken and call check immediately.

I'm not sure about parallels driver, but qcow2 happily produces unaligned to sector files, when used with file opened in cached mode.

But I remembered now, that bdrv_getlength actually can't return unaligned length, as bdrv_co_getlength() is just a wrapper on bdrv_co_nb_sectors(). Then, seems better directly use bdrv_nb_sectors().

-- 
Best regards,
Vladimir


