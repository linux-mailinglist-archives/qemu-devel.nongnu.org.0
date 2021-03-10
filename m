Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE83338F1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:38:56 +0100 (CET)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvIt-0005w1-BY
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lJvHa-000560-B4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lJvHM-0003H5-Q8
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615369039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S13IpUupYi4Nq+Lnp/wmxp3xf1C8PFeu5IDIkoPzowU=;
 b=BFdJiKhBMn24ysnS3MaLqJAdRFniuGth8U5FGDJC8RwJnkoOWoSmNH3qe8AcaZZDz6A8q5
 ZL7K9DZold0s9XqfwRT6Y1Tn3x6HPowN3fRlJS5w6uScYrK5IdxxCXYn8ABERhpEiZ1Oz5
 khsHv2fDbkTSaJC1BrpApxP6jZgWWAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-t2WGsCzLPKiiiq_ZA-Fbjg-1; Wed, 10 Mar 2021 04:36:08 -0500
X-MC-Unique: t2WGsCzLPKiiiq_ZA-Fbjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 066D526868;
 Wed, 10 Mar 2021 09:36:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEB81800D;
 Wed, 10 Mar 2021 09:36:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A72844A714;
 Wed, 10 Mar 2021 09:36:06 +0000 (UTC)
Date: Wed, 10 Mar 2021 04:36:06 -0500 (EST)
From: Miroslav Rezanina <mrezanin@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <1881013042.40005672.1615368966291.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210309182709.810955-5-philmd@redhat.com>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-5-philmd@redhat.com>
Subject: Re: [PATCH v4 4/6] net/eth: Check rt_hdr size before casting to
 ip6_ext_hdr
MIME-Version: 1.0
X-Originating-IP: [10.40.193.51, 10.4.195.9]
Thread-Topic: net/eth: Check rt_hdr size before casting to ip6_ext_hdr
Thread-Index: NKnKgYK78dxXDhTkv4UZHzxB4TANjg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: qemu-devel@nongnu.org
> Cc: "Laurent Vivier" <lvivier@redhat.com>, "Dmitry Fleytman" <dmitry.fley=
tman@gmail.com>, "Miroslav Rezanina"
> <mrezanin@redhat.com>, "Li Qiang" <liq3ea@gmail.com>, "Paolo Bonzini" <pb=
onzini@redhat.com>, "Jason Wang"
> <jasowang@redhat.com>, "Thomas Huth" <thuth@redhat.com>, "Alexander Bulek=
ov" <alxndr@bu.edu>, "Stefano Garzarella"
> <sgarzare@redhat.com>, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>,=
 qemu-stable@nongnu.org
> Sent: Tuesday, March 9, 2021 7:27:07 PM
> Subject: [PATCH v4 4/6] net/eth: Check rt_hdr size before casting to ip6_=
ext_hdr
>=20
> Do not cast our ip6_ext_hdr pointer to ip6_ext_hdr_routing if there
> isn't enough data in the buffer for a such structure.
>=20
> This fix a 2 bytes buffer overrun in eth_parse_ipv6_hdr() reported
> by QEMU fuzzer:
>=20
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
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   =3D=3D2859770=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on ad=
dress
>   0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>   READ of size 1 at 0x7ffdef904902 thread T0
>       #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>       #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>       #2 0x561cef7de639 in net_tx_pkt_parse_headers
>       hw/net/net_tx_pkt.c:228:14
>       #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>       #4 0x561ceec29f22 in e1000e_process_tx_desc hw/net/e1000e_core.c:73=
0:29
>       #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>       #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>       #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>       #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
>=20
>   Address 0x7ffdef904902 is located in stack of thread T0 at offset 34 in
>   frame
>       #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
>=20
>     This frame has 1 object(s):
>       [32, 34) 'ext_hdr' (line 487) <=3D=3D Memory access at offset 34 ov=
erflows
>       this variable
>   HINT: this may be a false positive if your program uses some custom sta=
ck
>   unwind mechanism, swapcontext or vfork
>         (longjmp and C++ exceptions *are* supported)
>   SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in
>   _eth_get_rss_ex_dst_addr
>   Shadow bytes around the buggy address:
>     0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>   =3D>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
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
>   =3D=3D2859770=3D=3DABORTING
>=20
> Add the corresponding qtest case with the fuzzer reproducer.
>=20
> FWIW GCC 11 similarly reported:
>=20
>   net/eth.c: In function 'eth_parse_ipv6_hdr':
>   net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]=
' is
>   partly outside array bounds of 'struct ip6_ext_hdr[1]'
>   [-Werror=3Darray-bounds]
>     410 |     if ((rthdr->rtype =3D=3D 2) && (rthdr->segleft =3D=3D 1)) {
>         |          ~~~~~^~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
>   net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]=
' is
>   partly outside array bounds of 'struct ip6_ext_hdr[1]'
>   [-Werror=3Darray-bounds]
>     410 |     if ((rthdr->rtype =3D=3D 2) && (rthdr->segleft =3D=3D 1)) {
>         |                                 ~~~~~^~~~~~~~~
>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>     485 |     struct ip6_ext_hdr ext_hdr;
>         |                        ^~~~~~~
>=20
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1=
000e
> functionality")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  net/eth.c                      |  7 ++++-
>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  1 +
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/fuzz-e1000e-test.c
>=20
> diff --git a/net/eth.c b/net/eth.c
> index 77af2b673bb..f0c8dfe8df7 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -406,7 +406,12 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, in=
t
> pkt_frags,
>                          struct in6_address *dst_addr)
>  {
>      size_t input_size =3D iov_size(pkt, pkt_frags);
> -    struct ip6_ext_hdr_routing *rthdr =3D (struct ip6_ext_hdr_routing *)
> ext_hdr;
> +    struct ip6_ext_hdr_routing *rthdr;
> +
> +    if (input_size < ext_hdr_offset + sizeof(*rthdr)) {
> +        return false;
> +    }
> +    rthdr =3D (struct ip6_ext_hdr_routing *) ext_hdr;

Hi Philippe,

you're introducing the problem you're trying to fix here. This line
cause warning on GCC 11 and so the build fail with --enable-werror.

return statement has no effect on compiler.

Mirek
> =20
>      if ((rthdr->rtype =3D=3D 2) && (rthdr->segleft =3D=3D 1)) {
>          size_t bytes_read;
> diff --git a/tests/qtest/fuzz-e1000e-test.c b/tests/qtest/fuzz-e1000e-tes=
t.c
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
> +    s =3D qtest_init("-nographic -monitor none -serial none -M pc-q35-5.=
0");
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
> +    const char *arch =3D qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") =3D=3D 0 || strcmp(arch, "x86_64") =3D=3D 0=
) {
> +        qtest_add_func("fuzz/test_lp1879531_eth_get_rss_ex_dst_addr",
> +                       test_lp1879531_eth_get_rss_ex_dst_addr);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f22d83c1782..4eb5784ff83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2003,6 +2003,7 @@ e1000e
>  M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
>  F: hw/net/e1000e*
> +F: tests/qtest/fuzz-e1000e-test.c
> =20
>  eepro100
>  M: Stefan Weil <sw@weilnetz.de>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 58efc46144e..7997d895449 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -60,6 +60,7 @@
>    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] :=
 [])
>    +              \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-te=
st']
>    : []) +        \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] :=
 [])
>    +              \
> +  (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ?
> ['fuzz-e1000e-test'] : []) +   \
>    qtests_pci +
>    \
>    ['fdc-test',
>     'ide-test',
> --
> 2.26.2
>=20
>=20

--=20
Miroslav Rezanina
Software Engineer - Virtualization Team Maintainer


