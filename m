Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0163933F65E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:14:35 +0100 (CET)
Received: from localhost ([::1]:52334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZkf-0001QD-Pj
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lMZ8C-0002CH-SW; Wed, 17 Mar 2021 12:34:48 -0400
Received: from relay64.bu.edu ([128.197.228.104]:44045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lMZ8A-0005BC-9K; Wed, 17 Mar 2021 12:34:48 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 12HGXZt1029350
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Mar 2021 12:33:38 -0400
Date: Wed, 17 Mar 2021 12:33:35 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v6 6/7] net/eth: Read ip6_ext_hdr_routing buffer before
 accessing it
Message-ID: <20210317163335.twgoqhlsdwlmjdhj@mozz.bu.edu>
References: <20210310183123.1212612-1-philmd@redhat.com>
 <20210310183123.1212612-7-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310183123.1212612-7-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just noticed that I also reported this to QEMU-Security on 2020-05-17.
The problem was acknowledged, but I don't think there was any
communication after that, so I'm not sure whether this is also stuck in
some private issue tracker. Seems pretty tame as far as
memory-corrputions go, but I'll send a followup to the private report,
to see if it went anywhere..
-Alex

On 210310 1931, Philippe Mathieu-Daudé wrote:
> We can't know the caller read enough data in the memory pointed
> by ext_hdr to cast it as a ip6_ext_hdr_routing.
> Declare rt_hdr on the stack and fill it again from the iovec.
> 
> Since we already checked there is enough data in the iovec buffer,
> simply add an assert() call to consume the bytes_read variable.
> 
> This fix a 2 bytes buffer overrun in eth_parse_ipv6_hdr() reported
> by QEMU fuzzer:
> 
>   $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>     -accel qtest -monitor none \
>     -serial none -nographic -qtest stdio
>   outl 0xcf8 0x80001010
>   outl 0xcfc 0xe1020000
>   outl 0xcf8 0x80001004
>   outw 0xcfc 0x7
>   write 0x25 0x1 0x86
>   write 0x26 0x1 0xdd
>   write 0x4f 0x1 0x2b
>   write 0xe1020030 0x4 0x190002e1
>   write 0xe102003a 0x2 0x0807
>   write 0xe1020048 0x4 0x12077cdd
>   write 0xe1020400 0x4 0xba077cdd
>   write 0xe1020420 0x4 0x190002e1
>   write 0xe1020428 0x4 0x3509d807
>   write 0xe1020438 0x1 0xe2
>   EOF
>   =================================================================
>   ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>   READ of size 1 at 0x7ffdef904902 thread T0
>       #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>       #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>       #2 0x561cef7de639 in net_tx_pkt_parse_headers hw/net/net_tx_pkt.c:228:14
>       #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>       #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:730:29
>       #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>       #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>       #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>       #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
> 
>   Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in frame
>       #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
> 
>     This frame has 1 object(s):
>       [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34 overflows this variable
>   HINT: this may be a false positive if your program uses some custom stack unwind mechanism, swapcontext or vfork
>         (longjmp and C++ exceptions *are* supported)
>   SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in _eth_get_rss_ex_dst_addr
>   Shadow bytes around the buggy address:
>     0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>   =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   Shadow byte legend (one shadow byte represents 8 application bytes):
>     Addressable:           00
>     Partially addressable: 01 02 03 04 05 06 07
>     Stack left redzone:      f1
>     Stack right redzone:     f3
>   ==2859770==ABORTING
> 
> Add the corresponding qtest case with the fuzzer reproducer.
> 
> FWIW GCC 11 similarly reported:
> 
>   net/eth.c: In function 'eth_parse_ipv6_hdr':
>   net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>         |          ~~~~~^~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
>   net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Werror=array-bounds]
>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>         |                                 ~~~~~^~~~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
> 
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e functionality")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  net/eth.c                      | 13 +++++----
>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  1 +
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 63 insertions(+), 5 deletions(-)
>  create mode 100644 tests/qtest/fuzz-e1000e-test.c
> 
> diff --git a/net/eth.c b/net/eth.c
> index b78aa526efc..284ade4ab0b 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -405,17 +405,20 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>                          struct ip6_ext_hdr *ext_hdr,
>                          struct in6_address *dst_addr)
>  {
> -    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
> +    struct ip6_ext_hdr_routing rt_hdr;
>      size_t input_size = iov_size(pkt, pkt_frags);
>      size_t bytes_read;
>  
> -    if (input_size < ext_hdr_offset + sizeof(*rthdr) + sizeof(*dst_addr)) {
> +    if (input_size < ext_hdr_offset + sizeof(rt_hdr) + sizeof(*dst_addr)) {
>          return false;
>      }
>  
> -    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
> -        bytes_read = iov_to_buf(pkt, pkt_frags,
> -                                ext_hdr_offset + sizeof(*rthdr),
> +    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
> +                            &rt_hdr, sizeof(rt_hdr));
> +    assert(bytes_read == sizeof(rt_hdr));
> +
> +    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
> +        bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset + sizeof(rt_hdr),
>                                  dst_addr, sizeof(*dst_addr));
>  
>          return bytes_read == sizeof(*dst_addr);
> diff --git a/tests/qtest/fuzz-e1000e-test.c b/tests/qtest/fuzz-e1000e-test.c
> new file mode 100644
> index 00000000000..66229e60964
> --- /dev/null
> +++ b/tests/qtest/fuzz-e1000e-test.c
> @@ -0,0 +1,53 @@
> +/*
> + * QTest testcase for e1000e device generated by fuzzer
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +/*
> + * https://bugs.launchpad.net/qemu/+bug/1879531
> + */
> +static void test_lp1879531_eth_get_rss_ex_dst_addr(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-nographic -monitor none -serial none -M pc-q35-5.0");
> +
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xe1020000);
> +    qtest_outl(s, 0xcf8, 0x80001004);
> +    qtest_outw(s, 0xcfc, 0x7);
> +    qtest_writeb(s, 0x25, 0x86);
> +    qtest_writeb(s, 0x26, 0xdd);
> +    qtest_writeb(s, 0x4f, 0x2b);
> +
> +    qtest_writel(s, 0xe1020030, 0x190002e1);
> +    qtest_writew(s, 0xe102003a, 0x0807);
> +    qtest_writel(s, 0xe1020048, 0x12077cdd);
> +    qtest_writel(s, 0xe1020400, 0xba077cdd);
> +    qtest_writel(s, 0xe1020420, 0x190002e1);
> +    qtest_writel(s, 0xe1020428, 0x3509d807);
> +    qtest_writeb(s, 0xe1020438, 0xe2);
> +    qtest_writeb(s, 0x4f, 0x2b);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qtest_add_func("fuzz/test_lp1879531_eth_get_rss_ex_dst_addr",
> +                       test_lp1879531_eth_get_rss_ex_dst_addr);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 738786146d6..cc5f3aa6b60 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2003,6 +2003,7 @@ e1000e
>  M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: hw/net/e1000e*
> +F: tests/qtest/fuzz-e1000e-test.c
>  
>  eepro100
>  M: Stefan Weil <sw@weilnetz.de>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 58efc46144e..7997d895449 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -60,6 +60,7 @@
>    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
> +  (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>    qtests_pci +                                                                              \
>    ['fdc-test',
>     'ide-test',
> -- 
> 2.26.2
> 

