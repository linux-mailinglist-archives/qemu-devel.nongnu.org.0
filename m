Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD9280515
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 19:25:31 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO2Kg-0002qR-LN
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 13:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kO2HM-00008Z-8F
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:22:08 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kO2HK-0003l5-EF
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:22:03 -0400
Received: by mail-wr1-x444.google.com with SMTP id x14so6703346wrl.12
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hSyaOaOpbLlT7IIj7wGmi7/B23DoMri1AJI3zrD9H4=;
 b=gBni/tVYYku2bSB0YLUCJ91zxMkMRjQmILAvK3cVnbJIEM3MIOwLIgMxKFJ3fwNyZZ
 V/5S4eRVsvrrrfJPkF1pqKKq5QW4R5uURZRl/xEsH+PHXQKSpyTlF+EZuZFXj7csa9Bx
 S42FUX9ZKTnP5pATdzLlLubLX4XUhkqcXTs++pmTkMBYPFguKvb9iaIWVz0wDsGdDN0g
 s3nOH6HTZoY2/ddbeyq9kmaWf882B9cAHaQVdlBURWg4f5zoK/baAxXXZa0YBnm3IA7g
 k6teqCjeHuzRZmP17OVUd8LRetdKmuDUoxluLR9gS6ezdpppqyxf2ZRtvoKcAU5WF5fD
 Pr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0hSyaOaOpbLlT7IIj7wGmi7/B23DoMri1AJI3zrD9H4=;
 b=EP859vwC7Mkd//VN+pfmppRBEAVXbdwdTsduaVEU+PFS7AglWdjxjFVUxelTRjeE+l
 43xYIJwcsIl+TeduZ4ffvYPe4qNwZml0LVNaEn8rXpjrhn6ixbKsaCucvDlSmxPKxq44
 H18le61PASn+wbK1r0KMsnuWLr6RqzA4VENeMGEysM9MQpRbQJfVlHLNafjyZgX+t4ML
 +IQMTt2Xoqj5leUujgWrIs4RHhNr3S6+mgUwlRNZHzFzBj5/ekjlf13L/vW19jwytmH/
 OgXkSXD2wisWF6S1dJEaLuThNKgE+f66W/1MURUHtpWXiZBK/78txT6aP0qSOFxkfa8k
 Ieww==
X-Gm-Message-State: AOAM532Ojv+KaubUYzh4iOFiPaRfgr3N08TMSPaFkM4rGx2MuFtje7v1
 1cNLAiMKV9XqKMmOiEycR+d6rtB9MAU=
X-Google-Smtp-Source: ABdhPJzHXh74MUfNTNCXXnubjsxdjmqLq1nDtO54f8XnwhIjnpdVFHIggqKDLyYtvEVRFp0ExrgpiA==
X-Received: by 2002:adf:f784:: with SMTP id q4mr10078480wrp.126.1601572920648; 
 Thu, 01 Oct 2020 10:22:00 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id h8sm9719625wrw.68.2020.10.01.10.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 10:22:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] hw: Let DMA/PCI API take MemTxAttrs argument and
 propagate MemTxResult
Date: Thu,  1 Oct 2020 19:21:43 +0200
Message-Id: <20201001172159.1619456-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a respin of:

"dma: Let the DMA API take MemTxAttrs argument and propagate MemTxResult"
https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02048.html

and:
"pci: Let PCI DMA API functions propagate a MemTxResult"
https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02048.html

The DMA API propagates MemTxResult:
- MEMTX_OK,
- MEMTX_device_ERROR,
- MEMTX_DECODE_ERROR.

Let the PCI DMA API propagate them, as they are
clearer than an undocumented 'int'.

Klaus Jensen (1):
  pci: pass along the return value of dma_memory_rw

Philippe Mathieu-Daudé (15):
  docs/devel/loads-stores: Add regexp for DMA functions
  dma: Document address_space_map/address_space_unmap() prototypes
  dma: Let dma_memory_set() propagate MemTxResult
  dma: Let dma_memory_rw() propagate MemTxResult
  dma: Let dma_memory_read() propagate MemTxResult
  dma: Let dma_memory_write() propagate MemTxResult
  dma: Let dma_memory_valid() take MemTxAttrs argument
  dma: Let dma_memory_set() take MemTxAttrs argument
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
  dma: Let dma_memory_rw() take MemTxAttrs argument
  dma: Let dma_memory_read/write() take MemTxAttrs argument
  dma: Let dma_memory_map() take MemTxAttrs argument
  pci: Let pci_dma_rw() propagate MemTxResult
  pci: Let pci_dma_read() propagate MemTxResult
  pci: Let pci_dma_write() propagate MemTxResult

 docs/devel/loads-stores.rst   |   2 +
 include/hw/pci/pci.h          |  57 +++++++++++--
 include/hw/ppc/spapr_vio.h    |  11 ++-
 include/sysemu/dma.h          | 155 +++++++++++++++++++++++++++-------
 dma-helpers.c                 |  16 ++--
 hw/arm/musicpal.c             |  13 +--
 hw/arm/smmu-common.c          |   3 +-
 hw/arm/smmuv3.c               |  14 +--
 hw/core/generic-loader.c      |   3 +-
 hw/display/virtio-gpu.c       |   8 +-
 hw/dma/pl330.c                |  12 ++-
 hw/dma/sparc32_dma.c          |  16 ++--
 hw/dma/xlnx-zynq-devcfg.c     |   6 +-
 hw/dma/xlnx_dpdma.c           |  10 ++-
 hw/hyperv/vmbus.c             |   8 +-
 hw/i386/amd_iommu.c           |  16 ++--
 hw/i386/intel_iommu.c         |  28 +++---
 hw/ide/ahci.c                 |   9 +-
 hw/ide/macio.c                |   2 +-
 hw/intc/spapr_xive.c          |   3 +-
 hw/intc/xive.c                |   7 +-
 hw/misc/bcm2835_property.c    |   3 +-
 hw/misc/macio/mac_dbdma.c     |  10 ++-
 hw/net/allwinner-sun8i-emac.c |  21 +++--
 hw/net/ftgmac100.c            |  25 ++++--
 hw/net/imx_fec.c              |  32 ++++---
 hw/nvram/fw_cfg.c             |  12 ++-
 hw/pci-host/pnv_phb3.c        |   5 +-
 hw/pci-host/pnv_phb3_msi.c    |   9 +-
 hw/pci-host/pnv_phb4.c        |   7 +-
 hw/sd/allwinner-sdhost.c      |  14 +--
 hw/sd/sdhci.c                 |  35 +++++---
 hw/usb/hcd-dwc2.c             |   8 +-
 hw/usb/hcd-ehci.c             |   6 +-
 hw/usb/hcd-ohci.c             |  28 +++---
 hw/usb/hcd-xhci.c             |  18 ++--
 hw/usb/libhw.c                |   3 +-
 hw/virtio/virtio.c            |   6 +-
 38 files changed, 439 insertions(+), 202 deletions(-)

-- 
2.26.2


