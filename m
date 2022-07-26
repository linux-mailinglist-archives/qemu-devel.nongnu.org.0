Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73037581788
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:39:34 +0200 (CEST)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNan-00054e-FH
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9w-00033q-Bd
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:48 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9t-0006Bd-Vt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:47 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn4iJ016269;
 Tue, 26 Jul 2022 16:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Dkgw2hV3LTizWyr+JMzC+LU6gc3ZsMZvXFzyN2LhVpY=;
 b=nxlnicrNzlU+wq7uQJcZdHYE32Jjt7X9WFKglzZMRFnRrMJNWYvxb/zOxzi9p2+uNLvE
 fqfjUZXy7ZuhjP6urFlQCnG4NuhVIi7o/b1x36BppAUf/JmkrqFuskaycqozeS9Sxh9E
 EOwo6ww9YP5k182i21p5ybR/1H/C9VUEdt3G33Kiu0pjm3vzfy85Ghue0GsgPXok/jsv
 rHnkq7AuqhtoXsVSwrHGFMQ4N5CoxC9GJP7XbVIERVUp241O8fPo+++Z3aQQvyy3Uzil
 K9w7xyhiIMDS6WjAqWfF39JG5qBGtWCs9dbhRKf5grzb0yrOhFXIBtiPn5eiayhLHbQi zw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:22 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF5NqA006270; Tue, 26 Jul 2022 16:11:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:21 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSx023334;
 Tue, 26 Jul 2022 16:11:20 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-26; Tue, 26 Jul 2022 16:11:20 +0000
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
Subject: [PATCH V9 25/46] cpr: only-cpr-capable
Date: Tue, 26 Jul 2022 09:10:22 -0700
Message-Id: <1658851843-236870-26-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: dGeuz_FRqFAM53Y8AxSPtX-4jrTsch1z
X-Proofpoint-ORIG-GUID: dGeuz_FRqFAM53Y8AxSPtX-4jrTsch1z
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

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
the migrate commanmd will not fail due to a blocker.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/cpr.h |  2 ++
 migration/migration.c   | 13 +++++++++++++
 qemu-options.hx         |  8 ++++++++
 softmmu/vl.c            |  4 ++++
 4 files changed, 27 insertions(+)

diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index c48be2d..f2dfb1b 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -8,6 +8,8 @@
 #ifndef MIGRATION_CPR_H
 #define MIGRATION_CPR_H
 
+#define CPR_MODES     (BIT(MIG_MODE_CPR_REBOOT) | BIT(MIG_MODE_CPR_EXEC))
+
 extern bool only_cpr_capable;
 
 void cpr_init(void);
diff --git a/migration/migration.c b/migration/migration.c
index 7b46213..e0fc2b8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2181,6 +2181,11 @@ bool migrate_mode_enabled(MigMode mode)
     return !!(migrate_enabled_modes & BIT(mode));
 }
 
+static bool migrate_modes_enabled(int modes)
+{
+    return (modes & migrate_enabled_modes) == modes;
+}
+
 static int migrate_check_enabled(Error **errp)
 {
     MigMode mode = migrate_mode();
@@ -2262,6 +2267,14 @@ static int check_blockers(Error **reasonp, Error **errp, int modes)
         return -EACCES;
     }
 
+    if (only_cpr_capable && (modes & CPR_MODES) &&
+        migrate_modes_enabled(modes & CPR_MODES)) {
+        error_propagate_prepend(errp, *reasonp,
+                                "-only-cpr-capable specified, but: ");
+        *reasonp = NULL;
+        return -EACCES;
+    }
+
     return add_blockers(reasonp, errp, modes);
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 7797d3d..3ed9270 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4501,6 +4501,14 @@ SRST
     migration using any mode except 'normal'.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cpr will not
+    fail due to a cpr blocker.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5f6cd8c..bed147c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -77,6 +77,7 @@
 #include "hw/block/block.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
+#include "migration/cpr.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
 #include "sysemu/tpm.h"
@@ -3366,6 +3367,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_migrate_mode_enable:
                 migrate_enable_mode(qapi_enum_parse(&MigMode_lookup, optarg, -1,
                                                     &error_fatal));
-- 
1.8.3.1


