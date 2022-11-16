Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168662C27E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKKF-0003oH-TQ; Wed, 16 Nov 2022 10:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKKE-0003nr-FB
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:27:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKKC-0004Cn-PS
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668612459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eHcjr1G5UsgFNqeXRp0WTxS47bfofFg325Nhqy6ODP4=;
 b=C6XWElcLWyXe61t14j29vBWrLlmJsmlzF5m0qrdBklC0/PNFNfFT8HZfuEqfeNVTx6VWem
 BJQ9s0UyD2BaYEFEOYFRTfV1Op8lz+ur+CBYiBH9RL+pY47s0M4259IOLru0+oeCEPQ82i
 EiWHYYatDvt+bnYHa86F8zTMGlLmge0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-l75-cGLROqGjhV2Hdj6rKw-1; Wed, 16 Nov 2022 10:27:35 -0500
X-MC-Unique: l75-cGLROqGjhV2Hdj6rKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9125A3810794;
 Wed, 16 Nov 2022 15:27:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C25C112132C;
 Wed, 16 Nov 2022 15:27:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 0/2] remove redundant field PCIDeviceClass::is_bridge
Date: Wed, 16 Nov 2022 16:27:28 +0100
Message-Id: <20221116152730.3691347-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Igor Mammedov (2):
  remove DEC 21154 PCI bridge
  pci: drop redundant PCIDeviceClass::is_bridge field

 hw/pci-bridge/dec.h                |   9 --
 include/hw/pci/pci.h               |  11 +-
 include/hw/pci/pci_bridge.h        |   1 +
 include/hw/pci/pci_ids.h           |   1 -
 hw/acpi/pcihp.c                    |   3 +-
 hw/i386/acpi-build.c               |   5 +-
 hw/pci-bridge/cxl_downstream.c     |   1 -
 hw/pci-bridge/cxl_upstream.c       |   1 -
 hw/pci-bridge/dec.c                | 164 -----------------------------
 hw/pci-bridge/i82801b11.c          |   1 -
 hw/pci-bridge/meson.build          |   2 -
 hw/pci-bridge/pci_bridge_dev.c     |   1 -
 hw/pci-bridge/pcie_pci_bridge.c    |   1 -
 hw/pci-bridge/pcie_root_port.c     |   1 -
 hw/pci-bridge/simba.c              |   1 -
 hw/pci-bridge/xio3130_downstream.c |   1 -
 hw/pci-bridge/xio3130_upstream.c   |   1 -
 hw/pci-host/designware.c           |   1 -
 hw/pci-host/uninorth.c             |   6 --
 hw/pci-host/xilinx-pcie.c          |   1 -
 hw/pci/pci.c                       |  20 ++--
 hw/ppc/spapr_pci.c                 |  15 +--
 22 files changed, 19 insertions(+), 229 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 delete mode 100644 hw/pci-bridge/dec.c

-- 
2.31.1


