Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A89C587A18
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:52:54 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIoa5-0006o4-Gq
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXZ-0001GZ-ES
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oIoXW-0002Mq-TC
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 05:50:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m13so13215975wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/iVSlryBcIFJYTVHbt8acqRubtZNUH5T6t4it9k3us0=;
 b=PevjTsWB95tk5SML60FrPT2IpO4eeVKSnpF0Vxn8Yj4XEZEZrkrDdhaYMgH1ONG0tS
 HtTGvbDRn5G0jS/sG9q6YGXI6CaE7KoeDokoMv2myEoA1HG2/R5JZaGKse18uW9j9w+0
 q5AOnyfNlwkYR29KzHeuJrzm6HsxHJzoDWxqvmj8m9+86T9J4VBEY1ejQeZQvk6DOn2c
 dRfrZWXrhaG0sCyuHoN1LpRGYnD7sn3C8mOgXj6k0/PZ5nZAa3jIyVm00Q9m6+JoT3fY
 1gH80TkIP0TJwNvWSCaPk03m+PFyrucbmtuOPlqC+Z+KH5yKUVOJ13KFhKeDV9dEMZHB
 alYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/iVSlryBcIFJYTVHbt8acqRubtZNUH5T6t4it9k3us0=;
 b=QpDLzXjVW7EabizQ6RKMuBJXm5wexW7V/dTpHdN2L58SytDY6Woh7m2S6n07s8KH1t
 J6B+GQ4mF+pNh9BAXvYY4YYVYzI7qoL8VHd0alDFUAUVMaw3LugrANQ2uhaHrlD3PLw1
 doFhZreXFr8z+QKFD7RQ+pZ/4qkZcatrTAxGD1VYU8le9ggXq4Xj3A0nuq5R/hZNY3KB
 B5PwhQZtE+NXEiWWNYsCg8xL36+1lABhv9rr+WgJ4KUW4xVqPI4Y9xMqMBPXr+F5b29X
 DIeyWzBvwjODXcE2AqdljRLvRn1onYTvNRKa/RvnOIEZg7OPSMuMEfRPeYXeY2JwnDQF
 E2Sw==
X-Gm-Message-State: ACgBeo3Hazqj6mjox3UrXKnG8SKrRfuGjOnpANiRAZ5V2Y2+QPJJcT1N
 CXfqjUlGNhm8S/XaFwb/Dfgamw==
X-Google-Smtp-Source: AA6agR6Cp9LTxYFVSCjS303IzpPZoTl+gOr3gfYvyp3jMPV7F4Pdd+6008goTJngowUW8xv7P3tciA==
X-Received: by 2002:a5d:6b09:0:b0:21e:2eb6:2d03 with SMTP id
 v9-20020a5d6b09000000b0021e2eb62d03mr12297441wrw.684.1659433812632; 
 Tue, 02 Aug 2022 02:50:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056000022500b0021ee0e233d9sm14408144wrz.96.2022.08.02.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 02:50:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B40F61FFB7;
 Tue,  2 Aug 2022 10:50:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 for 7.2 00/22] virtio-gpio and various virtio cleanups
Date: Tue,  2 Aug 2022 10:49:48 +0100
Message-Id: <20220802095010.3330793-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is an update to the previous series which fixes the last few
niggling CI failures I was seeing.

   Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
   Date: Tue, 26 Jul 2022 20:21:29 +0100
   Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>

The CI failures were tricky to track down because they didn't occur
locally but after patching to dump backtraces they all seem to involve
updates to virtio_set_status() as the machine was torn down. I think
patch that switches all users to use virtio_device_started() along
with consistent checking of vhost_dev->started stops this from
happening. The clean-up seems worthwhile in reducing boilerplate
anyway.

The following patches still need review:

  - tests/qtest: enable tests for virtio-gpio
  - tests/qtest: add a get_features op to vhost-user-test
  - tests/qtest: implement stub for VHOST_USER_GET_CONFIG
  - tests/qtest: add assert to catch bad features
  - tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
  - tests/qtest: catch unhandled vhost-user messages
  - tests/qtest: use qos_printf instead of g_test_message
  - tests/qtest: pass stdout/stderr down to subtests
  - hw/virtio: move vhd->started check into helper and add FIXME
  - hw/virtio: move vm_running check to virtio_device_started
  - hw/virtio: add some vhost-user trace events
  - hw/virtio: log potentially buggy guest drivers
  - hw/virtio: fix some coding style issues
  - include/hw: document vhost_dev feature life-cycle
  - include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
  - hw/virtio: fix vhost_user_read tracepoint
  - hw/virtio: handle un-configured shutdown in virtio-pci
  - hw/virtio: gracefully handle unset vhost_dev vdev
  - hw/virtio: incorporate backend features in features


Alex Bennée (20):
  hw/virtio: incorporate backend features in features
  hw/virtio: gracefully handle unset vhost_dev vdev
  hw/virtio: handle un-configured shutdown in virtio-pci
  hw/virtio: fix vhost_user_read tracepoint
  include/hw/virtio: more comment for VIRTIO_F_BAD_FEATURE
  include/hw: document vhost_dev feature life-cycle
  hw/virtio: fix some coding style issues
  hw/virtio: log potentially buggy guest drivers
  hw/virtio: add some vhost-user trace events
  hw/virtio: move vm_running check to virtio_device_started
  hw/virtio: move vhd->started check into helper and add FIXME
  tests/qtest: pass stdout/stderr down to subtests
  tests/qtest: add a timeout for subprocess_run_one_test
  tests/qtest: use qos_printf instead of g_test_message
  tests/qtest: catch unhandled vhost-user messages
  tests/qtest: plain g_assert for VHOST_USER_F_PROTOCOL_FEATURES
  tests/qtest: add assert to catch bad features
  tests/qtest: implement stub for VHOST_USER_GET_CONFIG
  tests/qtest: add a get_features op to vhost-user-test
  tests/qtest: enable tests for virtio-gpio

Viresh Kumar (2):
  hw/virtio: add boilerplate for vhost-user-gpio device
  hw/virtio: add vhost-user-gpio-pci boilerplate

 include/hw/virtio/vhost-user-gpio.h |  35 +++
 include/hw/virtio/vhost.h           |  15 +
 include/hw/virtio/virtio.h          |  12 +-
 tests/qtest/libqos/virtio-gpio.h    |  35 +++
 hw/block/vhost-user-blk.c           |  10 +-
 hw/scsi/vhost-scsi.c                |   4 +-
 hw/scsi/vhost-user-scsi.c           |   2 +-
 hw/virtio/vhost-user-fs.c           |   9 +-
 hw/virtio/vhost-user-gpio-pci.c     |  69 +++++
 hw/virtio/vhost-user-gpio.c         | 411 ++++++++++++++++++++++++++++
 hw/virtio/vhost-user-i2c.c          |  10 +-
 hw/virtio/vhost-user-rng.c          |  10 +-
 hw/virtio/vhost-user-vsock.c        |   8 +-
 hw/virtio/vhost-user.c              |  20 +-
 hw/virtio/vhost-vsock-common.c      |   3 +-
 hw/virtio/vhost-vsock.c             |   8 +-
 hw/virtio/vhost.c                   |  16 +-
 hw/virtio/virtio-pci.c              |   9 +-
 hw/virtio/virtio.c                  |   7 +
 tests/qtest/libqos/virtio-gpio.c    | 171 ++++++++++++
 tests/qtest/libqos/virtio.c         |   4 +-
 tests/qtest/qos-test.c              |   9 +-
 tests/qtest/vhost-user-test.c       | 175 ++++++++++--
 MAINTAINERS                         |   8 +
 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   2 +
 hw/virtio/trace-events              |   9 +
 tests/qtest/libqos/meson.build      |   1 +
 28 files changed, 1007 insertions(+), 70 deletions(-)
 create mode 100644 include/hw/virtio/vhost-user-gpio.h
 create mode 100644 tests/qtest/libqos/virtio-gpio.h
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 tests/qtest/libqos/virtio-gpio.c

-- 
2.30.2


