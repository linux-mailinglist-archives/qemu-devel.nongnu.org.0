Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3FB233614
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 17:54:51 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1AtO-0004fV-2Y
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 11:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfP-0001SK-D3
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:23 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:48040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1k1AfH-0002VO-Rj
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 11:40:23 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFXjA1152650;
 Thu, 30 Jul 2020 15:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=micmSlORAvpi9yB3dc5wSQuxzyCBVgja6SS0xcqR81Y=;
 b=fVDW8D3NpBMq4/wzeoNpQ+NCTkZMkzsIs3oZ4PdsOoqqZ4/NaHt09iGxxqf5eNCHiGgf
 4Acypv1qVUOEk1zWJeu46GgBHxMeWOD++EZz1IaedzaQhCDwhPfemElpRAzNzDoFS3zE
 4AwgWj+nZpwFoC/0NvhS5We9JuU+RrjTR3zDrhXpuPc6fOBBdSS6OCHl3egFzrs3ai6a
 p4frav4DeCDKGmtHtyPxDrcy2U09ThmYnlwe+v8pFViKt3NK98pCplTArsvmOQffxKDQ
 qzJGfcr1HpV4OuTN39/4JzLrA9YXz8dBYDexKcA7rZm4irJjzv5YmhmJMPMWrq+BAavP /A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 32hu1jvecx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 15:40:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06UFWp4K188370;
 Thu, 30 Jul 2020 15:38:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 32hu5xja3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 15:38:11 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06UFcA0c001907;
 Thu, 30 Jul 2020 15:38:10 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Jul 2020 08:38:10 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V1 21/32] exec, memory: exec(3) to restart
Date: Thu, 30 Jul 2020 08:14:25 -0700
Message-Id: <1596122076-341293-22-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9698
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=3 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300111
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=steven.sistare@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 11:38:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
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

Use exec() to restart qemu to a potentially new version, while preserving
guest RAM.  The guest pauses briefly.

cprsave saves the address and length of RAM blocks to the environment via
setenv, tags the RAM with the new madvise(MADV_DOEXEC) option to preserve
it across exec, then exec()'s the (typically updated) qemu binary with the
original argv.

On qemu restart, ram_block_add() finds the env vars that describe preserved
RAM segments and does not reallocate them.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 exec.c                | 36 ++++++++++++++++++++++++++++++++++--
 include/exec/memory.h |  2 ++
 migration/savevm.c    | 16 ++++++++++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 359e437..5473c09 100644
--- a/exec.c
+++ b/exec.c
@@ -2235,7 +2235,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
     Error *err = NULL;
     const char *name;
     void *addr;
-    size_t maxlen;
+    size_t len, maxlen;
 
     old_ram_size = last_ram_page();
 
@@ -2253,7 +2253,12 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
             }
         } else {
             name = memory_region_name(new_block->mr);
-            addr = phys_mem_alloc(maxlen, &new_block->mr->align, shared);
+            if (getenv_ram(name, &addr, &len)) {
+                assert(len == maxlen);
+            } else {
+                addr = phys_mem_alloc(maxlen, &new_block->mr->align, shared);
+                setenv_ram(name, addr, maxlen);
+            }
 
             if (!addr) {
                 error_setg_errno(errp, errno,
@@ -2499,6 +2504,8 @@ void qemu_ram_free(RAMBlock *block)
         return;
     }
 
+    unsetenv_ram(memory_region_name(block->mr));
+
     if (block->host) {
         ram_block_notify_remove(block->host, block->max_length);
     }
@@ -2763,6 +2770,31 @@ bool qemu_ram_volatile(Error **errp)
     return ret;
 }
 
+static int preserve_ram(const char *name, const char *val, void *handle)
+{
+    void *addr;
+    size_t len;
+    Error **errp = handle;
+
+    getenv_ram(name, &addr, &len);
+    if (qemu_madvise(addr, len, QEMU_MADV_DOEXEC)) {
+        error_setg_errno(errp, errno,
+                         "MADV_DOEXEC failed on memory region %s", name);
+        return 1;
+    }
+    return 0;
+}
+
+
+int qemu_preserve_ram(Error **errp)
+{
+    int ret;
+    qemu_mutex_lock_ramlist();
+    ret = walkenv(ADDR_PREFIX, preserve_ram, errp);
+    qemu_mutex_unlock_ramlist();
+    return ret;
+}
+
 /* Generate a debug exception if a watchpoint has been hit.  */
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6aafbb0..e2d297d 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2521,6 +2521,8 @@ bool ram_block_discard_is_required(void);
 
 bool qemu_ram_volatile(Error **errp);
 
+int qemu_preserve_ram(Error **errp);
+
 #endif
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 38cc63a..2902006 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2719,6 +2719,16 @@ void save_cpr_snapshot(const char *file, const char *mode, Error **errp)
         return;
     }
 
+    if (op == VMS_RESTART && QEMU_MADV_DOEXEC == QEMU_MADV_INVALID) {
+        error_setg(errp, "kernel does not support MADV_DOEXEC.");
+        return;
+    }
+
+    if (op == VMS_RESTART && xen_enabled()) {
+        error_setg(errp, "xen does not support cprsave restart");
+        return;
+    }
+
     f = qf_file_open(file, O_CREAT | O_WRONLY | O_TRUNC, 0600, errp);
     if (!f) {
         return;
@@ -2747,6 +2757,12 @@ void save_cpr_snapshot(const char *file, const char *mode, Error **errp)
     if (op == VMS_REBOOT) {
         no_shutdown = 0;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    } else if (op == VMS_RESTART) {
+        if (qemu_preserve_ram(errp)) {
+            return;
+        }
+        qemu_system_exec_request();
+        putenv((char *)"QEMU_START_FREEZE=");
     }
 }
 
-- 
1.8.3.1


