Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD849693A8D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRL8H-0001Lf-16; Sun, 12 Feb 2023 17:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8D-0001Kp-KW
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8C-0003HZ-3J
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so7756186wms.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hn5t9rWqhPYqcOHSrcmCkpyIrra+INbFtqDNLO9w6V4=;
 b=Lv8NEax27QCEgplsdcIt/KDsET3rN33yNppRIl9ehnHVrtY2mwe05Pa1YXNJG+RVMk
 zV6N21b+ZlNOpKrS+mIF+OSYjiryIvauQjrXuxMw358qV8b4pIurA8wgOQz8AhJE1VeS
 ACDDJULkHbupUjvJcC3bsbgEMnmYzePWkWgNgmncr/+KxbelBjOTBZ/k85EO0HEI7inF
 y4bCC7tXaVdR+WUFwDcC9F1JbD+ApDXOMxkxh9tCN47JMvAcO4tdy6rWulLPpe8kEbPf
 sXNMsL9h4NZQwN5vyvScCuI+sGJK2anOHgb2LTwbyFE5jznv2mf5cNTxZv5yEhwZHXl8
 XaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hn5t9rWqhPYqcOHSrcmCkpyIrra+INbFtqDNLO9w6V4=;
 b=Ix0DuqYED7QxgnnX6MiXj6kurfNS68L1xhiHLqr8CWWrjZcuPYVULj+rJmxFTfmlJ+
 b3DKmifS5CXDJzLbaQl2/3mKm3sOv/X2jylQSYEh+MKm0jQcPT5kdjG2nEfpcyp1sYJI
 qqhP1Jzr1Mw8n+mpXkAU5JCgOuA85RzJBdrMizXThznTdjn2Uv0Vwh20+l8vTe6sA8WM
 vZqmw5Ydogy+Twq2fte8akkNC0wtd5k1EfWk8GbbXvac1iynrZAZEFc8cmGtBhrweh8M
 kMzVEJakBSyL2cqbQVgUzygLGtLFU4C4JQCOqF2Bd8n6kYsHPyDsjCIVcXv739K6wmzb
 yKig==
X-Gm-Message-State: AO0yUKUFFDvhH+xl+YA3cgHaVzkcWK/EFlpDF5CCZ8aQM9BYezjxpnls
 TAhxmDmc9oYnGK7QgpoQRR0WjLKmuwBLWyFk
X-Google-Smtp-Source: AK7set8OQvgJlX9eQtwSNia477au6g0xSyROuVM+i7HOZ8UjofuX1QuMpkOhTjFw3nZ6XJ8KKIDLEw==
X-Received: by 2002:a05:600c:1898:b0:3e0:185:44af with SMTP id
 x24-20020a05600c189800b003e0018544afmr3113478wmp.20.1676242052513; 
 Sun, 12 Feb 2023 14:47:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c2cd300b003dfefe115b9sm13355858wmc.0.2023.02.12.14.47.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:47:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/qdev: Housekeeping around qdev_get_parent_bus()
Date: Sun, 12 Feb 2023 23:47:26 +0100
Message-Id: <20230212224730.51438-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper. Replace most uses.

Philippe Mathieu-Daudé (4):
  hw/qdev: Constify DeviceState* argument of qdev_get_parent_bus()
  hw: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw: Use qdev_get_parent_bus() in
    qdev_get_own_fw_dev_path_from_handler()
  qdev-monitor: Use qdev_get_parent_bus() in bus_print_dev()

 hw/audio/intel-hda.c                |  2 +-
 hw/block/fdc.c                      |  2 +-
 hw/block/swim.c                     |  2 +-
 hw/core/qdev-fw.c                   |  9 +++++----
 hw/core/qdev.c                      |  2 +-
 hw/ide/qdev.c                       |  4 ++--
 hw/net/virtio-net.c                 |  2 +-
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/scsi/scsi-bus.c                  |  2 +-
 hw/usb/bus.c                        |  2 +-
 hw/usb/desc.c                       |  2 +-
 hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
 include/hw/qdev-core.h              |  4 ++--
 softmmu/bootdevice.c                |  2 +-
 softmmu/qdev-monitor.c              |  6 +++---
 15 files changed, 30 insertions(+), 29 deletions(-)

-- 
2.38.1


