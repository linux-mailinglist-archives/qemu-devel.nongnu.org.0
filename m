Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD859D6B9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:48:46 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQWb-00009v-Dc
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQQTV-0006Zo-NH; Tue, 23 Aug 2022 05:45:35 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oQQTT-00006R-NI; Tue, 23 Aug 2022 05:45:33 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 66C692E13DE;
 Tue, 23 Aug 2022 12:45:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b4ab::1:3b] (unknown
 [2a02:6b8:b081:b4ab::1:3b])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 udGivFqC8e-jIO4U49j; Tue, 23 Aug 2022 12:45:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661247921; bh=61WmhOX3hyb5iOGd6yeMuIp1+ul5yVwD6Iqyx+3Ahys=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=pgX0DRP4CfJlAur5ODVG+Svr7IoeJEVdPSVA0EndSRCHmg437B+vTgSEIn7kOdLZP
 XUrR6pT4co8bRRYwlJFHsmGxefAO1SPOOSkXCbRskjH0foNmbiK5FQJoIhXMyT2FZy
 V1b+i3aun2zYEjvGPHjFCpdFSw9tCL2/V6ypO2uk=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8ff9f443-71d9-7992-42bd-26186e51f04b@yandex-team.ru>
Date: Tue, 23 Aug 2022 12:45:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/9] parallels: Out of image offset in BAT leads to
 image inflation
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com
References: <20220822090517.2289697-1-alexander.ivanov@virtuozzo.com>
 <20220822090517.2289697-2-alexander.ivanov@virtuozzo.com>
 <8a010bb8-82e3-8b74-8ce6-414d3638c7ad@yandex-team.ru>
 <c7c88a75-4e21-99ab-db91-bac5adc27f98@virtuozzo.com>
 <2f8d6eac-e55e-616e-38be-e8ee9d456144@yandex-team.ru>
In-Reply-To: <2f8d6eac-e55e-616e-38be-e8ee9d456144@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/23/22 10:59, Vladimir Sementsov-Ogievskiy wrote:
> On 8/23/22 10:23, Alexander Ivanov wrote:
>>
>> On 23.08.2022 08:58, Vladimir Sementsov-Ogievskiy wrote:
>>> On 8/22/22 12:05, Alexander Ivanov wrote:
>>>> data_end field in BDRVParallelsState is set to the biggest offset present
>>>> in BAT. If this offset is outside of the image, any further write will create
>>>> the cluster at this offset and/or the image will be truncated to this
>>>> offset on close. This is definitely not correct.
> 
> Actually, it's correct, as don't break the spec at docs/interop/parallels.txt.
> 
> So, it's bad but still correct.. So, we probably can restrict it in Qemu if we want. Do we?
> 
> Now I doubt. We are going to refuse images with leaks even for read. That means, qemu-img convert will stop working for images with leaks, you'll have to fix the image first, which may fail.
> 
>>>> Raise an error in parallels_open() if data_end points outside the image and
>>>> it is not a check (let the check to repaire the image).
>>>>
>>>> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
>>>> ---
>>>>   block/parallels.c | 14 ++++++++++++++
>>>>   1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/block/parallels.c b/block/parallels.c
>>>> index a229c06f25..c245ca35cd 100644
>>>> --- a/block/parallels.c
>>>> +++ b/block/parallels.c
>>>> @@ -732,6 +732,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>       BDRVParallelsState *s = bs->opaque;
>>>>       ParallelsHeader ph;
>>>>       int ret, size, i;
>>>> +    int64_t file_size;
>>>>       QemuOpts *opts = NULL;
>>>>       Error *local_err = NULL;
>>>>       char *buf;
>>>> @@ -811,6 +812,19 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>>>           }
>>>>       }
>>>>   +    file_size = bdrv_getlength(bs->file->bs);
>>>> +    if (file_size < 0) {
>>>> +        ret = file_size;
>>>> +        goto fail;
>>>> +    }
>>>> +
>>>> +    file_size >>= BDRV_SECTOR_BITS;
>>>> +    if (s->data_end > file_size && !(flags & BDRV_O_CHECK)) {
>>>> +        error_setg(errp, "parallels: Offset in BAT is out of image");
>>>> +        ret = -EINVAL;
>>>> +        goto fail;
>>>> +    }
>>>
>>> If image is unaligned to sector size, and image size is less than s->data_end, but the difference itself is less than sector, the error message would be misleading.
>>>
>>> Should we consider "file_size = DIV_ROUND_UP(file_size, BDRV_SECTOR_SIZE)" instead of "file_size >>= BDRV_SECTOR_BITS"?
>>>
>>> It's hardly possible to get such image on valid scenarios with Qemu (keeping in mind bdrv_truncate() call in parallels_close()). But it still may be possible to have such images produced by another software or by some failure path.
>>>
>> I think you are right, it would be better to align image size up to sector size.
> 
> 
> Hmm, or even to cluster_size? When last cluster is unallocated. But cluster boundary is not required to be aligned to cluster size..
> 
> Anyway, now I think it's wrong to restrict opening file with leaks of any kind. That breaks qemu-img convert, and that's not how other formats behave.
> 
>>>
>>>> +
>>>>       if (le32_to_cpu(ph.inuse) == HEADER_INUSE_MAGIC) {
>>>>           /* Image was not closed correctly. The check is mandatory */
>>>>           s->header_unclean = true;
>>>
>>>
> 
> 

Oops, ignore this. We are not about leaks (when file size > data_end), we are about wrong clusters when data_end > file_size.


-- 
Best regards,
Vladimir

