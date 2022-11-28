Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0263AE0A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:43:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhCE-0005gV-11; Mon, 28 Nov 2022 11:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBy-0005eh-0K
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ozhBw-0004oJ-31
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:41:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso8803476wms.4
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9qd4U7iY516AjFzUtj9Z2QWRAVNlHET8gc9s1/4aiME=;
 b=QVghMhshNxdv+3ns9/zaZ2pU1BKghXe61IcL8mlNeocsx9FI+/IFgIg20Df3NHVc5N
 SJtSqPQcALBEEzJfRtnSEQXih/xW4kqr1A5KSqKRQ0u+lBIY22s1ezY3v5no7vK7qw/J
 FpxNZlLsr5+34aQVed7AuD/NXsB6aoc5uKbimG52va8K+L2nwhrWZJjVw6iU5zGNZJW7
 ch4IcvtG61e3MtC+cFbY5N3bnmFrc+LQtCVRzEyWsW1j1zi/Ste7bmSdgFuqqXvNjlkF
 klIFRPgkJSZ6K2PMzVg//XxKPSKdoEnxiytk4YamqDu+FIPrtYGhqRUQ/qh57Ol/b5Jm
 qtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9qd4U7iY516AjFzUtj9Z2QWRAVNlHET8gc9s1/4aiME=;
 b=0x0xLjpUG0f45npN49SnDtRK0eGSs4GUUu0UZJaTBnMsoYbdT2+y+uhHLc/ifa4vnO
 8f0JPckibPGbaO9k+NStgxkgjDBf4RoPle94Gjq5ZebgRiLA3PQUnnSzrwvasNh2DaRl
 msWDnJyMPF8FjghpJF6xLGdn/zOglpY3UqvIp1YCY5q7UI6/aL/e1WLF/hKLZcIK70DV
 8zW9UwE0ng7UzxUl+pMfj8GyWCdT3a54QxyVnAE5A5oqc5KB/Ml486BBQ/nocaD6H9Bo
 q7a1PNdsNC0GlxHNzD7Aqz6dz8Sj/EP68+EWk+TbMTg/JAB759BALhvFG6LRItFkyjfP
 xQXQ==
X-Gm-Message-State: ANoB5pnIa2MUWz6g18cEin3PH0CEGNCM8cY6Ru8aAqUXb3uVIr/vgRNN
 IUrVCzVlO5oXHdwUQhvDWkNecA==
X-Google-Smtp-Source: AA0mqf6iI6R6VkVcQ3hF9pSk4zyxDuxtLxD1ShEl/VcL53VD12sN6ZK+WZ1dmEgQeTcGtBoNlOKxNQ==
X-Received: by 2002:a7b:c2aa:0:b0:3cf:5d41:bea1 with SMTP id
 c10-20020a7bc2aa000000b003cf5d41bea1mr26386099wmk.118.1669653666821; 
 Mon, 28 Nov 2022 08:41:06 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b003c6f1732f65sm21604398wmo.38.2022.11.28.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 08:41:06 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B65F41FFB7;
 Mon, 28 Nov 2022 16:41:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2-rc3 v3 0/7] fix vhost-user issues with CI
Date: Mon, 28 Nov 2022 16:40:58 +0000
Message-Id: <20221128164105.1191058-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Hopefully this is the final iteration to fix the vhost-user issues
that are currently plaguing the release. I've prevented the circular
closing for the vhost_dev structure by generalising the solution used
by virtio-user-blk which punts the close off to an aio instance.

The memory leak from:

  gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);

still occurs which is because we never call vu_gpio_device_unrealize()
in the test. However its unclear why this is the case. We don't seem
to unrealize the vhost-user-network tests either and clang doesn't
complain about that. However as its not triggered by CI I guess we can
live with it for now.

I've included Stefano's:

  vhost: enable vrings in vhost_dev_start() for vhost-user devices

in this series as it makes sense and improves the vring state errors.
However it's up to you if you want to include it in the eventual PR.

I have had at least one green run on CI now:

  https://gitlab.com/stsquad/qemu/-/pipelines/707015814

Please review.

Alex Bennée (6):
  include/hw: attempt to document VirtIO feature variables
  include/hw: VM state takes precedence in virtio_device_should_start
  tests/qtests: override "force-legacy" for gpio virtio-mmio tests
  hw/virtio: ensure a valid host_feature set for virtio-user-gpio
  hw/virtio: add started_vu status field to vhost-user-gpio
  hw/virtio: generalise CHR_EVENT_CLOSED handling

Stefano Garzarella (1):
  vhost: enable vrings in vhost_dev_start() for vhost-user devices

 include/hw/virtio/vhost-user-gpio.h | 10 ++++
 include/hw/virtio/vhost-user.h      | 18 ++++++++
 include/hw/virtio/vhost.h           | 31 +++++++++++--
 include/hw/virtio/virtio.h          | 42 ++++++++++++++---
 backends/cryptodev-vhost.c          |  4 +-
 backends/vhost-user.c               |  4 +-
 hw/block/vhost-user-blk.c           | 45 +++---------------
 hw/net/vhost_net.c                  |  8 ++--
 hw/scsi/vhost-scsi-common.c         |  4 +-
 hw/virtio/vhost-user-fs.c           |  4 +-
 hw/virtio/vhost-user-gpio.c         | 32 +++++++++----
 hw/virtio/vhost-user-i2c.c          |  4 +-
 hw/virtio/vhost-user-rng.c          |  4 +-
 hw/virtio/vhost-user.c              | 71 +++++++++++++++++++++++++++++
 hw/virtio/vhost-vsock-common.c      |  4 +-
 hw/virtio/vhost.c                   | 44 ++++++++++++++++--
 tests/qtest/libqos/virtio-gpio.c    |  3 +-
 hw/virtio/trace-events              |  4 +-
 18 files changed, 251 insertions(+), 85 deletions(-)

- 
2.34.1


