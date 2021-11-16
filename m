Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97172453236
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 13:30:56 +0100 (CET)
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmxbz-0000p2-Gc
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 07:30:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmxab-0008QS-0l
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:29:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmxaY-000157-6f
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 07:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637065765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8M2+2FXe1iMhsH9TaLLdKXbBldDkEA14yljFMFL9Gvo=;
 b=TO2PPB6zdZs9ZjwTRK4lF8E6vq4LIMVjgJJ9stoofPvSHLZ/tRfllfz5nqvG0+rwa+p2vl
 wyQ6gKtqbe1mjCzENZDV94j6uU4VPe3xlLVohIboWuKke+NmSUwoApE9PtksErDUmn2zU2
 neXLHfnw4HGQgTvalHEEZJxiw9GSrSA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-7enwwXfbPoWUKCevf3yMKQ-1; Tue, 16 Nov 2021 07:29:24 -0500
X-MC-Unique: 7enwwXfbPoWUKCevf3yMKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1406281wms.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 04:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8M2+2FXe1iMhsH9TaLLdKXbBldDkEA14yljFMFL9Gvo=;
 b=hWdnDwG1qwXKjV+x1beHcs8Ft3gSBKM2Og01xXR0jmQbwgJoLVjIMgsIp+HHsHDsM0
 hobpQwbs2VNSBXfbF8L8Tx2Fq2GyQcFTrCqKnU3680mOys2DRmvjRrtRgfVz2YF9tmpK
 jMKtpBrqtmN+X+id1VITuZflFOY+YZHeBaSjMIoAACn9Yqpj7nwcjVIK53vlpE7/rw6h
 +lCy/U6IP3Xu8KJgvYgqylR3Ub5dhSky7lz3nDhjAKWx1AbObKJX+dpOTGwkoAJbWTzW
 bnfRCXdk6r6Cm5gUwaHuIOzwHlpDR1nfpSFQDaBmF1Fc7kDN3uL9/KTmTH5Mh4YJW22j
 5Qqg==
X-Gm-Message-State: AOAM530c4gl615LlMDbJrL0c3Rfz4ylOeLqtcm01iUy3K67yIN12Mxu2
 3Y3s+XVamZZajJbk35ofRuJWE4updKasHOL2giXwxdf76by0FMi3PWSX0IopOkJ0tOjvmcO1gC8
 +UihnSh+HHf79uyU=
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr8616111wrq.17.1637065763168;
 Tue, 16 Nov 2021 04:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaqZd7Vmdhl/Ew+9FeYZFDEgVZkAf1LSBdiOdtAr5CAt+7STWZO3sD89mqVLEEucMMk3qk9A==
X-Received: by 2002:a5d:6d09:: with SMTP id e9mr8616064wrq.17.1637065762938;
 Tue, 16 Nov 2021 04:29:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id g18sm2844256wmq.4.2021.11.16.04.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 04:29:22 -0800 (PST)
Message-ID: <4ecab0f2-b486-3b0a-65e6-2576e9254150@redhat.com>
Date: Tue, 16 Nov 2021 13:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 05/25] block/block-backend.c: assertions for
 block-backend
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-6-eesposit@redhat.com>
 <af4875d8-33aa-1ba2-0559-3ecdc963d3bf@redhat.com>
 <2b1cef04-8ef8-dce2-f873-c4586046d1d7@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <2b1cef04-8ef8-dce2-f873-c4586046d1d7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.11.21 11:15, Emanuele Giuseppe Esposito wrote:
>
>
> On 12/11/2021 12:01, Hanna Reitz wrote:
>> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>>> All the global state (GS) API functions will check that
>>> qemu_in_main_thread() returns true. If not, it means
>>> that the safety of BQL cannot be guaranteed, and
>>> they need to be moved to I/O.
>>>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   block/block-backend.c  | 90 
>>> +++++++++++++++++++++++++++++++++++++++++-
>>>   softmmu/qdev-monitor.c |  2 +
>>>   2 files changed, 91 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>> index 0afc03fd66..ed45576007 100644
>>> --- a/block/block-backend.c
>>> +++ b/block/block-backend.c
>>
>> [...]
>>
>>> @@ -1550,6 +1596,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, 
>>> int64_t offset,
>>>   void blk_aio_cancel(BlockAIOCB *acb)
>>>   {
>>> +    assert(qemu_in_main_thread());
>>>       bdrv_aio_cancel(acb);
>>>   }
>>
>> This function is in block-backend-io.h, though.
>
> I am confused a little on the {blk/bdrv}_aio functions, namely
> blk_aio_cancel
> bdrv_aio_cancel
> blk_aio_cancel_async
> bdrv_aio_cancel_async
>
> Do you think they should be I/O? The assertion seems to hold though.

Hm, semantically I would have classified them as I/O because they don’t 
modify state.  I don’t have a strong opinion, though, because they don’t 
actually do I/O.  They just cancel other I/O requests.

Most importantly though now I see there’s a comment in bdrv_aio_cancel() 
that states that “thread-safe code should use bdrv_aio_cancel_async 
exclusively”, which to me implies that bdrv_aio_cancel() (and 
blk_aio_cancel()) must be classified as GS, and it sounds like 
bdrv_aio_cancel_async() (and blk_aio_cancel_async()) should be 
classified as I/O.  Looking at the AIOCBInfo.cancel_async 
implementations (called by bdrv_aio_cancel_async()) I’m not sure they’re 
all really thread-safe, though...?  But at least bdrv_aio_cancel() 
claims they should be, so...

It seems to me like the intended separation is that bdrv_aio_cancel() 
should be GS and bdrv_aio_cancel_async() should be I/O.  I can’t verify 
that the .cancel_async implementations are really thread-safe, but 
neither can I verify that blk_aio_cancel_async() is only called by BQL 
callers.  That the assertions hold during testing isn’t too convincing 
for me, because we never wrote tests specifically to exercise these paths.

Hanna


