Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD032EB000
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:26:55 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpAc-0000Ad-Qc
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwoth-000477-4b
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:25 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotf-00047W-6o
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:24 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtOEC137967;
 Tue, 5 Jan 2021 16:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=G8k+eHKdyI5GaXBMdj0wHAeul0Z1shjYcGXRDnexjoU=;
 b=Zgn/g5Yy2vHCJKfJkATnbpHGmPYOSJ34JkEp7jZDTqIOZ11k7MynzZrp2QXMiq4Ovw7d
 UgYvL+gaa2do9VUOQ4viJf9criijZRDAheiUkOLQpdaQq8qLVM3fboxzs2cWgAbStWnv
 7yboinhqL+A8SfEuaSSbIPVD/Goq+VvjMQwu2+eaQ4lLH4noaItmzUUO3SReaOoTa5kp
 AEBzwRvJPxxiWClUnzpXlEgu02j+0Ujog/KSpVwam6RvcvXDULCPpNm2cFlm7qPVjPos
 mSh86bw02DnH5ApbsdZGcDy5ZQY7SnNgJGeLCBDxAz4PUZ5bz3uLvlA0DMGcLPWb3C2V Zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35tg8r1h0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FuNBs029086;
 Tue, 5 Jan 2021 16:09:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35uxnsvb9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:18 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G9GiE003546;
 Tue, 5 Jan 2021 16:09:16 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:16 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 20/22] cpr: only-cpr-capable option
Date: Tue,  5 Jan 2021 07:42:08 -0800
Message-Id: <1609861330-129855-21-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the only-cpr-capable option, which causes qemu to exit with an error
if any devices that are not capable of cpr are added.  This guarantees that
a cprsave operation will not fail with an unsupported device error.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-socket.c   |  1 +
 exec.c                  |  3 +++
 include/sysemu/sysemu.h |  1 +
 migration/migration.c   |  6 ++++++
 qemu-options.hx         |  8 ++++++++
 softmmu/vl.c            | 13 +++++++++++++
 6 files changed, 32 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 0965305..580d731 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -36,6 +36,7 @@
 #include "qapi/qapi-visit-sockets.h"
 
 #include "chardev/char-io.h"
+#include "sysemu/sysemu.h"
 #include "qemu/env.h"
 
 /***********************************************************/
diff --git a/exec.c b/exec.c
index 6a6e43d..01732f5 100644
--- a/exec.c
+++ b/exec.c
@@ -2271,6 +2271,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
                 new_block->flags |= RAM_SHARED;
                 addr = file_ram_alloc(new_block, maxlen, mfd, false, errp);
                 trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else if (only_cpr_capable) {
+                error_report("only-cpr-capable requires memfd-alloc");
+                errno = 0;
             } else {
                 addr = phys_mem_alloc(maxlen, &mr->align, shared);
             }
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index f0017d4..a72e7da 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -14,6 +14,7 @@ extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
 extern bool memfd_alloc;
+extern bool only_cpr_capable;
 extern int start_on_wake;
 
 void qemu_add_data_dir(const char *path);
diff --git a/migration/migration.c b/migration/migration.c
index 8fe3633..5459a2a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1099,6 +1099,12 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_X_COLO] && only_cpr_capable) {
+        error_setg(errp, "x-colo is not compatible with -only-cpr-capable");
+        return false;
+    }
+
+
     return true;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 1ab5af5..ff8464f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4116,6 +4116,14 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("only-cpr-capable", 0, QEMU_OPTION_only_cpr_capable, \
+    "-only-cpr-capable    allow only cpr capable devices\n", QEMU_ARCH_ALL)
+SRST
+``-only-cpr-capable``
+    Only allow cpr capable devices, which guarantees that cprsave will not fail
+    with an unsupported device error.
+ERST
+
 #ifdef __linux__
 DEF("memfd-alloc", 0,  QEMU_OPTION_memfd_alloc, \
     "-memfd-alloc         allocate anonymous memory using memfd_create\n",
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9f2be5c..e101056 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -164,6 +164,7 @@ bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 bool wakeup_suspend_enabled;
+bool only_cpr_capable;
 bool memfd_alloc;
 int start_on_wake;
 static char **argv_main;
@@ -3679,6 +3680,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_only_cpr_capable:
+                only_cpr_capable = true;
+                break;
             case QEMU_OPTION_memfd_alloc:
                 memfd_alloc = true;
                 break;
@@ -4433,6 +4437,15 @@ void qemu_init(int argc, char **argv, char **envp)
 
     cpu_synchronize_all_post_init();
 
+    if (only_cpr_capable && replay_mode != REPLAY_MODE_NONE) {
+        error_report("replay is not compatible with -only-cpr-capable");
+        exit(1);
+    }
+    if (only_cpr_capable && !qemu_chr_cpr_capable(&err)) {
+        error_report_err(err);
+        exit(1);
+    }
+
     rom_reset_order_override();
 
     /* Did we create any drives that we failed to create a device for? */
-- 
1.8.3.1


