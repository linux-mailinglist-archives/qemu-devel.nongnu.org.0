Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEEA45D9F1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:21:53 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDl9-0000rP-QL
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqDjf-0008Ma-Et
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqDjb-0007Qr-8Q
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637842813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UVwUYb9wNxxrlhooMrzfr0j2CvEoL6yCjIrMhBtOws=;
 b=MzM8L1WbOVQQgVTX2Tjb1WFJmAh6y4zUn03/U8oPiT0L7SiwxS6bu7ULE0u9hXV/TTXPWs
 70C3+MSaVL0BxxON9TpCX/WnFP6QHhvY+BDrO/S7EgkFreE6rW+Ykm7yZgBg8nlpHwz+i0
 f9MaKRGpimBJWFqztGTxQHq7J+fmEoM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-F96vxSDWNFuTXS-mhjAjWw-1; Thu, 25 Nov 2021 07:20:11 -0500
X-MC-Unique: F96vxSDWNFuTXS-mhjAjWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso4866414wma.6
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 04:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4UVwUYb9wNxxrlhooMrzfr0j2CvEoL6yCjIrMhBtOws=;
 b=XrZh2bMtfy9jgE5GVbWabzAI1zJcXFSEymv7urPsMXCDJS/qv+Vpv3sll0cr7pUTLp
 BfHzhnu2/UqgAhphaAvML2GpJmi0M9TSrxDO9+H5ULW/T70h+ApDJUATr4Mv7oVCOuS9
 n995BnlwAkaqZ8xpgfFggV5LbAjnVn+nKPW6ix2H1B8e834m30McWGe++gDO4vKxNdUF
 PKkm6Zf/PWtSpUpv90Wg2D03bEYU9iigZ+pU94IDL6URkxbiqzKCgHFutDVZd3SBNxzo
 rQsDoG2LGhThUoXY1AqLjXJ3S3sRfzMBmhBT/6aA5DB/nFBMd9QcG9A4Iv2Vqux8hjj2
 azjQ==
X-Gm-Message-State: AOAM5333UQJMkVA7DCKqc5xQlRVbEmWIIsQWoV8xl3zB8gLm7f6/NGDQ
 1F13n60HaEqy9vCsFBtl8UP9H5KuwQ7S94cZIaZVfJ3Y4/4R4oKs1SJj25iDkyY9TxF5ImgbrK3
 533Ow4cmT5Wti3uE=
X-Received: by 2002:a5d:680b:: with SMTP id w11mr5881056wru.345.1637842810611; 
 Thu, 25 Nov 2021 04:20:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxX9XSn7G/PZiQ2prIoWiBRwGo4Rz5z1f3/TgLIBDAqZJHMZbaAJeyeT2bfnMDc2czj9XXgfg==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr5881000wru.345.1637842810218; 
 Thu, 25 Nov 2021 04:20:10 -0800 (PST)
Received: from [192.168.1.36] (217.red-83-50-76.dynamicip.rima-tde.net.
 [83.50.76.217])
 by smtp.gmail.com with ESMTPSA id p13sm7749407wmi.0.2021.11.25.04.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 04:20:09 -0800 (PST)
Message-ID: <c4eb4ef2-15ab-e6cd-1251-0f461ac9a3d1@redhat.com>
Date: Thu, 25 Nov 2021 13:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/3] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-20196
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20211124161536.631563-1-philmd@redhat.com>
 <20211124161536.631563-4-philmd@redhat.com>
 <ba0a545d-4877-20f9-e5fb-39d730bf8c90@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <ba0a545d-4877-20f9-e5fb-39d730bf8c90@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 12:57, Hanna Reitz wrote:
> On 24.11.21 17:15, Philippe Mathieu-Daudé wrote:
>> Without the previous commit, when running 'make check-qtest-i386'
>> with QEMU configured with '--enable-sanitizers' we get:
>>
>>    AddressSanitizer:DEADLYSIGNAL
>>    =================================================================
>>    ==287878==ERROR: AddressSanitizer: SEGV on unknown address
>> 0x000000000344
>>    ==287878==The signal is caused by a WRITE memory access.
>>    ==287878==Hint: address points to the zero page.
>>        #0 0x564b2e5bac27 in blk_inc_in_flight
>> block/block-backend.c:1346:5
>>        #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
>>        #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
>>        #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
>>        #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
>>        #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
>>
>> Add the reproducer for CVE-2021-20196.
>>
>> Suggested-by: Alexander Bulekov <alxndr@bu.edu>
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
>> index 26b69f7c5cd..8f6eee84a47 100644
>> --- a/tests/qtest/fdc-test.c
>> +++ b/tests/qtest/fdc-test.c
>> @@ -32,6 +32,9 @@
>>   /* TODO actually test the results and get rid of this */
>>   #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
>>   +#define DRIVE_FLOPPY_BLANK \
>> +    "-drive
>> if=floppy,file=null-co://,file.read-zeroes=on,format=raw,size=1440k"
>> +
>>   #define TEST_IMAGE_SIZE 1440 * 1024
>>     #define FLOPPY_BASE 0x3f0
>> @@ -546,6 +549,40 @@ static void fuzz_registers(void)
>>       }
>>   }
>>   +static bool qtest_check_clang_sanitizer(void)
>> +{
>> +#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
>> +    return true;
>> +#else
>> +    g_test_skip("QEMU not configured using --enable-sanitizers");
>> +    return false;
>> +#endif
>> +}
>> +static void test_cve_2021_20196(void)
>> +{
>> +    QTestState *s;
>> +
>> +    if (!qtest_check_clang_sanitizer()) {
>> +        return;
>> +    }
>> +
>> +    s = qtest_initf("-nographic -m 32M -nodefaults "
>> DRIVE_FLOPPY_BLANK);
>> +
>> +    qtest_outw(s, 0x3f4, 0x0500);
>> +    qtest_outb(s, 0x3f5, 0x00);
>> +    qtest_outb(s, 0x3f5, 0x00);
>> +    qtest_outw(s, 0x3f4, 0x0000);
>> +    qtest_outb(s, 0x3f5, 0x00);
>> +    qtest_outw(s, 0x3f1, 0x0400);
>> +    qtest_outw(s, 0x3f4, 0x0000);
>> +    qtest_outw(s, 0x3f4, 0x0000);
>> +    qtest_outb(s, 0x3f5, 0x00);
>> +    qtest_outb(s, 0x3f5, 0x01);
>> +    qtest_outw(s, 0x3f1, 0x0500);
>> +    qtest_outb(s, 0x3f5, 0x00);
>> +    qtest_quit(s);
>> +}
>> +
> 
> Now this works as a reproducer for me, but... this is a completely
> different I/O sequence now, right?

The patch Alexander sent [*] was indeed not working, but I could
manually reproduce, then I figure while the commit *description*
was working, the patch *content* was not accurate. This patch uses
the commit description.

[1] https://www.mail-archive.com/qemu-block@nongnu.org/msg82825.html

> Can’t complain, though, I didn’t understand the previous one, I can’t
> claim I need to understand this one or why they’re different.

Same here =)

> All the rest looks good to me, so all in all:
> 
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>

Thank you!


