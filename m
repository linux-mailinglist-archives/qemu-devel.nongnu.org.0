Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9F68A830
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAI3-0005U1-AR; Fri, 03 Feb 2023 23:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAI0-0005TH-U9
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:36:36 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAHy-0008NS-Vd
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:36:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o16-20020a17090ad25000b00230759a8c06so3769849pjw.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 20:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WmaDtMphVqK9IOq4lwIjL+8AQ4n1dPuzwa2XvX777E8=;
 b=06IgdpBIlGLi8LH0PLB6lLnhr0dBHlxu5lEHLstbi6L+wW9JF4SDy+UKMBULZyc3gt
 uSzrThOJTrU3riWvwLw/gaSMGjn72+tV7DPJCIoo2WjDpO0W/Q8FjVqnH4Q4Qc2FU57E
 ptyL6+Lr9pN1AG2izn7uffBTzlmQlC/5pvfOhW59I3WiL+bhaP2dE5PTaw2lJ6KKVG+n
 I2voJJf+mqrd5GkKGN0mDNOSx7R09bXOsb6gWXFef1fu59T63Li3RoDTSizWjXTmD4e2
 3toc+NkQRmrf60H9s7KMgOhcOqmh90itxxpFuCakr9wOV0OfIlGQhXefmgVV4W3OgPVQ
 i7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WmaDtMphVqK9IOq4lwIjL+8AQ4n1dPuzwa2XvX777E8=;
 b=zYKz3SjQmEdirHBEpbvZxF+2x4iW4fR97UN8bzjZSM+DrPNZN7jJwG0itKYNkv+BA/
 sVtOFXe/dDhPl5D7VwXR9q5YchYYdvOCklXK+qWSxxLHPzaJ6pYsCgcboACeHUHuqAwd
 cxQbQVCzhz98nfXCOplOL/Iz932/BDSP/W34WxkkyemZU8RJlA60bsKkfxG9ZhXMB6em
 UmOFhgs6F/1V5Ji9y01yvfgGDZETu58yDwAs9oNiSCeX2g4bFLEBjZmhZQSb0OA3ccTz
 TM3VgALMqAcgi5itFaXjEEciyBBwhzJZH0/JKNRKW2mXH8owZ7B3i54SfOctnoOnLQyE
 rwyQ==
X-Gm-Message-State: AO0yUKWnEA0ZLIox1Qm9ZSnio7JxUPB+wPS6fPDeRwiGbNRh9fjWDQ41
 KZlKqVEjIGT5Scnu7WPCp0D+PA==
X-Google-Smtp-Source: AK7set/nYTPWii8Z33656Hjx7UdTkQvHjTBaTNDI1tncMZuJxZVI66ycatyEfm82gJblTl+Qry/u2g==
X-Received: by 2002:a17:90b:33c5:b0:22c:4cb5:6f14 with SMTP id
 lk5-20020a17090b33c500b0022c4cb56f14mr12977064pjb.13.1675485393053; 
 Fri, 03 Feb 2023 20:36:33 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a17090adb0700b002308f6e7f41sm225707pjv.55.2023.02.03.20.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 20:36:32 -0800 (PST)
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
Subject: [PATCH v8 0/8] Introduce igb
Date: Sat,  4 Feb 2023 13:36:13 +0900
Message-Id: <20230204043621.13540-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
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

Akihiko Odaki (8):
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
 32 files changed, 7600 insertions(+), 1022 deletions(-)
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


