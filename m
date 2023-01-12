Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D41A667BA9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0ga-0004CD-No; Thu, 12 Jan 2023 11:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gW-0004Bp-F0
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gU-0000d5-R6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZlzWe9tPcq9k0dBwflFDgLiMtDnZGZ0Ab2cce46ADqY=;
 b=e9Sf3xW6cczYVFhiDfbemD40tTa+EhruJyS9jLpanGVgK3V5CI3BPoMyrMYnd4VQhx9wf6
 m2QQ8gs8pXriRpsqnB92j3BPRk7Z0owxcemNDmm6NcPpXr8BlW7qJv5ApcO8c6rOMJCZPB
 s4mcoo5yLE2dvalaIWCYnS3xvBH+5eY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-d1gNbktON2CBHtWWH4JYgQ-1; Thu, 12 Jan 2023 11:44:08 -0500
X-MC-Unique: d1gNbktON2CBHtWWH4JYgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77BFD100F905
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:08 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36224078903;
 Thu, 12 Jan 2023 16:44:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 1/8] migration/savevm: Move more savevm handling into
 vmstate_save()
Date: Thu, 12 Jan 2023 17:43:56 +0100
Message-Id: <20230112164403.105085-2-david@redhat.com>
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Let's move more code into vmstate_save(), reducing code duplication and
preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
have to move vmstate_save() to make the compiler happy.

We'll now also trace from qemu_save_device_state().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/savevm.c | 79 ++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..d8830297e4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -897,17 +897,6 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
     }
 }
 
-static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
-                        JSONWriter *vmdesc)
-{
-    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
-    if (!se->vmsd) {
-        vmstate_save_old_style(f, se, vmdesc);
-        return 0;
-    }
-    return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
-}
-
 /*
  * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
  */
@@ -941,6 +930,43 @@ static void save_section_footer(QEMUFile *f, SaveStateEntry *se)
     }
 }
 
+static int vmstate_save(QEMUFile *f, SaveStateEntry *se, JSONWriter *vmdesc)
+{
+    int ret;
+
+    if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
+        return 0;
+    }
+    if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
+        trace_savevm_section_skip(se->idstr, se->section_id);
+        return 0;
+    }
+
+    trace_savevm_section_start(se->idstr, se->section_id);
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+    if (vmdesc) {
+        json_writer_start_object(vmdesc, NULL);
+        json_writer_str(vmdesc, "name", se->idstr);
+        json_writer_int64(vmdesc, "instance_id", se->instance_id);
+    }
+
+    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
+    if (!se->vmsd) {
+        vmstate_save_old_style(f, se, vmdesc);
+    } else {
+        ret = vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    trace_savevm_section_end(se->idstr, se->section_id, 0);
+    save_section_footer(f, se);
+    if (vmdesc) {
+        json_writer_end_object(vmdesc);
+    }
+    return 0;
+}
 /**
  * qemu_savevm_command_send: Send a 'QEMU_VM_COMMAND' type element with the
  *                           command and associated data.
@@ -1374,31 +1400,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
     json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
     json_writer_start_array(vmdesc, "devices");
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-
-        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
-            continue;
-        }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            trace_savevm_section_skip(se->idstr, se->section_id);
-            continue;
-        }
-
-        trace_savevm_section_start(se->idstr, se->section_id);
-
-        json_writer_start_object(vmdesc, NULL);
-        json_writer_str(vmdesc, "name", se->idstr);
-        json_writer_int64(vmdesc, "instance_id", se->instance_id);
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
         ret = vmstate_save(f, se, vmdesc);
         if (ret) {
             qemu_file_set_error(f, ret);
             return ret;
         }
-        trace_savevm_section_end(se->idstr, se->section_id, 0);
-        save_section_footer(f, se);
-
-        json_writer_end_object(vmdesc);
     }
 
     if (inactivate_disks) {
@@ -1594,21 +1600,10 @@ int qemu_save_device_state(QEMUFile *f)
         if (se->is_ram) {
             continue;
         }
-        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
-            continue;
-        }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            continue;
-        }
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
-
         ret = vmstate_save(f, se, NULL);
         if (ret) {
             return ret;
         }
-
-        save_section_footer(f, se);
     }
 
     qemu_put_byte(f, QEMU_VM_EOF);
-- 
2.39.0


