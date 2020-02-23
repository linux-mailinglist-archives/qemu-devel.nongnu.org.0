Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1143169677
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Feb 2020 07:56:56 +0100 (CET)
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5lCB-0007mm-Q9
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 01:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6l-0004K8-3q
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6j-0004pb-O9
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:19 -0500
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:47200)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j5l6j-0004od-EV
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 01:51:17 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id B8E1AE3501;
 Sun, 23 Feb 2020 15:51:16 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 7D26E24008E;
 Sun, 23 Feb 2020 15:51:16 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v31 19/22] hw/rx: Restrict the RX62N microcontroller to the
 RX62N CPU core
Date: Sun, 23 Feb 2020 15:50:59 +0900
Message-Id: <20200223065102.61652-20-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200223065102.61652-1-ysato@users.sourceforge.jp>
References: <20200223065102.61652-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
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
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

While the VIRT machine can use different microcontrollers,
the RX62N microcontroller is tied to the RX62N CPU core.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/rx/rx-virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rx/rx-virt.c b/hw/rx/rx-virt.c
index b945be9f75..6cf7936201 100644
--- a/hw/rx/rx-virt.c
+++ b/hw/rx/rx-virt.c
@@ -17,6 +17,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -56,6 +57,7 @@ static void rx_load_image(RXCPU *cpu, const char *filen=
ame,
=20
 static void rxvirt_init(MachineState *machine)
 {
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     RX62NState *s =3D g_new(RX62NState, 1);
     MemoryRegion *sysmem =3D get_system_memory();
     MemoryRegion *sdram =3D g_new(MemoryRegion, 1);
--=20
2.20.1


