Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96945C632
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:03:01 +0100 (CET)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsrU-0007Ed-VP
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpspF-0004Qs-Nh
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:00:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpspC-0001ZU-H2
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637762436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNh7pF0IWQqR8NGvbxWFHZ7EEKbhUo0IABnKL/4xTDU=;
 b=BOupxxaw9wJeK77R0c/XRolyNAzWOHWAsT0vdIWeP9LsoUfigv1sItFaefHxehI/uQY9o0
 uoBFfZOeAkpH3ROYY4DKskXEug6kyt2sSDXttr50vbAZAB7ih5xH2eLLVEQgEoTbwG1OTF
 nIjLfMVJWfevag3IbZcNvkIuajV04zw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-VeKLF4f3MTKpML9uI86Vbg-1; Wed, 24 Nov 2021 09:00:34 -0500
X-MC-Unique: VeKLF4f3MTKpML9uI86Vbg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so513362wro.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 06:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cNh7pF0IWQqR8NGvbxWFHZ7EEKbhUo0IABnKL/4xTDU=;
 b=rx8jodRAfhfFtujb/NvHjvg72ZrbU8f3mZCztQTL/aK8MXMxqHfBH0ifbzx2kvEXGV
 srzjZFgJHge8QpLN4f4qQ+zo+CiJrlSuR07OENkwPaa5/ogRaDvs7cQkXfQD3YDfWCSq
 0EGTytAm3GtQglGYfArqNCY/cdivA/W4QFUl8xZFpUGJeq3MeaV6Y+9QclYqEPePECHc
 Fe+hPaBC7QnsxeINLVuyAtMPNLlahRgR+NbnJ/nn5JdTZUKc7xn5ekE45rMee2DX7cuh
 rNKE6h+1A2v9vLzyCSm2HKmabyuMrBdgxzsg4Dcu9KJvGhvHYEL7ZdLBNM2rdsostH+y
 9gaA==
X-Gm-Message-State: AOAM532y5N6CdiPa4hqQYkx40RbdrVvSfcrfQef5rea5Vt7zbPv0RHMj
 /2qOq+mGyBpClQCXvA7qA/0RxDzJlY6VcUvshmJV7aqmgGBMsFWHvZztJ1TPyeBDwZxC2MDgQeq
 FXjQ8HQcTYnpNM+g=
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr15751730wmc.187.1637762433567; 
 Wed, 24 Nov 2021 06:00:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYitFt0/k/7ivZMnncQ1Adpu2KL9ePQiVV+JcW0oecf58KUqqDfy8UMWD3PG+w+AU78v51Mw==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr15751660wmc.187.1637762433273; 
 Wed, 24 Nov 2021 06:00:33 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id s24sm4443172wmj.26.2021.11.24.06.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 06:00:32 -0800 (PST)
Message-ID: <e6dad060-48eb-e188-4c68-e83865072e90@redhat.com>
Date: Wed, 24 Nov 2021 15:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 v3 2/2] tests/qtest/fdc-test: Add a regression
 test for CVE-2021-20196
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118120635.4043197-1-philmd@redhat.com>
 <20211118120635.4043197-3-philmd@redhat.com>
 <1cca5391-18e9-8e29-9c8b-0d44010cdecd@redhat.com>
 <e4e69416-35f4-c9d7-1628-a9e45c64b4c6@redhat.com>
 <fa59fbf0-2b2c-a336-4cc0-7b08fe81cd00@redhat.com>
 <464fbe60-4b22-86bc-902c-ac003d22803a@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <464fbe60-4b22-86bc-902c-ac003d22803a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
 qemu-block@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 13:50, Philippe Mathieu-Daudé wrote:
> On 11/23/21 15:14, Hanna Reitz wrote:
>> On 23.11.21 14:49, Philippe Mathieu-Daudé wrote:
>>> On 11/23/21 14:42, Hanna Reitz wrote:
>>>> On 18.11.21 13:06, Philippe Mathieu-Daudé wrote:
>>>>> From: Alexander Bulekov <alxndr@bu.edu>
>>>>>
>>>>> Without the previous commit, when running 'make check-qtest-i386'
>>>>> with QEMU configured with '--enable-sanitizers' we get:
>>>>>
>>>>>      AddressSanitizer:DEADLYSIGNAL
>>>>>      =================================================================
>>>>>      ==287878==ERROR: AddressSanitizer: SEGV on unknown address
>>>>> 0x000000000344
>>>>>      ==287878==The signal is caused by a WRITE memory access.
>>>>>      ==287878==Hint: address points to the zero page.
>>>>>          #0 0x564b2e5bac27 in blk_inc_in_flight
>>>>> block/block-backend.c:1346:5
>>>>>          #1 0x564b2e5bb228 in blk_pwritev_part
>>>>> block/block-backend.c:1317:5
>>>>>          #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
>>>>>          #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
>>>>>          #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
>>>>>          #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
>>>>>
>>>>> Add the reproducer for CVE-2021-20196.
>>>>>
>>>>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>>>>> Message-Id: <20210319050906.14875-2-alxndr@bu.edu>
>>>>> [PMD: Rebased, use global test_image]
>>>>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>     tests/qtest/fdc-test.c | 21 +++++++++++++++++++++
>>>>>     1 file changed, 21 insertions(+)
>>>> Not sure if I’m doing something wrong, but:
>>>>
>>>> Using the global test_image brings a problem, namely that this test
>>>> fails unconditionally (for me at least...?), with the reason being that
>>>> the global QEMU instance (launched by qtest_start(), quit by
>>>> qtest_end()) still has that image open, so by launching a second
>>>> instance concurrently, I get this:
>>>>
>>>> qemu-system-x86_64: Failed to get "write" lock
>>>> Is another process using the image [/tmp/qtest.xV4IxX]?
>>> Hmm I had too many odd problems running qtests in parallel so I
>>> switched to 'make check-qtest -j1' more than 1 year ago, which
>>> is probably why I haven't noticed that issue.
>> I’ve run the test with
>>
>> QTEST_QEMU_BINARY=$PWD/qemu-system-x86_64 tests/qtest/fdc-test
>>
>> so there definitely weren’t any other tests running at the same time.  I
>> don’t know why you don’t encounter this problem, but it’s caused by the
>> concurrent QEMU instance launched in the very same test (qtest_start()
>> in main(), and cleaned up by qtest_end() after g_test_run()).
> I run all my qtests on top of this patch, otherwise I can't
> get any coredump:
> https://lore.kernel.org/qemu-devel/20200707031920.17428-1-f4bug@amsat.org/
> But I don't think it mattered here...

I can give that a try, but since I use coredumpctl, I generally don’t 
have a problem with one coredump overwriting another (only that I need 
to give a PID to `coredumpctl gdb` to load not the latest coredump (the 
qtest) but the one before (qemu)).

Hm, perhaps the problem is that I never applied the other series before 
this one.  Also one thing that remains to be tested...

Hanna


