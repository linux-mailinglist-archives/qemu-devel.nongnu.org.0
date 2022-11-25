Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAD638F13
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 18:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oycXX-0004PJ-6o; Fri, 25 Nov 2022 12:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXH-0004MK-Rm
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:48 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oycXG-0004Uo-34
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 12:30:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id o30so3976727wms.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q69caMXa8gad9T0/arkaVNixkr0F1EihlkekwfMmMJA=;
 b=DBZOU4F/lfn9ZHMIZt1JrpNAkX/kngVhVk4RH3IGaZ8L/a8wzsSqLjqpDrw8GbKB4X
 TfkBpL/0bQffMLuevHoj6N5xm3baSCpIQnG0WRLKL5JzHzjXxyaTbeAxgK0JFUp9PfM+
 pJhCzyhwIFO3Q6vurl8EL1uO89Rf92/aftEGqe0lbKzkoE95sVSaDfhLuFFb3FLhBzNz
 4hysMZsxTs2R2chRE5TCiaruG0Ea5cC2jJcPyaZ/W4mpxyX54YFTWFJyFLmbDD2rXYKA
 +aamQIENlSjJMyiUEO/bQvsRcdWB8AIghOimUCEbQ8+IIGTYk7p/VUNjFZWbZ5uXlyvJ
 jxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q69caMXa8gad9T0/arkaVNixkr0F1EihlkekwfMmMJA=;
 b=KK/qhJCx034IFqmXeoK1qccGhfshC6dqrlkP999pO4WqTTaaHwESNm9CnGMJWtHxXF
 31HAWqS+xIdD3efyYccqxSERigDapQzJma6loJNXm4/QzUxstLQkqzZISm+OS/xZS91Z
 ftpP5LTDlO7dffqumMXCkySH8wkNc26gQGNqlXgsy8ifkuuuQfXo+MWCwjLbuacP5/4G
 Wlk6uQLHoNekYeaEWR9jguuTXIXa9Za/rN/uZtz7qiBGhAAo8G3d2hPGgToSKe/GKNqd
 7PisYoRvTtcVD5cxaXmlIzgzNviI6tMI9TXNMpNU9HpHvV9b8GXeHmu7LZegXmJViDGb
 wwoA==
X-Gm-Message-State: ANoB5plx9YOxBPGjxUjVmPcQqi8DPKp1/E421XDHtiSfKTYXelxKztso
 jP6VSIftbx0EBFbpL8z5TDEskg==
X-Google-Smtp-Source: AA0mqf5bCG95cNPhsIe/3io/N6U/jagPfam9TeILVJU7lnt8WDDBtvhFvlT+gtz8iTQ0tZGDnFosfA==
X-Received: by 2002:a7b:c385:0:b0:3cf:87a8:ef00 with SMTP id
 s5-20020a7bc385000000b003cf87a8ef00mr19658654wmj.55.1669397444554; 
 Fri, 25 Nov 2022 09:30:44 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a05600c4f4700b003cf37c5ddc0sm6414627wmq.22.2022.11.25.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 09:30:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1EC691FFB7;
 Fri, 25 Nov 2022 17:30:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2-rc? v2 0/5] continuing efforts to fix vhost-user issues
Date: Fri, 25 Nov 2022 17:30:38 +0000
Message-Id: <20221125173043.1998075-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

This is continuing to attempt to fix the various vhost-user issues
that are currently plaguing the release. One concrete bug I've come
across is that all qtest MMIO devices where being treated as legacy
which caused the VIRTIO_F_VERSION_1 flag to get missed causing s390x
to fall back to trying to set the endian value for the virt-queues.

I've patched it for the GPIO tests and raised a tracking bug (#1342)
for the general problem. This might explain why the only other VirtIO
vhost-user MMIO device tested via qtest are the virtio-net-tests. The
vhost networking support is its own special implementation so its hard
to compare the code for GPIO. It does make me wonder if disabling the
mmio version of the test for now would be worthwhile. FWIW I did try
disabling force-legacy for all machine types and that caused a bunch
of the other tests to fail.

I made some progress in tracking down the memory leak that clang
complains about. It comes down to the line:

  gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);

which is never cleared up because we never call
vu_gpio_device_unrealize() in the test. However its unclear why this
is the case. We don't seem to unrealize the vhost-user-network tests
either and clang doesn't complain about that.

I can replicate some of the other failures I've been seeing in CI by
running:

  ../../meson/meson.py test --repeat 10 --print-errorlogs qtest-arm/qos-test

however this seems to run everything in parallel and maybe is better
at exposing race conditions. Perhaps the CI system makes those races
easier to hit? Unfortunately I've not been able to figure out exactly
how things go wrong in the failure case. 

I've included Stefano's:

  vhost: enable vrings in vhost_dev_start() for vhost-user devices

in this series as it makes sense and improves the vring state errors.
However it's up to you if you want to include it in the eventual PR.
There are still CI errors I'm trying to track down but I thought it
would be worth posting the current state of my tree.

Please review.


Alex Bennée (4):
  include/hw: attempt to document VirtIO feature variables
  include/hw: VM state takes precedence in virtio_device_should_start
  tests/qtests: override "force-legacy" for gpio virtio-mmio tests
  hw/virtio: ensure a valid host_feature set for virtio-user-gpio

Stefano Garzarella (1):
  vhost: enable vrings in vhost_dev_start() for vhost-user devices

 include/hw/virtio/vhost.h        | 31 ++++++++++++++++++----
 include/hw/virtio/virtio.h       | 43 ++++++++++++++++++++++++++-----
 backends/cryptodev-vhost.c       |  4 +--
 backends/vhost-user.c            |  4 +--
 hw/block/vhost-user-blk.c        |  4 +--
 hw/net/vhost_net.c               |  8 +++---
 hw/scsi/vhost-scsi-common.c      |  4 +--
 hw/virtio/vhost-user-fs.c        |  4 +--
 hw/virtio/vhost-user-gpio.c      | 10 ++++++--
 hw/virtio/vhost-user-i2c.c       |  4 +--
 hw/virtio/vhost-user-rng.c       |  4 +--
 hw/virtio/vhost-vsock-common.c   |  4 +--
 hw/virtio/vhost.c                | 44 ++++++++++++++++++++++++++++----
 tests/qtest/libqos/virtio-gpio.c |  3 ++-
 hw/virtio/trace-events           |  4 +--
 15 files changed, 134 insertions(+), 41 deletions(-)

-- 
2.34.1


