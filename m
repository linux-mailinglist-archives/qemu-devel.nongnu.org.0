Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62D568FC0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:53:49 +0200 (CEST)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98Hc-0005GG-Op
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o98Fk-0002uz-QN
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o98Fh-000459-Ab
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657126308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIrzzQs5dsRszM27GtjindoD6PVyAf52uMecL1DroWg=;
 b=Mt5XoFwQ+0bxmauDT9kSzN8ssmmJT40DQVErSPekmp9aafZEusQEXZAF/00W6h4BQakGRV
 f5adzrnd4BRFXaVp86RQNoInKlydAOL03oVJEWssGaw7b/WR7DxxCq6ZBcpArYR5J5ZGPp
 qTcH0jmhhXPD1BAp8w6deeZHy0CHyYc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-a-0xSMvCO0OdKfaQYsAq-w-1; Wed, 06 Jul 2022 12:51:47 -0400
X-MC-Unique: a-0xSMvCO0OdKfaQYsAq-w-1
Received: by mail-wm1-f71.google.com with SMTP id
 be8-20020a05600c1e8800b003a069fe18ffso10574380wmb.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xIrzzQs5dsRszM27GtjindoD6PVyAf52uMecL1DroWg=;
 b=P9fRqiojAuQzEOxXULqq51X1UHCJlA3CBlQuCzlkusGaoYf2ccjWpzO6tBCnfklYCw
 +qSt3XWkfslKhVQjrD2Vi1fqRqcEmky7yfE8GfO09sH+7Xl3qUnGG6MzxVxNqmUAAZU2
 72bVFsmPv/mf4pNydxFhwZyw85ZQgBzaf4qfke7zWUu9phQ28BPzWZXSmVsuLB6n9alR
 Yckk9bszQCf9Cpp8P9yVRQJ4Wiy/Ou3GuU/7qK5VDsFxXWwHQiwl2J4DBc2cIcNtij/m
 UOiAq1PjPzHSx6JTVLYceZw7ZxBqLvw9bfzxzngRNdtZt5nIcHnu6Jx1Iwo3RGC8z9P4
 3ygQ==
X-Gm-Message-State: AJIora+CxRQG93cOr+Qo4mA9Vkj+xnR4z9ICYAtam04y7/qFuwOk6myG
 zlhPhwpj2pC4iF6Z69IQsHIrO1q3Bprv477hj7RqOqTa7i91rVXeffSEZUtWpyuncCPi62CiDnj
 lQbhCHZZWOETU2LM=
X-Received: by 2002:a05:600c:210a:b0:3a0:3be1:718f with SMTP id
 u10-20020a05600c210a00b003a03be1718fmr45307842wml.181.1657126305989; 
 Wed, 06 Jul 2022 09:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sux8lb+klL+5NpOk8l76nUbfh/4rC2L8fynR2g+f7nhkl1MX79Qx3my9bk/NQrTsL+6AkWHA==
X-Received: by 2002:a05:600c:210a:b0:3a0:3be1:718f with SMTP id
 u10-20020a05600c210a00b003a03be1718fmr45307819wml.181.1657126305689; 
 Wed, 06 Jul 2022 09:51:45 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003942a244f40sm23920231wmq.25.2022.07.06.09.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 09:51:45 -0700 (PDT)
Message-ID: <bde6f81b-af05-ce03-343c-3754ae8a1e4e@redhat.com>
Date: Wed, 6 Jul 2022 18:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] iotests: fix copy-before-write for macOS and FreeBSD
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, thuth@redhat.com,
 jsnow@redhat.com, richard.henderson@linaro.org
References: <20220705153708.186418-1-vsementsov@yandex-team.ru>
 <a5b27e74-a6a3-01b0-35bf-b8c58802d99a@redhat.com>
 <28788b2a-2144-17e9-b7b0-daf498bcbf49@yandex-team.ru>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <28788b2a-2144-17e9-b7b0-daf498bcbf49@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 06.07.22 16:46, Vladimir Sementsov-Ogievskiy wrote:
> On 7/6/22 13:26, Hanna Reitz wrote:
>> On 05.07.22 17:37, Vladimir Sementsov-Ogievskiy wrote:
>>> strerror() represents ETIMEDOUT a bit different in Linux and macOS /
>>> FreeBSD. Let's support the latter too.
>>>
>>> Fixes: 9d05a87b77 ("iotests: copy-before-write: add cases for 
>>> cbw-timeout option")
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>> ---
>>>
>>> As John and Thomas noted, the new iotests fails for FreeBSD and maxOS.
>>> Here is a fix. Would be great if someone can test it.
>>>
>>> I tried to push it by
>>>
>>>    git push --force  -o ci.variable="QEMU_CI=1"
>>>
>>> to my block branch, I get a blocked pipeline
>>> https://gitlab.com/vsementsov/qemu/-/pipelines/580573238
>>> but it doesn't have neither freebsd nor macos jobs.. How to get them?
>>>
>>>   tests/qemu-iotests/tests/copy-before-write | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/tests/qemu-iotests/tests/copy-before-write 
>>> b/tests/qemu-iotests/tests/copy-before-write
>>> index 16efebbf8f..56937b9dff 100755
>>> --- a/tests/qemu-iotests/tests/copy-before-write
>>> +++ b/tests/qemu-iotests/tests/copy-before-write
>>> @@ -192,6 +192,11 @@ read 1048576/1048576 bytes at offset 0
>>>       def test_timeout_break_guest(self):
>>>           log = self.do_cbw_timeout('break-guest-write')
>>> +        # macOS and FreeBSD tend to represent ETIMEDOUT as
>>> +        # "Operation timed out", when Linux prefer
>>> +        # "Connection timed out"
>>> +        log = log.replace('Operation timed out',
>>> +                          'Connection timed out')
>>
>> If we know for sure that it’s ETIMEDOUT, how about 
>> os.strerror(errno.ETIMEDOUT)?
>
> I've checked this with make vm-build-freebsd, but it doesn't work:
>
> --- 
> /home/qemu/qemu-test.fxwm16/src/tests/qemu-iotests/tests/copy-before-write.out
> +++ 
> /usr/home/qemu/qemu-test.fxwm16/build/tests/qemu-iotests/scratch/copy-before-write.out.bad
> @@ -1,5 +1,22 @@
> -....
> +..F.
> +======================================================================
> +FAIL: test_timeout_break_guest (__main__.TestCbwError)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File 
> "/usr/home/qemu/qemu-test.fxwm16/src/tests/qemu-iotests/tests/copy-before-write", 
> line 207, in test_timeout_break_guest
> +    """)
> +AssertionError: 'wrot[102 chars]led: Connection timed out\nread 
> 1048576/104857[73 chars]c)\n' != 'wrot[102 chars]led: Operation timed 
> out\nread 1048576/1048576[72 chars]c)\n'
> +  wrote 524288/524288 bytes at offset 0
> +  512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +- write failed: Connection timed out
> +?               ^^^^ ^
> ++ write failed: Operation timed out
> +?               ^^ ^^
> +  read 1048576/1048576 bytes at offset 0
> +  1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +
>  ----------------------------------------------------------------------
>  Ran 4 tests
>

:(

> Probably pythonic os.strerror doesn't correspond to what we have in C..

Great...

> So, let's just go with my fix.

Sounds good, then.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


