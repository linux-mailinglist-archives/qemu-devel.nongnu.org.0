Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A1666ED3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:59:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuLT-00037Q-41; Thu, 12 Jan 2023 04:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLQ-000370-LG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:00 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLO-0004Ie-8T
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:00 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso2151568pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5r2mf520QoVfcKkykYPraBiNlP93IUkzguSmUlxehao=;
 b=DqHf+JphL6f9LxnPTgU9zQVY+/frBlMKXRVBU7CMyTVNQvTmGQFKpta2otUpVhoBA4
 EUdnfPrO7d9tm2WCHzPMs2mq1BLBByXx7nMP7Q7m+LsMAhSyseyCWA+k0V+6E4IE3ox+
 RlxPJ7mhsLMHCCPlsU6g+GgC6Gxexlrxm85xl7VR8VXEqJQPWef4jkCUdAI+hdkUuSyQ
 gSsusplVd10mVDYoAVt0iBLQoNXAn3ZHjwXS17zXaCP/B1Dh9ICni0I7zxK1q3LEvDK1
 eUs/qv7cijQQpcA2LEoB8FhwXG/WGFEIpU3kMSCIqCGRy5TuTm5y5bo/6yIzg0y6ej5W
 YA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5r2mf520QoVfcKkykYPraBiNlP93IUkzguSmUlxehao=;
 b=lEnRN/gtuW3cvuXCp3rAV/KCCY6LzOjwi/pDvVRrj/P3x1JYjCAw1JHRJnsta0AwM9
 v8AGNJ3Zg8j8fg0Nz6U8i0CkfT1YNrF4joq5hObsrLKfJseZjkQgn9CrPQp0XMmCCLH2
 KA2CAezmqlfOcanTyGUtSxfNW/ml+Ppa+RCbQRVglpOlZa74wyB8rs9M3GC/JS2RQoNs
 ClsDKb1kqVeFVOGXZCsmAlfsIRJvl4YX43RY57bTlg+F57wOe04cxtZswXJKIDd+6/WH
 DFo7YzNUGym5y+aHvW0NJgr77Sx0Kso4K7XvslSy3fZZNImQym/Id+t0Bu7ahL8sW50/
 fewA==
X-Gm-Message-State: AFqh2kqoPahv17aQAB02LSOZbpX1HBsAPyVjIgAJiYMooTHQCYZyfEQS
 y/wyumxshiUUOP8Zqw0XRcIOGQ==
X-Google-Smtp-Source: AMrXdXvqysAryaZjiq2wu/n1mGT0GMNyP1teZoDrqakR0Zl/NI/LFyrWqqqmZQPaxF48vdG+e98srA==
X-Received: by 2002:a17:90b:904:b0:227:1452:70b4 with SMTP id
 bo4-20020a17090b090400b00227145270b4mr13909842pjb.22.1673517476362; 
 Thu, 12 Jan 2023 01:57:56 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:57:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 00/31] Introduce igb
Date: Thu, 12 Jan 2023 18:57:12 +0900
Message-Id: <20230112095743.20123-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
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

igb is a family of Intel's gigabit ethernet controllers. This series implements
82576 emulation in particular. You can see the last patch for the documentation.

Note that there is another effort to bring 82576 emulation. This series was
developed independently by Sriram Yagnaraman.
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

Patch 1 - 16 are general improvements for e1000 and e1000e.
Patch 17 - 18 are general improvements for e1000e test code.
Patch 19 - 21 makes necessary modifications to existing files.
Patch 22 starts off implementing igb emulation by copying e1000e code.
Patch 23 renames things so that it won't collide with e1000e.
Patch 24 makes building igb possible.
Patch 25 actually transforms e1000e emulation code into igb emulation.
Patch 26 - 27 makes modifications necessary for tests to existing files.
Patch 28 copies e1000e test code.
Patch 29 transforms e1000e test code into igb test code.
Patch 30 adds ethtool test automation.
Patch 31 adds the documentation.

The main reason why this series is so huge is that the early part of this series
includes general improvements for e1000e. They are placed before copying e1000e
code so we won't need to duplicate those changes for both of e1000e and igb code
later. As their utility do not depend on the igb implementation, they can be
merged earlier if necessary.

It is also possible to merge the work from Sriram Yagnaraman earlier than
patch 18+ and to cherry-pick useful changes from those patches later.

I think there are several different ways to get the changes into the mainline.
I'm open to any options.

Also be aware that most of e1000e patches are already sent to the mailing list.
The below are links to Patchew:
03: https://patchew.org/QEMU/20221103060103.83363-1-akihiko.odaki@daynix.com/
04: https://patchew.org/QEMU/20221125135254.54760-1-akihiko.odaki@daynix.com/
05: https://patchew.org/QEMU/20221119054913.103803-1-akihiko.odaki@daynix.com/
06: https://patchew.org/QEMU/20221119055304.105500-1-akihiko.odaki@daynix.com/
08 includes: https://patchew.org/QEMU/20221119060156.110010-1-akihiko.odaki@daynix.com/
10: https://patchew.org/QEMU/20221125140105.55925-1-akihiko.odaki@daynix.com/
11: https://patchew.org/QEMU/20221125142608.58919-1-akihiko.odaki@daynix.com/
13: https://patchew.org/QEMU/20221201095351.63392-1-akihiko.odaki@daynix.com/
14: https://patchew.org/QEMU/20221201100113.64387-1-akihiko.odaki@daynix.com/
15: https://patchew.org/QEMU/20230107143328.102534-1-akihiko.odaki@daynix.com/

Akihiko Odaki (31):
  e1000e: Fix the code style
  hw/net: Add more MII definitions
  fsl_etsec: Use hw/net/mii.h
  e1000: Use hw/net/mii.h
  e1000: Mask registers when writing
  e1000e: Mask registers when writing
  e1000: Use more constant definitions
  e1000e: Use more constant definitions
  e1000: Use memcpy to intialize registers
  e1000e: Use memcpy to intialize registers
  e1000e: Remove pending interrupt flags
  e1000e: Improve software reset
  e1000: Configure ResettableClass
  e1000e: Configure ResettableClass
  e1000e: Introduce e1000_rx_desc_union
  e1000e: Set MII_ANER_NWAY
  tests/qtest/e1000e-test: Fix the code style
  tests/qtest/libqos/e1000e: Remove duplicate register definitions
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
 docs/system/devices/igb.rst                   |   70 +
 hw/net/Kconfig                                |    5 +
 hw/net/e1000.c                                |  250 +-
 hw/net/e1000_common.h                         |  104 +
 hw/net/e1000_regs.h                           |  958 +---
 hw/net/e1000e.c                               |   90 +-
 hw/net/e1000e_core.c                          |  491 +-
 hw/net/e1000e_core.h                          |   68 +-
 hw/net/e1000x_common.c                        |   12 +-
 hw/net/e1000x_common.h                        |  128 +-
 hw/net/e1000x_regs.h                          |  940 ++++
 hw/net/fsl_etsec/etsec.c                      |   11 +-
 hw/net/fsl_etsec/etsec.h                      |   17 -
 hw/net/fsl_etsec/miim.c                       |    5 +-
 hw/net/igb.c                                  |  594 +++
 hw/net/igb_common.h                           |  146 +
 hw/net/igb_core.c                             | 3934 +++++++++++++++++
 hw/net/igb_core.h                             |  146 +
 hw/net/igb_regs.h                             |  624 +++
 hw/net/igbvf.c                                |  327 ++
 hw/net/meson.build                            |    2 +
 hw/net/net_tx_pkt.c                           |    6 +
 hw/net/net_tx_pkt.h                           |    8 +
 hw/net/trace-events                           |   34 +-
 hw/pci/pcie_sriov.c                           |    5 +
 include/hw/net/mii.h                          |   14 +-
 include/hw/pci/pcie_sriov.h                   |    3 +
 .../org.centos/stream/8/x86_64/test-avocado   |    1 +
 tests/avocado/igb.py                          |   38 +
 tests/qtest/e1000e-test.c                     |   19 +-
 tests/qtest/fuzz/generic_fuzz_configs.h       |    5 +
 tests/qtest/igb-test.c                        |  243 +
 tests/qtest/libqos/e1000e.c                   |   38 +-
 tests/qtest/libqos/e1000e.h                   |   17 +-
 tests/qtest/libqos/igb.c                      |  185 +
 tests/qtest/libqos/meson.build                |    1 +
 tests/qtest/meson.build                       |    1 +
 39 files changed, 7970 insertions(+), 1580 deletions(-)
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


