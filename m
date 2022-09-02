Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF85AB7D9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 19:59:46 +0200 (CEST)
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUAxF-0001sM-0x
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 13:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZZ-00069K-1O
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oUAZG-0007DD-Pg
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 13:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662140097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9NXHCyX76zJrv+3jRcXyEaWoYUq6ldayJp0BuETmbr0=;
 b=CPJn8NYs5Ra18MKvSlxaMQj62+iR+WxhFWPvvoFZTWD4dIcZzx0F2FZKDswjnNkx3gNkRu
 1qmPQTYVPxZBaBfQ7Ov9SAHQzBrtaMXnJG/X+RktWIEcZOPGQCFPPN9a7KQszN5z7PqyNo
 wmeHwjCeZVfI0mVnJH6yB2zUBN9+u7w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-mhrp6ZPKPdCHoYbT9mhQXA-1; Fri, 02 Sep 2022 13:34:56 -0400
X-MC-Unique: mhrp6ZPKPdCHoYbT9mhQXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B604738149B4;
 Fri,  2 Sep 2022 17:34:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5180AC15BB3;
 Fri,  2 Sep 2022 17:34:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH 0/8] RFC: Pass tests for x86_64 machine types compiled
 individually
Date: Fri,  2 Sep 2022 19:34:44 +0200
Message-Id: <20220902173452.1904-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

This is a continuation on top of my previous series:

tests: Make expliction defaults for tests
Based-on: <20220902165126.1482-1-quintela@redhat.com>

After the series is applied, the following combinations for
x86_64-softmmu-devices.conf pass "make check"

CONFIG_ISAPC=y
CONFIG_I440FX=y
CONFIG_Q35=y
CONFIG_MICROVM=y

CONFIG_ISAPC=n
CONFIG_I440FX=y
CONFIG_Q35=n
CONFIG_MICROVM=n

CONFIG_ISAPC=n
CONFIG_I440FX=n
CONFIG_Q35=y
CONFIG_MICROVM=n

ISAPC requires I440FX, so it can't be compiled alone.  MICROVM is a
mess, and you can't compile it right now without having CONFIG_PC
defined, problem is at:

/scratch/qemu/full/m64/../../../../mnt/code/qemu/full/hw/i386/acpi-common.c:39:
multiple definition of `pc_madt_cpu_entry';
libcommon.fa.p/hw_acpi_acpi-x86-stub.c.o:/scratch/qemu/full/m64/../../../../mnt/code/qemu/full/hw/acpi/acpi-x86-stub.c:9:
first defined here

Basically the problem is that it expect CONFIG_PC to be defined.  That
happens if any other machine is defined, but if only MICROVM is
defined it is not.

So, now that I explained what I wanted to do, what it does:
- make oem-fields consistent, only renames of functions
- sort bios-tables-tests by machine type, so
- it is easy to only run the things that are compiled in.

Once this is done, we make tests depend on CONFIG_Q35 or CONFIG_I440FX
in meson.build file.

There are interesting cases, and are the tests are run with the
default machine type (pc) but that work with either of them:

qtests_i386_require_default = \
  (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +		    \
  (config_host.has_key('CONFIG_POSIX') and
   config_all_devices.has_key('CONFIG_ACPI_ERST') ? ['erst-test'] : []) +		    \
  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) +	    \
  (config_host.has_key('CONFIG_LINUX') and
   config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +		    \
  (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +	    \
  (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) + 		    \
  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +	    \
  (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +	 	    \
  (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +			    \
  (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +	    \
  (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +	    \
  ['boot-order-test',
   'fw_cfg-test',
   'migration-test',
   'numa-test',
   'rtc-test',
   'test-filter-redirector',
   'test-x86-cpuid-compat',
   'vmgenid-test'
  ]

This tests can be run with both machine types, but as we can't easily
put -machine on them (several of them are supposed to run on other
architectures), it is not "trivial to fix".  I have a "hack" on my
tree that gets the 1st machine available for this kind of tests and
changed qtest_init() to qtest_init_first() that does exactly that.
But I am not sure that is the way to go. Another way for me to fix it
is just to change the Q35 machine to be the default for x86_64 when
I400FX is not compiled in, but it has other kind of troubles.  I
started this wanting than all tests showed an explicit machine type,
but there is nothing easier to be done for this multiarch tests.
Notice that the problem already exist, and some tests do funny things
to make sure that they get the "-machine pc".

    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
        machine_addition = "-machine pc";
    }

    QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
                                    machine_addition);

But this is not clear in my book.

So, what I am doing this again. Number of files to compile and be able
to run "make check" with minimal configurations (for x86_64-softmmu):
- everything under the sun: 2757 files
- everything that you can disable with configure: 1838 files
- same than previous but only CONFIG_Q35 and this patches: 1759 files
- on my tree with other multiple hacks: around 1500 files compiled.

My goal would be that compiling with --without-default-devices, make
check pass, but even after my changes, we get:

Summary of Failures:

  2/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test         ERROR           0.16s   killed by signal 6 SIGABRT
  3/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test       ERROR           0.17s   killed by signal 6 SIGABRT
  4/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.19s   killed by signal 6 SIGABRT
  1/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.33s   killed by signal 6 SIGABRT
 81/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/lpc-ich9-test          ERROR           0.14s   killed by signal 6 SIGABRT
 83/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/q35-test               ERROR           0.16s   killed by signal 6 SIGABRT
 85/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/tco-test               ERROR           0.16s   killed by signal 6 SIGABRT
 86/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/device-plug-test       ERROR           0.14s   killed by signal 6 SIGABRT
 88/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/drive_del-test         ERROR           0.21s   killed by signal 6 SIGABRT
 89/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/fdc-test               ERROR           0.21s   killed by signal 6 SIGABRT
 91/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/ide-test               ERROR           0.13s   killed by signal 6 SIGABRT
 92/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/display-vga-test       ERROR           0.14s   killed by signal 6 SIGABRT
 90/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/i440fx-test            ERROR           0.33s   killed by signal 6 SIGABRT
 93/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/erst-test              ERROR           0.15s   killed by signal 6 SIGABRT
 95/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-mirror     ERROR           0.14s   killed by signal 6 SIGABRT
 96/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/fw_cfg-test            ERROR           0.13s   killed by signal 6 SIGABRT
 98/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/rtc-test               ERROR           0.15s   killed by signal 6 SIGABRT
 99/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-filter-redirector ERROR           0.14s   killed by signal 6 SIGABRT
100/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/vmgenid-test           ERROR           0.18s   killed by signal 6 SIGABRT
102/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/cpu-plug-test          ERROR           0.18s   killed by signal 6 SIGABRT
 97/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.46s   killed by signal 6 SIGABRT
104/124 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.38s   killed by signal 6 SIGABRT

And we are not even starting to remove stuff that nobody is going to
use in a modern guest (i.e. e1000e for instance is required).

So, the question is, I am the only one that think this need to be
improved, or should we left this as a hack on my devel tree.

Please, comment.

Thanks, Juan.

Juan Quintela (8):
  bios-tables-test: Make oem-fields tests be consistent
  bios-tables-test: Sort all x86_64 tests by machine type
  bios-tables-test: Only run test for machine types compiled in
  tests: Only run intel-hda-tests if machine type is compiled in
  tests: sb16 has both pc and q35 tests
  tests: Make all tests that use q35 depend on it being compiled in
  tests: Unfold qtest_pci
  tests: Make all tests that depend on I440FX state that

 tests/qtest/bios-tables-test.c | 155 ++++++++++++++++++---------------
 tests/qtest/fuzz-sb16-test.c   |  10 ++-
 tests/qtest/intel-hda-test.c   |  13 +--
 tests/qtest/meson.build        |  97 +++++++++++----------
 4 files changed, 154 insertions(+), 121 deletions(-)

-- 
2.37.2


