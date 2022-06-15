Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55354CBFB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:58:23 +0200 (CEST)
Received: from localhost ([::1]:39156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UTO-0008JF-Cn
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOO-00070p-5I
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOM-00013C-6E
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:11 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDbQTs015213;
 Wed, 15 Jun 2022 14:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=EVAD4RFjpdDcmnkuVWmYBBgoufB9nCDpxPYM8mbku8w=;
 b=TtCcHiSJv0DMYG+SSHcqVnjjELPJrPte3Fzdro+1ItjRkzPkfZPFldWVrYIw3zk7kgyi
 mIN9Ff9Woscb7BgbqGo25bYNBlt/PHPTtE0r3X/6g6lGec6N6hATbZ0kA7f6/Tv2D3ry
 ZUBt/9+2bdeGcUF0kNUZ37furMlES/vbUuzdaIVP7v3ZHyI4o9vYPjGHCxgaapVXa6Pv
 tYOIMElNCD47oUPZp79fc9YSsvEljtzUWMdBLw6l8JzYIDQTjs/ICi9f8JKw0V3Munf4
 TReyVJR/zIN7dEH5AkiVDvHT69dHp6n4g/2b9l8wX3HRS61nJfHgLBJNpdxTe3JYep4M EA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhn0gvfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:59 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ6AH023069; Wed, 15 Jun 2022 14:52:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:59 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNX018501;
 Wed, 15 Jun 2022 14:52:58 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-26; Wed, 15 Jun 2022 14:52:58 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 25/39] cpr: notifiers
Date: Wed, 15 Jun 2022 07:52:12 -0700
Message-Id: <1655304746-102776-26-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: HXos4WmOqK0tj2MCP7zfYQZG9z_T3sVD
X-Proofpoint-ORIG-GUID: HXos4WmOqK0tj2MCP7zfYQZG9z_T3sVD
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

Add an interface to register notifiers for cpr transitions.  It is used to
support vfio cpr in a subsequent patch.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/cpr.h | 13 +++++++++++++
 migration/cpr.c         | 25 +++++++++++++++++++++++++
 stubs/cpr.c             | 10 ++++++++++
 3 files changed, 48 insertions(+)

diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index b75dec4..ab5f53e 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -9,6 +9,7 @@
 #define MIGRATION_CPR_H
 
 #include "qapi/qapi-types-cpr.h"
+#include "qemu/notify.h"
 
 void cpr_init(int modes);
 void cpr_set_mode(CprMode mode);
@@ -37,4 +38,16 @@ int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...);
 int cpr_add_blocker_str(const char *reason, Error **errp, CprMode mode, ...);
 void cpr_del_blocker(Error **reasonp);
 
+typedef enum CprNotifyState {
+    CPR_NOTIFY_EXEC,
+    CPR_NOTIFY_SAVE_FAILED,
+    CPR_NOTIFY_LOAD_FAILED,
+    CPR_NOTIFY_NUM
+} CprNotifyState;
+
+void cpr_add_notifier(Notifier *notify,
+                      void (*cb)(Notifier *notifier, void *data),
+                      CprNotifyState state);
+void cpr_remove_notifier(Notifier *notify);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 8b3fffd..9d6bca4 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -105,6 +105,28 @@ static bool cpr_is_blocked(Error **errp, CprMode mode)
     return false;
 }
 
+static NotifierList cpr_notifiers[CPR_NOTIFY_NUM];
+
+void cpr_add_notifier(Notifier *notify,
+                      void (*cb)(Notifier *notifier, void *data),
+                      CprNotifyState state)
+{
+    assert(state >= 0 && state < CPR_NOTIFY_NUM);
+    notify->notify = cb;
+    notifier_list_add(&cpr_notifiers[state], notify);
+}
+
+void cpr_remove_notifier(Notifier *notify)
+{
+    notifier_remove(notify);
+    notify->notify = NULL;
+}
+
+static void cpr_call_notifiers(CprNotifyState state)
+{
+    notifier_list_notify(&cpr_notifiers[state], 0);
+}
+
 void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
 {
     int ret;
@@ -142,6 +164,7 @@ void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
     qemu_fclose(f);
     if (ret < 0) {
         error_setg(errp, "Error %d while saving VM state", ret);
+        cpr_call_notifiers(CPR_NOTIFY_SAVE_FAILED);
         goto err;
     }
 
@@ -182,6 +205,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
         return;
     }
 
+    cpr_call_notifiers(CPR_NOTIFY_EXEC);
     assert(qemu_system_exec_request(args, errp) == 0);
 }
 
@@ -218,6 +242,7 @@ void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
     qemu_fclose(f);
     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
+        cpr_call_notifiers(CPR_NOTIFY_LOAD_FAILED);
         goto out;
     }
 
diff --git a/stubs/cpr.c b/stubs/cpr.c
index 06a9a1c..9262e78 100644
--- a/stubs/cpr.c
+++ b/stubs/cpr.c
@@ -21,3 +21,13 @@ int cpr_add_blocker_str(const char *reason, Error **errp, CprMode mode, ...)
 void cpr_del_blocker(Error **reasonp)
 {
 }
+
+void cpr_add_notifier(Notifier *notify,
+                      void (*cb)(Notifier *notifier, void *data),
+                      CprNotifyState state)
+{
+}
+
+void cpr_remove_notifier(Notifier *notify)
+{
+}
-- 
1.8.3.1


