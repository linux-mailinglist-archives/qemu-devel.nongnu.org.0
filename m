Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367C6A06B0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9Bw-00071h-Sj; Thu, 23 Feb 2023 05:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9Bu-0006yz-Up
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:10 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9Bs-0003cW-A9
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso12173783pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ND06l5bFYTlxmwZ46HaGpWIniohCFdLfzOyC9d6SWXI=;
 b=uQgc3omxypTPy2GDU/FtYDwPgZpelpXl0jOJ13eXz++t9kK61DC6NkHqkFTfh/0PlB
 FlNKpHIVMafTShMXtV58r8EkmDkqss1VdAHWb8lW3C8fIVzHFtq0tlpJH9ydDs+s99RI
 lHp1fM09AIJhxux4dyRsYOeSpzdTNPUT2ENMug5skWmgO8XG8/B2/IZ8fbAtV6XdiM8c
 bcqwFP5t7Bv6TrjPKHMeyNH5BbzSP882ncxIIgtJ6DhqG1wZPqnOCm9yvwXwTjc4Tf2t
 Y3GL9uYhqMYaZGz3Y2EgbOuM1Yt0b3Vw1QNCl8lEoJVRmo8qRLp4Rx6I1a7odXRahnVh
 HVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ND06l5bFYTlxmwZ46HaGpWIniohCFdLfzOyC9d6SWXI=;
 b=q78ri+180nCsk4zPIFHzF6LGRaGRSBD2nuW4liW4ezL/T8yQRDucUE0C74SABV0cg2
 bRp9fun8JVsBXhDaj0bpg09910PatjV67MmfULmybqhvR/k/w/pTDrQ02b14Hych4DBX
 qPcL5cr8dNU02EOOWscUTQjy1wkB4XD3Azg/qu+vtSiT6ol6R684TKOSqBGCWj1e0opd
 sPN8cvhRcSoo204OFOJJuVz/vbq33fg3nSLvWXs/Rt/naYs/rt/LgNQBrAeCzsjsCEUY
 CJG1IeOR+vV2cCw5z6S/As2qbjXeINXTuUygmAH1HctSj+8hJsr1BBkkgTkvr+djp641
 1YXw==
X-Gm-Message-State: AO0yUKXld/n+k3xmwKlsZmiHLCxGsTMh3Uf6qzJzM8e9Qh4hmS8uPKgF
 yRxd8Wd9ybk1Jh2fw5dPaV50UA==
X-Google-Smtp-Source: AK7set9mRrTcyuSiGb1CCsF+MYEp5jmxCqI5SUUbleYID283DKO8HBUVKHOAxZl6+VVQkXjZETapEA==
X-Received: by 2002:a05:6a21:6d9a:b0:c7:2c0e:b1e6 with SMTP id
 wl26-20020a056a216d9a00b000c72c0eb1e6mr15719403pzb.15.1677149466915; 
 Thu, 23 Feb 2023 02:51:06 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a6384c1000000b004fb26a80875sm4477692pgd.22.2023.02.23.02.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:51:06 -0800 (PST)
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
Subject: [PATCH v9 0/9] Introduce igb
Date: Thu, 23 Feb 2023 19:50:48 +0900
Message-Id: <20230223105057.144309-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Based-on: <20230223102018.141748-1-akihiko.odaki@daynix.com>
([PATCH v6 00/34] e1000x cleanups (preliminary for IGB))

igb is a family of Intel's gigabit ethernet controllers. This series implements
82576 emulation in particular. You can see the last patch for the documentation.

Note that there is another effort to bring 82576 emulation. This series was
developed independently by Sriram Yagnaraman.
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

- V8 -> V9:
- Rebased.
- Added patch "net/eth: Introduce EthL4HdrProto". This is not strictly necessary
  yet but I'm still adding it because it will be necessary soon and it touches
  some code common for igb and e1000e.
- Replaced Linux internal types in hw/net/igb_regs.h with standard ones.

V7 -> V8:
- Removed obsolete patch
  "hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr" (Cédric Le Goater)

V6 -> V7:
- Reordered statements in igb_receive_internal() so that checksum will be
  calculated only once and it will be more close to e1000e_receive_internal().

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
  net/eth: Introduce EthL4HdrProto
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
 hw/net/e1000_regs.h                           |  954 +---
 hw/net/e1000e.c                               |    3 +-
 hw/net/e1000e_core.c                          |   60 +-
 hw/net/e1000x_common.c                        |    1 +
 hw/net/e1000x_common.h                        |   74 -
 hw/net/e1000x_regs.h                          |  967 ++++
 hw/net/igb.c                                  |  615 +++
 hw/net/igb_common.h                           |  146 +
 hw/net/igb_core.c                             | 4076 +++++++++++++++++
 hw/net/igb_core.h                             |  146 +
 hw/net/igb_regs.h                             |  648 +++
 hw/net/igbvf.c                                |  327 ++
 hw/net/meson.build                            |    2 +
 hw/net/net_rx_pkt.c                           |   48 +-
 hw/net/net_rx_pkt.h                           |    5 +-
 hw/net/trace-events                           |   40 +-
 hw/net/virtio-net.c                           |   67 +-
 hw/net/vmxnet3.c                              |   22 +-
 hw/pci/pcie_sriov.c                           |    5 +
 include/hw/pci/pcie_sriov.h                   |    3 +
 include/net/eth.h                             |    8 +-
 net/eth.c                                     |   26 +-
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
 38 files changed, 7809 insertions(+), 1148 deletions(-)
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


