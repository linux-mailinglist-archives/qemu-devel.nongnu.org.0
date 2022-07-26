Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72B5817BA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:43:05 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNeC-0001My-NF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAJ-0003si-Hz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:13 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGNAH-0006IA-Jw
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:12:11 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn4Re016276;
 Tue, 26 Jul 2022 16:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=Q9REqTLqaxzuJbTQr14aek8V7TlG53PHONiCEnJyqgE=;
 b=MlaO5XVKNWGiGQ7yVHpkViJrv7Hzz0tkZur4lYGFvqS+bufpLICFHX7xbnAnaSFK3qyt
 wPLpg/KmwL1vOTNnha146y+C+xB6xzwun0j4GHRclnYiDOP4jx8C/tzRvvnrmSv7PG5E
 1DZyFOrqcqM+8/ldmq4rV33YsmHGN4P2gUdUXdjpLavfcJptDS22ZTgWvMR2gTE/jT6T
 +Q0WoPk1E/xtwzL5fJMAvIBGrd0Od3BqFWFZDBNWUxrp7f1I/NY3Hltd28maSLZ660HX
 p0s00gc/AlbyahCg6uUEYNgI+NI/yJUcZ9XtOwvNkBl5l5lWmuRKOpa5Ea457FQf03+i jw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9f0xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QEbnNk006229; Tue, 26 Jul 2022 16:11:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq2wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uTb023334;
 Tue, 26 Jul 2022 16:11:48 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-45; Tue, 26 Jul 2022 16:11:48 +0000
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
Subject: [PATCH V9 44/46] migration: fix suspended runstate
Date: Tue, 26 Jul 2022 09:10:41 -0700
Message-Id: <1658851843-236870-45-git-send-email-steven.sistare@oracle.com>
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
X-Proofpoint-GUID: oLZK3jPSA3hC8PoR32yDqyXY_4gpvKhl
X-Proofpoint-ORIG-GUID: oLZK3jPSA3hC8PoR32yDqyXY_4gpvKhl
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

Migration of a guest in the suspended state is broken.  The incoming
migration code automatically tries to wake the guest, which IMO is
wrong -- the guest should end migration in the same state it started.
Further, the wakeup attempt merely sets state to running but does
not actually start the guest, as vm_start was never called during this
invocation of qemu.

To fix, leave the guest in the suspended state, but call
qemu_system_start_on_wakeup_request() so the guest is properly resumed
when the client sends a system_wakeup command.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/migration.c | 11 ++++-------
 softmmu/runstate.c    |  1 +
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e0fc2b8..45eebea 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -568,6 +568,10 @@ static void process_incoming_migration_bh(void *opaque)
         vm_start();
     } else {
         runstate_set(global_state_get_runstate());
+        if (runstate_check(RUN_STATE_SUSPENDED)) {
+            /* Force vm_start to be called later. */
+            qemu_system_start_on_wakeup_request();
+        }
     }
     /*
      * This must happen after any state changes since as soon as an external
@@ -3273,7 +3277,6 @@ static int postcopy_start(MigrationState *ms)
     qemu_mutex_lock_iothread();
     trace_postcopy_start_set_run();
 
-    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
     global_state_store();
     ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
     if (ret < 0) {
@@ -3484,7 +3487,6 @@ static void migration_completion(MigrationState *s)
     if (s->state == MIGRATION_STATUS_ACTIVE) {
         qemu_mutex_lock_iothread();
         s->downtime_start = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
-        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
         s->vm_was_running = runstate_is_running();
         ret = global_state_store();
 
@@ -4285,11 +4287,6 @@ static void *bg_migration_thread(void *opaque)
 
     qemu_mutex_lock_iothread();
 
-    /*
-     * If VM is currently in suspended state, then, to make a valid runstate
-     * transition in vm_stop_force_state() we need to wakeup it up.
-     */
-    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
     s->vm_was_running = runstate_is_running();
 
     if (global_state_store()) {
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index c7db5ac..6ba0a4e 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -154,6 +154,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_RUNNING, RUN_STATE_SUSPENDED },
     { RUN_STATE_SUSPENDED, RUN_STATE_RUNNING },
     { RUN_STATE_SUSPENDED, RUN_STATE_FINISH_MIGRATE },
+    { RUN_STATE_SUSPENDED, RUN_STATE_PAUSED },
     { RUN_STATE_SUSPENDED, RUN_STATE_PRELAUNCH },
     { RUN_STATE_SUSPENDED, RUN_STATE_COLO},
 
-- 
1.8.3.1


