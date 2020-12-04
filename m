Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50A2CF4CE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:32:43 +0100 (CET)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klGos-0000xf-4T
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEc1-0007Lo-4f
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbI-0006e3-V0
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=urkhX+78IfWqIAUplwyz8IlWcgRG+8hGbUH9oQ3RwYk=;
 b=eOs9nLuiv8L2EjZC2Cmv50gw1oc4bLOv9HKvKeUH2RfS+GONVRC9CylXsDbIzCY99SVLig
 AKRDmcmU+3g5FMx4okcKC0jgsf84jEWCo4b/gGpOUEPvv9kxFZhlEaKGcYOFxFXY4jz9/O
 lsUDJZYoCKpkBx0OhqlMKvgscXG3U0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-UuRIdN_JMD-8KciMpaB3OQ-1; Fri, 04 Dec 2020 12:09:47 -0500
X-MC-Unique: UuRIdN_JMD-8KciMpaB3OQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45EEC107ACE4;
 Fri,  4 Dec 2020 17:09:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3605E620D7;
 Fri,  4 Dec 2020 17:09:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] add support for cpu hot-unplug with SMI broadcast enabled
Date: Fri,  4 Dec 2020 12:09:31 -0500
Message-Id: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changelog:
 since RFC:
  - split one big patch on smaller chunks
  - clear bit #4 in CPU eject
  - drop bit #4 toggle semantics and let it set only to 1 from guest side
  - do not allow unplug without hotplug
  - update expected ACPI tables to let CI pass

It's QEMU side to support CPU hot-unplug when using OVMF as firmware with SMI
broadcast enabled (default). It adds new bit in CPU hotplug hw, to mark CPU
as pending for removal by firmware and passes control to it to perform CPU
eject once it's ready (i.e. forgot and no longer uses that CPU).

Patches 2-7 are preparatory, adding neccesary HW and ACPI bits for the feature
and the last patch enables feature by default since 6.0 machine type.

Cornelia Huck (1):
  hw: add compat machines for 6.0

Igor Mammedov (7):
  acpi: cpuhp: introduce 'firmware performs eject' status/control bits
  x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug
  tests/acpi: allow expected files change
  x86: acpi: let the firmware handle pending "CPU remove" events in SMM
  tests/acpi: update expected files
  x86: ich9: factor out "guest_cpu_hotplug_features"
  x86: ich9: let firmware negotiate 'CPU hot-unplug with SMI' feature

 include/hw/acpi/cpu.h             |   2 ++
 include/hw/boards.h               |   3 +++
 include/hw/i386/pc.h              |   3 +++
 docs/specs/acpi_cpu_hotplug.txt   |  19 ++++++++++++++-----
 hw/acpi/cpu.c                     |  24 ++++++++++++++++++++++--
 hw/acpi/trace-events              |   2 ++
 hw/arm/virt.c                     |   9 ++++++++-
 hw/core/machine.c                 |   3 +++
 hw/i386/acpi-build.c              |   5 +++++
 hw/i386/pc.c                      |   5 +++++
 hw/i386/pc_piix.c                 |  14 +++++++++++++-
 hw/i386/pc_q35.c                  |  13 ++++++++++++-
 hw/isa/lpc_ich9.c                 |  16 +++++++++++++---
 hw/ppc/spapr.c                    |  15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c        |  14 +++++++++++++-
 tests/data/acpi/pc/DSDT           | Bin 5060 -> 5067 bytes
 tests/data/acpi/pc/DSDT.acpihmat  | Bin 6385 -> 6392 bytes
 tests/data/acpi/pc/DSDT.bridge    | Bin 6919 -> 6926 bytes
 tests/data/acpi/pc/DSDT.cphp      | Bin 5524 -> 5531 bytes
 tests/data/acpi/pc/DSDT.dimmpxm   | Bin 6714 -> 6721 bytes
 tests/data/acpi/pc/DSDT.hpbridge  | Bin 5021 -> 5028 bytes
 tests/data/acpi/pc/DSDT.hpbrroot  | Bin 3079 -> 3086 bytes
 tests/data/acpi/pc/DSDT.ipmikcs   | Bin 5132 -> 5139 bytes
 tests/data/acpi/pc/DSDT.memhp     | Bin 6419 -> 6426 bytes
 tests/data/acpi/pc/DSDT.numamem   | Bin 5066 -> 5073 bytes
 tests/data/acpi/pc/DSDT.roothp    | Bin 5256 -> 5263 bytes
 tests/data/acpi/q35/DSDT          | Bin 7796 -> 7803 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9121 -> 9128 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7814 -> 7821 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8260 -> 8267 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9450 -> 9457 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7871 -> 7878 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9155 -> 9162 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8927 -> 8934 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7802 -> 7809 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8402 -> 8409 bytes
 36 files changed, 131 insertions(+), 16 deletions(-)

-- 
2.27.0


