Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3919863BDC0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 11:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozxch-0001FK-EW; Tue, 29 Nov 2022 05:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcf-0001EX-LB
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ozxcc-0005Cj-F4
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 05:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669716829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvqTpUUd+dZE8eYmiRpmXKcdFZ4ZiDeOfRPhMIIDrT4=;
 b=CPkvmMA+XFYMahWTWyiuP2oedDo3fAk4qjk0L/fMz6OWrcBI3QEwddx8ELosZQrjWG9CYL
 Hb4TgY1N+l+NdsHqD5X7YjfmQMPWp48t8XYZGe3umbxmlOC4lok6duJNBWsB7yj3s4lIZT
 nd1bXrStQj0xmmiVAYzVu3hSZqgPI9g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-OOmnYG6wOeCxpoKzn6xBDg-1; Tue, 29 Nov 2022 05:13:45 -0500
X-MC-Unique: OOmnYG6wOeCxpoKzn6xBDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E977D38012C4;
 Tue, 29 Nov 2022 10:13:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D00782028CE4;
 Tue, 29 Nov 2022 10:13:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 for-8.0 0/2] pci: drop redundant PCIDeviceClass::is_bridge
 field
Date: Tue, 29 Nov 2022 11:13:39 +0100
Message-Id: <20221129101341.185621-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Changelog:
   - keep comment reminding that there was a bridge, so it would be easy to find
     removed code if someone wishes to bring it back
   - s/IS_PCI_BRIDGE/is_bridge/ in one instance where local is_bridge already exists

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
 hw/pci-host/uninorth.c             |   9 +-
 hw/pci-host/xilinx-pcie.c          |   1 -
 hw/pci/pci.c                       |  20 ++--
 hw/ppc/spapr_pci.c                 |  15 +--
 22 files changed, 23 insertions(+), 228 deletions(-)
 delete mode 100644 hw/pci-bridge/dec.h
 delete mode 100644 hw/pci-bridge/dec.c

-- 
2.31.1


