Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F932CD410
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:56:07 +0100 (CET)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmHO-0005SF-P2
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG0-0003kD-Da
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmFy-0001ym-BQ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dV+GRl/anXcygh6NCrncdJB4+K8CbGqVcPsjrI6BLV4=;
 b=L6b3QK9PqMB+ohgASZAfHTSti82VdQS9bg1bQjLjgYMIFO83Im5IGJ0wZB/V3mPAS14GPu
 4d/JnqhiIYjl/NYAK131yxxhK9FbhXADYSGKPWLMdGZVSxOkNxeOx9RDq00j5HHMkt1EPs
 JvCg6+Y+WXKJmaaXWtK/GpTbXlH4G6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-6W13K0mkO7OOI5KW9TOvqw-1; Thu, 03 Dec 2020 05:54:35 -0500
X-MC-Unique: 6W13K0mkO7OOI5KW9TOvqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 595D585818C;
 Thu,  3 Dec 2020 10:54:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1521B5C1B4;
 Thu,  3 Dec 2020 10:54:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 524D411AB8; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/12] microvm: add second ioapic
Date: Thu,  3 Dec 2020 11:54:11 +0100
Message-Id: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a second ioapic to microvm.  Gives us more IRQ lines we can=0D
use for virtio-mmio devices.  Bump number of possible virtio-mmio=0D
devices from 8 to 24.=0D
=0D
v3:=0D
 - pick up some review tags.=0D
 - replace magic numbers with #defines.=0D
 - add asl changes to commit messages.=0D
v2:=0D
 - reorganize code a bit.=0D
 - add ioapic2=3D option to microvm.=0D
=0D
Gerd Hoffmann (12):=0D
  [testing] disable xhci msix=0D
  x86: rewrite gsi_handler()=0D
  x86: add support for second ioapic=0D
  microvm: make number of virtio transports runtime changeable=0D
  microvm: make pcie irq base runtime changeable=0D
  microvm: drop microvm_gsi_handler()=0D
  microvm: add second ioapic=0D
  tests/acpi: allow updates for expected data files=0D
  tests/acpi: add data files for ioapic2 test variant=0D
  tests/acpi: add ioapic2=3Don test for microvm=0D
  tests/acpi: update expected data files=0D
  tests/acpi: disallow updates for expected data files=0D
=0D
 include/hw/i386/ioapic.h             |   2 +=0D
 include/hw/i386/ioapic_internal.h    |   2 +-=0D
 include/hw/i386/microvm.h            |   6 +-=0D
 include/hw/i386/x86.h                |   3 +=0D
 hw/i386/acpi-common.c                |  10 ++++=0D
 hw/i386/microvm.c                    |  82 ++++++++++++++++++++-------=0D
 hw/i386/x86.c                        |  35 ++++++++++--=0D
 hw/usb/hcd-xhci-pci.c                |   2 +-=0D
 tests/qtest/bios-tables-test.c       |  20 +++++--=0D
 tests/data/acpi/microvm/APIC.ioapic2 | Bin 0 -> 82 bytes=0D
 tests/data/acpi/microvm/DSDT.ioapic2 | Bin 0 -> 365 bytes=0D
 11 files changed, 129 insertions(+), 33 deletions(-)=0D
 create mode 100644 tests/data/acpi/microvm/APIC.ioapic2=0D
 create mode 100644 tests/data/acpi/microvm/DSDT.ioapic2=0D
=0D
--=20=0D
2.27.0=0D
=0D


