Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16415B12D2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 18:35:13 +0200 (CEST)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8S3r-0007wT-Kq
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 12:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i8S0g-0005p5-BH
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 12:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i8S0e-0006KA-Tp
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 12:31:54 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:37117 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i8S0e-00061t-GO
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 12:31:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B78F11A1E6B;
 Thu, 12 Sep 2019 18:30:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8C6631A1EA3;
 Thu, 12 Sep 2019 18:30:46 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 18:30:39 +0200
Message-Id: <1568305840-12550-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568305840-12550-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1568305840-12550-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 3/4] hw/mips/mips_jazz: Remove
 no-longer-necessary override of do_unassigned_access
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

From: Peter Maydell <peter.maydell@linaro.org>

Now that the MIPS CPU implementation uses the new
do_transaction_failed hook, we can remove the old code that handled
the do_unassigned_access hook.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20190802160458.25681-4-peter.maydell@linaro.org>
---
 hw/mips/mips_jazz.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index 1a8e847..c967b97 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -111,18 +111,6 @@ static const MemoryRegionOps dma_dummy_ops =3D {
 #define MAGNUM_BIOS_SIZE_MAX 0x7e000
 #define MAGNUM_BIOS_SIZE (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE :=
 MAGNUM_BIOS_SIZE_MAX)
=20
-static CPUUnassignedAccess real_do_unassigned_access;
-static void mips_jazz_do_unassigned_access(CPUState *cpu, hwaddr addr,
-                                           bool is_write, bool is_exec,
-                                           int opaque, unsigned size)
-{
-    if (!is_exec) {
-        /* ignore invalid access (ie do not raise exception) */
-        return;
-    }
-    (*real_do_unassigned_access)(cpu, addr, is_write, is_exec, opaque, s=
ize);
-}
-
 static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr=
,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
@@ -184,9 +172,8 @@ static void mips_jazz_init(MachineState *machine,
      * However, we can't simply add a global memory region to catch
      * everything, as this would make all accesses including instruction
      * accesses be ignored and not raise exceptions.
-     * So instead we hijack either the do_unassigned_access method or
-     * the do_transaction_failed method on the CPU, and do not raise exc=
eptions
-     * for data access.
+     * So instead we hijack the do_transaction_failed method on the CPU,=
 and
+     * do not raise exceptions for data access.
      *
      * NOTE: this behaviour of raising exceptions for bad instruction
      * fetches but not bad data accesses was added in commit 54e755588cf=
1e9
@@ -197,14 +184,8 @@ static void mips_jazz_init(MachineState *machine,
      * memory region that catches all memory accesses, as we do on Malta=
.
      */
     cc =3D CPU_GET_CLASS(cpu);
-    if (cc->do_unassigned_access) {
-        real_do_unassigned_access =3D cc->do_unassigned_access;
-        cc->do_unassigned_access =3D mips_jazz_do_unassigned_access;
-    }
-    if (cc->do_transaction_failed) {
-        real_do_transaction_failed =3D cc->do_transaction_failed;
-        cc->do_transaction_failed =3D mips_jazz_do_transaction_failed;
-    }
+    real_do_transaction_failed =3D cc->do_transaction_failed;
+    cc->do_transaction_failed =3D mips_jazz_do_transaction_failed;
=20
     /* allocate RAM */
     memory_region_allocate_system_memory(ram, NULL, "mips_jazz.ram",
--=20
2.7.4


