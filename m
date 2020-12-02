Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C42CB760
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:40:59 +0100 (CET)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNh4-0006ah-QJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND6-0003UP-24
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCS-0003m9-RG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/U8oPdfNwSP9F+WJEMspClr+vbZKWauTKvY6dhCzbvU=;
 b=IDf4UI/1IFDFP+Rj2DswJiu4gh+aItpzfVZm+Jt1/X14WFNYDWroIBxZkS391bh0YNSO+X
 +pRTzHtKlUp2cvFcZz7RDS9ETAqrPIpcg97vVJEyQX5rc3zTW6ZOlo0xsLkK0ylKFSwhsZ
 t3qZwhgF/Zu7hCOkPMGIRLQrciDJgYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-opxokyuuNzqr0Eq79adJrQ-1; Wed, 02 Dec 2020 03:09:17 -0500
X-MC-Unique: opxokyuuNzqr0Eq79adJrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A721074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FBAA5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 070/113] vl: separate qemu_resolve_machine_memdev
Date: Wed,  2 Dec 2020 03:08:06 -0500
Message-Id: <20201202080849.4125477-71-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a bit nasty: the machine is storing a string and later
resolving it.  We probably want to remove the memdev property
and instead make this a memory-set command.  "-M memdev" can be
handled a legacy option that is special cased by
machine_set_property.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 70 +++++++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index acf09b2040..891f959572 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2846,6 +2846,42 @@ static bool have_custom_ram_size(void)
     return !!qemu_opt_get_size(opts, "size", 0);
 }
 
+static void qemu_resolve_machine_memdev(void)
+{
+    if (current_machine->ram_memdev_id) {
+        Object *backend;
+        ram_addr_t backend_size;
+
+        backend = object_resolve_path_type(current_machine->ram_memdev_id,
+                                           TYPE_MEMORY_BACKEND, NULL);
+        if (!backend) {
+            error_report("Memory backend '%s' not found",
+                         current_machine->ram_memdev_id);
+            exit(EXIT_FAILURE);
+        }
+        backend_size = object_property_get_uint(backend, "size",  &error_abort);
+        if (have_custom_ram_size() && backend_size != ram_size) {
+                error_report("Size specified by -m option must match size of "
+                             "explicitly specified 'memory-backend' property");
+                exit(EXIT_FAILURE);
+        }
+        if (mem_path) {
+            error_report("'-mem-path' can't be used together with"
+                         "'-machine memory-backend'");
+            exit(EXIT_FAILURE);
+        }
+        ram_size = backend_size;
+    }
+
+    if (!xen_enabled()) {
+        /* On 32-bit hosts, QEMU is limited by virtual address space */
+        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
+            error_report("at most 2047 MB RAM can be simulated");
+            exit(1);
+        }
+    }
+}
+
 static void set_memory_options(MachineClass *mc)
 {
     uint64_t sz;
@@ -4474,39 +4510,7 @@ void qemu_init(int argc, char **argv, char **envp)
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
 
-    if (current_machine->ram_memdev_id) {
-        Object *backend;
-        ram_addr_t backend_size;
-
-        backend = object_resolve_path_type(current_machine->ram_memdev_id,
-                                           TYPE_MEMORY_BACKEND, NULL);
-        if (!backend) {
-            error_report("Memory backend '%s' not found",
-                         current_machine->ram_memdev_id);
-            exit(EXIT_FAILURE);
-        }
-        backend_size = object_property_get_uint(backend, "size",  &error_abort);
-        if (have_custom_ram_size() && backend_size != ram_size) {
-                error_report("Size specified by -m option must match size of "
-                             "explicitly specified 'memory-backend' property");
-                exit(EXIT_FAILURE);
-        }
-        if (mem_path) {
-            error_report("'-mem-path' can't be used together with"
-                         "'-machine memory-backend'");
-            exit(EXIT_FAILURE);
-        }
-        ram_size = backend_size;
-    }
-
-    if (!xen_enabled()) {
-        /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
-            error_report("at most 2047 MB RAM can be simulated");
-            exit(1);
-        }
-    }
-
+    qemu_resolve_machine_memdev();
     parse_numa_opts(current_machine);
 
     /* do monitor/qmp handling at preconfig state if requested */
-- 
2.26.2



