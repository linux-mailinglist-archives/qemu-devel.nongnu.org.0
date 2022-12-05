Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0021642898
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:39:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Aiy-0000PH-BA; Mon, 05 Dec 2022 07:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2Ai3-0000Bv-RI
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1p2Ai1-0003c5-PL
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670243792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m55jO1n0h5bdiQG2WOxDb+OQHaGF4SWXZ2200kkQkMk=;
 b=VheQAPcEeYKOkqFQoPcxR77xn2vjRoTOBAQRU12dGZ0l6Ut5aRRF5pgU9oc8lMFKkHyhU7
 O45GSGWML8cHYlm1eR5yycgBkp6yoYjdyWNWW7L5mUEJEosa9cnmrnwHKcgOL3yp5WHHWL
 W2TqR6ydHpFmMAwzoZmPpTQqwwjOlls=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-CCHUHh6uOSu-hn41P9SuNg-1; Mon, 05 Dec 2022 07:36:31 -0500
X-MC-Unique: CCHUHh6uOSu-hn41P9SuNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 8-20020a05600c228800b003d0376e42deso4338229wmf.4
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 04:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m55jO1n0h5bdiQG2WOxDb+OQHaGF4SWXZ2200kkQkMk=;
 b=BWBBHZtKpZGAv/bPtblYlykxAZoxL4nh7TWYnas2FVJwQgutQlkP9Xg7KKRQ/UB5jl
 BVptN6WbSEGdsXb7+efpaStdE7rFrC4P15W934SjSOSTuN9U63i69FpndpdK5kcFAxHH
 mZtoUMMaxv61pBU6f6G2YgjjjSr39G8YKOL2rOIdmpG2KHo8N4QyK/8kkgVLL9oASKfK
 j/aLHHm4iA5/PF9BeYHHHO2QaDsYGTJGHWP2la/krlkcZ2FBVXFg86ZERLPoYOJy3AmC
 pdbGx8k7esfi2SPidXqWcQOw4KYbUiSmhTngBz1YLohZ+t94+/VcvcJf4k/9LySuOr6n
 BJfg==
X-Gm-Message-State: ANoB5pnbqS1FRX/gV+BdS8ou3KJLDqXowoU7kegYZXURQPd5hShcYe0A
 0zs+khufNLkrcb97lMwxCLjqLtTkSfua6d/4FqDX/S4AaQatryuLi3jor02v4j9RaouNCPjdans
 jcuDozVmGoXl7FRc=
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id
 bk20-20020a0560001d9400b002383d858e2cmr22474261wrb.650.1670243790335; 
 Mon, 05 Dec 2022 04:36:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tUYJC/p6PifF9lFH5XtlxT7TyEX+IwMNA4lesHxs0Wl2bnWgHzOlOWX0VapHbLlA+JaghDQ==
X-Received: by 2002:a05:6000:1d94:b0:238:3d85:8e2c with SMTP id
 bk20-20020a0560001d9400b002383d858e2cmr22474246wrb.650.1670243790082; 
 Mon, 05 Dec 2022 04:36:30 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 fn7-20020a05600c688700b003c6b70a4d69sm17313963wmb.42.2022.12.05.04.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 04:36:29 -0800 (PST)
Message-ID: <1020781a-ec96-a4e9-0d01-aa28b5f2a126@redhat.com>
Date: Mon, 5 Dec 2022 13:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
 <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.031 autolearn=ham autolearn_force=no
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



Am 02/12/2022 um 18:22 schrieb Paolo Bonzini:
> On 12/2/22 14:42, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
>>> Changes to the BlockDriverState graph will have to take the
>>> corresponding lock for writing, and therefore cannot be done
>>> inside a coroutine.  Move them outside the test body.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
>>>   1 file changed, 46 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
>>> index 6ae44116fe79..d85083dd4f9e 100644
>>> --- a/tests/unit/test-bdrv-drain.c
>>> +++ b/tests/unit/test-bdrv-drain.c
>>> @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum
>>> drain_type drain_type, BlockDriverState *
>>>       }
>>>   }
>>>   +static BlockBackend *blk;
>>> +static BlockDriverState *bs, *backing;
>>> +
>>> +static void test_drv_cb_init(void)
>>> +{
>>> +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
>>> +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
>>> +                              &error_abort);
>>> +    blk_insert_bs(blk, bs, &error_abort);
>>> +
>>> +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0,
>>> &error_abort);
>>> +    bdrv_set_backing_hd(bs, backing, &error_abort);
>>> +}
>>> +
>>> +static void test_drv_cb_fini(void)
>>
>> fini stands for "finito"? :)
> 
> No, for finish :)
> http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html

Cool :)
> 
>> Anyways, an alternative solution for this is also here (probably coming
>> from you too):
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html
> 
> Much better.  At least patches 7-8 from that series have to be salvaged,
> possibly 10 as well.

Serie sent:
https://patchew.org/QEMU/20221205121029.1089209-1-eesposit@redhat.com/

Yes theoretically also patch 9, but I think there's no need to respin
them. If someone is interested they are there.

Thank you,
Emanuele
> 
> Paolo
> 


