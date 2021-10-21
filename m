Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10560435A1A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:52:42 +0200 (CEST)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQ4H-0001vq-1z
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZX-0005b8-Mt; Thu, 21 Oct 2021 00:20:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZV-0000Gs-Qz; Thu, 21 Oct 2021 00:20:55 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p53F2z4xdP; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=CVxAgttNgV9S/4ena7HpmowSsZyaEuwJumifnaebgmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pu4DAlwNSHbvzUN12xzS+ar6U1IkZ3mzCfPQoB5d5trWmo5IZScUbyJJwfrRyFFCE
 b1DoVm5Ca/VXcKvYxHf4WN5MzD2p9R6Ef4eMRdXBb0U71Fl6KYCT+krFsV1/TmLJC3
 /MlUShG5Z4gnuxVnbbsy7zSZttaNfYa1FSsXkP2k=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 15/25] ppc/pegasos2: Implement get-time-of-day RTAS function
 with VOF
Date: Thu, 21 Oct 2021 15:20:17 +1100
Message-Id: <20211021042027.345405-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

This is needed for Linux to access RTC time.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


