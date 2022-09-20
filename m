Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD65BE570
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:14:47 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oac9E-0008Ro-Ol
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaY8-0000Se-4r; Tue, 20 Sep 2022 06:32:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaY4-0004lV-Bj; Tue, 20 Sep 2022 06:32:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso2004691pjm.5; 
 Tue, 20 Sep 2022 03:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RXO5DDO/Y9cztgXu+tQjNAdDe1mg0NE64fWstEgYTpo=;
 b=au1hKA7IsDt3IhzyRlLtgitvSEtBfYlUyJ+glJ6VHzmYzB2OYsyYA/dg8pEnSQimzD
 ItARv6xREbjlBiDemr4GqIsv20bhya7SeaIOyeQh0vEnK+ZU7G9pTbewGB/iY/IiGqc1
 uQ0s0z5lyFUYzo6KXhrYYlmP5SMu5Z3CKUkjFNCxe1OuwTI6oYSbiLqYz2Sf0QgWDNeE
 Ni2rKYSIMqTucJ/i+3s72Uu519yOv4o3cR6h3BuUsB1MJQc0DpZz/MoKnLEauJIninS8
 m0UvzPZjvOj2Mny004NHYq2zAEjSq7ni9LQKnotLqYZCMBuy+B47c+P6WQfo+/2115lR
 vWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RXO5DDO/Y9cztgXu+tQjNAdDe1mg0NE64fWstEgYTpo=;
 b=oN4T0QIDVTswzwg+0u+I45JLi/F/gJQ0m/yCP9HJViqJIXwi65TuOUSUQblcrRnDDr
 ylWxdO/F0XMTum0tCKNIhXqR8v0TdDAPrZZ8wntkd7CKKShgGT/sqqdLhQhlBGvv5pZc
 psOtnTkzj0hO6FmXJk+Vt0i2RCMrtum+80pKNkSQg4p9771OrkmUHfhy4I8HRO0kzqvn
 hdaptVMwrbDZzbSFU+5UrFoAV8J1yZDZBK3wV+IAalg84JnpIlk7dpwp79sQkXOtliB7
 p+9lk3kpysz1y++SmgUxezU0mrpDBoxPBRdz9vUv+Pt5FILE2qt1RM6qq4y7BS0xG3SP
 zhgQ==
X-Gm-Message-State: ACrzQf2wWO3tjo2KLILR+91GJunAFawB1bgEcNrK6Hwu/YZVkWrMXs8X
 GUu5TAmYhZNjj1VzqWTv5efQ62Skd6M=
X-Google-Smtp-Source: AMsMyM6bjaJ7R7QuwM+HGpleC2zShsFnSLm8DEe9HHKt3mILnttp3ivrHJd99ImCBAMYj5lk4lSQGQ==
X-Received: by 2002:a17:90b:35cf:b0:202:6f3d:53a7 with SMTP id
 nb15-20020a17090b35cf00b002026f3d53a7mr3252967pjb.63.1663669933444; 
 Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:13 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH v2 00/39] tests/qtest: Enable running qtest on Windows
Date: Tue, 20 Sep 2022 18:31:20 +0800
Message-Id: <20220920103159.1865256-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation to adding virtio-9p support on Windows, this series
enables running qtest on Windows, so that we can run the virtio-9p
tests on Windows to make sure it does not break accidently.

Changes in v2:
- new patch: "tests: Change to use g_mkdir()"
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"
- Use g_autofree to declare the variable
- Use g_dir_make_tmp(), g_file_open_tmp() when appropriate
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to skip only part of the virtio-net-test cases that require
  socketpair() intead of disabling all of them
- Introduce a new variable qtests_filter and add that to the
  qtests_ARCH variables
- Add a comment in the code to explain why test_qmp_oob test case
  is skipped on win32
- Replace signal by the semaphore on posix too
- Use __declspec(selectany) for the common weak symbol on Windows
- Introduce qemu_send_full() and use it
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call
- Change the place that sets IO redirection in the command line
- Drop ahci-test.c changes that are no longer needed
- Update commit message to include the use case why we should set
  FILE_SHARE_WRITE when openning the file for win32
- Change to a busy wait after migration is canceled
- new patch: "hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure"
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: Display meson test logs in the Windows CI
- new patch: "tests/qtest: Enable qtest build on Windows"
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

Bin Meng (30):
  tests: Change to use g_mkdir()
  tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
  block: Unify the get_tmp_filename() implementation
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests: Avoid using hardcoded /tmp in test cases
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir()
  hw/usb: dev-mtp: Use g_mkdir()
  tests/qtest: Skip running virtio-net-test cases that require
    socketpair() for win32
  tests/qtest: Build test-filter-{mirror,redirector} cases for posix
    only
  tests/qtest: qmp-test: Skip running test_qmp_oob for win32
  tests/qtest: libqtest: Exclude the *_fds APIs for win32
  tests/qtest: libqtest: Install signal handler via signal()
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: {ahci,ide}-test: Use relative path for temporary files
    for win32
  tests/qtest: bios-tables-test: Adapt the case for win32
  tests/qtest: migration-test: Disable IO redirection for win32
  tests/qtest: microbit-test: Fix socket access for win32
  tests/qtest: libqtest: Replace the call to close a socket with
    closesocket()
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Drop the unnecessary cast
  io/channel-watch: Fix socket watch on Windows
  tests/qtest: migration-test: Skip running some TLS cases for win32
  .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
  .gitlab-ci.d/windows.yml: Display meson test logs
  tests/qtest: Enable qtest build on Windows
  docs/devel: testing: Document writing portable test cases

Xuzhou Cheng (9):
  accel/qtest: Implement a portable qtest accelerator
  tests/qtest: libqtest: Adapt global_qtest declaration for win32
  tests/qtest: Use send/recv for socket communication
  tests/qtest: ide-test: Open file in binary mode
  tests/qtest: virtio-net-failover: Disable migration tests for win32
  chardev/char-file: Add FILE_SHARE_WRITE when openning the file for
    win32
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled
  hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
  hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure

 docs/devel/testing.rst                  |  30 +++++
 include/hw/core/cpu.h                   |   1 +
 include/qemu/sockets.h                  |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
 tests/qtest/libqtest-single.h           |   4 +
 tests/qtest/libqtest.h                  |   8 ++
 accel/dummy-cpus.c                      |  15 +--
 block.c                                 |  16 +--
 block/vvfat.c                           |   9 +-
 chardev/char-file.c                     |   4 +-
 fsdev/virtfs-proxy-helper.c             |   3 +-
 hw/pci-host/pnv_phb3.c                  |   1 +
 hw/pci-host/pnv_phb4.c                  |   1 +
 hw/ppc/spapr.c                          |   2 +-
 hw/usb/dev-mtp.c                        |   4 +-
 io/channel-watch.c                      |  12 +-
 semihosting/arm-compat-semi.c           |   3 +-
 softmmu/cpus.c                          |  10 +-
 tcg/tcg.c                               |   3 +-
 tests/migration/stress.c                |   3 +-
 tests/qtest/ahci-test.c                 |  36 ++++--
 tests/qtest/aspeed_smc-test.c           |   5 +-
 tests/qtest/bios-tables-test.c          |  12 +-
 tests/qtest/boot-serial-test.c          |   9 +-
 tests/qtest/cxl-test.c                  |  15 +--
 tests/qtest/fdc-test.c                  |   5 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
 tests/qtest/hd-geo-test.c               |  24 ++--
 tests/qtest/i440fx-test.c               |  53 +++-----
 tests/qtest/ide-test.c                  |  30 ++++-
 tests/qtest/libqmp.c                    |   5 +-
 tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
 tests/qtest/microbit-test.c             |  10 +-
 tests/qtest/migration-test.c            |  41 ++++++-
 tests/qtest/pflash-cfi02-test.c         |   8 +-
 tests/qtest/qmp-test.c                  |  13 +-
 tests/qtest/vhost-user-blk-test.c       |   3 +-
 tests/qtest/vhost-user-test.c           |   8 +-
 tests/qtest/virtio-blk-test.c           |   4 +-
 tests/qtest/virtio-net-failover.c       |   9 +-
 tests/qtest/virtio-net-test.c           |  13 +-
 tests/qtest/virtio-scsi-test.c          |   4 +-
 tests/unit/test-crypto-tlscredsx509.c   |   5 +-
 tests/unit/test-crypto-tlssession.c     |   7 +-
 tests/unit/test-image-locking.c         |   8 +-
 tests/unit/test-io-channel-tls.c        |   7 +-
 tests/unit/test-qga.c                   |   2 +-
 tests/vhost-user-bridge.c               |   3 +-
 util/osdep.c                            |  33 +++++
 util/qemu-sockets.c                     |   5 +-
 .gitlab-ci.d/windows.yml                |   8 +-
 accel/meson.build                       |   1 +
 accel/qtest/meson.build                 |   1 +
 tests/qtest/meson.build                 |  41 +++----
 54 files changed, 467 insertions(+), 257 deletions(-)

-- 
2.34.1


