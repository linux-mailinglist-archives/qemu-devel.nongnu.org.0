Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6760EA27
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:20:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmoc-00012p-0M; Wed, 26 Oct 2022 16:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoV-0000Ym-U7
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoQ-00030P-BT
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w189so15130879pfw.4
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mBLioZF7FIfPiiXZI7zrDZNaj5V1Nm3VfuGCmSWLcXg=;
 b=i7qUgHdRG6YIjQ7u2vFLRd4PqeOJcLVcgzGgxfXPs0QTMCbsyohvAC13u/PJNjU0a7
 gnWIpxpSPzB0y1Fp3/un+gSQYDo1XgBbbX1tgxtvIlvLAJrU4lr5lLXM61YBKDO6bWC7
 ynv7J7paGWOCdMAlLz+0xLc+DGHADiF6fQW4vUp9IR2mK7qeUUDl2gl1Pqe2//M9P0n6
 OaCMvpO02KEctwWgUZeBgpsbSBx6kqBDTxm7w8pk2wwesGS0Q8KC9wCjO/T3n2Oi/0bm
 FCoii50udnaEWo/3/s9HMXeKYtvvLrcfBynNiCkjiMu8YYxUd7U0TUYWDD5WXmdZx0BJ
 lj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBLioZF7FIfPiiXZI7zrDZNaj5V1Nm3VfuGCmSWLcXg=;
 b=k4QGOIoJ+MZMiuDEEdL2MCh3xjKDa62kBD+ZfGTfOvxBZ58nNrLexeVlTBWr0pBAYH
 DO4j7zABeJt5uHZX2MnIHP08bCx4onD0RVnlcEyRojEzy9sOSKOtu104UQbFIYePXSea
 oPVegDbeUXQRWYYwZkn9kDoeFUBp5+xiQ9XnBhSV/1FxxP3evn4Tzw+1bs5Lt0OFtov4
 fmsdOFHbTWc8jfFdYwTCPSt40INmyf7fDG/fUWwespK3uT/wj4QBreHH4NMI7pYZWPey
 ZExMlxV9oPTX4O4E5BJUsVs2sph2NUQcTAlI/Y2TgLG99lqhVSMvwvr5twGr34z8xGFl
 6h3Q==
X-Gm-Message-State: ACrzQf2uj+8aLWHEsHcs/s3dC5iDPcoUREQKsxqy0kmWt+en/AGE+EVM
 Sa8b3zZjE8U3yHPRA3KgsgKMxA==
X-Google-Smtp-Source: AMsMyM5VuDNgvAdxF4fKrt1Swm9gTwW6ZdD36TufcASn74bmZqq4vHz1+C1DO8Y0ZF/g0NIQRYfbAg==
X-Received: by 2002:aa7:88c9:0:b0:56b:e851:5b67 with SMTP id
 k9-20020aa788c9000000b0056be8515b67mr15458611pff.78.1666815340190; 
 Wed, 26 Oct 2022 13:15:40 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:15:39 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 00/16] pci: Abort if pci_add_capability fails
Date: Thu, 27 Oct 2022 05:15:11 +0900
Message-Id: <20221026201527.24063-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pci_add_capability appears most PCI devices. Its error handling required
lots of code, and led to inconsistent behaviors such as:
- passing error_abort
- passing error_fatal
- asserting the returned value
- propagating the error to the caller
- skipping the rest of the function
- just ignoring

The code generating errors in pci_add_capability had a comment which
says:
> Verify that capabilities don't overlap.  Note: device assignment
> depends on this check to verify that the device is not broken.
> Should never trigger for emulated devices, but it's helpful for
> debugging these.

Indeed vfio has some code that passes capability offsets and sizes from
a physical device, but it explicitly pays attention so that the
capabilities never overlap. Therefore, we can always assert that
capabilities never overlap when pci_add_capability is called, resolving
these inconsistencies.

v3:
- Correct patch split between virtio-pci and pci (Markus Armbruster)
- Add messages for individual patches (Markus Armbruster)
- Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

v2: Split the patch (Markus Armbruster)

Akihiko Odaki (16):
  pci: Allow to omit errp for pci_add_capability
  hw/i386/amd_iommu: Omit errp for pci_add_capability
  ahci: Omit errp for pci_add_capability
  e1000e: Omit errp for pci_add_capability
  eepro100: Omit errp for pci_add_capability
  hw/nvme: Omit errp for pci_add_capability
  msi: Omit errp for pci_add_capability
  hw/pci/pci_bridge: Omit errp for pci_add_capability
  pcie: Omit errp for pci_add_capability
  pci/shpc: Omit errp for pci_add_capability
  msix: Omit errp for pci_add_capability
  pci/slotid: Omit errp for pci_add_capability
  hw/pci-bridge/pcie_pci_bridge: Omit errp for pci_add_capability
  hw/vfio/pci: Omit errp for pci_add_capability
  virtio-pci: Omit errp for pci_add_capability
  pci: Remove legacy errp from pci_add_capability

 docs/pcie_sriov.txt                |  4 +--
 hw/display/bochs-display.c         |  4 +--
 hw/i386/amd_iommu.c                | 21 +++---------
 hw/ide/ich.c                       |  8 ++---
 hw/net/e1000e.c                    | 22 +++----------
 hw/net/eepro100.c                  |  7 +---
 hw/nvme/ctrl.c                     | 14 ++------
 hw/pci-bridge/cxl_downstream.c     |  9 ++----
 hw/pci-bridge/cxl_upstream.c       |  8 ++---
 hw/pci-bridge/i82801b11.c          | 14 ++------
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 19 +++--------
 hw/pci-bridge/pcie_root_port.c     | 16 ++-------
 hw/pci-bridge/xio3130_downstream.c | 15 ++-------
 hw/pci-bridge/xio3130_upstream.c   | 15 ++-------
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +--
 hw/pci/msi.c                       |  9 +-----
 hw/pci/msix.c                      |  8 ++---
 hw/pci/pci.c                       | 29 ++++-------------
 hw/pci/pci_bridge.c                | 21 ++++--------
 hw/pci/pcie.c                      | 52 ++++++++----------------------
 hw/pci/shpc.c                      | 23 ++++---------
 hw/pci/slotid_cap.c                |  8 ++---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-------
 hw/vfio/pci.c                      | 14 +++-----
 hw/virtio/virtio-pci.c             | 12 ++-----
 include/hw/pci/pci.h               |  5 ++-
 include/hw/pci/pci_bridge.h        |  5 ++-
 include/hw/pci/pcie.h              | 11 +++----
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 33 files changed, 99 insertions(+), 306 deletions(-)

-- 
2.37.3


