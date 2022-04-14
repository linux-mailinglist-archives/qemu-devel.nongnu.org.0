Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58350193A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 18:56:05 +0200 (CEST)
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf2lI-0005Q8-8g
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 12:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iR-0002gy-Bh
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nf2iO-00047y-Ao
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 12:53:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649955183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQwmV/TfBYT5mdt44r5U9ydRvFnQPZeudFAcWiyKzeU=;
 b=PM4x8MWPNBgv/rBCWniL++F6HONGt96ZSpYc7PiiQjPwHt4WIoYYeuS+kcg1XJK4GwM8m7
 DC4RLcTGg9R8RMkP78Np+4vFejUTZSpOhVYp+ARBmvQFeI2AY+oNxmWPLyBoStJLrtf77O
 eo2rfRArZF1hCUL+6BeeLrm0WxOS4As=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-I4NiztE9MfahOm8OApOWTA-1; Thu, 14 Apr 2022 12:53:02 -0400
X-MC-Unique: I4NiztE9MfahOm8OApOWTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B38A1C05AE2
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18E0F14583C3
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 16:53:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 5/5] machine: move more memory validation to Machine
 object
Date: Thu, 14 Apr 2022 12:53:00 -0400
Message-Id: <20220414165300.555321-6-pbonzini@redhat.com>
In-Reply-To: <20220414165300.555321-1-pbonzini@redhat.com>
References: <20220414165300.555321-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This allows setting memory properties without going through
vl.c, and have them validated just the same.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 21 +++++++++++++++++++--
 softmmu/vl.c      | 17 +++--------------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 3dca927e3f..4f537c10c7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -21,12 +21,14 @@
 #include "qapi/qapi-visit-common.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/visitor.h"
+#include "qom/object_interfaces.h"
 #include "hw/sysbus.h"
 #include "sysemu/cpus.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/numa.h"
+#include "sysemu/xen.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "hw/pci/pci.h"
@@ -1283,8 +1285,23 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
        clock values from the log. */
     replay_checkpoint(CHECKPOINT_INIT);
 
-    if (machine_class->default_ram_id && machine->ram_size &&
-        numa_uses_legacy_mem() && !machine->memdev) {
+    if (!xen_enabled()) {
+        /* On 32-bit hosts, QEMU is limited by virtual address space */
+        if (machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
+            error_setg(errp, "at most 2047 MB RAM can be simulated");
+            return;
+        }
+    }
+
+    if (machine->memdev) {
+        ram_addr_t backend_size = object_property_get_uint(OBJECT(machine->memdev),
+                                                           "size",  &error_abort);
+        if (backend_size != machine->ram_size) {
+            error_setg(errp, "Machine memory size does not match the size of the memory backend");
+            return;
+        }
+    } else if (machine_class->default_ram_id && machine->ram_size &&
+               numa_uses_legacy_mem()) {
         if (!create_default_memdev(current_machine, mem_path, errp)) {
             return;
         }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 03494760d5..a9913f0ae1 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2021,24 +2021,13 @@ static void qemu_resolve_machine_memdev(void)
             error_report("Memory backend '%s' not found", ram_memdev_id);
             exit(EXIT_FAILURE);
         }
-        backend_size = object_property_get_uint(backend, "size",  &error_abort);
-        if (have_custom_ram_size && backend_size != current_machine->ram_size) {
-            error_report("Size specified by -m option must match size of "
-                         "explicitly specified 'memory-backend' property");
-            exit(EXIT_FAILURE);
+        if (!have_custom_ram_size) {
+            backend_size = object_property_get_uint(backend, "size",  &error_abort);
+            current_machine->ram_size = backend_size;
         }
-        current_machine->ram_size = backend_size;
         object_property_set_link(OBJECT(current_machine),
                                  "memory-backend", backend, &error_fatal);
     }
-
-    if (!xen_enabled()) {
-        /* On 32-bit hosts, QEMU is limited by virtual address space */
-        if (current_machine->ram_size > (2047 << 20) && HOST_LONG_BITS == 32) {
-            error_report("at most 2047 MB RAM can be simulated");
-            exit(1);
-        }
-    }
 }
 
 static void parse_memory_options(const char *arg)
-- 
2.31.1


