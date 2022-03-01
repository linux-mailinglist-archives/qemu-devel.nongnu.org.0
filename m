Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910E34C8EB8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:15:54 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4ED-0003UJ-Kp
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:15:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Ay-0000Yb-PY
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Av-0004Fu-81
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646147545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sJaYV9tgz2OhOrsZUT8O6OisS7Vs2ReUPnzTAmSU/Wg=;
 b=QXQWmIyMh2s6OJn65FHkirDzqzfOajiPfN4mNRyL/4iplbTEtMToA1e8PX+VYqGRy/o0PA
 huv74xuVJQctzLQICL2MQOLt1tfJnI6loKRkVsSoLPSdfa96+SCuSvCrao+XdoXblhbLk/
 oLFjg6NmJGGhV9cncMI35U3Y0lvc6WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-qQgyV_3LN7eoDw-APmkvlQ-1; Tue, 01 Mar 2022 10:12:22 -0500
X-MC-Unique: qQgyV_3LN7eoDw-APmkvlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153901006AA9
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 15:12:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2DC7DE38;
 Tue,  1 Mar 2022 15:12:02 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Fix broken PCIe device after migration
Date: Tue,  1 Mar 2022 10:11:57 -0500
Message-Id: <20220301151200.3507298-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
   v2:
     * instead of disabling power control on slot and letting ACPI
       PCI hotplug  module in guest to deal with it, set
       PCI_EXP_SLTCTL_PWR_ON on PCIe slot from acpi_pcihp_device_plug_cb()
       when a device plugged into it.

Currently ACPI PCI hotplug is enabled by default for Q35 machine
type and overrides native PCIe hotplug. It works as expected when
a PCIe device is hotplugged into slot, however the device becomes
in-operational after migration. Which is caused by BARs being
disabled on target due to powered off status of the slot.

Proposed fix turns on power on PCIe slot when a device is
hotplugged into it, then that state is migrated and device
stays powred on after migration. 

Tested with (seabios: FC34, Win2012; ovmf: RHEL8)

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
CC: mst@redhat.com
CC: kraxel@redhat.com

Ref to v1:
 https://lore.kernel.org/all/20220225100127.78974d71@redhat.com/T/
Gitlab link:
 https://gitlab.com/imammedo/qemu/-/tree/pcie_poweroff_acpi_regression_rhbz2053584_V2

Igor Mammedov (3):
  pci: expose TYPE_XIO3130_DOWNSTREAM name
  acpi: pcihp: pcie: set power on cap on parent slot
  q35: compat: keep hotplugged PCIe device broken after migration for
    6.2 and older machine types

 include/hw/acpi/pcihp.h                    |  1 +
 include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
 include/hw/pci/pcie.h                      |  1 +
 hw/acpi/ich9.c                             | 20 ++++++++++++++++++++
 hw/acpi/pcihp.c                            | 15 ++++++++++++++-
 hw/core/machine.c                          |  4 +++-
 hw/pci-bridge/xio3130_downstream.c         |  3 ++-
 hw/pci/pcie.c                              | 11 +++++++++++
 8 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h

-- 
2.31.1


