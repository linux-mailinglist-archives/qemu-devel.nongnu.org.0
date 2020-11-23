Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2C2C0D90
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:34:25 +0100 (CET)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCvA-0003jg-Hc
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:34:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcQ-0003CG-Dc
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcL-0007pJ-IX
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWqQa01ursVNrq8bOiF5BaDNpOE9xVyrJ2UEuUCJvmE=;
 b=JYAImpGbmWxsEGUvtlmWizkZS3ax/DLnnE2BuRnsGkL8gRkPqeOlpBya39VyvLpydDA7pk
 +PDGqMU7VDohaMb7AUYo3/AaJ/M6FSri3z/ASIBKSTTa9npil4HFzCgNpcPduFytMoIkRE
 GCQBPPECIjjBzlLgGYRr83+A1z3JLzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-BwfpjoOANGm_A9QOldlVGg-1; Mon, 23 Nov 2020 09:14:53 -0500
X-MC-Unique: BwfpjoOANGm_A9QOldlVGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3D2D100C606
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2FE45D9E3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/36] vl: separate qemu_resolve_machine_memdev
Date: Mon, 23 Nov 2020 09:14:19 -0500
Message-Id: <20201123141435.2726558-21-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
resolving it.  We probably want to make the memdev property a
normal link, and handle "-M memdev" as a legacy option that is
special cased by machine_set_property.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 70 +++++++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 741a800114..6c8a103178 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2834,6 +2834,42 @@ static bool have_custom_ram_size(void)
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
@@ -4467,39 +4503,7 @@ void qemu_init(int argc, char **argv, char **envp)
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



