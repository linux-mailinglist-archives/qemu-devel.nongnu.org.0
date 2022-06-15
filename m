Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5080B54CBEE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:55:06 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UQD-0000mx-CY
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO7-00067t-7O
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:55 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO5-000103-0I
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:54 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE61k6001479;
 Wed, 15 Jun 2022 14:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=y1C0ovCma94MwaNzMH0fejgdXb17aj2Xl6bNkPSIkW4=;
 b=sAY8GsiLznSyKmZgFEXTbQZfo808YYjtDjxZmj5GAMzrSHGUVGSnyLH56Eqi6zwWZJYn
 Mc0ttGUjthdGIEcqmlDVFXnT++sCRS0tiTYHOCq+i4ii5j6OSonq2dg08Ux3GFblHT1i
 d/qISwi7+GEN003Pwy7K/IwEH7Fs73aTEAuwlRUHFusavSpxU9X+xKJEj/jMsmnqxBb6
 n7XfNbZ8lFh6bg3VhbMt1CiNVgfgjLTs3Kwz7zaVim14UW2PWQzv1ZWqImugVHV64Z/u
 LelypeAKTaZzbEBhGiRY7ulvDbRG2+d1GIK68nx29ObBhGlG37frbPok4KlT7qEatkiH 1g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ79i023087; Wed, 15 Jun 2022 14:52:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:38 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMx018501;
 Wed, 15 Jun 2022 14:52:38 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-9; Wed, 15 Jun 2022 14:52:38 +0000
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
Subject: [PATCH V8 08/39] cpr: blockers
Date: Wed, 15 Jun 2022 07:51:55 -0700
Message-Id: <1655304746-102776-9-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: dI8tkBbO_SkoO4XW6v7F4nD0nKO6ei5f
X-Proofpoint-ORIG-GUID: dI8tkBbO_SkoO4XW6v7F4nD0nKO6ei5f
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

Add an interface to register a blocker for cpr-save for one or more modes.
Devices and options that do not support a cpr mode can register a blocker,
and cpr-save will fail with a descriptive error message.  Conversely, if
such a device is deleted and un-registers its blocker, cpr will be allowed
again.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |  1 +
 include/migration/cpr.h |  6 ++++
 migration/cpr.c         | 79 +++++++++++++++++++++++++++++++++++++++++++++++++
 stubs/cpr.c             | 23 ++++++++++++++
 stubs/meson.build       |  1 +
 5 files changed, 110 insertions(+)
 create mode 100644 stubs/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9273891..1e4e72f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3159,6 +3159,7 @@ S: Maintained
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
+F: stubs/cpr.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index 1b6c82f..dfe5a1d 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -13,4 +13,10 @@
 void cpr_set_mode(CprMode mode);
 CprMode cpr_get_mode(void);
 
+#define CPR_MODE_ALL CPR_MODE__MAX
+
+int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...);
+int cpr_add_blocker_str(const char *reason, Error **errp, CprMode mode, ...);
+void cpr_del_blocker(Error **reasonp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 24b0bcc..c1da784 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -29,12 +29,91 @@ void cpr_set_mode(CprMode mode)
     cpr_mode = mode;
 }
 
+static GSList *cpr_blockers[CPR_MODE__MAX];
+
+/*
+ * Add blocker for each mode in varargs list, or for all modes if CPR_MODE_ALL
+ * is specified.  Caller terminates the list with 0 or CPR_MODE_ALL.  This
+ * function takes ownership of *reasonp, and frees it on error, or in
+ * cpr_del_blocker.  errp is set in a later patch.
+ */
+int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...)
+{
+    int modes = 0;
+    va_list ap;
+    ERRP_GUARD();
+
+    va_start(ap, mode);
+    while (mode != CPR_MODE_NONE && mode != CPR_MODE_ALL) {
+        assert(mode > CPR_MODE_NONE && mode < CPR_MODE__MAX);
+        modes |= BIT(mode);
+        mode = va_arg(ap, CprMode);
+    }
+    va_end(ap);
+    if (mode == CPR_MODE_ALL) {
+        modes = BIT(CPR_MODE__MAX) - 1;
+    }
+
+    for (mode = 0; mode < CPR_MODE__MAX; mode++) {
+        if (modes & BIT(mode)) {
+            cpr_blockers[mode] = g_slist_prepend(cpr_blockers[mode], *reasonp);
+        }
+    }
+    return 0;
+}
+
+/*
+ * Delete the blocker from all modes it is associated with.
+ */
+void cpr_del_blocker(Error **reasonp)
+{
+    CprMode mode;
+
+    if (*reasonp) {
+        for (mode = 0; mode < CPR_MODE__MAX; mode++) {
+            cpr_blockers[mode] = g_slist_remove(cpr_blockers[mode], *reasonp);
+        }
+        error_free(*reasonp);
+        *reasonp = NULL;
+    }
+}
+
+/*
+ * Add a blocker which will not be deleted.  Simpler for some callers.
+ */
+int cpr_add_blocker_str(const char *msg, Error **errp, CprMode mode, ...)
+{
+    int ret;
+    va_list ap;
+    Error *reason = NULL;
+
+    error_setg(&reason, "%s", msg);
+    va_start(ap, mode);
+    ret = cpr_add_blocker(&reason, errp, mode, ap);
+    va_end(ap);
+    return ret;
+}
+
+static bool cpr_is_blocked(Error **errp, CprMode mode)
+{
+    if (cpr_blockers[mode]) {
+        error_propagate(errp, error_copy(cpr_blockers[mode]->data));
+        return true;
+    }
+
+    return false;
+}
+
 void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
 {
     int ret;
     QEMUFile *f;
     int saved_vm_running = runstate_is_running();
 
+    if (cpr_is_blocked(errp, mode)) {
+        return;
+    }
+
     if (global_state_store()) {
         error_setg(errp, "Error saving global state");
         return;
diff --git a/stubs/cpr.c b/stubs/cpr.c
new file mode 100644
index 0000000..06a9a1c
--- /dev/null
+++ b/stubs/cpr.c
@@ -0,0 +1,23 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/cpr.h"
+
+int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...)
+{
+    return 0;
+}
+
+int cpr_add_blocker_str(const char *reason, Error **errp, CprMode mode, ...)
+{
+    return 0;
+}
+
+void cpr_del_blocker(Error **reasonp)
+{
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 6f80fec..0d7565b 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


