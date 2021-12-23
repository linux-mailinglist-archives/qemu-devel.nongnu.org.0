Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDDE47E312
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:17:51 +0100 (CET)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N2d-0004Ms-1M
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhh-0005ow-B8
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mhd-0000a1-Jw
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yGm9M5Gpreq0tGzVr/AUvpzhePzmzTXeINxxMia3hdM=;
 b=P78Rkm/7vBPyHUVQfgEcHMcHmN0hCbOSPOVChdEokUCg9goCbRKXHLJk0WPJJuOb9VTsoD
 B+nwTZgm//FcXbCIfLZAzIREaEu3fds/qnwDTYdQZILFhhlUDbPKlUq6L1gqvLwZD5XVaU
 Kn7NIIaW2F2sS3nhniG+nXquvUoXi9M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-DeR57q7GOg-NKIF8g1z6Kw-1; Thu, 23 Dec 2021 06:56:07 -0500
X-MC-Unique: DeR57q7GOg-NKIF8g1z6Kw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so3735061wmg.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nECtuzQXr4MaZMgWFk37eV6EBLhYZxfFT9EAGzIRk/A=;
 b=DAvFrVKZBITxyTbDLSfCuPKjIlQ6R5xTs5w8KCG/H52XKMkDJlRkGwwLcT4DxE6DQP
 uoYx8DbIyTaXG2MuwrOQOCO0Q2Z2EXXPa4bWOIsZ0orF+DqwKsoby+F2BBvtgBpYL7hK
 TghXnhvf6NhSJOTfswwAwPWIknNbek1LftjyPY3gIkfY67J/DrkE/rwQBiSrthuX0WGI
 yVHdwnF4p0SqNWH0SFGcw47Cpz3gn9+YrS903LGhFIMp+zlKo6J0Qd16CSIles8Om7Vt
 LschGSaJ6+IsXzkObeEd8cVjsXvG6rHuTR93Wapp54jx1Q75RKH+sqGHOPrbYRPJquWN
 RXIA==
X-Gm-Message-State: AOAM5326dlPkJPJ6wncCpp53dArPkoAKut/Kn7HpAPvpSxeh5aquo1hZ
 J2i1z0WqQjNNnI03cXHsVB4wr4AEGuCzJcr42lni5d17Y0TplKyGSSBQU+tcqpUa5x8+Zomxkkt
 VZLPDmLV0k4UBDtsyhjWoIecI1Q3IDXPCOH+nKbEFBW28Zk8vvAbFgcBsUwRcReCX
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr1507421wrg.269.1640260565858; 
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZUPaaa/A3ltBLdxq4hWK3IEPzyI9FKzhxveSkqJrwOqKRPbvFVaXKu79MCcDe3R0CEP9yCg==
X-Received: by 2002:adf:bb4a:: with SMTP id x10mr1507375wrg.269.1640260565613; 
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id b16sm5045581wmq.41.2021.12.23.03.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] hw: Have DMA APIs take MemTxAttrs arg & propagate
 MemTxResult (full)
Date: Thu, 23 Dec 2021 12:55:31 +0100
Message-Id: <20211223115554.3155328-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter and Paolo.=0D
=0D
This series contains all the uncontroversary patches from=0D
the "improve DMA situations, avoid re-entrancy issues"=0D
earlier series. The rest will be discussed on top.=0D
=0D
The only operations added are:=0D
- take MemTxAttrs argument=0D
- propagate MemTxResult=0D
=0D
All patches are reviewed.=0D
=0D
If you don't see any objection, I plan to send this via=0D
a pull request by the end of next week.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (23):=0D
  dma: Let dma_memory_valid() take MemTxAttrs argument=0D
  dma: Let dma_memory_set() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw() take MemTxAttrs argument=0D
  dma: Let dma_memory_read/write() take MemTxAttrs argument=0D
  dma: Let dma_memory_map() take MemTxAttrs argument=0D
  dma: Have dma_buf_rw() take a void pointer=0D
  dma: Have dma_buf_read() / dma_buf_write() take a void pointer=0D
  dma: Let pci_dma_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_write() take MemTxAttrs argument=0D
  dma: Let dma_buf_read() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() propagate MemTxResult=0D
  dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult=0D
  dma: Let st*_dma() take MemTxAttrs argument=0D
  dma: Let ld*_dma() take MemTxAttrs argument=0D
  dma: Let st*_dma() propagate MemTxResult=0D
  dma: Let ld*_dma() propagate MemTxResult=0D
  hw/scsi/megasas: Use uint32_t for reply queue head/tail values=0D
  pci: Let st*_pci_dma() take MemTxAttrs argument=0D
  pci: Let ld*_pci_dma() take MemTxAttrs argument=0D
  pci: Let st*_pci_dma() propagate MemTxResult=0D
  pci: Let ld*_pci_dma() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h          | 38 +++++++++------=0D
 include/hw/ppc/spapr_vio.h    | 30 ++++++++----=0D
 include/sysemu/dma.h          | 90 +++++++++++++++++++++--------------=0D
 hw/arm/musicpal.c             | 13 ++---=0D
 hw/arm/smmu-common.c          |  3 +-=0D
 hw/arm/smmuv3.c               | 14 ++++--=0D
 hw/audio/intel-hda.c          | 13 +++--=0D
 hw/core/generic-loader.c      |  3 +-=0D
 hw/display/virtio-gpu.c       | 10 ++--=0D
 hw/dma/pl330.c                | 12 +++--=0D
 hw/dma/sparc32_dma.c          | 16 ++++---=0D
 hw/dma/xlnx-zynq-devcfg.c     |  6 ++-=0D
 hw/dma/xlnx_dpdma.c           | 10 ++--=0D
 hw/hyperv/vmbus.c             |  8 ++--=0D
 hw/i386/amd_iommu.c           | 16 ++++---=0D
 hw/i386/intel_iommu.c         | 28 ++++++-----=0D
 hw/ide/ahci.c                 | 18 ++++---=0D
 hw/ide/macio.c                |  2 +-=0D
 hw/intc/pnv_xive.c            |  7 +--=0D
 hw/intc/spapr_xive.c          |  3 +-=0D
 hw/intc/xive.c                |  7 +--=0D
 hw/misc/bcm2835_property.c    |  3 +-=0D
 hw/misc/macio/mac_dbdma.c     | 10 ++--=0D
 hw/net/allwinner-sun8i-emac.c | 18 ++++---=0D
 hw/net/eepro100.c             | 49 +++++++++++--------=0D
 hw/net/ftgmac100.c            | 25 ++++++----=0D
 hw/net/imx_fec.c              | 32 ++++++++-----=0D
 hw/net/npcm7xx_emc.c          | 20 ++++----=0D
 hw/net/tulip.c                | 36 +++++++-------=0D
 hw/nvme/ctrl.c                |  5 +-=0D
 hw/nvram/fw_cfg.c             | 16 ++++---=0D
 hw/pci-host/pnv_phb3.c        |  5 +-=0D
 hw/pci-host/pnv_phb3_msi.c    |  9 ++--=0D
 hw/pci-host/pnv_phb4.c        |  5 +-=0D
 hw/scsi/esp-pci.c             |  2 +-=0D
 hw/scsi/megasas.c             | 86 ++++++++++++++++++++++-----------=0D
 hw/scsi/mptsas.c              | 16 +++++--=0D
 hw/scsi/scsi-bus.c            |  4 +-=0D
 hw/scsi/vmw_pvscsi.c          | 20 +++++---=0D
 hw/sd/allwinner-sdhost.c      | 14 +++---=0D
 hw/sd/sdhci.c                 | 35 +++++++++-----=0D
 hw/usb/hcd-dwc2.c             |  8 ++--=0D
 hw/usb/hcd-ehci.c             |  6 ++-=0D
 hw/usb/hcd-ohci.c             | 28 ++++++-----=0D
 hw/usb/hcd-xhci.c             | 26 ++++++----=0D
 hw/usb/libhw.c                |  3 +-=0D
 hw/virtio/virtio.c            |  6 ++-=0D
 softmmu/dma-helpers.c         | 32 ++++++++-----=0D
 hw/scsi/trace-events          |  8 ++--=0D
 49 files changed, 542 insertions(+), 332 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


