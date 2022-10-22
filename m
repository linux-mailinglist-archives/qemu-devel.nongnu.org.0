Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C020608484
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 07:26:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Jz-0005Eg-5S; Sat, 22 Oct 2022 00:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jt-0005EK-CY
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:14 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Jr-0003Gl-B6
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:12 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k9so4059581pll.11
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSduAt5OWvLla49AODdFswSKTVSp8teWN5RFR6WXygs=;
 b=IGZTGdBA+0XF3fkB1E2JfP1QnJz5sVhf+uYum/WaWJ5OYXRx+7RXTFM23oKRh4Bv+i
 vovKHRhn1shdCW+SQUcWD9g780RMZwdRs1PMHXaBQpWJzMdhf/jW+xusemhLYaozOdU4
 YLrshT6NYyc7Nhx+W2hX8Smqwtf5gQrrYuWLacjiIl+j7POrvANX6s80hyPFtJEkllh5
 bZ5zNlZdpa+8VNl4Y8W0Lrt6f95I7+MkDkVwdVjpY13JGpSpRTMN3FaevQB0BFb6j9Ha
 Bka1PXUni/61yAUnjugi6F1NLn6RgLL2tjML0dCFEalxt8aPXTtciERu1j7DM0oF8l+h
 iu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSduAt5OWvLla49AODdFswSKTVSp8teWN5RFR6WXygs=;
 b=vDzhcFoxvY22zllipoVlz+/2ppIiNzQHZfcjyaNdsadHpBurJjf5Di2ySCmFwuw8Ly
 cQ8mwrzfsgl3+hv9eqfATnZfjpyPcH/GO8LOYtsAbC8KX2jApR3x3UuWG8bdlW3ekMFx
 2zTRHf6jqVDdgfVRsEwl4AhRZyXOLhJNlyTorzpvvsFpo3STuKEANXD3tlJuqK+Mz5Nz
 NNFDmqvD2iwvB7PzoNnKIDif6uQ5zu9P4WvWcelh6iYJebXMfahBcE7g0PntDaX+WX1R
 TZFoSHR6NPXhyNPSFPr4wMck4RQYuYlqGVr5wjg2XKIXECstqb5zcbwngzp/Xscjcooo
 EUiA==
X-Gm-Message-State: ACrzQf2nepu2eaKdyIzrAN/4UTuciEcrn7JmhcDX3vlmUjKxIOxVk7Eh
 3V7BlRYpLBzgGi722Webr6gZKw==
X-Google-Smtp-Source: AMsMyM5wCZaYTVGhuUJZQdQ76DrG4TC8wXs/c3iioocYXz4RGOHm6PJSdQxBZI9gD03bbgeB4l0S3Q==
X-Received: by 2002:a17:90b:d98:b0:212:d3f9:c311 with SMTP id
 bg24-20020a17090b0d9800b00212d3f9c311mr6195585pjb.243.1666413668637; 
 Fri, 21 Oct 2022 21:41:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:08 -0700 (PDT)
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
Subject: [PATCH v2 00/17] pci: Abort if pci_add_capability fails
Date: Sat, 22 Oct 2022 13:40:36 +0900
Message-Id: <20221022044053.81650-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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

v2: Split the patch (Markus Armbruster)

Akihiko Odaki (17):
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
  hw/vfio/pci-quirks: Omit errp for pci_add_capability
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


