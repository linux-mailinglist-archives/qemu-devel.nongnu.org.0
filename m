Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4A2EAFCF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:13:39 +0100 (CET)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwoxm-0001gY-3b
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwota-0003xx-1a
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:18 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotU-0003ks-JS
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:17 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FsjAk094281;
 Tue, 5 Jan 2021 16:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Tchlr/yGXCbGHOA+euyPR32rk13K6FiUp7evu94/f0g=;
 b=jqCWobwFV4ZpmRSr/2Wti/4zwQ0t56DnJJWNrWS3cNwImLSjmoa4nvha2IlgHjYMpz2v
 8ZmGRZB22xD3xqpk/HHawQj5AhpgMKdn1/C01c14cttAIUBZcmCjKSp6SAy+mQiHmrOX
 tisa77epsMySbsktuglmE0CP5u4r+jFsNGVi6iEPBCkYRCdQOXmsGTB0yodQfmBYK8Oa
 dlNaINpyoM9CUfQdoLI5HKhfj+P4HoNSWMWLg00gcLTECgU+nGKjHnCPDZoj2njkS4G0
 H/wDINWq8Iex+VpnogQjKhgx9MBHjKdkC9PCg+9RmJ7DFDgcfSZpJWfoG/kXLAD8WYJ7 Og== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35tebasjv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtKwh175783;
 Tue, 5 Jan 2021 16:09:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 35vct61vm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:05 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 105G94Jq003328;
 Tue, 5 Jan 2021 16:09:04 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:04 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 05/22] vl: memfd-alloc option
Date: Tue,  5 Jan 2021 07:41:53 -0800
Message-Id: <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=steven.sistare@oracle.com; helo=aserp2130.oracle.com
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

Allocate anonymous memory using memfd_create if the memfd-alloc option is
set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 exec.c                  | 38 ++++++++++++++++++++++++++++++--------
 include/sysemu/sysemu.h |  1 +
 qemu-options.hx         | 11 +++++++++++
 softmmu/vl.c            |  4 ++++
 trace-events            |  1 +
 5 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/exec.c b/exec.c
index d1f31b4..6da6590 100644
--- a/exec.c
+++ b/exec.c
@@ -67,6 +67,7 @@
 #include "exec/log.h"
 
 #include "qemu/pmem.h"
+#include "qemu/memfd.h"
 
 #include "migration/vmstate.h"
 
@@ -2231,34 +2232,55 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 {
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
 
     old_ram_size = last_ram_page();
 
     qemu_mutex_lock_ramlist();
-    new_block->offset = find_ram_offset(new_block->max_length);
+    maxlen = new_block->max_length;
+    new_block->offset = find_ram_offset(maxlen);
 
     if (!new_block->host) {
         if (xen_enabled()) {
-            xen_ram_alloc(new_block->offset, new_block->max_length,
-                          new_block->mr, &err);
+            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
             if (err) {
                 error_propagate(errp, err);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
         } else {
-            new_block->host = phys_mem_alloc(new_block->max_length,
-                                             &new_block->mr->align, shared);
-            if (!new_block->host) {
+            name = memory_region_name(new_block->mr);
+            if (memfd_alloc) {
+                int mfd = -1;          /* placeholder until next patch */
+                mr->align = QEMU_VMALLOC_ALIGN;
+                if (mfd < 0) {
+                    mfd = qemu_memfd_create(name, maxlen + mr->align,
+                                            0, 0, 0, &err);
+                    if (mfd < 0) {
+                        return;
+                    }
+                }
+                new_block->flags |= RAM_SHARED;
+                addr = file_ram_alloc(new_block, maxlen, mfd, false, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = phys_mem_alloc(maxlen, &mr->align, shared);
+            }
+
+            if (!addr) {
                 error_setg_errno(errp, errno,
                                  "cannot set up guest memory '%s'",
-                                 memory_region_name(new_block->mr));
+                                 name);
                 qemu_mutex_unlock_ramlist();
                 return;
             }
-            memory_try_enable_merging(new_block->host, new_block->max_length);
+            memory_try_enable_merging(addr, maxlen);
+            new_block->host = addr;
         }
     }
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 4b6a5c4..408eb56 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -13,6 +13,7 @@ extern int only_migratable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
+extern bool memfd_alloc;
 
 void qemu_add_data_dir(const char *path);
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 708583b..455b43b7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4094,6 +4094,17 @@ SRST
     an unmigratable state.
 ERST
 
+#ifdef __linux__
+DEF("memfd-alloc", 0,  QEMU_OPTION_memfd_alloc, \
+    "-memfd-alloc         allocate anonymous memory using memfd_create\n",
+    QEMU_ARCH_ALL)
+#endif
+
+SRST
+``-memfd-alloc``
+    Allocate anonymous memory using memfd_create (Linux only).
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4eb9d1f..5668e2b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -164,6 +164,7 @@ bool boot_strict;
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
 bool wakeup_suspend_enabled;
+bool memfd_alloc;
 
 int icount_align_option;
 
@@ -3635,6 +3636,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_memfd_alloc:
+                memfd_alloc = true;
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
diff --git a/trace-events b/trace-events
index 42107eb..ed46c4d 100644
--- a/trace-events
+++ b/trace-events
@@ -54,6 +54,7 @@ find_ram_offset_loop(uint64_t size, uint64_t candidate, uint64_t offset, uint64_
 ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_madvise, bool need_fallocate, int ret) "%s@%p + 0x%zx: madvise: %d fallocate: %d ret: %d"
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # memory.c
 memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
-- 
1.8.3.1


