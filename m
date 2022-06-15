Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E554CC9D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:23:38 +0200 (CEST)
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Urp-0006Ch-Uw
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOn-0007mf-TO
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOl-00016R-3t
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0c2X001492;
 Wed, 15 Jun 2022 14:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=5kgwdTgYiH/ebPCufCeVFS5dIRPUl4P0QfsJgnWgqug=;
 b=ga+urvzmsuTxEofyRC/TLAmW9wNxX1dY/Bpz/mBGDfCTNPJYOX5zrlwZoaLcEZbaTUeh
 DiN+gg93H3f8nDsvlUGnWu8gtGS6tmNSSKYjW5/sUikPPO8TdANjRwW5HMco8MABFIYK
 DwHWQ1uSJK6f7MhD3PgdgQp3q8KgB+pcdZmmzSeBEqpjkHxeRYx1IHv0c58DDT0y/BSQ
 3vdfZjGBurM2QkXB7ZNFNvAWvPMBM1zkZY5bOlrCzcDN1Pmhl92EDgEVjKFkmpbsUun6
 hzoAgXVBgz7SGnmNHkEz0aEsvtU4vz3GMzmD/JBDqWj3Akx5twr1X7oRhJEBcRzbcnym cg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:14 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7tX023103; Wed, 15 Jun 2022 14:53:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:13 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNv018501;
 Wed, 15 Jun 2022 14:53:12 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-38; Wed, 15 Jun 2022 14:53:12 +0000
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
Subject: [PATCH V8 37/39] cpr: only-cpr-capable option
Date: Wed, 15 Jun 2022 07:52:24 -0700
Message-Id: <1655304746-102776-38-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: UJHZ0Tr58QblZt33fFHWtILUxi8glJ0W
X-Proofpoint-ORIG-GUID: UJHZ0Tr58QblZt33fFHWtILUxi8glJ0W
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
cpr-save will not fail due to a blocker.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/migration/cpr.h |  2 +-
 migration/cpr.c         | 13 +++++++++++--
 qemu-options.hx         |  8 ++++++++
 softmmu/vl.c            |  6 +++++-
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index ab5f53e..c7eb914 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -11,7 +11,7 @@
 #include "qapi/qapi-types-cpr.h"
 #include "qemu/notify.h"
 
-void cpr_init(int modes);
+void cpr_init(int modes, bool only_cpr_capable);
 void cpr_set_mode(CprMode mode);
 CprMode cpr_get_mode(void);
 bool cpr_enabled(CprMode mode);
diff --git a/migration/cpr.c b/migration/cpr.c
index 9d6bca4..7f507f1 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -18,9 +18,11 @@
 #include "sysemu/sysemu.h"
 
 static int cpr_enabled_modes;
+static bool only_cpr_capable;
 
-void cpr_init(int modes)
+void cpr_init(int modes, bool only_cpr)
 {
+    only_cpr_capable = only_cpr;
     cpr_enabled_modes = modes;
     cpr_state_load(&error_fatal);
 }
@@ -36,7 +38,7 @@ static GSList *cpr_blockers[CPR_MODE__MAX];
  * Add blocker for each mode in varargs list, or for all modes if CPR_MODE_ALL
  * is specified.  Caller terminates the list with 0 or CPR_MODE_ALL.  This
  * function takes ownership of *reasonp, and frees it on error, or in
- * cpr_del_blocker.  errp is set in a later patch.
+ * cpr_del_blocker.
  */
 int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...)
 {
@@ -55,6 +57,13 @@ int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...)
         modes = BIT(CPR_MODE__MAX) - 1;
     }
 
+    if (only_cpr_capable && (cpr_enabled_modes & modes)) {
+        error_propagate_prepend(errp, *reasonp,
+                                "-only-cpr-capable specified, but: ");
+        *reasonp = NULL;
+        return -EACCES;
+    }
+
     for (mode = 0; mode < CPR_MODE__MAX; mode++) {
         if (modes & BIT(mode)) {
             cpr_blockers[mode] = g_slist_prepend(cpr_blockers[mode], *reasonp);
diff --git a/qemu-options.hx b/qemu-options.hx
index 2f4bb2b..25e392f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4511,6 +4511,14 @@ SRST
     commands.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cpr-save will not
+    fail due to a cpr blocker.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3e19c74..1bee692 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2604,6 +2604,7 @@ void qemu_init(int argc, char **argv, char **envp)
     bool userconfig = true;
     FILE *vmstate_dump_file = NULL;
     int cpr_modes = 0;
+    bool only_cpr_capable = false;
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -3321,6 +3322,9 @@ void qemu_init(int argc, char **argv, char **envp)
                 cpr_modes |= BIT(qapi_enum_parse(&CprMode_lookup, optarg, -1,
                                                  &error_fatal));
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
@@ -3472,7 +3476,7 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_validate_options(machine_opts_dict);
     qemu_process_sugar_options();
 
-    cpr_init(cpr_modes);
+    cpr_init(cpr_modes, only_cpr_capable);
 
     /*
      * These options affect everything else and should be processed
-- 
1.8.3.1


