Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96464824D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cLC-0004LD-Ef; Fri, 09 Dec 2022 07:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p3cL3-0004IT-60
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p3cL1-00056u-9a
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670588323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krVs6fCFwfI/F73LtJU4MxiABHJOfti45EnPqIKx/80=;
 b=PqOHINGJoQ+A0eet404WVGaCGnVPhZphlEbbtSvCEizVRR4/3pXfBvtqU+MIOedSjELY7p
 ro0UpF4/LwQPbxwO8exIPKjPxfljhAoFuv0Iv9Nd+ILc1GT5JyIEwjFSfD2azQlfFyrgEt
 w2gO6X5L6r08YkgsEe7at64I1WWBojc=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-TGHOrTR1NbWDowjS-cvBmw-1; Fri, 09 Dec 2022 07:18:42 -0500
X-MC-Unique: TGHOrTR1NbWDowjS-cvBmw-1
Received: by mail-ua1-f69.google.com with SMTP id
 31-20020a9f23a2000000b00419ac00068aso1789629uao.7
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=krVs6fCFwfI/F73LtJU4MxiABHJOfti45EnPqIKx/80=;
 b=4dDHhmSd2daygsSkgKCoNYSc6NNmt6u4AamCtAX1TFkhrzfLRFwN+8T0XSqw7dB8iz
 yRlH7AtS5YGC0P9RL1Zvx03mUzFKDAyFw8dppWXR4Hn9p767NFRiPxm90KMXg78y0zWI
 aWl44brRhto+TasSnzwnux/8vNllvE/mMp70bAqMPhkg+ItmfW9kYnEOTPrCK9W9BIZX
 gll74G+nKlKM6XZHnbIUQpKou9OE2j2UNHdSEUrUxTCD8vDQfgXhxfW7tQjus8MeBqjZ
 3ZXofTrYINfrQdWwyaeI9mz7h/LJTMmI2rpGzXZL7Yd7xBXgFd7pQuh2sUwKrb2X7Tgp
 6S2A==
X-Gm-Message-State: ANoB5pnesAIoyH96wuoGId1fHpZwlSJsn8oaOmM6hvrxgyAldlZfpDQT
 LOQY9lTHOhVeRW7EEu5Hwf6EgJlphIcuFGyC+zs9m0PaLsxPsyNTdB8Kpil7T7nVwxQAljIn0rm
 N61uJPmD1C1xA7F8=
X-Received: by 2002:a67:ec92:0:b0:3ac:b383:b350 with SMTP id
 h18-20020a67ec92000000b003acb383b350mr2400072vsp.19.1670588322353; 
 Fri, 09 Dec 2022 04:18:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf78f8Ke5YQTc7p1fnZrUfmNSWFtcPYj8dRtHmAVsZWmT99+01IXkxn+prlE+ZKIVGHuk5wYSQ==
X-Received: by 2002:a67:ec92:0:b0:3ac:b383:b350 with SMTP id
 h18-20020a67ec92000000b003acb383b350mr2400050vsp.19.1670588321996; 
 Fri, 09 Dec 2022 04:18:41 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 bm25-20020a05620a199900b006feb158e5e7sm991866qkb.70.2022.12.09.04.18.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:18:41 -0800 (PST)
Message-ID: <51d4cb33-7ae9-8c5b-b2ae-b5c6b71b09a8@redhat.com>
Date: Fri, 9 Dec 2022 13:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
 <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
 <Y43roVjI2RrU1PXq@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <Y43roVjI2RrU1PXq@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.159 autolearn=no autolearn_force=no
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



Am 05/12/2022 um 14:01 schrieb Kevin Wolf:
> Am 02.12.2022 um 18:22 hat Paolo Bonzini geschrieben:
>> On 12/2/22 14:42, Emanuele Giuseppe Esposito wrote:
>>>
>>>
>>> Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
>>>> Changes to the BlockDriverState graph will have to take the
>>>> corresponding lock for writing, and therefore cannot be done
>>>> inside a coroutine.  Move them outside the test body.
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>   tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
>>>>   1 file changed, 46 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
>>>> index 6ae44116fe79..d85083dd4f9e 100644
>>>> --- a/tests/unit/test-bdrv-drain.c
>>>> +++ b/tests/unit/test-bdrv-drain.c
>>>> @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
>>>>       }
>>>>   }
>>>> +static BlockBackend *blk;
>>>> +static BlockDriverState *bs, *backing;
>>>> +
>>>> +static void test_drv_cb_init(void)
>>>> +{
>>>> +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
>>>> +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
>>>> +                              &error_abort);
>>>> +    blk_insert_bs(blk, bs, &error_abort);
>>>> +
>>>> +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
>>>> +    bdrv_set_backing_hd(bs, backing, &error_abort);
>>>> +}
>>>> +
>>>> +static void test_drv_cb_fini(void)
>>>
>>> fini stands for "finito"? :)
>>
>> No, for finish :)
>> http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html
>>
>>> Anyways, an alternative solution for this is also here (probably coming
>>> from you too):
>>> https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html
>>
>> Much better.  At least patches 7-8 from that series have to be salvaged,
>> possibly 10 as well.
> 
> I wonder if we need a more general solution for this because this test
> is not the only place that calls this kind of functions in a coroutine.
> The one I'm aware of in particular is all the .bdrv_co_create
> implementations, but I'm almost sure there are more.
> 
> Can we use a yield_to_drain()-like mechanism for these functions? Maybe
> even something like the opposite of co_wrapper, a no_co_wrapper that
> generates a foo_co() variant that drops out of coroutine context before
> calling foo()?
> 

I implemented something like yield_to_drain as you suggested, but when
thinking about it aren't we making a fix that will cost us even more
work in the future? If we use a yield_to_drain-like function, we are
doing something similar to g_c_w, and losing track of whether the caller
is a coroutine or not. And the function could then be used potentially
everywhere. Then we will realize "oh we need to get rid of this and
split the functions differentiating the coroutine context" and
eventually go through ALL the callers again to figure what is doing
what, and implement the same fix of this patch or my series once again.

Instead, even though this is just a test, we have a clear separation and
one less case to worry about in the future.

Thank you,
Emanuele


