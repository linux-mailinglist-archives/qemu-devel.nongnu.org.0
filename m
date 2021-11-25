Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11BD45D9A9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 12:59:58 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDPx-0003l4-9o
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 06:59:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqDNj-0002gO-3l
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 06:57:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqDNh-0007u7-Ia
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 06:57:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637841456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iE6hK1jYtROmVu8CDrFG/B/8sv8e2Q2HIPbTudj3CHc=;
 b=FNpdy4apDCrO0EHzs5PioX8Z0ObaYzjQ99/kK76NQ9ke2uk9nQB6IG4lK79Iq4vB8cgoMI
 ZGJ9Pp47D8CtBRit3HQieE2P3WlS0V2L7Y2mkDJsEAgcIzOYnwpIgZc1qQIAC5CSpkDs1S
 DM1dVjJZBsjeKEhYagy4/eR0FFkr/VA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-u1a8GJ2gOT-kM1JsEvOQXA-1; Thu, 25 Nov 2021 06:57:33 -0500
X-MC-Unique: u1a8GJ2gOT-kM1JsEvOQXA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so3107276wme.6
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 03:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iE6hK1jYtROmVu8CDrFG/B/8sv8e2Q2HIPbTudj3CHc=;
 b=pWh8m61zRCc7FW3CpGMxMdXgI68XINJKXIpUEhWKt4zoKO2C4p7Wubqkd95q/dyi7p
 131SODXK7B9eTZMKdRDSvuJOELDI9wV0iZ9lu+6y9vqV/fihb8FKSRh0yr4eHdhsE9+S
 YcL4TYWhuiJKWZlLp5vkLarez+HgfyHWa23ubeH19a/vV5QYW7sGl6YL7NkXxjZRW1d2
 /HzumOpTmBGDIE7/7xALKpFYHuokv0ZjuegC5/2WMy2/IKCCP1bQBiDDsHTlG2YDi72r
 zsHmUU5T3FrEPf3DyUyoAEu/Fo63//xzYtsB1frWc5v2DiM/CdBAPDm665HIAcNIEXzr
 kmJg==
X-Gm-Message-State: AOAM532eT6jISKox57KWZXM22pNMdoE8nitJ1G9xliLZ55g4HJh+A1oX
 4uEHSCtWYj8z+pRLhUH9sWzwRxXoV5oC431ym9aome2rRaZ30o7o89Vi7gozG/mMl5R69wq/Lez
 zoQ/pzWqBXjRrr0c=
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr6444642wmk.152.1637841451805; 
 Thu, 25 Nov 2021 03:57:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZj8Atu6MR6G9hFFygOjsVGvzfH15Sw+91m3W2RAEdpqu3rVtdQwMmaO2f7B8bR07mjlpewQ==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr6444604wmk.152.1637841451580; 
 Thu, 25 Nov 2021 03:57:31 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id r11sm2602025wrw.5.2021.11.25.03.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 03:57:31 -0800 (PST)
Message-ID: <ba0a545d-4877-20f9-e5fb-39d730bf8c90@redhat.com>
Date: Thu, 25 Nov 2021 12:57:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/3] tests/qtest/fdc-test: Add a regression test for
 CVE-2021-20196
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124161536.631563-1-philmd@redhat.com>
 <20211124161536.631563-4-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124161536.631563-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24.11.21 17:15, Philippe Mathieu-Daudé wrote:
> Without the previous commit, when running 'make check-qtest-i386'
> with QEMU configured with '--enable-sanitizers' we get:
>
>    AddressSanitizer:DEADLYSIGNAL
>    =================================================================
>    ==287878==ERROR: AddressSanitizer: SEGV on unknown address 0x000000000344
>    ==287878==The signal is caused by a WRITE memory access.
>    ==287878==Hint: address points to the zero page.
>        #0 0x564b2e5bac27 in blk_inc_in_flight block/block-backend.c:1346:5
>        #1 0x564b2e5bb228 in blk_pwritev_part block/block-backend.c:1317:5
>        #2 0x564b2e5bcd57 in blk_pwrite block/block-backend.c:1498:11
>        #3 0x564b2ca1cdd3 in fdctrl_write_data hw/block/fdc.c:2221:17
>        #4 0x564b2ca1b2f7 in fdctrl_write hw/block/fdc.c:829:9
>        #5 0x564b2dc49503 in portio_write softmmu/ioport.c:201:9
>
> Add the reproducer for CVE-2021-20196.
>
> Suggested-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 26b69f7c5cd..8f6eee84a47 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -32,6 +32,9 @@
>   /* TODO actually test the results and get rid of this */
>   #define qmp_discard_response(...) qobject_unref(qmp(__VA_ARGS__))
>   
> +#define DRIVE_FLOPPY_BLANK \
> +    "-drive if=floppy,file=null-co://,file.read-zeroes=on,format=raw,size=1440k"
> +
>   #define TEST_IMAGE_SIZE 1440 * 1024
>   
>   #define FLOPPY_BASE 0x3f0
> @@ -546,6 +549,40 @@ static void fuzz_registers(void)
>       }
>   }
>   
> +static bool qtest_check_clang_sanitizer(void)
> +{
> +#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
> +    return true;
> +#else
> +    g_test_skip("QEMU not configured using --enable-sanitizers");
> +    return false;
> +#endif
> +}
> +static void test_cve_2021_20196(void)
> +{
> +    QTestState *s;
> +
> +    if (!qtest_check_clang_sanitizer()) {
> +        return;
> +    }
> +
> +    s = qtest_initf("-nographic -m 32M -nodefaults " DRIVE_FLOPPY_BLANK);
> +
> +    qtest_outw(s, 0x3f4, 0x0500);
> +    qtest_outb(s, 0x3f5, 0x00);
> +    qtest_outb(s, 0x3f5, 0x00);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outb(s, 0x3f5, 0x00);
> +    qtest_outw(s, 0x3f1, 0x0400);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outb(s, 0x3f5, 0x00);
> +    qtest_outb(s, 0x3f5, 0x01);
> +    qtest_outw(s, 0x3f1, 0x0500);
> +    qtest_outb(s, 0x3f5, 0x00);
> +    qtest_quit(s);
> +}
> +

Now this works as a reproducer for me, but... this is a completely 
different I/O sequence now, right?

Can’t complain, though, I didn’t understand the previous one, I can’t 
claim I need to understand this one or why they’re different.

All the rest looks good to me, so all in all:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


