Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D011C581778
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:32:45 +0200 (CEST)
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNUC-00069r-Tr
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9p-0002yb-Qb
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9n-0006AM-HS
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn4hv016269;
 Tue, 26 Jul 2022 16:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=u2MWiSZpF/89/yzfefk2Fsd8NnqPznxjKBk/scAaZvA=;
 b=TMtxlw62/7naRMWgmpPUlJtYh3IJ0oC+tIgmEprRiq3NN+fqJLqcLf9s5TzIZJTfdlmt
 RB+QyuRwYrnUhm0P7cy8Yiwma/BtTH+g3CrAYGYoq5vRDy+MNI3O7b/VEXHAgUgZlZ5h
 Ts28yI4jnaKaMos8lf7W++441vKMN0Fg89r2Q3007AXfomevxTCFsEHuJK6couOYCyFh
 797lYhYNzZ3wKeabXPxtuEwEiwQAAbtv0nHoELAVw6rv0iuXeCi0R4AiGdpRLMG2A1Bu
 dlTQCj9FZ9z7H+a8BEr3m0Pe7SRGGynuiWAih/wWKBo2fEPqDXt5nSbpIMUbEz69QFNt IA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFswoO006211; Tue, 26 Jul 2022 16:10:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq18k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:10:53 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSJ023334;
 Tue, 26 Jul 2022 16:10:52 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-6; Tue, 26 Jul 2022 16:10:52 +0000
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
Subject: [PATCH V9 05/46] migration: migrate-enable-mode option
Date: Tue, 26 Jul 2022 09:10:02 -0700
Message-Id: <1658851843-236870-6-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: iF24gUVxG8YJCaf4dLmv1TdeCCgll1us
X-Proofpoint-ORIG-GUID: iF24gUVxG8YJCaf4dLmv1TdeCCgll1us
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

Add the '-migrate-enable-mode <mode>' command-line option as a
pre-requisite for migration using the mode.  Multiple
-migrate-enable-mode options may be specified, one per mode.

Requiring -migrate-enable-mode allows qemu to initialize objects
differently, if necessary, so that migration for a mode is not blocked.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/misc.h |  2 ++
 migration/migration.c    | 31 +++++++++++++++++++++++++++++++
 qemu-options.hx          | 10 ++++++++++
 softmmu/vl.c             |  4 ++++
 4 files changed, 47 insertions(+)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index 1e01134..71b6285 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -78,5 +78,7 @@ void dirty_bitmap_mig_init(void);
 
 MigMode migrate_mode(void);
 MigMode migrate_mode_of(MigrationState *s);
+void migrate_enable_mode(MigMode mode);
+bool migrate_mode_enabled(MigMode mode);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index 38584db..5f704a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -173,6 +173,7 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
 
 static MigrationState *current_migration;
 static MigrationIncomingState *current_incoming;
+static int migrate_enabled_modes = BIT(MIG_MODE_NORMAL);
 
 static GSList *migration_blockers;
 
@@ -2140,6 +2141,29 @@ bool migration_is_active(MigrationState *s)
             s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE);
 }
 
+void migrate_enable_mode(MigMode mode)
+{
+    migrate_enabled_modes |= BIT(mode);
+}
+
+bool migrate_mode_enabled(MigMode mode)
+{
+    return !!(migrate_enabled_modes & BIT(mode));
+}
+
+static int migrate_check_enabled(Error **errp)
+{
+    MigMode mode = migrate_mode();
+
+    if (!migrate_mode_enabled(mode)) {
+        error_setg(errp, "migrate mode is not enabled.  "
+                         "Use '-migrate-mode-enable %s'.",
+                   MigMode_str(mode));
+        return -1;
+    }
+    return 0;
+}
+
 void migrate_init(MigrationState *s)
 {
     /*
@@ -2210,6 +2234,9 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
     Error *local_err = NULL;
     static bool once = true;
 
+    if (migrate_check_enabled(errp)) {
+        return;
+    }
     if (!once) {
         error_setg(errp, "The incoming migration has already been started");
         return;
@@ -2356,6 +2383,10 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
         return false;
     }
 
+    if (migrate_check_enabled(errp)) {
+        return false;
+    }
+
     if (migration_is_blocked(errp)) {
         return false;
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index 5ff47f4..7797d3d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4491,6 +4491,16 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("migrate-mode-enable", HAS_ARG, QEMU_OPTION_migrate_mode_enable, \
+    "-migrate-mode-enable <mode>    enable the migration mode.\n",
+    QEMU_ARCH_ALL)
+SRST
+``-migrate-mode-enable <mode>``
+    Enable the specified migrate mode.  May be supplied
+    multiple times, once per mode.  This is a pre-requisite for performing a
+    migration using any mode except 'normal'.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7189eb6..83f3be0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3364,6 +3364,10 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_migrate_mode_enable:
+                migrate_enable_mode(qapi_enum_parse(&MigMode_lookup, optarg, -1,
+                                                    &error_fatal));
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
-- 
1.8.3.1


