Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A986B3045F5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 19:07:53 +0100 (CET)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Skq-0004G5-Pk
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 13:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l4Sff-0001Yx-B6; Tue, 26 Jan 2021 13:02:32 -0500
Received: from relay68.bu.edu ([128.197.228.73]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l4Sfd-0007NH-9m; Tue, 26 Jan 2021 13:02:30 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10QI1nCs029027
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 26 Jan 2021 13:01:51 -0500
Date: Tue, 26 Jan 2021 13:01:49 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/qtest: Only run fuzz-megasas-test if
 megasas device is available
Message-ID: <20210126180149.2jn3c6cv44l7uvv6@mozz.bu.edu>
References: <20210126111638.3141780-1-philmd@redhat.com>
 <20210126111638.3141780-2-philmd@redhat.com>
 <3a8a481a-0906-8d29-f1ef-83bcbb85b27c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a8a481a-0906-8d29-f1ef-83bcbb85b27c@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210126 1851, Thomas Huth wrote:
> On 26/01/2021 12.16, Philippe Mathieu-Daudé wrote:
> > This test fails when QEMU is built without the megasas device,
> > restrict it to its availability.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >   tests/qtest/fuzz-megasas-test.c | 49 +++++++++++++++++++++++++++++++++
> >   tests/qtest/fuzz-test.c         | 25 -----------------
> >   MAINTAINERS                     |  1 +
> >   tests/qtest/meson.build         |  4 ++-
> >   4 files changed, 53 insertions(+), 26 deletions(-)
> >   create mode 100644 tests/qtest/fuzz-megasas-test.c
> > 
> > diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
> > new file mode 100644
> > index 00000000000..940a76bf25a
> > --- /dev/null
> > +++ b/tests/qtest/fuzz-megasas-test.c
> > @@ -0,0 +1,49 @@
> > +/*
> > + * QTest fuzzer-generated testcase for megasas device
> > + *
> > + * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "libqos/libqtest.h"
> > +
> > +/*
> > + * This used to trigger the assert in scsi_dma_complete
> > + * https://bugs.launchpad.net/qemu/+bug/1878263
> > + */
> > +static void test_lp1878263_megasas_zero_iov_cnt(void)
> > +{
> > +    QTestState *s;
> > +
> > +    s = qtest_init("-nographic -monitor none -serial none "
> > +                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
> > +                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
> > +    qtest_outl(s, 0xcf8, 0x80001818);
> > +    qtest_outl(s, 0xcfc, 0xc101);
> > +    qtest_outl(s, 0xcf8, 0x8000181c);
> > +    qtest_outl(s, 0xcf8, 0x80001804);
> > +    qtest_outw(s, 0xcfc, 0x7);
> > +    qtest_outl(s, 0xcf8, 0x8000186a);
> > +    qtest_writeb(s, 0x14, 0xfe);
> > +    qtest_writeb(s, 0x0, 0x02);
> > +    qtest_outb(s, 0xc1c0, 0x17);
> > +    qtest_quit(s);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    const char *arch = qtest_get_arch();
> > +
> > +    g_test_init(&argc, &argv, NULL);
> > +
> > +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> > +        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
> > +                       test_lp1878263_megasas_zero_iov_cnt);
> > +    }
> > +
> > +    return g_test_run();
> > +}
> > diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> > index cdb1100a0b8..6188fbb8e96 100644
> > --- a/tests/qtest/fuzz-test.c
> > +++ b/tests/qtest/fuzz-test.c
> > @@ -11,29 +11,6 @@
> >   #include "libqos/libqtest.h"
> > -/*
> > - * This used to trigger the assert in scsi_dma_complete
> > - * https://bugs.launchpad.net/qemu/+bug/1878263
> > - */
> > -static void test_lp1878263_megasas_zero_iov_cnt(void)
> > -{
> > -    QTestState *s;
> > -
> > -    s = qtest_init("-nographic -monitor none -serial none "
> > -                   "-M q35 -device megasas -device scsi-cd,drive=null0 "
> > -                   "-blockdev driver=null-co,read-zeroes=on,node-name=null0");
> > -    qtest_outl(s, 0xcf8, 0x80001818);
> > -    qtest_outl(s, 0xcfc, 0xc101);
> > -    qtest_outl(s, 0xcf8, 0x8000181c);
> > -    qtest_outl(s, 0xcf8, 0x80001804);
> > -    qtest_outw(s, 0xcfc, 0x7);
> > -    qtest_outl(s, 0xcf8, 0x8000186a);
> > -    qtest_writeb(s, 0x14, 0xfe);
> > -    qtest_writeb(s, 0x0, 0x02);
> > -    qtest_outb(s, 0xc1c0, 0x17);
> > -    qtest_quit(s);
> > -}
> > -
> >   static void test_lp1878642_pci_bus_get_irq_level_assert(void)
> >   {
> >       QTestState *s;
> > @@ -104,8 +81,6 @@ int main(int argc, char **argv)
> >       g_test_init(&argc, &argv, NULL);
> >       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> > -        qtest_add_func("fuzz/test_lp1878263_megasas_zero_iov_cnt",
> > -                       test_lp1878263_megasas_zero_iov_cnt);
> >           qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
> >                          test_lp1878642_pci_bus_get_irq_level_assert);
> >           qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 34359a99b8e..44cd74b03cd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1925,6 +1925,7 @@ S: Supported
> >   F: hw/scsi/megasas.c
> >   F: hw/scsi/mfi.h
> >   F: tests/qtest/megasas-test.c
> > +F: tests/qtest/fuzz-megasas-test.c
> >   Network packet abstractions
> >   M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index 16d04625b8b..85682d0dfce 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -4,7 +4,9 @@
> >     subdir_done()
> >   endif
> > -qtests_generic = [
> > +qtests_generic = \
> > +  (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
> > +  [
> >     'cdrom-test',
> >     'device-introspect-test',
> >     'machine-none-test',
> > 
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> I assume Alexander will take this patch through his fuzzer branch now? Or
> shall I take it via the qtest branch?

I can take take this through my branch, unless thats somehow inconvenient.
-Alex

>  Thomas
> 

