Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B5860F081
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:43:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwX3-0004tJ-EZ; Thu, 27 Oct 2022 02:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwW3-0002Uu-Dh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwVw-000384-Uz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:37:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c24so453899pls.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IsjfPdDs9vxcJnc8Gf69tqk05C2cU0fphi4VR7vZdx0=;
 b=TyERu5xqVfxbKxlnzKklJJiDCyMyhNFW8uYMbnlX+KWL0hexjbm7/14/WlMlp+Tac6
 l5T7GpKPXrv1kPuuBjShRVAzfeaaxu5GW9IJMCc0SlbUZ0wb5Y1kfidIoWWcsIctFXfu
 2PWBeha28a+L/cyTU+V+lD2kyu93JufZW6c5jiNo9olQqUCYiK4Q4j681qziFincSCeU
 U3BltVSalsWySr570jEz2dQgo0Ef81ZTOxrvpIPwu3a1/L8iDTpnDt+/cTFmUiubFP2f
 FRBBPOH/sg0OAApkLQkeKZm8avOoA8Zcm4e6wMsqps1R9fxwH8m2AKKXkgrDRGewo2DV
 C+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IsjfPdDs9vxcJnc8Gf69tqk05C2cU0fphi4VR7vZdx0=;
 b=Jb5rzqaE4pbhNiJARwUdc5gyTTVKipMwOcLgi868K0SgJoHL+/O4tDDLHUOdPwkxZK
 zNx43f5etcvMQaIogKxA1ybPk7KsT1KzkkwTbDJYQjHIPlMgQJl1x1FSaghR4cyrGy25
 Md8y5hxJG7CFHPKY9zhW0llw3TOxGKooS9VKVbP6/0Vcm8yXg8zRCkbu5Ir4n6N18o+0
 RL/L3XM9dOJytiHQ+Y9bo2A/auoYYGWBkbf0p+KRbsrIO12fr5BJFELrCnKUwLuA12wA
 pGAAtlqplIsTj78gFytNMf1vE9yPlBLozcE3tih4BsqKDe3QfRpMAlY36iHIryMpsulq
 1Wrw==
X-Gm-Message-State: ACrzQf1WrwWTBHw/J0eWEqCBSMHe3zzaOftITGBfRinGwVoANOVrbSg6
 s9u1+Etq6DVGqzjmhBcn+4EGNg==
X-Google-Smtp-Source: AMsMyM5+SFYaO7s/fP5EemHNxKLJBvldoTThbZfXwidNWieTKhjr1SuCW1C9Qjy2JsuTLl+Hlj4UJw==
X-Received: by 2002:a17:90b:692:b0:203:6c21:b4aa with SMTP id
 m18-20020a17090b069200b002036c21b4aamr8286429pjz.227.1666852634459; 
 Wed, 26 Oct 2022 23:37:14 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:13 -0700 (PDT)
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
Subject: [PATCH v4 00/17] pci: Abort if pci_add_capability fails
Date: Thu, 27 Oct 2022 15:36:48 +0900
Message-Id: <20221027063705.4093-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

v4:
- Fix typos in messages (Markus Armbruster)
- hw/vfio/pci: Ensure MSI and MSI-X do not overlap (Alex Williamson)

v3:
- Correct patch split between virtio-pci and pci (Markus Armbruster)
- Add messages for individual patches (Markus Armbruster)
- Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

v2: Split the patch (Markus Armbruster)

Akihiko Odaki (17):
  hw/vfio/pci: Ensure MSI and MSI-X do not overlap
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

 docs/pcie_sriov.txt                |  4 +-
 hw/display/bochs-display.c         |  4 +-
 hw/i386/amd_iommu.c                | 21 ++-------
 hw/ide/ich.c                       |  8 +---
 hw/net/e1000e.c                    | 22 ++--------
 hw/net/eepro100.c                  |  7 +--
 hw/nvme/ctrl.c                     | 14 +-----
 hw/pci-bridge/cxl_downstream.c     |  9 +---
 hw/pci-bridge/cxl_upstream.c       |  8 +---
 hw/pci-bridge/i82801b11.c          | 14 +-----
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 19 +++-----
 hw/pci-bridge/pcie_root_port.c     | 16 +------
 hw/pci-bridge/xio3130_downstream.c | 15 ++-----
 hw/pci-bridge/xio3130_upstream.c   | 15 ++-----
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +-
 hw/pci/msi.c                       |  9 +---
 hw/pci/msix.c                      |  8 +---
 hw/pci/pci.c                       | 29 +++----------
 hw/pci/pci_bridge.c                | 21 +++------
 hw/pci/pcie.c                      | 52 ++++++----------------
 hw/pci/shpc.c                      | 23 +++-------
 hw/pci/slotid_cap.c                |  8 +---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++-----
 hw/vfio/pci.c                      | 69 ++++++++++++++++++++++--------
 hw/vfio/pci.h                      |  3 ++
 hw/virtio/virtio-pci.c             | 12 ++----
 include/hw/pci/pci.h               |  5 +--
 include/hw/pci/pci_bridge.h        |  5 +--
 include/hw/pci/pcie.h              | 11 +++--
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 34 files changed, 147 insertions(+), 316 deletions(-)

-- 
2.37.3


