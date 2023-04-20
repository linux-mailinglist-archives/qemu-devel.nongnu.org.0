Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88A6E89B0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:49:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN95-0006mD-4p; Thu, 20 Apr 2023 01:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN8w-0006jo-Lp
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:43 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN8u-00010X-BT
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:42 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso575123a12.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969658; x=1684561658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uMnGgGozdlsS6ZTe7QO3Rjr/jheDt2BHG1a7qaIPMuM=;
 b=x6z5MwFVFcfCBdqTrpTCX0Nojusnw6qugyp7VIZjmV7tyaa2ZvuQ8pAjQzRTdS1UU1
 AnU5OfXvZLscnGoZiA39V/+YsUpn7WknM3BGbT3lCeKh69ozHSChwgcSjqFJsfLLZ558
 Nic8qH76mUCBvtUqslqCSP8y+QBA/3ayAHJhAns+ISlZ0W6zIXfKz2ts7AG0f7UEXdir
 1nvencXpFbBSry9cqn3lAEbdFlGzIC1M5RO5bZDEQGxzSc/OJwQAK4i+ZsvGXIXzEVwy
 4V+/kFJ56/01K4h8A6qHtwmJUHW05um6XXmgsxnLHVVOztu7T7SaNubUTcuPkKl1IrBZ
 whhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969658; x=1684561658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uMnGgGozdlsS6ZTe7QO3Rjr/jheDt2BHG1a7qaIPMuM=;
 b=hn9fkUbirS0NuX02l8Nfv2yKFRnn50VmMUn7GC1IHvfQX+EPhX1WQsL0wqy3iZSrT+
 VEyzooNWyHKAbLxLLXEXau7ZxSFYgEOgMDnTOwtuB4O1l01FdIALzrMddJWNlsIDkIMW
 w0GQX6KRdN5iaxwRJAj74ZOv26sxo/6BSJBodDBR0x7EJMMX+Z8j8NtgWmp7gAcWsnPR
 UekE0A2i7wiuicBTTOanyVLhTJiKGk9mr5i1sC91aPT9NRk/BQ7vYsein8JYKXlYXwfk
 VHG3zt86awxJo3z4fV2ilEiZycwfKTyfxVallut+4s1rmVpdGRv5AJoqRhT3DWqz9Rr/
 iwwQ==
X-Gm-Message-State: AAQBX9fRYOT9BZf/wlTB4B25zjgqEMEhEQwcuoRHtRmJqo1hGZ6IsINJ
 Z09Rm07jusvimD7Ynm/IuhXy6A==
X-Google-Smtp-Source: AKy350YyEKtaX6HoMsxlgXHdtdFfr8rDPS3X+2htzSjvRMurCYyITa3nG4xbB3wDjhOHpeQwt433kQ==
X-Received: by 2002:a17:90b:4f47:b0:236:73d5:82cf with SMTP id
 pj7-20020a17090b4f4700b0023673d582cfmr620422pjb.9.1681969657719; 
 Wed, 19 Apr 2023 22:47:37 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:47:37 -0700 (PDT)
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
Subject: [PATCH v2 00/41] igb: Fix for DPDK
Date: Thu, 20 Apr 2023 14:46:16 +0900
Message-Id: <20230420054657.50367-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52c.google.com
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

This series has fixes and feature additions to pass DPDK Test Suite with
igb. It also includes a few minor changes related to networking.

Patch [01, 09] are bug fixes.
Patch [10, 13] delete code which is unnecessary.
Patch [14, 29] are minor changes.
Patch [30, 39] implement new features.
Patch [40, 41] update documentations.

While this includes so many patches, it is not necessary to land them at
once. Only bug fix patches may be applied first, for example.

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

Akihiko Odaki (41):
  hw/net/net_tx_pkt: Decouple implementation from PCI
  hw/net/net_tx_pkt: Decouple interface from PCI
  e1000x: Fix BPRC and MPRC
  igb: Fix Rx packet type encoding
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
  vmxnet3: Do not depend on PC
  MAINTAINERS: Add a reviewer for network packet abstractions
  docs/system/devices/igb: Note igb is tested for DPDK

 MAINTAINERS                                   |   3 +-
 docs/system/devices/igb.rst                   |  14 +-
 hw/net/e1000x_common.h                        |   9 +-
 hw/net/e1000x_regs.h                          |  24 +-
 hw/net/igb_common.h                           |  24 +-
 hw/net/igb_regs.h                             |  67 ++-
 hw/net/net_rx_pkt.h                           |  38 +-
 hw/net/net_tx_pkt.h                           |  46 +-
 include/net/eth.h                             |  29 +-
 include/qemu/crc32c.h                         |   1 +
 hw/net/e1000.c                                |  41 +-
 hw/net/e1000e_core.c                          | 111 ++--
 hw/net/e1000x_common.c                        |  79 ++-
 hw/net/igb.c                                  |  10 +-
 hw/net/igb_core.c                             | 485 +++++++++++-------
 hw/net/igbvf.c                                |   7 -
 hw/net/net_rx_pkt.c                           | 107 ++--
 hw/net/net_tx_pkt.c                           | 101 ++--
 hw/net/virtio-net.c                           |   7 +-
 hw/net/vmxnet3.c                              |  22 +-
 net/eth.c                                     | 100 ++--
 tests/qtest/libqos/igb.c                      |   1 +
 util/crc32c.c                                 |   8 +
 hw/net/Kconfig                                |   2 +-
 hw/net/trace-events                           |   6 +-
 .../org.centos/stream/8/x86_64/test-avocado   |   2 +-
 tests/avocado/netdev-ethtool.py               |  13 +-
 27 files changed, 781 insertions(+), 576 deletions(-)

-- 
2.40.0


