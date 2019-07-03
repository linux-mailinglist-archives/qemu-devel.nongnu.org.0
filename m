Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3B5D68E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:03:03 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiO3S-00064Z-Ny
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50399)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLlL-0002z6-Ov
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiLlH-0000KN-PW
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:09 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59849 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiLlF-0007pn-HN
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:36:05 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 857EC1A21B9;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 5DD881A219E;
 Tue,  2 Jul 2019 18:35:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 18:35:21 +0200
Message-Id: <1562085328-5126-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562085328-5126-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 05/12] hw/mips: Express dependencies of the r4k
 platform with Kconfig
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

This platform use standard PC devices connected to an ISA bus.
Networking is provided by a ne2000 chipset.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190701112612.14758-5-philmd@redhat.com>
---
 default-configs/mips-softmmu-common.mak |  1 -
 hw/mips/Kconfig                         | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mi=
ps-softmmu-common.mak
index d545987..da29c6c 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -27,7 +27,6 @@ CONFIG_I8257=3Dy
 CONFIG_PIIX4=3Dy
 CONFIG_IDE_ISA=3Dy
 CONFIG_IDE_PIIX=3Dy
-CONFIG_NE2000_ISA=3Dy
 CONFIG_PFLASH_CFI01=3Dy
 CONFIG_I8259=3Dy
 CONFIG_MC146818RTC=3Dy
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index ab00647..62aa01b 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,5 +1,15 @@
 config R4K
     bool
+    select ISA_BUS
+    select SERIAL_ISA
+    select I8259
+    select I8254
+    select MC146818RTC
+    imply VGA_ISA
+    imply NE2000_ISA
+    select IDE_ISA
+    select PCKBD
+    select PFLASH_CFI01
=20
 config MALTA
     bool
--=20
2.7.4


