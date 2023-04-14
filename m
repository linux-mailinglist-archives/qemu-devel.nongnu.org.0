Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C38F6E2265
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:39:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHkk-00087e-M6; Fri, 14 Apr 2023 07:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHke-00087O-V3
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkd-0001A2-2E
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 my14-20020a17090b4c8e00b0024708e8e2ddso7418371pjb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472277; x=1684064277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/+Urd4hgAgmmSjhUoGkK7++j9UDeObg6CK37hAGkZBk=;
 b=Aj0Z4OkZOgiS24yG0Pk0hetHep/Z6p8HIFVr1v25/r/tB9wLDNfAP3x4cukMlReyhI
 iUmM+wl4ZZJPPnH/3tCeon/ZO/FxAt+VJaTMptYm14PSA+WFBrcj4WaBoIZnn2mOhho8
 y3dKZ1oo123T4yA3uA+hg9po7sfRQGxrhzk5tT2SCbq/4fUuFCELvB7G1UPSmoSihUIJ
 LljXcsxL3Ko2wFdbngaphSI9jgMjHsMsQBEfotkct5qaxEZwfmM7PT2//Zwhm3F/egxq
 MpQmQHqRYD+GXbJQ+E02w9X5rIr2Ujv4JG3HsNMEkQJpT5dwa8mfv5mpUI0JBCq5zmhZ
 AJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472277; x=1684064277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+Urd4hgAgmmSjhUoGkK7++j9UDeObg6CK37hAGkZBk=;
 b=S+Tx7WV17otW9OVzRapkWwFMGFZPTR9bvyFQmG6w28CKWmElZegx8vel436xRAnumz
 frMMC/edmKor+K1nvYLS4wyZKoBav8PAQx0YfZ00R8AIt0H+CdFoQfA8wjCUZKgkU7J8
 0G0qgy8MrLbmNZmpIWaCgw2t0EpNQ+nuLn3wbpoRRZq0aXHpc7CDcSDkGuQO4kndvpIA
 JZ90j2XwSY+vXUdhiBtfcvZCWxjegC+YWElqy217KwN7BuW8/E7Cxv8yt4pWKXuN10Kn
 FhgLZrPApmwewOTStISopssixbQ4rAjWOfgBd8i8joPctC80d9/4UkvLbYZVhoVkIOMT
 vJBA==
X-Gm-Message-State: AAQBX9d8To8TetlJjesey28YP/gZX27eeLKcaTR50jrYLTgcHrZnTu3P
 e9mVE2huTrsx4WNFImJoVwbaIQ==
X-Google-Smtp-Source: AKy350ape1j9ytUhfN/Sx/jxoCJcADDeJb57Tm/HRvBxyKYL+EfskNz7YLva+6Jy0UZrdKocbZDRVw==
X-Received: by 2002:a17:902:a984:b0:1a6:6afc:2d67 with SMTP id
 bh4-20020a170902a98400b001a66afc2d67mr2205899plb.61.1681472276831; 
 Fri, 14 Apr 2023 04:37:56 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:37:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 00/40] igb: Fix for DPDK
Date: Fri, 14 Apr 2023 20:36:57 +0900
Message-Id: <20230414113737.62803-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series has fixes and feature additions to pass DPDK Test Suite with igb.
It also includes a few minor changes related to networking.

Patch [01, 09] are bug fixes.
Patch [10, 13] delete code which is unnecessary and affected by later changes.
Patch [14, 28] are minor changes.
Patch [29, 38] implement new features.
Patch [39, 40] update documentations.

While this includes so many patches, it is not necessary to land them at once.
Only bug fix patches may be applied first, for example.

Akihiko Odaki (40):
  hw/net/net_tx_pkt: Decouple from PCI
  e1000x: Fix BPRC and MPRC
  igb: Fix Rx packet type encoding
  igb: Include the second VLAN tag in the buffer
  igb: Do not require CTRL.VME for tx VLAN tagging
  net/net_rx_pkt: Use iovec for net_rx_pkt_set_protocols()
  e1000e: Always copy ethernet header
  igb: Always copy ethernet header
  Fix references to igb Avocado test
  tests/avocado: Remove unused imports
  tests/avocado: Remove test_igb_nomsi_kvm
  hw/net/net_tx_pkt: Remove net_rx_pkt_get_l4_info
  net/eth: Rename eth_setup_vlan_headers_ex
  e1000x: Share more Rx filtering logic
  e1000x: Take CRC into consideration for size check
  e1000e: Always log status after building rx metadata
  igb: Always log status after building rx metadata
  igb: Remove goto
  igb: Read DCMD.VLE of the first Tx descriptor
  e1000e: Reset packet state after emptying Tx queue
  vmxnet3: Reset packet state after emptying Tx queue
  igb: Add more definitions for Tx descriptor
  igb: Share common VF constants
  igb: Fix igb_mac_reg_init alignment
  net/eth: Use void pointers
  net/eth: Always add VLAN tag
  hw/net/net_rx_pkt: Enforce alignment for eth_header
  tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
  igb: Implement MSI-X single vector mode
  igb: Implement igb-specific oversize check
  igb: Use UDP for RSS hash
  igb: Implement Rx SCTP CSO
  igb: Implement Tx SCTP CSO
  igb: Strip the second VLAN tag for extended VLAN
  igb: Filter with the second VLAN tag for extended VLAN
  igb: Implement Rx PTP2 timestamp
  igb: Implement Tx timestamp
  vmxnet3: Do not depend on PC
  MAINTAINERS: Add a reviewer for network packet abstractions
  docs/system/devices/igb: Note igb is tested for DPDK

 MAINTAINERS                                   |   3 +-
 docs/system/devices/igb.rst                   |  14 +-
 hw/net/Kconfig                                |   2 +-
 hw/net/e1000.c                                |  41 +-
 hw/net/e1000e_core.c                          | 103 +---
 hw/net/e1000x_common.c                        |  73 ++-
 hw/net/e1000x_common.h                        |   9 +-
 hw/net/igb.c                                  |  10 +-
 hw/net/igb_common.h                           |  24 +-
 hw/net/igb_core.c                             | 471 +++++++++++-------
 hw/net/igb_regs.h                             |  61 ++-
 hw/net/igbvf.c                                |   7 -
 hw/net/net_rx_pkt.c                           | 107 ++--
 hw/net/net_rx_pkt.h                           |  38 +-
 hw/net/net_tx_pkt.c                           | 101 ++--
 hw/net/net_tx_pkt.h                           |  46 +-
 hw/net/trace-events                           |   4 +-
 hw/net/virtio-net.c                           |   7 +-
 hw/net/vmxnet3.c                              |  22 +-
 include/net/eth.h                             |  27 +-
 include/qemu/crc32c.h                         |   1 +
 net/eth.c                                     | 100 ++--
 .../org.centos/stream/8/x86_64/test-avocado   |   2 +-
 tests/avocado/netdev-ethtool.py               |  13 +-
 tests/qtest/libqos/igb.c                      |   1 +
 util/crc32c.c                                 |   8 +
 26 files changed, 747 insertions(+), 548 deletions(-)

-- 
2.40.0


