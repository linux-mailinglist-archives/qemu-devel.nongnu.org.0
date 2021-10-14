Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1842E282
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:15:11 +0200 (CEST)
Received: from localhost ([::1]:43152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb78B-0001fo-1Q
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75X-0006YX-3I; Thu, 14 Oct 2021 16:12:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75V-0002VN-IO; Thu, 14 Oct 2021 16:12:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BDBD2756194;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 46CF9756057; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/6] ppc/pegasos2: Implement get-time-of-day RTAS function
 with VOF
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed for Linux to access RTC time.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a1dd1f6752..a9e3625f56 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -31,6 +31,8 @@
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "exec/address-spaces.h"
+#include "qom/qom-qobject.h"
+#include "qapi/qmp/qdict.h"
 #include "trace.h"
 #include "qemu/datadir.h"
 #include "sysemu/device_tree.h"
@@ -369,6 +371,29 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
         return H_PARAMETER;
     }
     switch (token) {
+    case RTAS_GET_TIME_OF_DAY:
+    {
+        QObject *qo = object_property_get_qobject(qdev_get_machine(),
+                                                  "rtc-time", &error_fatal);
+        QDict *qd = qobject_to(QDict, qo);
+
+        if (nargs != 0 || nrets != 8 || !qd) {
+            stl_be_phys(as, rets, -1);
+            qobject_unref(qo);
+            return H_PARAMETER;
+        }
+
+        stl_be_phys(as, rets, 0);
+        stl_be_phys(as, rets + 4, qdict_get_int(qd, "tm_year") + 1900);
+        stl_be_phys(as, rets + 8, qdict_get_int(qd, "tm_mon") + 1);
+        stl_be_phys(as, rets + 12, qdict_get_int(qd, "tm_mday"));
+        stl_be_phys(as, rets + 16, qdict_get_int(qd, "tm_hour"));
+        stl_be_phys(as, rets + 20, qdict_get_int(qd, "tm_min"));
+        stl_be_phys(as, rets + 24, qdict_get_int(qd, "tm_sec"));
+        stl_be_phys(as, rets + 28, 0);
+        qobject_unref(qo);
+        return H_SUCCESS;
+    }
     case RTAS_READ_PCI_CONFIG:
     {
         uint32_t addr, len, val;
-- 
2.21.4


