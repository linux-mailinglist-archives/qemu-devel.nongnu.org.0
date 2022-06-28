Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C355F00B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 22:57:56 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6IHS-0001It-Ue
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 16:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1o6IFy-00007U-Hj; Tue, 28 Jun 2022 16:56:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1o6IFu-000633-Sg; Tue, 28 Jun 2022 16:56:22 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SKObKx002875;
 Tue, 28 Jun 2022 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=KnA9Wfsq16ytkMm+OD0tF7rhZHAlhsg2ejjpUfpVs8g=;
 b=jfQJdn48sA+KHx6Dw2IZbl3wbERFRewlz6BxAtJi/z6ZZkheJCumhrqzS9JiS9gHKT0K
 tm1kqnikOk6oSmDrJ0pzkB2gJdblZK6czeJQh83ZSZF/EAaDaapjOVVKzLwORYZIpTkh
 fX+8HaT1XrQ3PxV1zA6692CRgWAG/79/VBBP+8oe2NODAbXoSKAsq5Ug/OJlx/d/QF2F
 q0VG9GSDnf8Ebx/+vBuMUFvwdc93jszHNvB0MmJzBrEfy6gX/foKyT9aBnCv2xEr8zmR
 B+K5eXGHPFWH58Ys1GS8bmEfr/M7hsO+5qR4qMjmSZy9emQ/K+/2LBqe2pUF8dzlnJn8 JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h08ngs5u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 20:55:57 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25SKQPva007089;
 Tue, 28 Jun 2022 20:55:57 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h08ngs5t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 20:55:57 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25SKppcA018073;
 Tue, 28 Jun 2022 20:55:55 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3gwt0a10u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jun 2022 20:55:55 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25SKts6l23724538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 20:55:54 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9097EBE054;
 Tue, 28 Jun 2022 20:55:54 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AB08BE053;
 Tue, 28 Jun 2022 20:55:54 +0000 (GMT)
Received: from localhost (unknown [9.211.150.53])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Jun 2022 20:55:53 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 "Matheus K . Ferst" <matheus.ferst@eldorado.org.br>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH v2] target/ppc: Return default CPU for max CPU
Date: Tue, 28 Jun 2022 17:55:13 -0300
Message-Id: <20220628205513.81917-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QBuw4NmNbz1NmiP8q3r-tQOPsbOwfIY9
X-Proofpoint-GUID: 2m39YB_Y8rFhkl1aPVwZneS4cpzNz7B3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All ppc CPUs represent hardware that exists in the real world, i.e.: we
do not have a "max" CPU with all possible emulated features enabled.
Return the default CPU type for the machine because that has greater
chance of being useful as the "max" CPU.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
Cc: Cédric Le Goater <clg@kaod.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Greg Kurz <groug@kaod.org>
Cc: Matheus K. Ferst <matheus.ferst@eldorado.org.br>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
v2:
- Return the default CPU of the machine instead of hard-coded alias.

v1: https://lore.kernel.org/qemu-devel/20220531172711.94564-1-muriloo@linux.ibm.com/

 target/ppc/cpu-models.c |  1 -
 target/ppc/cpu_init.c   | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d1..05589eb21d 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
     { "755", "755_v2.8" },
     { "goldfinger", "755_v2.8" },
     { "7400", "7400_v2.9" },
-    { "max", "7400_v2.9" },
     { "g4",  "7400_v2.9" },
     { "7410", "7410_v1.4" },
     { "nitro", "7410_v1.4" },
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c16cb8dbe7..8ee0b7c785 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -47,6 +47,10 @@
 #include "spr_common.h"
 #include "power8-pmu.h"
 
+#ifndef CONFIG_USER_ONLY
+#include "hw/boards.h"
+#endif
+
 /* #define PPC_DEBUG_SPR */
 /* #define USE_APPLE_GDB */
 
@@ -6963,6 +6967,21 @@ static ObjectClass *ppc_cpu_class_by_name(const char *name)
         }
     }
 
+    /*
+     * All ppc CPUs represent hardware that exists in the real world, i.e.: we
+     * do not have a "max" CPU with all possible emulated features enabled.
+     * Return the default CPU type for the machine because that has greater
+     * chance of being useful as the "max" CPU.
+     */
+#if !defined(CONFIG_USER_ONLY)
+    if (strcmp(name, "max") == 0) {
+        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+        if (mc) {
+            return object_class_by_name(mc->default_cpu_type);
+        }
+    }
+#endif
+
     cpu_model = g_ascii_strdown(name, -1);
     p = ppc_cpu_lookup_alias(cpu_model);
     if (p) {
-- 
2.36.1


