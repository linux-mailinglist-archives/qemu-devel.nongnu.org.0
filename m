Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4767C9C5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:23:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0IV-0001uC-PU; Thu, 26 Jan 2023 06:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IO-0001rw-TI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:19:56 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IM-0001Tw-GV
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:19:56 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d9so1524145pll.9
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ujatnH5B2GeAxHobLWDXLcVwJmJ4RC+XnW58fee841g=;
 b=fivxjwQG/euI1st6ViU+FbDs3TqoAgfnXlD15HG6WbD3aWy2hYEDhA5e7H3HGCfdFW
 0R9sIWJJz/hi14mrGi2GP74sS841h/thYFqkDz1/eovM9VCIGRauPg3Lx0unJ2XTSDeL
 fZ9nLmtZnkzP80rA2nMvw/Ene24iDDYSZSqMDBvU0s7K6clQfRisppY3bdphEg1QneDh
 P/z9EpVHonqZ/VQ8sw5GZXsQiOeh8NuWuXOPFd/a8q4DlnB0W1EbYJldSbbSbkyuC9EJ
 6VPIQ7Y4Y73tBF/fcIoJmm2pjFfY+F2/peLmCZnkVuJEQqqi9JCv2B0RB8rZ/3VmdTst
 t8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ujatnH5B2GeAxHobLWDXLcVwJmJ4RC+XnW58fee841g=;
 b=NN1R5eDPkbQk3AzM01T9sonowYQ6Eh4KmUtZUnEKdOx4wSZWjrLeJMnogqn17YPh8N
 VeMUMzRb1/MZN75s0gLjFjrsMX97/8i5T9BzIuG9s90B6UX/tNDUeBvKR7LBBstCHPio
 9P/M0QQRus4wE/yfwZmzTUGbBos+gZhNuB2aca/l2KON4nXPpsJXkY1Bu2IMc1Eayr0s
 0kXhdPA/uwHpm/xSmnh3gxVhzcqgJIThdn1zciW2pVCUJo0qMb69BoGD4y8hRwXYU7K3
 LM286BjwfdhmtqHmErUsfej9CnSOmmhQh90WPLgXdU5m85IfedHlxqId8H5nQEOnDXJh
 0Jlg==
X-Gm-Message-State: AFqh2kpurwOZ1sRByGF85OKwf383xbO/YeHhQ3Xb/VN61yClmzlpvwqQ
 5bmXBIvpA5zBY2RQWJmFGUf8cw==
X-Google-Smtp-Source: AMrXdXtDJf5kGSfqddMWbLr85B0ZGG5F2d5j08EepD3aRN9k0xp9x/i1hHmcjHWIxmn5Gd0ukd93qA==
X-Received: by 2002:a17:90a:7309:b0:228:e521:3430 with SMTP id
 m9-20020a17090a730900b00228e5213430mr36997299pjk.21.1674731992579; 
 Thu, 26 Jan 2023 03:19:52 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:19:52 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 00/13] Introduce igb
Date: Thu, 26 Jan 2023 20:19:30 +0900
Message-Id: <20230126111943.38695-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
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

Based-on: <20230126104705.35023-1-akihiko.odaki@daynix.com>
([PATCH v3 00/26] e1000x cleanups (preliminary for IGB))

igb is a family of Intel's gigabit ethernet controllers. This series implements
82576 emulation in particular. You can see the last patch for the documentation.

Note that there is another effort to bring 82576 emulation. This series was
developed independently by Sriram Yagnaraman.
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

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

Akihiko Odaki (13):
  hw/net/net_tx_pkt: Introduce net_tx_pkt_get_eth_hdr
  pcie: Introduce pcie_sriov_num_vfs
  e1000: Split header files
  igb: Copy e1000e code
  igb: Rename identifiers
  igb: Build igb
  igb: Transform to 82576 implementation
  tests/qtest/e1000e-test: Fabricate ethernet header
  tests/qtest/libqos/e1000e: Export macreg functions
  tests/qtest/libqos/igb: Copy e1000e code
  tests/qtest/libqos/igb: Transform to igb tests
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
 hw/net/igb.c                                  |  614 +++
 hw/net/igb_common.h                           |  146 +
 hw/net/igb_core.c                             | 4058 +++++++++++++++++
 hw/net/igb_core.h                             |  146 +
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
 tests/qtest/e1000e-test.c                     |   17 +-
 tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
 tests/qtest/igb-test.c                        |  243 +
 tests/qtest/libqos/e1000e.c                   |   12 -
 tests/qtest/libqos/e1000e.h                   |   14 +
 tests/qtest/libqos/igb.c                      |  185 +
 tests/qtest/libqos/meson.build                |    1 +
 tests/qtest/meson.build                       |    1 +
 34 files changed, 7629 insertions(+), 1018 deletions(-)
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
2.39.0


