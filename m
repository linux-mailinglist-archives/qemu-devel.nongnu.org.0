Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94B56A875
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:43:05 +0200 (CEST)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Uam-000338-78
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVw-0008Sb-5C
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVe-0006n1-FM
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jfEFIgsLHFr1dquAx+LTDFlKPqPTvxHcashXeOp4L5g=;
 b=fQ4w3CKvPIj0Ue/AyAZJT2pNc9QP6WDk38tct58D3T38e5Vx2U5V87nDMzQJPCOYUERtlk
 rdZZ+HN+3W8N+VLGrUEslN5oLEPyc8dCF373Z3lLJTObDwlcKc0ywVVYk2wt4jfSR1YUah
 7Y7sYU+HDKv5Vsi+m0OCI4s3y7ywdMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-tdCESgLMMeGCcQBKoE0mmA-1; Thu, 07 Jul 2022 12:37:36 -0400
X-MC-Unique: tdCESgLMMeGCcQBKoE0mmA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9000718E52C6;
 Thu,  7 Jul 2022 16:37:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E7D540315C;
 Thu,  7 Jul 2022 16:37:21 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 0/9] tests: introduce a tree-wide code style checking
 facility
Date: Thu,  7 Jul 2022 17:37:11 +0100
Message-Id: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Update of:

 v2: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00595.html

The first patch gives a detailed description, but the overall goal
here is to provide a code style checking facility to augment (and
ideally replace) checkstyle.pl. The key conceptual differences are:

 - Always applies to all code in tree, not merely patches
 - Failures are always fatal, exceptions must be recorded
 - Always runs as part of 'make check'

The first patch introduces the infrastructure, the remaining patches
illustrate its uses for some rules where we currently have violations

 - Prevent initializing an 'int' variable with 'true' / 'false'
 - Look for commonly repeated words (ie the the)
 - Ensure qemu/osdep.h is listed first in all .c files
 - Ensure qemu/osdep.h is NOT listed in .h or .c.inc file

As noted above, it integrates with 'make check' via a new test suite
called 'style', so you can invoke it individually too:

    $ make check-style
    changing dir to build for make "check-style"...
    /usr/bin/meson test  --no-rebuild -t 0  --num-processes 1 --print-errorlogs  --suite style
    1/3 qemu:style / int_assign_bool              OK              0.28s
    2/3 qemu:style / prohibit_doubled_word        OK              1.78s
    3/3 qemu:style / c_file_osdep_h               OK              0.08s

    Ok:                 3
    Expected Fail:      0
    Fail:               0
    Unexpected Pass:    0
    Skipped:            0
    Timeout:            0

Example of what it looks like when it fails:

    $ make check-style
    changing dir to build for make "check-style"...
    make[1]: Entering directory '/home/berrange/src/virt/qemu/build'
      GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc slirp
    /usr/bin/meson test  --no-rebuild -t 0  --num-processes 1 --print-errorlogs  --suite style
    1/4 qemu:style / int_assign_bool          OK              0.15s
    2/4 qemu:style / double_words             OK              1.36s
    3/4 qemu:style / osdep_h_in_source        FAIL            0.10s   exit status 1
    >>> MALLOC_PERTURB_=98 /home/berrange/src/virt/qemu/tests/style.py --config /home/berrange/src/virt/qemu/build/../tests/style.yml check --rule osdep_h_in_source
    ――――――――――――――――――――――――――――――――――――――――――――――― ✀  ――――――――――――――――――――――――――――――――――――――――――――――――
    CHECK: osdep_h_in_source: FAIL ❌ (0.04 secs)
    scripts/coverity-scan/model.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    ERROR: osdep_h_in_source: all C source files must include qemu/osdep.h, as the first header ❌
    ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

    4/4 qemu:style / osdep_h_in_header        OK              0.08s

    Summary of Failures:

    3/4 qemu:style / osdep_h_in_source FAIL            0.10s   exit status 1

    Ok:                 3
    Expected Fail:      0
    Fail:               1
    Unexpected Pass:    0
    Skipped:            0
    Timeout:            0

If debugging new tests it can be preferrable to directly invoke it
bypassing meson:

    $ ./tests/style.py check
    CHECK: int_assign_bool: PASS ✅ (0.09 secs)
    CHECK: double_words: PASS ✅ (1.31 secs)
    CHECK: osdep_h_in_source: FAIL ❌ (0.03 secs)
    scripts/coverity-scan/model.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    ERROR: osdep_h_in_source: all C source files must include qemu/osdep.h, as the first header ❌
    CHECK: osdep_h_in_header: PASS ✅ (0.02 secs)

or to run a specific test only

    $ ./tests/style.py check --rule osdep_h_in_source
    CHECK: osdep_h_in_source: FAIL ❌ (0.03 secs)
    scripts/coverity-scan/model.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    ERROR: osdep_h_in_source: all C source files must include qemu/osdep.h, as the first header ❌

The speed of the test suite is largely driven by how quickly
'grep' / 'perl' can match through *every* file in the source
tree (as reported by 'git ls-tree').  Certain regex expressions
can affect this by causing lots of backtracking, but generally
each test is expected to be < 1 second for the whole source tree.

Changed in v3:

  - Got rid of all the makefile usage, writing the test logic
    in python, and defining the tests in a YAML file. Logically
    it is doing the same as before, but should be more easy
    to understand.

  - Check that osdep.h is /first/, not merely present, identifying
    a few more violations in tree.

  - Check that osdep.h is NOT in .h or .c.inc files, identifynig
    even more violations in tree.

  - Fixed a few of the fixes in the source

Daniel P. Berrangé (9):
  tests: introduce tree-wide code style checking
  misc: fix mixups of bool constants with int variables
  tests/style: check for mixups of bool constants with int variables
  misc: fix commonly doubled up words
  tests/style: check for commonly doubled up words
  misc: ensure qemu/osdep.h is included first in all .c files
  tests/style: check qemu/osdep.h is included in all .c files
  misc: remove qemu/osdep.h from headers / included source files
  tests/style: check qemu/osdep.h is NOT included in all .h/.c.inc files

 backends/hostmem-epc.c                        |   4 +-
 block/export/vduse-blk.c                      |   3 +-
 block/linux-aio.c                             |   2 +-
 block/qcow2-bitmap.c                          |   8 +-
 block/vhdx-log.c                              |   2 +-
 bsd-user/arm/signal.c                         |   2 +
 bsd-user/arm/target_arch_cpu.c                |   3 +
 bsd-user/{elfcore.c => elfcore.c.inc}         |   0
 bsd-user/elfload.c                            |   2 +-
 bsd-user/freebsd/os-sys.c                     |   2 +
 bsd-user/i386/signal.c                        |   2 +
 bsd-user/i386/target_arch_cpu.c               |   3 +-
 bsd-user/main.c                               |   3 +-
 bsd-user/qemu.h                               |   1 -
 bsd-user/x86_64/signal.c                      |   2 +
 bsd-user/x86_64/target_arch_cpu.c             |   3 +-
 contrib/plugins/cache.c                       |   2 +-
 crypto/akcipher-gcrypt.c.inc                  |   1 -
 crypto/akcipher-nettle.c.inc                  |   1 -
 crypto/cipher-gnutls.c.inc                    |   1 -
 crypto/rsakey-nettle.c.inc                    |   1 -
 crypto/rsakey.c                               |   1 +
 crypto/rsakey.h                               |   1 -
 disas/libvixl/vixl/invalset.h                 |   2 +-
 docs/devel/qom.rst                            |   4 +-
 docs/interop/live-block-operations.rst        |   4 +-
 docs/system/arm/cpu-features.rst              |   2 +-
 docs/system/devices/cxl.rst                   |   2 +-
 docs/system/s390x/bootdevices.rst             |   2 +-
 docs/system/tls.rst                           |   2 +-
 docs/tools/qemu-pr-helper.rst                 |   4 +-
 hw/core/clock.c                               |   2 +-
 hw/hyperv/syndbg.c                            |   2 +-
 hw/intc/arm_gicv3_redist.c                    |   2 +-
 hw/misc/iotkit-secctl.c                       |   2 +-
 hw/misc/iotkit-sysctl.c                       |   4 +-
 hw/s390x/s390-ccw.c                           |   2 +-
 hw/usb/u2f.h                                  |   2 +-
 hw/xtensa/sim.c                               |   4 +-
 include/hw/cxl/cxl_host.h                     |   1 -
 include/hw/qdev-core.h                        |   2 +-
 include/hw/tricore/triboard.h                 |   1 -
 include/qemu/userfaultfd.h                    |   1 -
 include/user/safe-syscall.h                   |   2 +-
 linux-user/i386/cpu_loop.c                    |   2 +-
 meson.build                                   |   2 +
 nbd/client.c                                  |   8 +-
 net/vmnet_int.h                               |   1 -
 pc-bios/s390-ccw/virtio-scsi.c                |   2 +-
 python/Makefile                               |   2 +-
 python/qemu/utils/__init__.py                 |   2 +-
 qga/cutils.c                                  |   2 +
 qga/cutils.h                                  |   2 -
 target/arm/translate.c                        |   2 +-
 target/cris/translate_v10.c.inc               |   1 -
 target/hexagon/hex_arch_types.h               |   1 -
 target/hexagon/mmvec/macros.h                 |   1 -
 target/i386/cpu-dump.c                        |   3 +-
 target/i386/cpu.c                             |   2 +-
 target/riscv/pmu.h                            |   1 -
 .../xtensa/core-dc232b/xtensa-modules.c.inc   |   1 -
 .../xtensa/core-dc233c/xtensa-modules.c.inc   |   1 -
 target/xtensa/core-de212/xtensa-modules.c.inc |   1 -
 target/xtensa/core-fsf/xtensa-modules.c.inc   |   1 -
 .../xtensa-modules.c.inc                      |   1 -
 tcg/i386/tcg-target.c.inc                     |   2 +-
 tests/Makefile.include                        |   3 +-
 tests/meson.build                             |  17 ++
 tests/qtest/microbit-test.c                   |   6 +-
 tests/style.py                                | 218 ++++++++++++++++++
 tests/style.yml                               | 150 ++++++++++++
 tools/virtiofsd/fuse_virtio.c                 |   2 +-
 ui/spice-display.c                            |   4 +-
 ...plate.h => vnc-enc-hextile-template.c.inc} |   0
 ui/vnc-enc-hextile.c                          |   4 +-
 ui/vnc-enc-zrle.c.inc                         |   5 +-
 ...mplate.c => vnc-enc-zywrle-template.c.inc} |   1 -
 util/mmap-alloc.c                             |   3 +-
 78 files changed, 470 insertions(+), 83 deletions(-)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)
 create mode 100755 tests/style.py
 create mode 100644 tests/style.yml
 rename ui/{vnc-enc-hextile-template.h => vnc-enc-hextile-template.c.inc} (100%)
 rename ui/{vnc-enc-zywrle-template.c => vnc-enc-zywrle-template.c.inc} (99%)

-- 
2.36.1


