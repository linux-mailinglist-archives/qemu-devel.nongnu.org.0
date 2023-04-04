Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDE6D6AAF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 19:34:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjkWf-00005k-1A; Tue, 04 Apr 2023 13:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjkWa-00005B-T0
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjkWU-0004B3-Tl
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680629565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKH0m/CXfPf8k0qb7tynInFftZaIO7gr+kqiQUILJ+Q=;
 b=EDhAa7nsDRuc2m6HkOmnCGYAQpS9PVlQGAC9rLWJpEchh75BTI8K7/J9obX+z1XCneB/JI
 gB7SavwL3vIWuZidba2qWM1HQ8WVxdmQoZPHTRt6UlJR3BB+WJbpLkhf5b8QmwDfeIb//E
 HeiUWuE9JF3A2uFfmgQ4ejM2yinIwd8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-gYROaQYsPqSmMUjS98asbg-1; Tue, 04 Apr 2023 13:32:44 -0400
X-MC-Unique: gYROaQYsPqSmMUjS98asbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh19-20020a05600c3d1300b003ee93fac4a9so17760281wmb.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 10:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680629563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qKH0m/CXfPf8k0qb7tynInFftZaIO7gr+kqiQUILJ+Q=;
 b=W0kDG80oGxvHiKrDdb69mb9OtWoKw4XgWqeuWMfFJMIx0o43viKghogHO11t+BSLOG
 +3FHDdcz2AaWXACkCU09U1iraP1H19LoSBPh8GqhvIdO4Xr5ytCYTtJn5HYwfLK7dQr3
 OMF9oRWiqYGgyFd7DpIi9XWTphOjeUfJgyjAcRKZx2QEYVikitx80zltBneGvdwVy3Io
 wGsPuB9Ty/zG/tA7HN29IASThoLmORAsDugfrOQDlqayfz8ZYEFbl6N05SLjviP9inyZ
 SwtZaoFXBHCmiiGcmRxbA2wDtO3yeuR2AOGijTBWZ0dbec7o/hLtQ9Fx7n71/vaPJDLq
 kVnA==
X-Gm-Message-State: AAQBX9eU6IJbAwUgE1yroB5IJl3w+/YXM6BLiQ2Tr53/MQSpZ563jqFX
 5hmEs4dL3iz58qJkmh9OD6Tl5nkIIrRvUidARE2G7cgdrUC94AIzBluRx1BZLdMINAVnUR8lbB2
 8cQy82+QBp1JYF0A=
X-Received: by 2002:a05:6000:1a48:b0:2d4:99f:66fa with SMTP id
 t8-20020a0560001a4800b002d4099f66famr2388800wry.14.1680629563046; 
 Tue, 04 Apr 2023 10:32:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWnloiZhlHEUy7iL6yMPjbwFkY6y7I2oU9IHu6zgobjoV6EXbLWW20KRpDMyj+q9CatlGM/w==
X-Received: by 2002:a05:6000:1a48:b0:2d4:99f:66fa with SMTP id
 t8-20020a0560001a4800b002d4099f66famr2388791wry.14.1680629562710; 
 Tue, 04 Apr 2023 10:32:42 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4d06000000b002e6d4ac31a3sm10453033wrt.72.2023.04.04.10.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 10:32:41 -0700 (PDT)
Message-ID: <251b1d36-7fe0-498d-f257-b1a0d256779f@redhat.com>
Date: Tue, 4 Apr 2023 19:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] block: Split padded I/O vectors exceeding IOV_MAX
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230317175019.10857-1-hreitz@redhat.com>
 <20230317175019.10857-3-hreitz@redhat.com>
 <794be57d-9bbb-4de4-00ef-32df10cc3eaa@yandex-team.ru>
 <751be7a2-f32a-569d-c464-c7821560edea@redhat.com>
 <9bf47acd-9c41-b838-c6a9-fea2c586d385@yandex-team.ru>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <9bf47acd-9c41-b838-c6a9-fea2c586d385@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.925, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04.04.23 10:10, Vladimir Sementsov-Ogievskiy wrote:
> On 03.04.23 16:33, Hanna Czenczek wrote:
>> (Sorry for the rather late reply... Thanks for the review!)
>>
>> On 20.03.23 11:31, Vladimir Sementsov-Ogievskiy wrote:
>>> On 17.03.23 20:50, Hanna Czenczek wrote:
>>
>> [...]
>>
>>>> diff --git a/block/io.c b/block/io.c
>>>> index 8974d46941..1e9cdba17a 100644
>>>> --- a/block/io.c
>>>> +++ b/block/io.c
>>>
>>> [..]
>>>
>>>> +    pad->write = write;
>>>> +
>>>>       return true;
>>>>   }
>>>>   @@ -1545,6 +1561,18 @@ zero_mem:
>>>>     static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>>>
>>> Maybe, rename to _finalize, to stress that it's not only freeing 
>>> memory.
>>
>> Sounds good!
>>
>> [...]
>>
>>>> @@ -1552,6 +1580,101 @@ static void 
>>>> bdrv_padding_destroy(BdrvRequestPadding *pad)
>>>>       memset(pad, 0, sizeof(*pad));
>>>>   }
>>>>   +/*
>>>> + * Create pad->local_qiov by wrapping @iov in the padding head and 
>>>> tail, while
>>>> + * ensuring that the resulting vector will not exceed IOV_MAX 
>>>> elements.
>>>> + *
>>>> + * To ensure this, when necessary, the first couple of elements 
>>>> (up to three)
>>>
>>> maybe, "first two-three elements"
>>
>> Sure (here and...
>>
>> [...]
>>
>>>> +    /*
>>>> +     * If padded_niov > IOV_MAX, we cannot just concatenate 
>>>> everything.
>>>> +     * Instead, merge the first couple of elements of @iov to 
>>>> reduce the number
>>>
>>> maybe, "first two-three elements"
>>
>> ...here).
>>
>>>
>>>> +     * of vector elements as necessary.
>>>> +     */
>>>> +    if (padded_niov > IOV_MAX) {
>>>>
>>>
>>> [..]
>>>
>>>> @@ -1653,8 +1786,8 @@ int coroutine_fn 
>>>> bdrv_co_preadv_part(BdrvChild *child,
>>>>           flags |= BDRV_REQ_COPY_ON_READ;
>>>>       }
>>>>   -    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, 
>>>> &bytes, &pad,
>>>> -                           NULL, &flags);
>>>> +    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, 
>>>> &bytes, false,
>>>> +                           &pad, NULL, &flags);
>>>>       if (ret < 0) {
>>>>           goto fail;
>>>>       }
>>>
>>> a bit later:
>>>
>>> tracked_request_end(&req);
>>> bdrv_padding_destroy(&pad);
>>>
>>>
>>> Now, the request is formally finished inside 
>>> bdrv_padding_destroy().. Not sure, does it really violate something, 
>>> but seems safer to swap these two calls. 
>>
>> I’d rather not, for two reasons: First, tracked requests are (as far 
>> as I understand) only there to implement request serialization, and 
>> so only care about metadata (offset, length, and type), which is not 
>> changed by changes to the I/O vector.
>>
>> Second, even if the state of the I/O vector were relevant to tracked 
>> requests, I think it would actually be the other way around, i.e. the 
>> tracked request must be ended before the padding is 
>> finalized/destroyed.  The tracked request is about the actual request 
>> we submit to `child` (which is why tracked_request_begin() is called 
>> after bdrv_pad_request()), and that request is done using the 
>> modified I/O vector.  So if the tracked request had any connection to 
>> the request’s I/O vector (which it doesn’t), it would be to this 
>> modified one, so we mustn’t invalidate it via bdrv_padding_finalize() 
>> while the tracked request lives.
>>
>> Or, said differently: I generally try to clean up things in the 
>> inverse way they were set up, and because bdrv_pad_requests() comes 
>> before tracked_request_begin(), I think tracked_request_end() should 
>> come before bdrv_padding_finalize().
>
> Note, that it's wise-versa in bdrv_co_pwritev_part().

Well, and it’s this way here.  We agree that for clean-up, the order 
doesn’t functionally matter, so either way is actually fine.

> For me it's just simpler to think that the whole request, including 
> filling user-given qiov with data on read part is inside 
> tracked_request_begin() / tracked_request_end().

It isn’t, though, because padding must be done before the tracked 
request is created.  The tracked request uses the request’s actual 
offset and length, after padding, so bdrv_pad_request() must always be 
done before (i.e., outside) tracked_request_begin().

> And moving the last manipulation with qiov out of it breaks this 
> simple thought.
> Guest should not care of it, as it doesn't know about request 
> tracking.. But what about internal code? Some code may depend on some 
> requests be finished after bdrv_drained_begin() call, but now they may 
> be not fully finished, and some data may be not copied back to 
> original qiov.
>
> I agree with your point about sequence of objects finalization, but 
> maybe, that just shows that copying data back to qiov should not be a 
> part of bdrv_padding_finalize(), but instead be a separate function, 
> called before tracked_request_end().

But my thought is that copying back shouldn’t be done before 
tracked_request_end(), because copying back is not part of the tracked 
request.  What we track is the padded request, which uses a modified I/O 
vector, so undoing that modification shouldn’t be done while the tracked 
request lives.

I know I’m inconsistent with regards to bdrv_co_pwritev_part(), which is 
because it doesn’t matter.  My actual position is that tracked requests 
are about metadata, so undoing/finalizing the padding (including 
potentially copying data back) has nothing to do with a tracked request, 
so the order cannot of finalizing both cannot matter.

But you’re arguing for consistency, and my position on that is, if we 
want consistency, I’d finalize the tracked request first, and the 
padding second.  This is also because tracking is done for 
serialization, so we should end it as soon as possible, so that 
concurrent requests are resumed quickly.  (Though I’m not sure if 
delaying it by a memcpy() matters for an essentially single-threaded 
block layer at this time.)

Hanna


