Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A585817F5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:54:08 +0200 (CEST)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNot-0006T5-CR
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAA-0003bA-KJ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:02 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNA7-0006I4-JZ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:01 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFnGQB024653;
 Tue, 26 Jul 2022 16:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=1E7ftBulZgssm0c+1j+B3FQeV63g9AVrf9VViVsrlOY=;
 b=hj4PkNEIqpfIU7ZNY0LMiLtSj4Vb/1oksPxwEYqYM9t5N4C6t4k1enKrBUiyx7+Wf0RR
 V6vlGJHe1TO5K78SN5lzTVJx0m/QmXNoOsoJnno8KEyTbL82CrK4nsbPgKB4JuMRC+Cj
 9mkrGKOmd+qCObtnU9dY3OuHUhI4Wcgu79TOvEn4dHVyNT8B7/+5Mkky23p7FRHBVS6n
 C/O95mbKH2bkfZk/55W6QpSXgteAt8Uq6nXsztbiDKBNuF06d9I2A/znep2RKlc+RDts
 PquKxPeghj1Zd5zhlElKbzZkXhsdLwqegRWBeQNfYDfNrOT1BCYwy0+vpNwz7rcMBw8q TA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9hsq2pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:51 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QF2X5Q006282; Tue, 26 Jul 2022 16:11:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2y9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:50 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTd023334;
 Tue, 26 Jul 2022 16:11:50 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-46; Tue, 26 Jul 2022 16:11:49 +0000
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
Subject: [PATCH V9 45/46] migration: notifier error reporting
Date: Tue, 26 Jul 2022 09:10:42 -0700
Message-Id: <1658851843-236870-46-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-ORIG-GUID: cS0bm9GNboYLNHekOh5eGvNjSnFAMcqd
X-Proofpoint-GUID: cS0bm9GNboYLNHekOh5eGvNjSnFAMcqd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Provide migration_notifier_set_error(), which allows migration notifiers
to return an error message indicating they have failed, which halts the
migration.  The error message is visible in the 'info migrate' command.

No functional change until calls to migration_notifier_set_error are
added.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/misc.h |  3 ++-
 migration/migration.c    | 31 +++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index d4c2d7d..e5d8c81 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -63,7 +63,8 @@ bool migration_is_active(MigrationState *);
 void migration_add_notifier(Notifier *notify,
                             void (*func)(Notifier *notifier, void *data));
 void migration_remove_notifier(Notifier *notify);
-void migration_call_notifiers(MigrationState *s);
+int migration_call_notifiers(MigrationState *s);
+void migration_notifier_set_error(MigrationState *s, Error *err);
 bool migration_in_setup(MigrationState *);
 bool migration_has_finished(MigrationState *);
 bool migration_has_failed(MigrationState *);
diff --git a/migration/migration.c b/migration/migration.c
index 45eebea..d477b58 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1924,6 +1924,8 @@ static void block_cleanup_parameters(MigrationState *s)
 
 static void migrate_fd_cleanup(MigrationState *s)
 {
+    bool already_failed;
+
     qemu_bh_delete(s->cleanup_bh);
     s->cleanup_bh = NULL;
 
@@ -1973,7 +1975,15 @@ static void migrate_fd_cleanup(MigrationState *s)
         /* It is used on info migrate.  We can't free it */
         error_report_err(error_copy(s->error));
     }
-    migration_call_notifiers(s);
+
+    already_failed = migration_has_failed(s);
+    if (migration_call_notifiers(s)) {
+        if (!already_failed) {
+            migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
+            /* Notify again to recover from this late failure. */
+            migration_call_notifiers(s);
+        }
+    }
     block_cleanup_parameters(s);
     cpr_exec();
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
@@ -2084,9 +2094,16 @@ void migration_remove_notifier(Notifier *notify)
     }
 }
 
-void migration_call_notifiers(MigrationState *s)
+int migration_call_notifiers(MigrationState *s)
 {
     notifier_list_notify(&migration_state_notifiers, s);
+    return (s->error != NULL);
+}
+
+void migration_notifier_set_error(MigrationState *s, Error *err)
+{
+    migrate_set_error(s, err);
+    error_report_err(err);
 }
 
 bool migration_in_setup(MigrationState *s)
@@ -3381,7 +3398,9 @@ static int postcopy_start(MigrationState *ms)
      * spice needs to trigger a transition now
      */
     ms->postcopy_after_devices = true;
-    migration_call_notifiers(ms);
+    if (migration_call_notifiers(ms)) {
+        goto fail;
+    }
 
     ms->downtime =  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - time_at_stop;
 
@@ -4412,7 +4431,11 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         rate_limit = s->parameters.max_bandwidth / XFER_LIMIT_RATIO;
 
         /* Notify before starting migration thread */
-        migration_call_notifiers(s);
+        if (migration_call_notifiers(s)) {
+            migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
+            migrate_fd_cleanup(s);
+            return;
+        }
     }
 
     qemu_file_set_rate_limit(s->to_dst_file, rate_limit);
-- 
1.8.3.1


