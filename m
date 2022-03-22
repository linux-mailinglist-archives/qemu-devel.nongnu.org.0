Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FC4E3BD7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:39:53 +0100 (CET)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWazY-0007PZ-7Z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:39:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWayb-0006c2-9O
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWayY-0006Dq-68
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647941928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIIjHqoagmPUFAp2GGrxGvj2RW7RDB082c6i9z4ABEg=;
 b=d8iNa2hy5OcpviFyNdzip5TaxffCg5XbeEP/KEFnacoewq6gKHv03djJzS2CikF1MFv9hP
 UHXus1jrtJKf29XYnI5oPHH7Rk85UMI/WEj2c0vw+cUEcc+07izRi+QzkHniu9ihqeR1Ws
 s7WO+Aqznvh2DGHQdoREBJFFE2agWf8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-5Mc31001NgeuoJvb-zuRjw-1; Tue, 22 Mar 2022 05:38:46 -0400
X-MC-Unique: 5Mc31001NgeuoJvb-zuRjw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b71-20020a509f4d000000b00418d658e9d1so10109943edf.19
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mIIjHqoagmPUFAp2GGrxGvj2RW7RDB082c6i9z4ABEg=;
 b=EN7aPCwJtC2zL8b0dCYVU3Eh0BLZDjJHcwIknaeLjfcTd894rormp4nnLsVyJEvQDb
 r1+w/FB4CksFqFv6k9G9NvrpjSmrqicV7mszm2JZTyv5yo1j0wVQ/vybs+1M/5bQnqLQ
 DDYpT/JzlQOgD8DErEsQehcbQbePVWqhGsCJaVTPdxM2z9OYX64M18+/M6ORb2fc0TUj
 F58YKVcZ+XtweJeQ2045iRONK7LW/M//4zgD/wIFbVyAQtlyrez8UlgrZvAXqvTkae9d
 1HdwLVCzT8f2nY2RRPrK35TYY9XWIflcrvp4iAcx8E8MrIPLNcZBGpIdXnHmljh/j3g0
 Zdug==
X-Gm-Message-State: AOAM530BsDFQPpxRuO+KiyRJOT/y0nw5yks43TOisv191uYiA9UkH5CO
 WiFZeovU2eXpg2CbzfVoAQlCRSDbAfV+Gty0K1IAP/X+nlJpYhIhWmARZnmNBlkE92KoBFmd5hU
 4g8Xed05qdMTSbyk=
X-Received: by 2002:a05:6402:d05:b0:416:a67f:18ee with SMTP id
 eb5-20020a0564020d0500b00416a67f18eemr27533355edb.120.1647941925708; 
 Tue, 22 Mar 2022 02:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpBwQP0mQxhryHKrAR+UEOrFsFafITcI00j4XA3Lv5idMu7V8Dg0ZFpRBIMoQ1zQFOU7oRIg==
X-Received: by 2002:a05:6402:d05:b0:416:a67f:18ee with SMTP id
 eb5-20020a0564020d0500b00416a67f18eemr27533323edb.120.1647941925313; 
 Tue, 22 Mar 2022 02:38:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm7957712ejp.223.2022.03.22.02.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:38:44 -0700 (PDT)
Message-ID: <a12f9b05-1b10-02a6-111c-674d8b36df81@redhat.com>
Date: Tue, 22 Mar 2022 10:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>
References: <20220318164743.vgkbcoeok2e4r6pa@sgarzare-redhat>
 <40388E21-4608-4815-B332-C6173412B6C3@kamp.de>
 <20220321083137.rtwh6gretloaipwk@sgarzare-redhat>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220321083137.rtwh6gretloaipwk@sgarzare-redhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 21.03.22 09:31, Stefano Garzarella wrote:
> On Sat, Mar 19, 2022 at 04:15:33PM +0100, Peter Lieven wrote:
>>
>>
>>> Am 18.03.2022 um 17:47 schrieb Stefano Garzarella 
>>> <sgarzare@redhat.com>:
>>>
>>> ﻿On Fri, Mar 18, 2022 at 04:48:18PM +0100, Peter Lieven wrote:
>>>>
>>>>
>>>>>> Am 18.03.2022 um 09:25 schrieb Stefano Garzarella 
>>>>>> <sgarzare@redhat.com>:
>>>>>
>>>>> ﻿On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>>>>>
>>>>>>
>>>>>>>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella 
>>>>>>>> <sgarzare@redhat.com>:
>>>>>>>
>>>>>>> ﻿Commit d24f80234b ("block/rbd: increase dynamically the image 
>>>>>>> size")
>>>>>>> added a workaround to support growing images (eg. qcow2), resizing
>>>>>>> the image before write operations that exceed the current size.
>>>>>>>
>>>>>>> We recently added support for write zeroes and without the
>>>>>>> workaround we can have problems with qcow2.
>>>>>>>
>>>>>>> So let's move the resize into qemu_rbd_start_co() and do it when
>>>>>>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>>>>>
>>>>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>>>>>>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>>>>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>>>> ---
>>>>>>> block/rbd.c | 26 ++++++++++++++------------
>>>>>>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>>>>>>
>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>>> index 8f183eba2a..6caf35cbba 100644
>>>>>>> --- a/block/rbd.c
>>>>>>> +++ b/block/rbd.c
>>>>>>> @@ -1107,6 +1107,20 @@ static int coroutine_fn 
>>>>>>> qemu_rbd_start_co(BlockDriverState *bs,
>>>>>>>
>>>>>>>   assert(!qiov || qiov->size == bytes);
>>>>>>>
>>>>>>> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>>>>>>> +        /*
>>>>>>> +         * RBD APIs don't allow us to write more than actual 
>>>>>>> size, so in order
>>>>>>> +         * to support growing images, we resize the image 
>>>>>>> before write
>>>>>>> +         * operations that exceed the current size.
>>>>>>> +         */
>>>>>>> +        if (offset + bytes > s->image_size) {
>>>>>>> +            int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>> +            if (r < 0) {
>>>>>>> +                return r;
>>>>>>> +            }
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>>   r = rbd_aio_create_completion(&task,
>>>>>>>                                 (rbd_callback_t) 
>>>>>>> qemu_rbd_completion_cb, &c);
>>>>>>>   if (r < 0) {
>>>>>>> @@ -1182,18 +1196,6 @@ coroutine_fn 
>>>>>>> qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>>>>>>                                int64_t bytes, QEMUIOVector *qiov,
>>>>>>>                                BdrvRequestFlags flags)
>>>>>>> {
>>>>>>> -    BDRVRBDState *s = bs->opaque;
>>>>>>> -    /*
>>>>>>> -     * RBD APIs don't allow us to write more than actual size, 
>>>>>>> so in order
>>>>>>> -     * to support growing images, we resize the image before write
>>>>>>> -     * operations that exceed the current size.
>>>>>>> -     */
>>>>>>> -    if (offset + bytes > s->image_size) {
>>>>>>> -        int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>> -        if (r < 0) {
>>>>>>> -            return r;
>>>>>>> -        }
>>>>>>> -    }
>>>>>>>   return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, 
>>>>>>> RBD_AIO_WRITE);
>>>>>>> }
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.35.1
>>>>>>>
>>>>>>
>>>>>> Do we really have a use case for growing rbd images?
>>>>>
>>>>> The use case is to have a qcow2 image on rbd.
>>>>> I don't think it's very common, but some people use it and here 
>>>>> [1] we had a little discussion about features that could be 
>>>>> interesting (e.g.  persistent dirty bitmaps for incremental backup).
>>>>>
>>>>> In any case the support is quite simple and does not affect other 
>>>>> use cases since we only increase the size when we go beyond the 
>>>>> current size.
>>>>>
>>>>> IMHO we can have it in :-)
>>>>>
>>>>
>>>> The QCOW2 alone doesn’t make much sense, but additional metadata 
>>>> might be a use case.
>>>
>>> Yep.
>>>
>>>> Be aware that the current approach will serialize requests. If 
>>>> there is a real use case, we might think of a better solution.
>>>
>>> Good point, but it only happens when we have to resize, so maybe 
>>> it's okay for now, but I agree we could do better ;-)
>>
>> There might also be a problem if a write for a higher offset past eof 
>> will be executed shortly before a write to a slightly lower offset 
>> past eof. The second resize will fail as it would shrink the image. 
>> We would need proper locking to avoid this. Maybe we need to check if 
>> we write past eof. If yes, take a lock around the resize op and then 
>> check again if it’s still eof and only resize if true.
>
> I thought rbd_resize() was synchronous. Indeed when you said this 
> could serialize writes it sounded like confirmation to me.
>
> Since we call rbd_resize() before rbd_aio_writev(), I thought this 
> case could not occur.
>
> Can you please elaborate?

Seconding this request, because if rbd_resize() is allowed to shrink 
data, it being asynchronous might cause data corruption.

I’ll keep your patch because I find this highly unlikely, though: 
qemu_rbd_resize() itself is definitely synchronous, it can’t invoke 
qemu_coroutine_yield().

The only other possibility that comes to my mind is that rbd_resize() 
might delay the actual resize operation, but I would still expect 
consecutive resize requests to be executed in order, and since we call 
rbd_aio_writev()/rbd_aio_write_zeroes() immediately after the 
rbd_resize() (with no yielding in between), everything should be 
executed in the order that we expect.

Hanna


