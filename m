Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93045A73A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:10:45 +0100 (CET)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYNY-0001Tk-2b
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYLC-0007jU-3g
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpYL9-0000Vd-Hu
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637683695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4ywWOcEdVmi7y/nVuZ2D/rY9fOrJDgbUztkd6x/Ets=;
 b=AufkEJ+2wNKYS6maVmys161fcWhooFlH0xVqvlRLBuTRdbTbBbXEU8EgVMu7CNhbxjMhSg
 HiNvUG8Q0h8S0Hpeqi5N9sKZsTOBDGvSw10avQUGROTHNzMGeF3zhIrSvOd8unNh4eZsvv
 65Z9+e5hDk698REC++P75V66h2Vu3kQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-Q8QWLjnmP0KtsPH1H2JdQw-1; Tue, 23 Nov 2021 11:08:13 -0500
X-MC-Unique: Q8QWLjnmP0KtsPH1H2JdQw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso1771897wmb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 08:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b4ywWOcEdVmi7y/nVuZ2D/rY9fOrJDgbUztkd6x/Ets=;
 b=Py0hU2OiZRaZXW37N+H64Hf2CE3ihZumjjGSljd8Fy7S5oIuW/I8s0+ieaUsUEcxko
 2uhI4z0j0TcYVZUT53e0UUFqeyK9agafQrvxnp3vMSDFXHhpdaLKdi3gXYXMM5lPYSix
 3VsjI8iZi5WWhMMYtmhxqt4hgldPzG6q0d+Tp+rC6YJQbPZPdxFwJsJaGQHQLpzdMUOQ
 sSXdyghJuwtMXQJn7rJG9+y6KS2bq1LbXOv4BvEQ0ON+u/xn2DBza1XNtHqZPf6ffryz
 xvIdFQpuAvaXimaZJofd0Z8kLiX5pDz/0dH2cM99oIiL9/AJyS8iQ8NFye2H8Mt2r3KH
 QfgA==
X-Gm-Message-State: AOAM530AJsbSgCu8ChZDXkCYbks2ryNxUsWmy9b1ITx1Qh83yaEIV+Gw
 GGSZY4vRqFf9y6I/V/Kp0cN6Ynem5hc7bMaxzFG7r6RYH7kKYutmPE0ss6trom6pP8OZobhZJQp
 7FvGieFvWf6cuE7s=
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr4577964wmc.42.1637683689657; 
 Tue, 23 Nov 2021 08:08:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwU1gBiL01dR16KY3ojKE8L937UBjV77ZCBmqOnTyoqOgjjmRW7MfU+r8PflFcashQ/8vwPcA==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr4577573wmc.42.1637683687070; 
 Tue, 23 Nov 2021 08:08:07 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y142sm1571389wmc.40.2021.11.23.08.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 08:08:06 -0800 (PST)
Message-ID: <bb1c8fac-544f-bd5f-ed41-2b40439276a8@redhat.com>
Date: Tue, 23 Nov 2021 17:08:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 2/2] tests/qtest/fdc-test: Add a regression test
 for CVE-2021-3507
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <20211118115733.4038610-3-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118115733.4038610-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 12:57, Philippe Mathieu-Daudé wrote:
> Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/339
>
> Without the previous commit, when running 'make check-qtest-i386'
> with QEMU configured with '--enable-sanitizers' we get:
>
>    ==4028352==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
>    READ of size 786432 at 0x619000062a00 thread T0
>        #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
>        #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:2787:13
>        #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
>        #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
>        #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
>        #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933:5
>        #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-common.h:82:5
>        #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
>        #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:13
>        #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
>        #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
>        #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
>        #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
>
>    0x619000062a00 is located 0 bytes to the right of 512-byte region [0x619000062800,0x619000062a00)
>    allocated by thread T0 here:
>        #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
>        #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
>        #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
>        #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
>        #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
>        #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
>
>    SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e65919) in __asan_memcpy
>    Shadow bytes around the buggy address:
>      0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>      0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>    =>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>      0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>    Shadow byte legend (one shadow byte represents 8 application bytes):
>      Addressable:           00
>      Heap left redzone:       fa
>      Freed heap region:       fd
>    ==4028352==ABORTING
>
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 26b69f7c5cd..f164d972d10 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -546,6 +546,25 @@ static void fuzz_registers(void)
>       }
>   }
>   
> +static void test_cve_2021_3507(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_initf("-nographic -m 32M -nodefaults "
> +                    "-drive file=%s,format=raw,if=floppy", test_image);
> +    qtest_outl(s, 0x9, 0x0a0206);
> +    qtest_outw(s, 0x3f4, 0x1600);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0200);
> +    qtest_outw(s, 0x3f4, 0x0200);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0000);
> +    qtest_outw(s, 0x3f4, 0x0000);

No idea what this does (looks like a 256-byte sector read read from 
sector 2 with EOT=0), but hits the problem and reproduces for me.

Unfortunately, I have the exact same problem with test_image as I did in 
the other series.

Hanna

> +    qtest_quit(s);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       int fd;
> @@ -576,6 +595,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
>       qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
>       qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
> +    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
>   
>       ret = g_test_run();
>   


