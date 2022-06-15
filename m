Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908A54CC22
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:04:40 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UZT-0003ij-NA
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOA-0006Hh-Kw
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO8-00010s-Jt
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:58 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE7fd5002108;
 Wed, 15 Jun 2022 14:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=w8JE+eHobR41mMBRVUuuslpIICZ/Us2u5XSkZV3wT04=;
 b=aGAEa7/9McvA1PjJ8uHLfKreVtC8J0OVMwpBFXZiadjgT6VpH1usZLIfHKxfvz05GBFD
 imF0nlIN5ATGJhroGp1pzap4oHAtJYqQCHCgQAzmYVWZ5uHeqlbB5qPfJ1tJWwIy2ocT
 ySkW2d19mjtrg5laUZZHO1q+oB2zAmBx90CynCzBtIDFDKZ/Iw7SP8jA7hPEYvWEfMVV
 KhgbSIEUEMNZZ1touN7WxfI7AUZVVEhrUAhe7jT8uXsrjQE83ysKH4EDWEcBLq1Usmp2
 iEunsp8NKUP6k+W5/xOMneEsGmO8VItEHb/ipW5cxT/V2wvnM4HPn5/5y+DiLWLoc/An Gw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrshj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7UQ023115; Wed, 15 Jun 2022 14:52:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:40 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSN1018501;
 Wed, 15 Jun 2022 14:52:39 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-10; Wed, 15 Jun 2022 14:52:39 +0000
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
Subject: [PATCH V8 09/39] cpr: register blockers
Date: Wed, 15 Jun 2022 07:51:56 -0700
Message-Id: <1655304746-102776-10-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: H47cEWaOiEjK015ZDWgSNozFfBbZgOi5
X-Proofpoint-GUID: H47cEWaOiEjK015ZDWgSNozFfBbZgOi5
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

Register the known cpr blockers.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 accel/xen/xen-all.c    | 3 +++
 backends/hostmem-epc.c | 6 ++++++
 migration/migration.c  | 6 ++++++
 replay/replay.c        | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d0..9dd0dc6 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -21,6 +21,7 @@
 #include "sysemu/runstate.h"
 #include "migration/misc.h"
 #include "migration/global_state.h"
+#include "migration/cpr.h"
 #include "hw/boards.h"
 
 //#define DEBUG_XEN
@@ -181,6 +182,8 @@ static int xen_init(MachineState *ms)
      * opt out of system RAM being allocated by generic code
      */
     mc->default_ram_id = NULL;
+
+    cpr_add_blocker_str("xen does not support cpr", &error_fatal, CPR_MODE_ALL);
     return 0;
 }
 
diff --git a/backends/hostmem-epc.c b/backends/hostmem-epc.c
index cb06255..094fed9 100644
--- a/backends/hostmem-epc.c
+++ b/backends/hostmem-epc.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "sysemu/hostmem.h"
 #include "hw/i386/hostmem-epc.h"
+#include "migration/cpr.h"
 
 static void
 sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
@@ -23,6 +24,7 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     uint32_t ram_flags;
     char *name;
     int fd;
+    Error *blocker = NULL;
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
@@ -41,6 +43,10 @@ sgx_epc_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size, ram_flags,
                                    fd, 0, errp);
+
+    error_setg(&blocker, "RAM_PROTECTED block %s does not support cpr", name);
+    cpr_add_blocker(&blocker, errp, CPR_MODE_ALL);
+
     g_free(name);
 }
 
diff --git a/migration/migration.c b/migration/migration.c
index 31739b2..1451bae 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -32,6 +32,7 @@
 #include "savevm.h"
 #include "qemu-file-channel.h"
 #include "qemu-file.h"
+#include "migration/cpr.h"
 #include "migration/vmstate.h"
 #include "block/block.h"
 #include "qapi/error.h"
@@ -1283,6 +1284,11 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
+        return cpr_add_blocker_str("x-colo is not compatible with cpr",
+                                   errp, CPR_MODE_ALL);
+    }
+
     return true;
 }
 
diff --git a/replay/replay.c b/replay/replay.c
index 4c396bb..eb5456f 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -19,6 +19,7 @@
 #include "qemu/option.h"
 #include "sysemu/cpus.h"
 #include "qemu/error-report.h"
+#include "migration/cpr.h"
 
 /* Current version of the replay mechanism.
    Increase it when file format changes. */
@@ -232,6 +233,9 @@ static void replay_enable(const char *fname, int mode)
     const char *fmode = NULL;
     assert(!replay_file);
 
+    cpr_add_blocker_str("replay is not compatible with cpr",
+                        &error_fatal, CPR_MODE_ALL);
+
     switch (mode) {
     case REPLAY_MODE_RECORD:
         fmode = "wb";
-- 
1.8.3.1


