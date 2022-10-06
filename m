Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F95F6A90
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:27:11 +0200 (CEST)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSm5-0002Dl-DU
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXL-0002bw-O8; Thu, 06 Oct 2022 11:11:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXJ-0004YZ-VD; Thu, 06 Oct 2022 11:11:47 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so2139101pgb.4;
 Thu, 06 Oct 2022 08:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z6o+30SmN2bco3CjzBwlafSMtQ2m68d1i+due7WP7eU=;
 b=j9YvNGBdhswSvkESLCAeqzKNaKfhGWs/BRcaxqrtoOjOPBKpoXSNy4DKYBB5SEUSXj
 InOEakXznMq+ExyZNqt9vKjg66mZCNmYXj65PuMsdNOnbDsPYna2pbCrqrPvEfXnhWoj
 YgRmKwfXldmD95Phevox5JqqvnqeR/1X2MLbDYuvUVF+pHs48oZ23VL7IMriiOsxNmwF
 bYSqu5s0LqJRr1NDRPwrQF2e/AbGf5XzWp5mSrOhXKweq/ESq5Ol92WSz9F9LHl0IiYS
 9gzgxDwAzn/iIoKZQ70Nu/UgHOe+DKdxacp4h2ifWYy2U99PDKet8bNMpVcqiS4X2lZW
 Dd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z6o+30SmN2bco3CjzBwlafSMtQ2m68d1i+due7WP7eU=;
 b=GyfHKzzChvsjbUQpVeR0CkIA9VDyB3P5j7xgk7/oVFgTSYzBuinyU/SdQ41ldAgROR
 GbtjGK95daSc9AdFvIeeflynda7cL6WVfdB+2GoamSeDPxpXt6zvqn8S6Va7gcDYjiS1
 a0ovo2naseomzdectdAyDlyvvtcJoKgYwlHB/ORZohMDcDSxVSlOd1pgika+4FfkGk46
 0SRB12pvEGgZ3fcTASnAB0VMhwBlLUo9fXzcGQe9R0JYsaSQWz+b/iGLzoHPm7O1OrkY
 z9eVNks2xqLSavXUtSctaTqWkIlayrMkeGVvxeMXx8MLS+hUTGZQCmiX5wpPkmkTGq2M
 zF9w==
X-Gm-Message-State: ACrzQf0ojbLOkicZCT913JTLEnvrr702ttxGmNFHPLhmcpdLRWcUv/V8
 uJM9pDNugQBGQOd6ig1SvIXa1VGwgt8=
X-Google-Smtp-Source: AMsMyM4RextZm9HdkkAODR7vvD7uPtFHyhQblGpXCVwwwn4cFBXfwd/NXH7MG8DN60mvqeYvzsBnBg==
X-Received: by 2002:a63:9143:0:b0:458:c565:6518 with SMTP id
 l64-20020a639143000000b00458c5656518mr305151pge.219.1665069103871; 
 Thu, 06 Oct 2022 08:11:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Subject: [PATCH 00/18] tests/qtest: Enable running qtest on Windows
Date: Thu,  6 Oct 2022 23:11:17 +0800
Message-Id: <20221006151135.2078908-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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

Changes in v5:
- Rebase on qemu/master
- Drop patches that are already merged
- Use g_autoptr(GError)
- Restore to v1 version which does not touch the posix implementation
- Replace sighandler_t with its actual definition, since it is not
  available on BSD hosts

Changes in v4:
- Update the error reporting by using the GError "error" argument
  of g_dir_make_tmp()
- Remove the const from tmpfs declaration

Changes in v3:
- Split to a separate patch
- Add a usleep(1) in the busy wait loop
- Drop the host test

Changes in v2:
- Use g_autofree to declare the variable
- Change to use g_mkdir()
- Change to use g_mkdir()
- Change to use g_mkdir()
- Introduce qemu_send_full() and use it
- Move the enabling of building qtests on Windows to a separate
  patch to keep bisectablity
- Call socket_init() unconditionally
- Add a missing CloseHandle() call
- Change to a busy wait after migration is canceled
- new patch: "io/channel-watch: Drop the unnecessary cast"
- Change the timeout limit to 90 minutes
- new patch: "tests/qtest: Enable qtest build on Windows"

Bin Meng (15):
  semihosting/arm-compat-semi: Avoid using hardcoded /tmp
  tcg: Avoid using hardcoded /tmp
  util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
    temporary files
  tests/qtest: migration-test: Avoid using hardcoded /tmp
  block/vvfat: Unify the mkdir() call
  fsdev/virtfs-proxy-helper: Use g_mkdir()
  hw/usb: dev-mtp: Use g_mkdir()
  tests/qtest: libqtest: Install signal handler via signal()
  tests/qtest: Support libqtest to build and run on Windows
  tests/qtest: libqtest: Correct the timeout unit of blocking receive
    calls for win32
  io/channel-watch: Drop a superfluous '#ifdef WIN32'
  io/channel-watch: Drop the unnecessary cast
  io/channel-watch: Fix socket watch on Windows
  .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
  tests/qtest: Enable qtest build on Windows

Xuzhou Cheng (3):
  accel/qtest: Support qtest accelerator for Windows
  tests/qtest: Use send/recv for socket communication
  tests/qtest: migration-test: Make sure QEMU process "to" exited after
    migration is canceled

 include/hw/core/cpu.h         |   1 +
 include/qemu/sockets.h        |   2 +
 accel/dummy-cpus.c            |  14 +++-
 block/vvfat.c                 |   9 +--
 fsdev/virtfs-proxy-helper.c   |   3 +-
 hw/usb/dev-mtp.c              |   4 +-
 io/channel-watch.c            |  12 +---
 semihosting/arm-compat-semi.c |   3 +-
 softmmu/cpus.c                |   9 +--
 tcg/tcg.c                     |   3 +-
 tests/qtest/libqmp.c          |   5 +-
 tests/qtest/libqtest.c        | 124 +++++++++++++++++++++++++++++-----
 tests/qtest/migration-test.c  |  14 ++--
 util/osdep.c                  |  33 +++++++++
 util/qemu-sockets.c           |   5 +-
 .gitlab-ci.d/windows.yml      |   4 +-
 accel/meson.build             |   1 +
 accel/qtest/meson.build       |   1 +
 tests/qtest/meson.build       |   6 --
 19 files changed, 194 insertions(+), 59 deletions(-)

-- 
2.34.1


