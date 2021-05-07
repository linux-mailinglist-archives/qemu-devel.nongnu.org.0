Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2E376536
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:33:00 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezf7-0002PX-9a
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbO-0000U5-W9
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:07 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbJ-0001RN-Um
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:06 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CShOF050065;
 Fri, 7 May 2021 12:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=p16l0WPBMG4jZxEyxo+4hfuLsJ7gQEWt4ArQ0Bp4BeU=;
 b=LeaXzw3VIIT8ohCXBMT34YCSN0CwmSJonObGx4kE9kiTr0IZcKTybJwsay3weP1B4gNh
 8q3I//iLsU7Ex6toyjnweRwxQ5yBrDAFA5Ro0wEzlpYJD8ks5596JmZ242glSyqnRWZq
 7i7JilpDxuR7DxrXvHsqYZ5tuPabFlA4UxE2CwuZ/RNNqvvv7ZwgNq+slHyse5c43C72
 fWrv6Oqt3GtSGbv/WHvqmVu+EpjPNF8jcNVPQEUAQ4Z/Ef9t1P5e2l94+v85v0izOG8Q
 9yTioolTgKsLK/8Kf4WUhCf9CUzyDlGjntxnTzRMp0GgjIk6KQR3v2R5KC56SSNusR1a Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38csqvhemb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CGPPi173683;
 Fri, 7 May 2021 12:28:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38csrtb63s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:56 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CStBV027798;
 Fri, 7 May 2021 12:28:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 38csrtb638-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:28:55 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 147CSr3a016393;
 Fri, 7 May 2021 12:28:53 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:53 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 05/22] machine: memfd-alloc option
Date: Fri,  7 May 2021 05:25:03 -0700
Message-Id: <1620390320-301716-6-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: UByTe6NBJB6nqW4hLIXRGw49e6vWpgIB
X-Proofpoint-GUID: UByTe6NBJB6nqW4hLIXRGw49e6vWpgIB
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070086
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=steven.sistare@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

Allocate anonymous memory using memfd_create if the memfd-alloc machine
option is set.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/core/machine.c   | 19 +++++++++++++++++++
 include/hw/boards.h |  1 +
 qemu-options.hx     |  5 +++++
 softmmu/physmem.c   | 41 ++++++++++++++++++++++++++++++++---------
 trace-events        |  1 +
 util/qemu-config.c  |  4 ++++
 6 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78..3ce5303 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -375,6 +375,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
     ms->mem_merge = value;
 }
 
+static bool machine_get_memfd_alloc(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return ms->memfd_alloc;
+}
+
+static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    ms->memfd_alloc = value;
+}
+
 static bool machine_get_usb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -858,6 +872,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "mem-merge",
         "Enable/disable memory merge support");
 
+    object_class_property_add_bool(oc, "memfd-alloc",
+        machine_get_memfd_alloc, machine_set_memfd_alloc);
+    object_class_property_set_description(oc, "memfd-alloc",
+        "Enable/disable allocating anonymous memory using memfd_create");
+
     object_class_property_add_bool(oc, "usb",
         machine_get_usb, machine_set_usb);
     object_class_property_set_description(oc, "usb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ad6c8fd..dceb7f7 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -305,6 +305,7 @@ struct MachineState {
     char *dt_compatible;
     bool dump_guest_core;
     bool mem_merge;
+    bool memfd_alloc;
     bool usb;
     bool usb_disabled;
     char *firmware;
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002..3392ac0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
     "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
     "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
     "                mem-merge=on|off controls memory merge support (default: on)\n"
+    "                memfd-alloc=on|off controls allocating anonymous memory using memfd_create (default: off)\n"
     "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
     "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
     "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
@@ -76,6 +77,10 @@ SRST
         supported by the host, de-duplicates identical memory pages
         among VMs instances (enabled by default).
 
+    ``memfd-alloc=on|off``
+        Enables or disables allocation of anonymous memory using memfd_create.
+        (disabled by default).
+
     ``aes-key-wrap=on|off``
         Enables or disables AES key wrapping support on s390-ccw hosts.
         This feature controls whether AES wrapping keys will be created
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9..695aa10 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -67,6 +67,7 @@
 
 #include "qemu/pmem.h"
 
+#include "qemu/memfd.h"
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -1931,35 +1932,57 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
 {
     RAMBlock *block;
     RAMBlock *last_block = NULL;
+    struct MemoryRegion *mr = new_block->mr;
     ram_addr_t old_ram_size, new_ram_size;
     Error *err = NULL;
+    const char *name;
+    void *addr = 0;
+    size_t maxlen;
+    MachineState *ms = MACHINE(qdev_get_machine());
 
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
-            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
-                                                  &new_block->mr->align,
-                                                  shared);
-            if (!new_block->host) {
+            name = memory_region_name(new_block->mr);
+            if (ms->memfd_alloc) {
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
+                addr = file_ram_alloc(new_block, maxlen, mfd,
+                                      false, false, 0, errp);
+                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
+            } else {
+                addr = qemu_anon_ram_alloc(maxlen, &mr->align, shared);
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
 
diff --git a/trace-events b/trace-events
index ac7cef9..99e8208 100644
--- a/trace-events
+++ b/trace-events
@@ -40,6 +40,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
 # accel/tcg/cputlb.c
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
+anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
 
 # gdbstub.c
 gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 670bd6e..135ec3b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -205,6 +205,10 @@ static QemuOptsList machine_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "enable/disable memory merge support",
         },{
+            .name = "memfd-alloc",
+            .type = QEMU_OPT_BOOL,
+            .help = "enable/disable memfd_create for anonymous memory",
+        },{
             .name = "usb",
             .type = QEMU_OPT_BOOL,
             .help = "Set on/off to enable/disable usb",
-- 
1.8.3.1


