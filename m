Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379413F4C4B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:24:37 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAsO-0005aQ-88
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl5-0006ku-ER
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl0-0000y6-FZ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:03 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE5oVp148177; Mon, 23 Aug 2021 10:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VpkCRa4LfOTodmoNQonwlPc/wVYK2Poeu+ab/W+CU1g=;
 b=RUzHZPw2avsM2KLRO4aa1DbYIWXdXGX5bRPBWxYehdUBnGscP4khYH6aGm2OulDwInOF
 MAEKmSCbIewq4ffxIMvKX3tTBBz4uruZay1YlSmUft+Patl6Dv2Rvp2fxFe3S5q1w/zJ
 4G1FS86mdDZ/H6BfR/fYtkZp+IqEx5PdgxGmCu3Xkuckuu9D5g6Q1pJG8V/HQrZ0B2sH
 EHYw23vSjAVgdeWOLAcZHugkTHz3XF8+wyrcdWImDNCJ54W6eFuD+ANF6xMFQZp0ugLU
 45BgWt1MlkytxzQygKihUMgGqqJD4cQ6zLivd885uDAABcEJzHhnI6MI7pQ674BUSswT 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akejst3fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:54 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE60Ac148998;
 Mon, 23 Aug 2021 10:16:54 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akejst3eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDD86022985;
 Mon, 23 Aug 2021 14:16:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3ajs4bkk47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGn0P48038236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F31DB112061;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B945711206E;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:48 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/12] migration: Add QMP command
 start-migration-handler
Date: Mon, 23 Aug 2021 10:16:33 -0400
Message-Id: <20210823141636.65975-10-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210823141636.65975-1-dovmurik@linux.ibm.com>
References: <20210823141636.65975-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x-dwwu1DlM8t5Onq35vUxUNh1dt0qTiF
X-Proofpoint-ORIG-GUID: kIMD-cbRgLUCFfOpaY3KdW_jGV9AN7Yn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The start-migration-handler QMP command starts the mirror vcpu directly
at the migration handler entry point.

This is a temporary workaround to start-up (resume) the mirror vcpu
which runs the in-guest migration handler (both on the source and the
target).

A proper solution would be to start it automatically when the 'migrate'
and 'migrate-incoming' QMP commands are executed.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 qapi/migration.json   | 12 ++++++++++++
 migration/migration.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/qapi/migration.json b/qapi/migration.json
index 69c615ec4d..baff3c6bf7 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1504,6 +1504,18 @@
 ##
 { 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
 
+##
+# @start-migration-handler:
+#
+# Start the mirror vcpu which runs the in-guest migration handler.
+#
+# Returns: nothing on success
+#
+# Since: 6.2
+#
+##
+{ 'command': 'start-migration-handler' }
+
 ##
 # @xen-save-devices-state:
 #
diff --git a/migration/migration.c b/migration/migration.c
index c9bc33fb10..a9f3a79e4f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -60,6 +60,7 @@
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
+#include "confidential-ram.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -2161,6 +2162,17 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
     once = false;
 }
 
+void qmp_start_migration_handler(Error **errp)
+{
+    CPUState *cpu;
+    CPU_FOREACH(cpu) {
+        if (cpu->mirror_vcpu) {
+            cgs_mh_reset_mirror_vcpu(cpu);
+            cpu_resume(cpu);
+        }
+    }
+}
+
 void qmp_migrate_recover(const char *uri, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
-- 
2.20.1


