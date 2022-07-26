Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413858180E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 19:04:31 +0200 (CEST)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNyw-0002lw-Mx
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 13:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAs-0004My-Mb
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAq-0006Lc-Hu
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:46 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnPJ6006232;
 Tue, 26 Jul 2022 16:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=jNMAAWZMOPGgH+ehHeNEsLT3RqIsn363j0+zvf58O48=;
 b=nVDnaRP9dkGAEjpBMbTRh3PwY+UUvXCUjeDEL5egDW/mc5myGJfY1dvXvmKim+PMumwK
 8qtlyMyVMzWRQEFT6RuTdZwof82FDeR6ROLAPt+AJ5z8pRAqt/Oj1Xjdmj6i8S0J4uV9
 I0wRz7GTk9yPe+afwiC7F+ehxPbR1uloEjpW+mxdvgq79B06gk6uccHvefKGTY4w8/pi
 XsdRaaRhMSXZnfuMEqNQ1hqw1VFzdAVn2gdz5B1TF0jqtXeTLF7gElO01+Xt0uQNGF6o
 n1kVR3Lsb57yqKjFS+c10RJRmDB9WqxoT6+IfBXDLLuw4Eq4cTw9H/FuJYAKxCmrAJA5 TQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg940pu2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:19 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEsIB3006240; Tue, 26 Jul 2022 16:11:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq20x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:18 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSt023334;
 Tue, 26 Jul 2022 16:11:17 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-24; Tue, 26 Jul 2022 16:11:17 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 23/46] cpr: add exec-mode blockers
Date: Tue, 26 Jul 2022 09:10:20 -0700
Message-Id: <1658851843-236870-24-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-GUID: iY3ZssBZfRyU9aTk-evajqMXwoygyx8l
X-Proofpoint-ORIG-GUID: iY3ZssBZfRyU9aTk-evajqMXwoygyx8l
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add blockers for cpr-exec migration mode for devices and options that do
not support it.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 accel/xen/xen-all.c   | 3 +++
 migration/migration.c | 5 +++++
 replay/replay.c       | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d0..2896044 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -181,6 +181,9 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    migrate_add_blocker_always("xen does not support cpr exec",
+                               &error_fatal, MIG_MODE_CPR_EXEC, -1);
     return 0;
 }
 
diff --git a/migration/migration.c b/migration/migration.c
index 1a8a6ff..7b46213 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1348,6 +1348,11 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
+        return migrate_add_blocker_always("x-colo is not compatible with cpr",
+                                          errp, MIG_MODE_CPR_EXEC, -1);
+    }
+
     return true;
 }
 
diff --git a/replay/replay.c b/replay/replay.c
index 4c396bb..b0194dd 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -19,6 +19,7 @@
 #include "qemu/option.h"
 #include "sysemu/cpus.h"
 #include "qemu/error-report.h"
+#include "migration/blocker.h"
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
@@ -232,6 +233,9 @@ static void replay_enable(const char *fname, int mode)
     const char *fmode = NULL;
     assert(!replay_file);
 
+    migrate_add_blocker_always("replay is not compatible with cpr",
+                                &error_fatal, MIG_MODE_CPR_EXEC, -1);
+
     switch (mode) {
     case REPLAY_MODE_RECORD:
         fmode = "wb";
-- 
1.8.3.1


