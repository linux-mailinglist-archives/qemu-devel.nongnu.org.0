Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007217D3CC
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Mar 2020 14:07:58 +0100 (CET)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAveu-0008Dv-P4
	for lists+qemu-devel@lfdr.de; Sun, 08 Mar 2020 09:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50080)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jAvdq-0007pG-0s
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 09:06:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jAvdp-0004Bp-02
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 09:06:49 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:45168)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1jAvdo-0004Am-O5
 for qemu-devel@nongnu.org; Sun, 08 Mar 2020 09:06:48 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id E8A80E328E;
 Sun,  8 Mar 2020 22:06:44 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 6781F1C0DBF;
 Sun,  8 Mar 2020 22:06:44 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org,
	philmd@redhat.com
Subject: [PATCH] docs: Add RX target.
Date: Sun,  8 Mar 2020 22:06:37 +0900
Message-Id: <20200308130637.37651-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add rx-virt target specificaion document.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 docs/system/target-rx.rst | 35 +++++++++++++++++++++++++++++++++++
 docs/system/targets.rst   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 docs/system/target-rx.rst

diff --git a/docs/system/target-rx.rst b/docs/system/target-rx.rst
new file mode 100644
index 0000000000..8540fd5218
--- /dev/null
+++ b/docs/system/target-rx.rst
@@ -0,0 +1,35 @@
+.. _RX-System-emulator:
+
+RX System emulator
+--------------------
+
+Use the executable ``qemu-system-rx`` to simulate a Virtual RX target.
+This target emulated following devices.
+
+-  R5F562N8 MCU
+
+   -  On-chip memory (ROM 512KB, RAM 96KB)
+   -  Interrupt Control Unit (ICUa)
+   -  8Bit Timer x 1CH (TMR0,1)
+   -  Compare Match Timer x 2CH (CMT0,1)
+   -  Serial Communication Interface x 1CH (SCI0)
+
+-  External memory 16MByte
+
+Example of ``qemu-system-rx`` usage for RX is shown below:
+
+Download ``<u-boot_image_file>`` from
+https://osdn.net/users/ysato/pf/qemu/dl/u-boot.bin.gz
+
+Start emulation of rx-virt::
+  qemu-system-rx -bios <u-boot_image_file>
+
+Download ``kernel_image_file`` from
+https://osdn.net/users/ysato/pf/qemu/dl/zImage
+
+Download ``device_tree_blob`` from
+https://osdn.net/users/ysato/pf/qemu/dl/rx-virt.dtb
+
+Start emulation of rx-virt::
+  qemu-system-rx -kernel <kernel_image_file> -dtb <device_tree_blob> \
+      -append "earlycon"
diff --git a/docs/system/targets.rst b/docs/system/targets.rst
index eba3111247..946f513daa 100644
--- a/docs/system/targets.rst
+++ b/docs/system/targets.rst
@@ -17,3 +17,4 @@ Contents:
    target-arm
    target-m68k
    target-xtensa
+   target-rx
--=20
2.20.1


