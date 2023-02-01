Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87C685E36
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4V7-0000aP-CJ; Tue, 31 Jan 2023 23:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4V5-0000Zb-32
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:13:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4V2-00015O-Mw
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:13:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id d3so17200576plr.10
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PiZ8B2fyB1t4ip2vrIgAWf/iyOgj9ibsiPXLOqRkj0o=;
 b=DbK2qzfhu3islekuPQQLGiHxVCCr8ObiMtLC6+r5kT0DGycxZe3M8p78+pceKaJZxw
 hgfgmqLDZ+9Q7P0sZ1IbRuis7yag+X6dwJFcHfUUs9Obg9j6jL7CePP1S+mOdPlHieET
 0+q8e4OfHkP7SW2uaiUCdt1g7wQ66RNTvysTV85GFMKiXWZ0PCd+u6Z4zCEnpjkWGmuD
 fIk4vrSjyUoKQDsn6ZC9s+YTt1xU1eAbza/i2Nq/WfK7v3HTrY9Q2WM4lm/ITWGBsPh6
 HiqFzIDqxzwSU/ndrQfuHeJYRf0QELAjL0LpAQFCq1/vqiSsi1DWGtyP0F9IzRSN4J9u
 AH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PiZ8B2fyB1t4ip2vrIgAWf/iyOgj9ibsiPXLOqRkj0o=;
 b=6P8QKYWq3adRowS9KqN3KZjVhAzGCgt7ls2k+cePYFt7F0d8UZU0zszgp8B5/BWQwD
 QVmAZBl+gFlK7yZK0Eai3dIoqidUII5F+3vQEX5BqHuxd9rbjZfsZq4stMZwLjr5ybHc
 KNx2vGjhh4x3Qxs5cnBks9EScsTvwGkHcSa4kT0QCSp9iFsqIg7rd3bi60IXgQDg+c88
 vMqb/nAX5wH1EzMFZH9ttRwA94C+qMzk+4epQI+9ucxBCMXfoGWyFYKKOCxrJX8uxHoq
 FFYo0pJLnxYbwWttp7vCPinE+DQKmy65iOH4OMDLcyOZrsxCIHltnxm7vk2InlIotxS5
 q/Qg==
X-Gm-Message-State: AO0yUKXiykYqSyM1V5u6si4LR3KoWVRZQygxT4ey2ndreMWR+HG6snyD
 HEZm7csI9LVbgIIfrghryCCeVg==
X-Google-Smtp-Source: AK7set/JLiFcExaYx3kzknoZEvj7hTPNEjlK/DtM6Zi5hxcVwbc8Ua7NgItpcx3qUZuEdlzEdpETeg==
X-Received: by 2002:a17:90a:48:b0:22b:e5e1:9d3 with SMTP id
 8-20020a17090a004800b0022be5e109d3mr730166pjb.25.1675224811280; 
 Tue, 31 Jan 2023 20:13:31 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a17090a7a8800b0022c01052e92sm231350pjf.56.2023.01.31.20.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:13:30 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 0/9] Introduce igb
Date: Wed,  1 Feb 2023 13:13:11 +0900
Message-Id: <20230201041320.32096-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Based-on: <20230201033539.30049-1-akihiko.odaki@daynix.com>
([PATCH v5 00/29] e1000x cleanups (preliminary for IGB))

igb is a family of Intel's gigabit ethernet controllers. This series implements
82576 emulation in particular. You can see the last patch for the documentation.

Note that there is another effort to bring 82576 emulation. This series was
developed independently by Sriram Yagnaraman.
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

V5 -> V6:
- Rebased.
- Renamed "test" to "packet" in tests/qtest/e1000e-test.c.
- Fixed Rx logic so that a Rx pool without enough space won't prevent other
  pools from receiving, based on Sriram Yagnaraman's work.

V4 -> V5:
- Rebased.
- Squashed patches to copy from e1000e code and modify it.
- Listed the implemented features.
- Added a check for interrupts availablity on PF.
- Fixed the declaration of igb_receive_internal(). (Sriram Yagnaraman)

V3 -> V4:
- Rebased.
- Corrected PCIDevice specified for DMA.

V2 -> V3:
- Rebased.
- Fixed PCIDevice reference in hw/net/igbvf.c.
- Fixed TX packet switching when VM loopback is enabled.
- Fixed VMDq enablement check.
- Fixed RX descriptor length parser.
- Fixed the definitions of RQDPC readers.
- Implemented VLAN VM filter.
- Implemented VT_CTL.Def_PL.
- Implemented the combination of VMDq and RSS.
- Noted that igb is tested with Windows HLK.

V1 -> V2:
- Spun off e1000e general improvements to a distinct series.
- Restored vnet_hdr offload as there seems nothing preventing from that.

Akihiko Odaki (9):
  hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
  pcie: Introduce pcie_sriov_num_vfs
  e1000: Split header files
  Intrdocue igb device emulation
  tests/qtest/e1000e-test: Fabricate ethernet header
  tests/qtest/libqos/e1000e: Export macreg functions
  igb: Introduce qtest for igb device
  tests/avocado: Add igb test
  docs/system/devices/igb: Add igb documentation

 MAINTAINERS                                   |    9 +
 docs/system/device-emulation.rst              |    1 +
 docs/system/devices/igb.rst                   |   71 +
 hw/net/Kconfig                                |    5 +
 hw/net/e1000.c                                |    1 +
 hw/net/e1000_common.h                         |  102 +
 hw/net/e1000_regs.h                           |  927 +---
 hw/net/e1000e.c                               |    3 +-
 hw/net/e1000e_core.c                          |    1 +
 hw/net/e1000x_common.c                        |    1 +
 hw/net/e1000x_common.h                        |   74 -
 hw/net/e1000x_regs.h                          |  940 ++++
 hw/net/igb.c                                  |  612 +++
 hw/net/igb_common.h                           |  146 +
 hw/net/igb_core.c                             | 4043 +++++++++++++++++
 hw/net/igb_core.h                             |  144 +
 hw/net/igb_regs.h                             |  648 +++
 hw/net/igbvf.c                                |  327 ++
 hw/net/meson.build                            |    2 +
 hw/net/net_tx_pkt.c                           |    6 +
 hw/net/net_tx_pkt.h                           |    8 +
 hw/net/trace-events                           |   32 +
 hw/pci/pcie_sriov.c                           |    5 +
 include/hw/pci/pcie_sriov.h                   |    3 +
 .../org.centos/stream/8/x86_64/test-avocado   |    1 +
 tests/avocado/igb.py                          |   38 +
 tests/qtest/e1000e-test.c                     |   25 +-
 tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
 tests/qtest/igb-test.c                        |  243 +
 tests/qtest/libqos/e1000e.c                   |   12 -
 tests/qtest/libqos/e1000e.h                   |   14 +
 tests/qtest/libqos/igb.c                      |  185 +
 tests/qtest/libqos/meson.build                |    1 +
 tests/qtest/meson.build                       |    1 +
 34 files changed, 7614 insertions(+), 1022 deletions(-)
 create mode 100644 docs/system/devices/igb.rst
 create mode 100644 hw/net/e1000_common.h
 create mode 100644 hw/net/e1000x_regs.h
 create mode 100644 hw/net/igb.c
 create mode 100644 hw/net/igb_common.h
 create mode 100644 hw/net/igb_core.c
 create mode 100644 hw/net/igb_core.h
 create mode 100644 hw/net/igb_regs.h
 create mode 100644 hw/net/igbvf.c
 create mode 100644 tests/avocado/igb.py
 create mode 100644 tests/qtest/igb-test.c
 create mode 100644 tests/qtest/libqos/igb.c

-- 
2.39.1


