Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B95958EB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 09:52:18 +0200 (CEST)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzywD-0004oU-84
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 03:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hzysC-00085B-Ow
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hzysB-0004Td-LQ
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1hzysB-0004TF-CV
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 03:48:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7D5C3001BF1;
 Tue, 20 Aug 2019 07:48:06 +0000 (UTC)
Received: from thuth.com (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99254100195C;
 Tue, 20 Aug 2019 07:48:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 09:47:47 +0200
Message-Id: <20190820074749.25208-7-thuth@redhat.com>
In-Reply-To: <20190820074749.25208-1-thuth@redhat.com>
References: <20190820074749.25208-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 20 Aug 2019 07:48:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 6/8] hw/core: Add a config switch for the
 "split-irq" device
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "split-irq" device is currently only used by machines that use
CONFIG_ARMSSE. Let's add a proper CONFIG_SPLIT_IRQ switch for this
so that it only gets compiled when we really need it.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190817101931.28386-7-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 3 +++
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 849195c3f6..6e24c73b54 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -81,6 +81,7 @@ config MUSCA
     select ARMSSE
     select PL011
     select PL031
+    select SPLIT_IRQ
=20
 config MUSICPAL
     bool
@@ -364,6 +365,7 @@ config MPS2
     select OR_IRQ
     select PL022    # Serial port
     select PL080    # DMA controller
+    select SPLIT_IRQ
=20
 config FSL_IMX7
     bool
@@ -442,6 +444,7 @@ config ARMSSE
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
     select OR_IRQ
+    select SPLIT_IRQ
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 984143456a..fffb3d62b2 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -15,3 +15,6 @@ config PLATFORM_BUS
=20
 config REGISTER
     bool
+
+config SPLIT_IRQ
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index ce337bd7c9..bb1afe422a 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -19,7 +19,7 @@ common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
-common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
+common-obj-$(CONFIG_SPLIT_IRQ) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
--=20
2.18.1


