Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A6B4C33F4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 18:47:24 +0100 (CET)
Received: from localhost ([::1]:37582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNID4-0002cr-89
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 12:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIAo-0001Fm-Jt
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nNIAk-0002DL-JZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 12:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645724696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dN9WyVVvLOGKrulTgGShdm6qn39kIln7ZwEfR0G/ONo=;
 b=bHhxvS3/glbdIElrvXrLCoCWh/LM8JGDvKHQ9fuNTA38f41l6NgST5KbjcPF+nunrHu6nB
 F9pS3cBBqZ+1qhGOlxTJreq2h/oaZ6DEfFBnrCXwsyPnrNArXVwTeArGbbbn2sZ7xHuPqG
 olJaSXy1P59gAeaIRxE2Z4dIPcyVQOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-RM9jPAsvNbaAQrZgu16hTw-1; Thu, 24 Feb 2022 12:44:54 -0500
X-MC-Unique: RM9jPAsvNbaAQrZgu16hTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10029100C609
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 17:44:54 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2396F818ED;
 Thu, 24 Feb 2022 17:44:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Fix broken PCIe device after migration
Date: Thu, 24 Feb 2022 12:44:07 -0500
Message-Id: <20220224174411.3296848-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

Currently ACPI PCI hotplug is enabled by default for Q35 machine
type and overrides native PCIe hotplug. It works as expected when
a PCIe device is hotplugged into slot, however the device becomes
in-operational after migration. Which is caused by BARs being
disabled on target due to powered off status of the slot.

Proposed fix disables power control on PCIe slot when ACPI pcihp
takes over hotplug control and makes PCIe slot check if power
control is enabled before trying to change slot's power. Which
leaves slot always powered on and that makes PCI core keep BARs
enabled.

PS:
it's still hacky approach as all ACPI PCI hotplug is, but it's
the least intrusive one. Alternative, I've considered, could be
chaining hotplug callbacks and making pcihp ones call overriden
native callbacks while inhibiting hotplug event in native callbacks
somehow. But that were a bit more intrusive and spills over to SHPC
if implemented systematically, so I ditched that for now. It could
be resurrected later on if current approach turns out to be
insufficient.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
CC: mst@redhat.com
CC: kraxel@redhat.com

Igor Mammedov (4):
  pci: expose TYPE_XIO3130_DOWNSTREAM name
  pcie: update slot power status only is power control is enabled
  acpi: pcihp: disable power control on PCIe slot
  q35: compat: keep hotplugged PCIe device broken after migration for
    6.2-older machine types

 include/hw/acpi/pcihp.h                    |  4 +++-
 include/hw/pci-bridge/xio3130_downstream.h | 15 +++++++++++++++
 hw/acpi/acpi-pci-hotplug-stub.c            |  3 ++-
 hw/acpi/ich9.c                             | 21 ++++++++++++++++++++-
 hw/acpi/pcihp.c                            | 16 +++++++++++++++-
 hw/acpi/piix4.c                            |  3 ++-
 hw/core/machine.c                          |  4 +++-
 hw/pci-bridge/xio3130_downstream.c         |  3 ++-
 hw/pci/pcie.c                              |  5 ++---
 9 files changed, 64 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/pci-bridge/xio3130_downstream.h

-- 
2.31.1


