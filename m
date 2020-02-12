Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74E15A9B4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 14:07:53 +0100 (CET)
Received: from localhost ([::1]:37405 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1rk8-0001Xl-1k
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 08:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rgG-0004cn-HT
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rfr-0008Ae-Uk
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:52 -0500
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:32953)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1j1rfr-00089Q-9u
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 08:03:27 -0500
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 4C801DD664;
 Wed, 12 Feb 2020 22:03:24 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (ae231051.dynamic.ppp.asahi-net.or.jp [14.3.231.51])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 210D4240093;
 Wed, 12 Feb 2020 22:03:24 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH v30 22/22] qemu-doc.texi: Add RX section.
Date: Wed, 12 Feb 2020 22:03:11 +0900
Message-Id: <20200212130311.127515-23-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212130311.127515-1-ysato@users.sourceforge.jp>
References: <20200212130311.127515-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Describe emulated target specification. And two examples.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 qemu-doc.texi | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index a1ef6b6484..0b2173daa7 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1719,6 +1719,7 @@ differences are mentioned in the following sections=
.
 * Microblaze System emulator::
 * SH4 System emulator::
 * Xtensa System emulator::
+* RX System emulator::
 @end menu
=20
 @node PowerPC System emulator
@@ -2487,6 +2488,49 @@ so should only be used with trusted guest OS.
=20
 @c man end
=20
+@node RX System emulator
+@section RX System emulator
+@cindex system emulation (RX)
+
+Use the executable @file{qemu-system-rx} to simulate a Virtual RX target=
.
+This target emulated following devices.
+
+@itemize @minus
+@item
+R5F562N8 MCU
+@item
+On-chip memory (ROM 512KB, RAM 96KB)
+@item
+Interrupt Control Unit (ICUa)
+@item
+8Bit Timer x 1CH (TMR0,1)
+@item
+Compare Match Timer x 2CH (CMT0,1)
+@item
+Serial Communication Interface x 1CH (SCI0)
+@item
+External memory 16MByte
+@end itemize
+
+Example of @file{qemu-system-rx} usage for rx is shown below:
+
+Download @code{u-boot_image} from @url{https://osdn.net/users/ysato/pf/q=
emu/dl/u-boot.bin.gz}
+
+Start emulation of rx-virt:
+@example
+qemu-system-rx -bios @code{u-boot_image}
+@end example
+
+Download @code{kernel_image} from @url{https://osdn.net/users/ysato/pf/q=
emu/dl/zImage}
+
+Download @code{device_tree_blob} from @url{https://osdn.net/users/ysato/=
pf/qemu/dl/rx-virt.dtb}
+
+Start emulation of rx-virt:
+@example
+qemu-system-rx -kernel @code{kernel_image} -dtb @code{device_tree_blob} =
\
+  -append "earlycon"
+@end example
+
 @node QEMU User space emulator
 @chapter QEMU User space emulator
=20
--=20
2.20.1


