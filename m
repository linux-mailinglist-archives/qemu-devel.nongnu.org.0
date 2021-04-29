Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7238A36EC5F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:28:12 +0200 (CEST)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7eF-0006N6-2P
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc7dA-0005kh-SV
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc7d7-0003zC-0p
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619706419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bfUnFrvwytq/FEYaqveVws8k99f5Pe+HiHIuCBthoQ=;
 b=VwzJO7LADVUcCuTnTTFXumoGZ+ZndCTdwU0oS+9BaYVRxY2xaE0YmrAG5SAW1GrSBgGq7o
 7TbhgJ3PzFWcfwSyq7BB72HhrzNpav478T78z0zOT0vewOcEi0DCpZ99kbcLrkOtpQcgs0
 VSmVbQnRa8fASSFR/YP+iy/1AOdp8W4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-v-aKvn1tNAqyMVwycFdRMg-1; Thu, 29 Apr 2021 10:26:52 -0400
X-MC-Unique: v-aKvn1tNAqyMVwycFdRMg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b184-20020a1c1bc10000b029014174b9df34so1993337wmb.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9bfUnFrvwytq/FEYaqveVws8k99f5Pe+HiHIuCBthoQ=;
 b=Pm2BJxjG98r1DERdr2C6zDrfPYAcX3nUItL9E9ydyPE78pZoFY77MAN1JQgyOqaWJ5
 M1lkmdhRGQBVm5uKTI3UDa/wS2ZuNMgBfyLM4OuVRMcdf3a5Py4AGxjILpy3Ozih0KtM
 PwGM2FCuSzKuk9/eO9WknYpczKhfsQ3GV+hEwgdI2AyhSVb6aAhTiMayGyclwC/HALgj
 xbQQnLLozqXShkVRjxR7rFkWHHcuetuKEg0kn8dyEsXHrW4YbXxDb1oLVAY+poR0XHOG
 FJpMICeTJ/9TsqJBg3G/Mz6iy+klEK8O/AT2HF5TmnWBmNd/GV+kEZK8ygDZxyJ+Lztw
 9hVw==
X-Gm-Message-State: AOAM533UUDH1Ja1hw/QAf1cHy0IyGRKFto/J0ZguwbS1JYJa4tSpk71V
 2kkpLqKto0Fzvjv9xcXHkPPhnfUJ+37jP3o5PSt6Oivl2TO1L4ja2o6yhuFE8I34C7ayBMiVEHk
 buGrcbeDaneFAXxs=
X-Received: by 2002:adf:f506:: with SMTP id q6mr40369wro.65.1619706410998;
 Thu, 29 Apr 2021 07:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWuMh/G7b7ArK/6PG0y4UGAcu3QbpPOTye4wvtLKHYOUCZFF3aQlNGdeHGVvRBMXOyQhcqQA==
X-Received: by 2002:adf:f506:: with SMTP id q6mr40354wro.65.1619706410771;
 Thu, 29 Apr 2021 07:26:50 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f3sm441134wrp.7.2021.04.29.07.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 07:26:50 -0700 (PDT)
Subject: Re: [Bug 1926111] [NEW] Assertion `tx_queue_idx <= s->txq_num' failed
 in vmxnet3_io_bar0_write
To: Bug 1926111 <1926111@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <161940714680.11021.12941917748278413607.malonedeb@soybean.canonical.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc349ba7-e4ec-bdc5-46cb-eb1f0fca2316@redhat.com>
Date: Thu, 29 Apr 2021 16:26:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161940714680.11021.12941917748278413607.malonedeb@soybean.canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexander Bulekov <alxndr@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing maintainers.

./scripts/get_maintainer.pl -f hw/net/vmxnet3.c
Dmitry Fleytman <dmitry.fleytman@gmail.com> (maintainer:Vmware)
Jason Wang <jasowang@redhat.com> (odd fixer:Network devices)

On 4/26/21 5:19 AM, Alexander Bulekov wrote:
> Public bug reported:
> 
> === Stacktrace ===
> 
> qemu-fuzz-i386: ../hw/net/vmxnet3.c:1096: void vmxnet3_io_bar0_write(void *, hwaddr, uint64_t, unsigned int): Assertion `tx_queue_idx <= s->txq_num' failed.
> ==602353== ERROR: libFuzzer: deadly signal
> #5 0x7fe4b93a7ce0 in raise signal/../sysdeps/unix/sysv/linux/raise.c:48:3
> #6 0x7fe4b9391536 in abort stdlib/abort.c:79:7
> #7 0x7fe4b939140e in __assert_fail_base assert/assert.c:92:3
> #8 0x7fe4b93a0661 in __assert_fail assert/assert.c:101:3
> #9 0x563e6cf5ebb5 in vmxnet3_io_bar0_write  hw/net/vmxnet3.c:1096:9
> #10 0x563e6eefdb00 in memory_region_write_accessor  softmmu/memory.c:491:5
> #11 0x563e6eefcfdd in access_with_adjusted_size  softmmu/memory.c:552:18
> #12 0x563e6eefac90 in memory_region_dispatch_write  softmmu/memory.c:1502:16
> #13 0x563e6e834e16 in flatview_write_continue  softmmu/physmem.c:2746:23
> #14 0x563e6e81cd38 in flatview_write  softmmu/physmem.c:2786:14
> #15 0x563e6e81c868 in address_space_write  softmmu/physmem.c:2878:18
> 
> === Reproducer ===
> cat << EOF | ./qemu-system-i386  -display none -machine accel=qtest, -m \
> 512M -machine q35 -nodefaults -device vmxnet3,netdev=net0 -netdev \
> user,id=net0 -qtest stdio
> outl 0xcf8 0x80000810
> outl 0xcfc 0xe0000000
> outl 0xcf8 0x80000814
> outl 0xcf8 0x80000804
> outw 0xcfc 0x7
> outl 0xcf8 0x80000815
> outl 0xcfc 0xffff00b5
> write 0x0 0x1 0xe1
> write 0x1 0x1 0xfe
> write 0x2 0x1 0xbe
> write 0x3 0x1 0xba
> write 0xff00b020 0x4 0x0000feca
> write 0xe0000630 0x1 0x00
> EOF
> 
> 
> === Testcase ===
> 
> /*
>  * Autogenerated Fuzzer Test Case
>  *
>  * This work is licensed under the terms of the GNU GPL, version 2 or later.
>  * See the COPYING file in the top-level directory.
>  */
> 
> #include "qemu/osdep.h"
> 
> #include "libqos/libqtest.h"
> 
> static void test_fuzz(void) {
>     QTestState *s = qtest_init(" -display none , -m 512M -machine q35 -nodefaults "
>                                "-device vmxnet3,netdev=net0 -netdev user,id=net0");
>     qtest_outl(s, 0xcf8, 0x80000810);
>     qtest_outl(s, 0xcfc, 0xe0000000);
>     qtest_outl(s, 0xcf8, 0x80000814);
>     qtest_outl(s, 0xcf8, 0x80000804);
>     qtest_outw(s, 0xcfc, 0x7);
>     qtest_outl(s, 0xcf8, 0x80000815);
>     qtest_outl(s, 0xcfc, 0xffff00b5);
>     qtest_bufwrite(s, 0x0, "\xe1", 0x1);
>     qtest_bufwrite(s, 0x1, "\xfe", 0x1);
>     qtest_bufwrite(s, 0x2, "\xbe", 0x1);
>     qtest_bufwrite(s, 0x3, "\xba", 0x1);
>     qtest_bufwrite(s, 0xff00b020, "\x00\x00\xfe\xca", 0x4);
>     qtest_bufwrite(s, 0xe0000630, "\x00", 0x1);
>     qtest_quit(s);
> }
> int main(int argc, char **argv) {
>     const char *arch = qtest_get_arch();
> 
>     g_test_init(&argc, &argv, NULL);
> 
>     if (strcmp(arch, "i386") == 0) {
>         qtest_add_func("fuzz/test_fuzz", test_fuzz);
>     }
> 
>     return g_test_run();
> }
> 
> 
> === OSS-Fuzz Report ===
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=33603
> https://oss-fuzz.com/testcase?key=6071483232288768
> 
> ** Affects: qemu
>      Importance: Undecided
>          Status: New
> 
> 
> ** Tags: fuzzer
> 
> ** Tags removed: fuzz
> ** Tags added: fuzzer
> 


