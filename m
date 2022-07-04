Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F35659BC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:26:47 +0200 (CEST)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NyI-00025v-BV
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nur-0004sv-Iz
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nup-0002Ll-HH
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jJoWEOYaXe9Tfs+CXmKScvHsBw1D8fNd69qIMNJU2uo=;
 b=MgP0VZ84cHxzsgh7duJlU2tgTEMFJo++Vs6D18NvvRqZgLBukaMbqjsXChebd2uHTsqqF5
 Z1FHnf6ok2mRwM8I+HaUF/zi3XNCqrGnPPjoQSUzmx5iDaLe73QhNeFjO6A3J5/m/qsf0s
 nTcNjLYLxiFuEl4XFHCS4fBKE6XoCSM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-gNC4FwcOOxir1lPdPkR66g-1; Mon, 04 Jul 2022 11:23:07 -0400
X-MC-Unique: gNC4FwcOOxir1lPdPkR66g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2372D801755;
 Mon,  4 Jul 2022 15:23:07 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D39C2C28100;
 Mon,  4 Jul 2022 15:23:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/7] tests: introduce a tree-wide code style checking
 facility
Date: Mon,  4 Jul 2022 16:22:56 +0100
Message-Id: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The first patch gives a detailed description, but the overall goal here
is to provide a code style checking facility to augment (and ideally
eventually replace) checkpatch.pl. The key conceptual differences are:

 - Always applies to all code in tree, not merely patches
 - Failures are always fatal, exceptions must be recorded
 - Always runs as part of 'make check'

These combine to ensure that the in-tree code quality will be kept
at a high bar on an ongoing basis, with no silently ignoring rules,
any exceptions must be recorded explicitly to allow the check to
pass.

The first patch introduces the infrastructure, the remaining patches
illustrate its usage for three rules

 - Prevent initializing an 'int' variable with 'true' / 'false'
 - Look for commonly repeated words (ie the the)
 - Ensure qemu/osdep.h is listed in all .c files

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
    1/3 qemu:style / int_assign_bool              OK              0.27s
    2/3 qemu:style / prohibit_doubled_word        OK              1.77s
    3/3 qemu:style / c_file_osdep_h               FAIL            0.07s   exit status 2
    >>> MALLOC_PERTURB_=217 /usr/bin/make -f /home/berrange/src/virt/qemu/build/../tests/style.mak sc_c_file_osdep_h
    ――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ――――――――――――――――――――――――――――――――――――――――――――――――――――――
    stdout:
    make[2]: Entering directory '/home/berrange/src/virt/qemu'
    c_file_osdep_h
    scripts/coverity-scan/model.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    make[2]: Leaving directory '/home/berrange/src/virt/qemu'
    stderr:
    tests/style.mak: all C files must include qemu/osdep.h
    make[2]: *** [/home/berrange/src/virt/qemu/build/../tests/style.mak:57: sc_c_file_osdep_h] Error 1
    ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
    
    Summary of Failures:
    
    3/3 qemu:style / c_file_osdep_h        FAIL            0.07s   exit status 2
    
    Ok:                 2
    Expected Fail:      0
    Fail:               1
    Unexpected Pass:    0
    Skipped:            0
    Timeout:            0


If debugging new tests it can be preferrable to directly invoke it
bypassing meson:

    $ make -f tests/style.mak
    c_file_osdep_h
    0.04 c_file_osdep_h
    int_assign_bool
    0.23 int_assign_bool
    prohibit_doubled_word
    1.73 prohibit_doubled_word
    
or

    $ make -f tests/style.mak  sc_c_file_osdep_h
    c_file_osdep_h
    scripts/coverity-scan/model.c
    scripts/xen-detect.c
    subprojects/libvduse/libvduse.c
    subprojects/libvhost-user/libvhost-user-glib.c
    subprojects/libvhost-user/libvhost-user.c
    subprojects/libvhost-user/link-test.c
    tests/style.mak: all C files must include qemu/osdep.h
    make: *** [tests/style.mak:57: sc_c_file_osdep_h] Error 1

The speed of the test suite is largely driven by how quickly
'grep' can match through *every* file in the soruce tree (as
reported by 'git ls-tree').

The 'prohibit_doubled_word' test illustrates a more complex
check that uses perl. That runs a little more slowly but is
more flexible in what it checks for.

This style checking scheme is that same as that used by libvirt
and many other projects that historically used gnulib. Fortunately
the style check rules were easy to extract from gnulib, so libvirt
kept using them after droppping gnulib.

Daniel P. Berrangé (7):
  tests: introduce tree-wide code style checking
  misc: fix mixups of bool constants with int variables
  tests/style: check for mixups of bool constants with int variables
  misc: fix commonly doubled up words
  tests/style: check for commonly doubled up words
  misc: ensure qemu/osdep.h is included in all .c files
  tests/style: check qemu/osdep.h is included in all .c files

 block/linux-aio.c                      |   2 +-
 block/qcow2-bitmap.c                   |   8 +-
 block/vhdx-log.c                       |   2 +-
 bsd-user/arm/signal.c                  |   2 +
 bsd-user/arm/target_arch_cpu.c         |   3 +
 bsd-user/{elfcore.c => elfcore.c.inc}  |   0
 bsd-user/elfload.c                     |   2 +-
 bsd-user/freebsd/os-sys.c              |   2 +
 bsd-user/i386/signal.c                 |   2 +
 bsd-user/qemu.h                        |   1 -
 bsd-user/x86_64/signal.c               |   2 +
 contrib/plugins/cache.c                |   2 +-
 crypto/rsakey.c                        |   1 +
 disas/libvixl/vixl/invalset.h          |   2 +-
 docs/devel/qom.rst                     |   4 +-
 docs/interop/live-block-operations.rst |   4 +-
 docs/system/arm/cpu-features.rst       |   2 +-
 docs/system/devices/cxl.rst            |   2 +-
 docs/system/s390x/bootdevices.rst      |   2 +-
 docs/system/tls.rst                    |   2 +-
 docs/tools/qemu-pr-helper.rst          |   2 +-
 hw/core/clock.c                        |   2 +-
 hw/intc/arm_gicv3_redist.c             |   2 +-
 hw/misc/iotkit-secctl.c                |   2 +-
 hw/misc/iotkit-sysctl.c                |   4 +-
 hw/s390x/s390-ccw.c                    |   2 +-
 hw/usb/u2f.h                           |   2 +-
 hw/xtensa/sim.c                        |   4 +-
 include/hw/qdev-core.h                 |   2 +-
 include/user/safe-syscall.h            |   2 +-
 linux-user/i386/cpu_loop.c             |   2 +-
 meson.build                            |   3 +
 nbd/client.c                           |   4 +-
 pc-bios/s390-ccw/virtio-scsi.c         |   2 +-
 python/Makefile                        |   2 +-
 python/qemu/utils/__init__.py          |   2 +-
 qga/cutils.c                           |   2 +
 target/arm/translate.c                 |   2 +-
 target/i386/cpu-dump.c                 |   3 +-
 target/i386/cpu.c                      |   2 +-
 tcg/i386/tcg-target.c.inc              |   2 +-
 tests/Makefile.include                 |   3 +-
 tests/meson.build                      |  19 ++
 tests/qtest/microbit-test.c            |   4 +-
 tests/style-excludes.mak               |  33 +++
 tests/style-infra.mak                  | 265 +++++++++++++++++++++++++
 tests/style.mak                        |  60 ++++++
 tools/virtiofsd/fuse_virtio.c          |   2 +-
 ui/spice-display.c                     |   4 +-
 49 files changed, 441 insertions(+), 46 deletions(-)
 rename bsd-user/{elfcore.c => elfcore.c.inc} (100%)
 create mode 100644 tests/style-excludes.mak
 create mode 100644 tests/style-infra.mak
 create mode 100644 tests/style.mak

-- 
2.36.1


