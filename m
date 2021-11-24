Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC845C858
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 16:13:56 +0100 (CET)
Received: from localhost ([::1]:46666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpty7-0007x8-0G
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 10:13:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mptwN-0006bJ-Sm
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:12:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mptwL-0001zH-1t
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 10:12:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637766722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLdDtveI9zUcuV9/86yy5cGUi3a3Lt9edBs0RQYSy8A=;
 b=IRxfK7kFKkQv+PkYFI8SgfJI/c3CubTSqbA/DZUl8pkkVMX45v2drAy9ntO2TuNRbwx+WK
 7uyed47d6kSS29vkVhAv0flRIGpMbqqs3UYxllr9dE2ameB7/4XKVRs9aVJ7wyYWxWPpgT
 clbj9mANkWMfchiTE7laU67yIHKEcFw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-MgD07lZSO5y4_aL5nbQ7MQ-1; Wed, 24 Nov 2021 10:12:01 -0500
X-MC-Unique: MgD07lZSO5y4_aL5nbQ7MQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so1473615wmj.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 07:12:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rLdDtveI9zUcuV9/86yy5cGUi3a3Lt9edBs0RQYSy8A=;
 b=ZanadVjN6DD0r2Fe2qoO7Ltzkz5wPrsdHkn6WHEWIjTgIqtqdAumFUQdLsam8oJdZN
 8ar8bM9qoJ4pkRc+1ooEXUa6CO9W3+8bQGHurMPrM3M4kc7tfOfJO42X4vAbX8r2h8Iz
 A6xv69M7c2l+TJDpZF+tKfvV8RzHtSRS+KN4mIZQXoQ9XZKZoTGiD2m6qJdqN71mq3aZ
 4Kl6suvB8HSpB3sHfJEpbU52U3jUzcx3j4WrhJcVotUObkmGkRO0L/IZ0GUY2yaJ/vhz
 B1a1tQMHi904nooQviZNxvt6MMqVOc2/UoC2YXViEUmXZtw4I481zFE+UyITxyQUaaNY
 F8fg==
X-Gm-Message-State: AOAM530kW4OnlnE+/rkHlr5RvFqt6U0AH+/IA2kmcvwruvxbRsFJPkr2
 C3NRV5vwu6UhuAZirNQDeR9KWPOUDo9zL8LB/K4px5bK2DMsNdRtXlErnfw35QOk8akrA33mwPB
 lbezo7sQlx6dhIng=
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr20499005wry.101.1637766720288; 
 Wed, 24 Nov 2021 07:12:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy612j7fFGWLUoxvV8UShmv3XzuXP+fTdnXpiToAoXm4Nhh5jQSf8UbC6F1jqQRUReEQeOmkg==
X-Received: by 2002:a05:6000:15c8:: with SMTP id
 y8mr20498930wry.101.1637766719874; 
 Wed, 24 Nov 2021 07:11:59 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a10sm5334704wmq.27.2021.11.24.07.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 07:11:59 -0800 (PST)
Message-ID: <a343645a-3cd6-3d95-5d4d-b8a04d566326@redhat.com>
Date: Wed, 24 Nov 2021 16:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 v3 2/2] tests/qtest/fdc-test: Add a regression
 test for CVE-2021-20196
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-3-philmd@redhat.com>
 <1cca5391-18e9-8e29-9c8b-0d44010cdecd@redhat.com>
 <e4e69416-35f4-c9d7-1628-a9e45c64b4c6@redhat.com>
 <fa59fbf0-2b2c-a336-4cc0-7b08fe81cd00@redhat.com>
 <464fbe60-4b22-86bc-902c-ac003d22803a@redhat.com>
 <e6dad060-48eb-e188-4c68-e83865072e90@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e6dad060-48eb-e188-4c68-e83865072e90@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 15:00, Hanna Reitz wrote:
> On 24.11.21 13:50, Philippe Mathieu-Daudé wrote:
>> On 11/23/21 15:14, Hanna Reitz wrote:
>>> On 23.11.21 14:49, Philippe Mathieu-Daudé wrote:
>>>> On 11/23/21 14:42, Hanna Reitz wrote:
>>>>> On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
>>>>>> From: Alexander Bulekov <alxndr@bu.edu>
>>>>>>
>>>>>> Without the previous commit, when running 'make check-qtest-i386'
>>>>>> with QEMU configured with '--enable-sanitizers' we get:
>>>>>>
>>>>>>      AddressSanitizer:DEADLYSIGNAL
>>>>>>     
>>>>>> =================================================================
>>>>>>      ==287878==ERROR: AddressSanitizer: SEGV on unknown address
>>>>>> 0x000000000344
>>>>>>      ==287878==The signal is caused by a WRITE memory access.
>>>>>>      ==287878==Hint: address points to the zero page.
>>>>>>          #0 0x564b2e5bac27 in blk_inc_in_flight
>>>>>> block/block-backend.c:1346:5
>>>>>>          #1 0x564b2e5bb228 in blk_pwritev_part
>>>>>> block/block-backend.c:1317:5
>>>>>>          #2 0x564b2e5bcd57 in blk_pwrite
>>>>>> block/block-backend.c:1498:11
>>>>>>          #3 0x564b2ca1cdd3 in fdctrl_write_data
>>>>>> hw/block/fdc.c:2221:17
>>>>>>          #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
>>>>>>          #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
>>>>>>
>>>>>> Add the reproducer for CVE-2021-20196.
>>>>>>
>>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>>> Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
>>>>>> [PMD: Rebased, use global test_image]
>>>>>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>> ---
>>>>>>     tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
>>>>>>     1 file changed, 21 insertions(+)
>>>>> Not sure if I’m doing something wrong, but:
>>>>>
>>>>> Using the global test_image brings a problem, namely that this test
>>>>> fails unconditionally (for me at least...?), with the reason being
>>>>> that
>>>>> the global QEMU instance (launched by qtest_start(), quit by
>>>>> qtest_end()) still has that image open, so by launching a second
>>>>> instance concurrently, I get this:
>>>>>
>>>>> qemu-system-x86_64: Failed to get "write" lock
>>>>> Is another process using the image [/tmp/qtest.xV4IxX]?
>>>> Hmm I had too many odd problems running qtests in parallel so I
>>>> switched to 'make check-qtest -j1' more than 1 year ago, which
>>>> is probably why I haven't noticed that issue.
>>> I’ve run the test with
>>>
>>> QTEST_QEMU_BINARY=$PWD/qemu-system-x86_64 tests/qtest/fdc-test
>>>
>>> so there definitely weren’t any other tests running at the same time.  I
>>> don’t know why you don’t encounter this problem, but it’s caused by the
>>> concurrent QEMU instance launched in the very same test (qtest_start()
>>> in main(), and cleaned up by qtest_end() after g_test_run()).
>> I run all my qtests on top of this patch, otherwise I can't
>> get any coredump:
>> https://lore.kernel.org/qemu-devel/20200707031920.17428-1-f4bug@amsat.org/
>>
>> But I don't think it mattered here...
> 
> I can give that a try, but since I use coredumpctl, I generally don’t
> have a problem with one coredump overwriting another (only that I need
> to give a PID to `coredumpctl gdb` to load not the latest coredump (the
> qtest) but the one before (qemu)).

I'm not a Fedora expert and use the default, for some reason only the
last coredump is available (which in this case is tests/qtest/fdc-test,
not useful at all).

> Hm, perhaps the problem is that I never applied the other series before
> this one.  Also one thing that remains to be tested...

Don't waste time now, wait for v4 ;)


