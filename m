Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AFB671A9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:50:37 +0200 (CEST)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwse-0003cL-RW
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <julio.montes@intel.com>) id 1hlwsQ-0003Cb-Rs
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <julio.montes@intel.com>) id 1hlwsP-0006g5-UF
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:50:22 -0400
Received: from mga11.intel.com ([192.55.52.93]:19585)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <julio.montes@intel.com>)
 id 1hlwsP-0006dU-Lk
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:50:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 07:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,482,1557212400"; d="scan'208";a="186615576"
Received: from unknown (HELO fedora.zpn.intel.com.) ([10.219.4.39])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2019 07:50:17 -0700
From: Julio Montes <julio.montes@intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 14:50:17 +0000
Message-Id: <20190712145017.17879-1-julio.montes@intel.com>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH] hw/i386: turn off vmport if CONFIG_VMPORT is
 disabled
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
Cc: Julio Montes <julio.montes@intel.com>, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmport device is not included when CONFIG_VMPORT is disabled, hence
QEMU fails with the following error:

`Unknown device 'vmport' for bus 'ISA': unknown.`

Signed-off-by: Julio Montes <julio.montes@intel.com>
---
 hw/i386/pc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c33ce47578..549c437050 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -83,6 +83,7 @@
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "qapi/qmp/qerror.h"
+#include "config-devices.h"
 
 /* debug PC/ISA interrupts */
 //#define DEBUG_IRQ
@@ -2793,7 +2794,11 @@ static void pc_machine_initfn(Object *obj)
 
     pcms->max_ram_below_4g = 0; /* use default */
     pcms->smm = ON_OFF_AUTO_AUTO;
+#ifdef CONFIG_VMPORT
     pcms->vmport = ON_OFF_AUTO_AUTO;
+#else
+    pcms->vmport = ON_OFF_AUTO_OFF;
+#endif /* CONFIG_VMPORT */
     /* acpi build is enabled by default if machine supports it */
     pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
     pcms->smbus_enabled = true;
-- 
2.17.2


