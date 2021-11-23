Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48D45A72B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:06:48 +0100 (CET)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYJj-0004wV-W5
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mpYIb-0003XE-Az; Tue, 23 Nov 2021 11:05:37 -0500
Received: from relay64.bu.edu ([128.197.228.104]:32871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mpYIY-0000EH-Jd; Tue, 23 Nov 2021 11:05:36 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1ANG4Kl8005639
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 23 Nov 2021 11:04:23 -0500
Date: Tue, 23 Nov 2021 11:04:20 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 2/2] tests/qtest/fdc-test: Add a regression test
 for CVE-2021-3507
Message-ID: <20211123160356.242bgy2mejvc4qxu@mozz.bu.edu>
References: <20211118115733.4038610-1-philmd@redhat.com>
 <20211118115733.4038610-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211118115733.4038610-3-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 211118 1257, Philippe Mathieu-Daudé wrote:
> Add the reproducer from https://gitlab.com/qemu-project/qemu/-/issues/339
> 
> Without the previous commit, when running 'make check-qtest-i386'
> with QEMU configured with '--enable-sanitizers' we get:
> 
>   ==4028352==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
>   READ of size 786432 at 0x619000062a00 thread T0
>       #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
>       #1 0x5626d1c023cc in flatview_write_continue softmmu/physmem.c:2787:13
>       #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
>       #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:18
>       #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
>       #5 0x5626d1bf14c8 in cpu_physical_memory_rw softmmu/physmem.c:2933:5
>       #6 0x5626d0bd5649 in cpu_physical_memory_write include/exec/cpu-common.h:82:5
>       #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
>       #8 0x5626d09f825d in fdctrl_transfer_handler hw/block/fdc.c:1616:13
>       #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:13
>       #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
>       #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
>       #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
> 
>   0x619000062a00 is located 0 bytes to the right of 512-byte region [0x619000062800,0x619000062a00)
>   allocated by thread T0 here:
>       #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
>       #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
>       #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
>       #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:20
>       #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
>       #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
> 
>   SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+0x1e65919) in __asan_memcpy
>   Shadow bytes around the buggy address:
>     0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   =>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
>     0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
>   Shadow byte legend (one shadow byte represents 8 application bytes):
>     Addressable:           00
>     Heap left redzone:       fa
>     Freed heap region:       fd
>   ==4028352==ABORTING
> 
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 26b69f7c5cd..f164d972d10 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -546,6 +546,25 @@ static void fuzz_registers(void)
>      }
>  }
>  
> +static void test_cve_2021_3507(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_initf("-nographic -m 32M -nodefaults "
> +                    "-drive file=%s,format=raw,if=floppy", test_image);

Does it make sense to run this with -snapshot ?

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

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
> +    qtest_quit(s);
> +}
> +
>  int main(int argc, char **argv)
>  {
>      int fd;
> @@ -576,6 +595,7 @@ int main(int argc, char **argv)
>      qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
>      qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
>      qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
> +    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
>  
>      ret = g_test_run();
>  
> -- 
> 2.31.1
> 

