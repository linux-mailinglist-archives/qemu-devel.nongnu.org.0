Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4BC611154
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:28:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOSl-0002wF-5M; Fri, 28 Oct 2022 08:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORi-0002kl-7J
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:26:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooORg-0003Fe-3q
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:26:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id c24so4703922pls.9
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CAeVaIRty+ifyIO6rCWlOxYkV9h1hR/Tl3UWzpP+xn8=;
 b=cGfFNsDreyyI90HarfIHd5c4crUKwAeUBVTq6NGHl63RN8oA5KtVP5CdbRXScuibXt
 DivZSphS9ZVZsFr5tpnc4GhPx8NMaF6ZsgvxaZ7YaDeQ8iagbegYkUYL90gf/8wlQRsx
 W2OKzEC+lOQ8KMJPS+G+HfzrOWbQImSuRR0Ivv6nLvNnTH+FGd3/vO4z/IZvFifUwWET
 mkcgAlKhfGgW2yM9uIRAbSq5yDJayHcPk3WxecyB7dUZmFp3BKHI0I3Pw9SYinMI5/4K
 LGnhJNEu2BT89bvTFxPgiGL/IHyoutwHKc5tI8Vf6xB1Z8Q1hSG/MyFm26X1pR5yff0P
 AUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CAeVaIRty+ifyIO6rCWlOxYkV9h1hR/Tl3UWzpP+xn8=;
 b=7AIAggpI/G24eXXJn1IC1uf/wJ/O+7f2vQPMuz2aMn5zK08e0/vkula+dgsniOB1iW
 Zq5//w0JLbsltUS1RbRROauTxD1jyaNqJkbx30Lr2IDJVqMH7DzSphG7OOBBtQoDL2Gf
 Dv5zfajw5Zt81nbXGc96YwNkVyiqfSkw+lMwSKLAKTULjbyZTc3r7vI1RFYlAyIlhuli
 hKNdZiX6Wc3oCYtxYJoBUhLkaortMn8Ku7RqKQs73nsFCR9s+ThVjwOed+7/nn5GDKzX
 Nz4x6raa67EhEwt5XuobqtLrIur4JU6F78L/Z9PrConTs8iU1zENx1NVbROR0WEikYLF
 DpfA==
X-Gm-Message-State: ACrzQf3o03VQRwM3R0c9VvILBazHqNx9u5pXTEU7H6tYOd4kgU+lmiZ1
 ajOfHFcHtN9KuxGAH0Ay/75KAQ==
X-Google-Smtp-Source: AMsMyM5EUtXCu7csXqk3GfPgmVIVhJk4yk/Hb2gVGOhmot356yrd4m12u932arBv3WrOMedpDAfFeg==
X-Received: by 2002:a17:902:f707:b0:184:e44f:88cc with SMTP id
 h7-20020a170902f70700b00184e44f88ccmr54526318plo.42.1666960002302; 
 Fri, 28 Oct 2022 05:26:42 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:26:41 -0700 (PDT)
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
Subject: [PATCH v5 00/17] pci: Abort if pci_add_capability fails
Date: Fri, 28 Oct 2022 21:26:12 +0900
Message-Id: <20221028122629.3269-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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

v5:
- Fix capability ID specification in vfio_msi_early_setup (Alex Williamson)
- Use range_covers_byte() (Alex Williamson)
- warn_report() in case of MSI/MSI-X capability overlap (Alex Williamson)

v4:
- Fix typos in messages (Markus Armbruster)
- hw/vfio/pci: Ensure MSI and MSI-X do not overlap (Alex Williamson)

v3:
- Correct patch split between virtio-pci and pci (Markus Armbruster)
- Add messages for individual patches (Markus Armbruster)
- Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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
 hw/i386/amd_iommu.c                | 21 ++------
 hw/ide/ich.c                       |  8 +---
 hw/net/e1000e.c                    | 22 ++-------
 hw/net/eepro100.c                  |  7 +--
 hw/nvme/ctrl.c                     | 14 +-----
 hw/pci-bridge/cxl_downstream.c     |  9 +---
 hw/pci-bridge/cxl_upstream.c       |  8 +---
 hw/pci-bridge/i82801b11.c          | 14 +-----
 hw/pci-bridge/pci_bridge_dev.c     |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c    | 19 ++------
 hw/pci-bridge/pcie_root_port.c     | 16 +------
 hw/pci-bridge/xio3130_downstream.c | 15 ++----
 hw/pci-bridge/xio3130_upstream.c   | 15 ++----
 hw/pci-host/designware.c           |  3 +-
 hw/pci-host/xilinx-pcie.c          |  4 +-
 hw/pci/msi.c                       |  9 +---
 hw/pci/msix.c                      |  8 +---
 hw/pci/pci.c                       | 29 +++--------
 hw/pci/pci_bridge.c                | 21 +++-----
 hw/pci/pcie.c                      | 52 ++++++--------------
 hw/pci/shpc.c                      | 23 +++------
 hw/pci/slotid_cap.c                |  8 +---
 hw/usb/hcd-xhci-pci.c              |  3 +-
 hw/vfio/pci-quirks.c               | 15 ++----
 hw/vfio/pci.c                      | 77 ++++++++++++++++++++++--------
 hw/vfio/pci.h                      |  3 ++
 hw/virtio/virtio-pci.c             | 12 ++---
 include/hw/pci/pci.h               |  5 +-
 include/hw/pci/pci_bridge.h        |  5 +-
 include/hw/pci/pcie.h              | 11 ++---
 include/hw/pci/shpc.h              |  3 +-
 include/hw/virtio/virtio-pci.h     |  2 +-
 34 files changed, 155 insertions(+), 316 deletions(-)

-- 
2.37.3


