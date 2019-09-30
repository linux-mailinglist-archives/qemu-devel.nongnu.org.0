Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33FEC23EB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:07:54 +0200 (CEST)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExHE-0006zU-Ny
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iExEI-0005YE-B9
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iExEG-00023b-HO
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:04:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33030)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iExEG-00022m-CC; Mon, 30 Sep 2019 11:04:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F0FA18C4279;
 Mon, 30 Sep 2019 15:04:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D6FE60C5E;
 Mon, 30 Sep 2019 15:04:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] hw/isa: Introduce a CONFIG_ISA_SUPERIO switch for
 isa-superio.c
Date: Mon, 30 Sep 2019 17:04:36 +0200
Message-Id: <20190930150436.18162-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 30 Sep 2019 15:04:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-trivial@nongnu.org, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, isa-superio.c is always compiled as soon as CONFIG_ISA_BUS
is enabled. But there are also machines that have an ISA BUS without
any of the superio chips attached to it, so we should not compile
isa-superio.c in case we only compile a QEMU for such a machine.
Thus add a proper CONFIG_ISA_SUPERIO switch so that this file only gets
compiled when we really, really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/isa/Kconfig       | 10 +++++++---
 hw/isa/Makefile.objs |  2 +-
 hw/mips/Kconfig      |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 6db0d7970c..98a289957e 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -13,9 +13,13 @@ config I82378
     select MC146818RTC
     select PCSPK
 
-config PC87312
+config ISA_SUPERIO
     bool
     select ISA_BUS
+
+config PC87312
+    bool
+    select ISA_SUPERIO
     select I8259
     select I8254
     select I8257
@@ -34,14 +38,14 @@ config PIIX4
 
 config VT82C686
     bool
-    select ISA_BUS
+    select ISA_SUPERIO
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC
 
 config SMC37C669
     bool
-    select ISA_BUS
+    select ISA_SUPERIO
     select SERIAL_ISA
     select PARALLEL
     select FDC
diff --git a/hw/isa/Makefile.objs b/hw/isa/Makefile.objs
index 9e106df186..ff97485504 100644
--- a/hw/isa/Makefile.objs
+++ b/hw/isa/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-$(CONFIG_ISA_BUS) += isa-bus.o
-common-obj-$(CONFIG_ISA_BUS) += isa-superio.o
+common-obj-$(CONFIG_ISA_SUPERIO) += isa-superio.o
 common-obj-$(CONFIG_APM) += apm.o
 common-obj-$(CONFIG_I82378) += i82378.o
 common-obj-$(CONFIG_PC87312) += pc87312.o
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 62aa01b29e..2c2adbc42a 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -13,6 +13,7 @@ config R4K
 
 config MALTA
     bool
+    select ISA_SUPERIO
 
 config MIPSSIM
     bool
-- 
2.18.1


