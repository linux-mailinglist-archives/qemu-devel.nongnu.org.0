Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD963D469
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LCn-0004KP-R2; Wed, 30 Nov 2022 06:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCm-0004K2-Ha
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0LCj-0004ea-Tq
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:24:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id z4so26604740wrr.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CM4+dDDdgR4VfEundVQTjvmUg0RjtbFKuCf3XpeWvV8=;
 b=B7bwY+NxMcJ6aNrXZYlsXt8nuReqMR4lhV48IiYYtJR627L0pQZ97LCMG+zJsLdDnQ
 x52cDaGpQum0/+nB0r6JCA2AwZO9s3Myc+rJ/KnuxHVf6ZNpHkeJKM3W28uxtx4VaV1D
 +QkoXN0nSBwL2Ev8uJwZ0AGZFvNRp0wgVXMRWGqcxvWanD9IgDEgmluW5tzjm8fMQc5o
 lKUhBo85qsvC9VZXmX8nt0/ZBLnm9pT0x+5XD90FwuBesSS9HBP4WcR7iF5sdOWlbX71
 JReHFlfCT8Rv7vm8HMVhy2cqS0yEU4+eLXENBg+rciIzTM0y927Ix/UZ+3AUgU2uyzOd
 LOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CM4+dDDdgR4VfEundVQTjvmUg0RjtbFKuCf3XpeWvV8=;
 b=NJj24lsr0Yku0b5HQHN/ir3nPqqDj31ouY2qJK3Ysk5p7/FZvFX6E/UvnsCIeYpPIf
 3c2J8qKEjjkrr0cHIkeGv2rAeArSa7dei5faoPoAPPKuKIZrGSf0Bv8yr2Q+ogA4QVaP
 53C5x8MPyhCfwiQ4rcfpzNNmm57m00iSDbiGiVzRYwGi9NJXyIq6nmj1PjmBtb40UxVM
 7JWpz/gclspEBbXYLBqXjgvO/pGV8rIL1SA7vFGMPpByWryWI2XSjgB+Vw6rWc8RFtKN
 5satYZlX1hTx/IRoXERyqaX6nVPfwWv0XG5JEa4hIsLJJi+IGx0BTqnhj/7neMe8ewn0
 K6/g==
X-Gm-Message-State: ANoB5plrQXducUDhrmtWl4ztboulEP2T9MJLmkbtEPOXQ98i/Rb8Tf2Y
 NGIkrcJ43y72dSkWcArac9PhiA==
X-Google-Smtp-Source: AA0mqf64LxAhzbG/NE7uhT6eR9qVv05cdJIuv6jyRf/aXcIWsW52xGzJ3foNhpWCMt6FFjxrUBvv6w==
X-Received: by 2002:adf:ea4d:0:b0:22e:38b9:5d6d with SMTP id
 j13-20020adfea4d000000b0022e38b95d6dmr27508156wrn.276.1669807480116; 
 Wed, 30 Nov 2022 03:24:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003c70191f267sm6104510wmp.39.2022.11.30.03.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 03:24:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57D211FFB7;
 Wed, 30 Nov 2022 11:24:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2 v4 0/5] final vhost-user fixes
Date: Wed, 30 Nov 2022 11:24:34 +0000
Message-Id: <20221130112439.2527228-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

Hi Michael,

Following feedback from the previous posting I've dropped the setting
of host_features (probably and overfix while chasing other issues).
I've re-ordered the series so the "VM state takes precedence" patch is
the last one. I'm going to demur on fixing up vhost-net which on the
surface looks like it should benefit from the CHR_EVENT_CLOSED
re-factoring but is going to require more invasive tweaks to ensure we
properly pass DeviceState to the helpers.

Please apply


Alex Bennée (4):
  tests/qtests: override "force-legacy" for gpio virtio-mmio tests
  hw/virtio: add started_vu status field to vhost-user-gpio
  hw/virtio: generalise CHR_EVENT_CLOSED handling
  include/hw: VM state takes precedence in virtio_device_should_start

Stefano Garzarella (1):
  vhost: enable vrings in vhost_dev_start() for vhost-user devices

 include/hw/virtio/vhost-user-gpio.h | 10 ++++
 include/hw/virtio/vhost-user.h      | 18 ++++++++
 include/hw/virtio/vhost.h           |  6 ++-
 include/hw/virtio/virtio.h          | 23 ++++++++--
 backends/cryptodev-vhost.c          |  4 +-
 backends/vhost-user.c               |  4 +-
 hw/block/vhost-user-blk.c           | 45 +++---------------
 hw/net/vhost_net.c                  |  8 ++--
 hw/scsi/vhost-scsi-common.c         |  4 +-
 hw/virtio/vhost-user-fs.c           |  4 +-
 hw/virtio/vhost-user-gpio.c         | 26 +++++++----
 hw/virtio/vhost-user-i2c.c          |  4 +-
 hw/virtio/vhost-user-rng.c          |  4 +-
 hw/virtio/vhost-user.c              | 71 +++++++++++++++++++++++++++++
 hw/virtio/vhost-vsock-common.c      |  4 +-
 hw/virtio/vhost.c                   | 44 ++++++++++++++++--
 tests/qtest/libqos/virtio-gpio.c    |  3 +-
 hw/virtio/trace-events              |  4 +-
 18 files changed, 205 insertions(+), 81 deletions(-)

-- 
2.34.1


