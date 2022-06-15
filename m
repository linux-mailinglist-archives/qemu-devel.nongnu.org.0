Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24F54CC35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:09:10 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Udm-0004LH-Dz
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOW-0007Dd-HZ
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOU-000137-L1
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:20 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0c2J001492;
 Wed, 15 Jun 2022 14:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=MmGDNuzn/lafDdcgChrTVv7tX1ybusyPVai0h9kiOHs=;
 b=nCCIiMZyzbJsZMaXUvpkV1Md3UQsV4jENS6q8MUOmVcgN9Bs+uzdkh7Ctnb8DuFv2XOZ
 52IMDsAwhSFGx1nwCFS4u1TToMJ7/jlan0ac4yXKiiCDjnRtq2V5pckbgpZzOdumYiuQ
 akBh0KvAoG2kBVwPBljFTQqQdPIJ7KjmktCaSQbQgp0OOLuJORweBcRXV2SGLcx76fkT
 K0+8zUmIdPzT8ZsTcL6aHBfXEAA66ndaaq2QAuZOC5kLbuLVC87adtolk7NkhoZzgNaa
 c2MqaUZgrYlI0PNDoYl1Osti58oWN2pt1DtvPCXUEacMniCVkMxbQ7Vlc970HQC9ekP+ qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7CD023114; Wed, 15 Jun 2022 14:52:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:56 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNT018501;
 Wed, 15 Jun 2022 14:52:55 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-24; Wed, 15 Jun 2022 14:52:55 +0000
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
Subject: [PATCH V8 23/39] hostmem-memfd: cpr for memory-backend-memfd
Date: Wed, 15 Jun 2022 07:52:10 -0700
Message-Id: <1655304746-102776-24-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: EeSY2QL8Ud6SpNlmGFASwxRR7RZmnE-R
X-Proofpoint-ORIG-GUID: EeSY2QL8Ud6SpNlmGFASwxRR7RZmnE-R
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

Preserve memory-backend-memfd memory objects during cpr.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-memfd.c | 21 ++++++++++++---------
 hmp-commands.hx          |  2 +-
 qapi/cpr.json            |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index c9d8001..2aeb5d1 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -14,6 +14,7 @@
 #include "sysemu/hostmem.h"
 #include "qom/object_interfaces.h"
 #include "qemu/memfd.h"
+#include "migration/cpr.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "qom/object.h"
@@ -36,23 +37,25 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
     uint32_t ram_flags;
-    char *name;
-    int fd;
+    char *name = host_memory_backend_get_name(backend);
+    int fd = cpr_find_fd(name, 0);
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
         return;
     }
 
-    fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
-                           m->hugetlb, m->hugetlbsize, m->seal ?
-                           F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
-                           errp);
-    if (fd == -1) {
-        return;
+    if (fd < 0) {
+        fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
+                               m->hugetlb, m->hugetlbsize, m->seal ?
+                               F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
+                               errp);
+        if (fd == -1) {
+            return;
+        }
+        cpr_save_fd(name, 0, fd);
     }
 
-    name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     ram_flags |= RAM_ANON;
diff --git a/hmp-commands.hx b/hmp-commands.hx
index da5dd60..540f9be 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -380,7 +380,7 @@ SRST
 
   If *mode* is 'restart', the checkpoint remains valid after restarting
   qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
-  memory-backend-file with share=on.
+  memory-backend-memfd or memory-backend-file object with share=on.
   To resume from the checkpoint, issue the cpr-load command.
 ERST
 
diff --git a/qapi/cpr.json b/qapi/cpr.json
index 47ee4ff..1ec5aae 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -41,7 +41,7 @@
 #
 # If @mode is 'restart', the checkpoint remains valid after restarting
 # qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
-# memory-backend-file with share=on.
+# memory-backend-memfd or memory-backend-file object with share=on.
 # To resume from the checkpoint, issue the cpr-load command.
 #
 # @filename: name of checkpoint file
-- 
1.8.3.1


