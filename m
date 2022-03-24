Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF44E6230
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:12:00 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLNm-0004nH-U2
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:11:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXLIj-0000dv-9N
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nXLIf-0004EE-MD
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648120000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMCevAoI5gjR0jfw8eNP3G7FVD/7+465m0p3OwqheU8=;
 b=K0QDEybvsaWknTFFumoNCObi+YL26MFSTjpnhCFwuSESq3JM36H/6F5qxhapAZhxbn9BFl
 D2IbYlBRpNUnVqhfh6brM4g/BFZDVX+L38U5KIf17wscGRfW33fByHLUU/On9IYOsbxqgs
 FxNRXtUNe2svWIqiDMzFxU8dwLwc9YI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-G302vqDKM1qRkPYKNor0BQ-1; Thu, 24 Mar 2022 07:06:39 -0400
X-MC-Unique: G302vqDKM1qRkPYKNor0BQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 u13-20020a50a40d000000b00419028f7f96so2793863edb.21
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hMCevAoI5gjR0jfw8eNP3G7FVD/7+465m0p3OwqheU8=;
 b=FcENsTkzY4NKN8LM1lHN4U58amKc5eyAidWvq2MIR5e2uoS+6Bcl550ONxNZhDnJIe
 DzJNWkrErvrcz0B3fNAevaqgBXQEmU8Ry+WqkmzmOhSS4XorI8E/Hty41SRbgfCtjREC
 jzSMioKBzf5a1qt4ilENUP/YUdP/CgdrWymLHsRk6w33PCgpN1XtZMZThyxdoCWmJKBR
 mp+TfedBVDpIVDKOuTP56fysB3yXcAPqiul3xAWVuXqnhpbAxaI/kBgzOGgSEnCxCEjc
 PKedXM6mEZYr7jMASxsiWz2XlgIlVrVuRrxGsOOinRTDL2KBxkV4iVPFpup1arcy/r8V
 ie6w==
X-Gm-Message-State: AOAM5334ZgeEci6i1MMaT11+NJjnuk/r8zKg0Q9e3Na4Hk6HpYjvV6kj
 S1ek9bLWO1tSO4uKx4MCfhpLwQM75Py7cPkUdzZbbCgNtLkavjarW6L7rqRy/OupfdiPPve0jii
 ymf4QGbJa9YmnuhE=
X-Received: by 2002:a05:6402:2681:b0:419:4564:1bd4 with SMTP id
 w1-20020a056402268100b0041945641bd4mr6091066edd.358.1648119998255; 
 Thu, 24 Mar 2022 04:06:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxStc/igwPGaRHH5z0Ls4sLyKzlFgzLoMKYeeXI9mRv9fi04uTW1rBQRTnTRgqEiPzK/MA8Q==
X-Received: by 2002:a05:6402:2681:b0:419:4564:1bd4 with SMTP id
 w1-20020a056402268100b0041945641bd4mr6091012edd.358.1648119997748; 
 Thu, 24 Mar 2022 04:06:37 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a056402280e00b0041957289726sm1325841ede.79.2022.03.24.04.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 04:06:37 -0700 (PDT)
Message-ID: <ecef6a0b-5a91-34ad-ee89-d86e9166c4a0@redhat.com>
Date: Thu, 24 Mar 2022 12:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] block/rbd: fix write zeroes with growing images
To: Peter Lieven <pl@kamp.de>, Stefano Garzarella <sgarzare@redhat.com>
References: <20220318164743.vgkbcoeok2e4r6pa@sgarzare-redhat>
 <40388E21-4608-4815-B332-C6173412B6C3@kamp.de>
 <20220321083137.rtwh6gretloaipwk@sgarzare-redhat>
 <a12f9b05-1b10-02a6-111c-674d8b36df81@redhat.com>
 <02086768-ff74-e927-a691-7adf1c3b4459@kamp.de>
 <20220324104027.decsksvjgj6a6ghv@sgarzare-redhat>
 <2a2c06b1-1ff9-6038-00dc-21b138119843@kamp.de>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <2a2c06b1-1ff9-6038-00dc-21b138119843@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

On 24.03.22 11:42, Peter Lieven wrote:
> Am 24.03.22 um 11:40 schrieb Stefano Garzarella:
>> On Thu, Mar 24, 2022 at 10:52:04AM +0100, Peter Lieven wrote:
>>> Am 22.03.22 um 10:38 schrieb Hanna Reitz:
>>>> On 21.03.22 09:31, Stefano Garzarella wrote:
>>>>> On Sat, Mar 19, 2022 at 04:15:33PM +0100, Peter Lieven wrote:
>>>>>>
>>>>>>
>>>>>>> Am 18.03.2022 um 17:47 schrieb Stefano Garzarella 
>>>>>>> <sgarzare@redhat.com>:
>>>>>>>
>>>>>>> ﻿On Fri, Mar 18, 2022 at 04:48:18PM +0100, Peter Lieven wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>>> Am 18.03.2022 um 09:25 schrieb Stefano Garzarella 
>>>>>>>>>> <sgarzare@redhat.com>:
>>>>>>>>>
>>>>>>>>> ﻿On Thu, Mar 17, 2022 at 07:27:05PM +0100, Peter Lieven wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>> Am 17.03.2022 um 17:26 schrieb Stefano Garzarella 
>>>>>>>>>>>> <sgarzare@redhat.com>:
>>>>>>>>>>>
>>>>>>>>>>> ﻿Commit d24f80234b ("block/rbd: increase dynamically the 
>>>>>>>>>>> image size")
>>>>>>>>>>> added a workaround to support growing images (eg. qcow2), 
>>>>>>>>>>> resizing
>>>>>>>>>>> the image before write operations that exceed the current size.
>>>>>>>>>>>
>>>>>>>>>>> We recently added support for write zeroes and without the
>>>>>>>>>>> workaround we can have problems with qcow2.
>>>>>>>>>>>
>>>>>>>>>>> So let's move the resize into qemu_rbd_start_co() and do it 
>>>>>>>>>>> when
>>>>>>>>>>> the command is RBD_AIO_WRITE or RBD_AIO_WRITE_ZEROES.
>>>>>>>>>>>
>>>>>>>>>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2020993
>>>>>>>>>>> Fixes: c56ac27d2a ("block/rbd: add write zeroes support")
>>>>>>>>>>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>>>>>>>>>> ---
>>>>>>>>>>> block/rbd.c | 26 ++++++++++++++------------
>>>>>>>>>>> 1 file changed, 14 insertions(+), 12 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/block/rbd.c b/block/rbd.c
>>>>>>>>>>> index 8f183eba2a..6caf35cbba 100644
>>>>>>>>>>> --- a/block/rbd.c
>>>>>>>>>>> +++ b/block/rbd.c
>>>>>>>>>>> @@ -1107,6 +1107,20 @@ static int coroutine_fn 
>>>>>>>>>>> qemu_rbd_start_co(BlockDriverState *bs,
>>>>>>>>>>>
>>>>>>>>>>>   assert(!qiov || qiov->size == bytes);
>>>>>>>>>>>
>>>>>>>>>>> +    if (cmd == RBD_AIO_WRITE || cmd == RBD_AIO_WRITE_ZEROES) {
>>>>>>>>>>> +        /*
>>>>>>>>>>> +         * RBD APIs don't allow us to write more than 
>>>>>>>>>>> actual size, so in order
>>>>>>>>>>> +         * to support growing images, we resize the image 
>>>>>>>>>>> before write
>>>>>>>>>>> +         * operations that exceed the current size.
>>>>>>>>>>> +         */
>>>>>>>>>>> +        if (offset + bytes > s->image_size) {
>>>>>>>>>>> +            int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>>>>> +            if (r < 0) {
>>>>>>>>>>> +                return r;
>>>>>>>>>>> +            }
>>>>>>>>>>> +        }
>>>>>>>>>>> +    }
>>>>>>>>>>> +
>>>>>>>>>>>   r = rbd_aio_create_completion(&task,
>>>>>>>>>>> (rbd_callback_t) qemu_rbd_completion_cb, &c);
>>>>>>>>>>>   if (r < 0) {
>>>>>>>>>>> @@ -1182,18 +1196,6 @@ coroutine_fn 
>>>>>>>>>>> qemu_rbd_co_pwritev(BlockDriverState *bs, int64_t offset,
>>>>>>>>>>>                                int64_t bytes, QEMUIOVector 
>>>>>>>>>>> *qiov,
>>>>>>>>>>> BdrvRequestFlags flags)
>>>>>>>>>>> {
>>>>>>>>>>> -    BDRVRBDState *s = bs->opaque;
>>>>>>>>>>> -    /*
>>>>>>>>>>> -     * RBD APIs don't allow us to write more than actual 
>>>>>>>>>>> size, so in order
>>>>>>>>>>> -     * to support growing images, we resize the image 
>>>>>>>>>>> before write
>>>>>>>>>>> -     * operations that exceed the current size.
>>>>>>>>>>> -     */
>>>>>>>>>>> -    if (offset + bytes > s->image_size) {
>>>>>>>>>>> -        int r = qemu_rbd_resize(bs, offset + bytes);
>>>>>>>>>>> -        if (r < 0) {
>>>>>>>>>>> -            return r;
>>>>>>>>>>> -        }
>>>>>>>>>>> -    }
>>>>>>>>>>>   return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, 
>>>>>>>>>>> RBD_AIO_WRITE);
>>>>>>>>>>> }
>>>>>>>>>>>
>>>>>>>>>>> -- 2.35.1
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Do we really have a use case for growing rbd images?
>>>>>>>>>
>>>>>>>>> The use case is to have a qcow2 image on rbd.
>>>>>>>>> I don't think it's very common, but some people use it and 
>>>>>>>>> here [1] we had a little discussion about features that could 
>>>>>>>>> be interesting (e.g. persistent dirty bitmaps for incremental 
>>>>>>>>> backup).
>>>>>>>>>
>>>>>>>>> In any case the support is quite simple and does not affect 
>>>>>>>>> other use cases since we only increase the size when we go 
>>>>>>>>> beyond the current size.
>>>>>>>>>
>>>>>>>>> IMHO we can have it in :-)
>>>>>>>>>
>>>>>>>>
>>>>>>>> The QCOW2 alone doesn’t make much sense, but additional 
>>>>>>>> metadata might be a use case.
>>>>>>>
>>>>>>> Yep.
>>>>>>>
>>>>>>>> Be aware that the current approach will serialize requests. If 
>>>>>>>> there is a real use case, we might think of a better solution.
>>>>>>>
>>>>>>> Good point, but it only happens when we have to resize, so maybe 
>>>>>>> it's okay for now, but I agree we could do better ;-)
>>>>>>
>>>>>> There might also be a problem if a write for a higher offset past 
>>>>>> eof will be executed shortly before a write to a slightly lower 
>>>>>> offset past eof. The second resize will fail as it would shrink 
>>>>>> the image. We would need proper locking to avoid this. Maybe we 
>>>>>> need to check if we write past eof. If yes, take a lock around 
>>>>>> the resize op and then check again if it’s still eof and only 
>>>>>> resize if true.
>>>>>
>>>>> I thought rbd_resize() was synchronous. Indeed when you said this 
>>>>> could serialize writes it sounded like confirmation to me.
>>>>>
>>>>> Since we call rbd_resize() before rbd_aio_writev(), I thought this 
>>>>> case could not occur.
>>>>>
>>>>> Can you please elaborate?
>>>>
>>>> Seconding this request, because if rbd_resize() is allowed to 
>>>> shrink data, it being asynchronous might cause data corruption.
>>>>
>>>> I’ll keep your patch because I find this highly unlikely, though: 
>>>> qemu_rbd_resize() itself is definitely synchronous, it can’t invoke 
>>>> qemu_coroutine_yield().
>>>>
>>>> The only other possibility that comes to my mind is that 
>>>> rbd_resize() might delay the actual resize operation, but I would 
>>>> still expect consecutive resize requests to be executed in order, 
>>>> and since we call rbd_aio_writev()/rbd_aio_write_zeroes() 
>>>> immediately after the rbd_resize() (with no yielding in between), 
>>>> everything should be executed in the order that we expect.
>>>
>>>
>>> Maybe my assumption of parallelism here was wrong. I was thinking of:
>>>
>>>
>>> Request A: write at offset (EOL + 4k).
>>>
>>> Request A: rbd_resize is invoked (size EOL + 4k)
>>
>> IIUC Request B can't start until Request A calls 
>> qemu_coroutine_yield(), but I'm waiting for a confirmation from Hanna :-)

That’s my impression at least.

> Yes, and I would be interested if this is also true if coroutines are 
> implemented as threads.

Depends on what you mean by that.  Coroutines are a form of cooperative 
multitasking, i.e. they can’t be preempted unless they explicitly 
yield.  Threads are generally supposed to be preemptive, so those are 
just different things.

Of course you can use coroutines in threads, i.e. run multiple requests 
in parallel.  But then the coroutine part becomes largely irrelevant, 
and you’re just facing standard thread-safety questions, and then of 
course this won’t be safe.  I assume to support such a model, all block 
drivers would need to be fully audited anyway, though.

For example, theoretically, the guest could then issue two resize 
operations simultaneously, and qemu_rbd_co_truncate() would be called in 
two concurrent threads.  This would already cause problems, because 
setting s->image_size would race.  That’s pre-existing regardless of 
this patch here (or d24f80234b39d2d5c0d91e63b5e4569d37b2399e).

What this means is that of course we could just slap a lock around the 
qemu_rbd_resize() call in qemu_rbd_start_co() (and its surrounding 
condition), it wouldn’t cost anything, assuming that this area can’t be 
run in parallel anyway.  But the rest of the block driver doesn’t 
contain a single lock yet, which to me signals that nothing in 
block/rbd.c is thread-safe anyway.

Hanna


