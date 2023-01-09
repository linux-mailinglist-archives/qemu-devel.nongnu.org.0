Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913C6628F5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEt6c-00086Y-AD; Mon, 09 Jan 2023 09:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6R-00080V-6b
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEt6P-0008R7-2B
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673274376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D2gJnAHvltxhzDn2fMogrqy789oysQlKoUQv/2z/cLk=;
 b=gmIAlkxI5nKyhs/t5eRMPwSRWXn586p51Gtbik82kvwsH0fq/kx0T+aaQlgQiGZJu2pQ0B
 +3GJnyKLzDmuS4idA4W33MjR6pIMCSI+9i0ke8TSlzQK/KJDg7lEANZXvropbePHpAp7YT
 6MunHZEzQm7LhYtKGJXtIUZcX1GjxvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-0K-ynJ0WNbCo5YF_o93NxQ-1; Mon, 09 Jan 2023 09:26:13 -0500
X-MC-Unique: 0K-ynJ0WNbCo5YF_o93NxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3678811E9C;
 Mon,  9 Jan 2023 14:26:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AABE24078903;
 Mon,  9 Jan 2023 14:26:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nikita Ivanov <nivanov@cloudlinux.com>
Subject: [PULL v2 00/15] First batch of s390x, qtests and misc fixes in 2023
Date: Mon,  9 Jan 2023 15:25:58 +0100
Message-Id: <20230109142604.506940-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The following changes since commit 528d9f33cad5245c1099d77084c78bb2244d5143:

  Merge tag 'pull-tcg-20230106' of https://gitlab.com/rth7680/qemu into staging (2023-01-08 11:23:17 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-09

for you to fetch changes up to 6f997b8964188c155240380efdf3b1d7ec41c882:

  .gitlab-ci.d/windows: Do not run the qtests in the msys2-32bit job (2023-01-09 13:50:47 +0100)

----------------------------------------------------------------
* s390x header clean-ups from Philippe
* Rework and improvements of the EINTR handling by Nikita
* Deprecate the -no-hpet command line option
* Disable the qtests in the 32-bit Windows CI job again
* Some other misc fixes here and there

v2: Added patch to use "hpet=off" instead of "-no-hpet" in qtests

----------------------------------------------------------------
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

Thomas Huth (5):
      MAINTAINERS: Add MIPS-related docs and configs to the MIPS architecture section
      tests/qtest/bios-tables-test: Replace -no-hpet with hpet=off machine parameter
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
 tests/qtest/bios-tables-test.c                     | 22 ++++++++-----
 tests/qtest/libqtest.c                             |  6 ++--
 tests/qtest/readconfig-test.c                      |  6 ++--
 tests/vhost-user-bridge.c                          |  4 +--
 util/main-loop.c                                   |  4 +--
 util/osdep.c                                       |  4 +--
 util/vfio-helpers.c                                | 12 +++----
 .gitlab-ci.d/windows.yml                           |  3 +-
 MAINTAINERS                                        |  2 ++
 qemu-options.hx                                    |  2 +-
 tests/qemu-iotests/tests/stream-under-throttle     |  2 ++
 tests/vm/basevm.py                                 |  3 +-
 39 files changed, 122 insertions(+), 123 deletions(-)
 rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)


