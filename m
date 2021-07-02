Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDD3BA3DC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 20:09:45 +0200 (CEST)
Received: from localhost ([::1]:43818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzNbk-0000EV-51
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 14:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lzNaf-0007rd-UW; Fri, 02 Jul 2021 14:08:37 -0400
Received: from relay68.bu.edu ([128.197.228.73]:35233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lzNae-00012H-5R; Fri, 02 Jul 2021 14:08:37 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 162I7Sqe025338
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 2 Jul 2021 14:07:33 -0400
Date: Fri, 2 Jul 2021 14:07:28 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/3] hw/sd: Check for valid address range in
 SEND_WRITE_PROT (CMD30)
Message-ID: <20210702180728.biei65jvsdeotjmk@mozz.bu.edu>
References: <20210702155900.148665-1-f4bug@amsat.org>
 <20210702155900.148665-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210702155900.148665-4-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Michael Olbrich <m.olbrich@pengutronix.de>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210702 1759, Philippe Mathieu-Daudé wrote:
> OSS-Fuzz found sending illegal addresses when querying the write
> protection bits triggers an assertion:
> 
>   qemu-fuzz-i386: hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t): Assertion `wpnum < sd->wpgrps_size' failed.
>   ==11578== ERROR: libFuzzer: deadly signal
>   #8 0x7ffff628e091 in __assert_fail
>   #9 0x5555588f1a3c in sd_wpbits hw/sd/sd.c:824:9
>   #10 0x5555588dd271 in sd_normal_command hw/sd/sd.c:1383:38
>   #11 0x5555588d777c in sd_do_command hw/sd/sd.c
>   #12 0x555558cb25a0 in sdbus_do_command hw/sd/core.c:100:16
>   #13 0x555558e02a9a in sdhci_send_command hw/sd/sdhci.c:337:12
>   #14 0x555558dffa46 in sdhci_write hw/sd/sdhci.c:1187:9
>   #15 0x5555598b9d76 in memory_region_write_accessor softmmu/memory.c:489:5
> 
> Similarly to commit 8573378e62d ("hw/sd: fix out-of-bounds check
> for multi block reads"), check the address range before sending
> the status of the write protection bits.
> 
> Include the qtest reproducer provided by Alexander Bulekov:
> 
>   $ make check-qtest-i386
>   ...
>   Running test qtest-i386/fuzz-sdcard-test
>   qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.
> 
> Reported-by: OSS-Fuzz (Issue 29225)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/450
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  hw/sd/sd.c                     |  5 +++
>  tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  3 +-
>  tests/qtest/meson.build        |  1 +
>  4 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/fuzz-sdcard-test.c
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 9c8dd11bad1..c753ae24ba9 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1379,6 +1379,11 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  
>          switch (sd->state) {
>          case sd_transfer_state:
> +            if (!address_in_range(sd, "SEND_WRITE_PROT",
> +                                  req.arg, sd->blk_len)) {
> +                return sd_r1;
> +            }
> +
>              sd->state = sd_sendingdata_state;
>              *(uint32_t *) sd->data = sd_wpbits(sd, req.arg);
>              sd->data_start = addr;
> diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
> new file mode 100644
> index 00000000000..96602eac7e5
> --- /dev/null
> +++ b/tests/qtest/fuzz-sdcard-test.c
> @@ -0,0 +1,66 @@
> +/*
> + * QTest fuzzer-generated testcase for sdcard device
> + *
> + * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +
> +/*
> + * https://gitlab.com/qemu-project/qemu/-/issues/450
> + * Used to trigger:
> + *  Assertion `wpnum < sd->wpgrps_size' failed.
> + */
> +static void oss_fuzz_29225(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init(" -display none -m 512m -nodefaults -nographic"
> +                   " -device sdhci-pci,sd-spec-version=3"
> +                   " -device sd-card,drive=d0"
> +                   " -drive if=none,index=0,file=null-co://,format=raw,id=d0");
> +
> +    qtest_outl(s, 0xcf8, 0x80001010);
> +    qtest_outl(s, 0xcfc, 0xd0690);
> +    qtest_outl(s, 0xcf8, 0x80001003);
> +    qtest_outl(s, 0xcf8, 0x80001013);
> +    qtest_outl(s, 0xcfc, 0xffffffff);
> +    qtest_outl(s, 0xcf8, 0x80001003);
> +    qtest_outl(s, 0xcfc, 0x3effe00);
> +
> +    qtest_bufwrite(s, 0xff0d062c, "\xff", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\xb7", 0x1);
> +    qtest_bufwrite(s, 0xff0d060a, "\xc9", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\x29", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\xc2", 0x1);
> +    qtest_bufwrite(s, 0xff0d0628, "\xf7", 0x1);
> +    qtest_bufwrite(s, 0x0, "\xe3", 0x1);
> +    qtest_bufwrite(s, 0x7, "\x13", 0x1);
> +    qtest_bufwrite(s, 0x8, "\xe3", 0x1);
> +    qtest_bufwrite(s, 0xf, "\xe3", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\x03", 0x1);
> +    qtest_bufwrite(s, 0xff0d0605, "\x01", 0x1);
> +    qtest_bufwrite(s, 0xff0d060b, "\xff", 0x1);
> +    qtest_bufwrite(s, 0xff0d060c, "\xff", 0x1);
> +    qtest_bufwrite(s, 0xff0d060e, "\xff", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\x06", 0x1);
> +    qtest_bufwrite(s, 0xff0d060f, "\x9e", 0x1);
> +
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +   if (strcmp(arch, "i386") == 0) {
> +        qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
> +   }
> +
> +   return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfbf7ef79bc..fb33fe12200 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1794,7 +1794,8 @@ F: include/hw/sd/sd*
>  F: hw/sd/core.c
>  F: hw/sd/sd*
>  F: hw/sd/ssi-sd.c
> -F: tests/qtest/sd*
> +F: tests/qtest/fuzz-sdcard-test.c
> +F: tests/qtest/sdhci-test.c
>  
>  USB
>  M: Gerd Hoffmann <kraxel@redhat.com>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index b03e8541700..1bb75ee7324 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -21,6 +21,7 @@
>    (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
>    [
>    'cdrom-test',
>    'device-introspect-test',
> -- 
> 2.31.1
> 

