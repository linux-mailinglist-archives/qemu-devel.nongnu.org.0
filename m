Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF365FD0D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:48:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDi68-0002XB-TK; Fri, 06 Jan 2023 03:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi62-0002W8-2S
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDi5z-0005UJ-Ji
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672993738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1n3SHT+BVGFhbnK2fJk4GXPdr9qwh559lFRerfERA3c=;
 b=QURrVDItYsPYp1RvH91WwLFM9dVSC3j4D1GXMuY2wYY+JatcDWuY7oGwR7d50uWXZZ2uhi
 4sXUv/Zkw0f8wz+OjnxU+0/xMBMKp2mkHF5kMivLMLqsBkVVrpur2oYmA36NF0o5g6uaqD
 FgPA0Cw+UeM52tSkkBsCze0Mvya0Zjk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-4jEKfqyZPuKSi6C2-vmnBg-1; Fri, 06 Jan 2023 03:28:57 -0500
X-MC-Unique: 4jEKfqyZPuKSi6C2-vmnBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5B273815F62;
 Fri,  6 Jan 2023 08:28:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA090492B06;
 Fri,  6 Jan 2023 08:28:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL 00/15] First batch of s390x, qtests and misc fixes in 2023
Date: Fri,  6 Jan 2023 09:28:38 +0100
Message-Id: <20230106082853.31787-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Peter!

The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:

  .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-06

for you to fetch changes up to 975f619662a46cb5dc7a3b17b84a1b540fb7df5c:

  .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-05 21:50:21 +0100)

----------------------------------------------------------------
* s390x header clean-ups from Philippe
* Rework and improvements of the EINTR handling by Nikita
* Deprecate the -no-hpet command line option
* Disable the qtests in the 32-bit Windows CI job again
* Some other misc fixes here and there

----------------------------------------------------------------
Alessandro Di Federico (1):
      Update scripts/meson-buildoptions.sh

Christian Borntraeger (1):
      qemu-iotests/stream-under-throttle: do not shutdown QEMU

Marc-André Lureau (1):
      tests/readconfig: spice doesn't support unix socket on windows yet

Nikita Ivanov (2):
      Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
      error handling: Use RETRY_ON_EINTR() macro where applicable

Philippe Mathieu-Daudé (6):
      tests/vm: Update get_default_jobs() to work on non-x86_64 non-KVM hosts
      exec/memory: Expose memory_region_access_valid()
      hw/s390x/pv: Restrict Protected Virtualization to sysemu
      target/s390x/tcg/misc_helper: Remove unused "memory.h" include
      target/s390x/tcg/excp_helper: Restrict system headers to sysemu
      target/s390x: Restrict sysemu/reset.h to system emulation

Thomas Huth (4):
      MAINTAINERS: Add MIPS-related docs and configs to the MIPS architecture section
      i386: Deprecate the -no-hpet QEMU command line option
      docs/interop: Change the vnc-ledstate-Pseudo-encoding doc into .rst
      .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job

 docs/about/deprecated.rst                          |  6 ++++
 docs/interop/index.rst                             |  1 +
 ...coding.txt => vnc-ledstate-pseudo-encoding.rst} |  0
 include/exec/memory-internal.h                     |  4 ---
 include/exec/memory.h                              |  4 +++
 include/qemu/osdep.h                               |  8 ++++-
 block/file-posix.c                                 | 37 ++++++++++------------
 chardev/char-fd.c                                  |  2 +-
 chardev/char-pipe.c                                |  8 +++--
 chardev/char-pty.c                                 |  4 +--
 hw/9pfs/9p-local.c                                 |  8 ++---
 hw/s390x/s390-pci-inst.c                           |  2 +-
 net/l2tpv3.c                                       | 17 +++-------
 net/socket.c                                       | 16 ++++------
 net/tap-bsd.c                                      |  6 ++--
 net/tap-linux.c                                    |  2 +-
 net/tap-solaris.c                                  |  8 ++---
 net/tap.c                                          | 10 ++----
 os-posix.c                                         |  2 +-
 qga/commands-posix.c                               |  4 +--
 semihosting/syscalls.c                             |  4 +--
 softmmu/vl.c                                       |  1 +
 target/s390x/cpu.c                                 |  4 ++-
 target/s390x/cpu_features.c                        |  4 +++
 target/s390x/cpu_models.c                          |  4 ++-
 target/s390x/tcg/excp_helper.c                     |  8 ++---
 target/s390x/tcg/misc_helper.c                     |  1 -
 tests/qtest/libqtest.c                             |  6 ++--
 tests/qtest/readconfig-test.c                      |  6 ++--
 tests/vhost-user-bridge.c                          |  4 +--
 util/main-loop.c                                   |  4 +--
 util/osdep.c                                       |  4 +--
 util/vfio-helpers.c                                | 12 +++----
 .gitlab-ci.d/windows.yml                           |  3 +-
 MAINTAINERS                                        |  2 ++
 qemu-options.hx                                    |  2 +-
 scripts/meson-buildoptions.sh                      | 18 +++++++----
 tests/qemu-iotests/tests/stream-under-throttle     |  2 ++
 tests/vm/basevm.py                                 |  3 +-
 39 files changed, 120 insertions(+), 121 deletions(-)
 rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)


