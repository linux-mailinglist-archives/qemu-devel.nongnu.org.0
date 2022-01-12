Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D516748C722
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:22:36 +0100 (CET)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fSN-0003tq-D9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n7eTo-0008NE-Kt
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:20:01 -0500
Received: from [2a00:1450:4864:20::530] (port=45047
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n7eTl-0006jp-LN
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:19:59 -0500
Received: by mail-ed1-x530.google.com with SMTP id w16so10518266edc.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 06:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/V4y+J/3npg0My06vqdr8PG/yW1GNB0pYxP8WeN9Rd8=;
 b=eDUIbtzFjrJbUogrj/qbhNjcdloLfOcVFy75/m/ppq1do/8xemxy3b7vZTFBYzSBd5
 we4cyrrTeHW+8d2vLsqHHB3Op27J5497eAu801ePYRFhU9htz8btof0qfKHozFCFyKVC
 GvbpzB917Y0K/raM4IVU+KuvWhL57qqOckNuiiQAfwmRIYsBPeDbHXJTh+j9JVnbsn91
 v7ZqlrQU5sGjMyfa/gTp6iVyDJEl44rB3VE7aAsSCjSORw4OxFCCyBE3dgscxxU0/q2+
 YuHu+n9yetRvbwefbywxDiAEC/ck0F6Ncxvt+VF3GklXuBWZZeev8z2sS1rvZ5XUfxpF
 wzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/V4y+J/3npg0My06vqdr8PG/yW1GNB0pYxP8WeN9Rd8=;
 b=trBKAvYQW49jAJOwwph+om2OWQMtLxqH9W9NfkTtBA1++oo8LkRWTtw2OLXgaryZDB
 d+DHdEqetGg/hhBnh66xcBWqXWGzrJfBjeukKl8TyJxncsTJaNiG3OB5vc0M65d7RuLT
 gX6Ah2UmOy9gD/7HUZEnYdWya0bEtbDZ+HgiT8oW3B3cSI1B5WEE1DO+V+EP5iwsoUfB
 jAJul76YAuCIqQ2IBf42gdgNnd2vfgnwzpeE7h6amlO/deHKDsEaBHJ4KtHPIkP3Btfw
 4Wf85MjCet6XnWsgj+zTjlNzz8JR5Af57h9kIa8+d/+SLMW0By0dKkFraK+m+jp5AMQv
 OzkA==
X-Gm-Message-State: AOAM530XY/WPfyM8bZXAu/+G5x+snSkFr0xLu973hADQxZ6NdBHNj/tz
 rwXD7b5JG9jKh6txGxVt+oHoKQCaeus=
X-Google-Smtp-Source: ABdhPJzXj4UmyQ9D+jfCEc/DZDmB0yOMDYNNsf/DySmVWrDpR4F2C0VkBRCPE56AWx29U3+hRw4X4w==
X-Received: by 2002:a17:907:7245:: with SMTP id
 ds5mr7990762ejc.155.1641997195274; 
 Wed, 12 Jan 2022 06:19:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x20sm6137893edd.28.2022.01.12.06.19.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 06:19:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v5 00/18] Build system and KVM changes for 2021-12-23
Date: Wed, 12 Jan 2022 15:19:52 +0100
Message-Id: <20220112141953.59545-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit b37778b840f6dc6d1bbaf0e8e0641b3d48ad77c5:

  linux-user: Fix clang warning for nios2-linux-user code (2022-01-12 09:22:01 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9d30c78c7d3b994825cbe63fa277279ae3ef4248:

  meson: reenable filemonitor-inotify compilation (2022-01-12 14:09:06 +0100)

----------------------------------------------------------------
* configure and meson cleanups
* KVM_GET/SET_SREGS2 support for x86

----------------------------------------------------------------
v4->v5: remove --enable/disable-xfsctl

Maxim Levitsky (1):
      KVM: use KVM_{GET|SET}_SREGS2 when supported.

Paolo Bonzini (14):
      meson: reuse common_user_inc when building files specific to user-mode emulators
      user: move common-user includes to a subdirectory of {bsd,linux}-user/
      meson: cleanup common-user/ build
      configure: simplify creation of plugin symbol list
      configure: do not set bsd_user/linux_user early
      configure, makefile: remove traces of really old files
      configure: parse --enable/--disable-strip automatically, flip default
      configure: move non-command-line variables away from command-line parsing section
      meson: build contrib/ executables after generated headers
      configure, meson: move config-poison.h to meson
      meson: add comments in the target-specific flags section
      KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS
      configure: do not create roms/seabios/config.mak if SeaBIOS not present
      meson: build all modules by default

Philippe Mathieu-Daudé (1):
      tests/tcg: Fix target-specific Makefile variables path for user-mode

Thomas Huth (1):
      block/file-posix: Simplify the XFS_IOC_DIOINFO handling

Volker Rümelin (1):
      meson: reenable filemonitor-inotify compilation

 Makefile                                           |  11 +-
 block/file-posix.c                                 |  37 ++--
 bsd-user/{ => include}/special-errno.h             |   0
 bsd-user/meson.build                               |   2 +-
 common-user/meson.build                            |   2 +-
 configure                                          | 189 ++++-----------------
 contrib/elf2dmp/meson.build                        |   2 +-
 contrib/ivshmem-client/meson.build                 |   2 +-
 contrib/ivshmem-server/meson.build                 |   2 +-
 contrib/rdmacm-mux/meson.build                     |   2 +-
 .../{ => include}/host/aarch64/host-signal.h       |   0
 linux-user/{ => include}/host/alpha/host-signal.h  |   0
 linux-user/{ => include}/host/arm/host-signal.h    |   0
 linux-user/{ => include}/host/i386/host-signal.h   |   0
 .../{ => include}/host/loongarch64/host-signal.h   |   0
 linux-user/{ => include}/host/mips/host-signal.h   |   0
 linux-user/{ => include}/host/ppc/host-signal.h    |   0
 linux-user/{ => include}/host/ppc64/host-signal.h  |   0
 linux-user/{ => include}/host/riscv/host-signal.h  |   0
 linux-user/{ => include}/host/s390/host-signal.h   |   0
 linux-user/{ => include}/host/s390x/host-signal.h  |   0
 linux-user/{ => include}/host/sparc/host-signal.h  |   0
 .../{ => include}/host/sparc64/host-signal.h       |   0
 linux-user/{ => include}/host/x32/host-signal.h    |   0
 linux-user/{ => include}/host/x86_64/host-signal.h |   0
 linux-user/{ => include}/special-errno.h           |   0
 linux-user/meson.build                             |   4 +-
 meson.build                                        |  37 ++--
 pc-bios/s390-ccw/Makefile                          |   2 -
 plugins/meson.build                                |  13 +-
 scripts/ci/org.centos/stream/8/x86_64/configure    |   1 -
 scripts/coverity-scan/run-coverity-scan            |   2 +-
 scripts/make-config-poison.sh                      |  16 ++
 scripts/meson-buildoptions.py                      |  21 ++-
 scripts/meson-buildoptions.sh                      |   3 +
 target/i386/cpu.h                                  |   3 +
 target/i386/kvm/kvm.c                              | 130 ++++++++++++--
 target/i386/machine.c                              |  29 ++++
 tests/qtest/meson.build                            |   3 +-
 tests/tcg/Makefile.target                          |   2 +-
 tests/unit/meson.build                             |   2 +-
 util/meson.build                                   |   7 +-
 42 files changed, 276 insertions(+), 248 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/loongarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)
 create mode 100755 scripts/make-config-poison.sh
-- 
2.33.1


