Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519070084B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:43:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS4l-0007XS-HS; Fri, 12 May 2023 08:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4k-0007X4-4T
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4h-0006JN-3A
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pQ9G+0Q9LtZd7Z/x+VcjdThAy/+HKzkS7YLfxR3nd7Y=;
 b=ChYnvGxjENwxMstSQhWfbNSta8pGvyDYROjQWZu/HpMaT+WJxDoRacHGg16CWRt4K390l0
 q/xEjI44Yg+kkZebI7XREAdGNe9BJRx2qbx3XtEsoOhjuxFHMU4T+s0m451DwaLRYbyBqK
 PqY4aCr434O2Xs2mp9a3kJt8ltfiROc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-92l0xEXVNHuTfV89eEd3Lw-1; Fri, 12 May 2023 08:40:36 -0400
X-MC-Unique: 92l0xEXVNHuTfV89eEd3Lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86B2285A5A3;
 Fri, 12 May 2023 12:40:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB6F1121314;
 Fri, 12 May 2023 12:40:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/18] Allow qtests with --without-default-devices (part 1)
Date: Fri, 12 May 2023 14:40:15 +0200
Message-Id: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When configuring QEMU with --without-default-devices, many qtests
fail since they run QEMU without "-no-defaults", i.e. the QEMU
binary tries to instantiate a default VGA and a NIC device - which
fails when it has not been enabled in the config.

Here's now my attempt to fix these issues: The basic idea is to
use the default_display and the new default_nic setting in the
MachineClass to determine whether the default device is available
in the binary or not, and in the latter case skip the instantiation.
Some qtests also need some more check for optional devices on top,
but then it's possible to run "make check" for --without-default-devices
builds, too.

This series only tackles with x86 and the targets that are tested
in the "build-without-defaults" gitlab CI pipeline. If these changes
are acceptable, I can continue this cleanup for the other targets,
too.

Thomas Huth (18):
  hw/i386/Kconfig: ISAPC works fine without VGA_ISA
  softmmu/vl.c: Check for the availability of the VGA device before
    using it
  hw: Move the default NIC machine class setting from the x86 to the
    generic one
  softmmu/vl.c: Disable default NIC if it has not been compiled into the
    binary
  hw/ppc: Use MachineClass->default_nic in the ppc machines
  hw/s390x: Use MachineClass->default_nic in the s390x machine
  hw/sh4: Use MachineClass->default_nic in the sh4 r2d machine
  hw/char/parallel: Move TYPE_ISA_PARALLEL to the header file
  hw/i386: Ignore the default parallel port if it has not been compiled
    into QEMU
  hw/sparc64/sun4u: Use MachineClass->default_nic and
    MachineClass->no_parallel
  tests/qtest/readconfig-test: Check for the availability of USB
    controllers
  tests/qtest/usb-hcd-uhci-test: Skip test if UHCI controller is not
    available
  tests/qtest/cdrom-test: Fix the test to also work without optional
    devices
  tests/qtest/virtio-ccw-test: Remove superfluous tests
  tests/qtest: Check for the availability of virtio-ccw devices before
    using them
  tests/qtest/meson.build: Run the net filter tests only with default
    devices
  tests/qemu-iotests/172: Run QEMU with -vga none and -nic none
  .gitlab-ci.d/buildtest.yml: Run full "make check" with
    --without-default-devices

 include/hw/boards.h             |  1 +
 include/hw/char/parallel.h      |  2 ++
 include/hw/i386/pc.h            |  1 -
 hw/char/parallel-isa.c          |  2 +-
 hw/char/parallel.c              |  1 -
 hw/i386/pc.c                    |  3 ++-
 hw/i386/pc_piix.c               |  7 ++++--
 hw/i386/pc_q35.c                |  8 +++---
 hw/isa/isa-superio.c            |  3 ++-
 hw/ppc/e500.c                   |  3 ++-
 hw/ppc/e500plat.c               |  1 +
 hw/ppc/mac_newworld.c           |  4 ++-
 hw/ppc/mac_oldworld.c           |  4 ++-
 hw/ppc/mpc8544ds.c              |  1 +
 hw/ppc/ppc440_bamboo.c          |  4 ++-
 hw/ppc/prep.c                   |  4 ++-
 hw/s390x/s390-virtio-ccw.c      |  4 ++-
 hw/sh4/r2d.c                    |  4 ++-
 hw/sparc64/sun4u.c              | 11 ++++++---
 softmmu/vl.c                    | 20 ++++++++++++++-
 tests/qtest/cdrom-test.c        | 18 +++++++++++---
 tests/qtest/device-plug-test.c  |  9 ++++++-
 tests/qtest/readconfig-test.c   |  5 +++-
 tests/qtest/usb-hcd-uhci-test.c |  5 ++++
 tests/qtest/virtio-ccw-test.c   | 43 ++++++++++-----------------------
 .gitlab-ci.d/buildtest.yml      |  2 +-
 hw/i386/Kconfig                 |  2 +-
 tests/qemu-iotests/172          |  2 +-
 tests/qtest/meson.build         | 10 +++-----
 29 files changed, 118 insertions(+), 66 deletions(-)

-- 
2.31.1


