Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD4139800
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 18:47:25 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir3oC-0007jy-Qu
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 12:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <olaf@aepfle.de>) id 1ir3mX-0006Rg-Rh
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:45:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <olaf@aepfle.de>) id 1ir3mW-0004t7-QA
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:45:41 -0500
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::6]:17447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <olaf@aepfle.de>) id 1ir3mV-0004mE-Vw
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 12:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578937535;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=9fY/ucFujhzjLW+hZylxEQIseW+7N0PYF0kuon6fQCs=;
 b=o+5eMcjYhUM3UpItHBRtSdwE2k2HcCojBNE8cXGvreQHexfTz5Z4JkCoscZEOWa/NW
 hcsJawkj5y6cf49WDnedvOcDxoa7mzatLaplve+2GiV3znZbqb7miLs/sTHSlcydxzGB
 lRD27i4a4ED0tfYIWxxjIsay90UiyXklwctBoluXdXD9xpboso2LgXke41CIMjVdtMj3
 G5Be3aVArHrO3NedG3on925vxMDONEH/Zbysme3HAxxGoPF79wVv39kk30j1Wwx0K+mq
 Pl9LAG6s7iZ+4s4tcKS8HewoNuxOGYgUintyq3ZvvGM2y+CRLFzmjvSrCoBwTZ1TkSN5
 OgeA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32xLjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
 with ESMTPSA id j08473w0DHjYHAf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 13 Jan 2020 18:45:34 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v1] hw/i386: disable smbus migration for xenpv
Date: Mon, 13 Jan 2020 18:45:21 +0100
Message-Id: <20200113174521.3336-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::6
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
Cc: Olaf Hering <olaf@aepfle.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With commit 7fccf2a06890e3bc3b30e29827ad3fb93fe88fea a new member
smbus_no_migration_support was added, and enabled in two places.
With commit 4ab2f2a8aabfea95cc53c64e13b3f67960b27fdf the vmstate_acpi
got new elements, which are conditionally filled. As a result, an
incoming migration expected smbus related data unless smbus migration
was disabled for a given MachineClass.

Since commit 7fccf2a06890e3bc3b30e29827ad3fb93fe88fea forgot to handle
xenpv, live migration to receiving hosts using qemu-4.0 and later is broken.
Therefore this patch must be applied to stable-4.x as well.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 hw/i386/pc_piix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa12203079..e19716d0d3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -952,6 +952,7 @@ static void xenfv_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
     m->default_machine_opts = "accel=xen";
+    m->smbus_no_migration_support = true;
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv", pc_xen_hvm_init,

