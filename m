Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0176EBCD5
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:20:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRBZ-0001md-U9; Sun, 23 Apr 2023 00:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBY-0001mP-Dp
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:18:48 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBV-0000j1-Vj
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:18:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b5c48ea09so2973954b3a.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223523; x=1684815523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6l0sTKN0xFA0rsx5y/xtqKJILcn6NLEBGsRNlHEgvik=;
 b=BNuNu75oBrfxbblRHhHRZRKY5ScacZNDVcJ7GBE/svK1upxaYbeSzBP8rBA2x0LzD6
 T4/rd2n6u4koGf6wZjnQszaZ3YQD8sQYtt0UeIbHpyp/CJY5TNoOlvjQlimBzNt4QPiQ
 0uV+YP1EuKpPjwRjaOJWw6yuEhsh1QLK0EmD8WjcnLP+2x83pdopgoVuHwlywPD6feV8
 3dhvdc3VY+W/U7z8gioGzbfQkmLVHHQ6TqdvzZzfZ9jVYxtctOjyfSZ3W7AiEyJ6BgJM
 7GXdX8OMRXiuCr/ZkYKpO2Jfo+rnWEAPoZ1riQV/CGr2x/PFy8hD+2X/8OtkFCSuYxOf
 EmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223523; x=1684815523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6l0sTKN0xFA0rsx5y/xtqKJILcn6NLEBGsRNlHEgvik=;
 b=lGXZPTA5KrTMye9yGxxPKseT3Qkrmkk/Z+ZCY2CWPW7VUvUbc3vA0llo7UMzXfuN9P
 JAVtxPO6Ndqe1uGPiWbsIoV3cTX3V5c8hP6EJm5R1SkKqHAVNWYmpPA7bG7ATG2gPWZG
 vhiLj8zgGv5apQp0/Vy7h6XguVREZqereZmzCTteuJKnr1Bv7fQb0uJyxZbgbeKvuNHi
 CfDWHKv/qcqLNCGIMEXFKTX0/HDUSvXLGccIrznHbcUDnKbwSHZaaCZABXTgu9alnYcV
 EDpa8hcaXlJj9dMg77LXyyQdNlj6pjwh9JF2Wkfk/PNzhQ694oouz1ZUTiPcH4z47Q8z
 FfXg==
X-Gm-Message-State: AAQBX9cabq6X7OKORdUKvTa7rW8V+hmC8SS60ZMXuUYfOOJY+WZUURR/
 nxPMCnPBkr9j4Pf5/RlrEseByQ==
X-Google-Smtp-Source: AKy350YTPPQADEUGRVBMxTblghF/ZTXbsYfBvoyqVDmsHotZuzFoq2F/u9scVbwGdTCfiW1zvrWsGg==
X-Received: by 2002:a17:903:2441:b0:1a6:ff6a:83ed with SMTP id
 l1-20020a170903244100b001a6ff6a83edmr11744469pls.65.1682223523312; 
 Sat, 22 Apr 2023 21:18:43 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:18:42 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 00/47] igb: Fix for DPDK
Date: Sun, 23 Apr 2023 13:17:46 +0900
Message-Id: <20230423041833.5302-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
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

Based-on: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
("[PATCH 0/1] e1000e: Fix tx/rx counters")

This series has fixes and feature additions to pass DPDK Test Suite with
igb. It also includes a few minor changes related to networking.

Patch [01, 10] are bug fixes.
Patch [11, 14] delete code which is unnecessary.
Patch [15, 33] are minor changes.
Patch [34, 45] implement new features.
Patch [46, 47] update documentations.

While this includes so many patches, it is not necessary to land them at
once. Only bug fix patches may be applied first, for example.

V2 -> V3:
- Fixed parameter name in hw/net/net_tx_pkt. (Philippe Mathieu-Daudé)
- Added patch "igb: Clear IMS bits when committing ICR access".
- Added patch "igb: Clear EICR bits for delayed MSI-X interrupts".
- Added patch "e1000e: Rename a variable in e1000e_receive_internal()".
- Added patch "igb: Rename a variable in igb_receive_internal()".
- Added patch "e1000e: Notify only new interrupts".
- Added patch "igb: Notify only new interrupts".

V1 -> V2:
- Dropped patch "Include the second VLAN tag in the buffer". The second
  VLAN tag is not used at the point and unecessary.
- Added patch "e1000x: Rename TcpIpv6 into TcpIpv6Ex".
- Split patch "hw/net/net_tx_pkt: Decouple from PCI".
  (Philippe Mathieu-Daudé)
- Added advanced Rx descriptor packet encoding definitions.
  (Sriram Yagnaraman)
- Added some constants to eth.h to derive packet oversize thresholds.
- Added IGB_TX_FLAGS_VLAN_SHIFT usage.
- Renamed patch "igb: Fix igb_mac_reg_init alignment".
  (Philippe Mathieu-Daudé)
- Fixed size check for packets with double VLAN. (Sriram Yagnaraman)
- Fixed timing to timestamp Tx packet.

Akihiko Odaki (47):
  hw/net/net_tx_pkt: Decouple implementation from PCI
  hw/net/net_tx_pkt: Decouple interface from PCI
  e1000x: Fix BPRC and MPRC
  igb: Fix Rx packet type encoding
  igb: Do not require CTRL.VME for tx VLAN tagging
  igb: Clear IMS bits when committing ICR access
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
  e1000x: Rename TcpIpv6 into TcpIpv6Ex
  e1000e: Always log status after building rx metadata
  igb: Always log status after building rx metadata
  igb: Remove goto
  igb: Read DCMD.VLE of the first Tx descriptor
  e1000e: Reset packet state after emptying Tx queue
  vmxnet3: Reset packet state after emptying Tx queue
  igb: Add more definitions for Tx descriptor
  igb: Share common VF constants
  igb: Fix igb_mac_reg_init coding style alignment
  igb: Clear EICR bits for delayed MSI-X interrupts
  e1000e: Rename a variable in e1000e_receive_internal()
  igb: Rename a variable in igb_receive_internal()
  net/eth: Use void pointers
  net/eth: Always add VLAN tag
  hw/net/net_rx_pkt: Enforce alignment for eth_header
  tests/qtest/libqos/igb: Set GPIE.Multiple_MSIX
  igb: Implement MSI-X single vector mode
  igb: Use UDP for RSS hash
  igb: Implement Rx SCTP CSO
  igb: Implement Tx SCTP CSO
  igb: Strip the second VLAN tag for extended VLAN
  igb: Filter with the second VLAN tag for extended VLAN
  igb: Implement igb-specific oversize check
  igb: Implement Rx PTP2 timestamp
  igb: Implement Tx timestamp
  e1000e: Notify only new interrupts
  igb: Notify only new interrupts
  vmxnet3: Do not depend on PC
  MAINTAINERS: Add a reviewer for network packet abstractions
  docs/system/devices/igb: Note igb is tested for DPDK

 MAINTAINERS                                   |   3 +-
 docs/system/devices/igb.rst                   |  14 +-
 hw/net/e1000e_core.h                          |   2 -
 hw/net/e1000x_common.h                        |   9 +-
 hw/net/e1000x_regs.h                          |  24 +-
 hw/net/igb_common.h                           |  24 +-
 hw/net/igb_regs.h                             |  67 +-
 hw/net/net_rx_pkt.h                           |  38 +-
 hw/net/net_tx_pkt.h                           |  46 +-
 include/net/eth.h                             |  29 +-
 include/qemu/crc32c.h                         |   1 +
 hw/net/e1000.c                                |  41 +-
 hw/net/e1000e_core.c                          | 282 +++----
 hw/net/e1000x_common.c                        |  79 +-
 hw/net/igb.c                                  |  10 +-
 hw/net/igb_core.c                             | 711 ++++++++++--------
 hw/net/igbvf.c                                |   7 -
 hw/net/net_rx_pkt.c                           | 107 ++-
 hw/net/net_tx_pkt.c                           | 101 ++-
 hw/net/virtio-net.c                           |   7 +-
 hw/net/vmxnet3.c                              |  22 +-
 net/eth.c                                     | 100 +--
 tests/qtest/libqos/igb.c                      |   1 +
 util/crc32c.c                                 |   8 +
 hw/net/Kconfig                                |   2 +-
 hw/net/trace-events                           |  19 +-
 .../org.centos/stream/8/x86_64/test-avocado   |   3 +-
 tests/avocado/netdev-ethtool.py               |  17 +-
 28 files changed, 960 insertions(+), 814 deletions(-)

-- 
2.40.0


