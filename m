Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A96693EA3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStA-0000hM-9C; Mon, 13 Feb 2023 02:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSt3-0000gm-E5
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSt1-0000gY-RZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso2850422wmo.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E2clH1LBOHbJmyujpZTV9eWK4xVhfIlqIghcN70nBCY=;
 b=V72CaPPQ2VOmmjJdfnHJ0v/9+XE6AO8Y/RnXovQrF0cDE1Mmg7RSQEeOlwNcUkDqAC
 JZ2kjcS8iCVEsVQADB3xlasQ8k8VneaMCANZsluOPFjaZOzVi/eYQjUF4iwwAcoTXu/4
 xjzAKQDf8OEdgS6KZ5YrWC9BKeqTvPvxOZ2DJDHCshaHr4PyLij2Y705gJULgwedTPft
 b+hh3mQYkpN2tu2EWMmIyPQszm4C/7Or7CnXEbpaF0aNIPa3YaM8RdvkcCdNsvcwawd3
 wowJXyUuJHFYR5HTO/nHPwvXceZEnF0qG0yM/iIzbCnhdkalS/Yo4yYxmJ+YXIsBPmBf
 vfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E2clH1LBOHbJmyujpZTV9eWK4xVhfIlqIghcN70nBCY=;
 b=G2T5Kp6lUnyi9yMCVkzpJAy63IP3h/ya7PSoTselT7md6rIiV8aei7xzxNyf75jSp0
 rNJ7wN7Kaw+RlSaUV+s8qDOwrHiYOW4HX7hJVmwHlN1wgkl4JPggmi8wyjyfLdbHHRaJ
 mDzY/rha+dy7iuraxgjyzj5WQ4oRiulz0+F8F2/2fQ/B2Ow0CrGvmUYty/Xf9Vark7pD
 EbCIRa25y6EIMcBy9n7fjxJXfZxvfq1tFATSPwup+1sELtnFsdhPMhPG2XkMlbFX2gRm
 z2PwpODsiyvIuUKUo27mwX0HrGJAW8JmHeKXP+L/KgXiPk5MccbEV+JSKdhc/YXU7KMe
 6LlA==
X-Gm-Message-State: AO0yUKVU4NEfG4Ztpurl/rBwhVzLe9XickKmHfd8GM3GQYTL3fT5J36H
 PzgNoeIP0plINK/4NrP2qZBH51XTkqE60EUc
X-Google-Smtp-Source: AK7set9TUH1FDhdGzWRMqqc92CxUblJKKdkcMxBYqiCCxiNrTrAlEAJx241PW3apXK25JVHHUzDFUA==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbc7:5b10 with SMTP id
 i27-20020a05600c4b1b00b003dffbc75b10mr17568759wmp.0.1676271865991; 
 Sun, 12 Feb 2023 23:04:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c328f00b003dc5b59ed7asm12485250wmp.11.2023.02.12.23.04.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/9] hw/qdev: Housekeeping around qdev_get_parent_bus()
Date: Mon, 13 Feb 2023 08:04:14 +0100
Message-Id: <20230213070423.76428-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v2: Convert more qdev_get_parent_bus()

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper. Replace most uses.

Philippe Mathieu-Daudé (9):
  hw/qdev: Constify DeviceState* argument of qdev_get_parent_bus()
  hw/audio: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw/block: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw/net: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw/pci: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw/ppc: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw/usb: Replace dev->parent_bus by qdev_get_parent_bus(dev)
  hw: Use qdev_get_parent_bus() in
    qdev_get_own_fw_dev_path_from_handler()
  qdev-monitor: Use qdev_get_parent_bus() in bus_print_dev()

 hw/audio/intel-hda.c                | 10 +++++-----
 hw/block/fdc.c                      |  2 +-
 hw/block/swim.c                     |  2 +-
 hw/core/qdev-fw.c                   |  9 +++++----
 hw/core/qdev.c                      |  2 +-
 hw/ide/qdev.c                       |  6 +++---
 hw/net/virtio-net.c                 |  2 +-
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/ppc/spapr_vio.c                  |  4 ++--
 hw/scsi/scsi-bus.c                  | 18 +++++++++---------
 hw/usb/bus.c                        |  2 +-
 hw/usb/desc.c                       |  2 +-
 hw/usb/dev-smartcard-reader.c       | 16 ++++++++--------
 include/hw/qdev-core.h              |  4 ++--
 include/hw/scsi/scsi.h              |  2 +-
 include/hw/usb.h                    |  2 +-
 softmmu/bootdevice.c                |  2 +-
 softmmu/qdev-monitor.c              |  6 +++---
 18 files changed, 47 insertions(+), 46 deletions(-)

-- 
2.38.1


