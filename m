Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CDD5EC11B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 13:23:10 +0200 (CEST)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8g9-0002FC-Rm
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 07:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QO-0002Gi-8D; Tue, 27 Sep 2022 07:06:52 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8QJ-0004lr-0P; Tue, 27 Sep 2022 07:06:52 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso9750980pjd.1; 
 Tue, 27 Sep 2022 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=4VqkvBcmyJ1SDADHumwlbH8XpmBtUgxcNWus4EgsnaE=;
 b=Dy8ko2gRmXX/twTFi8cm1AmXNwN18wtLJAJBq74Iu4WWUgsRFhlM9du+gW9U5z4jJv
 zXUwJCIm7tkWThuTn5HVE2BUz7Iq/uiVUK5SQaQGiXjOaV7AXE40Ws0ay3AtURVpdV9c
 +gMr7tzeDTWLyij04I6R/drHzBcKiqbq4g0g8OVV3Fd18NF3D1DruLIR0vSUf3repOTj
 2z0uYHbtSqdwCFpVMHqUqtmW7j2yYTDFVP85h/FpFgeeruDxOsLifjOVZF9LTfNrwNaG
 m4/6HXgVjqqkbUnCfWZt1qkWcFAHeZ93zGfEUkGbubR90DLjeBBUFnrtwvFKpMLI4g8V
 Ydqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=4VqkvBcmyJ1SDADHumwlbH8XpmBtUgxcNWus4EgsnaE=;
 b=StEsZBXNYcpdwqnOk5LswXZdVz9rdOLErvNdE4/nMNLboMzXg94aIeqxmmG1VQEnKM
 rnQke7CP7ErXUjVNcENcVEV2M6+s7Qb7C0tFwkIF1iRkwUI9qhSZaTbu8FvIPAha+HQ+
 2vwHM6AUHNLamxdI6Bgk1+o/FovYKU6TrYYUxVZWlGqoY9XEVuMAo80ItWUAbqaSu4IQ
 m4AWsdpXZ0mAVkJci0/+JBJilUPhcHXxEwLytzyABbEZu9qHpN0s5ZJnjnhLnv18hFXF
 ktCKFsr+XP3trn5o0PZHDJiYQCymR1An1eTCddbN848f6wgNk1mmnpvoId8EfIeJGiHl
 q1dA==
X-Gm-Message-State: ACrzQf0AURk0zpSmkl+aGTiUx4fFGowOGadLg57gvc5zlhhFvPIQSSzU
 ABCn9yvTBlOprjx2QIWMet4d4j3S6Ig=
X-Google-Smtp-Source: AMsMyM50wdfkzZCJp2bwuvJabxQQSL7wNpCOUgLIaRvbkQFU9SeIcQywVaquPdnSOCgL68ImN24uhg==
X-Received: by 2002:a17:902:76c7:b0:178:ab0a:19af with SMTP id
 j7-20020a17090276c700b00178ab0a19afmr26449696plt.164.1664276804096; 
 Tue, 27 Sep 2022 04:06:44 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:06:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
Date: Tue, 27 Sep 2022 19:05:38 +0800
Message-Id: <20220927110632.1973965-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Changes in v4:
- Do not use g_autofree and g_steal_pointer
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration
- Replace the whole block with a g_assert_no_error()
- Replace the error reporting with g_assert_no_error()
- Update error reporting
- Move the new text section after the "QTest" section instead
- Use plural in both cases: "on POSIX hosts as well as Windows hosts"
- Use "The following list shows some best practices"
- Fix typo of delimiter
- New patch: "tests/qtest: boot-serial-test: Close the serial file before starting QEMU"
- Drop patch: "chardev/char-file: Add FILE_SHARE_WRITE when openning the file for win32"

Changes in v3:
- Remove unnecessary "error = NULL" statements
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Use g_steal_pointer() in create_test_img()
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Ensure g_autofree variable is initialized
- Split to a separate patch
- Split to a separate patch
- Add a usleep(1) in the busy wait loop
- Drop the host test
- Drop patch: "tests: Change to use g_mkdir()"
- Drop patch: "block: Unify the get_tmp_filename() implementation",
  and send it as a separate patch

Changes in v2:
- new patch: "tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable"
- Use g_autofree to declare the variable
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
- Drop ahci-test.c changes that are no longer needed
- Change the place that sets IO redirection in the command line
- Change to a busy wait after migration is canceled
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: Display meson test logs in the Windows CI
- new patch: "tests/qtest: Enable qtest build on Windows"
- Minor wording changes
- Drop patches that were already applied in the mainline
- Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
- Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
- Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"

Bin Meng (48):
  tests/qtest: i440fx-test: Rewrite create_blob_file() to be portable
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests/qtest: ahci-test: Avoid using hardcoded /tmp
  tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp
  tests/qtest: boot-serial-test: Avoid using hardcoded /tmp
  tests/qtest: cxl-test: Avoid using hardcoded /tmp
  tests/qtest: fdc-test: Avoid using hardcoded /tmp
  tests/qtest: generic_fuzz: Avoid using hardcoded /tmp
  tests/qtest: virtio_blk_fuzz: Avoid using hardcoded /tmp
  tests/qtest: hd-geo-test: Avoid using hardcoded /tmp
  tests/qtest: ide-test: Avoid using hardcoded /tmp
  tests/qtest: migration-test: Avoid using hardcoded /tmp
  tests/qtest: pflash-cfi02-test: Avoid using hardcoded /tmp
  tests/qtest: qmp-test: Avoid using hardcoded /tmp
  tests/qtest: vhost-user-blk-test: Avoid using hardcoded /tmp
  tests/qtest: vhost-user-test: Avoid using hardcoded /tmp
  tests/qtest: virtio-blk-test: Avoid using hardcoded /tmp
  tests/qtest: virtio-scsi-test: Avoid using hardcoded /tmp
  tests/qtest: libqtest: Avoid using hardcoded /tmp
  tests/unit: test-image-locking: Avoid using hardcoded /tmp
  tests/unit: test-qga: Avoid using hardcoded /tmp
  tests: vhost-user-bridge: Avoid using hardcoded /tmp
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
  tests/qtest: boot-serial-test: Close the serial file before starting
    QEMU
  tests/qtest: microbit-test: Fix socket access for win32
  tests/qtest: migration-test: Disable IO redirection for win32
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

Xuzhou Cheng (6):
  accel/qtest: Implement a portable qtest accelerator
  tests/qtest: libqtest: Adapt global_qtest declaration for win32
  tests/qtest: Use send/recv for socket communication
  tests/qtest: ide-test: Open file in binary mode
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled
  tests/qtest: virtio-net-failover: Disable migration tests for win32

 docs/devel/testing.rst                  |  30 +++++
 include/hw/core/cpu.h                   |   1 +
 include/qemu/sockets.h                  |   2 +
 tests/qtest/fuzz/generic_fuzz_configs.h |   4 +-
 tests/qtest/libqtest-single.h           |   4 +
 tests/qtest/libqtest.h                  |   8 ++
 accel/dummy-cpus.c                      |  15 +--
 block/vvfat.c                           |   9 +-
 fsdev/virtfs-proxy-helper.c             |   3 +-
 hw/usb/dev-mtp.c                        |   4 +-
 io/channel-watch.c                      |  12 +-
 semihosting/arm-compat-semi.c           |   3 +-
 softmmu/cpus.c                          |  10 +-
 tcg/tcg.c                               |   3 +-
 tests/qtest/ahci-test.c                 |  36 ++++--
 tests/qtest/aspeed_smc-test.c           |   5 +-
 tests/qtest/bios-tables-test.c          |  12 +-
 tests/qtest/boot-serial-test.c          |  11 +-
 tests/qtest/cxl-test.c                  |  15 +--
 tests/qtest/fdc-test.c                  |   5 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c      |   4 +-
 tests/qtest/hd-geo-test.c               |  24 ++--
 tests/qtest/i440fx-test.c               |  54 +++-----
 tests/qtest/ide-test.c                  |  30 ++++-
 tests/qtest/libqmp.c                    |   5 +-
 tests/qtest/libqtest.c                  | 157 ++++++++++++++++++++----
 tests/qtest/microbit-test.c             |  10 +-
 tests/qtest/migration-test.c            |  38 +++++-
 tests/qtest/pflash-cfi02-test.c         |  15 ++-
 tests/qtest/qmp-test.c                  |  17 ++-
 tests/qtest/vhost-user-blk-test.c       |   3 +-
 tests/qtest/vhost-user-test.c           |  10 +-
 tests/qtest/virtio-blk-test.c           |   4 +-
 tests/qtest/virtio-net-failover.c       |   9 +-
 tests/qtest/virtio-net-test.c           |  13 +-
 tests/qtest/virtio-scsi-test.c          |   4 +-
 tests/unit/test-image-locking.c         |   8 +-
 tests/unit/test-qga.c                   |   2 +-
 tests/vhost-user-bridge.c               |   3 +-
 util/osdep.c                            |  33 +++++
 util/qemu-sockets.c                     |   5 +-
 .gitlab-ci.d/windows.yml                |   8 +-
 accel/meson.build                       |   1 +
 accel/qtest/meson.build                 |   1 +
 tests/qtest/meson.build                 |  42 +++----
 45 files changed, 452 insertions(+), 240 deletions(-)

-- 
2.34.1


