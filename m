Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE466A932
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:24:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXsR-000677-1q; Fri, 13 Jan 2023 23:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXsF-0005xE-AR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:34 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXs8-0007Gx-7S
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:28 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 q23-20020a17090a065700b002290913a521so6613585pje.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pDqlwrTXIC/XvWAdCrdQvHf0UnmfCqQFAbM4oK6h6y4=;
 b=pUXpEDIQHwJSLCxpGRw0+z/mFiT2glVblrwstmFtu9WfFZlj2F7zGMXozlH5z2yUKD
 rRrCzVlo4pg/WmlqhJH8o9MN2B1diVRvhDZK8+o+r9vLA+nj/jzS1lfHZl6sOEZOlCfu
 3VFulynHYj9sB/glTBkhPJlLHTHFE75h96hxbw2Tpicty77eNXucIIvgZl/3B2QcAqW9
 4JCDm8RgbbYZrwTztBSTHu/Bc2XbeAXXM5NQWQjcb3J+lXHWlBWSEpsSnbm0pnPr+WMh
 +gvSefo24Pf/Ty8oFnHnACCkizwbjON/c1JXsCpjk+CPGDg2aSO+WQHEI3hjKLPrd1dT
 3EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDqlwrTXIC/XvWAdCrdQvHf0UnmfCqQFAbM4oK6h6y4=;
 b=AGpwVehEK77UQpZFolvgg+Ez9Kv0XKwNGB9eEzsVywuLLCNrYuKDmzFzdJG1ujTV7L
 +m4ZDx1GRrEgUXrVfdR5wQT6mxdwXXsOmwy0ulQ8n69ntuYScAfwFqbhd77a/X3mK0GG
 Dmar+ukbEEtvbD7Ojdv0fLOARy6VcHh0CXEd55lH356gFrszxtqBny+tLDyhRcLEkX8J
 ydSue8PpGmt5rjOBZa6Rg0Go/kNJcuVXFZhvXWjaotZGxSfxd+ghMF1ZFZZyysl+Kzhb
 mkSh2VuU23LKO3SjPwKfpHegXJ2SmNBEF9RZ+avhfa/SMtv5gok6+sVTSs3ft0t9tUJW
 qUow==
X-Gm-Message-State: AFqh2ko5zl0Lcykc4EyMIexyNxDRvsns27fj+EAFTtuW0IDTM+nDfs94
 8V4QbaInct+hQ/TiGk9touBzvw==
X-Google-Smtp-Source: AMrXdXtvjPx0Wq8q15wtoc95MlM3I5bhll+TgQc6qkzl4NBg9Uybgt1byiRCVOgUjfp6gV1p0+ty0w==
X-Received: by 2002:a05:6a20:4907:b0:b2:46c0:81a9 with SMTP id
 ft7-20020a056a20490700b000b246c081a9mr86180975pzb.30.1673669423046; 
 Fri, 13 Jan 2023 20:10:23 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a63ef55000000b00478bd458bdfsm12244535pgk.88.2023.01.13.20.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:10:22 -0800 (PST)
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
 Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: [PATCH v2 00/13] Introduce igb
Date: Sat, 14 Jan 2023 13:09:51 +0900
Message-Id: <20230114041004.36459-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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

Based-on: <20230114035919.35251-1-akihiko.odaki@daynix.com>
([PATCH 00/19] e1000x cleanups (preliminary for IGB))

igb is a family of Intel's gigabit ethernet controllers. This series implements
82576 emulation in particular. You can see the last patch for the documentation.

Note that there is another effort to bring 82576 emulation. This series was
developed independently by Sriram Yagnaraman.
https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04670.html

It is possible to merge the work from Sriram Yagnaraman and to cherry-pick
useful changes from this series later.

I think there are several different ways to get the changes into the mainline.
I'm open to any options.

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
 docs/system/devices/igb.rst                   |   70 +
 hw/net/Kconfig                                |    5 +
 hw/net/e1000.c                                |    1 +
 hw/net/e1000_common.h                         |  102 +
 hw/net/e1000_regs.h                           |  927 +---
 hw/net/e1000e.c                               |    3 +-
 hw/net/e1000e_core.c                          |    1 +
 hw/net/e1000x_common.c                        |    1 +
 hw/net/e1000x_common.h                        |   74 -
 hw/net/e1000x_regs.h                          |  940 ++++
 hw/net/igb.c                                  |  615 +++
 hw/net/igb_common.h                           |  144 +
 hw/net/igb_core.c                             | 3946 +++++++++++++++++
 hw/net/igb_core.h                             |  147 +
 hw/net/igb_regs.h                             |  624 +++
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
 34 files changed, 7492 insertions(+), 1018 deletions(-)
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


