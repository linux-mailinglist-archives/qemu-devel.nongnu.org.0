Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF534146B92
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:43:43 +0100 (CET)
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudhu-0000iW-3E
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iucUO-0001Fo-Kq
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:25:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iucUM-0000rf-MO
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:25:40 -0500
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:52544)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1iucUM-0000pl-C3
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:25:38 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 8037543AD7;
 Thu, 23 Jan 2020 22:25:37 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (v046114.dynamic.ppp.asahi-net.or.jp [124.155.46.114])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 50FC3240090;
 Thu, 23 Jan 2020 22:25:37 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v29 19/22] hw/rx: Restrict the RX62N microcontroller to the
 RX62N CPU core
Date: Thu, 23 Jan 2020 22:25:22 +0900
Message-Id: <20200123132525.80891-20-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123132525.80891-1-ysato@users.sourceforge.jp>
References: <20200123132525.80891-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.13
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
index 017941b996..f58fa3e5a8 100644
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


