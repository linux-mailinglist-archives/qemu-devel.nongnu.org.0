Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA5D6D45E1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:33:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKJG-0006ek-Ia; Mon, 03 Apr 2023 09:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjKJB-0006dk-IZ
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pjKJ8-00023E-OW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:33:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680528793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Uz6aWhckVK/vxMXpedDQcTBhQ+ey5gl905tnk4mVIU=;
 b=DRVP9Jafij+EggEwMAtsXt5253qYAQI0BEZIGIV/fxXdON3dg9xThA8GupMOupzpXlochE
 P0iF5DKUakvcGOzMvPgCoss5USNNtfERe695jCLG/AO+3k9hXrjUhcBnnY4nfWBq1UIVt1
 EIRRWhOH/QJsy7tCNItJi3lFHHRpm8E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-d6OnkTbNP9WMG3XDozoajg-1; Mon, 03 Apr 2023 09:33:12 -0400
X-MC-Unique: d6OnkTbNP9WMG3XDozoajg-1
Received: by mail-wm1-f72.google.com with SMTP id
 v7-20020a05600c470700b003ef6ebfa99fso11565320wmo.8
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680528791;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Uz6aWhckVK/vxMXpedDQcTBhQ+ey5gl905tnk4mVIU=;
 b=BWU/+BVGzL2nAkI2GCHIRN4LGEfCLE+Fn0Urm668nhikVWul98PfC82YffTxqqA11V
 TcsvAAeiMDmGJGk90MAq1qoEEFf8Zi88f2Z9zqOoDi5obRyTcoacEYsvZLTDZ8muX9c5
 V2Q8VFRXTST2CN3TTH9asogTQzqDyG5Dyq+o/7IXwO1GyWPYHKpvuVYnEVk8e51uX1AU
 4nvcy/uGKQSGzTc+CZtElxn4/1oifQ/O6hW3R3eIKO54JqiYT8vCo/U/E0ncUog4EB+P
 efZyT/XWAQYA5Pgvy5G0f7HhdSqeHamQV3+90amhGLYHd5XOt5WqVpC1T4zmzNyckPDY
 Dz7Q==
X-Gm-Message-State: AAQBX9d7tHU+7KTUQj6DFni9Q5iUrkWFA51yw5nxDeCo1K4PbOouINYN
 ZXNujveB5Dize6twVURbxUWS6HHvIXjXCicdlvaZMXD0X9/9e008VvEEruRkqsr6xejcORgAdZm
 1TOJmeBtu2VIy8F8=
X-Received: by 2002:a7b:c84e:0:b0:3f0:3ab2:a7e5 with SMTP id
 c14-20020a7bc84e000000b003f03ab2a7e5mr9786942wml.34.1680528791287; 
 Mon, 03 Apr 2023 06:33:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0b/26XQIBMK+OS4zFTj+aMMVW9sFl+pCrlKZ032GVuoDT7yxgT/MFukZYS9mgv2zBtGC3Dw==
X-Received: by 2002:a7b:c84e:0:b0:3f0:3ab2:a7e5 with SMTP id
 c14-20020a7bc84e000000b003f03ab2a7e5mr9786926wml.34.1680528790938; 
 Mon, 03 Apr 2023 06:33:10 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003ef6bc71cccsm19881656wmq.27.2023.04.03.06.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 06:33:10 -0700 (PDT)
Message-ID: <751be7a2-f32a-569d-c464-c7821560edea@redhat.com>
Date: Mon, 3 Apr 2023 15:33:08 +0200
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
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <794be57d-9bbb-4de4-00ef-32df10cc3eaa@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

(Sorry for the rather late reply... Thanks for the review!)

On 20.03.23 11:31, Vladimir Sementsov-Ogievskiy wrote:
> On 17.03.23 20:50, Hanna Czenczek wrote:

[...]

>> diff --git a/block/io.c b/block/io.c
>> index 8974d46941..1e9cdba17a 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>
> [..]
>
>> +    pad->write = write;
>> +
>>       return true;
>>   }
>>   @@ -1545,6 +1561,18 @@ zero_mem:
>>     static void bdrv_padding_destroy(BdrvRequestPadding *pad)
>
> Maybe, rename to _finalize, to stress that it's not only freeing memory.

Sounds good!

[...]

>> @@ -1552,6 +1580,101 @@ static void 
>> bdrv_padding_destroy(BdrvRequestPadding *pad)
>>       memset(pad, 0, sizeof(*pad));
>>   }
>>   +/*
>> + * Create pad->local_qiov by wrapping @iov in the padding head and 
>> tail, while
>> + * ensuring that the resulting vector will not exceed IOV_MAX elements.
>> + *
>> + * To ensure this, when necessary, the first couple of elements (up 
>> to three)
>
> maybe, "first two-three elements"

Sure (here and...

[...]

>> +    /*
>> +     * If padded_niov > IOV_MAX, we cannot just concatenate everything.
>> +     * Instead, merge the first couple of elements of @iov to reduce 
>> the number
>
> maybe, "first two-three elements"

...here).

>
>> +     * of vector elements as necessary.
>> +     */
>> +    if (padded_niov > IOV_MAX) {
>>
>
> [..]
>
>> @@ -1653,8 +1786,8 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild 
>> *child,
>>           flags |= BDRV_REQ_COPY_ON_READ;
>>       }
>>   -    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, 
>> &bytes, &pad,
>> -                           NULL, &flags);
>> +    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, 
>> false,
>> +                           &pad, NULL, &flags);
>>       if (ret < 0) {
>>           goto fail;
>>       }
>
> a bit later:
>
> tracked_request_end(&req);
> bdrv_padding_destroy(&pad);
>
>
> Now, the request is formally finished inside bdrv_padding_destroy().. 
> Not sure, does it really violate something, but seems safer to swap 
> these two calls. 

I’d rather not, for two reasons: First, tracked requests are (as far as 
I understand) only there to implement request serialization, and so only 
care about metadata (offset, length, and type), which is not changed by 
changes to the I/O vector.

Second, even if the state of the I/O vector were relevant to tracked 
requests, I think it would actually be the other way around, i.e. the 
tracked request must be ended before the padding is 
finalized/destroyed.  The tracked request is about the actual request we 
submit to `child` (which is why tracked_request_begin() is called after 
bdrv_pad_request()), and that request is done using the modified I/O 
vector.  So if the tracked request had any connection to the request’s 
I/O vector (which it doesn’t), it would be to this modified one, so we 
mustn’t invalidate it via bdrv_padding_finalize() while the tracked 
request lives.

Or, said differently: I generally try to clean up things in the inverse 
way they were set up, and because bdrv_pad_requests() comes before 
tracked_request_begin(), I think tracked_request_end() should come 
before bdrv_padding_finalize().

> With that:
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
>
>
> PS, I feel here still exists small space for optimization:

The question is whether any optimization is really worth it, and I’m not 
sure it is.  The bug has been in qemu for over two years, and because 
the only report I’ve seen about it came from our QE department, it seems 
like a very rare case, so I find it more important for the code to be as 
simple as possible than to optimize.

> move the logic to bdrv_init_padding(), and
>
> 1. allocate only one buffer
> 2. make the new collpase are to be attached to head or tail padding
> 3. avoid creating extra iov-slice, maybe with help of some new 
> qemu_iovec_* API that can control number of copied/to-be-copied iovs 
> and/or calculation number of iovs in qiov/qiov_offset/bytes slice

I’ve actually begun by trying to reuse the padding buffer, and to 
collapse head/tail into it, but found it to be rather complicated. See 
also my reply to Stefan here: 
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04774.html

Hanna


