Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15B482118
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:57:52 +0100 (CET)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Ew-0002Qi-T2
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36D8-00006I-OQ
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:55:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36D5-0003PO-Pg
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nIvnvaO7Gu9GiaMVkJIT6rNmE1jZrRoO/WYpnsIuhQA=;
 b=foKBlJkQWJ5K8GdbPdiE1mktRvHRk4abyfS0unqnecibARPJfU/JVxlg8zvMWa8gRUgjcD
 lYVlcZzAXk0MmXE+OFRhj+HVpkGlrJ5OYsF/oM+ti6k0OtDsE1sYcVSM1GdYLgJFQRyngu
 GFwdvX8Dbv787fWJHfnInjUuZTF3XMA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-c98l9ruQMaexUBj9ECluMA-1; Thu, 30 Dec 2021 19:55:49 -0500
X-MC-Unique: c98l9ruQMaexUBj9ECluMA-1
Received: by mail-ed1-f69.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso17912684edv.3
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pDRmazb+4KPtkm8dzqZRVUrvxCnEvo7Ag4JhFVW3GQQ=;
 b=0lww9BLKRuCpeGqkcWwtrAjJod6c76WHteloFEzcfhMnxPZjTVY9Lke57uwxouto28
 SgkIs60spqcXsWmGBQ9NcoH+vDcv7OHr/nZRkTjIVPmZT4VfnrYeX3gDqaAptgbwRcPT
 ckZpoFRQDMLIcJDzmhHgp53E/6i0PkChI19UE1Ew1xYyd2TVflXEeaEyjPD98j9g2FLC
 lK/DHCJptSmBG8MV1XdoF3li8laO6fx8ToRu8XNGpw1ASdZcuvETbzWzTybSG36wYjnS
 /1B7gbXRA9lM119dwS8Kyw9S7ftdtPA4h94f3zx+R2M39FQWQdNXVU7msp5W4jgnlgbo
 Qnpw==
X-Gm-Message-State: AOAM530gr/oCtN0rgyWb9/JKsFjCrQppPCFjzGYL9ruKFGX8/U9bFnov
 4nvzQ1jSPl0tM10AqK4/SA1kVd0QCx3aw3bMa5LMs9uh7KkOKK3byU42UFkEeLeDbSojmcSHM37
 iIA38ILrbdXw9MYfXlv8O24ULM2kTTIvOoY6pW4QC7fujx5SupkIq8cAtoeiXFQpC
X-Received: by 2002:a17:907:160d:: with SMTP id
 hb13mr26629175ejc.588.1640912148441; 
 Thu, 30 Dec 2021 16:55:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyQMIOek6SFZjakB0nT+Sa7jnf0vDsF2OKcxwKm1xlElj9BwfcyW/kxbQKPE9gh8tAc/LbvA==
X-Received: by 2002:a17:907:160d:: with SMTP id
 hb13mr26629155ejc.588.1640912148151; 
 Thu, 30 Dec 2021 16:55:48 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id 7sm8069766ejh.161.2021.12.30.16.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:55:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/22] Memory API patches for 2021-12-31
Date: Fri, 31 Dec 2021 01:55:24 +0100
Message-Id: <20211231005546.723396-1-philmd@redhat.com>
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
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d5a9f352896fe43183ef01072b374e89a3488315=
:=0D
=0D
  Merge tag 'pull-jobs-2021-12-29' of https://src.openvz.org/scm/~vsementso=
v/qemu into staging (2021-12-29 14:33:23 -0800)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/memory-api-20211231=0D
=0D
for you to fetch changes up to 4a63054bce23982b99f4d3c65528e47e614086b2:=0D
=0D
  pci: Let ld*_pci_dma() propagate MemTxResult (2021-12-31 01:05:27 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
Memory API patches=0D
=0D
Have various functions from the Memory API:=0D
- take a MemTxAttrs argument,=0D
- propagate a MemTxResult.=0D
=0D
Some patches trigger "WARNING: line over 80 characters",=0D
and a pair "ERROR: spaces required around that '*' (ctx:WxV)",=0D
both false positives.=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (22):=0D
  hw/scsi/megasas: Use uint32_t for reply queue head/tail values=0D
  dma: Let dma_memory_valid() take MemTxAttrs argument=0D
  dma: Let dma_memory_set() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw() take MemTxAttrs argument=0D
  dma: Let dma_memory_read/write() take MemTxAttrs argument=0D
  dma: Let dma_memory_map() take MemTxAttrs argument=0D
  dma: Have dma_buf_rw() take a void pointer=0D
  dma: Have dma_buf_read() / dma_buf_write() take a void pointer=0D
  pci: Let pci_dma_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() take MemTxAttrs argument=0D
  dma: Let dma_buf_write() take MemTxAttrs argument=0D
  dma: Let dma_buf_read() take MemTxAttrs argument=0D
  dma: Let dma_buf_rw() propagate MemTxResult=0D
  dma: Let st*_dma() take MemTxAttrs argument=0D
  dma: Let ld*_dma() take MemTxAttrs argument=0D
  dma: Let st*_dma() propagate MemTxResult=0D
  dma: Let ld*_dma() propagate MemTxResult=0D
  pci: Let st*_pci_dma() take MemTxAttrs argument=0D
  pci: Let ld*_pci_dma() take MemTxAttrs argument=0D
  pci: Let st*_pci_dma() propagate MemTxResult=0D
  pci: Let ld*_pci_dma() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h          | 38 +++++++++------=0D
 include/hw/ppc/spapr_vio.h    | 30 ++++++++----=0D
 include/sysemu/dma.h          | 88 ++++++++++++++++++++---------------=0D
 hw/arm/musicpal.c             | 13 +++---=0D
 hw/arm/smmu-common.c          |  3 +-=0D
 hw/arm/smmuv3.c               | 14 ++++--=0D
 hw/audio/intel-hda.c          | 13 ++++--=0D
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
 hw/scsi/megasas.c             | 64 ++++++++++++++-----------=0D
 hw/scsi/mptsas.c              | 16 +++++--=0D
 hw/scsi/scsi-bus.c            |  4 +-=0D
 hw/scsi/vmw_pvscsi.c          | 20 +++++---=0D
 hw/sd/allwinner-sdhost.c      | 14 +++---=0D
 hw/sd/sdhci.c                 | 35 ++++++++------=0D
 hw/usb/hcd-dwc2.c             |  8 ++--=0D
 hw/usb/hcd-ehci.c             |  6 ++-=0D
 hw/usb/hcd-ohci.c             | 28 ++++++-----=0D
 hw/usb/hcd-xhci.c             | 26 +++++++----=0D
 hw/usb/libhw.c                |  3 +-=0D
 hw/virtio/virtio.c            |  6 ++-=0D
 softmmu/dma-helpers.c         | 40 ++++++++++------=0D
 hw/scsi/trace-events          |  8 ++--=0D
 49 files changed, 526 insertions(+), 332 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


