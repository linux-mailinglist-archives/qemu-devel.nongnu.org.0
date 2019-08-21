Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640049735A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:28:49 +0200 (CEST)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0L32-0006W6-7Y
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0G-0004Oj-21
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0E-0007sX-Qx
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:25:55 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53363)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0E-0007qM-Ag; Wed, 21 Aug 2019 03:25:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46Czj86LCYz9sN6; Wed, 21 Aug 2019 17:25:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372348;
 bh=aw5W83RgbqJeiMgkHYQ5Rg2X9vFhxMjn+uUovii8P/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d1xqWc7e50udB77cS0IHhRo/aoj8z3dMVpuENTiBdPrAfJrU3dtGBBkwPEHjU/UuM
 yyVEwGfzto49GPnvS4dRE4wfP4lieyiQyZxRUH5wJ2dteVcro28yELutpIDe6j/Hdu
 G9F78koQwlI9vSaVPud6vA+/bSljeSjAYW9WPx08=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:05 +1000
Message-Id: <20190821072542.23090-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 05/42] migration: Do not re-read the clock on
 pre_save in case of paused guest
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org,
 "Maxiwell S. Garcia" <maxiwell@linux.ibm.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Maxiwell S. Garcia" <maxiwell@linux.ibm.com>

Re-read the timebase before migrate was ported from x86 commit:
   6053a86fe7bd: kvmclock: reduce kvmclock difference on migration

The clock move makes the guest knows about the paused time between
the stop and migrate commands. This is an issue in an already-paused
VM because some side effects, like process stalls, could happen
after migration.

So, this patch checks the runstate of guest in the pre_save handler and
do not re-reads the timebase in case of paused state (cold migration).

Signed-off-by: Maxiwell S. Garcia <maxiwell@linux.ibm.com>
Message-Id: <20190711194702.26598-1-maxiwell@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc.c         | 13 +++++++++----
 target/ppc/cpu-qom.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 7963feeab4..52a18eb7d7 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1011,6 +1011,8 @@ static void timebase_save(PPCTimebase *tb)
      * there is no need to update it from KVM here
      */
     tb->guest_timebase =3D ticks + first_ppc_cpu->env.tb_env->tb_offset;
+
+    tb->runstate_paused =3D runstate_check(RUN_STATE_PAUSED);
 }
=20
 static void timebase_load(PPCTimebase *tb)
@@ -1054,9 +1056,9 @@ void cpu_ppc_clock_vm_state_change(void *opaque, in=
t running,
 }
=20
 /*
- * When migrating, read the clock just before migration,
- * so that the guest clock counts during the events
- * between:
+ * When migrating a running guest, read the clock just
+ * before migration, so that the guest clock counts
+ * during the events between:
  *
  *  * vm_stop()
  *  *
@@ -1071,7 +1073,10 @@ static int timebase_pre_save(void *opaque)
 {
     PPCTimebase *tb =3D opaque;
=20
-    timebase_save(tb);
+    /* guest_timebase won't be overridden in case of paused guest */
+    if (!tb->runstate_paused) {
+        timebase_save(tb);
+    }
=20
     return 0;
 }
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index a2f202f021..5769fb78a9 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -201,6 +201,7 @@ typedef struct PowerPCCPUClass {
 typedef struct PPCTimebase {
     uint64_t guest_timebase;
     int64_t time_of_the_day_ns;
+    bool runstate_paused;
 } PPCTimebase;
=20
 extern const VMStateDescription vmstate_ppc_timebase;
--=20
2.21.0


